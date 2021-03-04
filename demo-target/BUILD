load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library", "swift_test")

swift_library(
    name = "DemoTarget",
    srcs = glob(["Sources/*.swift"]),
    module_name = "DemoTarget",
    visibility = ["//visibility:public"]
)

swift_test(
    name = "DemoTargetTests",
    srcs = glob(["Tests/*.swift"]),
    deps = [":DemoTarget"]
)

"""
[CW] 3/4/21 - Temporary fix to generate valid Tulsi project
load("@build_bazel_rules_apple//apple:macos.bzl", "macos_unit_test")

swift_library(
    name = "DemoTargetTestsLibrary",
    srcs = glob(["Tests/*.swift"]),
    deps = [":DemoTarget"],
    module_name = "DemoTargetTestsLibrary",
    visibility = ["//visibility:private"],
)

macos_unit_test(
    name = "DemoTargetTests",
    deps = [":DemoTargetTestsLibrary"],
    minimum_os_version = "10.15",
    visibility = ["//visibility:public"]
)
"""
