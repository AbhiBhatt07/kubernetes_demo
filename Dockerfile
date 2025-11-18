FROM node:18-alpine as base

WORKDIR /app

# Install dependencies
COPY package.json package-lock.json ./
RUN npm ci --omit=dev

# Copy source
COPY . .


# Use non-root user
USER node

EXPOSE 3000
ENV NODE_ENV=production

#don't use different quotes here i made mistake but resolved tha
CMD ["npm", "start"]