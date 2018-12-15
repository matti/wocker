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


Wockerfile:
```
from: StefanScherer/windows_2019

runs:
  - path: install-chocolatey.ps1
  - inline: choco install -y ruby
  - inline: choco install -y nircmd
ports:
  - 9516:5555
```

        wocker build --interface "en0: Wi-Fi (Wireless)"
        wocker exec -- gem install delirium-driver


        gem install wocker
