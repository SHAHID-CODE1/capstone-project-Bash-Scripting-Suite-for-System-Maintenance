# Capstone Project — Bash Scripting Suite for System Maintenance

**Author:** MD SHAHID ALAM  
**Roll No:** 2241001056 

**Project Title :** Bash Scripting Suite for System Maintenance  
**Course:** B.Tech (CSIT), ITER — SOA University  

---

## 📘 Project Overview
This project automates essential Linux system maintenance tasks using Bash scripts.  
It provides a simple, menu-driven interface to handle **backups**, **system updates**, and **log monitoring** efficiently.

---

## 🧩 Components

### 🗂️ 1. backup.sh
- Creates compressed backups (`.tar.gz`) of selected directories.
- Saves them with timestamps for easy tracking.

### ⚙️ 2. update_cleanup.sh
- Automatically updates all system packages using `apt`.
- Removes unnecessary packages and cleans cache files.

### 📜 3. log_monitor.sh
- Continuously monitors log files (default: `/var/log/syslog`).
- Supports optional keyword filtering for real-time log search.

### 🧭 4. maintenance_menu.sh
- Interactive Bash menu to execute all maintenance tasks easily.
- Options include:  
  1️⃣ Create backup  
  2️⃣ System update & cleanup  
  3️⃣ Monitor logs  
  4️⃣ Run all tasks sequentially  
  5️⃣ Exit  

---

## 🧠 Learning Outcomes
- Linux file system handling using Bash.  
- Process automation using scripting.  
- System resource management and log handling.  
- Integrating multiple Bash utilities into one cohesive tool.  

---

## 🖥️ Usage

### 1. Make all scripts executable:
```bash
chmod +x *.sh


