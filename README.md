# 可以使用的轻量级解决方案：
1. 原生JavaScript库（通过CDN引入）
2. 纯CSS框架（Bootstrap、Tailwind等CDN版本）
3. 静态资源文件（图片、字体等）
4. 简单的数据JSON文件# Ray的个人主页
My first profile on github!

## 项目概述
这是一个基于GitHub Pages的个人主页项目，采用原生HTML/CSS/JS技术栈，遵循极简架构设计理念，为人工智能研究者打造专业、清爽的数字名片。

## 开发环境配置

### 系统要求
- **操作系统**: Windows 11
- **Node.js**: 已安装（用于本地开发和预览）
- **IDE**: Visual Studio Code

### 推荐VSCode扩展
为了更好的开发体验，建议安装以下VSCode扩展：
- **Live Server**: 用于本地实时预览网页效果
- **Auto Rename Tag**: 自动重命名配对的HTML标签
- **Bracket Pair Colorizer**: 彩色括号匹配，提高代码可读性
- **Prettier**: 代码格式化工具

### 项目目录结构
```
Profile/
├── _layouts/           # 页面布局模板
├── _includes/          # 可复用HTML片段
├── assets/            # 静态资源目录
│   ├── css/          # CSS样式文件
│   ├── js/           # JavaScript文件
│   └── images/       # 图片资源
├── Images/           # 设计示意图
├── index.html        # 网站入口文件
├── .nojekyll         # 禁用Jekyll处理
├── CNAME             # 自定义域名配置（可选）
└── 404.html          # 自定义404页面
```

## 本地开发命令

### 启动本地服务器
```bash
# 使用Live Server扩展
# 在VSCode中右键index.html文件，选择"Open with Live Server"

# 或使用Node.js http-server
npx http-server . -p 8080
```

### 文件操作命令
```bash
# 查看项目状态
git status

# 添加文件到暂存区
git add .

# 提交更改
git commit -m "feat: 添加新的功能描述"

# 推送到远程仓库
git push origin main
```

### GitHub Pages部署
项目将自动部署到 `https://username.github.io`，无需额外配置。

## 技术栈说明

### 核心技术
- **HTML5**: 语义化标签，结构清晰
- **CSS3**: 现代样式特性，支持液态玻璃效果
- **Vanilla JavaScript**: 原生JS，零依赖

### UI增强
- **Pico CSS**: 通过CDN引入的轻量级CSS框架
- **条件式加载**: 仅对添加`.pico`类的元素生效

### 浏览器兼容性
- 支持现代浏览器的`backdrop-filter: blur()`特效
- 为旧浏览器提供优雅降级方案

## 开发规范

### 代码风格
- 使用语义化的HTML标签
- CSS采用BEM命名规范
- JavaScript遵循ES6+标准

### Git提交规范
- `feat`: 新功能
- `fix`: 修复bug
- `docs`: 文档更新
- `style`: 代码格式调整
- `refactor`: 代码重构

### 响应式设计
- 移动端优先的设计理念
- 弹性布局适配不同屏幕尺寸
- 渐进增强的用户体验

## 项目特色

### 视觉设计
- 液态玻璃与磨砂玻璃效果
- 新拟态设计风格
- 清爽通透的界面体验

### 内容架构
- 八大核心模块展示AI研究者全貌
- STAR-R框架描述项目经历
- 结构化信息呈现

### 可维护性
- 模块化目录结构
- 组件复用机制
- 关注点分离原则