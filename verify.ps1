# PROFILE项目验证脚本 (简化版)

Write-Host "==================== PROFILE项目验证脚本 ====================" -ForegroundColor Green
Write-Host ""

# 1. 检查项目结构完整性
Write-Host "[1/8] 检查项目结构完整性..." -ForegroundColor Yellow
$requiredFiles = @(
    "index.html",
    "_layouts\default.html", 
    "_includes\header.html",
    "_includes\footer.html",
    "assets\css\style.css",
    "assets\js\main.js",
    ".nojekyll"
)

$allGood = $true
foreach ($file in $requiredFiles) {
    if (Test-Path $file) {
        Write-Host "✓ $file - OK" -ForegroundColor Green
    } else {
        Write-Host "✗ $file - MISSING" -ForegroundColor Red
        $allGood = $false
    }
}

Write-Host ""

# 2. 检查配置文件
Write-Host "[2/8] 检查配置文件..." -ForegroundColor Yellow
if (Test-Path "package.json") {
    Write-Host "✓ package.json - OK" -ForegroundColor Green
} else {
    Write-Host "⚠ package.json - 建议添加" -ForegroundColor Yellow
}

if (Test-Path ".gitignore") {
    Write-Host "✓ .gitignore - OK" -ForegroundColor Green
} else {
    Write-Host "⚠ .gitignore - 建议添加" -ForegroundColor Yellow
}

Write-Host ""

# 3. 检查关键功能词
Write-Host "[3/8] 检查关键功能实现..." -ForegroundColor Yellow

# 检查CSS功能
if (Select-String -Path "assets\css\style.css" -Pattern "backdrop-filter" -Quiet) {
    Write-Host "✓ 磨砂玻璃效果实现" -ForegroundColor Green
} else {
    Write-Host "✗ 缺少磨砂玻璃效果" -ForegroundColor Red
}

if (Select-String -Path "assets\css\style.css" -Pattern "@media" -Quiet) {
    Write-Host "✓ 响应式设计实现" -ForegroundColor Green
} else {
    Write-Host "✗ 缺少响应式设计" -ForegroundColor Red
}

Write-Host ""

# 4. 检查JavaScript功能
Write-Host "[4/8] 检查JavaScript功能..." -ForegroundColor Yellow

if (Select-String -Path "assets\js\main.js" -Pattern "DOMContentLoaded" -Quiet) {
    Write-Host "✓ DOM加载事件绑定" -ForegroundColor Green
} else {
    Write-Host "✗ 缺少DOM加载事件" -ForegroundColor Red
}

if (Select-String -Path "assets\js\main.js" -Pattern "IntersectionObserver" -Quiet) {
    Write-Host "✓ 交叉观察器实现" -ForegroundColor Green
} else {
    Write-Host "✗ 缺少交叉观察器" -ForegroundColor Red
}

Write-Host ""

# 5. 检查八大模块
Write-Host "[5/8] 检查八大核心模块..." -ForegroundColor Yellow
$modules = @("about", "education", "projects", "skills", "research", "interests", "awards", "contact")

foreach ($module in $modules) {
    if (Select-String -Path "index.html" -Pattern "id=`"$module`"" -Quiet) {
        Write-Host "✓ $module 模块" -ForegroundColor Green
    } else {
        Write-Host "✗ $module 模块缺失" -ForegroundColor Red
    }
}

Write-Host ""

# 6. 检查外部资源
Write-Host "[6/8] 检查外部资源引用..." -ForegroundColor Yellow

if (Select-String -Path "index.html" -Pattern "picocss" -Quiet) {
    Write-Host "✓ Pico CSS框架引用" -ForegroundColor Green
} else {
    Write-Host "⚠ 建议添加Pico CSS引用" -ForegroundColor Yellow
}

Write-Host ""

# 7. 文件统计
Write-Host "[7/8] 文件统计..." -ForegroundColor Yellow
$htmlCount = (Get-ChildItem -Recurse -Filter "*.html").Count
$cssCount = (Get-ChildItem -Recurse -Filter "*.css").Count
$jsCount = (Get-ChildItem -Recurse -Filter "*.js").Count

Write-Host "HTML文件: $htmlCount 个"
Write-Host "CSS文件: $cssCount 个" 
Write-Host "JS文件: $jsCount 个"

$totalFiles = $htmlCount + $cssCount + $jsCount
Write-Host "总计: $totalFiles 个文件"

Write-Host ""

# 8. 启动服务器选项
Write-Host "[8/8] 本地测试选项..." -ForegroundColor Yellow
Write-Host "可选的本地服务器启动命令：" -ForegroundColor Cyan
Write-Host "npm start" -ForegroundColor White
Write-Host "python -m http.server 8080" -ForegroundColor White  
Write-Host "npx http-server . -p 8080 -o" -ForegroundColor White

Write-Host ""
Write-Host "==================== 验证完成 ====================" -ForegroundColor Green

if ($allGood) {
    Write-Host "✓ 所有必需文件都存在！" -ForegroundColor Green
} else {
    Write-Host "✗ 发现缺失文件，请检查上面的错误信息" -ForegroundColor Red
}

Write-Host ""
Write-Host "手动测试建议：" -ForegroundColor Yellow
Write-Host "1. 运行其中一个服务器命令启动本地测试"
Write-Host "2. 在浏览器中检查所有模块显示正常"
Write-Host "3. 测试响应式布局和移动端适配"
Write-Host "4. 验证导航链接和平滑滚动功能"
Write-Host "5. 测试联系表单提交功能"
