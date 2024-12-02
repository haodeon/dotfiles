{ config, pkgs, ... }:

{
  programs.ruff = {
    enable = true;
    settings = {
      line-length = 120;
    };
  };

  home.packages = with pkgs; [
    dotnetCorePackages.dotnet_9.sdk
    unison-ucm
  ];

  home.sessionVariables = {
    DOTNET_ROOT = "${config.home.profileDirectory}/share/dotnet";
  };
}
