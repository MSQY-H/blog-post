---
title: Hexo Solitude + Cloudflare 博客简要部署教程（支持手机）
date: 2026-07-13 15:43:00
description: 我是占位符
tags:
  - Hexo
  - Solitude
categories:
  - 技术
cover: cover.webp
comments: true
ai_text: 我是占位符
---
## 写在前面

2026 年了，中国估计没什么人看博客了吧（笑）

但是有一个属于自己的博客还是一件很酷的事情呢！🔥🔥🔥

我之前一直以为，博客一定要自己从头用纯 HTML + CSS + JavaScript 编写，还要自己建数据库，自己买服务器，自己买域名

直到我发现了 **Hexo** 和 **Cloudflare Pages**

Hexo 是一个**静态网站生成器**，**不需要服务器**就可以运行，速度快（相对动态博客而 言），社区完善， SEO 优化好，还有很多好看的主题！部署起来十分方便，**甚至不需要你懂代码**！

而 Cloudflare Pages 则是**托管 Hexo 最好的平台之一**。Cloudflare Pages 可以托管静态网站，可以方便的添加域名、操作部署，更重要的是，它**完全免费**！无限带宽、每月 500 次部署，还能帮你抗 DDoS 等网络攻击！{% spoiler 'blur' '赛博大善人✋😭✋' %}

Hexo 的主题中，我比较喜欢的是 [Heo 风格](https://blog.zhheo.com/update/)的 [Solitude 主题](https://solitude.js.org/cn)。它比较完善，更新持续，有设计感

说了这么多，也该开始部署了

## 本地部署

要方便地配置博客，要先本地部署。

我使用 Andoird 的 **Termux** 来部署，如果你用 Windows，可以使用 **PowerShell**（**最好不要用 CMD！**）， 如果你用 Linux 或 MacOS，可以使用 **zsh** 。

我的开发环境：
- Andoird 11
- ZeroTermux 0.118.3.62 （这是 Termux 的增强版）

你需要准备：
- 可以上网和运行终端的设备
- 脑子

准备好后，就开始吧！

### 1. 安装 Node.js 和 git

{% tabs 安装Node.js和git %}

<!-- tab Termux -->

``` Shell
pkg install nodejs git -y
```

<!-- endtab -->

<!-- tab Windows -->

建议安装二进制安装包（.exe/.msi）

{% link 'Node.js — 下载…' '下载已签名的 Node.js 源代码压缩包。 …' 'https://nodejs.org/zh-cn/download' %}

{% link 'Git — Install for …' 'Several free and commercial…' 'https://git-scm.com/install/windows' %}

<!-- endtab -->

<!-- tab MacOS -->

建议安装二进制安装包（.pkg/.dmg）

{% link 'Node.js — 下载…' '下载已签名的 Node.js 源代码压缩包。 …' 'https://nodejs.org/zh-cn/download' %}

Git 需要输入命令

{% link 'Git — Install for…' 'There are several options for installing…' 'https://git-scm.com/install/mac' %}

假设你已安装了 Homebrew

``` Shell
brew install git
```

<!-- endtab -->

<!-- tab Linux -->

使用对应包管理器（以`apt`为例）：

``` Shell
sudo apt install nodejs git -y
```

<!-- endtab -->

{% endtabs %}

### 2. 安装 Hexo

使用 npm 包管理器全局安装 Hexo

{% tabs 安装插件 %}

<!-- tab npm -->

``` Shell
npm install -g hexo-cli
```

<!-- endtab -->

<!-- tab pnpm -->

如果没安装 pnpm：

``` Shell
npm install -g pnpm
```

然后

``` Shell
pnpm install -g hexo-cli
```

<!-- endtab -->

<!-- tab yarn -->

如果没安装 yarn ：

``` Shell
npm install -g yarn
```

然后

``` Shell
yarn global add hexo-cli
```

<!-- endtab -->

{% endtabs %}

测试 Hexo 是否安装完全：

``` Shell
hexo -v
```

如果输出类似于：

![](v.jpg)

即为安装成功🎉🎉

### 3. 初始化博客

执行

``` Shell
mkdir my-blog
cd my-blog
hexo init
```

（ my-blog 可替换为你想要的项目名）

### 4.生成与预览

执行

``` Shell
hexo clean
hexo generate
hexo server
```

{% note 'info modern' 'fas fa-circle-info' %}
记住这个，以后预览要用到
{% endnote %}

访问`localhost:4000`即可看到效果。

### 5. 应用 Solitude 主题

以官方教程为准：

{% link 'Solitude 文档 …' 'Solitude 是一个现代 Hexo 博客主题，这…' 'https://solitude.js.org/cn' %}

{% tabs 安装主题 %}

<!-- tab git -->

通过 Git 安装（✨推荐）：

``` Shell
git clone https://github.com/everfu/hexo-theme-solitude.git themes/solitude
```

<!-- endtab -->

<!-- tab npm/pnpm/yarn -->

通过 npm/pnpm/yarn 安装（更新方便）：

``` Shell
npm install hexo-theme-solitude
```

``` Shell
pnpm add hexo-theme-solitude
```

``` Shell
yarn add hexo-theme-solitude
```

<!-- endtab -->

{% endtabs %}

接着启用主题：

打开`_config.yml`，更改这一项为：

``` Yml
theme: solitude
```

然后准备主题配置：

{% tabs 准备主题配置 %}

<!-- tab git -->

``` Shell
cp themes/solitude/_config.yml _config.solitude.yml
```

<!-- endtab -->

<!-- tab npm/pnpm/yarn -->

``` Shell
cp node_modules/hexo-theme-solitude/_config.yml _config.solitude.yml
```

<!-- endtab -->

{% endtabs %}

运行 Hexo 三连：

``` Shell
hexo clean
hexo generate
hexo server
```

如果是这样：

![](1.jpg)

那就成功了！

## 总结

在这个文章，你在本地部署了 Hexo 博客并应用了 Solitude 主题！恭喜你🎉🎉🎉

由于篇幅过长，先写到这里，到时候我将会写一下如何在Cloudflare Pages 上部署文章。

✨