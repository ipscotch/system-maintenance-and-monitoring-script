# Maintenance and Monitoring 

This repository contains scripts for maintaining and monitoring server health and disk space. It includes two primary scripts:

## Scripts

### 1. Disk Cleanup (`disk-cleanup.sh`)

This script is designed to clean up specified directories by removing files older than a certain number of days. It helps in managing disk space on servers by periodically cleaning temporary directories.

**Features:**
- Configurable directories and file age for cleanup.
- Logging of cleanup activity.

### 2. System Health Monitoring (`system-health-monitoring.sh`)

This script monitors the server's CPU, memory, and disk usage against predefined thresholds. If any of the metrics exceed these thresholds, an alert email is sent to the administrator.

**Features:**
- Monitoring CPU, memory, and disk usage.
- Configurable threshold values for each metric.
- Alerting via email for any metric exceeding its threshold.
- Logging of all monitored metrics.

## Usage

To use these scripts, clone the repository to your server and set the executable permission on the scripts:

```bash
chmod +x disk-cleanup.sh system-health-monitoring.sh
```
You can run these scripts manually or set them up as cron jobs for periodic execution.

## Configuration

- For `disk-cleanup.sh`, you can modify the `CLEANUP_DIRS` and `FILE_AGE` variables as needed.
- For `system-health-monitoring.sh`, adjust the `CPU_THRESHOLD`, `MEM_THRESHOLD`, `DISK_THRESHOLD`, and `ALERT_EMAIL` variables according to your requirements.

## Logging

- Cleanup activities are logged in `/var/log/disk_cleanup.log`.
- System health metrics are logged in `/var/log/server_health.log`.

## Dependencies

- The `system-health-monitoring.sh` script requires the mail utility to send alert emails. Ensure it is installed and configured on your server.

## Contributing

Contributions to improve the scripts or add new features are welcome. Please submit a pull request or open an issue to discuss your ideas.

## License

This project is open source and available under the MIT License.



