# 容器构建示例：多阶段构建，运行时只保留静态页面
FROM node:22-alpine AS build
WORKDIR /app
# 静态页面无构建步骤，仅拷贝源码供运行阶段使用
COPY web ./web

FROM nginx:alpine AS runtime
# 静态页面交给 nginx 提供，无需在镜像内保留 node 运行时
COPY --from=build /app/web /usr/share/nginx/html
EXPOSE 80
