use std::io::prelude::*;
use std::fs::File;

const XOR_KEY: u8 = 0xFF;
const BUFFER_SIZE: usize = 2048;

fn main() -> std::io::Result<()> {
    let mut buffer = [0; BUFFER_SIZE];

    let mut file_path = "gta3.img".to_owned();
    let mut input_file = File::open(&file_path)?;

    file_path.push_str("-xor");
    let mut output_file = File::create(&file_path)?;
   
    loop {
        let bytes_read = input_file.read(&mut buffer)?;
        if bytes_read == 0 {
            break;
        }

        for byte in buffer.iter_mut() {
            *byte ^= XOR_KEY;
        }

        output_file.write(&buffer[..bytes_read])?;
    }

    Ok(())
}