backup() {
    curdir=$PWD
    device='m3'

    cd ~/Backup
    source env/bin/activate
    last_backup_str=$(python3 check-backup.py $device)
    last_backup_exit_code=$?

    if [ $last_backup_exit_code -ne 0 ]; then
      echo "Last backup: $last_backup_str. Run 'backup'"
    fi

    cd $curdir
    deactivate
    alias backup='cd ~/Backup && sudo make backup && sudo make backup-local && cd -'
}

# If you have backups configured
#backup