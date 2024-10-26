import os
from subprocess import run
import sys
import time

banner_path = sys.argv[1]


seed = str(int(time.time()))

animation=[
[
"   🝠ܢ      ",
"  (^˕^)ᜪ_⎠  ",
"  |ˎ     )  ",
"  ૮ᒐ \"\"૮ᒐᐟ  ",
],
[
"  /ᐠ_🝠     ",
" (^˕^ )__⎠  ",
"  |ˎ     )  ",
"  ᒐ૮ \"\"ᒐ૮ᐟ  ",
],
[
"  ᨈ /\\      ",
" (^˕^)___/  ",
"  |ˎ     )  ",
"  ૮ᒐ \"\"૮ᒐᐟ  ",
],
[
"  /ᐠ_🝠     ",
" (^˕^ )__/  ",
"  |ˎ     )  ",
"  ᒐ૮ \"\"ᒐ૮ᐟ  ",
]]

frame_w = 12
frame_h = 4

temp_dir = os.path.join(os.path.dirname(banner_path), "temp")

if not os.path.exists(temp_dir):
    os.makedirs(temp_dir)

for file in os.listdir(temp_dir):
    os.remove(os.path.join(temp_dir, file))

temp_file = os.path.join(temp_dir, f"{seed}.txt")
print(temp_file)

with open(banner_path, 'r', encoding="utf-8") as file:
    banner = file.read().splitlines()

banner_w = len(banner[0])
banner_h = len(banner)

width = 70
height = 11

banner_x = (width - banner_w) // 2

x = 40
y = height - frame_h
i = 0
while True:
    if x <= -frame_w:
        x = width

    frame = animation[i % 4]

    content = [' ' * width for _ in range(height)]

    # Add the banner
    for j, line in enumerate(banner):
        content[j] = content[j][:banner_x] + line + content[j][banner_x + banner_w:]

    # Add the frame
    for j, line in enumerate(frame):
        out = content[y+j]
        if x + frame_w > width:
            out = out[:x] + line[:width - x]
        elif x < 0:
            out = line[-x:] + out[frame_w + x:]
        else:
            out = out[:x] + line + out[x + frame_w:]
        content[y+j] = out

    with open(temp_file, 'w', encoding="utf-8") as file:
        file.write("\n".join(content))

    print("\033[H\033[J", end="\n")
    # run(["lolcrab", "-a", temp_file], text=True)
    run(["lolcrab", "-S", seed, temp_file], text=True)
    time.sleep(0.5)
    i += 1
    x -= 1
