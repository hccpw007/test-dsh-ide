//! Rust 示例：演示模块级文档、枚举错误与 Result 处理。

/// 计算过程中的可预期错误
#[derive(Debug)]
enum CalcError {
    /// 除数为零
    DivideByZero,
}

/// 安全除法，除数为零时返回错误而不是 panic。
///
/// # 参数
/// - `dividend`: 被除数
/// - `divisor`: 除数
///
/// # 返回
/// 成功返回商，除数为零返回 [`CalcError::DivideByZero`]
fn divide(dividend: f64, divisor: f64) -> Result<f64, CalcError> {
    // 浮点除零会得到 inf/nan，这里显式拒绝
    if divisor == 0.0 {
        return Err(CalcError::DivideByZero);
    }
    Ok(dividend / divisor)
}

fn main() {
    // 正常路径
    match divide(10.0, 2.0) {
        Ok(value) => println!("10 / 2 = {value}"),
        Err(e) => eprintln!("[rust-demo] 除法失败: {e:?}"),
    }

    // 错误路径：验证错误分支被正确处理
    match divide(1.0, 0.0) {
        Ok(value) => println!("1 / 0 = {value}"),
        Err(e) => eprintln!("[rust-demo] 除法失败: {e:?}"), // 预期内的除零
    }
}
