# 🛡️ Server Security Dashboard / داشبورد امنیت سرور

A comprehensive and beautiful Bash script for monitoring Linux server security with visual color-coded output.  
یک اسکریپت کامل و زیبا برای مانیتورینگ امنیت سرور لینوکس با خروجی رنگی و بصری.

---

![Bash](https://img.shields.io/badge/Bash-Script-green.svg)  
![License](https://img.shields.io/badge/License-MIT-blue.svg)  
![Platform](https://img.shields.io/badge/Platform-Linux-lightgrey.svg)  
![Version](https://img.shields.io/badge/Version-1.0.0-cyan.svg)

---

## ✨ Features / ویژگی‌ها

- 📊 **System Status Monitoring** (CPU, Memory, Disk)  
  مانیتورینگ وضعیت سیستم (CPU، رم، دیسک)
- 🔐 **Security Checks** (Failed logins, Open ports, Sensitive files)  
  بررسی‌های امنیتی (لاگین ناموفق، پورت‌های باز، فایل‌های حساس)
- 🚀 **Service Status** (SSH, Nginx, MySQL, Docker, etc.)  
  وضعیت سرویس‌ها (SSH، Nginx، MySQL، Docker و ...)
- 🔔 **Color-coded Alerts** (Based on severity levels)  
  هشدارهای رنگی بر اساس سطح شدت
- 📝 **Real Security Event Reporting**  
  گزارش رویدادهای امنیتی واقعی
- 💡 **Actionable Security Recommendations**  
  پیشنهادهای امنیتی کاربردی
- 🎨 **Beautiful Visual Interface**  
  رابط کاربری زیبا و رنگی

---

## 🚀 Installation / نصب

### Prerequisites / پیش‌نیازها

```bash
# For Debian/Ubuntu systems:
sudo apt update && sudo apt install sysstat

# For RHEL/CentOS systems:
sudo yum install sysstat

# For Arch systems:
sudo pacman -S sysstat
```

### Quick Setup / راه‌اندازی سریع

```bash
# Download the script
curl -O https://raw.githubusercontent.com/HamedAsoodeh/server-security-dashboard/main/security_dashboard.sh

# Make it executable
chmod +x security_dashboard.sh

# Run it
./security_dashboard.sh
```

---

## 🎯 Usage / استفاده

### Basic Usage / استفاده پایه

```bash
./security_dashboard.sh
```

### Real-time Monitoring (every 5 minutes) / مانیتورینگ زنده (هر ۵ دقیقه)

```bash
watch -n 300 ./security_dashboard.sh
```

### Automated Daily Checks with Cron / بررسی روزانه خودکار با Cron

```bash
crontab -e
# Add this line to run daily at 2 AM:
0 2 * * * /path/to/security_dashboard.sh
```

---

## 📊 Sample Output / نمونه خروجی

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


## 🤝 Contributing / مشارکت

- Fork the project / پروژه را Fork کنید
- Create your feature branch / شاخه جدید ایجاد کنید
- Commit your changes / تغییرات را ثبت کنید
- Push to the branch / به شاخه ارسال کنید
- Open a Pull Request / Pull Request باز کنید

---

## 📜 License / مجوز

This project is licensed under the MIT License - see the LICENSE file for details.  
این پروژه تحت مجوز MIT منتشر شده است - فایل LICENSE را ببینید.

---

## ⚠️ Security Notes / نکات امنیتی

- Always review code before execution / همیشه قبل از اجرا کد را بررسی کنید
- The script contains no sensitive information / اسکریپت حاوی اطلاعات حساس نیست
- Run with appropriate permissions / با سطح دسترسی مناسب اجرا کنید
- Regular monitoring enhances server security / مانیتورینگ منظم امنیت سرور را افزایش می‌دهد

---

## 📞 Support / پشتیبانی

- Open a GitHub Issue / باز کردن Issue در گیت‌هاب
- Check the Discussions / بررسی Discussions
- Email: your-email@example.com / ایمیل: your-email@example.com

---

## 🌟 Star History / تاریخچه ستاره‌ها

If you find this project useful, please give it a ⭐ on GitHub!  
اگر این پروژه برایتان مفید بود، لطفاً در گیت‌هاب به آن ⭐ بدهید!
