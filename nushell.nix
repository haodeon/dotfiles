{ ... }:

{
  programs.nushell = {
    enable = true;
  };

  programs.broot = {
    enable = true;
    enableNushellIntegration = true;
  };
}
