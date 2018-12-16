# frozen_string_literal: true

module Wocker
  module Cli
    class StartCommand < Clamp::Command
      def execute
        Wocker::Vagrant.run "up"
      end
    end
  end
end
