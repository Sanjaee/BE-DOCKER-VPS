# Gunakan base image Node.js
FROM node:20

# Set working directory dalam container
WORKDIR /app

# Copy file package.json dan package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy semua file ke dalam container
COPY . .

# Expose port yang digunakan aplikasi
EXPOSE 3004

# Jalankan aplikasi
CMD ["npm", "run", "dev"]