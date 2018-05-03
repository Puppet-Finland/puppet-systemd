Facter.add('has_systemd') do
  if File.file?('/bin/systemctl')
    retval = true
  else
    retval = false
  end

  setcode do
    retval
  end
end
