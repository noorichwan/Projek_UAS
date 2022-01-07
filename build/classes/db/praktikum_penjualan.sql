-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 07 Jan 2022 pada 20.38
-- Versi server: 10.1.33-MariaDB
-- Versi PHP: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `praktikum_penjualan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `id` int(11) NOT NULL,
  `idjenisbarang` int(11) NOT NULL,
  `namabarang` varchar(200) NOT NULL,
  `harga` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`id`, `idjenisbarang`, `namabarang`, `harga`) VALUES
(1, 1, 'Celana Kargo', 300000),
(2, 1, 'Kemeja Pantai', 250000),
(3, 2, 'Blouse Putih', 270000),
(4, 2, 'Rok Panjang', 350000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `detailpenjualan`
--

CREATE TABLE `detailpenjualan` (
  `id` int(11) NOT NULL,
  `idpenjualan` int(11) NOT NULL,
  `idbarang` int(11) NOT NULL,
  `hargajual` double NOT NULL,
  `jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `detailpenjualan`
--

INSERT INTO `detailpenjualan` (`id`, `idpenjualan`, `idbarang`, `hargajual`, `jumlah`) VALUES
(1, 1, 1, 300000, 2),
(2, 1, 4, 350000, 1),
(3, 2, 4, 350000, 1),
(4, 3, 2, 250000, 1),
(5, 3, 3, 270000, 2),
(6, 3, 4, 350000, 1),
(7, 4, 1, 300000, 1),
(8, 5, 2, 250000, 1),
(9, 6, 1, 300000, 1),
(10, 6, 2, 250000, 1),
(11, 6, 3, 270000, 1),
(12, 1, 5, 1000, 3),
(17, 7, 1, 300000, 2),
(23, 20, 1, 300000, 2),
(24, 20, 5, 1000, 3),
(25, 23, 1, 300000, 2),
(26, 23, 3, 270000, 1),
(28, 25, 1, 300000, 1),
(29, 25, 2, 250000, 1),
(31, 27, 3, 270000, 2),
(32, 29, 1, 300000, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenisbarang`
--

CREATE TABLE `jenisbarang` (
  `id` int(11) NOT NULL,
  `namajenisbarang` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `jenisbarang`
--

INSERT INTO `jenisbarang` (`id`, `namajenisbarang`) VALUES
(1, 'Pakaian pria'),
(2, 'Pakaian wanita'),
(11, 'Tes dari Main'),
(13, 'Tes dari Main yang kedua'),
(15, 'Buku Digitan 5A SI'),
(16, 'Modul 5F baru'),
(17, 'Modul 5C Baru'),
(18, 'data delapan belas'),
(25, 'Tes dari Main yang kesatu'),
(26, 'Modul 5D Baru'),
(27, 'tambah baru'),
(28, 'Modul 5F'),
(33, 'Data Dua Puluh'),
(34, 'Data Dua Puluh Delapan'),
(35, 'Data 32'),
(37, 'Mantap Jiwa ');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengguna`
--

CREATE TABLE `pengguna` (
  `id` int(11) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(200) NOT NULL,
  `namalengkap` varchar(200) NOT NULL,
  `isadmin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pengguna`
--

INSERT INTO `pengguna` (`id`, `username`, `password`, `namalengkap`, `isadmin`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Nama Admin', 1),
(2, 'user', 'ee11cbb19052e40b07aac0ca060c23ee', 'Nama User', 0),
(18, 'penggunabaru', '5ef035d11d74713fcb36f2df26aa7c3d', 'Nama Pengguna', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `penjualan`
--

CREATE TABLE `penjualan` (
  `id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `idpengguna` int(11) NOT NULL,
  `status` enum('PENDING','SELESAI') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `penjualan`
--

INSERT INTO `penjualan` (`id`, `tanggal`, `idpengguna`, `status`) VALUES
(1, '2020-12-01', 2, 'SELESAI'),
(2, '2020-12-01', 2, 'SELESAI'),
(3, '2021-01-02', 2, 'SELESAI'),
(4, '2021-01-03', 2, 'SELESAI'),
(5, '2021-02-01', 2, 'SELESAI'),
(6, '2021-02-03', 2, 'SELESAI'),
(7, '2021-03-05', 2, 'SELESAI'),
(8, '2021-03-05', 2, 'PENDING'),
(20, '2021-08-04', 1, 'SELESAI'),
(21, '2021-08-06', 1, 'PENDING'),
(22, '2021-08-06', 1, 'PENDING'),
(23, '2021-08-06', 1, 'PENDING'),
(24, '2021-08-06', 1, 'PENDING'),
(25, '2021-08-06', 1, 'SELESAI'),
(26, '2021-08-06', 1, 'PENDING'),
(27, '2021-08-12', 1, 'SELESAI'),
(28, '2021-08-24', 1, 'PENDING'),
(29, '2021-09-03', 1, 'PENDING');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `detailpenjualan`
--
ALTER TABLE `detailpenjualan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `jenisbarang`
--
ALTER TABLE `jenisbarang`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `barang`
--
ALTER TABLE `barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `detailpenjualan`
--
ALTER TABLE `detailpenjualan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT untuk tabel `jenisbarang`
--
ALTER TABLE `jenisbarang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT untuk tabel `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
