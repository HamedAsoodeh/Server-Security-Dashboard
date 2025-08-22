# 🛡️ داشبورد امنیت سرور

یک اسکریپت کامل و زیبا برای مانیتورینگ امنیت سرور لینوکس با خروجی رنگی و بصری.

---

![](https://img.shields.io/badge/-Script-green.svg)  
![License](https://img.shields.io/badge/License-MIT-blue.svg)  
![Platform](https://img.shields.io/badge/Platform-Linux-lightgrey.svg)  
![Version](https://img.shields.io/badge/Version-1.0.0-cyan.svg)

---

## ✨ ویژگی‌ها

- 📊 **مانیتورینگ وضعیت سیستم** (CPU، رم، دیسک)
- 🔐 **بررسی‌های امنیتی** (لاگین ناموفق، پورت‌های باز، فایل‌های حساس)
- 🚀 **وضعیت سرویس‌ها** (SSH، Nginx، MySQL، Docker و ...)
- 🔔 **هشدارهای رنگی** (بر اساس سطح شدت)
- 📝 **گزارش رویدادهای امنیتی واقعی**
- 💡 **پیشنهادهای امنیتی کاربردی**
- 🎨 **رابط کاربری زیبا و رنگی**

---

## 🚀 نصب

### پیش‌نیازها

```
# برای Debian/Ubuntu
sudo apt update && sudo apt install sysstat

# برای RHEL/CentOS
sudo yum install sysstat

# برای Arch
sudo pacman -S sysstat
```

### راه‌اندازی سریع

```
# دانلود اسکریپت
curl -O https://raw.githubusercontent.com/HamedAsoodeh/server-security-dashboard/main/security_dashboard.sh

# اجراپذیر کردن
chmod +x security_dashboard.sh

# اجرا
./security_dashboard.sh
```

---

## 🎯 استفاده

### استفاده پایه

```
./security_dashboard.sh
```

### مانیتورینگ زنده (هر ۵ دقیقه)

```
watch -n 300 ./security_dashboard.sh
```

### بررسی روزانه خودکار با Cron

```
crontab -e
# اجرای روزانه ساعت ۲ صبح
0 2 * * * /path/to/security_dashboard.sh
```

---

## 📊 نمونه خروجی

```html
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


## 🤝 مشارکت
---
- پروژه را Fork کنید
- شاخه جدید ایجاد کنید
- تغییرات را ثبت کنید
- به شاخه ارسال کنید
- Pull Request باز کنید
---


## 📜 مجوز
---
این پروژه تحت مجوز MIT منتشر شده است - فایل LICENSE را ببینید.

---

## ⚠️ نکات امنیتی
---
- همیشه قبل از اجرا کد را بررسی کنید
- اسکریپت حاوی اطلاعات حساس نیست
- با سطح دسترسی مناسب اجرا کنید
- مانیتورینگ منظم امنیت سرور را افزایش می‌دهد

---

## 📞 پشتیبانی
---
- باز کردن Issue در گیت‌هاب
- بررسی Discussions
- ایمیل: hamedasoodeh@gmail.com

---

## 🌟 تاریخچه ستاره‌ها

اگر این پروژه برایتان مفید بود، لطفاً در گیت‌هاب به آن ⭐ بدهید!
