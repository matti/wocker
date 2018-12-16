# frozen_string_literal: true

module Wocker
  module Cli
    class ExecCommand < Clamp::Command
      parameter "COMMAND ...", "command"
      option "--workdir", "WORKDIR", "workdir"

      def execute
        command_list.insert 0, "cd"
        current_workdir = workdir || Wockerfile.workdir || "/vagrant"
        command_list.insert 1, "#{current_workdir};"

        cmd = command_list.join " "
        Wocker::Vagrant.run "winrm", "-c", cmd
      end
    end
  end
end
