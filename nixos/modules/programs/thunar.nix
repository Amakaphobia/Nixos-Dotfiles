{ ... }:
{
  programs.thunar.enable = true;
  services = {
    # user level file system Integration (trash, mounts, remote drives)
    gvfs.enable = true;
    # thumbnails
    tumbler.enable = true;
  };

}
