function print_box() {
  msg=$1
  designs=("boy" "capgirl" "cat" "columns" "cowsay" "dog" "face" "ian_jones" "mouse" "nuke" "parchment" "peek" "santa" "spring" "tux" "unicornthink")
  length=${#designs[@]}
  rand_index=$((RANDOM % length))
  rand_option=${designs[$rand_index+1]}
  echo "$1" | lolcat -f | boxes -d "$rand_option"
}

function get_computer_info() {
  battery=$1
  time=$(date +"%F %T")
  user=$(whoami)
  hostname=$(hostname)
  os_architecture=$(uname -m)

  # Check if the OS is macOS or Linux
  if [[ "$OSTYPE" == "darwin"* ]]; then
    cpu_brand=$(sysctl -a | grep 'machdep.cpu.brand_string' | cut -d':' -f2)
    total_ram=$(sysctl hw.memsize | awk '{print $2/1024/1024/1024 " GB"}')
    num_cpus=$(sysctl -n hw.ncpu)
    num_gpus=$(system_profiler SPDisplaysDataType | awk '/Total Number of Cores:/ {print $5}')
    current_ram_usage=$(vm_stat | awk -F" " '/Pages free:/ {free=$3} /Pages active:/ {active=$3} /Pages inactive:/ {inactive=$3} /Pages speculative:/ {speculative=$3} /Pages wired down:/ {wired=$3} END {used=(active + inactive + speculative + wired) * 4096; print used/1024/1024/1024 " GB"}')
  else
    cpu_brand=$(lscpu | grep "Model name" | sed -E 's/Model name:\s+//')
    total_ram=$(free -h | awk '/Mem:/ {print $2}')
    num_cpus=$(nproc)
    num_gpus=$(lspci | grep -i nvidia | wc -l) # Works for NVIDIA GPUs
    current_ram_usage=$(free -h | awk '/Mem:/ {print $3}')
  fi

  disk_space=$(df -H / | awk 'NR==2{print "" $2 " (" $4 " free)" }')
  ip_addr_2=$(timeout 2s curl -s ipv4.icanhazip.com 2> /dev/null)

  info="   whoami:      $user@$hostname
   chip:       $cpu_brand
   arch:        $os_architecture
   cpu:         $num_cpus cores ($num_gpus GPU)
   ram:         $total_ram 
   ram usage:   $current_ram_usage
   disk:        $disk_space
   ipv4:        $ip_addr_2
   battery:     $battery%
   time:        $time"

  echo "$info"
}

# Battery info: Works on macOS, skips on Ubuntu if no command found
if command -v pmset &> /dev/null; then
  battery=$(pmset -g batt | grep -Eo "[0-9]+%" | tr -d '%')
elif command -v upower &> /dev/null; then
  battery=$(upower -i $(upower -e | grep 'BAT') | grep -E "percentage" | awk '{print $2}' | tr -d '%')
else
  battery="N/A"
fi

welcome_msg=$(get_computer_info "$battery")
print_box "$welcome_msg"

# Only if the pwd is ~, then cd to ~/Desktop
if [[ $PWD == $HOME ]]; then
  if [[ "$OSTYPE" == "darwin"* ]]; then
    cd ~/Desktop
  fi
fi
