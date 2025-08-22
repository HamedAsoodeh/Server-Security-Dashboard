# 🛡️ Server Security Dashboard

A comprehensive and beautiful bash script for monitoring Linux server security with visual color-coded output.

![Bash](https://img.shields.io/badge/Bash-Script-green.svg)
![License](https://img.shields.io/badge/License-MIT-blue.svg)
![Platform](https://img.shields.io/badge/Platform-Linux-lightgrey.svg)
![Version](https://img.shields.io/badge/Version-1.0.0-cyan.svg)

## ✨ Features

- 📊 **System Status Monitoring** (CPU, Memory, Disk)
- 🔐 **Security Checks** (Failed logins, Open ports, Sensitive files)
- 🚀 **Service Status** (SSH, Nginx, MySQL, Docker, etc.)
- 🔔 **Color-coded Alerts** (Based on severity levels)
- 📝 **Real Security Event Reporting**
- 💡 **Actionable Security Recommendations**
- 🎨 **Beautiful Visual Interface**

## 🚀 Installation

### Prerequisites

```bash
# For Debian/Ubuntu systems:
sudo apt update && sudo apt install sysstat

# For RHEL/CentOS systems:
sudo yum install sysstat

# For Arch systems:
sudo pacman -S sysstat
Quick Setup
bash
# Download the script
curl -O https://raw.githubusercontent.com/your-username/server-security-dashboard/main/security_dashboard.sh

# Make it executable
chmod +x security_dashboard.sh

# Run it
./security_dashboard.sh
🎯 Usage
Basic Usage
bash
./security_dashboard.sh
Real-time Monitoring (every 5 minutes)
bash
watch -n 300 ./security_dashboard.sh
Automated Daily Checks with Cron
bash
crontab -e
# Add this line to run daily at 2 AM:
0 2 * * * /path/to/security_dashboard.sh
📊 Sample Output
text
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
🛡️ Dashboard Sections
1. System Status
CPU, Memory, and Disk usage monitoring

Graphical progress bars

Automatic alerts based on configurable thresholds

2. Security Status
Failed login attempt tracking

Open port detection

Sensitive file change monitoring

3. Service Status
Critical service status checking

Missing service detection

Stopped service alerts

4. Security Events
Intelligent filtering of normal system logs

Real security threat detection

Attack pattern analysis

5. Security Recommendations
Context-aware security suggestions

Proactive improvement advice

Prevention recommendations

🔧 Configuration
Threshold Settings
You can modify alert thresholds in the script:

bash
# Default thresholds:
CPU_WARNING=70
CPU_CRITICAL=85
MEMORY_WARNING=75
MEMORY_CRITICAL=85
DISK_WARNING=70
DISK_CRITICAL=85
FAILED_LOGIN_WARNING=5
Adding New Services
To monitor additional services:

bash
# Edit the services array:
services=("ssh" "nginx" "mysql" "postgresql" "docker" "your-service")
🤝 Contributing
We welcome contributions! Please feel free to submit pull requests or open issues.

Fork the project

Create your feature branch (git checkout -b feature/AmazingFeature)

Commit your changes (git commit -m 'Add some AmazingFeature')

Push to the branch (git push origin feature/AmazingFeature)

Open a Pull Request

📜 License
This project is licensed under the MIT License - see the LICENSE file for details.

⚠️ Security Notes
Always review code before execution

The script contains no sensitive information

Run with appropriate permissions

Regular monitoring enhances server security

📞 Support
If you have questions or issues:

Open a GitHub Issue

Check the Discussions

Email: your-email@example.com

🌟 Star History
If you find this project useful, please give it a ⭐ on GitHub!

Developed with ❤️ for the Open Source Community
