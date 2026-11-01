/**
 * 计数器示例：演示 ES Module 导出与 JSDoc 注释。
 */

// 计数上限，到达后回绕到 0，避免长期运行时数值无意义地增长
const MAX_COUNT = 1000;

/**
 * 创建独立的计数器实例。
 * @returns {{ increment: () => number, reset: () => void, value: () => number }} 计数器方法集合
 */
function createCounter() {
  let count = 0;

  // 到达上限后回绕，而不是继续累加
  function increment() {
    count = count >= MAX_COUNT ? 0 : count + 1;
    return count;
  }

  function reset() {
    count = 0;
  }

  return { increment, reset, value: () => count };
}

export { createCounter, MAX_COUNT };
