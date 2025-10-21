# 📚 博客发布指南

本文档介绍如何使用一键发布脚本快速发布博客文章。

## 🚀 快速开始

### 方法 1: 使用 Windows 批处理脚本 (推荐)

```bash
# 在博客根目录下执行
publish.bat "添加新文章: 我的第一篇博客"
```

### 方法 2: 使用 Shell 脚本 (Git Bash/Linux/Mac)

```bash
# 在博客根目录下执行
./publish.sh "添加新文章: 我的第一篇博客"
```

### 方法 3: 使用 npm 命令 (跨平台)

```bash
npm run publish "添加新文章"
```

---

## 📝 完整的写作和发布流程

### 步骤 1: 创建新文章

```bash
hexo new "文章标题"
```

这会在 `source/_posts/` 目录创建一个新的 Markdown 文件。

### 步骤 2: 编辑文章

用 VS Code 或其他编辑器打开文件,按照以下格式编写:

```markdown
---
title: 文章标题
date: 2025-01-15
tags: [标签1, 标签2]
categories: 分类
---

这里写文章摘要 (50-100字)

<!--more-->

## 正文开始

文章内容...
```

### 步骤 3: 本地预览 (可选)

```bash
# 清理缓存
hexo clean

# 生成静态文件
hexo generate

# 启动本地服务器
hexo server
```

访问 `http://localhost:4000` 预览效果。

### 步骤 4: 发布到博客

**使用脚本发布 (推荐):**

```bash
# Windows
publish.bat "添加新文章: 文章标题"

# Git Bash/Linux/Mac
./publish.sh "添加新文章: 文章标题"

# npm (跨平台)
npm run publish "添加新文章: 文章标题"
```

**手动发布:**

```bash
git add .
git commit -m "添加新文章: 文章标题"
git push origin master
```

### 步骤 5: 等待自动部署

- ⏱️ 等待 2-5 分钟
- 🔍 查看部署状态: https://github.com/HuangWwenGang/HuangWwenGang.github.io/actions
- 🌐 访问博客: https://daisuki.you
- 🔄 强制刷新浏览器: `Ctrl + Shift + R`

---

## 🎯 脚本功能说明

### publish.bat / publish.sh 做了什么?

1. ✅ 自动切换到博客根目录
2. ✅ 检查文件变化 (`git status`)
3. ✅ 添加所有更改 (`git add .`)
4. ✅ 提交更改 (`git commit`)
5. ✅ 推送到 GitHub (`git push`)
6. ✅ 显示部署状态链接

### 优点

- 🚀 一条命令完成所有操作
- 📍 无需关心当前在哪个目录
- ✅ 自动检查错误
- 📊 清晰的进度提示
- 🔗 自动显示后续步骤

---

## 📋 提交信息规范

### 推荐的提交信息格式

```bash
# 新增文章
publish.bat "添加新文章: Markdown 完整指南"

# 更新文章
publish.bat "更新文章: 修复代码示例错误"

# 修复问题
publish.bat "修复: 首页标题截断问题"

# 优化样式
publish.bat "优化: 调整代码块样式"

# 更新配置
publish.bat "配置: 启用评论系统"
```

### 提交信息类型

| 类型 | 说明 | 示例 |
|------|------|------|
| 添加 | 新增文章或功能 | `添加新文章: xxx` |
| 更新 | 修改现有内容 | `更新文章: xxx` |
| 修复 | 修复错误或问题 | `修复: xxx问题` |
| 优化 | 性能或样式优化 | `优化: xxx样式` |
| 配置 | 修改配置文件 | `配置: 启用xxx` |
| 删除 | 删除内容 | `删除: 过期文章` |

---

## 🛠️ 常见问题

### Q1: 脚本在哪个目录都能用吗?

**A:** 可以! 脚本会自动切换到博客根目录。

```bash
# 即使在其他目录也能使用
C:\Users\Administrator> C:\Users\Administrator\blog\publish.bat "提交信息"
```

### Q2: 如果没有更改会怎样?

**A:** 脚本会检测并提示 "没有检测到更改,无需提交",然后安全退出。

### Q3: 推送失败怎么办?

**A:** 脚本会显示详细的错误信息和可能的原因:

1. **网络问题** - 检查网络连接
2. **需要先拉取** - 运行 `git pull origin master`
3. **权限问题** - 检查 GitHub 访问权限

### Q4: 可以修改默认分支吗?

**A:** 可以! 编辑脚本中的这一行:

```bash
# 将 master 改为其他分支名
git push origin master
```

### Q5: 忘记写提交信息怎么办?

**A:** 脚本会提示你必须提供提交信息,然后安全退出。

---

## 🎨 在 VS Code 中使用

### 推荐工作流程

1. **打开博客文件夹**
   - `文件` → `打开文件夹`
   - 选择 `C:\Users\Administrator\blog`

2. **写文章**
   - 在 `source/_posts/` 创建或编辑 `.md` 文件
   - 按 `Ctrl + Shift + V` 预览 Markdown

3. **打开终端**
   - 按 `` Ctrl + ` ``
   - 或 `查看` → `终端`

4. **发布**
   ```bash
   publish.bat "添加新文章"
   ```

### 快捷键

- `` Ctrl + ` `` - 打开/关闭终端
- `Ctrl + Shift + V` - 预览 Markdown
- `Ctrl + K V` - 侧边预览

---

## 📚 参考资源

- [Hexo 官方文档](https://hexo.io/docs/)
- [Markdown 语法指南](https://www.markdownguide.org/)
- [Git 基础教程](https://git-scm.com/book/zh/v2)
- [博客地址](https://daisuki.you)
- [GitHub 仓库](https://github.com/HuangWwenGang/HuangWwenGang.github.io)

---

## 🎯 总结

使用发布脚本后,你的博客发布流程变为:

```bash
# 1. 创建文章
hexo new "文章标题"

# 2. 编辑文章
# (在 VS Code 中编辑)

# 3. 一键发布
publish.bat "添加新文章"

# 4. 等待部署完成
# (2-5 分钟后访问博客)
```

**就是这么简单!** 🚀

---

*最后更新: 2025-10-21*
