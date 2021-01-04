const fs = require("fs");

const XOR_KEY = 0xFF;
const CHUNK_SIZE = 2048;

let PATH = "gta3.img"
let OUTPUT_PATH = PATH + "-xor";

let readStream = fs.createReadStream(PATH, { highWaterMark: CHUNK_SIZE });
let writeStream = fs.createWriteStream(OUTPUT_PATH, { flags: "w+" });

readStream.on("data", (chunk) => {
	for (let i = 0; i < chunk.length; i++)
		chunk[i] ^= XOR_KEY;
	writeStream.write(chunk);
}).on("end", () => { writeStream.end(); });
