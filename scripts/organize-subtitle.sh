#!/bin/bash

# 스크립트가 있는 디렉토리로 이동
cd "$(dirname "$0")"

# 로그 디렉토리 생성
LOG_DIR="$HOME/.local/log/organize"
mkdir -p "$LOG_DIR"

# 로그 파일 설정
LOG_FILE="$LOG_DIR/organize-subtitle.log"

# organize 실행
echo "$(date): organize 자막 생성 서비스 시작" >> "$LOG_FILE"
organize watch /home/woojinens/.local/state/config/subtitle.yaml >> "$LOG_FILE" 2>&1 