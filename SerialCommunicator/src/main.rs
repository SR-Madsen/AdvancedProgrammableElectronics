fn main() {
    let mut uart_port = serialport::new("/dev/ttyUSB1", 1000000).open().expect("Failed to open port.");
    
    uart_port.set_data_bits(serialport::DataBits::Eight);

    uart_port.write(b"#w:00AABBCCDD");
    uart_port.write(b"#r:00..........");
    //uart_port.read()
}