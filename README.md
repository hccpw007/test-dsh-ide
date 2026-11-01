# 多语言示例仓库（test-dsh-ide）

用于验证 git 对各类文件的追踪、差异展示与提交能力。仓库内每个文件都是可独立阅读的最小示例，附规范注释，覆盖编程语言、配置、数据与文档四类文件。

## 目录结构









| 目录 | 内容 | 主要扩展名 |
|------|------|-----------|
| `src/` | 前端生态示例（TS / JS / React / Vue / Svelte） | `.ts` `.js` `.tsx` `.vue` `.svelte` |
| `web/` | 无依赖静态页面 | `.html` `.css` |
| `python/` | Python 示例与单元测试 | `.py` `.toml` |
| `java/` | Maven 风格包结构示例 | `.java` |
| `kotlin/` | Kotlin 示例 | `.kt` |
| `rust/` | Cargo 项目示例 | `.rs` `.toml` |
| `go/` | Go module 示例 | `.go` `.mod` |
| `c/` `cpp/` | C/C++ 头文件与实现示例 | `.c` `.h` `.cpp` |
| `csharp/` | C# 控制台示例 | `.cs` `.csproj` |
| `swift/` | Swift 脚本示例 | `.swift` |
| `ruby/` `php/` `shell/` | 脚本语言示例 | `.rb` `.php` `.sh` |
| `lua/` `dart/` `r/` | 其他语言示例 | `.lua` `.dart` `.R` |
| `sql/` | 建表与查询示例 | `.sql` |
| `data/` | 数据样例（JSON / CSV / XML） | `.json` `.csv` `.xml` |
| `config/` | 应用配置样例（YAML / TOML） | `.yaml` `.toml` |
| `proto/` `api/` | 接口契约（Protobuf / GraphQL） | `.proto` `.graphql` |
| `docs/` | 仓库组织与设计说明 | `.md` |

## 校验方式

```bash
# 一键运行可执行示例（JS / Python / C / C++）
make all

# 按语言单独运行
make js
make python
make c
make cpp
make go
make rust
```

可执行示例的统一行为：正常路径打印结果，错误路径捕获预期异常并输出到标准错误，便于观察各语言的错误处理差异。

## 约定

- 所有示例只依赖标准库，离线可运行
- 编译产物统一输出到 `/tmp/test-dsh-ide-build`，不污染工作区
- 注释只解释"为什么"，不复述代码行为
