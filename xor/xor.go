package main

import "os"

const (
	XOR_KEY = 0xFF
	BUFFER_SIZE = 1024 * 2
)

func check(e error) {
	if e != nil {
		panic(e)
	}
}

func main() {
	path := "gta3.img"

	var (
		err error;
		src, dst *os.File;
		buff = make([]byte, BUFFER_SIZE);
		read_bytes int;
	)

	src, err = os.Open(path)
	check(err)
	defer src.Close()

	dst, err = os.Create(path + "-xor")
	check(err)
	defer dst.Close()

	for {
		read_bytes, err = src.Read(buff)
		if read_bytes == 0 {
			break
		}

		for i := 0; i < read_bytes; i++ {
			buff[i] ^= XOR_KEY
		}

		_, err = dst.Write(buff[:read_bytes])
		check(err)
	}
}
