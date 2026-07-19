{ ... }:

{
  programs.starship = {
    enable = true;

    settings = {
      add_newline = false;
      command_timeout = 500;

      format = "$directory$git_branch$git_status$nix_shell$character";

      directory = {
        truncation_length = 3;
        truncate_to_repo = true;
      };

      git_branch = {
        symbol = "git ";
        format = "[$symbol$branch]($style) ";
        style = "bold purple";
      };

      git_status = {
        format = "([$all_status$ahead_behind]($style) )";
        style = "bold red";

        conflicted = "=";
        ahead = "⇡";
        behind = "⇣";
        diverged = "⇕";
        untracked = "?";
        stashed = "$";
        modified = "!";
        staged = "+";
        renamed = "»";
        deleted = "x";
      };

      nix_shell = {
        symbol = "nix ";
        format = "[$symbol$state( \\($name\\))]($style) ";
        style = "bold blue";
      };

      character = {
        success_symbol = "[❯](bold green)";
        error_symbol = "[❯](bold red)";
      };
    };
  };
}
