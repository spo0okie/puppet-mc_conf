define mc_conf::hotlist () {
	file_line { "mc_hotlist_$title":
		require => File[$mc_conf::mc_hotlist],
		path => $mc_conf::mc_hotlist,
		line => "ENTRY \"$title\" URL \"$title\"",
	} ->
	file_line { "mc_hotlist_${title}_48":
		require => File[$mc_conf::mc_hotlist_48],
		path => $mc_conf::mc_hotlist_48,
		line => "ENTRY \"$title\" URL \"$title\"",
	} ~> Exec['mc_conf_hotlist_update']
}
