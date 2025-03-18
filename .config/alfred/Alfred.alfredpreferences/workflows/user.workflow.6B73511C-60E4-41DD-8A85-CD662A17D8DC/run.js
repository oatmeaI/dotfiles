const { execSync } = require("child_process");

const arg = process.argv[2].split(":");
const kind = arg[0];
const data = arg[1];

const mappings = {
  window: () => execSync(`./raise-window ${data.replace(",", " ")}`),
  menu: () => execSync(`./menu -click ${data}`),
  ">": () => {
    const result = execSync(data, { encoding: "utf8" });
    console.log(result);
  },
  moom: () => {
    const command = `tell application "System Events" to keystroke "," using option down`;
    execSync(`osascript -e '${command}'`);
  },
  "?": () => execSync(`open "http://www.google.com/search?q=${data}"`), // TODO - configure search endpoint
  app: () => execSync(`open "${data}"`),
};

mappings[kind]();
