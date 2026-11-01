-- Lua 示例：演示模块表的导出方式与默认参数约定
local Greeting = {}

-- locale 到模板的映射，新增语言在此扩展
local templates = {
  ["zh-CN"] = function(name) return "你好，" .. name .. "！" end,
  ["en-US"] = function(name) return "Hello, " .. name .. "!" end,
}

--- 按 locale 生成问候语
--- @param name string 被问候者名称
--- @param locale string|nil 语言标记，默认 zh-CN
--- @return string 问候语文本
function Greeting.build(name, locale)
  -- 未知 locale 回退到中文，保证调用方始终拿到可读文本
  local template = templates[locale or "zh-CN"] or templates["zh-CN"]
  return template(name)
end

print(Greeting.build("世界"))
print(Greeting.build("World", "en-US"))

return Greeting
