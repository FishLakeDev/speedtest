import sys

XOR_KEY = 0xFF
CHUNK_SIZE = 2048

def main():
    file_name = 'gta3.img'
    with open(file_name, 'rb') as infile, \
        open(file_name + '-xor', 'wb') as outfile:
        for chunk in iter(lambda: infile.read(CHUNK_SIZE), b''):
            xored = bytearray(chunk)
            for i, _ in enumerate(xored):
                xored[i] ^= XOR_KEY
            outfile.write(xored)


if __name__ == '__main__':
    main()
