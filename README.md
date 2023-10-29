<h3 align="center">ASCICL v4</h3>

ASCICL is an internal UI framework for use at the asyncollective. It ensures consistency across asyncollective websites and provides a good specification for our design sensibilities. The current version is based on Bootstrap v4.6.2.

## Original README (from Bootstrap 4.6.2)

<p align="center">
  Sleek, intuitive, and powerful front-end framework for faster and easier web development.
  <br>
  <a href="https://getbootstrap.com/docs/4.6/"><strong>Explore Bootstrap docs »</strong></a>
  <br>
  <br>
  <a href="https://github.com/twbs/bootstrap/issues/new?template=bug_report.md">Report bug</a>
  ·
  <a href="https://github.com/twbs/bootstrap/issues/new?template=feature_request.md">Request feature</a>
  ·
  <a href="https://themes.getbootstrap.com/">Themes</a>
  ·
  <a href="https://blog.getbootstrap.com/">Blog</a>
</p>


## Table of contents

- [Quick start](#quick-start)
- [Status](#status)
- [What's included](#whats-included)
- [Bugs and feature requests](#bugs-and-feature-requests)
- [Documentation](#documentation)
- [Contributing](#contributing)
- [Community](#community)
- [Versioning](#versioning)
- [Creators](#creators)
- [Thanks](#thanks)
- [Copyright and license](#copyright-and-license)


## Quick start

Several quick start options are available:

- [Download the latest release.](https://github.com/twbs/bootstrap/archive/v4.6.2.zip)
- Clone the repo: `git clone https://github.com/twbs/bootstrap.git`
- Install with [npm](https://www.npmjs.com/): `npm install bootstrap`
- Install with [yarn](https://yarnpkg.com/): `yarn add bootstrap@4.6.2`
- Install with [Composer](https://getcomposer.org/): `composer require twbs/bootstrap:4.6.2`
- Install with [NuGet](https://www.nuget.org/): CSS: `Install-Package bootstrap` Sass: `Install-Package bootstrap.sass`

Read the [Getting started page](https://getbootstrap.com/docs/4.6/getting-started/introduction/) for information on the framework contents, templates and examples, and more.

## What's included

Within the download you'll find the following directories and files, logically grouping common assets and providing both compiled and minified variations.

<details><summary>Download contents</summary>

```text
ascicl/
└── dist/
    ├── css/
    │   ├── ascicl-grid.css
    │   ├── ascicl-grid.css.map
    │   ├── ascicl-grid.min.css
    │   ├── ascicl-grid.min.css.map
    │   ├── ascicl-reboot.css
    │   ├── ascicl-reboot.css.map
    │   ├── ascicl-reboot.min.css
    │   ├── ascicl-reboot.min.css.map
    │   ├── ascicl.css
    │   ├── ascicl.css.map
    │   ├── ascicl.min.css
    │   └── ascicl.min.css.map
    └── js/
        ├── ascicl.bundle.js
        ├── ascicl.bundle.js.map
        ├── ascicl.bundle.min.js
        ├── ascicl.bundle.min.js.map
        ├── ascicl.js
        ├── ascicl.js.map
        ├── ascicl.min.js
        └── ascicl.min.js.map
```
</details>

We provide compiled CSS and JS (`ascicl.*`), as well as compiled and minified CSS and JS (`ascicl.min.*`). [Source maps](https://developers.google.com/web/tools/chrome-devtools/javascript/source-maps) (`ascicl.*.map`) are available for use with certain browsers' developer tools. Bundled JS files (`ascicl.bundle.js` and minified `ascicl.bundle.min.js`) include [Popper](https://popper.js.org/), but not [jQuery](https://jquery.com/). (Note: for ASCICL releases, some of these components may not be present)

## Documentation

Bootstrap's documentation, included in this repo in the root directory, is built with [Hugo](https://gohugo.io/) and publicly hosted on GitHub Pages at <https://getbootstrap.com/>. The docs may also be run locally.

Documentation search is powered by [Algolia's DocSearch](https://community.algolia.com/docsearch/). Working on our search? Be sure to set `debug: true` in `site/assets/js/search.js`.

### Running documentation locally

1. Run `npm install` to install the Node.js dependencies, including Hugo (the site builder).
2. Run `npm run test` (or a specific npm script) to rebuild distributed CSS and JavaScript files, as well as our docs assets.
3. Run `npm start` to compile CSS and JavaScript files, generate our docs, and watch for changes.
4. Open `http://localhost:9001/` in your browser, and voilà.

Learn more about using Hugo by reading its [documentation](https://gohugo.io/documentation/).

### Documentation for previous Bootstrap releases

You can find all previous Bootstrap release docs on <https://getbootstrap.com/docs/versions/>.

[Previous releases](https://github.com/twbs/bootstrap/releases) of Bootstrap and their documentation are also available for download.

## Original Creators

**Mark Otto**

- <https://twitter.com/mdo>
- <https://github.com/mdo>

**Jacob Thornton**

- <https://twitter.com/fat>
- <https://github.com/fat>

## Copyright and license

Original code and documentation copyright 2011-2022 the [Bootstrap Authors](https://github.com/twbs/bootstrap/graphs/contributors) and [Twitter, Inc.](https://twitter.com) Code released under the [MIT License](https://github.com/twbs/bootstrap/blob/main/LICENSE). Docs released under [Creative Commons](https://creativecommons.org/licenses/by/3.0/).

ASCICL add-on code copyright 2023 asyncollective, inc. and the ASCICL contributors.