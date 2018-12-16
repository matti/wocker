require "clamp"
Clamp.allow_options_after_parameters = true

module Wocker
  module Cli
  end
end

require_relative "cli/version_command"
require_relative "cli/build_command"
require_relative "cli/exec_command"
require_relative "cli/rm_command"
require_relative "cli/restart_command"
require_relative "cli/start_command"
require_relative "cli/stop_command"
require_relative "cli/ps_command"
require_relative "cli/port_command"
require_relative "cli/init_command"
require_relative "cli/keyboard_command"

require_relative "cli/root_command"
