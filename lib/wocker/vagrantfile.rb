require 'open3'
require 'erb'

module Wocker
  module Vagrantfile
    def self.run *args, interface: nil
      wockerfile = Wockerfile.new "Wockerfile"
      instructions = wockerfile.parse

      from = instructions["from"]
      runs = instructions["runs"]
      ports = instructions["ports"]

      self.create from: from, runs: runs, ports: ports, interface: interface

      require "pty"

      stderr_reader, stderr_writer = IO.pipe

      stdout,stdin,pid = PTY.spawn("vagrant", *args, err: stderr_writer.fileno)
      stderr_writer.close
      stdin_thr = Thread.new do
        stdin.close
      end

      stdout_thr = Thread.new do
        while line = stdout.gets
          print line
        end
      end

      stderr_thr = Thread.new do
        while line = stderr_reader.gets
          print line
        end
      end

      stdin_thr.join
      stdout_thr.join
      stderr_thr.join

      self.remove
    end

    private
    def self.create(from:, runs:, ports:, interface: nil)
      @wocker_from = from
      @wocker_runs = runs
      @wocker_ports = ports
      @wocker_interface = interface

      source_path = File.expand_path(
        File.join(
        __dir__,
        "..","..",
        "templates", "Vagrantfile"
      ))
      vagrantfile_template = File.read source_path
      vagrantfile_contents = ERB.new(vagrantfile_template).result(binding)

      File.write "Vagrantfile", vagrantfile_contents
    end

    def self.remove
      return if ENV["WOCKER_VAGRANTFILE_KEEP"] == "yes"
      File.unlink "Vagrantfile"
    end
  end
end
