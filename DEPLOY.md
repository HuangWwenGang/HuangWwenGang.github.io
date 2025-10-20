# GitHub Actions 自动部署配置说明

## 已完成的配置

✅ 创建了 GitHub Actions 工作流配置文件 [.github/workflows/deploy.yml](.github/workflows/deploy.yml)
✅ 检查了 package.json 脚本配置
✅ 确认了 .gitignore 配置正确

## 部署流程说明

### 工作原理
```
本地写文章 → git push 到 master 分支
                    ↓
        GitHub Actions 自动触发
                    ↓
        安装依赖 → 构建静态文件 → 部署到 gh-pages 分支
                    ↓
        GitHub Pages 自动发布网站
```

## 后续步骤（重要！）

### 1. 推送代码到 GitHub

```bash
# 添加所有文件
git add .

# 提交更改
git commit -m "Add GitHub Actions auto deploy"

# 推送到 GitHub
git push origin master
```

### 2. 配置 GitHub Pages

访问你的 GitHub 仓库设置页面：
`https://github.com/HuangWwenGang/HuangWwenGang.github.io/settings/pages`

配置以下选项：
- **Source**: Deploy from a branch
- **Branch**: `gh-pages` （重要！选择 gh-pages 分支）
- **Folder**: `/ (root)`

点击 **Save** 保存

### 3. 查看部署状态

推送代码后，可以在以下位置查看部署进度：
`https://github.com/HuangWwenGang/HuangWwenGang.github.io/actions`

部署成功后，访问你的博客：
`https://huangwwengang.github.io`

## 日常使用流程

以后写文章只需要三步：

```bash
# 1. 添加文件
git add .

# 2. 提交更改
git commit -m "发布新文章：文章标题"

# 3. 推送到 GitHub
git push
```

GitHub Actions 会自动完成构建和部署！⚡

## 可选：创建一键部署脚本

### Windows (deploy.bat)
```batch
@echo off
git add .
git commit -m "Update blog %date% %time%"
git push
echo.
echo 代码已推送，GitHub Actions 正在自动部署...
echo 请访问 https://github.com/HuangWwenGang/HuangWwenGang.github.io/actions 查看部署进度
pause
```

使用方法：双击运行 `deploy.bat`

### Linux/Mac (deploy.sh)
```bash
#!/bin/bash
git add .
git commit -m "Update blog $(date '+%Y-%m-%d %H:%M:%S')"
git push
echo ""
echo "代码已推送，GitHub Actions 正在自动部署..."
echo "请访问 https://github.com/HuangWwenGang/HuangWwenGang.github.io/actions 查看部署进度"
```

使用方法：
```bash
chmod +x deploy.sh
./deploy.sh
```

## 注意事项

1. **不需要再运行** `hexo deploy` 命令，GitHub Actions 会自动构建部署
2. **只需提交源文件**（Markdown、配置文件等），不需要提交 `public/` 文件夹
3. 首次部署可能需要 **5-10 分钟**，后续部署通常 **2-3 分钟**
4. 如果部署失败，查看 Actions 页面的错误日志

## 故障排查

### 如果部署失败

1. 检查 Actions 日志：`https://github.com/HuangWwenGang/HuangWwenGang.github.io/actions`
2. 确认 GitHub Pages 设置正确（使用 gh-pages 分支）
3. 确认 _config.yml 中的 URL 配置正确
4. 检查是否有语法错误的 Markdown 文件

### 常见问题

**Q: 推送后没有自动部署？**
A: 检查是否推送到了 master 分支，GitHub Actions 只监听 master 分支的变化

**Q: 网站内容没有更新？**
A: 等待 2-3 分钟，GitHub Pages 需要时间刷新缓存

**Q: 404 错误？**
A: 检查 GitHub Pages 是否正确设置为 gh-pages 分支

## 优势总结

✅ 自动化部署，节省时间
✅ 版本控制，随时回滚
✅ 自动备份，数据安全
✅ 免费托管，全球 CDN
✅ 简单易用，一键发布

---

配置完成！享受你的自动化博客部署吧！🎉
