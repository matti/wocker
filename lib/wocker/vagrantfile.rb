require 'fileutils'

module Wocker
  class Vagrantfile
    def initialize(interface: nil, choco: false)
      @interface = interface
      @choco = choco
    end

    def create_from_wockerfile! *args
      v = VagrantfileTemplate.new
      v.wocker_from = Wockerfile.from
      v.wocker_runs = Wockerfile.runs
      v.wocker_ports = Wockerfile.ports
      v.wocker_interface = @interface
      v.wocker_installs = []

      if @choco
        v.wocker_installs << File.join(Wocker.gem_root_path, "scripts", "wocker-install-chocolatey.ps1")
      end

      File.write "Vagrantfile", v.render(File.read(File.join(Wocker.gem_root_path, "templates", "Vagrantfile")))
    end
  end
end
