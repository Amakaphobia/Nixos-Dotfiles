{ ... }:
{
  imports = [
    ../common/starship.nix
    ../common/zoxide.nix
    ../common/fzf.nix
  ];

  # FZF
  programs.fzf.enableZshIntegration = true;
  # starship
  programs.starship.enableZshIntegration = true;
  # zoxide
  programs.zoxide.enableZshIntegration = true;
}
