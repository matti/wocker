# frozen_string_literal: true

module Wocker
  module Cli
    class RestartCommand < Clamp::Command
      def execute
        Wocker::Vagrant.run "reload"
      end
    end
  end
end
