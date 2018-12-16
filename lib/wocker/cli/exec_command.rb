# frozen_string_literal: true
require "kommando"
require "fileutils"

# frozen_string_literal: true
require "kommando"
require "fileutils"

module Wocker
  module Cli
    class ExecCommand < Clamp::Command
      parameter "COMMAND ...", "command"
      option "--workdir", "WORKDIR", "workdir"
      option ["--interactive", "-i"], :flag, "interactive"
      option ["--detach", "-d"], :flag, "detach"

      def execute
        best_guess_workdir = workdir || Wockerfile.workdir || "/vagrant"
        best_guess_workdir_cmdfied = best_guess_workdir.gsub("/", "\\")
        best_workdir_cmd = "C:\\#{best_guess_workdir_cmdfied}"

        cmd = command_list.join " "
        if detach?
          if workdir
            STDERR.puts "workdir not supported with detach"
            exit 1
          end

          interactive_flags = "-i 1" if interactive?

          psexec_wrapper_cmd = "psexec -accepteula -nobanner -d -s #{interactive_flags} #{cmd} >nul 2>&1"
          Wocker::Vagrant.run "winrm", "-s", "cmd", "-c", psexec_wrapper_cmd
        elsif interactive?
          File.unlink "wocker-exec-out" if File.exist? "wocker-exec-out"

          psexec_wrapper_cmd = "psexec -accepteula -nobanner -s -i 1 cmd.exe /C \"cd #{best_workdir_cmd} & #{cmd} >C:\\vagrant\\wocker-exec-out 2>&1\" >nul 2>&1"

          psexec_thr = Thread.new do
            Wocker::Vagrant.run "winrm", "-s", "cmd", "-c", psexec_wrapper_cmd
          end
          FileUtils.touch "wocker-exec-out"
          log_tail_k = Kommando.run_async "tail -f wocker-exec-out", output: true

          require 'io/console'
          loop do
            c = STDIN.getch
            case c
            when "\u0003"
              `wocker keyboard key control c`
            when "\r"
              `wocker keyboard key enter`
            else
              `wocker keyboard write #{c}`
            end

            sleep 0.1
          end

          psexec_thr.join
          log_tail_k.kill

          File.unlink "wocker-exec-out" if File.exist? "wocker-exec-out"

        else
          Wocker::Vagrant.run "winrm", "-c", "cd #{best_guess_workdir}; #{cmd}"
        end
      end
    end
  end
end
