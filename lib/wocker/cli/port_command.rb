# frozen_string_literal: true

module Wocker
  module Cli
    class PortCommand < Clamp::Command
      def execute
        Wocker::Vagrantfile.run "port"
      end
    end
  end
end
