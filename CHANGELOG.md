# Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased] - dd-mm-yyyy
Here we write the updates of future releases.

2.0.xx belongs to UI render and state logics of Kanban feature

### Added

### Changed

### Deprecated

### Removed

### Fixed

### Security





## [2.0.1] - 15-05-2024

### Added
- New data model to represent the finalised structure of kanban flow
- Finalised design of Kanban Flow

### Changed
- logics related to the final kanban flow



## [2.0.0] - 15-05-2024

### Added
- 3 reference folders for logics and UI representing Kanban plugin, Drag and Drop list plugin and Flutter's draggable widget respectively
- Hydrated bloc logics for persistent storage of values

### Changed
- name of the project from 'kanan_board' to 'kanban' in order to resolve the conflicts with the kanban plugin





## [1.0.2] - 12-05-2024

### Added
- Dummy cubit for testing persistent storage with Hydrated bloc
- User models and images
- Kanban logics like adding task, updating status and recording time



## [1.0.1] - 12-05-2024

### Added
- Constants folder to maintain all the constant values like strings images and booleans
- Themes folder to maintain the themes
- Cubits folder to store all the general cubits
- Theme cubit to maintain the theme of the app
- Router folder to store all the routes
- Utils folder to maintain all the required utilities like app texts and custom print function

### Changed
- Initial routing to splash screen using named routes



## [1.0.0] - 12-05-2024

### Added
- Changelog file
- Lint rules
- Presentation folder to maintain screens and other UI elements
- App Logo

### Changed
- Changed pubspec file by deleting the commented lines
- Changed the app label in manifest file