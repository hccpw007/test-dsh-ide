/// Dart 示例：演示空安全、库声明与异常处理。
library;

/// 安全除法，除数为零时抛出 [FormatException]。
double safeDivide(double dividend, double divisor) {
  // 浮点除零会得到 Infinity，这里显式拒绝
  if (divisor == 0) {
    throw const FormatException('除数为零');
  }
  return dividend / divisor;
}

void main() {
  print('10 / 4 = ${safeDivide(10, 4)}');

  // 错误路径：验证异常被正确捕获
  try {
    safeDivide(1, 0);
  } on FormatException catch (e) { // 预期内的除零错误
    print('[dart-demo] 捕获异常: ${e.message}');
  }
}
