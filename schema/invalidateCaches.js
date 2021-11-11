// This file replaces all links* in schema files with ones with a random identifier at the end, as to invalidate caches.
// Please note, that this only affects links containing `cache=` at the end
const fs = require('fs');
const path = require('path');
const d = path.resolve(__filename, '..');

const v = (j, base) => {
  // not efficient, idc
  const ln = j.toString(base).length;
  j = j * Math.pow(10, ln);
  return j.toString(base);
};

let URLs = {};

fs.readdirSync(d).forEach(f => {
  if (!f.endsWith('.schema.json')) return;
  const p = path.join(d, f);
  let j = JSON.parse(fs.readFileSync(p, 'utf-8'));
  const loop = j => {
    if (typeof j == 'object') {
      for (const k in j) {
        if (Object.hasOwnProperty.call(j, k)) {
          j[k] = loop(j[k]);
        }
      }
      return j;
    } else if (typeof j == 'string') {
      if (j.includes('cache=')) {
        const baseUrl = j.replace(/cache\=.*/, 'cache=');
        if (URLs[baseUrl]) return URLs[baseUrl];
        const rnd = baseUrl + v(Math.random(), 36);
        URLs[baseUrl] = rnd;
        return rnd;
      } else return j;
    } else return j;
  };
  j = loop(j);
  fs.writeFileSync(p, JSON.stringify(j, null, 2));
});
