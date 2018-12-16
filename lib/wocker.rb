module Wocker
  def self.gem_root_path
    File.expand_path(
      File.join(
        __dir__,
        ".."
      )
    )
  end
end

require_relative "wocker/version"
require_relative "wocker/wockerfile"
require_relative "wocker/vagrant"
require_relative "wocker/vagrantfile"
require_relative "wocker/vagrantfile_template"
require_relative "wocker/virtualbox"
