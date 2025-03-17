# Gunakan Node.js versi terbaru sebagai base image
FROM node:20

# Set working directory di dalam container
WORKDIR /app

# Salin file package.json dan package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Salin semua file proyek ke dalam container
COPY . .

# Generate Prisma Client setelah install
RUN npx prisma generate

# Pastikan Prisma migration dijalankan saat container berjalan
CMD ["sh", "-c", "npx prisma migrate deploy && npm start"]

# Expose port aplikasi (ubah sesuai kebutuhan)
EXPOSE 3000
