@echo off
echo ==================== PROFILE项目验证脚本 ====================
echo.

echo [1/10] 检查项目结构完整性...
if exist "index.html" (echo ✓ index.html - OK) else (echo ✗ index.html - MISSING)
if exist "_layouts\default.html" (echo ✓ _layouts/default.html - OK) else (echo ✗ _layouts/default.html - MISSING)
if exist "_includes\header.html" (echo ✓ _includes/header.html - OK) else (echo ✗ _includes/header.html - MISSING)
if exist "_includes\footer.html" (echo ✓ _includes/footer.html - OK) else (echo ✗ _includes/footer.html - MISSING)
if exist "assets\css\style.css" (echo ✓ assets/css/style.css - OK) else (echo ✗ assets/css/style.css - MISSING)
if exist "assets\js\main.js" (echo ✓ assets/js/main.js - OK) else (echo ✗ assets/js/main.js - MISSING)
if exist ".nojekyll" (echo ✓ .nojekyll - OK) else (echo ✗ .nojekyll - MISSING)
echo.

echo [2/10] 检查必需的配置文件...
if exist "package.json" (echo ✓ package.json - OK) else (echo ⚠ package.json - 可选)
if exist ".gitignore" (echo ✓ .gitignore - OK) else (echo ⚠ .gitignore - 建议添加)
echo.

echo [3/10] 验证HTML结构...
findstr /C:"<!DOCTYPE html>" index.html >nul && echo ✓ DOCTYPE声明正确
findstr /C:"<html" index.html >nul && echo ✓ HTML标签开始正确
findstr /C:"</html>" index.html >nul && echo ✓ HTML标签结束正确
echo.

echo [4/10] 检查关键CSS特性...
findstr /C:"backdrop-filter" assets\css\style.css >nul && echo ✓ 磨砂玻璃效果实现
findstr /C:"@media" assets\css\style.css >nul && echo ✓ 响应式设计实现
findstr /C:"glass-effect" assets\css\style.css >nul && echo ✓ 玻璃效果类定义
echo.

echo [5/10] 验证JavaScript功能...
findstr /C:"DOMContentLoaded" assets\js\main.js >nul && echo ✓ DOM加载事件绑定
findstr /C:"IntersectionObserver" assets\js\main.js >nul && echo ✓ 交叉观察器实现
findstr /C:"setupNavigation" assets\js\main.js >nul && echo ✓ 导航功能实现
echo.

echo [6/10] 检查八大核心模块...
findstr /C:"id=\"about\"" index.html >nul && echo ✓ 个人简介模块
findstr /C:"id=\"education\"" index.html >nul && echo ✓ 教育背景模块
findstr /C:"id=\"projects\"" index.html >nul && echo ✓ 项目经历模块
findstr /C:"id=\"skills\"" index.html >nul && echo ✓ 技能展示模块
findstr /C:"id=\"research\"" index.html >nul && echo ✓ 研究成果模块
findstr /C:"id=\"interests\"" index.html >nul && echo ✓ 研究方向模块
findstr /C:"id=\"awards\"" index.html >nul && echo ✓ 荣誉奖项模块
findstr /C:"id=\"contact\"" index.html >nul && echo ✓ 联系方式模块
echo.

echo [7/10] 验证外部资源引用...
findstr /C:"picocss" index.html >nul && echo ✓ Pico CSS框架引用
findstr /C:"fonts.googleapis" index.html >nul && echo ✓ Google Fonts引用
echo.

echo [8/10] 检查SEO优化...
if exist "_includes\seo.html" (echo ✓ SEO组件存在) else (echo ⚠ 建议添加SEO组件)
findstr /C:"meta name=" index.html >nul && echo ✓ Meta标签定义
echo.

echo [9/10] 验证无障碍访问性...
findstr /C:"alt=" index.html >nul && echo ✓ 图片alt属性
findstr /C:"aria-" index.html >nul && echo ✓ ARIA标签使用
echo.

echo [10/10] 启动本地测试服务器...
echo 请选择启动方式：
echo 1. npm start (需要package.json)
echo 2. Python服务器 (需要Python)
echo 3. Node.js http-server
echo 4. 跳过服务器启动
echo.

set /p choice="请输入选择 (1-4): "

if "%choice%"=="1" (
    if exist "package.json" (
        echo 启动npm服务器...
        start "" npm start
    ) else (
        echo 错误：缺少package.json文件
    )
) else if "%choice%"=="2" (
    echo 启动Python服务器...
    start "" python -m http.server 8080
) else if "%choice%"=="3" (
    echo 启动Node.js服务器...
    start "" npx http-server . -p 8080 -o
) else (
    echo 跳过服务器启动
)

echo.
echo ==================== 验证完成 ====================
echo 请在浏览器中访问 http://localhost:8080 进行手动测试
echo 测试要点：
echo - 检查所有模块内容显示正常
echo - 测试响应式布局效果
echo - 验证导航链接功能
echo - 测试移动端菜单
echo - 检查表单提交功能
pause