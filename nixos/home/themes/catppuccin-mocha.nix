let
  palette = {
    Rosewater = "f5e0dc";
    Flamingo = "f2cdcd";
    Pink = "f5c2e7";
    Mauve = "cba6f7";
    Red = "f38ba8";
    Maroon = "eba0ac";
    Peach = "fab387";
    Yellow = "f9e2af";
    Green = "a6e3a1";
    Teal = "94e2d5";
    Sky = "89dceb";
    Sapphire = "74c7ec";
    Blue = "89b4fa";
    Lavender = "b4befe";
    Text = "cdd6f4";
    Subtext1 = "bac2de";
    Subtext0 = "a6adc8";
    Overlay2 = "9399b2";
    Overlay1 = "7f849c";
    Overlay0 = "6c7086";
    Surface2 = "585b70";
    Surface1 = "45475a";
    Surface0 = "313244";
    Base = "1e1e2e";
    Mantle = "181825";
    Crust = "11111b";
  };
in
{
  name = "catppuccin-mocha";

  inherit palette;

  roles = {
    background = palette.Base;
    background_alt = palette.Mantle;

    surface = palette.Surface0;
    surface_alt = palette.Surface2;

    foreground = palette.Text;
    muted = palette.Subtext0;

    accent = palette.Mauve;
    accent_alt = palette.Peach;

    success = palette.Green;
    warning = palette.Yellow;
    error = palette.Maroon;
    info = palette.Teal;

    border = palette.Overlay1;
  };

  # ANSI terminal palette. These names map directly to Kitty settings.
  terminal = {
    color0 = palette.Surface1;
    color1 = palette.Red;
    color2 = palette.Green;
    color3 = palette.Yellow;
    color4 = palette.Blue;
    color5 = palette.Pink;
    color6 = palette.Teal;
    color7 = palette.Subtext1;

    color8 = palette.Surface2;
    color9 = palette.Red;
    color10 = palette.Green;
    color11 = palette.Yellow;
    color12 = palette.Blue;
    color13 = palette.Pink;
    color14 = palette.Teal;
    color15 = palette.Subtext0;
  };
}
