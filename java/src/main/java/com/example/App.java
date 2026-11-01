package com.example;

/** 入口示例：演示 Java 包结构、Javadoc 与受检溢出的处理。 */
public final class App {

    private App() {
        // 工具类禁止实例化
    }

    /**
     * 计算两个整数的和。
     *
     * @param left  左操作数
     * @param right 右操作数
     * @return 两数之和
     * @throws ArithmeticException 结果超出 int 表示范围时抛出
     */
    public static int add(int left, int right) {
        // 使用精确加法，避免溢出后静默得到负数
        return Math.addExact(left, right);
    }

    public static void main(String[] args) {
        // 正常路径
        System.out.println("1 + 2 = " + add(1, 2));

        // 溢出路径：验证异常能被捕获并记录
        try {
            System.out.println(add(Integer.MAX_VALUE, 1));
        } catch (ArithmeticException e) { // 预期内的溢出
            System.err.println("[java-demo] 捕获异常: " + e.getMessage());
        }
    }
}
