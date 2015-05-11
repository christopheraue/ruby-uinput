namespace :ffi do
  desc 'Generate ffi interface'
  task :generate do
    `swig -xml -o ioctl_wrap.xml  -I/usr/include swig/ioctl.i`
    `swig -xml -o input_wrap.xml  -I/usr/include swig/input.i`
    `swig -xml -o uinput_wrap.xml -I/usr/include swig/uinput.i`

    `ffi-gen ioctl_wrap.xml  lib/uinput/generated/ioctl.rb`
    `ffi-gen input_wrap.xml  lib/uinput/generated/input.rb`
    `ffi-gen uinput_wrap.xml lib/uinput/generated/uinput.rb`

    `sed -i 's/\\([0-9]\\)U/\\1/g' lib/uinput/generated/ioctl.rb`
    `sed -i 's/_IO/IO/g' lib/uinput/generated/ioctl.rb`
    `sed -i 's/ff_effect_u/FfEffectU/g' lib/uinput/generated/input.rb`
    `sed -i 's/UINPUT_IOCTL_BASE = U/UINPUT_IOCTL_BASE = ?U.ord/g' lib/uinput/generated/uinput.rb`
    `sed -i 's/a(ABS_CNT).__s32/[:int, ABS_CNT]/g' lib/uinput/generated/uinput.rb`

    `rm -f ioctl_wrap.xml uinput_wrap.xml input_wrap.xml`
  end
end