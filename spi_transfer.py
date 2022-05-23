# Python program for transferring image RGB data over SPI.
# Designed for connecting with an FPGA storing the data, with a maximum resolution of 480x270

#import spidev
from PIL import image # For reading image RGB values

# The only one available on the Raspberry Pi
bus = 0

# Depends on the chip select pin
device = 0

# Enable SPI and open a connection
#spi = spidev.SpiDev()
#spi.open(bus, device)

# Configure SPI
#spi.max_speed_hz = 1000000
#spi.mode = 0

# Transfer start of protocol
spi_bytes = [0x42, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
#xfer2(spi_bytes)

# Transfer of RGB data from image
im = image.open('image.jpg', 'r')
width, height = image.size
pixel_values = list(im.getdata())


# VALUES = [0x00, 0x01, 0x02]
# i = 0
# while i != 0xEND 
	# xfer2(VALUES) # xfer2 holds chip-select active between bytes

# Transfer end of protocol
spi_bytes = [0x45, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
#xfer2(spi_bytes)

#close()
