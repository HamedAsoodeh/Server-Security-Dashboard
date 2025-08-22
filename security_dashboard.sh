#!/bin/bash
# =============================================================================
# 🛡️ Server Security Dashboard - Safe for GitHub
# =============================================================================
# A comprehensive security monitoring script for Linux servers
# Version: 2.0.0
# License: MIT
# Author: HamedAsoodeh
# GitHub: https://github.com/HamedAsoodeh/server-security-dashboard
# =============================================================================

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Configuration
CPU_WARNING=70
CPU_CRITICAL=85
MEMORY_WARNING=75
MEMORY_CRITICAL=85
DISK_WARNING=70
DISK_CRITICAL=85
FAILED_LOGIN_WARNING=5

# Function to check requirements
check_requirements() {
    local missing=()
    local commands=("awk" "grep" "sed" "cut" "free" "df")
    
    for cmd in "${commands[@]}"; do
        if ! command -v "$cmd" &> /dev/null; then
            missing+=("$cmd")
        fi
    done
    
    if [ ${#missing[@]} -gt 0 ]; then
        echo -e "${YELLOW}⚠️ Missing required commands: ${missing[*]}${NC}"
        echo -e "${BLUE}💡 Install with: sudo apt install coreutils${NC}"
        return 1
    fi
    return 0
}

# Function to print status
print_status() {
    case "$2" in
        "good") echo -e "${GREEN}✅ $1${NC}" ;;
        "warning") echo -e "${YELLOW}⚠️  $1${NC}" ;;
        "error") echo -e "${RED}❌ $1${NC}" ;;
        "info") echo -e "${BLUE}🔵 $1${NC}" ;;
        *) echo -e "${CYAN}📌 $1${NC}" ;;
    esac
}

# Function to display progress bar
progress_bar() {
    local percentage=$1
    local width=20
    local filled=$(($width * $percentage / 100))
    local empty=$(($width - $filled))
    
    printf "["
    printf "%${filled}s" | tr ' ' '█'
    printf "%${empty}s" | tr ' ' '░'
    printf "] %3d%%" $percentage
}

# Function to get CPU usage
get_cpu_usage() {
    if command -v mpstat &> /dev/null; then
        mpstat 1 1 | awk '/Average:/ {printf "%.0f", 100 - $12}'
    elif command -v top &> /dev/null; then
        top -bn1 | grep "Cpu(s)" | awk '{printf "%.0f", $2 + $4}'
    else
        awk '/cpu /{usage=($2+$4)*100/($2+$4+$5)} END {printf "%.0f", usage}' /proc/stat
    fi
}

# Function to get real security events
get_real_security_events() {
    local security_patterns=(
        "Failed password"
        "Invalid user"
        "Authentication failure"
        "BREAK-IN ATTEMPT"
        "POSSIBLE BREAK-IN ATTEMPT"
        "brute force"
        "attack"
        "intrusion"
        "unauthorized"
    )
    
    local normal_patterns=(
        "sudo.*COMMAND.*grep"
        "sudo.*COMMAND.*tail"
        "sudo.*COMMAND.*cat"
        "sudo.*COMMAND.*view"
        "sudo.*COMMAND.*less"
        "sudo.*COMMAND.*more"
        "polkitd.*Error opening"
        "systemd-logind"
        "Started Session"
        "Closed Session"
    )
    
    local grep_cmd="grep -i '"
    for pattern in "${security_patterns[@]}"; do
        grep_cmd+="$pattern\|"
    done
    grep_cmd="${grep_cmd%\|}' /var/log/auth.log 2>/dev/null"
    
    for pattern in "${normal_patterns[@]}"; do
        grep_cmd+=" | grep -v '$pattern'"
    done
    
    eval "$grep_cmd | tail -10"
}

# Clear screen
clear

