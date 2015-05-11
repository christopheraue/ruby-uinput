require_relative '../uinput'

module UInput
  class Device
    def initialize
      @fd = IO.sysopen('/dev/uinput', Fcntl::O_WRONLY | Fcntl::O_NDELAY)
      @fd.ioctl(UI_SET_EVBIT, EV_KEY)
    end
  end
end