# frozen_string_literal: true

module Wocker
  module Cli
    class PsCommand < Clamp::Command
      def execute
        Wocker::Vagrant.run "status"
      end
    end
  end
end
