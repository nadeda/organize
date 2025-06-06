#!/bin/bash

# 스크립트에 실행 권한 부여
chmod +x "$(dirname "$0")/organize-subtitle.sh"

# 서비스 파일을 systemd 디렉토리에 복사
sudo cp "$(dirname "$0")/organize-subtitle.service" /etc/systemd/system/organize-subtitle@$USER.service

# systemd 재로드
sudo systemctl daemon-reload

# 서비스 활성화 및 시작
sudo systemctl enable organize-subtitle@$USER
sudo systemctl start organize-subtitle@$USER

echo "서비스가 설치되었습니다. 상태를 확인하려면 다음 명령어를 실행하세요:"
echo "sudo systemctl status organize-subtitle@$USER"
echo "로그를 확인하려면 다음 명령어를 실행하세요:"
echo "tail -f ~/.local/log/organize/organize-subtitle.log" 