## Alias for battery life
alias bat='upower -i /org/freedesktop/UPower/devices/battery_BAT1 | grep -E '\''percentage:|state:|time to (full|empty):'\'''
