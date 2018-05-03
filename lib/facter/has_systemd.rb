Facter.add('has_systemd') do
  if File.file?('/bin/systemctl') then
    retval = true
  else
    retval = false
  end

  setcode do
    retval
  end
end
