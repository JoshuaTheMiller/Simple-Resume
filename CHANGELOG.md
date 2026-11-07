# Changelog

All notable changes to this theme are recorded here. The format follows
[Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and the theme uses
[Semantic Versioning](https://semver.org/).

## [Unreleased]

### Changed

- The gemspec allows any Jekyll 3.x from 3.8 on, so gem users get the 3.10 that GitHub Pages runs.
- Line endings are normalized to LF.
- The footer year is written at build time instead of showing 0000 until JavaScript runs.
- The footer credit links to joshuamiller.net.
- `compress.html` is updated to 3.2.0, so a page can opt out with `compress_html: false`.

### Added

- `docker compose up` live preview and a refreshed dev container.
- A CI build on every pull request using the GitHub Pages gems, with html-proofer checks.
- A README covering the data files and settings.
- `<html lang>`, from `site.lang` (default `en`).
- An employer with no `end` date is treated as a current role, like `"Present"`.

### Fixed

- A site with no `personalLinks` got a stray `</p></div>` that closed the description early.
- Current roles sorted first only because `"Present"` sorts after digits; they are now placed first on purpose.
- Links that open a new tab carry `rel="noopener"`.

### Removed

- The `X-UA-Compatible` meta tag, which only old Internet Explorer read.

## [0.1.0] - 2020-11-28

The theme as it stood before this changelog began.

[Unreleased]: https://github.com/JoshuaTheMiller/Simple-Resume/compare/v0.1.0...HEAD
[0.1.0]: https://github.com/JoshuaTheMiller/Simple-Resume/releases/tag/v0.1.0
