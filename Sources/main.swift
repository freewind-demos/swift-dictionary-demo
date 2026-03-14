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
