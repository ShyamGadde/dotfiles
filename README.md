# Dotfiles

```sh
sh -c "$(curl -fsLS get.chezmoi.io/lb)" -- init --apply ShyamGadde
```

OR

```sh
chezmoi init --apply ShyamGadde
```

OR

```sh
sh -c "$(curl -fsLS get.chezmoi.io/lb)" -- init --one-shot ShyamGadde
```

OR

```sh
git clone https://github.com/ShyamGadde/dotfiles.git
cd dotfiles
./install.sh
```
