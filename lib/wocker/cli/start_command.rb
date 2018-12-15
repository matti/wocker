# frozen_string_literal: true

module Wocker
  module Cli
    class StartCommand < Clamp::Command
      def execute
        Wocker::Vagrantfile.run "up"
      end
    end
  end
end
