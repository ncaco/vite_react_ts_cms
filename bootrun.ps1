# Spring Boot 백엔드 서버 실행 스크립트
Write-Host "Spring Boot 백엔드 서버를 시작합니다..." -ForegroundColor Cyan

# 현재 작업 디렉토리 저장
$originalLocation = Get-Location

try {
    # 백엔드 디렉토리로 이동
    Set-Location -Path "$PSScriptRoot\backend"
    
    # Gradle 실행
    Write-Host "명령어 실행: ./gradlew bootRun" -ForegroundColor Yellow
    ./gradlew bootRun
}
finally {
    # 스크립트 종료 시 원래 위치로 복원
    Set-Location -Path $originalLocation
} 