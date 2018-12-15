# frozen_string_literal: true

module Wocker
  module Cli
    class ExecCommand < Clamp::Command
      parameter "COMMAND ...", "command"

      def execute
        cmd = command_list.join " "
        Wocker::Vagrantfile.run "winrm", "-c", cmd
      end
    end
  end
end
