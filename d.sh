hexo clean
hexo g
hexo d
sleep 1
git add --all
git commit -m "Hexo源文件同步" 
sleep 1
git push
sleep 1
docker restart blog_nginx