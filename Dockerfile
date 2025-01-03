FROM node:22

# Install OpenSSL using apt (since this is a Debian-based image)
RUN apt-get update && apt-get install -y openssl

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy rest of the application
COPY . .

# Generate Prisma Client
RUN npx prisma generate

EXPOSE 3000

CMD ["node", "dist/index.js"]