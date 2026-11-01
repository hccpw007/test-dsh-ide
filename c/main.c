/**
 * @file main.c
 * @brief C 示例入口：演示头文件拆分与 snprintf 的边界检查。
 */
#include <stdio.h>

#include "greeting.h"

int build_greeting(const char *name, char *buffer, int size) {
    // 参数校验放在入口，避免后续拼接过早解引用空指针
    if (name == NULL || buffer == NULL || size <= 0) {
        return -1;
    }
    int written = snprintf(buffer, (size_t)size, "你好，%s！", name);
    // snprintf 返回所需字符数，达到或超过容量说明被截断
    if (written < 0 || written >= size) {
        return -1;
    }
    return 0;
}

int main(void) {
    char buffer[64];

    // 正常路径
    if (build_greeting("世界", buffer, (int)sizeof(buffer)) == 0) {
        printf("%s\n", buffer);
        return 0;
    }
    // 参数或缓冲区异常
    fprintf(stderr, "[c-demo] 问候语生成失败\n");
    return 1;
}
