# 🚀 Setup & Deployment Guide

## 📌 Prerequisites
Sebelum menjalankan proyek ini, pastikan Anda sudah menginstal:
- [Docker Desktop](https://www.docker.com/products/docker-desktop)
- [Git](https://git-scm.com/downloads)

## 📥 Clone Repository
Jalankan perintah berikut untuk mengunduh proyek dari GitHub:
```sh
git clone https://github.com/username/repository-name.git
cd repository-name
```

## 🛠️ Setup & Jalankan dengan Docker Compose
1. Pastikan Docker Desktop sudah berjalan.
2. Jalankan perintah berikut untuk membangun dan menjalankan container:
   ```sh
   docker-compose up -d --build
   ```
3. Pastikan semua container berjalan dengan baik:
   ```sh
   docker ps
   ```

## 🎯 Akses Aplikasi
- **Backend (CodeIgniter)**: [http://localhost:8000](http://localhost:8000)
