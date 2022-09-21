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

const choose = (items) => call(`echo "${items.join("\n")}" | choose -i`);

async function main() {
  // TODO - is there any way to make tab cycle? - possibly compile choose on my own
  const letters = [
    "jj",
    "kk",
    "ll",
    "ff",
    "dd",
    "ss",
    "jf",
    "kd",
    "ls",
    "jk",
    "fd",
    "fj",
    "dk",
    "sl",
    "kj",
    "df",
  ];

  const windows = (await yabai("query", "windows", "", { json: true }))
    .filter((window) => window.subrole === "AXStandardWindow")
    .sort((a, b) => a.id - b.id);
  const windowKeys = windows.map(
    (w, i) => `${letters[i]} -> ${w.app}: ${w.title}`
  );
  console.log(windows);

  choose(windowKeys).then((id) => yabai("window", "focus", windows[id].id));
  //run("skhd -t f");
  //run("skhd -k left");
}

main();
