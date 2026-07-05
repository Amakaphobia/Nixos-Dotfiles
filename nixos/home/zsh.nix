{ pkgs, ... }:

{

  	#Zsh
   	programs.zsh = {
            enable = true;
            autosuggestion.enable = true;
            enableCompletion = true;
            syntaxHighlighting.enable = true;
            autocd = true;
            history = {
              size = 10000;
              save = 10000;
              path = "$HOME/.zsh_history";
              };
            shellAliases = {
              ll = "ls -lisa";
              sr = "systemctl reboot";
              sd = "systemctl poweroff";
              };
            initContent =''
	      # rebuild the system

              rebuild(){
                  if [ -z "$1" ]; then 
                    echo "Usage: rebuild hostname"
                    return 1
                  fi

                  sudo nixos-rebuild switch --flake ".#$1"
              }
	      
	      # do a test build of the system without switching
	      testbuild(){
                  if [ -z "$1" ]; then 
                    echo "Usage: testbuild hostname"
                    return 1
                  fi

                  sudo nixos-rebuild test --flake ".#$1"
              }
            '';
        };

}
