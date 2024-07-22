{ config, pkgs, ... }: {
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
  };

  networking = {
    hostName = "nixos";
    #wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    networkmanager.enable = true;
  };
  
  time.timeZone = "Asia/Tokyo";

  i18n =  {
    defaultLocale = "en_GB.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
    inputMethod = {
      enabled = "fcitx5";
      fcitx5.addons = with pkgs; [
        fcitx5-mozc
        fcitx5-anthy
      ];
    };
  };
  
  fonts = {
    fonts = with pkgs; [
      noto-fonts-cjk-serif
      noto-fonts-cjk-sans
      noto-fonts-emoji
      nerdfonts
    ];
    fontDir.enable = true;
    fontconfig = {
      defaultFonts = {
        serif = ["Noto Serif CJK JP" "Noto Color Emoji"];
        sansSerif = ["Noto Sans CJK JP" "Noto Color Emoji"];
        monospace = ["JetBrainsMono Nerd Font" "Noto Color Emoji"];
        emoji = ["Noto Color Emoji"];
      };
    };
  };  
  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;

  services = {
    xserver = {
      enable = true;
      displayManager = {
        gdm.enable = true;
      };
      # desktopManager.gnome.enable = true;
      # windowManager.exwm.enable = true;
      layout = "us";
      xkbVariant = "";
    };
    printing.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };
  
  users.users.kyre = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
    defaultUserShell = pkgs.zsh;  
    packages = with pkgs; [
      # add package below
    ];    
  };

  programs = {
    zsh.enable = true; 
  };
  
  environment.systemPackages = with pkgs; [
    # ((emacsPackagesFor emacsPgtkNativeComp).emacsWithPackages (
    #   epkgs: [ epkgs.vterm ]
    # ))
  ];
  
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "24.05";
}
