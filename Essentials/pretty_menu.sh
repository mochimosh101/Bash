# Function to print a box
print_box() {
    local text="$1"
    local len=${#text}
    local line=$(printf '#%.0s' $(seq 1 $((len + 4))))
    echo "$line"
    echo "#  $text  #"
    echo "$line"
}

# Check if sudo is installed, if not, install it
if ! command -v sudo &> /dev/null; then
    print_box "Installing sudo..."
    apt-get install -y sudo
    print_box "sudo installed."
fi

# Check if curl is installed, if not, install it
if ! command -v curl &> /dev/null; then
    print_box "Installing curl..."
    apt-get install -y curl
    print_box "curl installed."
fi

# Update and upgrade system if necessary
if ! apt list --upgradable 2>/dev/null | grep -qE '(^\S+\s+\S+\s+upgradable)'; then
    print_box "Updating and upgrading system..."
    apt-get update && apt-get upgrade -y
    print_box "System updated and upgraded."
fi

# Run the script
print_box "Running the script..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/mochimosh101/MochiBot/main/Menu.sh)"
print_box "Script execution completed."
