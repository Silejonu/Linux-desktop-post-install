config_timeshift() {
  ## Sauvegardes du système avec Timeshift ##
  # Noter la taille du disque dur
  taille_disque=$(df --output=size / | tail -1)
  # Si le disque dur fait plus de 200 Go, alors…
  if (( ${taille_disque} > 209715200 )) ; then
    # Installer Timeshift
    sudo apt install -y timeshift
    # Lancer Timeshift mensuellement, et conserver les 2 snapshots les plus récents
    # sauvegarder tous les fichiers dans /
    # sauvegarder uniquement les fichiers cachés dans ~
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
  else
    # Désinstaller Timeshift
    sudo apt purge -y timeshift
  fi
}
