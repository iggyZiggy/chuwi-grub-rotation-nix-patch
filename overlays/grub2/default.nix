(self: super: {
  grub2 = super.grub2.overrideAttrs (oldAttrs: {
    patches = oldAttrs.patches ++ [
	./0001.patch
	./0002.patch
	./0003.patch
	./0004.patch 
    ];
  });
})
