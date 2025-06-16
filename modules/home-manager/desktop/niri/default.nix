{hm-modules, ...}: {
  imports = [
    "${hm-modules}/desktop/shared"
    "${hm-modules}/programs/foot"
    "${hm-modules}/programs/fuzzel"
    "${hm-modules}/services/mako"
    "${hm-modules}/services/swayidle"
    "${hm-modules}/services/wl-sunset"
  ];

  scripts.password-picker.enable = true;
  scripts.wl-logout.enable = true;
}
