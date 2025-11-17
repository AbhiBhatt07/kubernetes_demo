FROM node:18-alpine as base
WORKDIR /app

# Intall dependencies separately for caching
COPY package.json package-lock.json ./
RUN npm ci --omit=dev

# copy app source code
COPY . .

# Run as not root user (alpine node image inlcudes a user 'node')
USER node
EXPOSE 3000
ENV NODE_ENV=production
CMD ["npm", 'start']