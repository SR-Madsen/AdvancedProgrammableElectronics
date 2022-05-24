# Python program for transferring image RGB data over SPI.
# Designed for connecting with an FPGA storing the data, with a maximum resolution of 480x270

import spidev
from PIL import Image # For reading image RGB values

bus = 0 # The only one available on the Raspberry Pi
device = 0 # Depends on the chip select pin

# Enable SPI and open a connection
spi = spidev.SpiDev()
spi.open(bus, device)

# Configure SPI
spi.max_speed_hz = 1000000
spi.mode = 0


# Transfer start of protocol
spi_bytes = [0x42, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
xfer2(spi_bytes) # xfer2 holds chip-select active between bytes

# Transfer of RGB data from image
im = Image.open('image.jpg', 'r')
width, height = im.size
pixel_values = list(im.getdata())

for i in range(height):
	for j in range(width):
		address = 480*i+j
		address_bytes = address.to_bytes(3, 'little')
		R, G, B = pixel_values[480*i+j]
		Rb = R.to_bytes(1, 'little')
		Gb = G.to_bytes(1, 'little')
		Bb = B.to_bytes(1, 'little')
		spi_bytes = [0x57, address_bytes[2], address_bytes[1], address_bytes[0], Rb[0], Gb[0], Bb[0], 0x00]
		xfer2(spi_bytes)

# Transfer end of protocol
spi_bytes = [0x45, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
xfer2(spi_bytes)

close()