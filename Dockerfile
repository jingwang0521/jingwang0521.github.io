FROM ubuntu:14.04

#Download
ENV HUGO_VERSION 0.40
ENV HUGO_BINARY hugo_o.40_Linux-64bit.deb

EXPOSE 1313

#ADD
ADD hugo_0.40_Linux-64bit.deb /tmp/hugo.deb

RUN dpkg -i /tmp/hugo.deb && rm /tmp/hugo.deb

#ADD jingwang0521.github.io /tmp/jingwang0521.github.io

#CMD ["cd","/tmp/jingwang0521.github.io"] 

#CMD ["hugo","server --theme=tinyce-hugo-theme  --buildDrafts --watch"]

#CMD ["echo","hugo"]
