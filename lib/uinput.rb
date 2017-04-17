require 'fcntl'
require 'linux_input'

require_relative "uinput/version"
require_relative 'uinput/uinput.rb'

Uinput = LinuxInput::Uinput

module Uinput
  FILE_PATH = '/dev/uinput'

  def self.open_file(mode = Fcntl::O_RDWR)
    File.open(FILE_PATH, mode)
  end

  def self.version
    @version ||= begin
      pack_size = case FFI.type_size(:uint)
        when 2 then 's'
        when 4 then 'L'
        when 8 then 'Q'
      end

      version = [0].pack pack_size
      open_file.ioctl UI_GET_VERSION, version
      version.unpack(pack_size).first
    end
  end
end

