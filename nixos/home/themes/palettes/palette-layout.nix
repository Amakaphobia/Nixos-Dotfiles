let
  semanticColorRoles = {
    # background
    background = "default background for applications";
    surface = "default background for containers";
    surfaceRaised = "visually elevated containers";
    overlay = "Background for floating content such as menus; popovers and tooltips.";

    #  Foreground content
    foregroundDisabled = "very muted forground tone";
    foregroundMuted = "muted forground tone";
    foreground = "default tone for text";

    #  Structure and focus
    border = "default border tone";
    focus = "default border tone for focused objects";

    #  Interactive colors
    accent = "default accent color";
    accentAlt = "alternative accent color";
    accentForeground = "foreground accent color";
    selection = "default selection color";
    selectionForeground = "default selection foreground";

    #  Semantic status colors
    success = "indicates success";
    warning = "indicates a non critical problem";
    error = "indicates a critical problem";
    info = "indicates noteworthy information";
  };

  terminalColorRoles = {
    #  normal
    color0 = "black";
    color1 = "red";
    color2 = "green";
    color3 = "yellow";
    color4 = "blue";
    color5 = "magenta";
    color6 = "cyan";
    color7 = "light-grey";
    #  bright
    color8 = "dark-grey";
    color9 = "bright-red";
    color10 = "bright-green";
    color11 = "bright-yellow";
    color12 = "bright-blue";
    color13 = "bright-magenta";
    color14 = "bright-cyan";
    color15 = "bright-white";
  };
in
{
  inherit semanticColorRoles terminalColorRoles;
}
