<!-- 问候卡片：演示 Vue 单文件组件的 script/template/style 三段结构 -->
<script setup lang="ts">
import { computed } from 'vue';

const props = withDefaults(defineProps<{ name: string; locale?: string }>(), {
  locale: 'zh-CN',
});

// 文案随 locale 切换，未知 locale 回退到中文，保证界面始终有可读内容
const text = computed(() =>
  props.locale === 'en-US' ? `Hello, ${props.name}!` : `你好，${props.name}！`,
);
</script>

<template>
  <!-- 卡片主体 -->
  <section class="greeting-card">
    <!-- 问候语，内容随 locale 变化 -->
    <p class="greeting-card__text">{{ text }}</p>
  </section>
</template>

<style scoped>
/* 内边距，避免文字紧贴卡片边框 */
.greeting-card {
  padding: 16px;
  border: 1px solid #d0d7de;
  border-radius: 8px;
}
</style>
