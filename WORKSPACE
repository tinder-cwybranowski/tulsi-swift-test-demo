load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "build_bazel_rules_apple",
    url = "https://github.com/bazelbuild/rules_apple/archive/fe541dc3d45a4389d8bf973f7a16803429c5e212.zip",
    sha256 = "0b6f91ef55053c8cb7e5e72e38f6681d72da47ed7b34b1383169c55d3491fb22",
    strip_prefix = "rules_apple-fe541dc3d45a4389d8bf973f7a16803429c5e212"
)

load(
    "@build_bazel_rules_apple//apple:repositories.bzl",
    "apple_rules_dependencies",
)

apple_rules_dependencies()

http_archive(
    name = "build_bazel_tulsi",
    urls = ["https://github.com/bazelbuild/tulsi/archive/master.zip"],
    sha256 = "40f612d21a9bd7f19702f2ab711910725d05aeed25544b00969ab78ef597b1b4",
    strip_prefix = "tulsi-master",
    type = "zip"
)

http_archive(
    name = "build_bazel_rules_ios",
    url = "https://github.com/bazel-ios/rules_ios/archive/641996ada6a7fbe71a2c9ce36891bdbc32591141.zip",
    sha256 = "51af10bdd1d304fe911a337369043b3e5cb852206cef5daa41abe2e5798a3994",
    strip_prefix = "rules_ios-641996ada6a7fbe71a2c9ce36891bdbc32591141",
    type = "zip"
)

load(
    "@build_bazel_rules_ios//rules:repositories.bzl",
    "rules_ios_dependencies"
)

rules_ios_dependencies()

http_archive(
    name = "build_bazel_rules_swift",
    url = "https://github.com/bazelbuild/rules_swift/archive/1ef4601bacd625d77915758c553dd8b62b09c64c.zip",
    sha256 = "844ebb1f080c7e49a634fba7aa1fe293467d78714ab0f186c861e3b6cd9baa64",
    strip_prefix = "rules_swift-1ef4601bacd625d77915758c553dd8b62b09c64c",
    type = "zip"
)

load(
    "@build_bazel_rules_swift//swift:repositories.bzl",
    "swift_rules_dependencies",
)

swift_rules_dependencies()

load(
    "@build_bazel_apple_support//lib:repositories.bzl",
    "apple_support_dependencies",
)

apple_support_dependencies()

load(
    "@build_bazel_rules_swift//swift:extras.bzl",
    "swift_rules_extra_dependencies",
)

swift_rules_extra_dependencies()
