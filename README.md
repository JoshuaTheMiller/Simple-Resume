# Simple-Resume

A single-page resume theme for [Jekyll](https://jekyllrb.com/). Everything on the page comes from
three data files, so updating your resume means editing JSON, not HTML. There is a print button
(and a print stylesheet) for when you need it on paper or as a PDF.

See it in use at [joshuamiller.net](https://joshuamiller.net).

## Use it

The theme is a Ruby gem for Jekyll 4.3 or later. GitHub Pages' classic build runs Jekyll 3, so
build the site with GitHub Actions (see below); v1.x is the release line for the classic build.

In your site's `Gemfile`, pin a release so theme changes reach your site only when you choose:

```ruby
source "https://rubygems.org"

gem "jekyll", "~> 4.4"
gem "simple-resume", git: "https://github.com/JoshuaTheMiller/Simple-Resume", tag: "v2.0.0"
```

In `_config.yml`:

```yaml
theme: simple-resume
title: Jane Doe's Resume
description: The online resume of Jane Doe
url: https://example.com
```

Add an `index.md` that uses the theme's layout. Leave out `title` (it would be added to the
preview title); `image` is the picture shown when the link is shared:

```markdown
---
layout: index
image: /images/profile.png
---
```

Then add the data files below. Images referenced from the data live in your own repo.

### Deploy with GitHub Actions

Set the repository's **Settings → Pages → Source** to **GitHub Actions**, and add
`.github/workflows/pages.yml`:

```yaml
name: Pages

on:
  push:
    branches: [main]
  pull_request:
  workflow_dispatch:

permissions:
  contents: read
  pages: write
  id-token: write

concurrency:
  group: pages
  cancel-in-progress: false

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v7
      - uses: ruby/setup-ruby@v1
        with:
          ruby-version: "3.4"
          bundler-cache: true
      - id: pages
        uses: actions/configure-pages@v6
      - run: bundle exec jekyll build --baseurl "${{ steps.pages.outputs.base_path }}"
        env:
          JEKYLL_ENV: production
      - uses: actions/upload-pages-artifact@v5
        if: github.event_name != 'pull_request'

  deploy:
    if: github.event_name != 'pull_request'
    needs: build
    runs-on: ubuntu-latest
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    steps:
      - id: deployment
        uses: actions/deploy-pages@v5
```

Pull requests are built but not deployed. A custom domain is set under Settings → Pages; a `CNAME`
file is not read by an Actions deploy.

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

## Upgrading from v1

1. Replace `remote_theme` and the `jekyll-remote-theme` plugin in `_config.yml` with
   `theme: simple-resume`, add the `Gemfile` above, and run `bundle install` (commit the
   `Gemfile.lock`).
2. Rename `site-description` to `description`, and set `url`.
3. In `index.md`, remove `title` and add `image` (your profile photo) for link previews.
4. Add the Pages workflow and switch Settings → Pages → Source to GitHub Actions.
5. If your own CSS targets the old headings: the name is `h1`, section titles are `h2`, entry
   titles are `h3`.
6. Dark mode is now on by default; add `dark-mode: off` to keep the light theme only.

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

Every pull request builds the demo site and checks the generated HTML with
[html-proofer](https://github.com/gjtorikian/html-proofer).

## Changes

See [CHANGELOG.md](CHANGELOG.md).

## License

[MIT](LICENSE)
