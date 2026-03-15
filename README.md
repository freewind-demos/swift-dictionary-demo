# Swift 字典 Demo

## 简介

本示例演示 Swift 中字典（Dictionary）的创建、访问、修改、遍历以及合并操作。字典是键值对形式的数据结构，类似于其他语言中的 Map、HashMap。

## 基本原理

字典是一种键值对（Key-Value）数据结构，用于存储一一对应的映射关系。与数组相比，字典的特点是：

1. **键值对存储**：每个元素由一个键和一个值组成
2. **键的唯一性**：同一个字典中，键必须唯一
3. **快速查找**：通过键可以在 O(1) 时间复杂度内获取值
4. **无序性**：字典不保证元素的存储顺序

Swift 字典的核心要求：
- **键必须可哈希（Hashable）**：Swift 内置类型如 String、Int、Double 都满足此要求
- **值可以是任意类型**：包括可选类型

## 启动和使用

### 环境要求

- macOS 系统（自带 Swift）
- 或从 https://swift.org/download/ 安装 Swift

### 安装和运行

```bash
cd swift-dictionary-demo
swift run
```

### 预期输出

```
Alice 的分数: Optional(95)
添加后: ["Alice": 95, "Bob": 87, "Charlie": 92, "David": 78]
修改后: ["Alice": 95, "Bob": 90, "Charlie": 92, "David": 78]
删除后: ["Alice": 95, "Bob": 90, "David": 78]

遍历字典:
  Alice: 95
  Bob: 90
  David: 78

所有名字:
  Alice
  Bob
  David

所有分数:
  95
  90
  78

合并后: ["a": 1, "b": 2, "c": 4]
```

## 教程

### 什么是字典？

字典用于存储键值对的集合。想象一本词典：词条（键）对应解释（值）。在 Swift 中：

```swift
// 创建字典
var scores = ["Alice": 95, "Bob": 87, "Charlie": 92]
```

这里：
- `"Alice"` 是键（String 类型）
- `95` 是值（Int 类型）
- 键和值用冒号 `:` 分隔

### 创建字典

Swift 提供了多种创建字典的方式：

```swift
// 方式1：使用字面量（最常用）
var scores = ["Alice": 95, "Bob": 87, "Charlie": 92]

// 方式2：显式声明类型
var scores2: [String: Int] = [:]  // 空字典

// 方式3：使用初始化器
var emptyDict = Dictionary<String, Int>()
```

### 访问值

访问字典的值使用键，但需要注意返回的是可选值：

```swift
let score = scores["Alice"]
// 返回 Optional(95)，因为可能键不存在

// 安全访问方式1：使用 nil 合并运算符
let score = scores["Alice"] ?? 0  // 如果是 nil，返回 0

// 安全访问方式2：使用 if let
if let score = scores["Alice"] {
    print("Alice 的分数是 \(score)")
}
```

**为什么返回可选值？** 因为访问不存在的键是合法的，这时返回 nil。如果直接返回非可选值，将无法区分"值不存在"和"值就是 nil"的情况。

### 添加和修改元素

```swift
// 添加新键值对
scores["David"] = 78

// 修改已有键的值
scores["Bob"] = 90  // 从 87 改为 90

// 使用 updateValue 方法（返回旧值）
let oldScore = scores.updateValue(100, forKey: "Alice")
// oldScore 是 Optional(95)，Alice 的分数现在变为 100
```

### 删除元素

删除字典元素有多种方式：

```swift
// 方式1：removeValue 返回被删除的值
let removedScore = scores.removeValue(forKey: "Charlie")

// 方式2：直接置 nil
scores["Charlie"] = nil

// 方式3：清空字典
scores.removeAll()
```

### 遍历字典

字典遍历有多种方式，可以获取键、值或两者：

```swift
// 同时遍历键和值
for (name, score) in scores {
    print("\(name): \(score)")
}

// 只遍历键
for name in scores.keys {
    print(name)
}

// 只遍历值
for score in scores.values {
    print(score)
}
```

### 合并字典

Swift 提供了合并字典的方法：

```swift
var dict1 = ["a": 1, "b": 2]
let dict2 = ["b": 3, "c": 4]

// 合并，闭包决定冲突时的处理方式
dict1.merge(dict2) { current, _ in current }
// 结果: ["a": 1, "b": 2, "c": 4]
// 键 "b" 冲突时，保留 dict1 的值（2）

// 也可以用另一种方式
dict1.merge(dict2) { _, new in new }
// 结果: ["a": 1, "b": 3, "c": 4]
// 键冲突时，使用 dict2 的值
```

### 常见问题和注意事项

1. **键必须可哈希**：自定义类型需要实现 Hashable 协议
2. **可选值处理**：访问值时始终考虑键可能不存在的情况
3. **性能**：字典操作平均是 O(1)，但不如数组紧凑
4. **顺序不确定**：不要依赖字典的遍历顺序

## 关键代码详解

### main.swift 完整代码

```swift
// swift-dictionary-demo.swift

// 创建字典
var scores = ["Alice": 95, "Bob": 87, "Charlie": 92]
let immutableDict = ["a": 1, "b": 2]

// 访问值
print("Alice 的分数: \(scores["Alice"] ?? 0)")

// 添加键值对
scores["David"] = 78
print("添加后: \(scores)")

// 修改值
scores["Bob"] = 90
print("修改后: \(scores)")

// 删除键值对
scores.removeValue(forKey: "Charlie")
print("删除后: \(scores)")

// 遍历字典
print("\n遍历字典:")
for (name, score) in scores {
    print("  \(name): \(score)")
}

// 只遍历键
print("\n所有名字:")
for name in scores.keys {
    print("  \(name)")
}

// 只遍历值
print("\n所有分数:")
for score in scores.values {
    print("  \(score)")
}

// 合并字典
var dict1 = ["a": 1, "b": 2]
let dict2 = ["b": 3, "c": 4]
dict1.merge(dict2) { current, _ in current }
print("合并后: \(dict1)")
```

### 核心代码解析

1. **字典创建**：`var scores = ["Alice": 95, "Bob": 87, "Charlie": 92]`
   - 使用方括号 `[]`，键值对用冒号分隔
   - Swift 推断类型为 `[String: Int]`

2. **访问值**：`scores["Alice"] ?? 0`
   - 返回可选值 `Optional(95)` 或 `nil`
   - `??` 运算符在值为 nil 时提供默认值 0

3. **removeValue(forKey:)**：删除并返回被删除的值
   - 如果键不存在，返回 nil
   - 安全删除方式

4. **merge()**：合并两个字典
   - 接收一个闭包处理键冲突
   - 第一个参数是当前字典的值，第二个是新字典的值
