<?php

/* This file handles the automatic building of both handbooks when
 * either repo is pushed to. It calls LaTeX on each of the handbooks,
 * and moves them to the correct URL.  It also rebuilds the main page.
 *
 * It requires LaTex (and various packages) as well as pandoc to be
 * installed.
 *
 * If this file is changed, it has to be manually uploaded; this file
 * does not, by design, auto-deploy itself.
 */
?><!doctype html>
<html>
<head><title>UVa CS handbook auto-deploy page</title><meta http-equiv="content-type" content="text/html; charset=utf-8"><link rel="stylesheet" href="markdown.css" type="text/css"></head>
<body>
<h1>UVa CS handbook auto-deploy page</h1>
<hr>
<?php
ob_end_flush();
flush();
$commands1 = array('git checkout diagrams/*.png', 'git pull', 'make flowcharts', 'make', 'make html', 'cp cs-ug-hbk.pdf ../ugrad-handbook.pdf', '/bin/cp -f diagrams/*.png ../', 'bin/rm -rf ../ugrad/', 'cp -a html ../ugrad', 'chmod 644 ../ugrad-handbook.pdf');
$command1dir = "/home/www/handbook/ugrad-handbook";
$commands2 = array('git pull', 'rm grad-handbook.pdf', 'make', 'make', 'cp grad-handbook.pdf ..', 'chmod 644 ../grad-handbook.pdf');
$command2dir = "/home/www/handbook/grad-handbook";
$commands3 = array('git pull', 'make index', '/bin/cp -f index.html markdown.css ..', 'chmod 644 ../index.html ../markdown.css');
$command3dir = "/home/www/handbook/ugrad-handbook";
$path = "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin";

$date = date("Y-m-d H:i:s");
$fp = fopen("log.txt","a");
fprintf($fp,"Called from " . $_SERVER['REMOTE_ADDR'] . " at $date\n");
fclose($fp);

echo "<h2>Building the undergraduate handbook...</h2>";
foreach ( $commands1 as $c ) {
	$cmd = "cd $command1dir; export PATH=$path; $c";
	echo "<p>Command: $cmd</p><pre>";
	echo `$cmd`;
	echo "</pre><hr>\n";
	flush();
}

echo "<h2>Building the graduate handbook...</h2>";
foreach ( $commands2 as $c ) {
	$cmd = "cd $command2dir; export PATH=$path; $c";
	echo "<p>Command: $cmd</p><pre>";
	echo `$cmd`;
	echo "</pre><hr>\n";
	flush();
}

echo "<h2>Building the main handbook.cs.virginia.edu page...</h2>";
foreach ( $commands3 as $c ) {
	$cmd = "cd $command2dir; export PATH=$path; $c";
	echo "<p>Command: $cmd</p><pre>";
	echo `$cmd`;
	echo "</pre><hr>\n";
	flush();
}

$fp = fopen("log.txt","a");
fprintf($fp,"\tcompleted from " . $_SERVER['REMOTE_ADDR'] . "; started at $date; ended at " . date("Y-m-d H:i:s") . "\n");
fclose($fp);

?>
</body></html>
