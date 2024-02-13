FROM nginx

WORKDIR /usr/share/nginx/html/

RUN apt update \
    && apt install git -y \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/josejuansanchez/2048.git /app \
    && cp -R /app/* /usr/share/nginx/html/ \
    && rm -rf /app

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
