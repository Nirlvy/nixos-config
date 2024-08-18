{
  programs.waybar = {
    enable = true;
    systemd = {
      enable = true;
      target = "hyprland-session.target";
    };
    style = ./style.css;
  };

  xdg.configFile = {
    "waybar/config".source = ./config;
    "waybar/frappe.css".source = ./frappe.css;
  };
}
