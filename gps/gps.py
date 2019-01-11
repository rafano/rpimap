import serial
import RPi.GPIO as GPIO
import time

GPIO.setwarnings(False)

time.sleep(1)
GPIO.setmode(GPIO.BCM)
chan_list = [8,10] 

GPIO.setup(10, GPIO.IN)
time.sleep(1)
GPIO.setup(8, GPIO.IN)
time.sleep(1)
while(1):
	xd = GPIO.input(8)
	time.sleep(1)
	xd1 = GPIO.input(10)
	time.sleep(1)
	print(xd)
	print(xd1)
	
