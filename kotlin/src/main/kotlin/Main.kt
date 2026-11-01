/**
 * Kotlin 入口示例：演示数据类、顶层函数与空安全。
 */

/** 用户信息，字段在构造时即确定 */
data class User(val name: String, val email: String?)

/**
 * 生成展示名。
 *
 * @param user 待展示的用户
 * @return 邮箱存在时为「名字 <邮箱>」，否则只返回名字，避免界面出现 null
 */
fun displayName(user: User): String = user.email?.let { "${user.name} <$it>" } ?: user.name

fun main() {
    val users =
        listOf(
            User("张三", "zhangsan@example.com"),
            // 邮箱为空的用户用于覆盖空安全分支
            User("李四", null),
        )

    // 逐个输出展示名
    users.forEach { println(displayName(it)) }
}
