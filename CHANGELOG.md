## [0.0.1] - 2025-08-14

### Added

- Initial release of `system_info_toolkit` package.
- Added method to retrieve **screen brightness**:
  - `SystemInfoToolkit.getBrightness()`
  - Returns a `double` value between 0.0 and 1.0.
- Added method to retrieve **battery level**:
  - `SystemInfoToolkit.getBatteryLevel()`
  - Returns an `int` value between 0 and 100.

### Fixed

- Ensured proper type handling for both integer and double brightness values.
- Clamped brightness and battery values to valid ranges to prevent unexpected results.

### Notes

- Methods use platform channels (`MethodChannel`) to fetch native system information.
