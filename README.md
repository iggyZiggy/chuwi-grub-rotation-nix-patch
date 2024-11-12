# chuwi-grub-rotation-nix-patch

rotate grub screen on nixos, mainly for chuwi minibook x but should work for similar devices too

in /etc/nixos/configuration.nix add this:

```
  nixpkgs.overlays = [
    (import ./overlays/grub2)
  ];

```

and add overlays/grub2 from this git into your /etc/nixos directory

i couldn't figure out how to set options for rotation so i've set it to rotate by default in
screen_rotation_patch_2-3.patch at line 364

```
+        target->mode_info.rotation = GRUB_VIDEO_ROTATE_270; // GRUB_VIDEO_ROTATE_NONE;
```

also this will probably just work until grub doesn't change/update, so far it does work
so enjoy it while it lasts, hopefully this won't be needed at all in the near future.
Also be careful running this and have a backup plan, and by backup plan i mean, do it
over the weekend with a rescue usb just in case.

Be sure to check if you actually boot into grub and not systemd-boot by checking BIOS
boot priority, even though i had this set:

```
  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.timeout = 3;
  boot.loader.grub.extraConfig = ''

    export GRUB_FB_ROTATION=270
    GRUB_FB_ROTATION=270
    set rotation=270

  '';
  boot.loader.grub.device = "nodev";
  # boot.loader.grub.useOSProber = true;
  boot.loader.grub.efiSupport = true;
  # chuwi Bootloader
  boot.loader.grub.gfxmodeEfi="1200x1920x32";
  boot.loader.grub.gfxpayloadEfi="keep";
  # more Bootloader
  boot.loader.systemd-boot.enable = false;
  boot.loader.efi.canTouchEfiVariables = true;

```

the extraConfig was supposed to make it work without modifying that patch above but
it did not work, if anyone knows why, please let me know and i'll update this code.

all credits for the patch go to:
https://lists.gnu.org/archive/html/grub-devel/2024-06/msg00165.html
https://lore.kernel.org/all/20240618041445.12362-1-kyle.bader94@gmail.com/T/#m88e645967fa147d51468fb921eb03546eed4c6a1

So send your thanks to Kyle Bader for this one, i just moved it from mailing list
into a git repo and adjusted for nixos.
