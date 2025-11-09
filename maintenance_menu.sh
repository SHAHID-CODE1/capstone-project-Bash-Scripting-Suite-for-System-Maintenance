#!/usr/bin/env bash
# maintenance_menu.sh - menu to run scripts in this suite
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

prompt_continue() {
  read -rp "Press Enter to return to menu..."
}

while true; do
  clear
  echo "=== Maintenance Suite Menu ==="
  echo "1) Create backup (backup.sh)"
  echo "2) System update & cleanup (update_cleanup.sh)"
  echo "3) Monitor logs (log_monitor.sh)"
  echo "4) Run all: backup -> update -> log tail (interactive)"
  echo "5) Exit"
  read -rp "Choose an option [1-5]: " opt

  case "$opt" in
    1)
      read -rp "Source directory (default: \$HOME): " src
      read -rp "Destination dir (default: ./backups): " dest
      "$BASE_DIR/backup.sh" "${src:-$HOME}" "${dest:-$BASE_DIR/backups}"
      prompt_continue
      ;;
    2)
      echo "This will run apt update/upgrade and cleanup (requires sudo)."
      read -rp "Continue? [y/N]: " ok
      if [[ "$ok" =~ ^[Yy]$ ]]; then
        sudo "$BASE_DIR/update_cleanup.sh"
      fi
      prompt_continue
      ;;
    3)
      read -rp "Log file (default: /var/log/syslog): " logfile
      read -rp "Optional filter keyword (press Enter to skip): " filter
      "$BASE_DIR/log_monitor.sh" "${logfile:-/var/log/syslog}" "$filter"
      prompt_continue
      ;;
    4)
      echo "Running backup and update (interactive)..."
      "$BASE_DIR/backup.sh" "$HOME" "$BASE_DIR/backups"
      sudo "$BASE_DIR/update_cleanup.sh"
      echo "Tailing syslog for 5 lines to show recent events:"
      tail -n 20 /var/log/syslog || true
      prompt_continue
      ;;
    5)
      echo "Goodbye!"
      exit 0
      ;;
    *)
      echo "Invalid option"
      sleep 1
      ;;
  esac
done
