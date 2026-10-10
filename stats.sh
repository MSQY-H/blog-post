#!/bin/bash

# 1. 统计 .md 文件数量（排除 .git 和 node_modules）
files=$(find . -type f -name "*.md" ! -path "./.git/*" ! -path "./node_modules/*" | wc -l)

# 2. 统计总字数（字符数，含中文）
words=$(find . -type f -name "*.md" ! -path "./.git/*" ! -path "./node_modules/*" -exec cat {} \; | wc -m)

# 3. 获取最后一次提交的 ISO 时间（严格格式）
updated=$(git log -1 --format=%cd --date=iso-strict)

# 4. 统计总提交次数
commits=$(git rev-list --count HEAD)

# 生成符合 Shields.io endpoint 规范的 JSON
cat > stats.json << EOF
{
  "schemaVersion": 1,
  "files": {
    "label": "文章数",
    "message": "$files",
    "color": "blue"
  },
  "words": {
    "label": "总字数",
    "message": "$words",
    "color": "green"
  },
  "updated": {
    "label": "最后更新",
    "message": "$updated",
    "color": "blueviolet"
  },
  "commits": {
    "label": "提交数",
    "message": "$commits",
    "color": "red"
  }
}
EOF

echo "✅ 统计完成：$files 篇文章，$words 字，$commits 次提交，最后更新于 $updated"