# Pake base image yang ringan
FROM alpine

# Copy file materi.txt dari laptop ke dalem docker
COPY materi.txt /app/materi.txt

# Perintah pas docker dinyalain
CMD ["cat", "/app/materi.txt"]
