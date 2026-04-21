# Pake base image yang ringan
FROM nginx:alpine

# Copy file materi.txt dari laptop ke dalem docker
COPY materi.txt /usr/share/nginx/html/index.html


