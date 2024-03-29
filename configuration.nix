# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, inputs, ... }:



{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.kernelModules = [ "nvidia" ];
  boot.extraModulePackages = [ config.boot.kernelPackages.nvidia_x11 ];
  networking.hostName = "nixos"; # Define your hostname.
#  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

fonts.packages = with pkgs; [
  (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "JetBrainsMono" ]; })
  noto-fonts-emoji
];




programs.steam.enable = true;
programs.fish.enable = true;
programs.java.enable = true;
programs.nix-ld.enable = true;
programs.adb.enable = true;

    

    programs.starship.enable = true;
    programs.starship.settings = {
      add_newline = false;
      format = "$shlvl$shell$username$hostname$nix_shell$git_branch$git_commit$git_state$git_status$directory$jobs$cmd_duration$character";
      shlvl = {
        disabled = false;
        symbol = "ﰬ";
        style = "bright-red bold";
      };
      shell = {
        disabled = false;
        format = "$indicator";
        fish_indicator = "";
        bash_indicator = "(bright-white) ";
        zsh_indicator = "[ZSH](bright-white) ";
      };
      username = {
        style_user = "bright-white bold";
        style_root = "bright-red bold";
      };
    };



   
   networking.proxy.default = "http://172.16.2.250:3128/";
   networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_IN";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;


  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "symbolic";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.zenith = {
    isNormalUser = true;
    description = "gokulpb";
    extraGroups = [ "networkmanager" "wheel" "adbusers" ];
    packages = with pkgs; [
      firefox
      kate
    #  thunderbird
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget

  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
	wineWowPackages.stable

    # support 32-bit only
    wine

    # support 64-bit only
    (wine.override { wineBuild = "wine64"; })

    # wine-staging (version with experimental features)
    wineWowPackages.staging

    # winetricks (all versions)
    winetricks

    # native wayland support (unstable)
    wineWowPackages.waylandFull

      fishPlugins.done
  fishPlugins.fzf-fish
  fishPlugins.forgit
  fishPlugins.hydro
  fzf
  fishPlugins.grc
  grc
	pkgs.neofetch	
	pkgs.dunst
	pkgs.zsh
	pkgs.gcc
	pkgs.discord
	pkgs.waybar
  pkgs.libreoffice
	pkgs.steam
  pkgs.mesa
  pkgs.julia-bin
  pkgs.processing
  pkgs.spotify
  pkgs.go
  pkgs.gtk3
  pkgs.google-chrome
	pkgs.cmake
	pkgs.jdk
	pkgs.cloudflare-warp
	pkgs.zotero
	pkgs.eww-wayland
	pkgs.python3
	pkgs.vscode
	pkgs.nodejs_21
	pkgs.minecraft
	libnotify
	pkgs.unrar
	 wineWowPackages.stable

    # support 32-bit only
    wine

    # support 64-bit only
    (wine.override { wineBuild = "wine64"; })

    # wine-staging (version with experimental features)
    wineWowPackages.staging

    # winetricks (all versions)
    winetricks

    # native wayland support (unstable)
    wineWowPackages.waylandFull
	kitty
	pkgs.cmus
	pkgs.wofi
	pkgs.lf
	pkgs.pfetch
	pkgs.uwufetch
	pkgs.taskwarrior
	pkgs.taskwarrior-tui
	pkgs.zathura
	pkgs.sioyek
	pkgs.firefox
	pkgs.swww
	pkgs.opera
	pkgs.ripgrep
	pkgs.lazygit
	pkgs.obsidian
	pkgs.emacs29
	pkgs.git
	pkgs.stremio
	pkgs.curl
	pkgs.mpv
	pkgs.yt-dlp
	pkgs.ffmpeg
	pkgs.fzf

  ];

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  programs.hyprland.enable = true;

  #bluetooth

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  
  services.blueman.enable = true;
  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

  nix.settings.experimental-features = ["nix-command" "flakes"];
	
  #nvidia
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;
  hardware.opengl.enable = true;

  hardware.nvidia.modesetting.enable = true;

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia.prime = {
	sync.enable = true;

	nvidiaBusId = "PCI:0:1:0";

	amdgpuBusId = "PCI:0:4:0";
  };

  hardware.nvidia.nvidiaSettings = true;

  
              nixpkgs.config.permittedInsecurePackages = [
                "electron-25.9.0"
                "unrar"
                "steam"
                "google-chrome"
                "minecraft"
                "steam-run"
                "cudatoolkit"
              ];

}


