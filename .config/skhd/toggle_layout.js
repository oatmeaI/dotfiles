const { exec } = require("child_process");
const layouts = {
  float: "bsp",
  bsp: "float",
};
exec("yabai -m query --spaces --space | jq .type", (err, stdout) => {
  const curr = stdout.substring(1, stdout.length - 2); // Trim stuff off string returned from stdout
  const layout = layouts[curr];
  exec(`yabai -m space --layout ${layout}`);
});
