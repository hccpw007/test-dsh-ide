# 一键校验示例：驱动各语言示例的运行与检查
# 供测试仓库演示 Makefile 的 git 追踪

.PHONY: all js python c cpp go rust clean

all: js python c cpp

# JavaScript 示例
js:
	@node src/javascript/counter.js >/dev/null && echo "[make] JS 示例通过"

# Python 单元测试
python:
	@cd python && PYTHONDONTWRITEBYTECODE=1 python3 -m unittest -q test_calculator.py

# C 示例：编译产物放临时目录，避免污染工作区
c:
	@mkdir -p /tmp/test-dsh-ide-build
	@clang -Wall -Wextra -o /tmp/test-dsh-ide-build/c-demo c/main.c && /tmp/test-dsh-ide-build/c-demo

# C++ 示例
cpp:
	@mkdir -p /tmp/test-dsh-ide-build
	@g++ -std=c++17 -Wall -Wextra -o /tmp/test-dsh-ide-build/cpp-demo cpp/main.cpp && /tmp/test-dsh-ide-build/cpp-demo

# Go 示例
go:
	@cd go && go run ./...

# Rust 示例
rust:
	@cd rust && CARGO_TARGET_DIR=/tmp/test-dsh-ide-build/rust cargo run --quiet

clean:
	@rm -rf /tmp/test-dsh-ide-build
