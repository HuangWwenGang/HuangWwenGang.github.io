#!/bin/bash
########################################
# Hexo 博客一键发布脚本 (Linux/Mac/Git Bash)
# 用法: ./publish.sh "提交信息"
# 示例: ./publish.sh "添加新文章: 我的第一篇博客"
########################################

# 颜色定义
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# 切换到脚本所在目录
cd "$(dirname "$0")"

# 获取提交信息
COMMIT_MSG="${1}"

if [ -z "$COMMIT_MSG" ]; then
    echo -e "${RED}[错误] 请提供提交信息！${NC}"
    echo ""
    echo "用法:"
    echo "  ./publish.sh \"提交信息\""
    echo ""
    echo "示例:"
    echo "  ./publish.sh \"添加新文章\""
    echo "  ./publish.sh \"更新配置文件\""
    echo "  ./publish.sh \"修复样式问题\""
    exit 1
fi

echo "========================================"
echo "开始发布博客..."
echo "========================================"
echo ""

# 1. 检查 Git 状态
echo -e "${YELLOW}[1/4] 检查文件变化...${NC}"
git status --short
echo ""

# 2. 添加所有更改
echo -e "${YELLOW}[2/4] 添加文件到 Git...${NC}"
git add .
if [ $? -ne 0 ]; then
    echo -e "${RED}[错误] git add 失败！${NC}"
    exit 1
fi
echo -e "${GREEN}✓ 文件已添加${NC}"
echo ""

# 3. 检查是否有更改
if git diff-index --quiet HEAD --; then
    echo -e "${YELLOW}[提示] 没有检测到更改，无需提交${NC}"
    exit 0
fi

# 4. 提交更改
echo -e "${YELLOW}[3/4] 提交更改...${NC}"
git commit -m "$COMMIT_MSG"
if [ $? -ne 0 ]; then
    echo -e "${RED}[错误] git commit 失败！${NC}"
    exit 1
fi
echo -e "${GREEN}✓ 更改已提交${NC}"
echo ""

# 5. 推送到 GitHub
echo -e "${YELLOW}[4/4] 推送到 GitHub...${NC}"
git push origin master
if [ $? -ne 0 ]; then
    echo -e "${RED}[错误] git push 失败！${NC}"
    echo ""
    echo "可能的原因:"
    echo "  1. 网络连接问题"
    echo "  2. 需要先拉取远程更新: git pull origin master"
    echo "  3. 权限问题"
    exit 1
fi
echo -e "${GREEN}✓ 推送成功${NC}"
echo ""

echo "========================================"
echo -e "${GREEN}✓ 发布完成！${NC}"
echo "========================================"
echo ""
echo "提交信息: $COMMIT_MSG"
echo ""
echo "后续步骤:"
echo "  1. GitHub Actions 正在自动部署 (约 2-5 分钟)"
echo "  2. 查看部署状态: https://github.com/HuangWwenGang/HuangWwenGang.github.io/actions"
echo "  3. 访问博客: https://daisuki.you"
echo "  4. 记得强制刷新浏览器 (Ctrl+Shift+R)"
echo ""
