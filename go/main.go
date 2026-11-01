// Package main 演示 Go 的包注释、公开函数注释与错误处理。
package main

import (
	"errors"
	"fmt"
)

// ErrDivideByZero 表示除数为零，调用方可用 errors.Is 判断并分支处理。
var ErrDivideByZero = errors.New("除数为零")

// Divide 执行除法，除数为零时返回 ErrDivideByZero 而不是 panic。
func Divide(dividend, divisor float64) (float64, error) {
	if divisor == 0 {
		return 0, ErrDivideByZero
	}
	return dividend / divisor, nil
}

func main() {
	// 正常路径
	value, err := Divide(10, 4)
	if err != nil { // 非预期错误：输出并退出，避免打印无效结果
		fmt.Println("unexpected error:", err)
	} else {
		fmt.Printf("10 / 4 = %.2f\n", value)
	}

	// 错误路径：验证错误可被识别
	if _, err := Divide(1, 0); errors.Is(err, ErrDivideByZero) {
		fmt.Println("捕获到除零错误")
	}
}
