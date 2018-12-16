# frozen_string_literal: true

module Wocker
  module Cli
    class ExecCommand < Clamp::Command
      parameter "COMMAND ...", "command"

      def execute
        command_list.insert 0, "cd"
        workdir = if Wockerfile.workdir
          Wockerfile.workdir
        else
          "/vagrant"
        end
        command_list.insert 1, "#{workdir};"

        cmd = command_list.join " "
        Wocker::Vagrant.run "winrm", "-c", cmd
      end
    end
  end
end
