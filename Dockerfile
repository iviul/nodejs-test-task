FROM node:18-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm ci --omit=dev && npm cache clean --force
COPY . .

FROM node:18-alpine
WORKDIR /app
COPY --from=build /app .
USER node
<<<<<<< HEAD
EXPOSE 5000
=======
EXPOSE 3000
>>>>>>> d1f3676 (Update)
CMD ["node", "index.js"]
