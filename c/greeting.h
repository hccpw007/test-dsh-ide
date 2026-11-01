/**
 * @file greeting.h
 * @brief 问候语接口，演示头文件的 Doxygen 注释与 include guard。
 */
#ifndef GREETING_H
#define GREETING_H

/**
 * @brief 生成问候语。
 * @param name 被问候者名称，不能为 NULL
 * @param buffer 输出缓冲区
 * @param size 缓冲区容量
 * @return 成功返回 0；参数非法或缓冲区不足返回 -1
 */
int build_greeting(const char *name, char *buffer, int size);

#endif /* GREETING_H */
