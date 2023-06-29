# zsh-with-powerlevel10k

zsh shell install script with powerlevel10k and zinit, shell-commands-rust.

# index

- [ZSH](#1°-install-zsh-shell)
- [Powerlevel10k](#2°-install-powerlevel10k)
- [Shell Commands Rust](#3°-shell-commands-rust)
- [Zinit](#4°-zinit)

# 1° install zsh shell

commands fro ubunto and derivations

```shell
sudo apt install zsh
```
```shell
zsh --version
```
```shell
chsh -s $(which zsh)
```

or 

### [GitHub zsh](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)

# 2° install powerlevel10k

### Manual

```zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
```

Users in China can use the official mirror on gitee.com for faster download.<br>
中国用户可以使用 gitee.com 上的官方镜像加速下载.

```zsh
git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
```

This is the simplest kind of installation and it works even if you are using a plugin manager. Just
make sure to disable the current theme in your plugin manager. See
[troubleshooting](#cannot-make-powerlevel10k-work-with-my-plugin-manager) for help.

#### Extra space without background on the right side of right prompt

tl;dr: Add `ZLE_RPROMPT_INDENT=0` to `~/.zshrc` to get rid of that space.

From [Zsh documentation](
  http://zsh.sourceforge.net/Doc/Release/Parameters.html#index-ZLE_005fRPROMPT_005fINDENT):

> `ZLE_RPROMPT_INDENT <S>`
>
> If set, used to give the indentation between the right hand side of the right prompt in the line
> editor as given by `RPS1` or `RPROMPT` and the right hand side of the screen. If not set, the
> value `1` is used.
>
> Typically this will be used to set the value to `0` so that the prompt appears flush with the
> right hand side of the screen.

Powerlevel10k respects this parameter. If you set `ZLE_RPROMPT_INDENT=1` (or leave it unset, which
is the same thing as setting it to `1`), you'll get an empty space to the right of right prompt. If
you set `ZLE_RPROMPT_INDENT=0`, your prompt will go to the edge of the terminal. This is how it
works in every theme except Powerlevel9k.

![ZLE_RPROMPT_INDENT: Powerlevel10k vs Powerlevel9k](
  https://raw.githubusercontent.com/romkatv/powerlevel10k-media/master/p9k-vs-p10k-zle-rprompt-indent.png)

Powerlevel9k issue: [powerlevel9k#1292](https://github.com/Powerlevel9k/powerlevel9k/issues/1292).
It's been fixed in the development branch of Powerlevel9k but the fix hasn't yet made it to
`master`.

Add `ZLE_RPROMPT_INDENT=0` to `~/.zshrc` to get the same spacing on the right edge of prompt as in
Powerlevel9k.

*Note:* Several versions of Zsh have bugs that get triggered when you set `ZLE_RPROMPT_INDENT=0`.
Powerlevel10k can work around these bugs when using powerline prompt style. If you notice visual
artifacts in prompt, or wrong cursor position, try removing `ZLE_RPROMPT_INDENT` from `~/.zshrc`.

#### Extra or missing spaces around icons

tl;dr: Add `POWERLEVEL9K_LEGACY_ICON_SPACING=true` to `~/.zshrc` to get the same spacing around
icons as in Powerlevel9k.

Spacing around icons in Powerlevel9k is inconsistent.

![ZLE_RPROMPT_INDENT: Powerlevel10k vs Powerlevel9k](
  https://raw.githubusercontent.com/romkatv/powerlevel10k-media/master/p9k-vs-p10k-icon-spacing.png)

This inconsistency is a constant source of annoyance, so it was fixed in Powerlevel10k. You can add
`POWERLEVEL9K_LEGACY_ICON_SPACING=true` to `~/.zshrc` to get the same spacing around icons as in
Powerlevel9k.

*Note:* It's not a good idea to define `POWERLEVEL9K_LEGACY_ICON_SPACING` when using
`p10k configure`.

1. Download these four ttf files:
   - [MesloLGS NF Regular.ttf](
       https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf)
   - [MesloLGS NF Bold.ttf](
       https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf)
   - [MesloLGS NF Italic.ttf](
       https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf)
   - [MesloLGS NF Bold Italic.ttf](
       https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf)
1. Double-click on each file and click "Install". This will make `MesloLGS NF` font available to all
   applications on your system.

or

### [GitHub powerlevel10k](https://github.com/romkatv/powerlevel10k)

# 3° shell-commands-rust

### exa
`exa` is a modern replacement for `ls`, the default command-line program in Unix/Linux for listing directory contents. `exa` supports icons with the `--icons` flag.

![exa](https://user-images.githubusercontent.com/200613/90223612-aa856a00-de0e-11ea-8cec-133becefa6f2.png)

```shell
sudo apt-get install exa
```
### [more plugs](https://zaiste.net/posts/shell-commands-rust/)

# 4° zinit

## Install<a name="install"></a>

### Automatic<a name="automatic"></a>

The easiest way to install Zinit is to execute:

```bash
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
```

This will install Zinit in `~/.local/share/zinit/zinit.git`. `.zshrc` will be updated with three lines of code that will
be added to the bottom. The lines will be sourcing `zinit.zsh` and setting up completion for command `zinit`.

After installing and reloading the shell, compile Zinit via:

```zsh
zinit self-update
```

### Manual<a name="manual"></a>

In your `.zshrc`, add the following snippet

```zsh
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"
```

[compinit](http://zsh.sourceforge.net/Doc/Release/Completion-System.html#Initialization)):

If you source `zinit.zsh` after `compinit`, add the following snippet after sourcing `zinit.zsh`:

```zsh
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
```

Reload Zsh to install Zinit:

```zsh
exec zsh
```

Various paths can be customized; see section [Customizing Paths](#customizing-paths).

added plugs in ~/.zshrc
```zsh
# Plugs zinit

zinit light zdharma/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
```

or

### [GitHube zinit](https://github.com/zdharma-continuum/zinit)

# 5° Script

```zsh
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/EversonDias/zsh-with-powerlevel10k/main/ubuntu-install.sh)"
```
