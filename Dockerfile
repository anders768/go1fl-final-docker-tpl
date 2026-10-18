# Этап 1: сборка приложения
FROM golang:1.27.2 AS builder
WORKDIR /usr/src/app
COPY . .
# ^копируем всё, кроме того, что в .dockerignore, поэтому достаточно одной команды копирования
RUN go mod tidy
# ^актуализация зависимостей проекта

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /my_app .
# ^Внутри образа собираем бинарник my_app (из пакета в папке WORKDIR, т.е. в /usr/src/app)
# в корневую папку образа.

# Этап 2: финальный образ
FROM alpine:3.24.2
WORKDIR /app
COPY --from=builder /my_app ./my_app
# ^Копируем файл /my_app из этапа 1 (т.е. скомпилированный бинарник)
# в файл /app/my_app этапа 2.
COPY --from=builder /usr/src/app/tracker.db ./tracker.db
# ^забираем из этапа 1 файл базы данных
CMD ["./my_app"]
# ^запуск приложения (из этапа 2; этапа 1 уже нет)