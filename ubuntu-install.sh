#!/bin/bash
# this script is for Ubuntu and derivations, customize for your system

# update system
echo -e "\n#################################################"
echo -e "\nUpdating system...\n"
echo -e "##################################################\n"
sudo apt-get update -y && sudo apt-get upgrade -y

# check if system update was successful
if [ $? -eq 0 ]; then
    echo -e "\nSystem update completed successfully!\n"
else
    echo -e "\nSystem update failed\n"
    exit 1
fi

# install zsh
echo -e "\n#################################################"
echo -e "\nInstalling zsh...\n"
echo -e "##################################################\n"
sudo apt install zsh -y

# verify installation success
if [ $? -eq 0 ]; then
    echo "typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet" >> ~/.zshrc
    echo "typeset -g POWERLEVEL9K_INSTANT_PROMPT=off" >> ~/.zshrc
    echo -e "\nZsh installation completed successfully!\n"
    # set zsh as the default shell
    chsh -s $(which zsh)
else
    echo -e "\nZsh installation failed\n"
    exit 1
fi

# install powerlevel10k
echo -e "\n#################################################"
echo -e "\nInstalling powerlevel10k...\n"
echo -e "##################################################\n"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k

# check clone success
if [ $? -eq 0 ]; then
    echo -e "\nSuccessfully cloned powerlevel10k repository\n"
    
    # update .zshrc file
    echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc
    
    # check .zshrc update success
    if [ $? -eq 0 ]; then
        echo -e "\n.zshrc file update was successful\n"
        echo -e "\nPowerlevel10k installation completed successfully!\n"
    else
        echo -e "\nFailed to update .zshrc file\n"
        exit 1
    fi
else
    echo -e "\nPowerlevel10k installation failed\n"
    exit 1
fi

echo -e "\n#################################################"
echo -e "\ninstall fonts\n"
echo -e "##################################################\n"
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
    echo -e "\nFailed to download the font '$font_filename'.\n"
    echo -e "\nPlease try downloading it manually.\n"
    continue
  fi

  # Update font cache
  fc-cache -f -v ~/.fonts

  # Check if font was installed correctly
  if fc-list | grep -q "$font_filename"; then
    echo -e "\nThe font '$font_filename' was installed successfully.\n"
  else
    echo -e "\nInstallation of the font '$font_filename' failed.\n"
    echo -e "\nPlease try installing it manually.\n"
  fi
done


echo "# Alias shell-commands-rus" >> ~/.zshrc
echo "alias py="python3"" >> ~/.zshrc
echo 'alias pyvca="python3 -m venv .venv && source .venv/bin/activat"' >> ~/.zshrc
echo 'alias pyva="source .venv/bin/activate"' >> ~/.zshrc
echo 'alias pytest="python3 -m pytest"' ~/.zshrc
echo 'gpush() {
  git add . && git commit -m "$1" && git push
}' >> ~/.zshrc

# Install exa
echo -e "\n#################################################"
echo -e "\nInstalling exa...\n"
echo -e "##################################################\n"
sudo apt-get install exa -y

# check install success
if [ $? -eq 0 ]; then
    echo -e "\nExa installation completed successfully!\n"
    echo 'alias l="exa -l --icons"' >> ~/.zshrc
    echo "use L instead of LS"
else
    echo -e "\nExa installation failed\n"
fi

# Install zinit
echo -e "\n#################################################"
echo -e "\nInstalling zinit...\n"
echo -e "##################################################\n"
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

# check install success
if [ $? -eq 0 ]; then
    echo -e "\nZinit installation completed successfully!\n"
    echo "zinit light zdharma/fast-syntax-highlighting" >> ~/.zshrc
    echo "zinit light zsh-users/zsh-autosuggestions" >> ~/.zshrc
    echo "zinit light zsh-users/zsh-completions" >> ~/.zshrc
else
    echo -e "\nZinit installation failed\n"
fi

echo -e "\nPlease restart your terminal...\n"
