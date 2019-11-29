class mc_conf {
	$mc_hotlist = '/root/.mc/hotlist'
	$mc_hotlist_48 = '/root/.config/mc/hotlist'
	package {'mc':			ensure => 'installed' } ->
	file {'/root/.mc':
		ensure => directory,
		owner => 'root',
		group => 'root',
		mode => '0700'
	} ->
	file { $mc_hotlist:
		ensure => file,
		owner => 'root',
		group => 'root',
		mode => '0644'
	}->
	file {'/root/.config':
		ensure => directory,
		owner => 'root',
		group => 'root',
		mode => '0700'
	} ->
	file {'/root/.config/mc':
		ensure => directory,
		owner => 'root',
		group => 'root',
		mode => '0700'
	} ->
	file { $mc_hotlist_48:
		ensure => file,
		owner => 'root',
		group => 'root',
		mode => '0644'
	}->
	file {'/root/.mc/ini':
		owner => 'root',
		group => 'root',
		source => 'puppet:///modules/mc_conf/ini',
		mode => '0644'
	} ->
	file {'/root/.config/mc/ini':
		owner => 'root',
		group => 'root',
		source => 'puppet:///modules/mc_conf/ini',
		mode => '0644'
	} ~>
	exec {'mc_conf_killall_mc':
		refreshonly => true,
		command => 'killall mc mcedit || echo "No mc running"',
		path => '/bin:/sbin:/usr/bin:/usr/sbin'
	}
	exec { "mc_conf_hotlist_update":
		refreshonly => true,
		command => "sort $mc_conf::mc_hotlist -o $mc_conf::mc_hotlist",
		path => '/bin:/sbin:/usr/bin:/usr/sbin'
	} ~> Exec['mc_conf_killall_mc']
}

