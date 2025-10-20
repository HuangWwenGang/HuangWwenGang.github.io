title: Hexo博客搭建与Carbon主题配置记录
tags:
  - Hexo
  - 博客搭建
  - Carbon主题
categories: 技术
date: 2025-10-09 22:47:08
---

本文记录了使用 Hexo 搭建博客并配置 Carbon 主题的完整过程，包括遇到的问题和解决方案。

<!--more-->

## 前言

本文记录了使用 Hexo 搭建博客并配置 Carbon 主题的完整过程，包括遇到的问题和解决方案。

## 初始环境

- 操作系统: Windows
- Node.js 版本: v20.17.0
- 已有 Carbon 主题文件夹位于 `themes/carbon`

## 配置过程

### 1. 发现问题：缺少完整的 Hexo 博客结构

初始状态下，只有一个 `themes` 文件夹包含 Carbon 主题，但缺少 Hexo 博客的核心文件结构（如 `source/`, `scaffolds/`, `_config.yml` 等）。

**解决方案**: 需要先初始化一个完整的 Hexo 博客项目。

### 2. 安装 Hexo CLI

首先全局安装 Hexo 命令行工具：

```bash
npm install hexo-cli -g
```

这一步顺利完成，安装了 53 个依赖包。

### 3. 初始化 Hexo 博客

创建新的 Hexo 博客项目：

```bash
hexo init blog
cd blog
npm install
```

**遇到的警告**:
```
npm warn EBADENGINE Unsupported engine {
  package: 'hexo@8.0.0',
  required: { node: '>=20.19.0' },
  current: { node: 'v20.17.0', npm: '10.8.2' }
}
```

虽然有引擎版本警告，但初始化成功完成。

### 4. 配置 Carbon 主题

#### 4.1 复制主题文件

将 Carbon 主题复制到博客的 themes 目录：

```bash
cp -r ../themes/carbon themes/
```

#### 4.2 安装主题依赖

Carbon 主题需要特定的渲染器，根据其 README 说明安装：

```bash
npm install hexo-renderer-coffeescript --save
npm install hexo-renderer-jade --save
```

**遇到的警告**:
- `hexo-renderer-jade` 已废弃，建议使用 `hexo-renderer-pug`
- `hexo-renderer-coffeescript` 已废弃
- 一些依赖包存在安全漏洞

尽管有这些警告，主题的基本功能仍然可用。

#### 4.3 修改配置文件

编辑 `_config.yml`，将主题从默认的 `landscape` 改为 `carbon`：

```yaml
# Extensions
## Plugins: https://hexo.io/plugins/
## Themes: https://hexo.io/themes/
theme: carbon
```

### 5. 启动服务遇到的问题

#### 问题 1: Hexo 8.0.0 版本兼容性问题

首次尝试启动服务时遇到错误：

```
Error [ERR_REQUIRE_ESM]: require() of ES Module ... strip-ansi/index.js ... not supported.
```

**原因**: Hexo 8.0.0 要求 Node.js >= 20.19.0，而当前环境是 v20.17.0，存在模块加载方式的兼容性问题。

**解决方案**: 降级到 Hexo 7.3.0：

```bash
npm install hexo@7.3.0 --save
```

#### 问题 2: 成功启动

降级后再次启动服务：

```bash
hexo server
```

成功输出：

```
INFO  Validating config
INFO  Start processing
INFO  Hexo is running at http://localhost:4000/ . Press Ctrl+C to stop.
```

## 最终配置总结

### 成功运行的环境

- Hexo 版本: 7.3.0
- Node.js: v20.17.0
- 主题: Carbon
- 访问地址: http://localhost:4000/

### 关键依赖

```json
{
  "dependencies": {
    "hexo": "^7.3.0",
    "hexo-renderer-coffeescript": "^0.2.0",
    "hexo-renderer-jade": "^0.5.0"
  }
}
```

## 注意事项

1. **版本兼容性**: 如果 Node.js 版本低于 20.19.0，建议使用 Hexo 7.x 版本
2. **主题依赖**: Carbon 主题依赖的渲染器已废弃，长期使用建议考虑迁移到其他主题或更新渲染器
3. **安全漏洞**: 项目存在 8 个安全漏洞，如果是生产环境，建议运行 `npm audit fix` 修复

## 常用命令

```bash
# 启动本地服务器
hexo server

# 生成静态文件
hexo generate

# 清除缓存
hexo clean

# 创建新文章
hexo new "文章标题"

# 部署到远程
hexo deploy
```

## 总结

通过以上步骤，成功搭建了一个使用 Carbon 主题的 Hexo 博客。主要遇到的问题是版本兼容性，通过降级 Hexo 版本得到解决。虽然主题依赖的一些渲染器已废弃，但不影响基本使用。