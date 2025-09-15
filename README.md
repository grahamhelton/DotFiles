# README

# Set caps to escape for good

```bash
# Add the following to /etc/default/keyboard

XKBOPTIONS="caps:escape"
```

then run: `sudo dpkg-reconfigure keyboard-configuration` and `reboot`

# Screen brightness

The screen brightness keys on my thinkpad don't work when switching from gnometoi3. This is because there is some handler in gnome that i3wm doesn't have (because i3 is just a window manager).

brightnessctl can be used to control the brightness from the cli.

```bash
brightnessctl set +5%
brightnessctl set 5%-
```

Or from within i3:

```bash
bindsym XF86MonBrightnessUp exec brightnessctl set +5%
bindsym XF86MonBrightnessDown exec brightnessctl set 5%-
```

Also note the path `/sys/class/leds` is the config file that controls these

"In its simplest form, the LED class just allows control of LEDs from userspace.LEDs appear in /sys/class/leds/. The maximum brightness of the LED is defined in max_brightness file. The brightness file will set the brightness of the LED (taking a value 0-max_brightness). Most LEDs don’t have hardware brightness support so will just be turned on for non-zero brightness settings."


# Reading

https://docs.kernel.org/leds/leds-class.html/
