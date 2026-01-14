{ ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user.name = "haodeon";
      user.email = "31973188+haodeon@users.noreply.github.com";
    };
  };

  programs.difftastic = {
    enable = true;
    git.enable = true;
  };

  programs.lazygit.enable = true;
}
