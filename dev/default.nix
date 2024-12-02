{ pkgs, ... }:

{
  programs.ruff = {
    enable = true;
    settings = {
      line-length = 120;
    };
  };

  home.packages = with pkgs; [
    dotnetCorePackages.dotnet_9.sdk.unwrapped
    unison-ucm
  ];

  home.sessionVariables = {
    DOTNET_ROOT = "${pkgs.dotnetCorePackages.dotnet_9.sdk.unwrapped}/share/dotnet";
  };
}
