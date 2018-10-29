# CaféHaine's Arch Installer

Image USB (2?4)Go
Boot FAT32 100M avec Grub EFI + bios label CafeBoot
Root RO overlayfs strict minimum niveau paquets 
(git pacstrap networkmanager gparted(installer tout les paquets de format) (firefox|lxqt|netsurf))

GUI GTK/Chopsui ? javascript/html avec un serveur python ?
DE: rootston ou lxde

# Mode terminal / dialog

[ ] Choix layout clavier
[x] Choix locale
[ ] si pas de connexion internet, detecter carte wifi
  [ ] si carte wifi afficher nmtui
  [ ] sinon afficher un warning qui dit de setup à la main et d'executer une
      commande pour continuer (network_ok ?)
[ ] optimisation mirrorlist

# Démarrage bureau

- RAPPELLER QUE JE SUIS PAS RESPONSABLE, ET QUE C'EST PAS UN ARCHLINUX, C'EST
    JUSTE UN MOYEN D'ACCELERER L'INSTALLATION QUAND VOUS EN AVEZ DEJA FAIT

- Gparted - afficher une page de conseils
- Choix partitions
- Choix DE, services, paquets (afficher une aide et des screenshots)
  - choix automatique ucode (amd/intel)
  - choix automatique du bootloader (syslinux pour bios, systemd-boot pour EFI,
      grub pour EFI32 CPU64)
  - etape de validation à la fin avec possibilité d'éditer à la main
- Si nvidia, afficher un warning que les drivers opensource vont être installés,
    et qu'il faut check le wiki pour voir comment le changer
- Installation (background)
- Choisir un utilisateur/mot de passe
- Choix fuseau horaire
- Choix hostname (defaut arch_$user)
- ???
- Profit
