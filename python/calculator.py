"""计算器示例：演示 Python 的模块、类型标注与自定义异常。

供本测试仓库验证 .py 文件的 git 追踪与差异展示。
"""


class DivisionByZeroError(ValueError):
    """除数为零时抛出，避免调用方拿到未定义的 inf/nan。"""


def safe_divide(dividend: float, divisor: float) -> float:
    """执行除法，除数为零时抛出可预期异常。

    Args:
        dividend: 被除数
        divisor: 除数

    Returns:
        两数之商

    Raises:
        DivisionByZeroError: 除数为零时抛出
    """
    # 浮点除零会得到 inf，这里显式拒绝，交由调用方处理
    if divisor == 0:
        raise DivisionByZeroError("除数不能为零")
    return dividend / divisor


def summarize(numbers: list[int]) -> dict[str, float]:
    """汇总数值列表的个数、总和与平均值。

    Args:
        numbers: 待汇总的整数列表

    Returns:
        包含 count、total、average 的字典；空列表的平均值记为 0
    """
    # 空列表直接返回零值，调用方无需再做特判
    if not numbers:
        return {"count": 0, "total": 0.0, "average": 0.0}
    total = float(sum(numbers))
    return {"count": len(numbers), "total": total, "average": total / len(numbers)}


if __name__ == "__main__":
    print(summarize([1, 2, 3, 4, 5]))
