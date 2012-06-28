<?php

if (2 !== $_SERVER['argc']) {
	echo "Usage: php csv2json.php csv-file\n";
	exit(1);
}

$csvFilename = $_SERVER['argv'][1];

if (!file_exists($csvFilename)) {
	echo sprintf("File \"%s\" does not exist.\n", $csvFilename);
	exit(1);
}

require_once 'vendor/parsecsv/parsecsv.lib.php';

$data = array();

$csv = new parseCSV($csvFilename);
$csv->encoding('UTF-16', 'UTF-8');
foreach ($csv->data as $tld) {
	$data[] = array(
		'tld'			=> $tld['tld'],
		'description'	=> $tld['description']
	);
}

$jsonFilename = str_replace('.csv', '.json', $csvFilename);

file_put_contents($jsonFilename, json_encode($data));

exit(0);