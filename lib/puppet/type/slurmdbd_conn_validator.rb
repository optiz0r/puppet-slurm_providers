Puppet::Type.newtype(:slurmdbd_conn_validator) do
  desc <<-DESC
Verify that a connection can be successfully established between a node
and the slurmdbd server.  Its primary use is as a precondition to
prevent configuration changes from being applied if the slurmdbd
server cannot be reached.
  DESC

  ensurable

  newparam(:name, namevar: true) do
    desc 'An arbitrary name used as the identity of the resource.'
  end

  newparam(:timeout) do
    desc 'The max number of seconds that the validator should wait before giving up and deciding that slurmdbd is not running; defaults to 30 seconds.'
    defaultto 30

    validate do |value|
      # This will raise an error if the string is not convertible to an integer
      Integer(value)
    end

    munge do |value|
      Integer(value)
    end
  end

  autorequire(:service) do
    ['slurmdbd']
  end
end
