# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- v0.1.4 Add feature that allows for passwordless "log-in". Log-in via email.
- v0.1.4 Add letter_opener for dev testing of sent emails.
- v0.1.4 Add good_job as the job/worker solution.

### Changed

- v0.1.4 Update dependencies (ruby and node/js)
- v0.1.4 Add feature/page object generator
- v0.1.4 Upgrade rails to 7.2 (edge)
- v0.1.4 Pass the base url to the shubox api server to the stimulus uploader controller. ENV -> data attribute -> controller.

## [1.1.3] - 2024-08-15

### Fixed

- v0.1.3 Nav, flashes, image, and general layout all semi-reasonable in how they are displayed
- v0.1.3 Images displayed in a masonry layout (thanks to CSS columns)
- v0.1.3 Images#new correctly displaying via modal upon file upload, and when visited directly

## [1.1.2] - 2024-08-09

### Added

- v0.1.2 Initial scaffolding of image creation functionality
- v0.1.2 Add i18n-tasks gem to keep all locales clean and up to snuff
- v0.1.2 Set up dot-env for good local dev ENV management
- v0.1.2 Add rspec binstub

### Added

- v0.1.1 Set up large number of dependencies, created skeleton models and controllers,
  "visitor" users only for the time being (no log-in via email yet)
- v1.1.0 Generated app
