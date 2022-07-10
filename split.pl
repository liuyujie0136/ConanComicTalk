#!/usr/bin/env perl

# cat index.html | perl -alne 'BEGIN{$idx=1; $sum=0}; open OUT,">>$idx.html"; print OUT $_; if(/<hr \/>/){$sum+=1; if($sum>60){$idx+=1; $sum=0}}'

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
			$sum=0;
		}
	}
}
