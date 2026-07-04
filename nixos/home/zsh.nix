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
              };
            initContent =''
              rebuild(){
                  if [ -z "$1" ]; then 
                    echo "Usage: rebuild hostname"
                    return 1
                  fi

                  sudo nixos-rebuild switch --flake ".#$1"
                }
            '';
        };

}
