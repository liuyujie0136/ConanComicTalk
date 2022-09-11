#!/usr/bin/env perl

# cat index.html | perl -alne 'BEGIN{$idx=1; $sum=0}; open OUT,">>$idx.html"; print OUT $_; if(/<hr \/>/){$sum+=1; if($sum>60){$idx+=1; $sum=0}}'

open IN, "<index.220421add.rename.html.bak";

$idx=23;
$sum=0;

open OUT, ">>$idx.html";
print OUT "<!doctype html><html lang=\"zh-cn\"><head><meta charset=\"UTF-8\"><link rel=\"stylesheet\" type=\"text/css\" href=\"main.css\"><title>这是一整栋漫画讨论楼_第23页_柯哀分析文吧</title></head><body><div id=\"write\">\n<div class=\"page\"><a href=\"22.html\" title=\"22.html\">上一页</a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp第 23 页&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<a href=\"24.html\" title=\"24.html\">下一页</a></div><hr />\n";

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
