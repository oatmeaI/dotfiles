const { execSync } = require("child_process");

function shellPromise(cmd, kind) {
  const result = execSync(cmd);
  const parsed = JSON.parse(result);
  const items = parsed.items;
  return items.map((item) => ({ ...item, arg: `${kind}:${item.arg}` }));
}

// TODO - icons
function simpleMapping(query) {
  const kind = query.substring(0, 1);
  const stripped = query.substring(1);
  return {
    title: query,
    match: stripped,
    uid: `${kind}-${stripped}`,
    match: query,
    arg: `${kind}:${stripped}`,
  };
}

function calculate(query) {
  const math = eval(query.split("=")[1]); // TODO - unsafe
  return {
    title: math,
    arg: math,
    uid: `math-${query}-${math}`,
    match: query,
  };
}

function menu() {
  return shellPromise("./menu -cache 2", "menu");
}

function windows() {
  return shellPromise("./get-windows", "window");
}

function apps() {
  const apps = execSync(
    `mdfind "kMDItemContentType == 'com.apple.application-bundle'" -onlyin /Applications`,
    { encoding: "utf8" },
  );
  const appArray = apps.split("\n");
  const runningApps = execSync(
    `ps -xo comm | grep "/Applications" | grep ".app" |
 sed -e s/.app\.\*//g | sed -e s/\.\*\\\\/Applications\\\\///g | sort | uniq`,
    {
      encoding: "utf8",
    },
  ).split("\n");

  return appArray
    .map((app) => ({
      title: app.substring(app.lastIndexOf("/") + 1, app.lastIndexOf(".")),
      arg: `app:${app}`,
    }))
    .filter((item) => !runningApps.includes(item.title));
}

function moom() {
  return [{ title: "Center window", arg: "moom" }];
}

const mappings = {
  "=": calculate,
  ">": simpleMapping,
  "?": simpleMapping,
};

const sources = [moom, windows, menu, apps];

const results = sources.reduce(
  (results, source) => [...results, ...source()],
  [],
);

const query = process.argv[2];

if (query) {
  const operator = mappings[query.substring(0, 1)];
  if (operator) {
    const result = operator(query);
    results.push(result);
  }
}

const filteredResults = !!query
  ? results.filter((item) => {
      return item.match
        ? item.match.toLowerCase().includes(query)
        : item.title.toLowerCase().includes(query);
    })
  : results; // TODO - fuzzy, and sorting

console.log(
  JSON.stringify({
    items: filteredResults.slice(0, Math.min(19, filteredResults.length)),
  }),
);

// console.log(
//   filteredResults
//     .slice(0, Math.min(9, filteredResults.length))
//     .reduce((str, item) => `${str}\n${item.title}`),
// );

// TODO
// - icons
// - faster / caching?
// - get rid of alfred somehow?
// - fuzzy matching & sorting by matches
// - configuration files
// - clean up moom integration
// - multiple character mappings?
// - some way to close / manipulate apps from the panel?
