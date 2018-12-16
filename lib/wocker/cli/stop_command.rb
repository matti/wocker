# frozen_string_literal: true

module Wocker
  module Cli
    class StopCommand < Clamp::Command
      def execute
        Wocker::Vagrant.run "suspend"
      end
    end
  end
end
