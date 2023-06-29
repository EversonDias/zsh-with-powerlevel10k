#!/bin/bash
# this script is for Ubuntu and derivations, customize for your system

# update system
echo "\n #################################################"
echo "\n Updating system... \n"
echo "################################################## \n"
sudo apt-get update -y && sudo apt-get upgrade -y

# check if system update was successful
if [ $? -eq 0 ]; then
    echo "\n System update completed successfully! \n"
else
    echo "\n System update failed \n"
    exit 1
fi

# install zsh
echo "\n #################################################"
echo "\n Installing zsh... \n"
echo "################################################## \n"
sudo apt install zsh -y

# verify installation success
if [ $? -eq 0 ]; then
    echo "\n Zsh installation completed successfully! \n"
    # set zsh as the default shell
    chsh -s $(which zsh)
else
    echo "Zsh installation failed"
    exit 1
fi

# install powerlevel10k
echo "\n #################################################"
echo "\n Installing powerlevel10k... \n"
echo "################################################## \n"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k

# check clone success
if [ $? -eq 0 ]; then
    echo "\n Successfully cloned powerlevel10k repository \n"
    
    # update .zshrc file
    echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc
    
    # check .zshrc update success
    if [ $? -eq 0 ]; then
        echo "\n .zshrc file update was successful \n"
        echo "\n Powerlevel10k installation completed successfully! \n"
    else
        echo "\n Failed to update .zshrc file \n"
        exit 1
    fi
else
    echo "\n Powerlevel10k installation failed \n"
    exit 1
fi

echo "\n #################################################"
echo "\n install fonts \n"
echo "################################################## \n"
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
    echo "\n The font '$font_filename' was successfully downloaded. \n"
  else
    echo "\n Failed to download the font '$font_filename'. \n"
    echo "\n Please try downloading it manually. \n"
    continue
  fi

  # Update font cache
  fc-cache -f -v ~/.fonts

  # Check if font was installed correctly
  if fc-list | grep -q "$font_filename"; then
    echo "\n The font '$font_filename' was installed successfully. \n"
  else
    echo "\n Installation of the font '$font_filename' failed. \n"
    echo "\n Please try installing it manually. \n"
  fi
done

# Install bat
echo "\n #################################################"
echo "\n Installing bat... \n"
echo "################################################## \n"
sudo apt-get install bat -y

# check install success
if [ $? -eq 0 ]; then
    echo "\n Bat installation completed successfully! \n"
else
    echo "\n Bat installation failed \n"
fi

# Install exa
echo "\n #################################################"
echo "\n Installing exa... \n"
echo "################################################## \n"
sudo apt-get install exa -y

# check install success
if [ $? -eq 0 ]; then
    echo "\n Exa installation completed successfully! \n"
    echo "# Alias shell-commands-rus" >> ~/.zshrc
    echo 'alias l="exa -l --icons"' >> ~/.zshrc
    echo "use L instead of LS"
else
    echo "\n Exa installation failed \n"
fi

# Install zinit
echo "\n #################################################"
echo "\n Installing zinit... \n"
echo "################################################## \n"
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"

# check install success
if [ $? -eq 0 ]; then
    echo "\n Zinit installation completed successfully! \n"
    echo "# Plugs zinit" >> ~/.zshrc
    echo "zinit light zdharma/fast-syntax-highlighting" >> ~/.zshrc
    echo "zinit light zsh-users/zsh-autosuggestions" >> ~/.zshrc
    echo "zinit light zsh-users/zsh-completions" >> ~/.zshrc
else
    echo "\n Zinit installation failed \n"
fi

echo "\n Please restart your terminal... \n"
