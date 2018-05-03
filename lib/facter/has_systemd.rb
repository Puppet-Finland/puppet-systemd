Facter.add('has_systemd') do
  has_systemctl = File.file?('/bin/systemctl')
  if has_systemctl
    retval = true
  else
    retval = false
  end
  setcode do
    retval
  end
end
