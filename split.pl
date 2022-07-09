#!/usr/bin/env perl

open IN, "<index.html";

$idx=1;
$sum=0;

while (<IN>){
	open OUT, ">>$idx.html";
	print OUT $_;

	if(/<hr \/>/){
		$sum+=1;
		if($sum>60){
			$idx+=1;
			$sum=0
		}
	}
}
