{ pkgs, ... }:

{
  fonts = {
    fonts = with pkgs; [
      fira-code
      iosevka-term-ss08-font
      mononoki
      unifont
    ];
  
    enableDefaultFonts = false;
  
    fontconfig.defaultFonts = {
      serif = [ "Unifont" ];
      sansSerif = [ "Unifont" ];
      monospace = [ "Unifont" ];
    };
  };
}
