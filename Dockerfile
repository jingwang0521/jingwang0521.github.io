FROM registry.saas.hand-china.com/tools/hugo:v0.37.1

COPY jingwang0521.github.io/ /usr/share/blog

WORKDIR /usr/share/blog
# 暴露端口
EXPOSE 1313