# Simple-Resume

A single-page resume theme for [Jekyll](https://jekyllrb.com/). Everything on the page comes from
three data files, so updating your resume means editing JSON, not HTML. There is a print button
(and a print stylesheet) for when you need it on paper or as a PDF.

See it in use at [joshuamiller.net](https://joshuamiller.net).

## Use it

The theme runs on the classic GitHub Pages build (Jekyll 3.x). In your site's `_config.yml`:

```yaml
plugins:
  - jekyll-remote-theme

# Pin a release so theme changes reach your site only when you choose.
remote_theme: JoshuaTheMiller/Simple-Resume@v1.0.0
```

Add an `index.md` that uses the theme's layout:

```markdown
---
layout: index
title: Resume
---
```

Then add the data files below. Images referenced from the data live in your own repo.

### Site settings (`_config.yml`)

| Key | What it does |
|---|---|
| `title` | The page title. |
| `description` | The page's meta and social-preview description. |
| `image` | The social-preview image, e.g. `/images/profile.png`. Set it in `index.md`'s front matter or `_config.yml`. |
| `dark-mode` | The page follows the reader's system light or dark setting. Set `off` to always show the light theme. |
| `favicon` | Path to the site icon, `/favicon.ico` by default. |
| `lang` | The page language, `en` by default. |
| `url` | Your site's address, e.g. `https://example.com`. It makes the canonical link and preview image absolute. |
| `in-development` | `true` shows an "under construction" banner. |

### `_data/personalInfo.json`

| Field | What it does |
|---|---|
| `firstName`, `lastName` | Your name, the page heading. |
| `profileImagePath` | Your photo. `profileImageAlt` sets its alt text (default: your name). |
| `description` | A short summary under your name. |
| `personalLinks[]` | Text links under the summary: `displayText`, `url`, `targetType` (`_blank` or `_top`). |
| `iconLinks[]` | Icon links under the photo: `displayText`, `displayImagePath`, `url`. |

### `_data/projects.json`

`projects[]`, sorted by title. Each has `title`, `url`, `short_description`, optional `image`
(and `imageAlt`, default: the title),
optional `notes[]` (each `{ "content": "…" }`, HTML allowed) and optional `tagGroups[]`.

### `_data/employment.json`

`employers[]`, newest first. Each has `title` (the employer), `position`, `url`, `image` (with optional
`imageAlt`, default: the employer's name),
`location`, `short_description`, `dateRange` with `start` and `end` (`YYYY-MM-DD`, or `"Present"`
for a current role), and optional `notes[]` and `tagGroups[]`.

### Tag groups

Used by projects and employers: `tagGroups[]`, each with a `name` (shown as a label, such as
"Technologies") and `tags[]`, each with `display` and an optional `url`.

## Develop it

This repo is both the theme and a demo site with sample data. To preview it with live reload,
with Docker running:

```sh
docker compose up
```

Then open <http://localhost:4000>. Changes to layouts, includes, styles and data rebuild the site
and reload the page.

A dev container is also included (`.devcontainer/`) for VS Code or Codespaces. Inside it, run
`bundle exec jekyll serve --config _config.yml,_config.demo.yml --livereload --force_polling`.

Every pull request is built with the same gems GitHub Pages uses, and the generated HTML is checked
with [html-proofer](https://github.com/gjtorikian/html-proofer).

## Changes

See [CHANGELOG.md](CHANGELOG.md).

## License

[MIT](LICENSE)
