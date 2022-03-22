use std::{thread, time};

fn main() {
    // Open the serial port
    let mut uart_port: Box<dyn serialport::SerialPort> = serialport::new("/dev/ttyUSB1", 1000000).open().expect("Failed to open port.");
    
    // Set the data bits, flow control, parity, and stop bit
    let mut _result: Result<(), serialport::Error> = uart_port.set_data_bits(serialport::DataBits::Eight);
    _result = uart_port.set_flow_control(serialport::FlowControl::None);
    _result = uart_port.set_parity(serialport::Parity::None);
    _result = uart_port.set_stop_bits(serialport::StopBits::One);

    let ten_millis = time::Duration::from_millis(500);

    loop{
        // Write to address 0, then immediately read.
        let mut _sent: Result<usize, std::io::Error> = uart_port.write(b"#w:00AABBCCDD");
        _sent = uart_port.write(b"#r:00..........");

        // Read received data
        let mut buffer: [u8; 6] = [0; 6];
        let _recv: Result<usize, std::io::Error> = uart_port.read(&mut buffer[..]);

        println!("The bytes: {:?}", &buffer[..]);

        thread::sleep(ten_millis);
    }
}