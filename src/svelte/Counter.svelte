<!-- 计数器组件：演示 Svelte 的响应式声明与事件绑定 -->
<script>
  // 计数上限，到达后回绕，避免数值无限增大
  const MAX_COUNT = 999;
  // 当前计数值
  let count = 0;

  // 自增并在上限处回绕
  function increment() {
    count = count >= MAX_COUNT ? 0 : count + 1;
  }
</script>

<!-- 计数器区块 -->
<div class="counter">
  <!-- 当前计数值 -->
  <p>当前计数：{count}</p>
  <!-- 点击后自增 -->
  <button on:click={increment}>+1</button>
</div>
