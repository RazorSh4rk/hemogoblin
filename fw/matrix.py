from adafruit_mcp230xx.mcp23017 import MCP23017
import time, digitalio

class Matrix:
    def __init__(self, i2c):
        self.hemo_mcp = MCP23017(i2c, address=0x20) 

        self.hemo_rows = [self.hemo_mcp.get_pin(i) for i in range(0, 5)]
        self.hemo_cols = [self.hemo_mcp.get_pin(i) for i in range(5, 12)]
        
        for pin in self.hemo_rows:
            pin.direction = digitalio.Direction.INPUT
            pin.pull = digitalio.Pull.DOWN
        
        for pin in self.hemo_cols:
            pin.direction = digitalio.Direction.OUTPUT
            pin.value = False
    
    def scan(self):
        print("scanning")
        evt = {}
        
        for h_col in self.hemo_cols:
            h_col.value = True
            
            for h_row in self.hemo_rows:
                if h_row.value:
                    print(h_col, h_row)
            
            time.sleep(0.01)
            h_col.value = False