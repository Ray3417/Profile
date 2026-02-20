# PROFILE Project Verification Script

Write-Host "==================== PROFILE PROJECT VERIFICATION ====================" -ForegroundColor Green
Write-Host ""

# 1. Check project structure integrity
Write-Host "[1/8] Checking project structure..." -ForegroundColor Yellow
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

# 2. Check configuration files
Write-Host "[2/8] Checking configuration files..." -ForegroundColor Yellow
if (Test-Path "package.json") {
    Write-Host "✓ package.json - OK" -ForegroundColor Green
} else {
    Write-Host "⚠ package.json - Recommended" -ForegroundColor Yellow
}

if (Test-Path ".gitignore") {
    Write-Host "✓ .gitignore - OK" -ForegroundColor Green
} else {
    Write-Host "⚠ .gitignore - Recommended" -ForegroundColor Yellow
}

Write-Host ""

# 3. Check key features
Write-Host "[3/8] Checking key features..." -ForegroundColor Yellow

# Check CSS features
if (Select-String -Path "assets\css\style.css" -Pattern "backdrop-filter" -Quiet) {
    Write-Host "✓ Frosted glass effect implemented" -ForegroundColor Green
} else {
    Write-Host "✗ Missing frosted glass effect" -ForegroundColor Red
}

if (Select-String -Path "assets\css\style.css" -Pattern "@media" -Quiet) {
    Write-Host "✓ Responsive design implemented" -ForegroundColor Green
} else {
    Write-Host "✗ Missing responsive design" -ForegroundColor Red
}

Write-Host ""

# 4. Check JavaScript features
Write-Host "[4/8] Checking JavaScript features..." -ForegroundColor Yellow

if (Select-String -Path "assets\js\main.js" -Pattern "DOMContentLoaded" -Quiet) {
    Write-Host "✓ DOM loaded event binding" -ForegroundColor Green
} else {
    Write-Host "✗ Missing DOM loaded event" -ForegroundColor Red
}

if (Select-String -Path "assets\js\main.js" -Pattern "IntersectionObserver" -Quiet) {
    Write-Host "✓ Intersection Observer implemented" -ForegroundColor Green
} else {
    Write-Host "✗ Missing Intersection Observer" -ForegroundColor Red
}

Write-Host ""

# 5. Check eight core modules
Write-Host "[5/8] Checking eight core modules..." -ForegroundColor Yellow
$modules = @("about", "education", "projects", "skills", "research", "interests", "awards", "contact")

foreach ($module in $modules) {
    if (Select-String -Path "index.html" -Pattern "id=`"$module`"" -Quiet) {
        Write-Host "✓ $module module" -ForegroundColor Green
    } else {
        Write-Host "✗ $module module missing" -ForegroundColor Red
    }
}

Write-Host ""

# 6. Check external resources
Write-Host "[6/8] Checking external resources..." -ForegroundColor Yellow

if (Select-String -Path "index.html" -Pattern "picocss" -Quiet) {
    Write-Host "✓ Pico CSS framework referenced" -ForegroundColor Green
} else {
    Write-Host "⚠ Recommend adding Pico CSS reference" -ForegroundColor Yellow
}

Write-Host ""

# 7. File statistics
Write-Host "[7/8] File statistics..." -ForegroundColor Yellow
$htmlCount = (Get-ChildItem -Recurse -Filter "*.html").Count
$cssCount = (Get-ChildItem -Recurse -Filter "*.css").Count
$jsCount = (Get-ChildItem -Recurse -Filter "*.js").Count

Write-Host "HTML files: $htmlCount"
Write-Host "CSS files: $cssCount" 
Write-Host "JS files: $jsCount"

$totalFiles = $htmlCount + $cssCount + $jsCount
Write-Host "Total: $totalFiles files"

Write-Host ""

# 8. Local server options
Write-Host "[8/8] Local testing options..." -ForegroundColor Yellow
Write-Host "Available local server commands:" -ForegroundColor Cyan
Write-Host "npm start" -ForegroundColor White
Write-Host "python -m http.server 8080" -ForegroundColor White  
Write-Host "npx http-server . -p 8080 -o" -ForegroundColor White

Write-Host ""
Write-Host "==================== VERIFICATION COMPLETE ====================" -ForegroundColor Green

if ($allGood) {
    Write-Host "✓ All required files exist!" -ForegroundColor Green
} else {
    Write-Host "✗ Missing files found, please check error messages above" -ForegroundColor Red
}

Write-Host ""
Write-Host "Manual testing recommendations:" -ForegroundColor Yellow
Write-Host "1. Run one of the server commands for local testing"
Write-Host "2. Check all modules display correctly in browser"
Write-Host "3. Test responsive layout and mobile adaptation"
Write-Host "4. Verify navigation links and smooth scrolling"
Write-Host "5. Test contact form submission"