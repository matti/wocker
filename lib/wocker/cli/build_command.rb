# frozen_string_literal: true

module Wocker
  module Cli
    class BuildCommand < Clamp::Command
      option "--interface", "INTERFACE", "network interface"
      option "--choco", :flag, "install chocolatey"

      def execute
        v = Wocker::Vagrantfile.new interface: interface, choco: choco?
        v.create_from_wockerfile!

        Wocker::Vagrant.run "destroy", "-f"
        Wocker::Vagrant.run "up"
      end
    end
  end
end
