require 'fileutils'

module Wocker
  class Virtualbox
    def self.first_running_vm_name
      output = `VBoxManage list runningvms`
      vm_name, _ = output.split(' ')
      vm_name
    end
  end
end
