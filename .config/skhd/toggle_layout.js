const { exec } = require("child_process");

const run = (cmd) =>
  new Promise((resolve, reject) =>
    exec(cmd, (err, stdout) => {
      if (err) {
        console.error(err);
        reject(err);
        return;
      }
      resolve(stdout);
    })
  );

async function call(cmd, opts = { json: false }) {
  console.log("Running -> ", cmd);
  const res = await run(cmd);
  return opts.json ? JSON.parse(res) : res;
}

const yabai = (action, namespace, argument, opts) =>
  call(`yabai -m ${action} --${namespace} ${argument}`, opts);

const sketchybar = (action, namespace, argument, opts) =>
  call(`sketchybar --${action} ${namespace} ${argument}`, opts);

const hammerspoon = (action, argument, opts) =>
  call(`hs -c "${action}(${argument})"`, opts);

async function main() {
  const layouts = {
    float: "bsp",
    bsp: "float",
  };

  const space = await yabai("query", "spaces", "--space", { json: true });
  const layout = space.type === "float" ? "bsp" : "float";

  await yabai("space", "layout", layout);
  await sketchybar("set", "yabai_mode", `label="${layout}"`);
  await hammerspoon("skhd_help.setBspActive", layout === "float" ? 0 : 1);

  process.exit(0);
}

main();
