.PHONY: build
build:
	bazelisk build \
			//demo-target:DemoTarget \
			//demo-target:DemoTargetTests

.PHONY: test
test:
	bazelisk test \
			//demo-target:DemoTargetTests \
			--test_output=all \
			--macos_minimum_os=10.15

.PHONY: tulsiproj
tulsiproj:
	WORKSPACE_PATH=$$(bazelisk info workspace) ;\
	BAZEL_PATH=/usr/local/bin/bazel ;\
	bazelisk run @build_bazel_tulsi//:tulsi -- -- \
			--create-tulsiproj DemoProject \
			--outputfolder $$WORKSPACE_PATH/demo-target \
			--bazel $$BAZEL_PATH \
			--workspaceroot $$WORKSPACE_PATH \
			--target //demo-target:DemoTarget \
			--target //demo-target:DemoTargetTests ;\

.PHONY: tulsiproj_open
tulsiproj_open:
	PROJECT_PATH=$$(bazelisk info workspace)/demo-target ;\
	bazelisk run @build_bazel_tulsi//:tulsi -- -- \
			--genconfig $$PROJECT_PATH/DemoProject.tulsiproj:DemoProject ;\
