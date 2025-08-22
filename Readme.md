# 🛡️ Server Security Dashboard

A comprehensive and beautiful Bash script for monitoring Linux server security with visual color-coded output.

---

![Bash](https://img.shields.io/badge/Bash-Script-green.svg)  
![License](https://img.shields.io/badge/License-MIT-blue.svg)  
![Platform](https://img.shields.io/badge/Platform-Linux-lightgrey.svg)  
![Version](https://img.shields.io/badge/Version-1.0.0-cyan.svg)

---

## ✨ Features

- 📊 **System Status Monitoring** (CPU, Memory, Disk)
- 🔐 **Security Checks** (Failed logins, Open ports, Sensitive files)
- 🚀 **Service Status** (SSH, Nginx, MySQL, Docker, etc.)
- 🔔 **Color-coded Alerts** (Based on severity levels)
- 📝 **Real Security Event Reporting**
- 💡 **Actionable Security Recommendations**
- 🎨 **Beautiful Visual Interface**

---

## 🚀 Installation

### Prerequisites

```bash
# For Debian/Ubuntu systems:
sudo apt update && sudo apt install sysstat

# For RHEL/CentOS systems:
sudo yum install sysstat

# For Arch systems:
sudo pacman -S sysstat
```

### Quick Setup

```bash
# Download the script
curl -O https://raw.githubusercontent.com/HamedAsoodeh/server-security-dashboard/main/security_dashboard.sh

# Make it executable
chmod +x security_dashboard.sh

# Run it
./security_dashboard.sh
```

---

## 🎯 Usage

### Basic Usage

```bash
./security_dashboard.sh
```

### Real-time Monitoring (every 5 minutes)

```bash
watch -n 300 ./security_dashboard.sh
```

### Automated Daily Checks with Cron

```bash
crontab -e
# Add this line to run daily at 2 AM:
0 2 * * * /path/to/security_dashboard.sh
```

---

## 📊 Sample Output

```text
╔══════════════════════════════════════════════════════════╗
║                 🛡️  SECURITY DASHBOARD 🛡️                 ║
╚══════════════════════════════════════════════════════════╝

Server: myserver.example.com
Date: Fri Aug 22 21:15:30 +0330 2025

📊 SYSTEM STATUS:
CPU Usage: [██████████░░░░░░░░░░] 45% ✅ [NORMAL]
Memory Usage: [████████████████░░░░] 75% ⚠️ [WARNING]
Disk Usage: [██████████░░░░░░░░░░] 42% ✅ [NORMAL]

🔐 SECURITY STATUS:
✅ Failed Login Attempts: 0
🔵 Open Ports: 12
✅ No recent changes to /etc/passwd

🔄 SERVICE STATUS:
✅ ssh: RUNNING
✅ nginx: RUNNING
✅ mysql: RUNNING
⚠️ docker: NOT INSTALLED
```

---

## 🤝 Contributing

- Fork the project
- Create your feature branch
- Commit your changes
- Push to the branch
- Open a Pull Request

---

## 📜 License

This project is licensed under the MIT License - see the LICENSE file for details.

---

## ⚠️ Security Notes

- Always review code before execution
- The script contains no sensitive information
- Run with appropriate permissions
- Regular monitoring enhances server security

---

## 📞 Support

- Open a GitHub Issue
- Check the Discussions
- Email: hamedasoodeh@gmail.com

---

## 🌟 Star History

If you find this project useful, please give it a ⭐ on GitHub!
