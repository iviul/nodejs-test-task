FROM node:18-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm ci --omit=dev && npm cache clean --force
COPY . .

FROM node:18-alpine
WORKDIR /app
COPY --from=build /app .
USER node
EXPOSE 5000
CMD ["node", "index.js"]
