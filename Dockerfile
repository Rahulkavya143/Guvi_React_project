FROM node:18-alpine

RUN npm install -g serve

WORKDIR /app

COPY build/ ./build

EXPOSE 3000

CMD ["serve", "-s", "build", "-l", "3000"]
