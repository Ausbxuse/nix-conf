final: prev: {
  mutter = prev.mutter.overrideAttrs (oldAttrs: {
    patches =
      (oldAttrs.patches or [])
      ++ [
        ./mutter_dup_id_fix.patch
      ];
  });
}
