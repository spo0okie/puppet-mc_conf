define mc_conf::hotlist () {
	$mc_hotlist = '/root/.mc/hotlist'
	file_line { "mc_hotlist_$title":
		require => File[$mc_conf::mc_hotlist],
		path => $mc_conf::mc_hotlist,
		line => "ENTRY \"$title\" URL \"$title\"",
	} ~> Exec['mc_conf_hotlist_update']
}
