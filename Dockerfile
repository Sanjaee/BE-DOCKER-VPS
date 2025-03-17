# Menggunakan Node.js sebagai base image
FROM node:20

# Set working directory
WORKDIR /app

# Menyalin package.json dan package-lock.json
COPY package*.json ./

# Menyalin folder prisma ke dalam container
COPY prisma ./prisma

# Install dependencies
RUN npm install

# Menyalin semua file proyek ke dalam container
COPY . .

# Build Prisma
RUN npx prisma generate

# Expose port aplikasi
EXPOSE 3001

# Menjalankan aplikasi
CMD ["npm", "run", "dev"]