# Display header
echo -e "${BLUE}
╔══════════════════════════════════════════════════════════╗
║                 🛡️  SECURITY DASHBOARD 🛡️                 ║
║                   Version: 2.0.0                        ║
║                   License: MIT                          ║
╚══════════════════════════════════════════════════════════╝
${NC}"

echo -e "${CYAN}Server: $(hostname)${NC}"
echo -e "${CYAN}Date: $(date)${NC}"
echo "══════════════════════════════════════════════════════════"

# Check requirements
if ! check_requirements; then
    echo -e "${YELLOW}⏳ Some features may not work without required packages${NC}"
    echo ""
fi

# 1. SYSTEM STATUS
echo -e "\n${YELLOW}📊 SYSTEM STATUS:${NC}"
echo "══════════════════════════════════════════════════════════"

# CPU Usage
cpu_usage=$(get_cpu_usage)
echo -n "CPU Usage: "; progress_bar $cpu_usage
if [ "$cpu_usage" -gt $CPU_CRITICAL ]; then
    echo -e " ${RED}[CRITICAL]${NC}"
elif [ "$cpu_usage" -gt $CPU_WARNING ]; then
    echo -e " ${YELLOW}[WARNING]${NC}"
else
    echo -e " ${GREEN}[NORMAL]${NC}"
fi

# Memory Usage
mem_usage=$(free | awk '/Mem/{printf "%.0f", $3/$2*100}')
echo -n "Memory Usage: "; progress_bar $mem_usage
if [ "$mem_usage" -gt $MEMORY_CRITICAL ]; then
    echo -e " ${RED}[CRITICAL]${NC}"
elif [ "$mem_usage" -gt $MEMORY_WARNING ]; then
    echo -e " ${YELLOW}[WARNING]${NC}"
else
    echo -e " ${GREEN}[NORMAL]${NC}"
fi

# Disk Usage
disk_usage=$(df / | awk '/\//{print $5}' | cut -d'%' -f1)
echo -n "Disk Usage: "; progress_bar $disk_usage
if [ "$disk_usage" -gt $DISK_CRITICAL ]; then
    echo -e " ${RED}[CRITICAL]${NC}"
elif [ "$disk_usage" -gt $DISK_WARNING ]; then
    echo -e " ${YELLOW}[WARNING]${NC}"
else
    echo -e " ${GREEN}[NORMAL]${NC}"
fi

# 2. SECURITY STATUS
echo -e "\n${YELLOW}🔐 SECURITY STATUS:${NC}"
echo "══════════════════════════════════════════════════════════"

# Failed login attempts
failed_logins=0
if [ -f /var/log/auth.log ]; then
    failed_logins=$(grep -c "Failed password" /var/log/auth.log 2>/dev/null || echo "0")
fi

if [ "$failed_logins" -eq 0 ]; then
    print_status "Failed Login Attempts: $failed_logins" "good"
elif [ "$failed_logins" -gt $FAILED_LOGIN_WARNING ]; then
    print_status "Failed Login Attempts: $failed_logins" "error"
else
    print_status "Failed Login Attempts: $failed_logins" "warning"
fi

# Open ports
if command -v ss &> /dev/null; then
    open_ports=$(ss -tuln 2>/dev/null | grep -c "LISTEN")
elif command -v netstat &> /dev/null; then
    open_ports=$(netstat -tuln 2>/dev/null | grep -c "LISTEN")
else
    open_ports="N/A"
fi
print_status "Open Ports: $open_ports" "info"

# Sensitive file changes
passwd_changes=$(find /etc/passwd -mtime -1 2>/dev/null | wc -l)
if [ "$passwd_changes" -eq 0 ]; then
    print_status "No recent changes to /etc/passwd" "good"
else
    print_status "Recent changes detected in /etc/passwd" "error"
fi

# 3. SERVICE STATUS
echo -e "\n${YELLOW}🔄 SERVICE STATUS:${NC}"
echo "══════════════════════════════════════════════════════════"

