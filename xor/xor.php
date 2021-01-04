<?php

$XOR_KEY = 0xFF;
$BUFFER_SIZE = 2048;

$path = 'gta3.img';
$outpath = $path.'-xor';

$inf = fopen($path, "rb") or die("Error");
$outf = fopen($outpath, "wb") or die("Error");

while(!feof($inf)) {
	$buff = fread($inf, $BUFFER_SIZE);
	$r = [];
	$len = strlen($buff);
	for ($i = 1; $i <= $len; $i++) {
		$ch = ord(substr($buff, $i, 1));
		$r[$i] = chr($ch ^ $XOR_KEY);
	}
	fwrite($outf, implode($r), $len);
}

fclose($inf);
fclose($outf);
