# frozen_string_literal: true

module Wocker
  module Cli
    class RestartCommand < Clamp::Command
      def execute
        Wocker::Vagrant.run "reload"
        puts "sending control+alt+del"
        `wocker keyboard key control alt del`
        sleep 1
        puts "writing vagrant"
        `wocker keyboard write vagrant`
        puts "pressing enter"
        `wocker keyboard key enter`
      end
    end
  end
end