services=("ssh" "nginx" "apache2" "mysql" "postgresql" "docker")
for service in "${services[@]}"; do
    if systemctl is-active --quiet "$service" 2>/dev/null; then
        print_status "$service: RUNNING" "good"
    else
        if systemctl is-enabled --quiet "$service" 2>/dev/null; then
            print_status "$service: STOPPED" "error"
        else
            print_status "$service: NOT INSTALLED" "warning"
        fi
    fi
done

# 4. UPDATE STATUS
echo -e "\n${YELLOW}🔄 UPDATE STATUS:${NC}"
echo "══════════════════════════════════════════════════════════"

updates=0
if [ -f "/etc/centos-release" ]; then
    updates=$(yum check-update --security 2>/dev/null | grep -Ec '.*\.' || echo "0")
else
    updates=$(apt list --upgradable 2>/dev/null | grep -c security || echo "0")
fi

if [ "$updates" -eq 0 ]; then
    print_status "Security Updates: Up to date" "good"
else
    print_status "Security Updates: $updates available" "warning"
fi

# 5. SECURITY EVENTS
echo -e "\n${YELLOW}📝 SECURITY EVENTS:${NC}"
echo "══════════════════════════════════════════════════════════"

security_events=$(get_real_security_events)
if [ -z "$security_events" ]; then
    print_status "No security events detected" "good"
else
    echo -e "${YELLOW}Recent security events:${NC}"
    echo "$security_events"
fi

# 6. SYSTEM INFORMATION
echo -e "\n${YELLOW}ℹ️  SYSTEM INFORMATION:${NC}"
echo "══════════════════════════════════════════════════════════"

# Last boot time
if [ -f /proc/uptime ]; then
    uptime_seconds=$(awk '{print $1}' /proc/uptime)
    boot_time=$(date -d "now - $uptime_seconds seconds" '+%Y-%m-%d %H:%M:%S')
    echo "Last boot: $boot_time"
else
    echo "Last boot: $(who -b 2>/dev/null | awk '{print $3, $4}' || echo 'Unknown')"
fi

# Current users
echo "Current users: $(who | wc -l)"

# Uptime
echo "Uptime: $(uptime -p 2>/dev/null | sed 's/up //' || echo 'Unknown')"

# Today's failed logins
today=$(date +%Y-%m-%d)
if [ -f /var/log/auth.log ]; then
    failed_today=$(grep "$today" /var/log/auth.log 2>/dev/null | grep -c "Failed password" || echo "0")
    echo "Failed logins (today): $failed_today"
else
    echo "Failed logins (today): Log file not found"
fi

# 7. SECURITY RECOMMENDATIONS
echo -e "\n${YELLOW}💡 SECURITY RECOMMENDATIONS:${NC}"
echo "══════════════════════════════════════════════════════════"

if [ "$failed_logins" -gt 10 ]; then
    print_status "Consider implementing fail2ban for SSH protection" "warning"
fi

if [ "$disk_usage" -gt 90 ]; then
    print_status "Disk space is critically low. Consider cleaning up" "error"
fi

if command -v ufw &> /dev/null; then
    if ufw status | grep -q "inactive"; then
        print_status "UFW firewall is not active. Enable it for better security" "warning"
    fi
else
    print_status "UFW firewall is not installed. Consider installing it" "warning"
fi

# Footer
echo -e "\n${BLUE}╔══════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║              Run this script regularly!                  ║${NC}"
echo -e "${BLUE}║        Use 'watch -n 300 ./security_dashboard.sh'        ║${NC}"
echo -e "${BLUE}║             for continuous monitoring                    ║${NC}"
echo -e "${BLUE}╚══════════════════════════════════════════════════════════╝${NC}"

echo -e "${CYAN}📖 For more information, visit:${NC}"
echo -e "${CYAN}   https://github.com/your-username/server-security-dashboard${NC}"

