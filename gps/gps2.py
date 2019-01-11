import serial
from time import sleep
import adafruit_gps


uart = serial.Serial("/dev/serial0", baudrate=9600, timeout=10)
print(uart.name)
gps = adafruit_gps.GPS(uart, debug=True)


gps.send_command(b'PMTK314,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0')
sleep(1)
gps.send_command(b'PMTK220,1000')
sleep(1)

while True:
	sentence = gps.readline()
	print(sentence)
	print(str(sentence, 'ascii').strip())

