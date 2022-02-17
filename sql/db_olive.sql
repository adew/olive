-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 17, 2022 at 07:03 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `olive`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `laporanSuratMasuk` (IN `start` VARCHAR(10), IN `endd` VARCHAR(10), IN `disposisi` INT(1))  BEGIN

	CASE disposisi
		WHEN 1 THEN
			SELECT no_surat, tgl_surat, pengirim, ditujukan, perihal, deskripsi FROM v_surat_masuk WHERE (tgl_surat BETWEEN start AND endd) AND status_disposisi = "Sudah Disposisi";
		WHEN 2 THEN
			SELECT no_surat, tgl_surat, pengirim, ditujukan, perihal, deskripsi FROM v_surat_masuk WHERE (tgl_surat BETWEEN start AND endd) AND status_disposisi = "Belum Disposisi"; 
		ELSE
			SELECT no_surat, tgl_surat, pengirim, ditujukan, perihal, deskripsi FROM v_surat_masuk WHERE (tgl_surat BETWEEN start AND endd);
    END CASE;

 END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'members', 'General User');

-- --------------------------------------------------------

--
-- Table structure for table `jenis_surat`
--

CREATE TABLE `jenis_surat` (
  `id_jenis_surat` int(5) NOT NULL,
  `jenis_surat` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jenis_surat`
--

INSERT INTO `jenis_surat` (`id_jenis_surat`, `jenis_surat`) VALUES
(1, 'Administrasi'),
(2, 'Hukum'),
(3, 'Keuangan'),
(4, 'IPTEK');

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `petugas`
--

CREATE TABLE `petugas` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `nama_petugas` varchar(35) NOT NULL,
  `jenis_kelamin` char(1) NOT NULL,
  `tgl_lahir` varchar(15) NOT NULL,
  `alamat` tinytext DEFAULT NULL,
  `telp` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `petugas`
--

INSERT INTO `petugas` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `nama_petugas`, `jenis_kelamin`, `tgl_lahir`, `alamat`, `telp`) VALUES
(1, '127.0.0.1', 'admin', '$2y$08$mDlD/BeGwAtCdDN2TfTOPuQeovbYmEvfUS4ZI8z.fYDrs9w8Z644m', '', 'admin@gmail.com', '', NULL, NULL, '/coT5pTWMBozqDB9Dwv24e', 1268889823, 1645077706, 1, 'Admin', '', '', NULL, NULL),
(6, '127.0.0.1', 'user', '$2y$08$6JV4n.LHNDklEOVyIIQnsOfzUEY/eNr9QrTbkp2RB0t.4PYQPJAK6', NULL, 'user@example.com', NULL, NULL, NULL, 'ZxQ1MC0xihNsQuL7gWAcC.', 1518588653, 1633996622, 1, 'User Biasa', 'L', '02/14/2018', 'Kec.Darmaraja', '0');

-- --------------------------------------------------------

--
-- Table structure for table `surat_keluar1`
--

CREATE TABLE `surat_keluar1` (
  `id_surat_keluar` int(11) NOT NULL,
  `no_surat` varchar(50) DEFAULT NULL,
  `tgl_surat` date DEFAULT NULL,
  `tgl_kirim` date DEFAULT NULL,
  `perihal` varchar(100) DEFAULT NULL,
  `id_jenis_surat` int(5) DEFAULT NULL,
  `kepada` varchar(50) DEFAULT NULL,
  `kode_klasifikasi` varchar(25) DEFAULT NULL,
  `deskripsi` mediumtext DEFAULT NULL,
  `id_petugas` int(11) UNSIGNED DEFAULT NULL,
  `nilai_guna` varchar(25) DEFAULT NULL,
  `media` varchar(25) DEFAULT NULL,
  `kondisi` varchar(25) DEFAULT NULL,
  `satuan_lampiran` varchar(25) DEFAULT NULL,
  `dibuat_pada` int(11) NOT NULL,
  `berkas_surat` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `surat_masuk`
--

CREATE TABLE `surat_masuk` (
  `id_surat_masuk` int(11) NOT NULL,
  `no_surat` varchar(50) DEFAULT NULL,
  `tgl_surat` date DEFAULT NULL,
  `tgl_terima` date DEFAULT NULL,
  `perihal` varchar(100) DEFAULT NULL,
  `id_jenis_surat` int(5) DEFAULT NULL,
  `pengirim` varchar(50) DEFAULT NULL,
  `kode_klasifikasi` varchar(25) DEFAULT NULL,
  `deskripsi` mediumtext DEFAULT NULL,
  `id_petugas` int(11) UNSIGNED DEFAULT NULL,
  `nilai_guna` varchar(25) DEFAULT NULL,
  `media` varchar(25) DEFAULT NULL,
  `kondisi` varchar(25) DEFAULT NULL,
  `satuan_lampiran` varchar(25) DEFAULT NULL,
  `dibuat_pada` int(11) NOT NULL,
  `berkas_surat` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users_groups`
--

CREATE TABLE `users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(33, 1, 1),
(34, 6, 2);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_disposisi_surat_masuk`
-- (See below for the actual view)
--
CREATE TABLE `v_disposisi_surat_masuk` (
`id` int(11)
,`no_surat` varchar(50)
,`tgl_surat` date
,`tgl_disposisi` date
,`perihal` varchar(100)
,`dari` varchar(50)
,`kepada` varchar(50)
,`keterangan` varchar(100)
,`username` varchar(100)
,`dibuat_pada` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_petugas`
-- (See below for the actual view)
--
CREATE TABLE `v_petugas` (
`id` int(11) unsigned
,`nama_petugas` varchar(35)
,`username` varchar(100)
,`email` varchar(254)
,`group_id` mediumint(8) unsigned
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_surat_keluar`
-- (See below for the actual view)
--
CREATE TABLE `v_surat_keluar` (
`id` int(10)
,`no_surat` varchar(50)
,`tgl_surat` date
,`perihal` varchar(100)
,`tgl_pengiriman` date
,`pengirim` varchar(50)
,`kepada` varchar(50)
,`jenis_surat` varchar(40)
,`sifat_surat` enum('Rahasia','Penting','Segera','Biasa')
,`petugas` varchar(100)
,`deskripsi` longtext
,`berkas_surat` varchar(25)
,`dibuat_pada` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_surat_masuk`
-- (See below for the actual view)
--
CREATE TABLE `v_surat_masuk` (
`id` int(11)
,`no_surat` varchar(50)
,`tgl_surat` date
,`perihal` varchar(100)
,`jenis_surat` varchar(40)
,`pengirim` varchar(50)
,`ditujukan` varchar(50)
,`deskripsi` mediumtext
,`username` varchar(100)
,`berkas_surat` varchar(25)
,`sifat_surat` enum('Rahasia','Penting','Segera','Biasa')
,`status_disposisi` enum('Sudah Disposisi','Belum Disposisi')
,`dibuat_pada` int(11)
);

-- --------------------------------------------------------

--
-- Structure for view `v_disposisi_surat_masuk`
--
DROP TABLE IF EXISTS `v_disposisi_surat_masuk`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_disposisi_surat_masuk`  AS SELECT `amora`.`disposisi_surat_masuk`.`id` AS `id`, `amora`.`surat_masuk`.`no_surat` AS `no_surat`, `amora`.`surat_masuk`.`tgl_surat` AS `tgl_surat`, `amora`.`disposisi_surat_masuk`.`tgl_disposisi` AS `tgl_disposisi`, `amora`.`surat_masuk`.`perihal` AS `perihal`, `amora`.`surat_masuk`.`pengirim` AS `dari`, `amora`.`surat_masuk`.`ditujukan` AS `kepada`, `amora`.`disposisi_surat_masuk`.`keterangan` AS `keterangan`, `amora`.`petugas`.`username` AS `username`, `amora`.`disposisi_surat_masuk`.`dibuat_pada` AS `dibuat_pada` FROM ((`amora`.`disposisi_surat_masuk` join `amora`.`surat_masuk`) join `amora`.`petugas`) WHERE `amora`.`disposisi_surat_masuk`.`id_surat_masuk` = `amora`.`surat_masuk`.`id_surat_masuk` AND `amora`.`disposisi_surat_masuk`.`id_petugas` = `amora`.`petugas`.`id` ;

-- --------------------------------------------------------

--
-- Structure for view `v_petugas`
--
DROP TABLE IF EXISTS `v_petugas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_petugas`  AS SELECT `petugas`.`id` AS `id`, `petugas`.`nama_petugas` AS `nama_petugas`, `petugas`.`username` AS `username`, `petugas`.`email` AS `email`, `users_groups`.`group_id` AS `group_id` FROM (`petugas` join `users_groups` on(`petugas`.`id` = `users_groups`.`user_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_surat_keluar`
--
DROP TABLE IF EXISTS `v_surat_keluar`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_surat_keluar`  AS SELECT `amora`.`surat_keluar`.`id_surat_keluar` AS `id`, `amora`.`surat_keluar`.`no_surat` AS `no_surat`, `amora`.`surat_keluar`.`tgl_surat` AS `tgl_surat`, `amora`.`surat_keluar`.`perihal` AS `perihal`, `amora`.`surat_keluar`.`tgl_pengiriman` AS `tgl_pengiriman`, `amora`.`surat_keluar`.`pengirim` AS `pengirim`, `amora`.`surat_keluar`.`kepada` AS `kepada`, `amora`.`jenis_surat`.`jenis_surat` AS `jenis_surat`, `amora`.`surat_keluar`.`sifat_surat` AS `sifat_surat`, `amora`.`petugas`.`username` AS `petugas`, `amora`.`surat_keluar`.`deskripsi` AS `deskripsi`, `amora`.`surat_keluar`.`berkas_surat` AS `berkas_surat`, `amora`.`surat_keluar`.`dibuat_pada` AS `dibuat_pada` FROM ((`amora`.`surat_keluar` join `amora`.`jenis_surat`) join `amora`.`petugas`) WHERE `amora`.`surat_keluar`.`id_jenis_surat` = `amora`.`jenis_surat`.`id_jenis_surat` AND `amora`.`surat_keluar`.`id_petugas` = `amora`.`petugas`.`id` ;

-- --------------------------------------------------------

--
-- Structure for view `v_surat_masuk`
--
DROP TABLE IF EXISTS `v_surat_masuk`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_surat_masuk`  AS SELECT `amora`.`surat_masuk`.`id_surat_masuk` AS `id`, `amora`.`surat_masuk`.`no_surat` AS `no_surat`, `amora`.`surat_masuk`.`tgl_surat` AS `tgl_surat`, `amora`.`surat_masuk`.`perihal` AS `perihal`, `amora`.`jenis_surat`.`jenis_surat` AS `jenis_surat`, `amora`.`surat_masuk`.`pengirim` AS `pengirim`, `amora`.`surat_masuk`.`ditujukan` AS `ditujukan`, `amora`.`surat_masuk`.`deskripsi` AS `deskripsi`, `amora`.`petugas`.`username` AS `username`, `amora`.`surat_masuk`.`berkas_surat` AS `berkas_surat`, `amora`.`surat_masuk`.`sifat_surat` AS `sifat_surat`, `amora`.`surat_masuk`.`status_disposisi` AS `status_disposisi`, `amora`.`surat_masuk`.`dibuat_pada` AS `dibuat_pada` FROM ((`amora`.`surat_masuk` join `amora`.`jenis_surat`) join `amora`.`petugas`) WHERE `amora`.`surat_masuk`.`id_jenis_surat` = `amora`.`jenis_surat`.`id_jenis_surat` AND `amora`.`surat_masuk`.`id_petugas` = `amora`.`petugas`.`id` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jenis_surat`
--
ALTER TABLE `jenis_surat`
  ADD PRIMARY KEY (`id_jenis_surat`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `surat_keluar1`
--
ALTER TABLE `surat_keluar1`
  ADD PRIMARY KEY (`id_surat_keluar`),
  ADD KEY `fk_surat_masuk_jenis_surat1` (`id_jenis_surat`),
  ADD KEY `fk_surat_masuk_petugas1` (`id_petugas`);

--
-- Indexes for table `surat_masuk`
--
ALTER TABLE `surat_masuk`
  ADD PRIMARY KEY (`id_surat_masuk`),
  ADD KEY `fk_surat_masuk_jenis_surat1` (`id_jenis_surat`),
  ADD KEY `fk_surat_masuk_petugas1` (`id_petugas`);

--
-- Indexes for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  ADD KEY `fk_users_groups_users1_idx` (`user_id`),
  ADD KEY `fk_users_groups_groups1_idx` (`group_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `petugas`
--
ALTER TABLE `petugas`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `surat_keluar1`
--
ALTER TABLE `surat_keluar1`
  MODIFY `id_surat_keluar` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `surat_masuk`
--
ALTER TABLE `surat_masuk`
  MODIFY `id_surat_masuk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `surat_masuk`
--
ALTER TABLE `surat_masuk`
  ADD CONSTRAINT `fk_surat_masuk_jenis_surat1` FOREIGN KEY (`id_jenis_surat`) REFERENCES `jenis_surat` (`id_jenis_surat`),
  ADD CONSTRAINT `fk_surat_masuk_petugas1` FOREIGN KEY (`id_petugas`) REFERENCES `petugas` (`id`);

--
-- Constraints for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `petugas` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
