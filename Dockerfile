# 운영 환경용 Dockerfile
# 개발 서버가 아니라 nginx로 구동하기 위하여 build를 수행하게 된다
FROM node:alpine as builder
WORKDIR /usr/src/app
COPY package.json ./
RUN npm install
COPY ./ ./
# 빌드 파일 생성
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /usr/src/app/build  /usr/share/nginx/html

#docker build .
#nginx는 80번이 기본 포트
#docker run -p 8080:80 whiwoncho/docker-react-app
