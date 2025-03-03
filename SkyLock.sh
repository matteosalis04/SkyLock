#!/bin/bash 
set -e # gestione errori 
##############################
###### System Backup  ########
##############################
##############################
##############################
######### By .MagicSale ######
##############################
##############################
###### version.1.0.0. ########
##############################

## Permission root
if [[ $EUID -ne 0 ]]; then 
    echo "Please run as root"
    exit 1 
fi

pass="15"
data=$(date +%Y-%m-%d_%H:%M)
whoami=$(whoami)

function generator() {
    password=$(tr -cd '[:alnum:]' < /dev/urandom | fold -w${pass} | head -n 1)
    echo $password > /root/key_backup/key-$data-$type.txt
    echo $password
}

function input() {
read -p "Which file do you want to save(ex: pdf, txt, jpg): " type
read -p "Enter the user(leave empty for all): " user

}

function SkyLock() {
    start=$(date +%S)
    find /home/$user -type f -name "*.$type" | while read -r file; do
        cp -r "$file" /backup/
    done    
    finish=$(date +%S)
}

function log() {
    Timestamp=$(($finish - $start))
    tot_file=$(ls -1 /backup | wc -l)
    size=$(du -sh /backup)
    echo "-----------------" >> "/var/log/backup_log.log"
    echo "-----------------" >> "/var/log/backup_log.log"
    echo "Backup eseguito il $data" >> "/var/log/backup_log.log"
    echo "Size: $size $size_bytes" >> "/var/log/backup_log.log"
    echo "Type: $type" >> "/var/log/backup_log.log"
    echo "Who: $whoami" >> "/var/log/backup_log.log"
    echo "Timestamp: $Timestamp" >> "/var/log/backup_log.log"
    echo "File: $tot_file" >> "/var/log/backup_log.log"
    echo "Path: /zip_backup/$file_backup.zip" >> "/var/log/backup_log.log"
}

function encryption() {
    gen_pass=$(generator)
    file_backup="backup-$data-$type"
    zip -P "$gen_pass" -r "/zip_backup/$file_backup.zip" "/backup"
}



function advanced() {
    read -p "Which directory do you want save: " path_dir
    start=$(date +%S)
    cp -r "$path_dir" /backup/
    finish=$(date +%S)
    encryption
    log
    clear
    echo "---------------------"
    echo "Backup Complete !!!"
    echo "---------------------"
    echo "Log: /var/log/backup_log.log"
    echo "Path: /zip_backup/$file_backup.zip"
    rm -rf /backup/*


}
function classic() {
    input
    SkyLock
    encryption
    log
    clear
    echo "---------------------"
    echo "Backup Complete !!!"
    echo "---------------------"
    echo "Log: /var/log/backup_log.log"
    ## echo "Key: /root/key_backup/key-$data-$type.txt"
    echo "Path: /zip_backup/$file_backup.zip"
    rm -rf /backup/*
    


}


function decrypt() {
    echo "Work in progress!!!"
    exit 0
}




function main() {
mkdir -p /zip_backup
mkdir -p /unzip_backup
mkdir -p /root/key_backup
mkdir -p /backup
clear
cat << "EOF"

 ______     __  __     __  __     __         ______     ______     __  __    
/\  ___\   /\ \/ /    /\ \_\ \   /\ \       /\  __ \   /\  ___\   /\ \/ /    
\ \___  \  \ \  _"-.  \ \____ \  \ \ \____  \ \ \/\ \  \ \ \____  \ \  _"-.  
 \/\_____\  \ \_\ \_\  \/\_____\  \ \_____\  \ \_____\  \ \_____\  \ \_\ \_\ 
  \/_____/   \/_/\/_/   \/_____/   \/_____/   \/_____/   \/_____/   \/_/\/_/ 
                        Developed by .MagicSale
                        Github: https://github.com/matteosalis04                                                   

EOF
echo "Welcome to the SkyLock - $whoami - $data"
echo "---------------------------------------------------------"
echo "1. Advanced Mode"
echo "2. Classic Mode"
echo "3. Decrypt Mode"
read -p "> " choice
if [[ "$choice" == "1" ]]; then
advanced
elif [[ "$choice" == "2" ]]; then
custom
elif [[ "$choice" == "3" ]]; then
classic
elif [[ "$choice" == "4" ]]; then
decrypt
else
echo "No choice!!"
exit 0
fi

}
main
