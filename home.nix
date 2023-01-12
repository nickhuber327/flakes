{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "nick";
  home.homeDirectory = "/home/nick";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    #list programs here
    #oh-my-fish
    tmux
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.fish = {
    enable = true;
  };

  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      vim-nix
      vim-airline
      sensible
      haskell-vim
    ];
  };

  programs.git = {
    package = pkgs.gitAndTools.gitFull;
    enable = true;
    userName = "Nicholas Huber";
    userEmail = "nickhuber327@gmail.com";
    ignores = [ "*~" "*.swp" ];
    extraConfig = {
      core.editor = "nvim";
      init.defaultBranch = "main";
    };
  };

  programs.ssh = {
    enable = true;
  };
}
