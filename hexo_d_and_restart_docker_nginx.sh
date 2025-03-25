#!/bin/bash
echo "将要执行：git pull"
echo "将要执行：git pull"
echo "将要执行：git pull"
sleep 1
git pull

echo "将要执行：hexo clean && hexo g && hexo d"
echo "将要执行：hexo clean && hexo g && hexo d"
echo "将要执行：hexo clean && hexo g && hexo d"
sleep 1
hexo clean && hexo g && hexo d

# echo "将要执行：docker restart blog_nginx"
# echo "将要执行：docker restart blog_nginx"
# echo "将要执行：docker restart blog_nginx"
# sleep 1
# docker restart blog_nginx