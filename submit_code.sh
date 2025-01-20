#!/bin/bash

# 检查是否提供了提交信息
if [ -z "$1" ]; then
  echo "请提供提交信息。用法: ./submit_code.sh '提交信息'"
  exit 1
fi

# 提交信息
COMMIT_MESSAGE="$1"

# 进入仓库目录（请根据你的实际路径修改）
REPO_DIR="/data/workspace/codes/robo_vita"

# 进入仓库目录
cd "$REPO_DIR" || { echo "无法进入目录 $REPO_DIR"; exit 1; }

# 检查是否有更改
if [[ -z $(git status --porcelain) ]]; then
  echo "没有更改需要提交。"
  exit 0
fi

# 添加更改
git add .

# 提交更改
git commit -m "$COMMIT_MESSAGE"

# 推送到远程仓库
git push origin main  # 请根据你的分支名称修改

# 检查推送是否成功
if [ $? -eq 0 ]; then
  echo "代码提交成功！"
else
  echo "代码提交失败，请检查错误信息。"
fi