# frozen_string_literal: true

module Wocker
  module Cli
    class RootCommand < Clamp::Command
      banner "wocker 🐒"

      option ['-v', '--version'], :flag, "Show version information" do
        puts Wocker::VERSION
        exit(0)
      end

      subcommand ["version"], "Show version information", VersionCommand
      subcommand ["build"], "build", BuildCommand
      subcommand ["exec"], "exec", ExecCommand
      subcommand ["rm"], "rm", RmCommand
      subcommand ["start"], "start", StartCommand
      subcommand ["stop"], "stop", StopCommand
      subcommand ["ps"], "ps", PsCommand
      subcommand ["port"], "port", PortCommand
      subcommand ["restart"], "restart", RestartCommand
      subcommand ["init"], "init", InitCommand

      def self.run
        super
      rescue StandardError => exc
        warn exc.message
        warn exc.backtrace.join("\n")
      end
    end
  end
end
