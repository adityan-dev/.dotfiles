#!bash
mv /home/adi/.dotfiles/.config/thor/config/grub /etc/default/grub
mv /home/adi/.dotfiles/.config/thor/config/mkinitcpio.conf /etc/default/grub/mkinitcpio.conf

mkinitcpio -p linux-zen
update-grub
