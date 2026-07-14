{ ... }:
{
  # enter hibernation after suspension
  systemd.sleep.settings.Sleep = {
    # enter hibernation after amount of time specified in suspension
    HibernateDelaySec = "10m";
    # keep timer on even when laptop is charging
    HibernateOnACPower = true;
  };

  logind.settings.Login = {
    # handle lid closing
    HandleLidSwitch = "suspend-then-hibernate";
    # handle lid closing with powercord
    HandleLidSwitchExternalPower = "suspend-then-hibernate";
    #ignore lid when external monitor is connected
    HandleLidSwitchDocked = "ignore";
  };
  # Enable touchpad support (enabled default in most desktopManager).
  libinput.enable = true;

  # power-profiles-daemon
  power-profiles-daemon.enable = true;
}
