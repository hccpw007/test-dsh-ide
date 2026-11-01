-- 订单库示例：演示 DDL、索引与查询语句的注释写法
-- 供测试仓库验证 .sql 文件的 git 追踪

-- 客户表
CREATE TABLE customer (
    id          BIGINT PRIMARY KEY,
    name        VARCHAR(64) NOT NULL,
    -- 邮箱允许为空，部分客户通过线下渠道注册
    email       VARCHAR(128),
    created_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- 订单表：金额使用定点数，避免浮点累加误差
CREATE TABLE orders (
    id          BIGINT PRIMARY KEY,
    customer_id BIGINT NOT NULL REFERENCES customer (id),
    amount      NUMERIC(12, 2) NOT NULL,
    status      VARCHAR(16) NOT NULL DEFAULT 'pending',
    created_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- 按客户查询订单是最高频路径，建立联合索引减少扫描
CREATE INDEX idx_orders_customer_created ON orders (customer_id, created_at DESC);

-- 示例查询：统计每个客户的订单总金额，无订单记 0
SELECT c.name,
       COALESCE(SUM(o.amount), 0) AS total_amount
FROM customer c
LEFT JOIN orders o ON o.customer_id = c.id
GROUP BY c.id, c.name
ORDER BY total_amount DESC;
