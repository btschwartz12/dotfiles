function print_box() {
  msg=$1
  designs=("boy" "capgirl" "cat" "columns" "cowsay" "dog" "face" "ian_jones" "mouse" "nuke" "parchment" "peek" "santa" "spring" "tux" "unicornthink")
  length=${#designs[@]}
  rand_index=$((RANDOM % length))
  rand_option=${designs[$rand_index+1]}
  # jp2a --colors --height=25 https://btschwartz.com/api/v1/pics/welcome
  echo $1 | lolcat -f | boxes -d $rand_option
}

function get_computer_info() {
  battery=$1
  last_backup=$2
  time=$(date +"%F %T")
  user=$(whoami)
  hostname=$(hostname)
  os_architecture=$(uname -m)
  cpu_brand=$(sysctl -a | grep 'machdep.cpu.brand_string' | cut -d':' -f2)
  cpu_usage=$(top -l 1 | grep -E "^CPU")
  memory_used=$(df -h | awk 'FNR == 2 {print $3}')
  memory_available=$(df -h | awk 'FNR == 2 {print $2}')
  ip_addr_2=$(timeout 2s curl -s ipv4.icanhazip.com 2> /dev/null) 
  # ip_addr=$(timeout 2s nslookup $(hostname) | grep -Eo '([0-9]*\.){3}[0-9]*' | head -n 1)
  # if [ $? -ne 0 ]; then
  #    ip_addr="n/a"
  # fi
  # # If ip_addr is empty
  # if [ -z "$ip_addr" ]; then
  #    ip_addr="n/a"
  # fi
  total_ram=$(sysctl hw.memsize | awk '{print $2/1024/1024/1024 " GB"}')
  current_ram_usage=$(vm_stat | awk -F" " '/Pages free:/ {free=$3} /Pages active:/ {active=$3} /Pages inactive:/ {inactive=$3} /Pages speculative:/ {speculative=$3} /Pages wired down:/ {wired=$3} END {used=(active + inactive + speculative + wired) * 4096; print used/1024/1024/1024 " GB"}')
  num_cpus=$(sysctl -n hw.ncpu)
  num_gpus=$(system_profiler SPDisplaysDataType | awk '/Total Number of Cores:/ {print $5}')
  disk_space=$(df -H / | awk 'NR==2{print "" $2 " (" $4 " free)" }')

  info="   whoami:      $user@$hostname
   chip:       $cpu_brand
   arch:        $os_architecture
   cpu:         $num_cpus cores ($num_gpus GPU)
   ram:         $total_ram 
   disk:        $disk_space
   ipv4:        $ip_addr_2
   battery:     $battery%
   last backup: $last_backup
   time:        $time"
  
  echo "$info"
}
