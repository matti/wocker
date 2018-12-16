# frozen_string_literal: true

module Wocker
  module Cli
    class KeyboardCommand < Clamp::Command
      class WriteCommand < Clamp::Command
        parameter "STRING", "string"

        def execute
          first_vm_name = Wocker::Virtualbox.first_running_vm_name

          `VBoxManage controlvm #{first_vm_name} keyboardputstring #{string}`
        end
      end
    end
  end
end
