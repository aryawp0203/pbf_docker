# 🚀 Setup & Deployment Guide

## 📌 Prerequisites
Sebelum menjalankan proyek ini, pastikan Anda sudah menginstal:
- [Docker Desktop](https://www.docker.com/products/docker-desktop)
- [Git](https://git-scm.com/downloads)

## 📥 Clone Repository
Jalankan perintah berikut untuk mengunduh proyek dari GitHub:
```sh
git clone https://github.com/abdau88/jobsheet1.git
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
- **Frontend (Laravel)**: [http://localhost:3000](http://localhost:3000)
- **PHPMyAdmin (Opsional)**: [http://localhost:8080](http://localhost:8080)

## 🛠️ Konfigurasi Database
- **Host**: `database`
- **User**: `root`
- **Password**: `root`
- **Database Name**: `mydb`

Jika ingin masuk ke MySQL dalam container:
```sh
docker exec -it nama_container_mysql mysql -u root -p
```

## 🔄 Update & Rebuild
Jika ada perubahan dalam kode, jalankan:
```sh
git pull origin main
docker-compose up -d --build
```

## 🛑 Stop & Remove Containers
Jika ingin menghentikan layanan, jalankan:
```sh
docker-compose down
```
