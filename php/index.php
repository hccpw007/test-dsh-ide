<?php
/**
 * PHP 示例：演示严格类型、函数注释与异常处理。
 */

declare(strict_types=1);

/**
 * 生成问候语。
 *
 * @param string $name 被问候者名称
 * @return string 问候语文本
 */
function build_greeting(string $name): string
{
    return "你好，{$name}！";
}

/**
 * 安全除法。
 *
 * @param float $dividend 被除数
 * @param float $divisor 除数
 * @return float 两数之商
 * @throws DivisionByZeroError 除数为零时抛出
 */
function safe_divide(float $dividend, float $divisor): float
{
    // 除数为零时显式抛出，避免返回 Inf 影响后续计算
    if ($divisor == 0.0) {
        throw new DivisionByZeroError('除数为零');
    }

    return $dividend / $divisor;
}

echo build_greeting('世界'), PHP_EOL;

try {
    echo safe_divide(10, 4), PHP_EOL;
} catch (DivisionByZeroError $e) { // 预期内的除零错误
    fwrite(STDERR, "[php-demo] 捕获异常: {$e->getMessage()}" . PHP_EOL);
}
