(self: super: {
  grub2 = super.grub2.overrideAttrs (oldAttrs: {
    patches = oldAttrs.patches ++ [
      ./screen_rotation_patch_1-3.patch
      ./screen_rotation_patch_2-3.patch
      ./screen_rotation_patch_3-3.patch
    ];
  });
})
