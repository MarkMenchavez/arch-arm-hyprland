function install_package() {
  local PKG_FILE=$1

  # Check if yay is installed
  if ! command -v yay  &> /dev/null; then
    echo "Error: 'yay' is not installed.  Please install it first"
    exit 1
  fi

  # Parse the package file:
  # - Strip inline and full-line comments
  # - ignore empty lines
  mapfile -t packages < <(sed 's/#.*//' "$PKG_FILE" | awk 'NF')

  # Check if there are packages to install
  if [ ${#packages[@]} -eq 0 ]; then
    echo "No packages to install. Please check $PKG_FILE"
    exit 0;
  fi

  # Synchronize package databases
  yay -Sy

  # Install all packages in a single yay call
  GOPATH="$HOME/.local/go" yay -S --needed --noconfirm "${packages[@]}"
   
}

function backup_original() {
  local file="$1"
  local backup="${2:-${file}.bak}"

  if [[ ! -f "$file" ]]; then
    echo "Error: $file does not exist."
    return 1
  fi

  if [[ ! -f "$backup" ]]; then
    sudo cp --preserve=all "$file" "$backup"
    sudo chmod -x  "$backup"
    echo "$backup created."
  fi
}
