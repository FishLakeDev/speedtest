#include <algorithm>
#include <iostream>
#include <iterator>
#include <fstream>

constexpr char XOR_KEY = 0xFF;
constexpr size_t BUFFER_SIZE = 2048;

int main() {
	const std::string path = "gta3.img";
	std::string outpath = path + "-xor";

	std::ifstream inf(path, std::ios::binary);
	if (inf.fail()) {
		std::cerr << "Failed to open input file, errno = " << errno << std::endl;
		return 1;
	}

	std::ofstream outf(outpath, std::ios::binary);
	if (outf.fail()) {
		std::cerr << "Failed to open output file, errno = " << errno << std::endl;
		return 1;
	}

	std::string buff(BUFFER_SIZE, '\0');
	while (inf.read(&buff[0], BUFFER_SIZE)) {
		size_t n = inf.gcount();
		for (size_t i = 0; i < n; ++i) buff[i] ^= XOR_KEY;
		outf.write(buff.c_str(), n);
	}

	inf.close();
	outf.close();
	return 0;
}
