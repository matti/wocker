# frozen_string_literal: true

module Wocker
  module Cli
    class InitCommand < Clamp::Command
      def execute
        FileUtils.cp File.join(Wocker.gem_root_path, "templates", "Wockerfile"), "Wockerfile"
      end
    end
  end
end
