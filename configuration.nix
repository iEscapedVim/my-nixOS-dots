{ config, lib, pkgs, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable networking options
  networking.hostName = "BMO";
  # networking.wireless.enable = true; 
  networking.networkmanager.enable = true; 

  # Set your time zone.
  time.timeZone = "Asia/Karachi";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable the X11 windowing system.
  # services.xserver.enable = true;

  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
	enable = true;
	alsa.enable = true;
	alsa.support32Bit = true;
	pulse.enable = true;
	#Only Needed For JACK Applications uncommon
	#jack.enable = true;
  };
 
  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # Enable SSH
  services.openssh.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.zero = {
     isNormalUser = true;
     extraGroups = [ "wheel" "networkmanager" ]; # Enable ‘sudo’ for the user.
     packages = with pkgs; [
	# Audio & Video
	pkgs.vlc
	pkgs.kdenlive
	pkgs.obs-studio
	pkgs.audacity
	# Developement Tools
	pkgs.vscode
	pkgs.neovim
	pkgs.docker
	pkgs.docker-compose
	pkgs.ddev
	pkgs.filezilla
	pkgs.onionshare
	pkgs.firefox-devedition
	pkgs.google-chrome
	pkgs.brave
	# Games
	# Graphics & Photos
	pkgs.inkscape
	pkgs.gimp
	# Internet
	pkgs.openssh
	pkgs.firewalld
	pkgs.telegram-desktop
	pkgs.discord
	pkgs.tor-browser-bundle-bin
	# Productivity & System Utils
	pkgs.obsidian
	pkgs.neofetch
	pkgs.uwufetch
	pkgs.ghfetch
	pkgs.btop
	pkgs.htop
	pkgs.tmux	
     ];
  };

  # Docker 
  virtualisation.docker.enable = true;

  # Enabling Unfree Softwares
  nixpkgs.config.allowUnfree = true;
 
  # Open port in the firewall.
  networking.firewall.enable = false;
  networking.firewall.checkReversePath = "loose";

  # HyprLand Window Manager

  

  # List packages installed in system profile. To search, run:
   environment.systemPackages = with pkgs; [
     pkgs.nano
     pkgs.curl
     pkgs.wget
     pkgs.git
   ];

  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.05"; # Did you read the comment?

}
