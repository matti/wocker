require 'pty'

module Wocker
  module Vagrant
    def self.run(*args)
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
    end
  end
end
