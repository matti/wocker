# frozen_string_literal: true
require_relative "keyboard/key_command"
require_relative "keyboard/write_command"

module Wocker
  module Cli
    class KeyboardCommand < Clamp::Command
      subcommand ["key"], "press keys", KeyboardCommand::KeyCommand
      subcommand ["write"], "write string", KeyboardCommand::WriteCommand

      def execute
        puts "see --help"
      end
    end
  end
end

