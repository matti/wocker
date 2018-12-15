# frozen_string_literal: true

module Wocker
  module Cli
    class BuildCommand < Clamp::Command
      option "--interface", "INTERFACE", "network interface"

      def execute
        Wocker::Vagrantfile.run "destroy", "-f"
        Wocker::Vagrantfile.run "up", interface: interface
      end
    end
  end
end
