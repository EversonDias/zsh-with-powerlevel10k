#!/bin/bash
# this script is for Ubuntu and derivations, customize for your system

# update system
echo "\n#################################################"
echo "\nUpdating system...\n"
echo "##################################################\n"
sudo apt-get update -y && sudo apt-get upgrade -y

# check if system update was successful
if [ $? -eq 0 ]; then
    echo "\nSystem update completed successfully!\n"
else
    echo "\nSystem update failed\n"
    exit 1
fi

# install zsh
echo "\n#################################################"
echo "\nInstalling zsh...\n"
echo "##################################################\n"
sudo apt install zsh -y

# verify installation success
if [ $? -eq 0 ]; then
    echo "\nZsh installation completed successfully!\n"
    # set zsh as the default shell
    chsh -s $(which zsh)
else
    echo "Zsh installation failed"
    exit 1
fi

# install powerlevel10k
echo "\n#################################################"
echo "\nInstalling powerlevel10k...\n"
echo "##################################################\n"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k

# check clone success
if [ $? -eq 0 ]; then
    echo "\nSuccessfully cloned powerlevel10k repository\n"
    
    # update .zshrc file
    echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc
    
    # check .zshrc update success
    if [ $? -eq 0 ]; then
        echo "\n.zshrc file update was successful\n"
        echo "\nPowerlevel10k installation completed successfully!\n"
    else
        echo "\nFailed to update .zshrc file\n"
        exit 1
    fi
else
    echo "\nPowerlevel10k installation failed\n"
    exit 1
fi

echo "\n#################################################"
echo "\ninstall fonts\n"
echo "##################################################\n"
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
    echo "\nThe font '$font_filename' was successfully downloaded.\n"
  else
    echo "\nFailed to download the font '$font_filename'.\n"
    echo "\nPlease try downloading it manually.\n"
    continue
  fi

  # Update font cache
  fc-cache -f -v ~/.fonts

  # Check if font was installed correctly
  if fc-list | grep -q "$font_filename"; then
    echo "\nThe font '$font_filename' was installed successfully.\n"
  else
    echo "\nInstallation of the font '$font_filename' failed.\n"
    echo "\nPlease try installing it manually.\n"
  fi
done

# Install bat
echo "\n#################################################"
echo "\nInstalling bat...\n"
echo "##################################################\n"
sudo apt-get install bat -y

# check install success
if [ $? -eq 0 ]; then
    echo "\nBat installation completed successfully!\n"
else
    echo "\nBat installation failed\n"
fi

# Install exa
echo "\n#################################################"
echo "\nInstalling exa...\n"
echo "##################################################\n"
sudo apt-get install exa -y

# check install success
if [ $? -eq 0 ]; then
    echo "\nExa installation completed successfully!\n"
    echo "# Alias shell-commands-rus" >> ~/.zshrc
    echo 'alias l="exa -l --icons"' >> ~/.zshrc
    echo "use L instead of LS"
else
    echo "\nExa installation failed\n"
fi

# Install zinit
echo "\n#################################################"
echo "\nInstalling zinit...\n"
echo "##################################################\n"
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"

# check install success
if [ $? -eq 0 ]; then
    echo "\nZinit installation completed successfully!\n"
    echo "# Plugs zinit" >> ~/.zshrc
    echo "zinit light zdharma/fast-syntax-highlighting" >> ~/.zshrc
    echo "zinit light zsh-users/zsh-autosuggestions" >> ~/.zshrc
    echo "zinit light zsh-users/zsh-completions" >> ~/.zshrc
else
    echo "\nZinit installation failed\n"
fi

echo "\nPlease restart your terminal...\n"
