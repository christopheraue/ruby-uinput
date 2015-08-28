namespace :ffi do
  desc 'Generate ffi interface'
  task :generate do
    `swig -xml -o uinput_wrap.xml -I/usr/include swig/uinput.i`

    `ffi-gen uinput_wrap.xml lib/uinput/generated/uinput.rb`

    `sed -i 's/UINPUT_IOCTL_BASE = U/UINPUT_IOCTL_BASE = ?U.ord/g' lib/uinput/generated/uinput.rb`
    `sed -i 's/a(ABS_CNT).__s32/[:int, ABS_CNT]/g' lib/uinput/generated/uinput.rb`

    `rm -f uinput_wrap.xml`
  end
end