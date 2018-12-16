# wocker

Brewfile:
```
cask "virtualbox"
cask "virtualbox-extension-pack"

cask "vagrant"

brew "mas"
mas "Microsoft Remote Desktop", id: 1295203466
```

    brew bundle

    vagrant plugin install vagrant-reload
    gem install wocker

    wocker init
    wocker build --choco --interface "en0: Wi-Fi (Wireless)"
    wocker exec -- gem install delirium-driver
