# Tests

The syntax definition is tested with Sublime Text's built-in syntax test runner.

## Run syntax tests

1. Open `tests/syntax_test_asl.asl` in Sublime Text 4.
2. Run **Tools > Build** (or press `Ctrl+B`).
3. The output panel reports either `Success: N assertions ... passed` or the failing line and expected scope.

The test file checks comments, strings and escapes, numbers, case-insensitive keywords, declaration names, variables, predefined names, flags, resource macros, operators, and preprocessor directives.

## Fixtures

- `fixtures/example.asl` is a small SSDT-style sample for visual inspection.
- `fixtures/include.asi` is used by the `#include` example.

Open a fixture and use **Tools > Developer > Show Scope Name** (`Ctrl+Shift+Alt+P`) to inspect scopes under the cursor.

The syntax definition requires Sublime Text 4 (build 4000 or newer).
