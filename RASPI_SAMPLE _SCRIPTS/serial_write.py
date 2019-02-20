import serial
import time

# ser = serial.Serial('/dev/ttyUSB0') 


try:
	ser = serial.Serial(
	    port='/dev/ttyAMA0',
	    baudrate = 9600, 
	    parity=serial.PARITY_NONE, 
	    stopbits=serial.STOPBITS_ONE, 
	    bytesize=serial.EIGHTBITS, 
	    timeout=10
	)

	while True:
	    ser.write(b'Matthieu, 6, hsgfcyegsrygrhjsdgrhkewgshrgkhewjgregghjcerr, 9, iashecjasbdawhehwahrbhj;')
	    print(" data sent")
	    time.sleep(4)

except e:
	print(e)
	pass
finally:
	ser.close()
	pass