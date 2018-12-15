# frozen_string_literal: true

module Wocker
  module Cli
    class RestartCommand < Clamp::Command
      def execute
        Wocker::Vagrantfile.run "reload"
      end
    end
  end
end
