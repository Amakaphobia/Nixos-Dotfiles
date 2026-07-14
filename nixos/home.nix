{ ... }:

{
  imports = [
    # my user
    ./home/dave

  ];

  home = {
    username = "dave";
    homeDirectory = "/home/dave";
    stateVersion = "26.05";
  };
}
