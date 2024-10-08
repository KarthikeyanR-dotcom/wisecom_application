CPU_THRESHOLD=80
MEMORY_THRESHOLD=80
DISK_THRESHOLD=80
LOG_FILE="/mnt/c/Users/karthik/git/logs/system_health.log"

timestamp() {
  date +"%Y-%m-%d %H:%M:%S"
}

check_cpu_usage() {
  CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
  CPU_INT=${CPU_USAGE%.*} 
  if [ "$CPU_INT" -gt "$CPU_THRESHOLD" ]; then
    echo "$(timestamp) - WARNING: CPU usage is above $CPU_THRESHOLD%. Current usage: $CPU_USAGE%" >> $LOG_FILE
  fi
}

check_memory_usage() {
  MEMORY_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
  MEMORY_INT=${MEMORY_USAGE%.*}
  if [ "$MEMORY_INT" -gt "$MEMORY_THRESHOLD" ]; then
    echo "$(timestamp) - WARNING: Memory usage is above $MEMORY_THRESHOLD%. Current usage: $MEMORY_USAGE%" >> $LOG_FILE
  fi
}

check_disk_usage() {
  DISK_USAGE=$(df / | grep / | awk '{print $5}' | sed 's/%//g')
  if [ "$DISK_USAGE" -gt "$DISK_THRESHOLD" ]; then
    echo "$(timestamp) - WARNING: Disk space usage is above $DISK_THRESHOLD%. Current usage: $DISK_USAGE%" >> $LOG_FILE
  fi
}

check_running_processes() {
  RUNNING_PROCESSES=$(ps aux | wc -l)
  echo "$(timestamp) - INFO: Currently $RUNNING_PROCESSES processes are running" >> $LOG_FILE
}

run_checks() {
  check_cpu_usage
  check_memory_usage
  check_disk_usage
  check_running_processes
}

run_checks
