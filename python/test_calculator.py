"""calculator 模块的单元测试，演示 unittest 的用例组织方式。"""

import unittest

from calculator import DivisionByZeroError, safe_divide, summarize


class SafeDivideTest(unittest.TestCase):
    """safe_divide 的正常与异常行为。"""

    def test_normal_division(self) -> None:
        self.assertAlmostEqual(safe_divide(10, 4), 2.5)

    def test_division_by_zero(self) -> None:
        # 除零必须抛出显式异常，而不是返回 inf
        with self.assertRaises(DivisionByZeroError):
            safe_divide(1, 0)


class SummarizeTest(unittest.TestCase):
    """summarize 的边界行为。"""

    def test_empty_list(self) -> None:
        self.assertEqual(summarize([])["average"], 0.0)

    def test_average(self) -> None:
        self.assertAlmostEqual(summarize([1, 2, 3])["average"], 2.0)


if __name__ == "__main__":
    unittest.main()
