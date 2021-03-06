**Currently archived until I get enough time to work on this.**

# RPM

**R**oblox **P**ackage **M**anager (RPM) is a tool, similar to [NPM](https://npmjs.com/?utm_source=roblox-package-manager), is a tool for managing Roblox and [Rojo](https://rojo.space/?utm_source=roblox-package-manager) packages.<br/>
It features a config _similar_ to npm's `package.json`, called `rpm.json`. An example `rpm.json` can be found [here](/rpm.json).<br/>

> #### ℹ️ This project is a work-in-progress!
>
> Not all features described here will be readily available, and this project is very much a **work in progress**.
>
> Furthermore, this Readme is nowhere near completed.

### Mini-Roadmap

- [ ] Minify Packages into one single script
- [ ] Make publicly available Package Server
- [ ] Roblox Plugin ([#1](https://github.com/MokiyCodes/RPM/issues/1))
- [ ] CLI (Issue to-be-made)

### VSCode Autocomplete

To allow autocompletion of `rpm.json`s, just add the following to your `settings.json`:

```json
  "json.schemas": [
    {
      "fileMatch": ["rpm.json"],
      "url": "https://mokiycodes.github.io/RPM/schema/rpm.schema.json"
    }
  ]
```
