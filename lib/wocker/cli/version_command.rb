# frozen_string_literal: true

module Wocker
  module Cli
    class VersionCommand < Clamp::Command
      def exec
        puts Wocker::VERSION
      end
    end
  end
end
