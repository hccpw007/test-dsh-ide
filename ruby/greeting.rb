# 问候与计算示例：演示 Ruby 的模块常量、lambda 与异常处理
module Greeting
  # locale 到模板的映射，新增语言在此扩展
  TEMPLATES = {
    'zh-CN' => ->(name) { "你好，#{name}！" },
    'en-US' => ->(name) { "Hello, #{name}!" }
  }.freeze

  # 按 locale 生成问候语，未知 locale 回退到简体中文
  def self.build(name, locale = 'zh-CN')
    template = TEMPLATES.fetch(locale) { TEMPLATES.fetch('zh-CN') }
    template.call(name)
  end
end

puts Greeting.build('世界')
puts Greeting.build('World', 'en-US')

# 安全除法：除数为零时抛出，避免返回 Infinity
def safe_divide(dividend, divisor)
  raise ZeroDivisionError, '除数不能为零' if divisor.zero?

  dividend.to_f / divisor
end

puts safe_divide(10, 4)

begin
  safe_divide(1, 0)
rescue ZeroDivisionError => e # 预期内的除零错误
  warn "[ruby-demo] 捕获异常: #{e.message}"
end
