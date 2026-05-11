-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 11 Bulan Mei 2026 pada 11.08
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pertanian`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `jawaban_konsultasi`
--

CREATE TABLE `jawaban_konsultasi` (
  `id` int(11) NOT NULL,
  `konsultasi_id` int(11) NOT NULL,
  `nama_ahli` varchar(100) DEFAULT NULL,
  `jawaban` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `jawaban_konsultasi`
--

INSERT INTO `jawaban_konsultasi` (`id`, `konsultasi_id`, `nama_ahli`, `jawaban`, `created_at`) VALUES
(1, 1, 'Dr. Budi', 'Gunakan insektisida sesuai dosis dan lakukan rotasi tanaman.', '2026-05-11 06:47:52');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kegiatan`
--

CREATE TABLE `kegiatan` (
  `id` int(11) NOT NULL,
  `lahan_id` int(11) NOT NULL,
  `jenis_kegiatan` enum('Tanam','Pupuk','Panen','Penyiraman','Lainnya') NOT NULL,
  `tanggal` date DEFAULT NULL,
  `catatan` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kegiatan`
--

INSERT INTO `kegiatan` (`id`, `lahan_id`, `jenis_kegiatan`, `tanggal`, `catatan`, `created_at`) VALUES
(3, 2, 'Tanam', '2026-05-04', 'menanam lgird', '2026-05-11 06:47:52'),
(4, 3, 'Lainnya', '2026-05-11', 'kepo', '2026-05-11 08:40:51');

-- --------------------------------------------------------

--
-- Struktur dari tabel `konsultasi`
--

CREATE TABLE `konsultasi` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `pertanyaan` text NOT NULL,
  `status` enum('Menunggu Jawaban','Sudah Dijawab','Ditutup') DEFAULT 'Menunggu Jawaban',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `konsultasi`
--

INSERT INTO `konsultasi` (`id`, `user_id`, `pertanyaan`, `status`, `created_at`) VALUES
(1, 1, 'Bagaimana cara mengatasi hama wereng?', 'Sudah Dijawab', '2026-05-11 06:47:52'),
(2, 1, 'kenapa farm lgrid itu lebih untung dibanding pepper ?', 'Menunggu Jawaban', '2026-05-11 07:10:24'),
(3, 1, 'apakah', 'Menunggu Jawaban', '2026-05-11 08:45:22');

-- --------------------------------------------------------

--
-- Struktur dari tabel `lahan`
--

CREATE TABLE `lahan` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `nama_lahan` varchar(100) NOT NULL,
  `lokasi` varchar(255) DEFAULT NULL,
  `luas` decimal(10,2) DEFAULT NULL,
  `jenis_tanaman` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `lahan`
--

INSERT INTO `lahan` (`id`, `user_id`, `nama_lahan`, `lokasi`, `luas`, `jenis_tanaman`, `created_at`) VALUES
(2, 1, 'Lahan nazri 2', 'sukabumi', 2000.00, 'jagung', '2026-05-11 06:47:52'),
(3, 1, 'Laser Grid', 'farm', 2645.00, 'lgrid seed', '2026-05-11 07:09:57'),
(4, 1, 'Lase Grid', 'Bandung', 2.00, 'Cactus', '2026-05-11 07:18:24'),
(5, 1, '', '', 0.00, '', '2026-05-11 07:38:53'),
(6, 1, 'lahan nazri', 'ciwidey', 10.00, 'raflessia arnoldi', '2026-05-11 08:14:36');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `no_hp` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `nama`, `alamat`, `no_hp`, `created_at`) VALUES
(1, 'admin', '1234', 'Asemehuyy', 'manuk japati', '098252793', '2026-05-11 06:47:52'),
(2, 'user', '4321', 'RiZki', NULL, NULL, '2026-05-11 08:45:50');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `jawaban_konsultasi`
--
ALTER TABLE `jawaban_konsultasi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `konsultasi_id` (`konsultasi_id`);

--
-- Indeks untuk tabel `kegiatan`
--
ALTER TABLE `kegiatan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lahan_id` (`lahan_id`);

--
-- Indeks untuk tabel `konsultasi`
--
ALTER TABLE `konsultasi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `lahan`
--
ALTER TABLE `lahan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `jawaban_konsultasi`
--
ALTER TABLE `jawaban_konsultasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `kegiatan`
--
ALTER TABLE `kegiatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `konsultasi`
--
ALTER TABLE `konsultasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `lahan`
--
ALTER TABLE `lahan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `jawaban_konsultasi`
--
ALTER TABLE `jawaban_konsultasi`
  ADD CONSTRAINT `jawaban_konsultasi_ibfk_1` FOREIGN KEY (`konsultasi_id`) REFERENCES `konsultasi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `kegiatan`
--
ALTER TABLE `kegiatan`
  ADD CONSTRAINT `kegiatan_ibfk_1` FOREIGN KEY (`lahan_id`) REFERENCES `lahan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `konsultasi`
--
ALTER TABLE `konsultasi`
  ADD CONSTRAINT `konsultasi_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `lahan`
--
ALTER TABLE `lahan`
  ADD CONSTRAINT `lahan_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
