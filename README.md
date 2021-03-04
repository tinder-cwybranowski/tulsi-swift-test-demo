# Tulsi swift_test Demo
This project demonstrates issues that can hopefully be addressed in Tulsi:
- Missing `swift_test` support
- Invalid `.tulsigen` configuration file generation
- Missing source file paths in generated `.tulsigen` file

`DemoProject.tulsiproj` and `DemoProject.tulsigen` artifacts have been committed to the repository to provide a baseline state from which to observe the file generation-related issues.

This project was created to add context to the [bazelbuild/tulsi](https://github.com/bazelbuild/tulsi) Issue opened [here](https://github.com/bazelbuild/tulsi/issues/224).

---

## Setup
The `Makefile` contains a few commands to build and test targets, and generate a Tulsi project.

### Build
Execute the following to build both demo targets:
```
make build
```

### Test
Execute the following to run demo target tests:
```
make test
```

### Generate Project
Execute the following to generate a Tulsi project using the demo test target:
```
make tulsiproj
```

### Open Project
Execute the following to open the generated Tulsi project:
```
make tulsiproj_open
```

---

## Issues

### Invalid Tulsi Config File
Using `make tulsiproj`, we observe that Tulsi produces an invalid `.tulsigen` configuration file for the given target. Here is the warning we receive:
```
Failed to read the given generator config: Config file at /tulsi-swift-test-demo/demo-target/DemoProject.tulsiproj/Configs/DemoProject.tulsigen is invalid: Invalid additional file path: //demo-target/BUILD
```

In order to fix this, we have to remove the `//` prefix from `"//demo-target/BUILD"` within `additionalFilePaths`:
**Before:**
```
"additionalFilePaths" : [
  "//demo-target/BUILD"
],
```

**After:**
```
"additionalFilePaths" : [
  "demo-target/BUILD"
],
```

**Note:** Repeated invocations of `make tulsiproj` reset this fix.

### Missing Source in Tulsi Project
Using `make tulsiproj`, we observe that Tulsi produces a `.tulsigen` configuration file that is missing paths to target source files:
```
"sourceFilters" : [
  "./..."
]
```

In order to fix this, we have to manually add paths to source file directories:
```
"sourceFilters" : [
  "demo-target",
  "demo-target/Sources",
  "demo-target/Tests"
]
```

**Note:** Repeated invocations of `make tulsiproj` reset this fix.

### Missing swift_test support
Although Tulsi appears to handle [swift_library](https://github.com/bazelbuild/rules_swift/blob/9d472c1a0124a2f06ee234ce64fa174cba0637c9/swift/swift.bzl#L80) targets correctly, it fails to generate a Tulsi project for [swift_test](https://github.com/bazelbuild/rules_swift/blob/9d472c1a0124a2f06ee234ce64fa174cba0637c9/swift/swift.bzl#L81) targets. Here is the warning we receive after executing `make tulsiproj_open`:
```
[Error] Generate[FAIL]: 10.6267s Unsupported target type: swift_test (target //demo-target:DemoTargetTests)
Xcode project generation failed
```

In order to fix this temporarily, we have to define new [swift_library](https://github.com/bazelbuild/rules_swift/blob/9d472c1a0124a2f06ee234ce64fa174cba0637c9/swift/swift.bzl#L80) and [macos_unit_test](https://github.com/bazelbuild/rules_apple/blob/5819dc78d9233dce35d546f7a69690f075bbf1e5/apple/macos.bzl#L310) libraries for this test target:
```
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")
load("@build_bazel_rules_apple//apple:macos.bzl", "macos_unit_test")

swift_library(
    name = "DemoTargetTestsLibrary",
    srcs = glob(["Tests/*.swift"]),
    deps = [":DemoTarget"]
    module_name = "DemoTargetTestsLibrary",
    visibility = ["//visibility:private"],
)

macos_unit_test(
    name = "DemoTargetTests",
    deps = [":DemoTargetTestsLibrary"],
    minimum_os_version = "10.15",
    visibility = ["//visibility:public"]
)
```
