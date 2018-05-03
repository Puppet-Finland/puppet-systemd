Facter.add('has_systemd') do
  retval = if File.file?('/bin/systemctl')
             true
           else
             false
           end
  setcode do
    retval
  end
end
