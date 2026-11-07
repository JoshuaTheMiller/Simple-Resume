# Changelog

All notable changes to this theme are recorded here. The format follows
[Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and the theme uses
[Semantic Versioning](https://semver.org/).

## [Unreleased]

### Changed

- **Breaking:** requires Jekyll 4.3 or later. The classic GitHub Pages build runs Jekyll 3, so sites must build with GitHub Actions (see the README).
- **Breaking:** a heading hierarchy: your name is the `h1`, section titles (`.experience-block`) are `h2`, entry titles (`.experience-entry`) are `h3`. Sizes are unchanged, but your own CSS that targets the old `h1`s needs updating. The under-construction banner is a `<p role="status">`.
- **Breaking:** title, description, canonical, Open Graph and Twitter tags come from `jekyll-seo-tag` (a new dependency). The description is read from `description` only; rename `site-description`. The preview image comes from `image` (front matter or config) rather than the profile photo. A `title` in `index.md` now shows up in the preview title, so remove it.
- **Breaking:** dark mode is on by default and follows the reader's system setting. Set `dark-mode: off` to keep the light theme only.
- Stylesheets compile with Dart Sass and load their partials with `@use`.
- The dev preview and CI run on Ruby 3.4.

## [1.0.0] - 2026-11-06

### Changed

- The gemspec allows any Jekyll 3.x from 3.8 on, so gem users get the 3.10 that GitHub Pages runs.
- Line endings are normalized to LF.
- The footer year is written at build time instead of showing 0000 until JavaScript runs.
- The footer credit links to joshuamiller.net.
- Raleway is self-hosted (variable font, Latin and Latin Extended) instead of loaded from Google Fonts. Headings now use Raleway's real bold, so they look heavier than the synthesized bold before. Text shows in a fallback font until Raleway loads.
- Links inside bullet points are underlined, so they don't rely on color alone.
- Print: entries no longer split across pages, section headings aren't stranded at a page's foot, the background pattern and under-construction banner don't print, and pages get a half-inch margin.
- `compress.html` is updated to 3.2.0, so a page can opt out with `compress_html: false`.

### Added

- `docker compose up` live preview and a refreshed dev container.
- A CI build on every pull request using the GitHub Pages gems, with html-proofer checks of links, scripts, image alt text and the favicon.
- A README covering the data files and settings.
- `<html lang>`, from `site.lang` (default `en`).
- An employer with no `end` date is treated as a current role, like `"Present"`.
- A visible outline on links and buttons focused from the keyboard.
- Open Graph and Twitter card tags, so shared links unfurl with the title, description and photo. The canonical link and image URLs need `site.url`, which GitHub Pages sets.
- schema.org `Person` JSON-LD built from `personalInfo.json` and the current role in `employment.json`.
- Dark mode, opt-in: `dark-mode: auto` in `_config.yml` follows the reader's system setting. Off unless set.
- `profileImageAlt` and `imageAlt` (employers and projects) set image alt text; otherwise it defaults to the person's, employer's or project's name.
- A `favicon` setting, and an explicit icon link, so sites under a baseurl show their icon.
- A dark version of the background pattern for dark mode.
- In print, a line listing the icon links' names and addresses (LinkedIn and so on), which were hidden on paper.
- `description` in `_config.yml` (or a page's front matter) as the standard way to set the description. `site-description` still works and takes precedence over `description`.

### Fixed

- Images, scripts, fonts and styles resolve against `baseurl`, so the theme works on project pages (`user.github.io/repo`).
- Project images were never passed to their template, so they couldn't show.
- `image-rendering: crisp-edges` on every image made the photo and logos jagged; it's removed, along with its old Firefox, Opera and IE prefixes.
- The meta description was always empty (`{{ site-description }}` is not a variable).
- A site with no `personalLinks` got a stray `</p></div>` that closed the description early.
- Current roles sorted first only because `"Present"` sorts after digits; they are now placed first on purpose.
- Links that open a new tab carry `rel="noopener"`.
- The print button has an accessible name; it was announced only as "button".

### Removed

- The `X-UA-Compatible` meta tag, which only old Internet Explorer read.

## [0.1.0] - 2020-11-28

The theme as it stood before this changelog began.

[Unreleased]: https://github.com/JoshuaTheMiller/Simple-Resume/compare/v1.0.0...HEAD
[1.0.0]: https://github.com/JoshuaTheMiller/Simple-Resume/compare/v0.1.0...v1.0.0
[0.1.0]: https://github.com/JoshuaTheMiller/Simple-Resume/releases/tag/v0.1.0
