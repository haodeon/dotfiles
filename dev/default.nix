{ config, pkgs, ... }:

{
  programs.ruff = {
    enable = true;
    settings = {
      line-length = 120;
    };
  };

  programs.uv = {
    enable = true;
    settings = {
      python-downloads = "manual";
      python-preference = "system";
    };
  };

  home.packages = with pkgs; [
    dotnetCorePackages.dotnet_9.sdk
    pyrefly
    unison-ucm
  ];

  home.sessionVariables = {
    DOTNET_ROOT = "${config.home.profileDirectory}/share/dotnet";
  };
}
