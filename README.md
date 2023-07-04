# ZSH com Powerlevel10k e Zinit

![shell](/readme/home.png)

# index

- [instalação automática](#instalação-automática)
- [installation manual](#instalação-manual)
  - [ZSH](#1°-instalação-zsh)
  - [Powerlevel10k](#2°-instalação-powerlevel10k)
    - [fonts](#instalação-de-fontes)
  - [Ferramentas shell](#3°-ferramentas-shell)
  - [Zinit](#4°-zinit)
- [sobre](#sobre)

# Sobre

🚀 Aumente sua produtividade com um terminal personalizado! 💻✨

Apresento a vocês um script shell incrível que automatiza a instalação de algumas ferramentas essenciais para aprimorar sua experiência no terminal. ✅🔥

🔹 O Zsh é um shell altamente configurável, repleto de recursos e opções de personalização. Com uma sintaxe mais intuitiva e autocompletar inteligente, você ganhará mais agilidade ao digitar comandos e navegar pelos diretórios.

🔹 O Powerlevel10k é um tema para o Zsh que fornece um prompt altamente personalizável e informativo. Com ele, você terá acesso a informações úteis, como o diretório atual, o status do Git, o tempo de execução de um comando e muito mais. Sua interface atraente e funcional o ajudará a obter informações importantes de forma rápida e eficiente.

🔹 O Zinit é um gerenciador de plugins para o Zsh. Com ele, você poderá adicionar facilmente uma infinidade de plugins úteis ao seu shell, como autocompletar aprimorado, realce de sintaxe e suporte a diferentes linguagens de programação. O Zinit torna a instalação e a atualização de plugins um processo simples e intuitivo.

Plugs instalados:
  - fast-syntax-highlighting
  - zsh-autosuggestions
  - zsh-completions

🔹 Foi adicionado um alias para listar diretórios com icons e cores, use `l` no lugar do `ls`
![example ls](/readme/newls.png)

🔹 Nerd Fonts instaladas para usuário atual, caso tenha mais de um usuário que deseje utilizar as fontes e necessário instalar manualmente

# instalação manual
## 1° instalação zsh

comando compatível com sistema debian e derivados

```shell
sudo apt install zsh
```
```shell
zsh --version
```
```shell
chsh -s $(which zsh)
```

ou acesse o repositório oficial [GitHub zsh](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)

## 2° instalação powerlevel10k

```zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
```

### instalação de fontes

1. Baixe estes quatro arquivos ttf:
   - [MesloLGS NF Regular.ttf](
       https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf)
   - [MesloLGS NF Bold.ttf](
       https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf)
   - [MesloLGS NF Italic.ttf](
       https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf)
   - [MesloLGS NF Bold Italic.ttf](
       https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf)
1. Clique duas vezes em cada arquivo e clique em "Instalar". Isso tornará a fonte `MesloLGS NF` disponível para todos aplicativos em seu sistema.
ou acesse o repositório oficial [GitHub powerlevel10k](https://github.com/romkatv/powerlevel10k)

## 3° Ferramentas shell

### exa
`exa` é um substituto moderno para `ls`, o programa de linha de comando padrão no Unix/Linux para listar o conteúdo do diretório. `exa` suporta ícones com o sinalizador `--icons`.

![exa](https://user-images.githubusercontent.com/200613/90223612-aa856a00-de0e-11ea-8cec-133becefa6f2.png)

```shell
sudo apt-get install exa
```
### [mais plugs](https://zaiste.net/posts/shell-commands-rust/)

## 4° zinit

A maneira mais fácil de instalar o Zinit é executar:

```bash
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
```
ou acesse o repositório para instalação manual [GitHube zinit](https://github.com/zdharma-continuum/zinit)

# instalação automática

⚠️ Instalação para debian e derivados ⚠️

```zsh
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/EversonDias/zsh-with-powerlevel10k-and-zinit/main/ubuntu-install.sh)"
```
