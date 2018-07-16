#!/bin/sh
docker run -dti --name wj05209 -p 127.0.0.1:1313:1313 --expose 1313  hugo
#sh -c "cd /tmp/jingwang0521.github.io && hugo server --theme=polymer  --buildDrafts --watch "
hugo server --theme=tinyce-hugo-theme  --buildDrafts --watch
#docker attach wj05209
#cd /tmp/jingwang0521.github.io 
#@hugo server --theme=tinyce-hugo-theme  --buildDrafts --watch
