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
    dotnetCorePackages.dotnet_10.sdk
    opencode
    pyrefly
    unison-ucm
  ];

  home.sessionVariables = {
    DOTNET_ROOT = "${config.home.profileDirectory}/share/dotnet";
  };

  programs.helix.languages = {
    language-server.pyrefly = {
      command = "pyrefly";
      args = ["lsp"];
    };

    language = [{
      name = "python";
      language-servers = ["ruff" "jedi" "pyrefly"];
    }];
  };
  programs.helix.settings = {
    theme = "tokyonight_moon";
  };
}
