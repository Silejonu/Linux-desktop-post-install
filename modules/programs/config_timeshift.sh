## System backups with Timeshift ##
# Check disk size
disk_size=$(df --output=size / | tail -1)
# If disk is bigger than 200 GB, then install Timeshift…
if (( ${disk_size} > 209715200 )) ; then
  sudo apt install -y timeshift
  # … and run it weekly while keepin the two newest snapshots
  # backup all files from /
  # backup hidden files from ~
sudo tee /etc/timeshift.json << EOF > /dev/null
{
  "backup_device_uuid" : "$(findmnt / -o UUID -n)",
  "parent_device_uuid" : "",
  "do_first_run" : "false",
  "btrfs_mode" : "false",
  "include_btrfs_home_for_backup" : "false",
  "include_btrfs_home_for_restore" : "false",
  "stop_cron_emails" : "true",
  "btrfs_use_qgroup" : "true",
  "schedule_monthly" : "false",
  "schedule_weekly" : "true",
  "schedule_daily" : "false",
  "schedule_hourly" : "false",
  "schedule_boot" : "false",
  "count_monthly" : "2",
  "count_weekly" : "3",
  "count_daily" : "5",
  "count_hourly" : "6",
  "count_boot" : "5",
  "snapshot_size" : "0",
  "snapshot_count" : "0",
  "date_format" : "%Y-%m-%d %H:%M:%S",
  "exclude" : [
    "+ ${HOME}/.**",
    "+ /root/**"
  ],
  "exclude-apps" : [
  ]
}
EOF
# If the disk is smaller than 200 GB, remove Timeshift
else
  sudo apt purge -y timeshift
fi
