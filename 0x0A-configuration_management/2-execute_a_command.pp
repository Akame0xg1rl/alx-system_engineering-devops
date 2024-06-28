# This Puppet manifest kills a process named killmenow using pkill,
# only if the process is currently running.

exec { 'killmenow':
  command     => 'pkill -9 killmenow',
  path        => '/usr/bin:/usr/sbin:/bin:/sbin',
  onlyif      => 'pgrep killmenow',
  provider    => shell,
  logoutput   => true,
  unless      => 'pgrep killmenow',
}

