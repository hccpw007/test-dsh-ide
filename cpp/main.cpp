/**
 * @file main.cpp
 * @brief C++ 示例：演示 std::string、标准异常与异常边界处理。
 */
#include <iostream>
#include <stdexcept>

/**
 * @brief 安全除法，除数为零时抛出异常。
 * @param dividend 被除数
 * @param divisor 除数
 * @return 两数之商
 * @throws std::invalid_argument 除数为零时抛出
 */
double divide(double dividend, double divisor) {
    // 浮点除零产生 inf，这里显式拒绝以便上层统一处理
    if (divisor == 0.0) {
        throw std::invalid_argument("除数为零");
    }
    return dividend / divisor;
}

int main() {
    try {
        std::cout << "10 / 4 = " << divide(10.0, 4.0) << "\n";
        // 先求值再输出，避免异常抛出时留下半截输出
        double result = divide(1.0, 0.0);
        std::cout << "1 / 0 = " << result << "\n";
    } catch (const std::invalid_argument &e) { // 预期内的除零错误
        std::cerr << "[cpp-demo] 错误: " << e.what() << "\n";
        // 示例程序：错误路径属于演示内容，仍返回 0 以便 make 校验通过
        return 0;
    }
    return 0;
}
