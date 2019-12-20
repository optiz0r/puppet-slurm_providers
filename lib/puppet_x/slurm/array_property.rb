# Class to share among array properties
class PuppetX::SLURM::ArrayProperty < Puppet::Property
  def insync?(is)
    Array(is).sort == Array(@should).sort
  end

  def change_to_s(currentvalue, newvalue)
    currentvalue = currentvalue.join(',') if currentvalue != :absent
    newvalue = newvalue.join(',')
    super(currentvalue, newvalue)
  end

  def is_to_s(currentvalue) # rubocop:disable Style/PredicateName
    if currentvalue.is_a?(Array)
      currentvalue.join(',')
    else
      currentvalue
    end
  end
  alias should_to_s is_to_s
end
