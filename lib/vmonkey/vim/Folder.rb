class RbVmomi::VIM::Folder
  def vm_pool
    monkey.cluster.resourcePool
  end

  def vm_folder
    self
  end

  def findByInstanceUuid uuid, type=RbVmomi::VIM::VirtualMachine, dc=nil
    propSpecs = {
      :entity => self, :uuid => uuid, :instanceUuid => true,
      :vmSearch => type == RbVmomi::VIM::VirtualMachine
    }
    propSpecs[:datacenter] = dc if dc
    x = _connection.searchIndex.FindByUuid(propSpecs)
    x if x.is_a? type
  end

end