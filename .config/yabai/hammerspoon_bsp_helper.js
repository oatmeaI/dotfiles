const { exec } = require("child_process");

exec("yabai -m query --spaces --space | jq .type", async (err, stdout) => {
  const curr = stdout.substring(1, stdout.length - 2); // Trim stuff off string returned from stdout
  const cmd = `hs -c "skhd_help.setBspActive(${curr === "float" || curr === "stack" ? 0 : 1})"`;
  exec(cmd);
  process.exit(0);
});
