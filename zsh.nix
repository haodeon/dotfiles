{ ... }:

{
  programs.zsh = {
    enable = true;
    history.expireDuplicatesFirst = true;
    historySubstringSearch.enable = true;
    initExtra = ''
      nd() { nix develop $1 -c $SHELL }
      export GPG_TTY=$TTY
    '';
  };

  programs.exa ={
    enable = true;
    enableAliases = true;
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };
}
