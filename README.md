# Uinput

FFI Structs and Constants of to use uinput with ruby. Depends on the [linux_input](http://github.com/christopheraue/ruby-linux_input)
gem.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'uinput'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install uinput

## Usage

```ruby
require 'uinput'
```

Creating a new virtual keyboard having an A key:

```ruby
file = File.open('/dev/uinput', Fcntl::O_WRONLY | Fcntl::O_NDELAY)
device = Uinput::UinputUserDev.new

device[:name] = "Virtual Ruby Device"
device[:id][:type] = LinuxInput::BUS_VIRTUAL
device[:id][:vendor] = 0
device[:id][:product] = 0
device[:id][:version] = 0

file.ioctl(Uinput::UI_SET_KEYBIT, LinuxInput::KEY_A)
file.ioctl(Uinput::UI_SET_EVBIT, LinuxInput::EV_KEY)
file.ioctl(Uinput::UI_SET_EVBIT, LinuxInput::EV_SYN)

file.syswrite(device.pointer.read_bytes(device.size))
file.ioctl(Uinput::UI_DEV_CREATE)
```

Typing an 'a' on our keyboard:

```ruby
# key down event
event = LinuxInput::InputEvent.new
event[:time] = LinuxInput::Timeval.new
event[:time][:tv_sec] = Time.now.to_i
event[:type] = LinuxInput::EV_KEY
event[:code] = LinuxInput::KEY_A
event[:value] = 1
file.syswrite(event.pointer.read_bytes(event.size))

# sync event for key down
event = LinuxInput::InputEvent.new
event[:time] = LinuxInput::Timeval.new
event[:time][:tv_sec] = Time.now.to_i
event[:type] = LinuxInput::EV_SYN
event[:code] = LinuxInput::SYN_REPORT
event[:value] = 0
file.syswrite(event.pointer.read_bytes(event.size))

# key up event
event = LinuxInput::InputEvent.new
event[:time] = LinuxInput::Timeval.new
event[:time][:tv_sec] = Time.now.to_i
event[:type] = LinuxInput::EV_KEY
event[:code] = LinuxInput::KEY_A
event[:value] = 0
file.syswrite(event.pointer.read_bytes(event.size))

# sync event for key up
event = LinuxInput::InputEvent.new
event[:time] = LinuxInput::Timeval.new
event[:time][:tv_sec] = Time.now.to_i
event[:type] = LinuxInput::EV_SYN
event[:code] = LinuxInput::SYN_REPORT
event[:value] = 0
file.syswrite(event.pointer.read_bytes(event.size))
```

## (Re-)Compiling the interface on a linux machine

Reads your local linux/uinput.h

```
$ rake ffi:generate
```
