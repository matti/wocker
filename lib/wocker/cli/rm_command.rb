# frozen_string_literal: true

module Wocker
  module Cli
    class RmCommand < Clamp::Command
      def execute
        Wocker::Vagrant.run "destroy", "-f"
      end
    end
  end
end
