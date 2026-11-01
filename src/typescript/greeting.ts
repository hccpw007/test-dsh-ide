/**
 * 问候语工具：演示 TypeScript 的类型定义与模块导出，供本测试仓库验证 .ts 文件的 git 追踪。
 */

/** 问候结果 */
export interface Greeting {
  text: string;
  locale: string;
}

// locale 到文案模板的映射，新增语言时只需在此处扩展
const TEMPLATES: Record<string, (name: string) => string> = {
  'zh-CN': (name) => `你好，${name}！`,
  'en-US': (name) => `Hello, ${name}!`,
};

/**
 * 按 locale 生成问候语。
 * @param name 被问候者名称
 * @param locale 语言标记，默认简体中文
 * @returns 格式化后的问候结果；未知 locale 回退到 zh-CN，返回值中记录实际使用的语言
 */
export function greet(name: string, locale = 'zh-CN'): Greeting {
  const template = TEMPLATES[locale] ?? TEMPLATES['zh-CN'];
  const usedLocale = TEMPLATES[locale] ? locale : 'zh-CN';
  return { text: template(name), locale: usedLocale };
}
