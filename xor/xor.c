#define XOR_KEY 0xFF
#define BUFFER_SIZE 2048

#include <string.h>
#include <stdio.h>
#include <errno.h>
#include <time.h>

int main(void) {
	FILE *inf, *outf;
	char buff[BUFFER_SIZE];
	size_t read_bytes;

	const char *path = "gta3.img";
	char outpath[260] = {0};
	strcpy(outpath, path);
	strcat(outpath, "-xor");

	inf = fopen(path, "rb");
	if (inf == NULL) {
		fprintf(stderr, "Failed to open input file, errno = %d\n", errno);
		return 1;
	}

	outf = fopen(outpath, "wb");
	if (outf == NULL) {
		fprintf(stderr, "Failed to open output file, errno = %d\n", errno);
		return 1;
	}

	while ((read_bytes = fread(buff, 1, sizeof(buff), inf)) > 0) {
		for(int i = 0; i < (int)(sizeof(buff) / sizeof(buff[0])); ++i)
			buff[i] ^= XOR_KEY;
		fwrite(buff, 1, read_bytes, outf);
	}

	fclose(inf);
	fclose(outf);
	return 0;
}
