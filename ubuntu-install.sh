#!/bin/bash
# this script is for Ubuntu and derivations, customize for your system

# update system
echo "Updating system..."
sudo apt-get update -y && sudo apt-get upgrade -y

# check if system update was successful
if [ $? -eq 0 ]; then
    echo "System update completed successfully!"
else
    echo "System update failed"
    exit 1
fi

# install zsh
echo "Installing zsh..."
sudo apt install zsh -y

# verify installation success
if [ $? -eq 0 ]; then
    echo "Zsh installation completed successfully!"
    # set zsh as the default shell
    chsh -s $(which zsh)
else
    echo "Zsh installation failed"
    exit 1
fi

# install powerlevel10k
echo "Installing powerlevel10k..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k

# check clone success
if [ $? -eq 0 ]; then
    echo "Successfully cloned powerlevel10k repository"
    
    # update .zshrc file
    echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc
    
    # check .zshrc update success
    if [ $? -eq 0 ]; then
        echo ".zshrc file update was successful"
        echo "Powerlevel10k installation completed successfully!"
    else
        echo "Failed to update .zshrc file"
        exit 1
    fi
else
    echo "Powerlevel10k installation failed"
    exit 1
fi

# URLs of fonts
font_urls=(
  "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf"
  "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf"
  "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf"
  "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf"
)

# Check if the ~/.fonts directory exists and create it if necessary
mkdir -p ~/.fonts

# Loop to download and install fonts
for font_url in "${font_urls[@]}"; do
  # Font filename
  font_filename=$(basename "$font_url" | sed 's/%20/ /g')

  # Download font
  wget -O ~/.fonts/"$font_filename" "$font_url"

  # Check if download was successful
  if [ $? -eq 0 ]; then
    echo "The font '$font_filename' was successfully downloaded."
  else
    echo "Failed to download the font '$font_filename'."
    echo "Please try downloading it manually."
    continue
  fi

  # Update font cache
  fc-cache -f -v ~/.fonts

  # Check if font was installed correctly
  if fc-list | grep -q "$font_filename"; then
    echo "The font '$font_filename' was installed successfully."
  else
    echo "Installation of the font '$font_filename' failed."
    echo "Please try installing it manually."
  fi
done

# Install bat
echo "Installing bat..."
sudo apt-get install bat -y

# check install success
if [ $? -eq 0 ]; then
    echo "Bat installation completed successfully!"
else
    echo "Bat installation failed"
fi

# Install exa
echo "Installing exa..."
sudo apt-get install exa -y

# check install success
if [ $? -eq 0 ]; then
    echo "Exa installation completed successfully!"
    echo "# Alias shell-commands-rus" >> ~/.zshrc
    echo 'alias l="exa -l --icon"' >> ~/.zshrc
else
    echo "Exa installation failed"
fi

# Install zinit
echo "Installing zinit..."
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"

# check install success
if [ $? -eq 0 ]; then
    echo "Zinit installation completed successfully!"
    echo "# Plugs zinit" >> ~/.zshrc
    echo "zinit light zdharma/fast-syntax-highlighting" >> ~/.zshrc
    echo "zinit light zsh-users/zsh-autosuggestions" >> ~/.zshrc
    echo "zinit light zsh-users/zsh-completions" >> ~/.zshrc
else
    echo "Zinit installation failed"
fi

echo "Please restart your terminal..."
