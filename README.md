# Linux Server Monitoring Project

## Project Overview
A Linux Server Monitoring project built using Bash scripting on Red Hat Enterprise Linux 9.

This project monitors important server resources and generates health reports automatically.

## Technologies Used

- Red Hat Enterprise Linux 9
- Bash Scripting
- Cron Jobs
- Linux System Administration

## Features

- CPU Usage Monitoring
- RAM Usage Monitoring
- Disk Usage Monitoring
- Running Service Monitoring
- Log File Generation
- CPU Threshold Alert
- Memory Threshold Alert
- Disk Threshold Alert
- Automated Execution using Cron

## Project Structure

linux-server-monitoring/

├── logs/
│   └── server_monitor.log

├── scripts/
│   └── monitor.sh

└── README.md

## How It Works

1. Bash script collects server health information.
2. CPU, Memory, Disk usage is monitored.
3. Service status is checked.
4. Reports are stored in log files.
5. Cron job runs the script automatically every 5 minutes.

## Cron Configuration
```bash
*/5 * * * * /root/linux-server-monitoring/scripts/monitor.sh    
CPU Usage is Normal
Memory Usage is Normal
Disk Usage is Normal

Service Status:
sshd : Running
crond : Running
NetworkManager : Running
G
## Screenshots

### Server Monitoring Output

![Monitoring Output](screenshots/project-screenshots/Screenshot%202026-07-20%20212226.png)

### Cron Job Configuration

![Cron Job](screenshots/project-screenshots/Screenshot%202026-07-20%20212357.png)

### Service Monitoring

![Service Status](screenshots/project-screenshots/Screenshot%202026-07-20%20212512.png)

### Project Structure

![Project Structure](screenshots/project-screenshots/Screenshot%202026-07-20%20212610.png)
