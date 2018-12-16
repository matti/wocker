# frozen_string_literal: true

module Wocker
  module Cli
    class KeyboardCommand < Clamp::Command
      class KeyCommand < Clamp::Command
        parameter "KEY ...", "control alt del"

        def execute
          first_vm_name = Wocker::Virtualbox.first_running_vm_name

          scancodes = case key_list
          when ["control","alt","del"]
            "1d 38 53 d3 b8 9d"
          when ["enter"]
            "1c"
          else
            puts "unknown: #{key_list.inspect}"
            exit 1
          end

          `VBoxManage controlvm #{first_vm_name} keyboardputscancode #{scancodes}`
        end
      end
    end
  end
end
