class mc_conf {
	require users::root
	$mc_hotlist = '/root/.mc/hotlist'
	package {'mc':			ensure => 'installed' } ->
	file { $mc_hotlist:
		ensure => file,
		owner => 'root',
		group => "${users::root::group}",
		mode => '0644'
	}
	file {'/root/.mc':
		ensure => directory,
		owner => 'root',
		group => "${users::root::group}",
		mode => '0700'
	} ->
	file {'/root/.mc/ini':
		owner => 'root',
		group => "${users::root::group}",
		source => 'puppet:///modules/mc_conf/ini',
		mode => '0644'
	} ~>
	exec {'mc_conf_killall_mc':
		refreshonly => true,
		command => 'killall -u root mc mcedit || echo "No mc running"',
		path => '/bin:/sbin:/usr/bin:/usr/sbin'
	}
	exec { 'mc_conf_hotlist_update':
		refreshonly => true,
		command => "sort $mc_conf::mc_hotlist -o $mc_conf::mc_hotlist",
		path => '/bin:/sbin:/usr/bin:/usr/sbin'
	} ~> Exec['mc_conf_killall_mc']
}

