module LinuxInput
  module Uinput
    class_eval File.read(File.join(File.dirname(__FILE__), 'generated/uinput.rb'))

    UI_DEV_CREATE  = Ioctl.IO(UINPUT_IOCTL_BASE, 1)
    UI_DEV_DESTROY = Ioctl.IO(UINPUT_IOCTL_BASE, 2)
    UI_DEV_SETUP   = Ioctl.IOW(UINPUT_IOCTL_BASE, 3, UinputSetup.by_value)
    UI_ABS_SETUP   = Ioctl.IOW(UINPUT_IOCTL_BASE, 4, UinputAbsSetup.by_value)

    UI_SET_EVBIT   = Ioctl.IOW(UINPUT_IOCTL_BASE, 100, :int)
    UI_SET_KEYBIT  = Ioctl.IOW(UINPUT_IOCTL_BASE, 101, :int)
    UI_SET_RELBIT  = Ioctl.IOW(UINPUT_IOCTL_BASE, 102, :int)
    UI_SET_ABSBIT  = Ioctl.IOW(UINPUT_IOCTL_BASE, 103, :int)
    UI_SET_MSCBIT  = Ioctl.IOW(UINPUT_IOCTL_BASE, 104, :int)
    UI_SET_LEDBIT  = Ioctl.IOW(UINPUT_IOCTL_BASE, 105, :int)
    UI_SET_SNDBIT  = Ioctl.IOW(UINPUT_IOCTL_BASE, 106, :int)
    UI_SET_FFBIT   = Ioctl.IOW(UINPUT_IOCTL_BASE, 107, :int)
    UI_SET_PHYS    = Ioctl.IOW(UINPUT_IOCTL_BASE, 108, :pointer)
    UI_SET_SWBIT   = Ioctl.IOW(UINPUT_IOCTL_BASE, 109, :int)
    UI_SET_PROPBIT = Ioctl.IOW(UINPUT_IOCTL_BASE, 110, :int)

    UI_BEGIN_FF_UPLOAD = Ioctl.IOWR(UINPUT_IOCTL_BASE, 200, UinputFfUpload.by_value)
    UI_END_FF_UPLOAD   = Ioctl.IOW(UINPUT_IOCTL_BASE,  201, UinputFfUpload.by_value)
    UI_BEGIN_FF_ERASE  = Ioctl.IOWR(UINPUT_IOCTL_BASE, 202, UinputFfErase.by_value)
    UI_END_FF_ERASE    = Ioctl.IOW(UINPUT_IOCTL_BASE,  203, UinputFfErase.by_value)

    def self.UI_GET_SYSNAME(len) Ioctl.IOC(Ioctl::IOC_READ, UINPUT_IOCTL_BASE, 44, len) end
    UI_GET_VERSION = Ioctl.IOR(UINPUT_IOCTL_BASE, 45, :uint)
  end
end
