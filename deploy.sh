#!/usr/bin/env bash
set -euo pipefail

APP_DIR="/opt/monitor"
VENV_DIR="$APP_DIR/venv"

mkdir -p "$APP_DIR"
chown -R administrator:administrator "$APP_DIR"

cp -r ./* "$APP_DIR/"

if [ ! -d "$VENV_DIR" ]; then
  python3 -m venv "$VENV_DIR"
fi

"$VENV_DIR/bin/pip" install --upgrade pip
"$VENV_DIR/bin/pip" install -r "$APP_DIR/requirements.txt"

systemctl restart monitor
