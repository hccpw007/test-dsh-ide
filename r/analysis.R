#' 安全除法
#'
#' @param dividend 被除数
#' @param divisor 除数
#' @return 两数之商；除数为零时停止并报错
safe_divide <- function(dividend, divisor) {
  # 除零在 R 中会产生 Inf，这里显式停止以便定位问题
  if (divisor == 0) {
    stop("除数为零")
  }
  dividend / divisor
}

# 示例数据框：分数按从高到低排序
scores <- data.frame(
  name = c("张三", "李四", "王五"),
  score = c(90, 75, 88)
)
print(scores[order(-scores$score), ])

# 正常路径
print(safe_divide(10, 4))

# 错误路径：用 tryCatch 捕获可预期错误
tryCatch(
  safe_divide(1, 0),
  error = function(e) message("[r-demo] 捕获异常: ", conditionMessage(e))
)
