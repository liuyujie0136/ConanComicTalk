#!/usr/bin/env perl

# cat index.html | perl -alne 'BEGIN{$idx=1; $sum=0}; open OUT,">>$idx.html"; print OUT $_; if(/<hr \/>/){$sum+=1; if($sum>60){$idx+=1; $sum=0}}'

open IN, "<index.html.bak";

$idx=1;
$sum=0;

open OUT, ">>$idx.html";
print OUT "<!doctype html><html lang=\"zh-cn\"><head><meta charset=\"UTF-8\"><link rel=\"stylesheet\" type=\"text/css\" href=\"main.css\"><title>这是一整栋漫画讨论楼_第1页_柯哀分析文吧</title></head><body><div id=\"write\">\n<div class=\"page\">上一页&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp第 1 页&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<a href=\"2.html\" title=\"2.html\">下一页</a></div><hr />\n";

while(<IN>){
	print OUT $_;

	if(/<hr \/>/){
		$sum+=1;
		if($sum>30){
			$last=$idx-1;
			$next=$idx+1;
			print OUT "<div class=\"page\"><a href=\"$last.html\" title=\"$last.html\">上一页</a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp第 $idx 页&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<a href=\"$next.html\" title=\"$next.html\">下一页</a></div>\n</div></body></html>\n";
			close OUT;

			$idx+=1;
			$sum=0;

			$last=$idx-1;
			$next=$idx+1;

			open OUT, ">>$idx.html";
			print OUT "<!doctype html><html lang=\"zh-cn\"><head><meta charset=\"UTF-8\"><link rel=\"stylesheet\" type=\"text/css\" href=\"main.css\"><title>这是一整栋漫画讨论楼_第$idx页_柯哀分析文吧</title></head><body><div id=\"write\">\n<div class=\"page\"><a href=\"$last.html\" title=\"$last.html\">上一页</a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp第 $idx 页&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<a href=\"$next.html\" title=\"$next.html\">下一页</a></div><hr />\n";
		}
	}
}
