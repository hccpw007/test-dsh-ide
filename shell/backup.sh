#!/usr/bin/env bash
# 目录备份示例：演示严格模式、参数校验与原子写入。

# -e 任一命令失败即退出，-u 使用未定义变量即报错，-o pipefail 避免管道错误被吞掉
set -euo pipefail

# 用法：./backup.sh <源目录> <归档文件>
if [ "$#" -ne 2 ]; then
  echo "用法: $0 <源目录> <归档文件>" >&2
  exit 2
fi

readonly SOURCE_DIR="$1"
readonly ARCHIVE_PATH="$2"

# 源目录必须存在，否则 tar 会产生空归档而不报错
if [ ! -d "$SOURCE_DIR" ]; then
  echo "[backup] 源目录不存在: $SOURCE_DIR" >&2
  exit 1
fi

mkdir -p "$(dirname "$ARCHIVE_PATH")"

# 先写临时文件再改名，避免中断时留下损坏的归档
tar -czf "${ARCHIVE_PATH}.tmp" -C "$(dirname "$SOURCE_DIR")" "$(basename "$SOURCE_DIR")"
mv "${ARCHIVE_PATH}.tmp" "$ARCHIVE_PATH"

echo "[backup] 完成: $ARCHIVE_PATH"
