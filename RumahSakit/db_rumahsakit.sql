-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 11, 2023 at 01:11 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_rumahsakit`
--

-- --------------------------------------------------------

--
-- Table structure for table `CatatanMedisElektronik`
--

CREATE TABLE `CatatanMedisElektronik` (
  `id_catatan` int(11) NOT NULL,
  `id_reservasi` int(11) NOT NULL,
  `hasil_pemeriksaan` varchar(255) DEFAULT NULL,
  `diagnosis` varchar(255) DEFAULT NULL,
  `pengobatan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `CatatanMedisElektronik`
--

INSERT INTO `CatatanMedisElektronik` (`id_catatan`, `id_reservasi`, `hasil_pemeriksaan`, `diagnosis`, `pengobatan`) VALUES
(1, 1, 'Peningkatan waktu pembekuan dan rendahnya faktor pembekuan.\r\n', 'hemofilia A.', 'Infusi faktor VIII atau IX untuk menghentikan atau mencegah perdarahan.\r\n'),
(2, 2, 'Gigi goyang dan berdarah saat menyikat gigi.', 'Penyakit Gusi', 'Scaling dan root planing.'),
(3, 3, 'Tekanan Darah: 140/90 mmHg', 'diabetes tipe 2.', 'Dokter meresepkan obat antidiabetes oral untuk membantu mengontrol gula darah.\r\n'),
(4, 4, 'Abnormal.', 'Aritmia.', 'Obat antiaritmia dan pengukuran tekanan darah rutin.');

-- --------------------------------------------------------

--
-- Table structure for table `Dokter`
--

