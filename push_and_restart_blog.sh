#!/bin/bash
if [ $# == 1 ] ;
then
    str="$1" 
else
	str="all files udpate"
fi
echo "将要执行：hexo clean && hexo g && hexo d"
echo "将要执行：hexo clean && hexo g && hexo d"
echo "将要执行：hexo clean && hexo g && hexo d"
sleep 2
hexo clean && hexo g && hexo d

echo "将要执行：git add --all && git commit -m $str && git push"
echo "将要执行：git add --all && git commit -m $str && git push"
echo "将要执行：git add --all && git commit -m $str && git push"
sleep 2
git add --all && git commit -m "$str" && git push

echo "将要执行：docker restart blog_nginx"
echo "将要执行：docker restart blog_nginx"
echo "将要执行：docker restart blog_nginx"
sleep 1
docker restart blog_nginx