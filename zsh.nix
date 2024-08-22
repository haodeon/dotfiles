{ ... }:

{
  programs.zsh = {
    enable = true;
    history.expireDuplicatesFirst = true;
    historySubstringSearch.enable = true;
    initExtra = ''
      nd() { nix develop $1 -c $SHELL }
      export GPG_TTY=$TTY
      bindkey "^[[3~" delete-char
      bindkey "^[[1~" beginning-of-line
      bindkey "^[[4~" end-of-line
    '';
  };

  programs.eza = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.starship = {
    enable = true;
    settings = {
      gcloud = {
        format = "on [$symbol$region(\($project\))]($style) ";
        detect_env_vars = [ "IN_NIX_SHELL" ];
        style = "bold yellow";
      };
    };
    enableZshIntegration = true;
  };
}
