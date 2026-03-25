# 自动同步脚本 - 将本地更改推送到 GitHub
# 用法：右键运行此脚本，或在 PowerShell 中执行 .\Sync-To-GitHub.ps1

$ErrorActionPreference = "Stop"
$repoPath = "C:\Users\15432\Desktop\my-personal-website"

Write-Host "====================================" -ForegroundColor Cyan
Write-Host "  个人网站自动同步到 GitHub" -ForegroundColor Cyan
Write-Host "====================================" -ForegroundColor Cyan
Write-Host ""

Set-Location $repoPath

# 检查是否有更改
$status = git status --porcelain

if ([string]::IsNullOrWhiteSpace($status)) {
    Write-Host "✅ 没有需要同步的更改" -ForegroundColor Green
} else {
    Write-Host " 检测到以下更改:" -ForegroundColor Yellow
    Write-Host $status
    Write-Host ""
    
    # 添加所有更改
    git add .
    
    # 提交
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    git commit -m "Auto-sync: $timestamp"
    
    # 推送
    Write-Host "🚀 推送到 GitHub..." -ForegroundColor Cyan
    git push
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host ""
        Write-Host "✅ 同步成功！" -ForegroundColor Green
        Write-Host "🌐 网站地址：https://weypt.github.io/-my-personal-website/" -ForegroundColor Cyan
    } else {
        Write-Host ""
        Write-Host "❌ 推送失败，请检查网络连接" -ForegroundColor Red
    }
}

Write-Host ""
Write-Host "按任意键退出..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
