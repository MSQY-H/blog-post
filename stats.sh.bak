#!/bin/bash

# 1. 统计 .md 文件数量（排除 .git 和 node_modules）
files=$(find . -type f -name "*.md" ! -path "./.git/*" ! -path "./node_modules/*" | wc -l)

# 2. 统计总字数（字符数，含中文）
words=$(find . -type f -name "*.md" ! -path "./.git/*" ! -path "./node_modules/*" -exec cat {} \; | wc -m)

# 3. 获取最后一次提交的 ISO 时间
updated=$(git log -1 --format=%cd --date=iso)

# 4. 统计总提交次数
commits=$(git rev-list --count HEAD)

# 生成 JSON 文件（只包含四个字段）
cat > stats.json << EOF
{
  "files": $files,
  "words": $words,
  "updated": "$updated",
  "commits": $commits
}
EOF

echo "✅ 统计完成：$files 篇文章，$words 字，$commits 次提交，最后更新于 $updated"