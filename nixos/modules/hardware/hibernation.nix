{ ... }:
{
  services = {
    # enter hibernation after suspension
    systemd.sleep.settings.Sleep = {
      # enter hibernation after amount of time specified in suspension
      HibernateDelaySec = "10m";
      # keep timer on even when laptop is charging
      HibernateOnACPower = true;
    };
  };
}
