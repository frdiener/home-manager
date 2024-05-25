{ pkgs, ... }: 
{
  programs ={
    git = {
      enable = true;

      userName = "vr1l";
      userEmail = "51481761+vr1l@users.noreply.github.com";

      extraConfig = { 
        init.defaultBranch = "main";
        credential.helper = "store";
      };
    };
  };
  home.packages = [ pkgs.gh pkgs.git-lfs ];
}
