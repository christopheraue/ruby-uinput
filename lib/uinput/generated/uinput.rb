  #generated from UINPUT_VERSION = 5
  UINPUT_MAX_NAME_SIZE = 80
  class UinputFfUpload < FFI::Struct
    layout(
           :request_id, :uint,
           :retval, :int,
           :effect, FfEffect,
           :old, FfEffect
    )
  end
  class UinputFfErase < FFI::Struct
    layout(
           :request_id, :uint,
           :retval, :int,
           :effect_id, :uint
    )
  end
  UINPUT_IOCTL_BASE = ?U.ord
  class UinputSetup < FFI::Struct
    layout(
           :id, InputId,
           :name, [:char, 80],
           :ff_effects_max, :uint
    )
  end
  class UinputAbsSetup < FFI::Struct
    layout(
           :code, :ushort,
           :absinfo, InputAbsinfo
    )
  end
  EV_UINPUT = 0x0101
  UI_FF_UPLOAD = 1
  UI_FF_ERASE = 2
  class UinputUserDev < FFI::Struct
    layout(
           :name, [:char, 80],
           :id, InputId,
           :ff_effects_max, :uint,
           :absmax, [:int, ABS_CNT],
           :absmin, [:int, ABS_CNT],
           :absfuzz, [:int, ABS_CNT],
           :absflat, [:int, ABS_CNT]
    )
  end
