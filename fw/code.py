"""CircuitPython I2C Device Address Scan"""
# If you run this and it seems to hang, try manually unlocking
# your I2C bus from the REPL with
#  >>> import board
#  >>> board.I2C().unlock()

import time, board, adafruit_ssd1306, adafruit_framebuf
import busio, digitalio, keymap, matrix, storage

# scan for i2c addresses
i2c = board.I2C()
while not i2c.try_lock():
    pass

addr = None
try:
    addr = [hex(address) for address in i2c.scan()]
except:
    print("error")
finally:
    i2c.unlock()
# ----------------------

oled = adafruit_ssd1306.SSD1306_I2C(128, 32, i2c, addr=0x3c)

# show i2c addresses
oled.fill(0)
for i, a in enumerate(addr):
    oled.text(a, 0, i * 8, 1) 
oled.show()
i2c.unlock()

matrix = matrix.Matrix(i2c)
while True:
    matrix.scan()
    print("---------------------")
    time.sleep(5) 

i2c.unlock()