CREATE TABLE `Dokter` (
  `id_dokter` int(11) NOT NULL,
  `nama_dokter` varchar(100) NOT NULL,
  `spesialis` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `Dokter`
--

INSERT INTO `Dokter` (`id_dokter`, `nama_dokter`, `spesialis`) VALUES
(1, 'Dr.John', 'Umum'),
(2, 'Dr.Doe', 'Umum'),
(3, 'dr.Adit', 'Gigi'),
(4, 'dr.Yuli', 'Jantung');

-- --------------------------------------------------------

--
-- Table structure for table `JadwalKunjungan`
--

CREATE TABLE `JadwalKunjungan` (
  `id_jadwal` int(11) NOT NULL,
  `id_pasien` int(11) NOT NULL,
  `id_dokter` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `waktu` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `JadwalKunjungan`
--

INSERT INTO `JadwalKunjungan` (`id_jadwal`, `id_pasien`, `id_dokter`, `tanggal`, `waktu`) VALUES
(1, 2, 3, '2021-01-01', '11:11:00'),
(2, 1, 2, '2021-08-10', '11:20:50'),
(3, 4, 4, '2021-10-13', '12:40:12'),
(4, 1, 1, '2021-09-08', '15:43:48');

-- --------------------------------------------------------

--
-- Table structure for table `ObatDanAlatMedis`
--

CREATE TABLE `ObatDanAlatMedis` (
  `id_obat` int(11) NOT NULL,
  `nama_obat` varchar(255) NOT NULL,
  `jenis` varchar(255) NOT NULL,
  `jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ObatDanAlatMedis`
--

INSERT INTO `ObatDanAlatMedis` (`id_obat`, `nama_obat`, `jenis`, `jumlah`) VALUES
(1, 'Desmopressin\r\n', 'Hormon Antidiuretik', 30),
(2, 'Antiseptik Mulut', 'Antiseptik', 5),
(3, 'Insulin', 'Injeksi insulin', 30),
(4, 'Aspirin', 'obat', 10);

-- --------------------------------------------------------

--
-- Table structure for table `Pasien`
--

CREATE TABLE `Pasien` (
  `id_pasien` int(11) NOT NULL,
  `nama_pasien` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `nomor_telepon` varchar(255) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `riwayat_penyakit` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `Pasien`
--

INSERT INTO `Pasien` (`id_pasien`, `nama_pasien`, `email`, `password`, `alamat`, `nomor_telepon`, `tanggal_lahir`, `riwayat_penyakit`) VALUES
(1, 'Syirla ', 'Syirla1298@gmail.com', 'yaya', 'Jl. Pahlawan No. 123', '08123456789', '2004-12-09', 'Hemofilia'),
(2, 'Joko', 'Jokoo0922@gmail.com', 'kook', 'jl.disana No.77', '08912891821', '2021-01-01', 'Sakit gigi'),
(3, 'Yusuf', 'Yusuf0201@gmail.com', 'ucup', 'Jl. Merdeka No. 456', '08567891234', '2003-09-08', 'Diabetes'),
(4, 'Rafli', 'Rafli9999@gmail.com', 'rafli', 'Jl. Veteran No. 789', '08134567890', '2015-05-12', 'Aritmia/Jantung');

-- --------------------------------------------------------

--
-- Table structure for table `Pegawai`
--

CREATE TABLE `Pegawai` (
  `id_pegawai` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `Pegawai`
--

INSERT INTO `Pegawai` (`id_pegawai`, `username`, `email`, `password`, `role`) VALUES
(1, 'caca', 'caca2222@gamil.com', 'cacaaa', 'admin'),
(2, 'Sisi', 'Sisi9012@gmail.com', 'siss', 'Staff'),
(3, 'Yuli', 'Yuli8767@gmail.com', 'Yuul', 'Dokter'),
(4, 'Alfin', 'Alfin3412@gmail.com', 'finfin', 'Perawat');

-- --------------------------------------------------------

--
-- Table structure for table `Pembayaran`
--

CREATE TABLE `Pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_reservasi` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `metode_pembayaran` varchar(255) DEFAULT NULL,
  `tanggal` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `Pembayaran`
--

INSERT INTO `Pembayaran` (`id_pembayaran`, `id_reservasi`, `jumlah`, `metode_pembayaran`, `tanggal`) VALUES
(1, 1, 5500000, 'Cash', '2023-12-09 12:51:46'),
(2, 3, 4650000, 'Debit', '2021-09-01 15:10:59'),
(3, 4, 7900000, 'Debit', '2021-12-22 19:02:59'),
(4, 2, 450000, 'Cash', '2021-06-10 19:03:39');

-- --------------------------------------------------------

--
-- Table structure for table `Reservasi`
--

CREATE TABLE `Reservasi` (
  `id_reservasi` int(11) NOT NULL,
  `id_pasien` int(11) NOT NULL,
  `id_dokter` int(11) NOT NULL,
  `asuransi` int(11) NOT NULL DEFAULT 0,
  `tanggal` date NOT NULL,
  `waktu` time NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `Reservasi`
--

INSERT INTO `Reservasi` (`id_reservasi`, `id_pasien`, `id_dokter`, `asuransi`, `tanggal`, `waktu`, `status`) VALUES
(1, 2, 2, 0, '2021-01-01', '11:30:00', 1),
(2, 1, 1, 1, '2021-01-02', '14:55:00', 0),
(3, 4, 3, 0, '2021-10-05', '15:22:14', 0),
(4, 3, 2, 0, '2021-02-08', '11:23:05', 0);

-- --------------------------------------------------------

--
-- Table structure for table `RiwayatResep`
--

CREATE TABLE `RiwayatResep` (
  `id_resep` int(11) NOT NULL,
  `id_reservasi` int(11) NOT NULL,
  `obat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `RiwayatResep`
--

INSERT INTO `RiwayatResep` (`id_resep`, `id_reservasi`, `obat`) VALUES
(1, 2, 'Desmopressin'),
(2, 1, 'Antiseptik Mulut'),
(3, 4, 'Insulin'),
(4, 3, 'Aspirin');

-- --------------------------------------------------------

--
-- Table structure for table `RuangPerawatan`
--

CREATE TABLE `RuangPerawatan` (
  `id_ruang` int(11) NOT NULL,
  `nomor_kamar` varchar(255) NOT NULL,
  `jenis` varchar(255) NOT NULL,
  `ketersediaan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `RuangPerawatan`
--

INSERT INTO `RuangPerawatan` (`id_ruang`, `nomor_kamar`, `jenis`, `ketersediaan`) VALUES
(1, '101', 'VIP', 'Y'),
(2, '202', 'Kelas 1', 'Y'),
(3, '307', 'Kelas 2', 'T'),
(4, '412', 'Umum', 'Y');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `CatatanMedisElektronik`
--
ALTER TABLE `CatatanMedisElektronik`
  ADD PRIMARY KEY (`id_catatan`),
  ADD KEY `vbbbbb` (`id_reservasi`);

--
-- Indexes for table `Dokter`
--
ALTER TABLE `Dokter`
  ADD PRIMARY KEY (`id_dokter`);

--
-- Indexes for table `JadwalKunjungan`
--
ALTER TABLE `JadwalKunjungan`
  ADD PRIMARY KEY (`id_jadwal`),
  ADD KEY `id_pasien` (`id_pasien`),
  ADD KEY `jadwalkunjungan_ibfk_2` (`id_dokter`);

--
-- Indexes for table `ObatDanAlatMedis`
--
ALTER TABLE `ObatDanAlatMedis`
  ADD PRIMARY KEY (`id_obat`);

--
-- Indexes for table `Pasien`
--
ALTER TABLE `Pasien`
  ADD PRIMARY KEY (`id_pasien`);

--
-- Indexes for table `Pegawai`
--
ALTER TABLE `Pegawai`
  ADD PRIMARY KEY (`id_pegawai`);

--
-- Indexes for table `Pembayaran`
--
ALTER TABLE `Pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD KEY `aaaaa` (`id_reservasi`);

--
-- Indexes for table `Reservasi`
--
ALTER TABLE `Reservasi`
  ADD PRIMARY KEY (`id_reservasi`),
  ADD KEY `id_pasien` (`id_pasien`),
  ADD KEY `reservasi_ibfk_2` (`id_dokter`);

--
-- Indexes for table `RiwayatResep`
--
ALTER TABLE `RiwayatResep`
  ADD PRIMARY KEY (`id_resep`);

--
-- Indexes for table `RuangPerawatan`
--
ALTER TABLE `RuangPerawatan`
  ADD PRIMARY KEY (`id_ruang`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `CatatanMedisElektronik`
--
ALTER TABLE `CatatanMedisElektronik`
  MODIFY `id_catatan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Dokter`
--
ALTER TABLE `Dokter`
  MODIFY `id_dokter` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `JadwalKunjungan`
--
ALTER TABLE `JadwalKunjungan`
  MODIFY `id_jadwal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ObatDanAlatMedis`
--
ALTER TABLE `ObatDanAlatMedis`
  MODIFY `id_obat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Pasien`
--
ALTER TABLE `Pasien`
  MODIFY `id_pasien` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Pegawai`
--
ALTER TABLE `Pegawai`
  MODIFY `id_pegawai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Pembayaran`
--
ALTER TABLE `Pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Reservasi`
--
ALTER TABLE `Reservasi`
  MODIFY `id_reservasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `RiwayatResep`
--
ALTER TABLE `RiwayatResep`
  MODIFY `id_resep` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `RuangPerawatan`
--
ALTER TABLE `RuangPerawatan`
  MODIFY `id_ruang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `CatatanMedisElektronik`
--
ALTER TABLE `CatatanMedisElektronik`
  ADD CONSTRAINT `vbbbbb` FOREIGN KEY (`id_reservasi`) REFERENCES `Reservasi` (`id_reservasi`);

--
-- Constraints for table `JadwalKunjungan`
--
ALTER TABLE `JadwalKunjungan`
  ADD CONSTRAINT `jadwalkunjungan_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `Pasien` (`id_pasien`),
  ADD CONSTRAINT `jadwalkunjungan_ibfk_2` FOREIGN KEY (`id_dokter`) REFERENCES `Dokter` (`id_dokter`);

--
-- Constraints for table `Pembayaran`
--
ALTER TABLE `Pembayaran`
  ADD CONSTRAINT `aaaaa` FOREIGN KEY (`id_reservasi`) REFERENCES `Reservasi` (`id_reservasi`);

--
-- Constraints for table `Reservasi`
--
ALTER TABLE `Reservasi`
  ADD CONSTRAINT `reservasi_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `Pasien` (`id_pasien`),
  ADD CONSTRAINT `reservasi_ibfk_2` FOREIGN KEY (`id_dokter`) REFERENCES `Dokter` (`id_dokter`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
