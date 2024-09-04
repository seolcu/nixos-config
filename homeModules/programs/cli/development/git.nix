{ ... }:
{
  programs.git = {
    enable = true;
    userEmail = "seolcu0112@proton.me";
    userName = "Gyuwon Seol";
    signing = {
      key = null;
      signByDefault = true;
    };
    extraConfig = {
      push = {
        autoSetupRemote = true;
      };
    };
  };
}
