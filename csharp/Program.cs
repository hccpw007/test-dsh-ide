/// <summary>
/// C# 示例入口：演示 XML 文档注释与异常处理。
/// </summary>
public static class Program
{
    /// <summary>
    /// 安全除法。
    /// </summary>
    /// <param name="dividend">被除数</param>
    /// <param name="divisor">除数</param>
    /// <returns>两数之商</returns>
    /// <exception cref="DivideByZeroException">除数为零时抛出</exception>
    public static double Divide(double dividend, double divisor)
    {
        // 浮点除零会得到 Infinity，这里显式拒绝
        if (divisor == 0)
        {
            throw new DivideByZeroException("除数为零");
        }
        return dividend / divisor;
    }

    public static void Main()
    {
        Console.WriteLine($"10 / 4 = {Divide(10, 4):F2}");

        try
        {
            Divide(1, 0);
        }
        catch (DivideByZeroException e) // 预期内的除零错误
        {
            Console.Error.WriteLine($"[csharp-demo] 捕获异常: {e.Message}");
        }
    }
}
