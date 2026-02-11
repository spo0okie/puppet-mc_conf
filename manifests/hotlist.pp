#добавление пути в хотлист mc (Ctrl + /)
define mc_conf::hotlist () {
  include mc_conf
  file_line { "mc_hotlist_${title}":
    require => File[$mc_conf::mc_hotlist],
    path    => $mc_conf::mc_hotlist,
    line    => "ENTRY \"${title}\" URL \"${title}\"",
  } ~> Exec['mc_conf_hotlist_update']
  file_line { "mc_hotlist_${title}_48":
    require => File[$mc_conf::mc_hotlist_48],
    path    => $mc_conf::mc_hotlist_48,
    line    => "ENTRY \"${title}\" URL \"${title}\"",
  } ~> Exec['mc_conf_hotlist_update_48']
}
