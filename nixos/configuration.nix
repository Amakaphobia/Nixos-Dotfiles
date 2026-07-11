{
  pkgs,
  flakePath,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot.loader = {
    systemd-boot = {
      enable = true;
      configurationLimit = 10;
    };
    efi.canTouchEfiVariables = true;
  };

  networking.hostName = "nyx"; # Define your hostname.

  # security.pam.services.hyprlock = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  networking.networkmanager.enable = true;
  time.timeZone = "Europe/Berlin";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "de_DE.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "de_DE.UTF-8";
      LC_MONETARY = "de_DE.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };
  # enable hardware acceleration
  hardware.graphics = {
    enable = true;
    # VA-API driver for modern intel gpus
    extraPackages = with pkgs; [
      intel-media-driver
    ];
  };

  #Hyprland Portals
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
    ];
  };

  # Configure console keymap
  console.keyMap = "de";
  security.rtkit.enable = true;

  # enter hibernation after suspension
  systemd.sleep.settings.Sleep = {
    # enter hibernation after amount of time specified in suspension
    HibernateDelaySec = "10m";
    # keep timer on even when laptop is charging
    HibernateOnACPower = true;
  };

  services = {
    # LY
    displayManager.ly.enable = true;

    # Enable CUPS to print documents.
    printing.enable = true;

    # Enable sound with pipewire.
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      #jack.enable = true;

      # use the example session manager (no others are packaged yet so this is enabled by default,
      # no need to redefine it in your config for now)
      #media-session.enable = true;
    };
    # Enable touchpad support (enabled default in most desktopManager).
    libinput.enable = true;

    logind.settings.Login = {
      # handle lid closing
      HandleLidSwitch = "suspend-then-hibernate";
      # handle lid closing with powercord
      HandleLidSwitchExternalPower = "suspend-then-hibernate";
      #ignore lid when external monitor is connected
      HandleLidSwitchDocked = "ignore";
    };

    # user level file system integration (trash mounts network locations...)
    gvfs.enable = true;
    # thumbnails
    tumbler.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."dave" = {
    isNormalUser = true;
    description = "dave";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.zsh;
  };

  programs = {
    # set hyprland as WM
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    # Allow HomeManager to apply settings to gtk (?)
    dconf.enable = true;
    # firefox
    firefox = {
      enable = true;

      policies = {
        HardwareAcceleration = true;
        SearchEngines.Default = "DuckDuckGo";
      };
      preferences = {
        "media.ffmpeg.vaapi.enabled" = true;
      };
    };
    #enable ssh agent
    ssh.startAgent = true;
    # enable the cool shell
    zsh.enable = true;
    # file manager
    thunar.enable = true;
  };

  #Fonts
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  nixpkgs.config.allowUnfree = true;

  environment = {
    # setting variables
    sessionVariables = {
      LIBVA_DRIVER_NAME = "iHD";
      FLAKE_PATH = flakePath;
    };

    # make /share/zsh available
    pathsToLink = [ "/share/zsh" ];

    #installing system level packages
    systemPackages = with pkgs; [
      vim

      wget
      curl
      unzip
      zip
      tree
      ripgrep
      gnutar
      bat
      procps
      killall

      nodejs
      jdk
      python3
      gcc
      gnumake
      fzf
      lua51Packages.luarocks
      lua5_1
      fastfetch

      openssh
      libva-utils
    ];
  };

  #hyprlock rights
  security.pam.services.hyprlock = { };

  nix = {
    settings = {
      # Flakes
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      auto-optimise-store = true;
    };

    #automatic weekly garbage colletion, protects the current generation
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 60d";
    };
  };

  system.stateVersion = "26.05"; # No changerino!

}
