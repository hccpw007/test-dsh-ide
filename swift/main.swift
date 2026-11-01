// Swift 示例：演示可选类型、自定义错误与 doc comment。

/// 可预期的计算错误
enum CalcError: Error {
    /// 除数为零
    case divideByZero
}

/// 安全除法，除数为零时抛出错误。
/// - Parameters:
///   - dividend: 被除数
///   - divisor: 除数
/// - Returns: 两数之商
/// - Throws: 除数为零时抛出 `CalcError.divideByZero`
func divide(_ dividend: Double, by divisor: Double) throws -> Double {
    // 浮点除零会得到 inf，这里显式拒绝
    guard divisor != 0 else {
        throw CalcError.divideByZero
    }
    return dividend / divisor
}

// 正常路径
do {
    print("10 / 4 =", try divide(10, by: 4))
} catch { // 正常路径不应进入此分支
    print("[swift-demo] 非预期错误:", error)
}

// 错误路径：验证错误分支被正确捕获
do {
    _ = try divide(1, by: 0)
} catch { // 预期内的除零错误
    print("[swift-demo] 捕获错误:", error)
}
