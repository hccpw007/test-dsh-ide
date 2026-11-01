/**
 * React 计数器组件：演示 TSX 语法、状态与 JSX 区块注释。
 */
import { useState } from 'react';

interface CounterProps {
  /** 初始值，便于测试时固定起点 */
  initial?: number;
}

/** 计数器组件，点击按钮后自增并展示当前值。 */
export function Counter({ initial = 0 }: CounterProps) {
  // 计数状态，仅在用户点击时变化
  const [count, setCount] = useState(initial);
  // 固定步长为 1，当前需求不提供可调步长
  const step = () => setCount((prev) => prev + 1);

  return (
    // 计数器区块
    <div className="counter">
      {/* 当前计数值 */}
      <p>当前计数：{count}</p>
      {/* 点击后自增 */}
      <button type="button" onClick={step}>
        +1
      </button>
    </div>
  );
}
