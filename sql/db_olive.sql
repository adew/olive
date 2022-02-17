-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 15, 2022 at 04:35 AM
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
(1, '127.0.0.1', 'jaya', '$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36', '', 'dd@aada', '', NULL, NULL, 'En0m3kBBdkSdCrJiLqjhXe', 1268889823, 1644896087, 1, 'Jaya Sentosa', '', '', NULL, NULL),
(5, '127.0.0.1', 'hakim', '$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36', NULL, 'user1@example.com', NULL, NULL, NULL, '12nykWQGHj0nHQNVxOqUC.', 1518441330, 1640158456, 1, 'Riza Nauval', 'L', '01/01/2000', 'Kec. Arcamanik, Kota Bandung', 'dandyalfaz'),
(6, '127.0.0.1', 'user', '$2y$08$ztoiaMszlD0Vy97rI8ErdOa7RwHlCRWFqykwrs8pr1mkiI.zTZrg.', NULL, 'user2@example.com', NULL, NULL, NULL, 'ZxQ1MC0xihNsQuL7gWAcC.', 1518588653, 1633996622, 1, 'Jajang', 'L', '02/14/2018', 'Kec.Darmaraja', '0'),
(8, '::1', 'ade', '$2y$08$uk0pTT7ZaoAVskpE0afXnuVC8BgucSw83WoumYkU3Z.8cPgH31qjy', NULL, 'qw@dee.com', NULL, NULL, NULL, 'mClL98kWj1PGvUSW0Qre2u', 1625931882, 1644796902, 1, 'Ade Widianto', '', '', NULL, NULL),
(10, '127.0.0.1', 'waniterus', '$2y$08$uRl6ft0vN5Gtk3o2wqB7n.cVVgFLqQUOB.XCzSFIQCNbDR3758sXC', NULL, 'tt@gmail.com', NULL, NULL, NULL, NULL, 1644330039, NULL, 1, 'Oliv', '', '', NULL, NULL);

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

--
-- Dumping data for table `surat_keluar1`
--

INSERT INTO `surat_keluar1` (`id_surat_keluar`, `no_surat`, `tgl_surat`, `tgl_kirim`, `perihal`, `id_jenis_surat`, `kepada`, `kode_klasifikasi`, `deskripsi`, `id_petugas`, `nilai_guna`, `media`, `kondisi`, `satuan_lampiran`, `dibuat_pada`, `berkas_surat`) VALUES
(1, 'R/129/IV/2021', '2021-04-16', '0000-00-00', 'Laporan Selesai Menjalani Pidana An. Sertu Saharudin', 1, 'Yonif 731/Kabaresi', '2021-05-05 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044402, NULL),
(2, 'R/17/IV/2021', '2021-04-22', '0000-00-00', 'Pelimpahan perkara dugaan penipuan yang dilakukan oleh Serma Andi Victor Harianto', 1, 'JASDAM XVI/PTM', '2021-05-05 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044403, NULL),
(3, 'R/385/IV/2021', '2021-04-21', '0000-00-00', 'Laporan selesai menjalan pidana an Sertu Saharudin Yonif 731/Kabaresi', 1, 'Brigif 27/Nusa Ina', '2021-05-05 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044404, NULL),
(4, 'R/141/IV/2021', '2021-04-27', '0000-00-00', 'Jawaban surat panggilan an Pratu Aprianus Jamlay', 1, 'Yonif 731/Kabaresi', '2021-05-05 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044405, NULL),
(5, '35/Pan.7/BKS/17 PK/Mil/2020', '2021-04-21', '0000-00-00', 'Permohonan PK dari Terpidana An Sertu Rustam Muhammad Anwar Suat, Rindam XVI/Ptm', 1, 'Mahkamah Agung RI', '2021-05-05 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044406, NULL),
(6, 'B/289/IV/2021', '2021-04-29', '0000-00-00', 'Panggilan menghadap persidangan an Serma Andi Victor Harianto Jasdam XVI/Ptm', 1, 'ODITUR MILITER IV-19 AMBON', '2021-05-05 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044407, NULL),
(7, 'B/292/IV/2021', '2021-04-29', '0000-00-00', 'Panggilan menghadap persidangan an Koptu Zainal Abidin Ollong Bekangdam XVI/Ptm', 1, 'ODITUR MILITER IV-19 AMBON', '2021-05-05 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044408, NULL),
(8, 'B/380/IV/2021', '2021-04-27', '0000-00-00', 'Jawaban panggilan III menghadap persidangan an Serda Andi Satria S,Kep', 1, 'KODIM 1504 AMBON', '2021-05-04 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044409, NULL),
(9, '185/Pan.7/SRT/79K/Mil/2021', '2021-04-09', '0000-00-00', 'Penerimaan berkas perkara kasasi pidana militer an Terdakwa Praka Joko Priono Renuat', 1, 'Mahkamah Agung RI', '2021-05-05 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044410, NULL),
(10, 'B/63/BEBAS/IV/2021', '2021-04-22', '0000-00-00', 'Pembebasan narapidana an Praka Umardani Salaputa Brigif 27/Nusa Ina', 1, 'Masmil IV Makassar', '2021-05-05 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044411, NULL),
(11, '------', '2021-04-30', '0000-00-00', 'Mohon bantuan proses hukum kasus nikah ganda yang dilakukan oleh suami saya Koptu Zainal Abidin Ollo', 1, 'PRIBADI', '2021-05-04 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044412, NULL),
(12, 'B/301/V/2021', '2021-05-03', '0000-00-00', 'Pemberitahuan penyelesaian perkara Lalin an Terdakwa Koptu Asperos Tomalata Kodim 1502/Masohi', 1, 'ODITUR MILITER IV-19 AMBON', '2021-05-04 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044413, NULL),
(13, 'B/299/V/2021', '2021-05-03', '0000-00-00', 'Panggilan 2 menghadap persidangan sebagai Saksi an Terdakwa Serma Andi Victor Harianto Jasdam XVI/Pt', 1, 'ODITUR MILITER IV-19 AMBON', '2021-05-04 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044414, NULL),
(14, 'B/390/V/2021', '2021-04-27', '0000-00-00', 'Jawaban Panggilan 3 menghadap persidangan sebagai saksi atas nama terdakwa Prada Leonardus Samangun', 1, 'Yonif 734/SNS', '2021-05-04 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044415, NULL),
(15, 'B/391/IV/2021', '2021-04-27', '0000-00-00', 'Jawaban Panggilan 3 menghadap persidangan sebagai saksi atas nama prada ahmad bole bolly', 1, 'Yonif 734/SNS', '2021-05-04 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044416, NULL),
(16, 'B/304/V/2021', '2021-05-05', '0000-00-00', 'Pemberitahuan Penyelesaian Perkara Pelanggaran Lalu Lintas, a.n. Terdakwa Pratu Marlon Benamen, NRP.', 1, 'ODITUR MILITER IV-19 AMBON', '2021-05-07 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044417, NULL),
(17, 'B/305/V/2021', '2021-05-05', '0000-00-00', 'Pemberitahuan penyelesaian perkara pelanggaran lalu lintas a.n. Terdakwa Serda Fachril Samad Rumulut', 1, 'ODITUR MILITER IV-19 AMBON', '2021-05-07 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044418, NULL),
(18, 'Sprin/60/IV/2021', '2021-04-08', '0000-00-00', 'Sprin, agar segera mempersiapkan diri untuk menjalani Pidana Penjara selama 8 (delapan) bulan dengan', 1, ' Denmadam XVI/Pattimura', '2021-05-07 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044419, NULL),
(19, 'Sprin/79/IV/2021', '2021-04-28', '0000-00-00', 'Sprin, seterimahnya surat perintah inin di samping tugas dan tanggung jawab dalam jabatan sehari-har', 1, 'Kumdam XVI/Pattimura', '2021-05-07 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044420, NULL),
(20, 'R/68/III/2021', '2021-03-24', '0000-00-00', 'Pengiriman berkas perkara desersi Tersangka an Kopda Pieter Alfons Kodim 1503/Tual', 1, 'Denpom XVI/Masohi', '2021-05-11 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044421, NULL),
(21, 'R/69/III/2021', '2021-03-24', '0000-00-00', 'Pengiriman berkas perkara desersi Tersangka an Kopda Pardi ladjaenu Kodim 1502/Masohi', 1, 'Denpom XVI/Masohi', '2021-05-11 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044422, NULL),
(22, 'R/83/IV/2021', '2021-04-06', '0000-00-00', 'Pengiriman berkas perkara penganiayaan Tersangka an. SerdanTaufik Parlindah Kodim 1511/Pulau Moa', 1, 'Denpom XVI/Masohi', '2021-05-11 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044423, NULL),
(23, 'R/84/IV/2021', '2021-04-08', '0000-00-00', 'Pengiriman berkas perkara kecelakan lalu lintas tersangka an Pratu marlon Benamen Yonif 734/SNS', 1, 'Denpom XVI/Masohi', '2021-05-11 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044424, NULL),
(24, '217/Pan.7/SRT.Pet/58K/Mil/2021', '2021-04-22', '0000-00-00', 'Petikan Putusan Kasasi An Terdakwa Serda Arfandi Hamid Yonif RK 732/Banau', 1, 'Mahkamah Agung RI', '2021-05-11 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044425, NULL),
(25, '212/Pan.7/IV/2021/59/Pen/Tah/M', '2021-04-21', '0000-00-00', 'Salinan penetapan penahanan Ketua Muda urusan Lingkungan Peradilan Miiter An Terdakwa Prada Eko Iria', 1, 'Mahkamah Agung RI', '2021-05-11 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044426, NULL),
(26, 'W3 MIL/47/HK.01/IV/2021', '2021-04-22', '0000-00-00', 'Penahanan Hakim Ketua Dilmilti III-sby Nomor TAP/8-K/PMT.III/BDG/AD/IV/2021 tanggal 22 April 2021 an', 1, 'Dilmilti III Surabaya', '2021-05-11 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044427, NULL),
(27, '223/Pan.7/Srt.Pet/79K/Mil/2021', '2021-04-27', '0000-00-00', 'Petikan putusan kasasi an Terdakwa Praka Joko Priono Renuat BKO Yonarmedn9/2/1 Kostrad', 1, 'Mahkamah Agung RI', '2021-05-11 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044428, NULL),
(28, 'W3 MIL/49/HK.01/IV/2021', '2021-04-23', '0000-00-00', 'Penerimaan berkas perkara tingkat banding A.n Terdakwa Pratu Muhammad tatang Iskandar, Yonif Raider ', 1, 'Dilmilti III Surabaya', '2021-05-11 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044429, NULL),
(29, 'B/307/V/2021', '2021-05-10', '0000-00-00', 'Panggilan menghadap persidangan an Terdakwa Praka martin Taniwel Denmadam XVI/Ptm', 1, 'ODITUR MILITER IV-19 AMBON', '2021-05-11 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044430, NULL),
(30, 'B/308/V/2021', '2021-05-10', '0000-00-00', 'Panggilan menghadap persidangan an Terdakwa Sertu Lory Leiwakabessy Kodim 1504/Ambon', 1, 'ODITUR MILITER IV-19 AMBON', '2021-05-11 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044431, NULL),
(31, 'B/445/V/2021', '2021-05-10', '0000-00-00', 'Data Pelanggaran', 1, 'Rindam XVI/Pattimura', '2021-05-11 00:00:00', 'Surat Diarsipkan', 1, NULL, NULL, NULL, NULL, 1633044432, NULL),
(32, 'R/418/V/2021', '2021-05-03', '0000-00-00', 'Laporan selesai menjalani pidana an Praka Umardani Salaputa Brigif 27/Nusa Ina', 1, 'Brigif 27/Nusa Ina', '2021-05-11 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044433, NULL),
(33, 'SPANG/19/V/2021', '2021-05-11', '0000-00-00', 'Surat panggilan II an Terdakwa Koptu Zainal Abidin Ollong Bekangdam XVI/Ptm', 1, 'ODITUR MILITER IV-19 AMBON', '2021-05-11 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044434, NULL),
(34, 'B/69/BEBAS/IV/2021', '2021-04-27', '0000-00-00', 'Pembebasan narapidana militer an Kopda Rudi F Kodim 1502/Masohi', 1, 'ODITUR MILITER IV-19 AMBON', '2021-05-11 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044435, NULL),
(35, 'W3 MIL/62/HK.01/V/2021', '2021-05-07', '0000-00-00', 'Salinan putusan Dilmilti III-Surabaya Nomor 21-K/PMT.III/BDG/AD/IV/2021 tanggal 04 Mei 2021 an terda', 1, 'Dilmilti III Surabaya', '2021-05-17 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044436, NULL),
(36, 'B/312/V/2021', '2021-05-17', '0000-00-00', 'Pembebasan terpidana an Praka Charles Hattu Yonif RK 732/Banau', 1, 'ODITUR MILITER IV-19 AMBON', '2021-05-17 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044437, NULL),
(37, 'W3 MIL/61/HK.01/V/2021', '2021-05-05', '0000-00-00', 'Penerimaan berkas perkara tingkat banding an Terdakwa Letda Czi Herman', 1, 'Dilmilti III Surabaya', '2021-05-17 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044438, NULL),
(38, 'W3 MIL/60/HK.01/V/2021', '2021-05-05', '0000-00-00', 'Penerimaan berkas perkara tingkat banding an Terdakwa Pratu Sakna Tambunan', 1, 'Dilmilti III Surabaya', '2021-05-17 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044439, NULL),
(39, 'B/101/IV/2021', '2021-04-30', '0000-00-00', 'Laporan kemajuan pelaksanaan program kerja lemasmil IV Makassar bulan April TA 2021', 1, 'Masmil IV Makassar', '2021-05-18 00:00:00', 'Surat Diarsipkan', 1, NULL, NULL, NULL, NULL, 1633044440, NULL),
(40, 'R/88/IV/2021', '2021-04-22', '0000-00-00', 'Pengiriman berkas perkara desersi an Terdakwa Serda Eric Setiawan Brigif 27/Nusa Ina', 1, 'Denpom XVI/Masohi', '2021-05-20 00:00:00', 'Surat Diarsipkan', 1, NULL, NULL, NULL, NULL, 1633044441, NULL),
(41, 'W3 MIL/19/HK.07/V/2021', '2021-05-04', '0000-00-00', 'Penetapan penahanan Hakim Kadilmilti III-Sby No. TAP/11-K/PMT.III/BDG/AD/V/2021 tanggal 03 Mei 2021 ', 1, 'Dilmilti III Surabaya', '2021-05-20 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044442, NULL),
(42, 'W3 MIL/18/HK.07/V/2021', '2021-05-04', '0000-00-00', 'Salinan putuan Dilmilti III-Sby No.17-K/PMT.III/BDG/AD/IV/2021 tanggal 27-04-2021 an Terdakwa Serka ', 1, 'Dilmilti III Surabaya', '2021-05-20 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044443, NULL),
(43, 'B/325/V/2021', '2021-05-20', '0000-00-00', 'Panggilan III menghadap persidangan sebagai Saksi an Terdakwa Pratu Randi Palio Yonif 731/Kabaresi', 1, 'ODITUR MILITER IV-19 AMBON', '2021-05-20 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044444, NULL),
(44, 'B/324/V/2021', '2021-05-20', '0000-00-00', 'Panggilan III menghadap persidangan sebagai Saksi an Terdakwa Prada Yohanes Andres Saimima Yonif 731', 1, 'ODITUR MILITER IV-19 AMBON', '2021-05-20 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044445, NULL),
(45, 'B/327/V/2021', '2021-05-20', '0000-00-00', 'Panggilan II menghadap persidangan sebagai Saksi an Terdakwa Pratu Aprianus Jamlay Yonif 731/Kabares', 1, 'ODITUR MILITER IV-19 AMBON', '2021-05-20 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044446, NULL),
(46, 'B/326/V/2021', '2021-05-20', '0000-00-00', 'Panggilan II menghadap persidangan senagai Saksi an terdakwa Praka La Ode Lukman Kodim 1507/Saumlaki', 1, 'ODITUR MILITER IV-19 AMBON', '2021-05-20 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044447, NULL),
(47, 'B/319/V/2021', '2021-05-19', '0000-00-00', 'Panggilan menghadap persidangan sebagai Saksi an Terdakwa Prada Hengki Tornado Pomdam XVI/Ptm', 1, 'ODITUR MILITER IV-19 AMBON', '2021-05-20 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044448, NULL),
(48, 'sprin/260/v/2021', '2021-05-21', '0000-00-00', 'Sprin.Diperintahkan menghadap di persidangan Pengadilan Militer III-18 Ambon.Pada hari senin, tangga', 1, 'Yonif 731/Kabaresi', '2021-05-24 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044449, NULL),
(49, 'sprin/261/v/2021', '2021-05-21', '0000-00-00', 'Sprin.Diperintahkan menghadap di persidangan Pengadilan Militer III-18 Ambon.Pada hari Senin, Tangga', 1, 'Yonif 731/Kabaresi', '2021-05-24 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044450, NULL),
(50, 'Kep/12/v/2021', '2021-05-20', '0000-00-00', 'Penyerahan Perkara a.n Praka Amirudin Lessy, NRP 539616 Kesatuan TNI AU Pattimura', 1, 'Lanut Pattimura', '2021-05-24 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044451, NULL),
(51, 'kep/02/IV/2021', '2021-04-30', '0000-00-00', 'Penyerahan Perkara a.n Adi Wiyanto Serda Mes NRP 76883 Kesatuan Lanal Ternate.', 1, 'Lantamal IX', '2021-05-24 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044452, NULL),
(52, 'B/332/V/2021', '2021-05-24', '0000-00-00', 'Panggilan III menghadap persidangan an Terdakwa Prada Yohanes Andres Saimima Yonif 731/Kabaresi', 1, 'ODITUR MILITER IV-19 AMBON', '2021-05-24 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044453, NULL),
(53, 'b/339/v/2021', '2021-05-27', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer (panggilan III) a.n Berty Tuatfaru NRP 3100033226', 1, 'Oditurat Militer IV-19', '2021-05-27 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044454, NULL),
(54, 'b/340/v/2021', '2021-05-27', '0000-00-00', 'Panggilan menghadap persidangan Pengadilan Militer (Panggilan III) a.n Ali Makatita NRP 315096204028', 1, 'Oditurat Militer IV-19', '2021-05-27 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044455, NULL),
(55, 'B/341/v/2021', '2021-05-27', '0000-00-00', 'Panggilan menghadap persidangan Pengadilan Militer (Panggilan III) a.n Rajiman Achmad NRP 3110025396', 1, 'ODITUR MILITER IV-19 AMBON', '2021-05-27 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044456, NULL),
(56, 'Kep/151/v/2021', '2021-05-03', '0000-00-00', 'Penahanan sementara komandan batalayon infentari 731/kabaresi', 1, 'Brigif 27/Nusa Ina', '2021-05-28 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044457, NULL),
(57, 'R/150/V/2021', '2021-05-03', '0000-00-00', 'LAPORAN PENANGKAPAN ANGGOTA YONIF 731/KABARESI A.N PRATU RANDI PALIO NRP 31120303030293', 1, 'Brigif 27/Nusa Ina', '2021-05-28 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044458, NULL),
(58, 'R/168/V/2021', '2021-05-21', '0000-00-00', 'JAWABAN SURAT PANGGILAN KE-2 ANGGOTA YONIF 731/KABARESI A.N PRATU APRIANUS JAMLAY NRP 31120277700490', 1, 'Brigif 27/Nusa Ina', '2021-05-28 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044459, NULL),
(59, 'R/160/V/2021', '2021-05-16', '0000-00-00', 'laporan selesai menjalani pidana a.n Praka Deni Afriadin NRP 31120311030490', 1, 'Brigif 27/Nusa Ina', '2021-05-28 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044460, NULL),
(60, 'B/441/V/2021', '2021-05-19', '0000-00-00', 'SELESAI MENJALANI PIDANA PERCOBAAN A.N SERDA NUH ARI FADILAH NRP 2100001367981', 1, 'Brigif 27/Nusa Ina', '2021-05-28 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044461, NULL),
(61, 'b/350/v/2021', '2021-05-28', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n Praka Muchlis Ibrahim NRP. 31080236760588', 1, 'ODITUR MILITER IV-19 AMBON', '2021-05-28 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044462, NULL),
(62, 'b/351/v/2021', '2021-05-28', '0000-00-00', 'Pengadilan menghadap persidangan pengadilan militer a.n Serda Gustianas Pelupessy NRP. 2119021091089', 1, 'ODITUR MILITER IV-19 AMBON', '2021-05-28 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044463, NULL),
(63, 'b/352/v/2021', '2021-05-28', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n Pelda Ambo Dale Nuhu NRP. 3930349130471', 1, 'ODITUR MILITER IV-19 AMBON', '2021-05-28 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044464, NULL),
(64, 'b/353/v/2021', '2021-05-28', '0000-00-00', 'Panggilan menghadap persidangan militer a.n Prada Fendi Glandinosero NRP. 31190363521298', 1, 'ODITUR MILITER IV-19 AMBON', '2021-05-28 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044465, NULL),
(65, 'b/73/bebas/v/2021', '2021-05-13', '0000-00-00', 'Pembebasan Narapidana Militer a.n Praka Deni A, NRP 31120311030490', 1, 'Lembaga permasyarakatan militer IV Makassar', '2021-06-02 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044466, NULL),
(66, '260/PAN.7/SRT/94 K/MIL/2021', '2021-05-18', '0000-00-00', 'Penerimaan berkas perkara kasasi pidana militer a.n terdakwa Eko Irianto', 1, 'Mahkamah Agung RI', '2021-06-02 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044467, NULL),
(67, 'B/371/VI/2021', '2021-06-07', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a. n Serda Adi Wiyanto, NRP 76883', 1, 'Oditur Militer IV-19 Ambon', '2021-06-08 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044468, NULL),
(68, 'B/274/V/2021', '2021-05-30', '0000-00-00', 'Permohonan keputusan pemberhentian dengan tidak hormat (PDTH) dari dinas Militer TNI AD a.n Serda An', 1, 'Kodam XVI/Pattimura', '2021-06-08 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044469, NULL),
(69, 'Kep/15/VI/2021', '2021-06-08', '0000-00-00', 'Penahanan sementara terhadap tersangka a.n Hendrik Dhunad Lumatunine, NRP 210400263110582', 1, 'Kodam XVI/Pattimura', '2021-06-08 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044470, NULL),
(70, 'B/589/V/2021', '2021-05-27', '0000-00-00', 'Jawaban panggilan persidangan oleh kopral satu Berty Tuatfaru NRP 31003322690479 sebagai tersangka p', 1, 'Komando Resor Militer 152/Babullah', '2021-06-08 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044471, NULL),
(71, 'B/413/V/2021', '2021-05-27', '0000-00-00', 'Jawaban panggilan menghadap pengadilan militer (panggilan III) a. n Praka Rajiman Achmad NRP 3110025', 1, 'Komando Resor Militer 152/Babullah', '2021-06-08 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044472, NULL),
(72, 'Sprin/88/V/2021', '2021-05-24', '0000-00-00', 'Perintah untuk melaksanakan bantuan dan nasehat hukum kpd Mayor Chk Kusjanto, S.H., NRP 219501172707', 1, 'Kodam XVI/Pattimura', '2021-06-08 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044473, NULL),
(73, 'B/379/VI/2021', '2021-06-09', '0000-00-00', 'PANGGILAN MENGHADAP PERSIDANGAN DI PENGADILAN MILITER A.N TERDAKWA PRAKA AMIRUDIN LESSY NRP.539616', 1, 'Otmil IV-19 Ambon', '2021-06-10 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044474, NULL),
(74, 'Spang/21/VI/2021', '2021-06-09', '0000-00-00', 'PANGGILAN MENGHADAP PERSIDANGAN DI PENGADILAN MILITER A.N TERDAKWA PRAKA MILTON SIALEKY NRP. 3111056', 1, 'Otmil IV-19 Ambon', '2021-06-10 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044475, NULL),
(75, 'b/389/vi/2021', '2021-06-09', '0000-00-00', 'PANGGILAN MENJALANI PIDANA A.N TERPIDANA KOPTU ZAINAL ABIDIN OLLONG NRP. 31010353620979', 1, 'Otmil IV-19 Ambon', '2021-06-10 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044476, NULL),
(76, 'B/383/VI/2021', '2021-06-09', '0000-00-00', 'PANGGILAN MENGHADAP PERSIDANGAN DI PENGADILAN MILITER (PANGGILAN II) A.N SERDA ADI WIYANTO NRP. 7688', 1, 'Otmil IV-19 Ambon', '2021-06-10 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044477, NULL),
(77, 'B/113/V/2021', '2021-05-31', '0000-00-00', 'LAPORAN KEMAJUAN PELAKSANAAN PROGRAM KERJA LEMASMIL IV MAKASSAR BULAN MEI TA.2021', 1, 'Lembaga permasyarakatan militer IV Makassar', '2021-06-10 00:00:00', 'Diarsipkan.', 1, NULL, NULL, NULL, NULL, 1633044478, NULL),
(78, 'R/139/VI/2021', '2021-06-10', '0000-00-00', 'Pengiriman Berkas Perkara Desersi Tersangka a.n Sertu Brusly Edgar Romodar, NRP 31990280971079', 1, 'Polisi Militer Daerah Militer XVI/Pattimura Detase', '2021-06-11 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044479, NULL),
(79, 'B/651/VI/2021', '2021-06-13', '0000-00-00', 'Tidak dapat menghadirkan saksi di persidangan terkait perkara tindak pedana penyalahgunaan munisi ol', 1, 'Yonif R 733/Masariku', '2021-06-14 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044480, NULL),
(80, 'B/652/VI/2021', '2021-06-13', '0000-00-00', 'Tidak dapat menghadirkan saksi di persidangan terkait perkara tindak pedana penyalahgunaan munisi ol', 1, 'Yonif R 733/Masariku', '2021-06-14 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044481, NULL),
(81, 'B/653/VI/2021', '2021-06-14', '0000-00-00', 'Tidak dapat menghadirkan saksi di persidangan terkait perkara tindak pedana penyalahgunaan munisi ol', 1, 'Yonif R 733/Masariku', '2021-06-14 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044482, NULL),
(82, 'B/622/VI/2021', '2021-06-10', '0000-00-00', 'Data pelanggaran anggota Rindam XVI/PATTIMURA yang belum tuntas proses hukumnya sampai dengan bulan ', 1, 'Kodam XVI/Pattimura', '2021-06-14 00:00:00', 'Diarsipkan.', 1, NULL, NULL, NULL, NULL, 1633044483, NULL),
(83, 'R/182/VI/2021', '2021-06-03', '0000-00-00', 'Pendapat dan saran pemberhentian dengan tidak hormat dari Dinas Kemiliteran a.n Pratu Randi Palio, N', 1, 'Otmil IV-19 Ambon', '2021-06-14 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044484, NULL),
(84, 'B/397/VI/2021', '2021-06-10', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer (panggilan III) terdakwa a.n. Serka Frans Palinus', 1, 'Otmil IV-19 Ambon', '2021-06-14 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044485, NULL),
(85, 'B/396/VI/2021', '2021-06-10', '0000-00-00', 'Panggilan menghadap persidangan Pengadilan Militer (Panggilan III) terdakwa a.n Praka La Ode Lukman,', 1, 'Otmil IV-19 Ambon', '2021-06-14 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044486, NULL),
(86, 'B/400/VI/2021', '2021-06-14', '0000-00-00', 'panggilan menghadap persidangan pengadilan militer (panggilan iii) terdakwa a.n. Pratu Aprianus Jaml', 1, 'Otmil IV-19 Ambon', '2021-06-14 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044487, NULL),
(87, '/392/VI/2021', '2021-06-10', '0000-00-00', 'PANGGILAN MENGHADAP PERSIDANGAN PENGADILAN MILITER (PANGGILAN III) terdakwa a.n Pratu Bambang Bahar,', 1, 'Otmil IV-19 Ambon', '2021-06-14 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044488, NULL),
(88, 'B/387/VI/2021', '2021-06-10', '0000-00-00', 'Panggilan menghadap Pesidangan Pengadilan Militer terdakwa a.n Pratu Arifin Rumaf, NRP 3112061175039', 1, 'Otmil IV-19 Ambon', '2021-06-14 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044489, NULL),
(89, 'B/377/VI/2021', '2021-06-09', '0000-00-00', 'Panggilan menghadap persidangan Pengadilan Militer terdakwa a.n Praka Milton Sialeky, NRP 3111056853', 1, 'Otmil IV-19 Ambon', '2021-06-14 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044490, NULL),
(90, 'B/386/VI/2021', '2021-06-10', '0000-00-00', 'panggilan menghadap persidangan pengadilan militer terdakwa a.n. Serka Muhammad Kasim Nukuhehe, NRP ', 1, 'Otmil IV-19 Ambon', '2021-06-14 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044491, NULL),
(91, 'B/395/VI/2021', '2021-06-14', '0000-00-00', 'Panggilan menghadap persidangan Pengadilan Militer a.n Serda Mes Adi Wiyanto, NRP 76883', 1, 'Otmil IV-19 Ambon', '2021-06-14 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044492, NULL),
(92, 'B/398/VI/2021', '2021-06-10', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer (panggilan III) terdakwa a.n. Koptu Berty Tuatfar', 1, 'Otmil IV-19 Ambon', '2021-06-14 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044493, NULL),
(93, 'B/399/VI/2021', '2021-06-10', '0000-00-00', 'Panggilan menghadap persidangan Pengadilan Militer (Panggilan IV) terdakwa a.n Praka Rajiman Achmad,', 1, 'Otmil IV-19 Ambon', '2021-06-14 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044494, NULL),
(94, 'B/407/VI/2021', '2021-06-11', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer terdakwa a.n Pratu Isak Gainau, NRP 3117036636029', 1, 'Otmil IV-19 Ambon', '2021-06-14 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044495, NULL),
(95, 'B/408/VI/2021', '2021-06-11', '0000-00-00', 'Pemberitahuan penyelesaian perkara pelanggaran lalu lintas a.n Praka Muchlis Ibrahim, NRP 3108023676', 1, 'Otmil IV-19 Ambon', '2021-06-14 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044496, NULL),
(96, 'B/410/VI/2021', '2021-06-11', '0000-00-00', 'Pemberitahuan penyelesaian perkara pelanggaran lalu lintas a.n Serda Gustianas pelupessy, NRP 211902', 1, 'Otmil IV-19 Ambon', '2021-06-14 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044497, NULL),
(97, 'B/409/VI/2021', '2021-06-11', '0000-00-00', 'pemberitahuan penyelesaian perkara pelanggaran lalu lintas a.n prada fendi glandinosero, NRP 3119036', 1, 'Otmil IV-19 Ambon', '2021-06-14 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044498, NULL),
(98, 'B/425/VI/2021', '2021-06-16', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer (panggilan II) terdakwa a.n. Agung Putra Yudha NR', 1, 'Otmil IV-19 Ambon', '2021-06-17 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044499, NULL),
(99, 'B/426/VI/2021', '2021-06-16', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer (panggilan II) terdakwa a.n. Aryo Nugroho D', 1, 'Otmil IV-19 Ambon', '2021-06-17 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044500, NULL),
(100, 'B/431/VI/2021', '2021-06-16', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n Praka Iradat Muin, NRP 31100533640789. dan Pr', 1, 'Otmil IV-19 Ambon', '2021-06-17 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044501, NULL),
(101, 'R/516/VI/2021', '2021-06-09', '0000-00-00', 'Pendapat dan saran pemberhentian dengan tidak hormat dari dinas kemiliteran a.n. Pratu Randi Palio N', 1, 'Kodam XVI/Pattimura', '2021-06-17 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044502, NULL),
(102, 'Sprin/107/VI/2021', '2021-06-16', '0000-00-00', 'Sprin. agar mempersiapkan diri untuk menjalani sisa pidana di lemasmil IV-Makassar', 1, 'Kodam XVI/Pattimura', '2021-06-17 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044503, NULL),
(103, 'Sprin/229/VI/2021', '2021-06-10', '0000-00-00', 'Sprin. untuk berangkat ke Otmil IV-19 Ambon guna menjalani sisa pidana penjara 6 (enam) bulan 25 (du', 1, 'Kodam XVI/Pattimura', '2021-06-17 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044504, NULL),
(104, 'B/429/VI/2021', '2021-06-16', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer terdakwa a.n. Cakrarianto Djole NRP 2117019741109', 1, 'Otmil IV-19 Ambon', '2021-06-17 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044505, NULL),
(105, 'R/114/V/2021', '2021-05-20', '0000-00-00', 'Pengiriman Berkas Perkara Kecelakaan lalu lintas tersangka a.n Koptu Asperos Tomatola, NRP 310107680', 1, 'Polisi Militer Daerah Militer XVI/Pattimura', '2021-06-18 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044506, NULL),
(106, 'Sprin/112/VI/2021', '2021-06-18', '0000-00-00', 'Sprin. Agar mempersiapkan diri untuk melaksanakan pendampingan terhadap Sertu (K) Iin Chayanti Djala', 1, 'Kumdam XVI/Pattimura', '2021-06-21 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044507, NULL),
(107, 'Kep/401-18/VI/2021', '2021-06-08', '0000-00-00', 'Pemberhentian dengan tidak hormat dari Dinas Keprajuritan TNI Angkatan Darat', 1, 'Kodam XVI/Pattimura', '2021-06-21 00:00:00', 'Diarsipkan.', 1, NULL, NULL, NULL, NULL, 1633044508, NULL),
(108, 'B/437/VI/2021', '2021-06-17', '0000-00-00', 'Pemberitahuan penyelesaian perkara pelanggaran lalu lintas a.n. terdakwa Sertu Lori Leiwakabessy NRP', 1, 'Otmil IV-19 Ambon', '2021-06-21 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044509, NULL),
(109, 'B/438/VI/2021', '2021-06-17', '0000-00-00', 'Pemberiyahuan penyelesaian perkara pelanggaran lalu lintas a.n. terdakwa praka Martin Taniwel NRP 31', 1, 'Otmil IV-19 Ambon', '2021-06-21 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044510, NULL),
(110, 'B/443/VI/2021', '2021-06-21', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer (panggilan II) terdakwa a.n. Praka Amirudin Lessy', 1, 'Otmil IV-19 Ambon', '2021-06-21 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044511, NULL),
(111, 'B/444/VI/2021', '2021-06-21', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer (panggilan II) terdakwa a.n. Praka Milton Sialeky', 1, 'Otmil IV-19 Ambon', '2021-06-22 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044512, NULL),
(112, 'R/146/VI/2021', '2021-06-16', '0000-00-00', 'Jawaban Surat Panggilan ke-3 anggota Yonif 731/Kabaresi a.n Pratu Aprianus Jamlay, NRP. 311202777004', 1, 'Yonif/731 Kabaresi', '2021-06-22 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044513, NULL),
(113, 'Kep/46/VI/2021', '2021-06-11', '0000-00-00', 'Penyerahan perkara Komandan Korem 152/Babullah a.n terdakwa Serda Cakrarianto Djole, NRP. 2117019741', 1, 'Korem 152/Babullah', '2021-06-22 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044514, NULL),
(114, 'Kep/47/VI/2021', '2021-06-11', '0000-00-00', 'Penyerahan Perkara Komandan Korem 152/Babullah a.n Terdakwa Praka Iradat Muin, NRP. 31100533640789, ', 1, 'Korem 152/Babullah', '2021-06-22 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044515, NULL),
(115, 'W.3 MIL/77/HK.01/VI/2021', '2021-06-10', '0000-00-00', 'Penerimaan Berkas Perkara Tingkat Banding an. Terdakwa Serda Wibowo Mukti, NRP. 21080797040788', 1, 'Dilmilti III Surabaya', '2021-06-23 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044516, NULL),
(116, 'W.3 MIL/76/HK.01/VI/2021', '2021-06-23', '0000-00-00', 'Penahanan Hakim Ketua Pengadilan Militer Tinggi III Surabaya Nomor TAP/19-K/PMT. III/BDG/AD/VI/2021 ', 1, 'Dilmilti III Surabaya', '2021-06-23 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044517, NULL),
(117, 'W.3 MIL/79/HK.01/VI/2021', '2021-06-10', '0000-00-00', 'Perpanjangan Penahanan Kepala Pengadilan Militer Tinggi III Surabaya Nomor TAP/22-K/PMT. III/BDG/AD/', 1, 'Dilmilti III Surabaya', '2021-06-23 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044518, NULL),
(118, 'B/169/VI/2021', '2021-06-08', '0000-00-00', 'Surat jawaban panggilan menghadap Persidangan Pengadilan Militer', 1, 'Pangkalan Utama TNI AL XIV, Pangkalan TNI AL Terna', '2021-06-23 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044519, NULL),
(119, 'B/170/VI/2021', '2021-06-11', '0000-00-00', 'Surat jawaban panggilan menghadap Pengadilan Militer (Panggilan II)', 1, 'Pangkalan Utama TNI AL XIV, Pangkalan TNI AL Terna', '2021-06-23 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044520, NULL),
(120, '276/Pan.7/VI/2021/69/Pen/Tah/Mil/S/2021', '2021-06-10', '0000-00-00', 'Surat Pengantar salinan Penetapan Perpanjangan Penahanan a.n Terdakwa Prada Eko Irianto, NRP. 311808', 1, 'Mahkamah Agung RI', '2021-06-23 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044521, NULL),
(121, 'B/453/VI/2021', '2021-06-24', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n. terdakwa kopda pardi ladjaenu, NRP 311002608', 1, 'Otmil IV-19 Ambon', '2021-06-24 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044522, NULL),
(122, 'B/452/VI/2021', '2021-06-24', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n. terdakwa kopda petrus batmomolin, NRP 310403', 1, 'Otmil IV-19 Ambon', '2021-06-24 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044523, NULL),
(123, 'R/200/VI/2021', '2021-06-18', '0000-00-00', 'Permohonan keringanan hukuman Serda Cakrarianto Djole, NRP. 21170197411096', 1, 'Yonif 732/Banau', '2021-06-25 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044524, NULL),
(124, 'R/197/VI/2021', '2021-06-18', '0000-00-00', 'Permohonan keringanan hukuman Kopda Mardiman Papuangan, NRP. 31090576650188', 1, 'Yonif 732/Banau', '2021-06-25 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044525, NULL),
(125, 'R/198/VI/2021', '2021-06-18', '0000-00-00', 'Permohonan keringanan hukuman Serda Willian De Fretes, NRP. 21190210340598', 1, 'Yonif 732/Banau', '2021-06-25 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044526, NULL),
(126, 'R/199/VI/2021', '2021-06-18', '0000-00-00', 'Permohonan keringanan hukuman Serda Donny Dominggus, NRP. 21190216951199', 1, 'Yonif 732/Banau', '2021-06-25 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044527, NULL),
(127, 'R/201/VI/2021', '2021-06-18', '0000-00-00', 'Permohonan keringanan hukuman Pratu Gabriel Titirloloby, NRP. 31170375190897', 1, 'Yonif 732/Banau', '2021-06-25 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044528, NULL),
(128, 'R/194/VI/2021', '2021-06-18', '0000-00-00', 'Permohonan keringanan hukuman Praka iradat muin NRP 31100533640789', 1, 'Yonif 732/Banau', '2021-06-25 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044529, NULL),
(129, 'R/193/VI/2021', '2021-06-18', '0000-00-00', 'Permohonan keringanan hukuman Pratu Saiful M. Saleh NRP 31140367870795', 1, 'Yonif 732/Banau', '2021-06-25 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044530, NULL),
(130, 'R/195/VI/2021', '2021-06-18', '0000-00-00', 'Permohonan keringanan hukuman Prada ramdani musli waralalo NRP 31190347040900', 1, 'Yonif 732/Banau', '2021-06-25 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044531, NULL),
(131, 'R/196/VI/2021', '2021-06-18', '0000-00-00', 'Permohonan keringanan hukuman Pratu La Ode Irfan NRP 31170406791296', 1, 'Yonif 732/Banau', '2021-06-25 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044532, NULL),
(132, 'B/466/VI/2021', '2021-06-25', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n. terdakwa Letda Ctp Syafrie Bosou NRP 2197020', 1, 'Otmil IV-19 Ambon', '2021-06-25 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044533, NULL),
(133, 'B/465/VI/2021', '2021-06-25', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n. terdakwa Serka Adi Kusuma Wahyudi NRP 210902', 1, 'Otmil IV-19 Ambon', '2021-06-25 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044534, NULL),
(134, 'B/464/VI/2021', '2021-06-25', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n. terdakwa Sertu Rivaldo Billy Akollo NRP 2118', 1, 'Otmil IV-19 Ambon', '2021-06-25 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044535, NULL),
(135, 'B/463/VI/2021', '2021-06-25', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n. terdakwa Serda La Rikwan Djabumona NRP 31604', 1, 'Otmil IV-19 Ambon', '2021-06-25 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044536, NULL),
(136, 'B/461/VI/2021', '2021-06-25', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n. terdakwa Praka La Alimudin NRP 3112030253129', 1, 'Otmil IV-19 Ambon', '2021-06-25 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044537, NULL),
(137, 'B/462/VI/2021', '2021-06-25', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n. terdakwaPraka Andre Utama Putra NRP311200018', 1, 'Otmil IV-19 Ambon', '2021-06-25 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044538, NULL),
(138, 'B/87/Bebas/VI/2021', '2021-06-22', '0000-00-00', 'Pembebasan narapidana militer a.n Pratu Dani Dimas Yuda, NRP. 31140187771293', 1, 'Lembaga permasyarakatan militer IV Makassar', '2021-06-28 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044539, NULL),
(139, 'W2-Mil01/660/HK.01/V/2021', '2021-05-27', '0000-00-00', 'Akte pemberitahuan isis putusan kasasi Nomor : APIK/93/PM II-08/AD/V/2021 An. Joko Priono Renuat, Ke', 1, 'Pengadilan Militer III-08 Jakarta', '2021-06-30 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044540, NULL),
(140, 'W.3 MIL/22/HK.04/VI/2021', '2021-06-23', '0000-00-00', 'Penetapan penahanan hakim ketua pengadilan militer III Surabaya Nomor : TAP/26-K/PMT III/BDG/AD/VI/2', 1, 'PENGADILAN MILITER TINGGI III SURABAYA', '2021-06-30 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044541, NULL),
(141, 'W.3 MIL/25/HK.04/VI/2021', '2021-06-25', '0000-00-00', 'Penerimaan berkas perkara tingkat banding a.n Terdakwa Hengki Tornado Prada NRP. 31130483871192', 1, 'PENGADILAN MILITER TINGGI III SURABAYA', '2021-06-30 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044542, NULL),
(142, 'W3-Mil05/218/HK.04/VI/2021', '2021-06-21', '0000-00-00', 'Pemberitahuan untuk datang di Kepaniteraan Dilmil III-16 Makassar', 1, 'Pengadilan Militer III-16 Makassar', '2021-06-30 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044543, NULL),
(143, 'W3-Mil05/220/HK.04/VI/2021', '2021-06-23', '0000-00-00', 'Pembacaan putusan banding terdakwa Herman Letda Czi NRP. 21040264510783', 1, 'Pengadilan Militer III-16 Makassar', '2021-06-30 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044544, NULL),
(144, 'B/492/VI/2021', '2021-06-29', '0000-00-00', 'Permohonan bantuan hukum untuk mendampingi tersangka a.n serma hendrik D.Y. Lumatunine, NRP 21040263', 1, 'Deninteldam XVI/Ptm', '2021-06-30 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044545, NULL),
(145, 'R/137/VI/2021', '2021-06-10', '0000-00-00', 'Pengiriman berkas perkara Desersi tersangka a.n Prada Jeferson Refutu, NRP. 31160667170296', 1, 'Polisi Militer Daerah Militer XVI/Pattimura Detase', '2021-07-02 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044546, NULL),
(146, 'R/154/VI/2021', '2021-06-18', '0000-00-00', 'Pengiriman berkas perkara desersi tersangka a.n Sertu La Sam Wabula, NRP. 31040381990882', 1, 'Polisi Militer Daerah Militer XVI/Pattimura Detase', '2021-07-02 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044547, NULL),
(147, 'B/481/VI/2021', '2021-06-30', '0000-00-00', 'Panggilan menjalani pidana dan usul PDTH A.n Terpidana Prada Leonardus Samangun, NRP. 31140361590694', 1, 'Otmil IV-19 Ambon', '2021-07-02 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044548, NULL),
(148, 'B/482/VI/2021', '2021-06-30', '0000-00-00', 'Panggilan menjalani pidana dan usul PDTH a.n terpidana Prada Ahmad Bole Boly, NRP. 31170372610297', 1, 'Otmil IV-19 Ambon', '2021-07-02 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044549, NULL),
(149, 'B/483/VI/2021', '2021-06-30', '0000-00-00', 'Panggilan menjalani pidana dan usul PDTH a.n terpidana Pratu Ari Susanto, NRP. 31130666520992', 1, 'Otmil IV-19 Ambon', '2021-07-02 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044550, NULL),
(150, 'B/484/VI/2021', '2021-06-30', '0000-00-00', 'Panggilan menjalani pidana dan usul PDTH a.n terpidana Serda Andi Satria S.Kep, NRP. 31000212981279', 1, 'Otmil IV-19 Ambon', '2021-07-02 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044551, NULL),
(151, 'B/485/VI/2021', '2021-06-30', '0000-00-00', 'Panggilan menjalani pidana dan usul PDTH a.n terpidana Praka Rustam Saman Wayatim, NRP. 310905887904', 1, 'Otmil IV-19 Ambon', '2021-07-02 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044552, NULL),
(152, 'B/492/VII/2021', '2021-07-01', '0000-00-00', 'Panggilan menghadap persidangan Pengadilan Militer a.n terdakwa Pratu Randi Palio, NRP. 311203030302', 1, 'Otmil IV-19 Ambon', '2021-07-02 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044553, NULL),
(153, 'B/494/VII/2021', '2021-07-01', '0000-00-00', 'Pemberitahuan penyelesaian perkara pelanggaran lalu lintas', 1, 'Otmil IV-19 Ambon', '2021-07-02 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044554, NULL),
(154, 'W3.MIL/26/HK.04/VI/2021', '2021-06-28', '0000-00-00', 'Perpanjang penahanan kepala pengadilan militer tinggi III surabaya Nomor TAP/27-K/PMT III/BDG/AD/VI/', 1, 'PENGADILAN MILITER TINGGI III SURABAYA', '2021-07-05 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044555, NULL),
(155, 'W3.MIL/97/HK.01/VI/2021', '2021-06-30', '0000-00-00', 'Penerimaan berkas perkara banding a.n terdakwa Hengki Tornado, Prada NRP. 31130483871192', 1, 'PENGADILAN MILITER TINGGI III SURABAYA', '2021-07-05 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044556, NULL),
(156, 'W3.MIL/96/HK.01/VI/2021', '2021-06-30', '0000-00-00', 'Penetapan penahanan hakim ketua pengadilan militer tinggi III surabaya Nomor TAP/28-K/PMT III/BDG/AD', 1, 'PENGADILAN MILITER TINGGI III SURABAYA', '2021-07-06 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044557, NULL),
(157, '291/Pan.7/VI/2021/78/Pen/Tah/M', '2021-06-28', '0000-00-00', 'Surat pengantar salinan penetapan penahanan ketua muda urusan lingkungan peradilan militer a.n terda', 1, 'Mahkamah Agung RI', '2021-07-05 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044558, NULL),
(158, 'W3.MIL/93/HK.01/VI/2021', '2021-06-28', '0000-00-00', 'Surat pengantar a.n terdakwa Wibowo Mukti, Serda NRP. 21160081580796 jabatan Tarmin Arsip Jemen Sren', 1, 'PENGADILAN MILITER TINGGI III SURABAYA', '2021-07-05 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044559, NULL),
(159, 'B/486/VII/2021', '2021-07-01', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n terdakwa Serda Fachril Samad Rumalutur, NRP. ', 1, 'Odmil IV-19 Ambon', '2021-07-05 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044560, NULL),
(160, 'B/496/VII/2021', '2021-07-05', '0000-00-00', 'Pemberitahuan penyelesaian perkara pelanggaran lalu lintas a.n terdakwa Sertu Rivaldo Billy Akollo, ', 1, 'Odmil IV-19 Ambon', '2021-07-05 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044561, NULL),
(161, 'B/497/VII/2021', '2021-07-05', '0000-00-00', 'Pemberitahuan penyelesaian perkara pelanggaran lalu lintas a.n terdakwa Praka La Rikwan Djabumona, N', 1, 'Odmil IV-19 Ambon', '2021-07-05 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044562, NULL),
(162, 'B/498/VII/2021', '2021-07-05', '0000-00-00', 'Pemberitahuan penyelesaian perkara pelanggaran lalu lintas a.n terdakwa Praka La Alimuddin, NRP. 311', 1, 'Odmil IV-19 Ambon', '2021-07-05 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044563, NULL),
(163, 'B/499/VII/2021', '2021-07-05', '0000-00-00', 'Pemberitahuan penyelesaian perkara pelanggaran lalu lintas a.n terdakwa Letda Ctp Syafrie Bosou, NRP', 1, 'Odmil IV-19 Ambon', '2021-07-05 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044564, NULL),
(164, 'B/500/VII/2021', '2021-07-05', '0000-00-00', 'Pemberitahuan penyelesaian perkara pelanggaran lalu lintas a.n terdakwa Pratu Isak Gainau, NRP. 3117', 1, 'Odmil IV-19 Ambon', '2021-07-05 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044565, NULL),
(165, 'R/229/VII/2021', '2021-07-05', '0000-00-00', 'Jawaban surat panggilan anggota Yonif 731/Kabaresi a.n Kopda Bajuka Tuasikal, NRP. 31080226030287', 1, 'Brigif 27/Nusa Ina', '2021-07-06 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044566, NULL),
(166, 'Sprin/230/VII/2021', '2021-07-05', '0000-00-00', 'Sprin.menghadap persidangan pengadilan militer III-18 ambon tanggal 6 juli 2021 pukul.08.30 WIT guna', 1, 'Brigif 27/Nusa Ina', '2021-07-06 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044567, NULL),
(167, 'Sprin/742/VII/2021', '2021-07-04', '0000-00-00', 'Sprin. untuk menghadiri persidangan pengadilan militer III-18 Ambon, dalam perkara terdakwa Serda Fa', 1, 'DEVISI INFANTERI 2/VIRACAKTI YUDHA RESIMEN ANTILE', '2021-07-06 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044568, NULL),
(168, 'B/123/VI/2021', '2021-06-28', '0000-00-00', 'Laporan penerimaan Napimil a.n Koptu Zainal Abidin Ollong NRP. 31010353620979', 1, 'Lembaga permasyarakatan militer IV Makassar', '2021-07-06 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044569, NULL),
(169, 'B/124/VI/2021', '2021-06-28', '0000-00-00', 'Laporan penerimaan Napimil a.n Sertu (K) Iin Chayanti Djalali, NRP. 21140107500693 NRP. 311606992705', 1, 'Lembaga permasyarakatan militer IV Makassar', '2021-07-06 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044570, NULL),
(170, 'B/125/VI/2021', '2021-06-28', '0000-00-00', 'Laporan penerimaan Napimil a.n Pratu Isak Bach NRP. 31160699270594', 1, 'Lembaga permasyarakatan militer IV Makassar', '2021-07-06 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044571, NULL),
(171, 'B/129/VI/2021', '2021-06-28', '0000-00-00', 'Laporan kemajuan pelaksanaan program kerja Lemasmil IV Makassar Bulan Juni TA 2021', 1, 'Lembaga permasyarakatan militer IV Makassar', '2021-07-06 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044572, NULL),
(172, 'B/122/VI/2021', '2021-06-28', '0000-00-00', 'Laporan penerimaan Napimil a.n Sertu La Mujiono NRP. 31980662050179', 1, 'Lembaga permasyarakatan militer IV Makassar', '2021-07-06 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044573, NULL),
(173, 'Sprin/124/VI/2021', '2021-06-30', '0000-00-00', 'Sprin. tugas dan tanggung jawab dalam jabatan sehari-hari agar bertindak sebagai Penasehat Hukum a.n', 1, 'Kumdam XVI/Pattimura', '2021-07-07 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044574, NULL),
(174, 'B/508/VII/2021', '2021-07-07', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer (II) a.n terdakwa Kopda Pardi Ladjaenu Nrp. 31002', 1, 'Otmil IV-19 Ambon', '2021-07-07 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044575, NULL),
(175, 'B/726/VII/2021', '2021-07-02', '0000-00-00', 'Data pelanggaran anggota Rindam XVI/Pattimura yang belum tuntas proses hukumya sampai dengan bulan j', 1, 'Komandan Rindam XVI/pattimura', '2021-07-07 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044576, NULL);
INSERT INTO `surat_keluar1` (`id_surat_keluar`, `no_surat`, `tgl_surat`, `tgl_kirim`, `perihal`, `id_jenis_surat`, `kepada`, `kode_klasifikasi`, `deskripsi`, `id_petugas`, `nilai_guna`, `media`, `kondisi`, `satuan_lampiran`, `dibuat_pada`, `berkas_surat`) VALUES
(176, 'B/506/VII/2021', '2021-07-07', '0000-00-00', 'Penyetoran uang hasil pelaksanaan putusan Pengadilan Militer III-18 AmbonTW. II TA 2021', 1, 'Otmil IV-19 Ambon', '2021-07-08 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044577, NULL),
(177, 'B/502/VII/2021', '2021-07-08', '0000-00-00', 'Panggilan menjalani pidana dan usul PDTH a.n terpidana Pratu Bambang Bahar, NRP. 31140397991094', 1, 'Otmil IV-19 Ambon', '2021-07-08 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044578, NULL),
(178, 'B/509/VII/2021', '2021-07-08', '0000-00-00', 'Panggilan menjalani pidana dan usul PDTH a.n terpidana Kopda Ali Makatita, NRP. 31050962040285', 1, 'Otmil IV-19 Ambon', '2021-07-08 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044579, NULL),
(179, 'B/510/VII/2021', '2021-07-08', '0000-00-00', 'Panggilan menjalani pidana dan usul PDTH a.n terpidana Praka La Ode Lukman, NRP. 3108023551288.', 1, 'Otmil IV-19 Ambon', '2021-07-08 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044580, NULL),
(180, 'B/511/VII/2021', '2021-07-08', '0000-00-00', 'Panggilan menjalani pidana dan usul PDTH a.n terpidana Serka Frans Palinusa, NRP. 21100193670889', 1, 'Otmil IV-19 Ambon', '2021-07-08 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044581, NULL),
(181, 'B/512/VII/2021', '2021-07-08', '0000-00-00', 'Panggilan menjalani pidana dan usul PDTH a.n terpidana Praka Rajiman Achmad, NRP. 31100253960289', 1, 'Otmil IV-19 Ambon', '2021-07-08 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044582, NULL),
(182, 'B/514/VII/2021', '2021-07-08', '0000-00-00', 'Panggilan menjalani pidana dan usul PDTH a.n terpidana Pratu Aprianus Jamlay, NRP. 31120277700490', 1, 'Otmil IV-19 Ambon', '2021-07-08 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044583, NULL),
(183, 'B/515/VII/2021', '2021-07-08', '0000-00-00', 'Panggilan menjalani pidana dan usul PDTH a.n terpidana Koptu Berty Tuatfaru, NRP. 31000332690473', 1, 'Otmil IV-19 Ambon', '2021-07-08 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044584, NULL),
(184, '299/Pan.7/Srt.Pet/94K/Mil/2021', '2021-06-22', '0000-00-00', 'Petikan putusan kasasi a.n terdakwa Prada Eko Irianto, NRP. 311808814904799', 1, 'Mahkamah Agung RI', '2021-07-12 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044585, NULL),
(185, 'B/520/VII/2021', '2021-07-13', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n terdakwa Kopda Pieter Alfons, NRP. 3102078734', 1, 'Otmil IV-19 Ambon', '2021-07-19 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044586, NULL),
(186, 'B/519/VII/2021', '2021-07-13', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer sebagai saksi a.n terdakwa Praka Milton Sialeky, ', 1, 'Otmil IV-19 Ambon', '2021-07-19 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044587, NULL),
(187, 'B/150/VII/2021', '2021-07-12', '0000-00-00', 'Permohonan persetujuan Remisi Umum HUT Kemerdekaan RI ke-76 tahun 2021', 1, 'Lembaga permasyarakatan militer IV Makassar', '2021-07-19 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044588, NULL),
(188, 'B/146/VII/2021', '2021-07-09', '0000-00-00', 'Laporan penerimaan Napimil a.n terpidana Pratu Dani Dimas Yuda, NRP. 31140187771293', 1, 'Lembaga permasyarakatan militer IV Makassar', '2021-07-19 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044589, NULL),
(189, 'B/99/Bebas/VII/2021', '2021-07-04', '0000-00-00', 'Pembebasan Narapidana Militer a.n Praka Idris Tehuayo, NRP. 31110240181288', 1, 'Lembaga permasyarakatan militer IV Makassar', '2021-07-19 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044590, NULL),
(190, 'R/III/VII/2021', '2021-07-10', '0000-00-00', 'Usul pemberhentian dengan tidak hormat (PDTH) a.n Kopda Nikson Natraka, NRP 31010359860580 Ta Kodim ', 1, 'KODIM 1503/TUAL', '2021-07-19 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044591, NULL),
(191, '330/Pan.7/VII/2021/95/Pen/Tah/Mil/S/2021', '2021-07-21', '0000-00-00', 'Salinan penetapan perpanjangan penahanan Ketua Mahkama Agung RI a.n Pratu Muhammad Tatang Iskandar, ', 1, 'Mahkamah Agung RI', '2021-07-21 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044592, NULL),
(192, 'R/652/VII/2021', '2021-07-19', '0000-00-00', 'Udk dan catat dalam buku regiter induk, selanjutnya himpun dalam berkas Ybs', 1, 'Kodam XVI/Pattimura', '2021-07-23 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044593, NULL),
(193, 'B/528/VII/2021', '2021-07-16', '0000-00-00', 'Pengawasan pidana percobaan a.n terpidana Serka Muhammad Kasim Nukuhehe, NRP. 3900322581168', 1, 'Odmil IV-19 Ambon', '2021-07-23 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044594, NULL),
(194, 'B/530/VII/2021', '2021-07-16', '0000-00-00', 'Pengawasan pidana percobaan a.n para terpidana Praka Iradat Muin, NRP. 31100533640789 dan 1 orang', 1, 'Odmil IV-19 Ambon', '2021-07-23 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044595, NULL),
(195, 'B/553/VII/2021', '2021-07-26', '0000-00-00', 'Pemberitahuan penyelesaian perkara pelanggaran lalu lintas a.n terdakwa Pelda Ambo Dale Nuhu, NRP 39', 1, 'Otmil IV-19 Ambon', '2021-07-27 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044596, NULL),
(196, 'B/554/VII/2021', '2021-07-27', '0000-00-00', 'Pemberitahuan penyelesaian perkara pelanggaran lalu lintas a.n. terdakwa Praka Andre Putra Utama, NR', 1, 'Otmil IV-19 Ambon', '2021-07-27 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044597, NULL),
(197, '316/Pan.7/VII/2021/84/Pen/Tah/Mil/S/2021', '2021-07-12', '0000-00-00', 'Surat pengantar salinan penetapan penahanan ketua muda urusan lingkungan peradilan militer a.n Terda', 1, 'Mahkamah Agung RI', '2021-07-27 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044598, NULL),
(198, 'B/408/VII/2021', '2021-07-26', '0000-00-00', 'Permohonan surat keterangan tidak pernah dipidana personel Kumdam XVI/Pattimura', 1, 'Kumdam XVI/Pattimura', '2021-07-27 00:00:00', 'Diarsipkan.', 1, NULL, NULL, NULL, NULL, 1633044599, NULL),
(199, 'R/201/VII/2021', '2021-07-15', '0000-00-00', 'Pengiriman berkas perkara Asusila dan Penganiayaan Tersangka a.n. Serma Hendrik D.Y. Lumatenine, NRP', 1, 'Polisi Militer Daerah Militer XVI/Pattimura Detase', '2021-07-29 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044600, NULL),
(200, '335/Pan.7/Srt.Pet/118K/Mil/202', '2021-07-29', '0000-00-00', 'Petikan putusan kasasi a.n terdakwa Muhammad Tatang Iskandar, Pratu NRP. 31140307310894', 1, 'Mahkamah Agung RI', '2021-07-29 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044601, NULL),
(201, 'R/260/VII/2021', '2021-07-27', '0000-00-00', 'Permohonan pemberhentian dengan tidak hormat (PDTH) dari dinas militer TNI-AD Yonif 731/Kabaresi', 1, 'Yonif 731/Kabaresi', '2021-08-02 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044602, NULL),
(202, 'R/166/VI/2021', '2021-06-30', '0000-00-00', 'Penyerahan berkas perkara a.n Serma Andi Victor Harianto, NRP. 21010154081181', 1, 'Kodam XVI/Pattimura', '2021-08-02 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044603, NULL),
(203, 'R/203/VII/2021', '2021-07-23', '0000-00-00', 'Pengiriman berkas perkara penjualan senjata api rakitan jenis pistol tersangka a.n Serka Yosepus Saa', 1, 'Denpom XVI/2', '2021-08-02 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044604, NULL),
(204, 'Kep/323/VII/2021', '2021-07-26', '0000-00-00', 'Penyerahan perkara tersangka a.n Praka Ismail Sosal, NRP. 31100263371289', 1, 'Brigif 27/Nusa Ina', '2021-08-02 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044605, NULL),
(205, 'B/358/VII/2021', '2021-07-21', '0000-00-00', 'Pemberitahuan tidak dapat menjalani pidana a.n Praka La Ode Lukma, NRP. 31080235511288', 1, 'Kodim 1507/Saumlaki', '2021-08-02 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044606, NULL),
(206, 'R/239/VII/2021', '2021-07-16', '0000-00-00', 'Laporan selesai menjalani pidana a.n Praka Idris Tehuayo, NRP. 31110240181288', 1, 'Brigif 27/Nusa Ina', '2021-08-03 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044607, NULL),
(207, 'B/576/VIII/2021', '2021-08-04', '0000-00-00', 'Panggilan menghadap persidangan Pengadilan Militer a.n terdakwa Serka Dimas Ari Setiawan, NRP. 21100', 1, 'Otmil IV-19 Ambon', '2021-08-04 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044608, NULL),
(208, 'B/575/VIII/2021', '2021-08-04', '0000-00-00', 'Panggilan menghadap persidangan Pengadilan Militer a.n terdakwa Serda Ardi Haris, NRP. 2119021398049', 1, 'Otmil IV-19 Ambon', '2021-08-04 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044609, NULL),
(209, 'B/573/VIII/2021', '2021-08-04', '0000-00-00', 'Panggilan menghadap persidangan Pengadilan Militer a.n terdakwa Serda Safuan, NRP. 31040261940982', 1, 'Otmil IV-19 Ambon', '2021-08-04 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044610, NULL),
(210, 'B/577/VIII/2021', '2021-08-04', '0000-00-00', 'Panggilan menghadap persidangan Pengadilan Militer a.n terdakwa Pratu Enjel Romero Sianturi, NRP. 31', 1, 'Otmil IV-19 Ambon', '2021-08-04 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044611, NULL),
(211, 'B/578/VIII/2021', '2021-08-04', '0000-00-00', 'Panggilan menghadap persidangan Pengadilan Militer (panggilan II) a.n terdakwa Kopda Pieter Alfons, ', 1, 'Otmil IV-19 Ambon', '2021-08-04 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044612, NULL),
(212, 'B/579/VIII/2021', '2021-08-04', '0000-00-00', 'Panggilan menghadap persidangan Pengadilan Militer (Panggilan II) a.n terdakwa Sertu La Arman, NRP. ', 1, 'Otmil IV-19 Ambon', '2021-08-04 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044613, NULL),
(213, 'B/556/VIII/2021', '2021-08-04', '0000-00-00', 'Panggilan menghadap persidangan Pengadilan Militer a.n terdakwa Sertu La Arman, NRP. 31980326030776', 1, 'Otmil IV-19 Ambon', '2021-08-04 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044614, NULL),
(214, 'B/562/VIII/2021', '2021-08-04', '0000-00-00', 'Pembebasan dari tahanan a.n terdakwa Pratu Muhammad Tatang Iskandar, NRP. 31140307310894', 1, 'Otmil IV-19 Ambon', '2021-08-04 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044615, NULL),
(215, 'B/569/VIII/2021', '2021-08-04', '0000-00-00', 'Pelaksanaan pidana penjara a.n terpidana Serda Wibowo Mukti, NRP. 21160081580796', 1, 'Otmil IV-19 Ambon', '2021-08-04 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044616, NULL),
(216, 'W.3 MIL/102/HK.01/VII/2021', '2021-07-14', '0000-00-00', 'Penetapan perpanjangan penahanan Kepala Pengadilan Militer Tinggi III Surabaya Nomor TAP/31-K/PMT.II', 1, 'PENGADILAN MILITER TINGGI III SURABAYA', '2021-08-04 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044617, NULL),
(217, '1007/Djmt/B/8/2021', '2021-08-04', '0000-00-00', 'Permintaan data sarana dan prasarana dalam rangka mendukung terlaksananya administrasi peradilan sec', 1, 'Mahkamah Agung RI Dirjen Badilmil dan Peradilan Ta', '2021-08-06 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044618, NULL),
(218, 'Sprin/312/VIII/2021', '2021-07-31', '0000-00-00', 'Sprin. segera merencanakan, menyiapkan,melaksanakan penyelidikan dan penyidikan tindak pidana kekera', 1, 'KODAM XVI/PATTIMURA RESIMEN INDUK', '2021-08-09 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044619, NULL),
(219, 'B/574/VIII/2021', '2021-08-04', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n terdakwa Serda Safuan, NRP. 31040261940982', 1, 'Otmil IV-19 Ambon', '2021-08-09 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044620, NULL),
(220, '347/Pan.7/Srt.Pet/117K/Mil/202', '2021-08-03', '0000-00-00', 'Petikan Putusan Kasasi a.n terdakwa Serka Panzer C Gaspersz, NRP. 21080797040788', 1, 'Mahkamah Agung RI', '2021-08-09 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044621, NULL),
(221, 'B/855/VIII/2021', '2021-08-03', '0000-00-00', 'Data pelanggaran anggota Rindam XVI/Pattimura yang belum tuntas proses hukumnya sampai dengan bulan ', 1, 'Kodam XVI/Pattimura', '2021-08-09 00:00:00', 'Diarsipkan.', 1, NULL, NULL, NULL, NULL, 1633044622, NULL),
(222, 'R/679/VIII/2021', '2021-08-02', '0000-00-00', 'Permohonan skep pemberhentian tidak hormat (PDTH) dari Dinas Militer TNI AD a.n Pratu Aprianus Jamla', 1, 'Kodam XVI/Pattimura', '2021-08-09 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044623, NULL),
(223, 'B/719/VII/2021', '2021-07-16', '0000-00-00', 'Permohonan rekomendasi keringanan hukuman untuk tidak dipecat terdakwa a.n Prada Hengki Tornado', 1, 'Kodam XVI/Pattimura', '2021-08-09 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044624, NULL),
(224, 'R/198/VII/2021', '2021-07-12', '0000-00-00', 'Pengiriman berkas Perkara Desersi Tersangka a.n. Kopda Husni Mulyadi NRP 31071463610187', 1, 'Polisi Militer Daerah Militer XVI/Pattimura Detase', '2021-08-10 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044625, NULL),
(225, 'B/161/VII/2021', '2021-07-31', '0000-00-00', 'Laporan kemajuan pelaksanaan Program Kerja Lemasmil IV Makassar bulan Juli TA 2021', 1, 'Lembaga permasyarakatan militer IV Makassar', '2021-08-10 00:00:00', 'Diarsipkan.', 1, NULL, NULL, NULL, NULL, 1633044626, NULL),
(226, '335/Pan.7/Srt.Pet/118K/Mil/2021', '2021-07-29', '0000-00-00', 'Petikan putusan kasasi a.n. terdakwa Muhammad Tatang Iskandar, Pratu NRP 31140307310894', 1, 'Mahkamah Agung RI', '2021-08-10 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044627, NULL),
(227, 'W3.Mil/31/HK.04/VII/2021', '2021-07-30', '0000-00-00', 'Salinan putusan pengadilan militer tinggi III Surabaya a.n. terdakwa Hengki Tornado, Prada NRP 31130', 1, 'PENGADILAN MILITER TINGGI III SURABAYA', '2021-08-10 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044628, NULL),
(228, 'W3.Mil/120/HK.01/VII/2021', '2021-07-30', '0000-00-00', 'Salinan putusan pengadilan militer tinggi III Surabaya a.n. terdakwa Hengki Tornado, Prada NRP 31130', 1, 'PENGADILAN MILITER TINGGI III SURABAYA', '2021-08-10 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044629, NULL),
(229, '347/Pan.7/Srt.Pet/117K/Mil/2021', '2021-08-03', '0000-00-00', 'Petikan Putusan Kasasi a.n. terdakwa Panzer C. Gaspersz, Serka NRP 21080797040788', 1, 'Mahkamah Agung RI', '2021-08-10 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044630, NULL),
(230, '305/Pan.7/SRT/117K/Mil/2021', '2021-07-06', '0000-00-00', 'Penerimaan berkas perkara kasasi pidana militer a.n. terdakwa Panser C. Gaspersz, Serka NRP 21080797', 1, 'Mahkamah Agung RI', '2021-08-10 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044631, NULL),
(231, '306/Pan.7/SRT/118K/Mil/2021', '2021-07-06', '0000-00-00', 'Penerimaan berkas perkara kasasi pidana militer a.n. terdakwa Muhammad Tatang Iskandar Pratu NRP 311', 1, 'Mahkamah Agung RI', '2021-08-10 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044632, NULL),
(232, 'B/590/VIII/2021', '2021-08-10', '0000-00-00', 'Panggilan menghadap persidangan Pengadilan Militer a.n terdakwa Sertu La Sam Wabula, NRP. 3104038199', 1, 'Otmil IV-19 Ambon', '2021-08-12 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044633, NULL),
(233, 'B/591/VIII/2021', '2021-08-10', '0000-00-00', 'Panggilan menghadap persidangan Pengadilan Militer a.n terdakwa Sertu Efendi Wael, NRP. 319707013302', 1, 'Otmil IV-19 Ambon', '2021-08-12 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044634, NULL),
(234, 'B/592/VIII/2021', '2021-08-10', '0000-00-00', 'Panggilan menghadap persidangan Pengadilan Militer a.n terdakwa Prada Jeferson Refutu, NRP. 31160667', 1, 'Otmil IV-19 Ambon', '2021-08-12 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044635, NULL),
(235, 'B/965/VIII/2021', '2021-08-09', '0000-00-00', 'Jawaban panggilan menghadap persidangan Pengadilan Militer a.n terdakwa Pratu Enjel Romero Sianturi,', 1, 'Kodam XVI/Pattimura', '2021-08-16 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044636, NULL),
(236, 'B/454/VII/2021', '2021-07-08', '0000-00-00', 'Jawaban panggilan menghadap persidangan Dilmil III-18 Ambon a.n terdakwa Kopda Pardi Ladjaenu, NRP. ', 1, 'Korem 151/Binaiya', '2021-08-16 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044637, NULL),
(237, 'B/413/VI/2021', '2021-06-28', '0000-00-00', 'Jawaban panggilan menghadap persidangan Dilmil III-18 Ambon a.n terdakwa Kopda Pardi Ladjaenu, NRP. ', 1, 'Korem 151/Binaiya', '2021-08-16 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044638, NULL),
(238, '1055/Djmt/B/8/2021', '2021-08-12', '0000-00-00', 'Pendamping untuk pemantapan pembangunan ZI menuju WBK/WBBM di lingkungan Peradilan Militer dan Perad', 1, 'Mahkamah Agung RI Dirjen Badilmil dan Peradilan Ta', '2021-08-16 00:00:00', 'Diarsipkan.', 1, NULL, NULL, NULL, NULL, 1633044639, NULL),
(239, 'R/293/VIII/2021', '2021-08-17', '0000-00-00', 'Jawaban Surat panggilan anggota Yonif 731/Kabresi a.n Kapten Inf Isaach Pasireron, NRP. 391034352117', 1, 'Brigif 27/Nusa Ina', '2021-08-19 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044640, NULL),
(240, 'Sprin/400/VIII/2021', '2021-08-17', '0000-00-00', 'Sprin. agar menghadap di persidangan Pengadilan Militer III-18 Ambon guna didengar keterangannya seb', 1, 'Brigif 27/Nusa Ina', '2021-08-19 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044641, NULL),
(241, 'B/599/VIII/2021', '2021-08-12', '0000-00-00', 'Panggilan menghadap persidangan Pengadilan Militer a.n terdakwa Sertu Brusly Edgar Rumodar, NRP. 319', 1, 'Otmil IV-19 Ambon', '2021-08-19 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044642, NULL),
(242, 'B/600/VIII/2021', '2021-08-13', '0000-00-00', 'Panggilan menghadap persidangan Pengadilan Militer a.n terdakwa Sertu Brusly Edgar Rumodar, NRP. 319', 1, 'Otmil IV-19 Ambon', '2021-08-19 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044643, NULL),
(243, 'B/595/VIII/2021', '2021-08-13', '0000-00-00', 'Panggilan menghadap persidangan Pengadilan Militer a.n terdakwa Prada Yohanes Andreas Saimima, NRP. ', 1, 'Otmil IV-19 Ambon', '2021-08-19 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044644, NULL),
(244, 'B/597/VIII/2021', '2021-08-13', '0000-00-00', 'Panggilan menghadap persidangan Pengadilan Militer a.n terdakwa Sertu Brusly Edgar Rumodar, NRP. 319', 1, 'Otmil IV-19 Ambon', '2021-08-19 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044645, NULL),
(245, 'W.3 MIL/34/HK.04/VIII/2021', '2021-08-10', '0000-00-00', 'Penetapan Penahanan Hakim Ketua Pengadilan Militer Tinggi Surabaya a.n terdakwa Pratu Randi Palio, N', 1, 'PENGADILAN MILITER TINGGI III SURABAYA', '2021-08-19 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044646, NULL),
(246, 'W.3 MIL/43/HK.07/VIII/2021', '2021-08-16', '0000-00-00', 'Penetapan Penahanan Hakim Ketua Pengadilan Militer Tinggi Surabaya a.n terdakwa Praka Milton Sialeky', 1, 'PENGADILAN MILITER TINGGI III SURABAYA', '2021-08-19 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044647, NULL),
(247, 'W.3 MIL/133/HK.01/VIII/2021', '2021-08-10', '0000-00-00', 'Penetapan Penahanan Hakim Ketua Pengadilan Militer Tinggi Surabaya a.n terdakwa Pratu Arifin Rumaf, ', 1, 'PENGADILAN MILITER TINGGI III SURABAYA', '2021-08-19 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044648, NULL),
(248, 'R/202/VII/2021', '2021-07-12', '0000-00-00', 'Pengiriman berkas perkara penganiayaan tersangka a.n. Praka Laban Gou NRP 31110274250389', 1, 'Polisi Militer Daerah Militer XVI/Pattimura Detase', '2021-08-19 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044649, NULL),
(249, 'Miltama/und/36/VIII/2021', '2021-08-18', '0000-00-00', 'Undangan pembukaan Bimtek Kepaniteraan Dilmiltama TA 2021 Secara Virtual', 1, 'Pengadilan militer utama', '2021-08-20 00:00:00', 'Diarsipkan.', 1, NULL, NULL, NULL, NULL, 1633044650, NULL),
(250, 'B/607/VIII/2021', '2021-08-18', '0000-00-00', 'Panggilan menghadap persidangan Pengadilan Militer a.n terdakwa Koptu Asperos Tomatalla, NRP. 310107', 1, 'Otmil IV-19 Ambon', '2021-08-20 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044651, NULL),
(251, 'B/608/VIII/2021', '2021-08-18', '0000-00-00', 'Panggilan menghadap persidangan Pengadilan Militer a.n terdakwa Praka Ismail Sosal, NRP. 31100263371', 1, 'Otmil IV-19 Ambon', '2021-08-20 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044652, NULL),
(252, 'B/605/VIII/2021', '2021-08-18', '0000-00-00', 'Panggilan menghadap persidangan Pengadilan Militer a.n terdakwa Serda Eric Setiawan, NRP. 2117012480', 1, 'Otmil IV-19 Ambon', '2021-08-20 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044653, NULL),
(253, 'B/610/VIII/2021', '2021-08-18', '0000-00-00', 'Panggilan menghadap persidangan Pengadilan Militer (Panggilan III) a.n terdakwa Kopda Pardi Ladjaenu', 1, 'Otmil IV-19 Ambon', '2021-08-20 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044654, NULL),
(254, 'B/612/VIII/2021', '2021-08-18', '0000-00-00', 'Panggilan menghadap persidangan Pengadilan Militer a.n terdakwa Prada M.Ardian Aminullah, NRP. 31180', 1, 'Otmil IV-19 Ambon', '2021-08-20 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044655, NULL),
(255, 'B/613/VIII/2021', '2021-08-18', '0000-00-00', 'Panggilan menghadap persidangan Pengadilan Militer a.n terdakwa Rijkan Kasiransyah, NRP. 31190948150', 1, 'Otmil IV-19 Ambon', '2021-08-20 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044656, NULL),
(256, 'B/615/VIII/2021', '2021-08-18', '0000-00-00', 'Panggilan menghadap persidangan Pengadilan Militer a.n terdakwa Serda Ardi Haris, NRP. 2119021398049', 1, 'Otmil IV-19 Ambon', '2021-08-20 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044657, NULL),
(257, 'R/503/VIII/2021', '2021-08-18', '0000-00-00', 'Laporan telah menjalani masa percobaan a.n terdakwa Serka Rahim Hamzah, NRP. 21060244620784', 1, 'Kodam XVI/Pattimura', '2021-08-23 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044658, NULL),
(258, 'R/118/VIII/2021', '2021-08-16', '0000-00-00', 'Permohonan penerbitan skep PDTH a.n terpidana Pratu Muhammad Tatang Iskandar, NRP. 31140307310894', 1, 'Kodam XVI/Pattimura', '2021-08-24 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044659, NULL),
(259, 'W27-U2/551/KS.00/8/2021', '2021-08-19', '0000-00-00', 'Penyampaian persetujuan penggunaan pinjam pakai ruang sidang PN. Masohi', 1, 'PENGADILAN NEGERI MASOHI', '2021-08-24 00:00:00', 'Diarsipkan.', 1, NULL, NULL, NULL, NULL, 1633044660, NULL),
(260, '368/Pan.7/VIII/2021/102/Pen/Ta', '2021-08-20', '0000-00-00', 'Salinan Penetapan Penahanan a.n Terdakwa Sakna Tambunan Pratu, NRP 31160006580295', 1, 'Mahkamah Agung RI', '2021-08-24 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044661, NULL),
(261, 'W.3 MIL/40/HK.04/VIII/2021', '2021-08-25', '0000-00-00', 'Penetapan perpanjangan penahanan kepala Pengadilan Militer Tinggi III Surabaya a.n terdakwa Pratu Ra', 1, 'PENGADILAN MILITER TINGGI III SURABAYA', '2021-08-24 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044662, NULL),
(262, 'W.3 MIL/143/HK.01/VIII/2021', '2021-08-25', '0000-00-00', 'Penetapan perpanjangan penahanan kepala Pengadilan Militer Tinggi III Surabaya a.n terdakwa Pratu Ar', 1, 'PENGADILAN MILITER TINGGI III SURABAYA', '2021-08-24 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044663, NULL),
(263, 'Miltama/Sprin/421/VIII/2021', '2021-08-19', '0000-00-00', 'Sprin penunjukkan sbg peserta bimbingan teknis kepaniteraan Dilmiltama TA 2021 pada hari Senin s.d R', 1, 'Pengadilan militer utama', '2021-08-24 00:00:00', 'Diarsipkan.', 1, NULL, NULL, NULL, NULL, 1633044664, NULL),
(264, 'Sprin/164/VIII/2021', '2021-08-16', '0000-00-00', 'Sprin. tugas dan tanggung jawab dalam jabatan sehari-hari agar bertindak sebagai penasehat hukum a.n', 1, 'Kodam XVI/Pattimura', '2021-08-24 00:00:00', 'Diarsipkan.', 1, NULL, NULL, NULL, NULL, 1633044665, NULL),
(265, 'Kep/1/I/2021', '2021-01-24', '0000-00-00', 'Sanksi Administratif a.n terdakwa Praka Idris Tehuayo, NRP. 31110240181288', 1, 'Brigif 27/Nusa Ina', '2021-08-24 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044666, NULL),
(266, 'Kep/3/I/2021', '2021-01-28', '0000-00-00', 'Sanksi Administratif a.n terdakwa Pratu Yesen Madamar, NRP. 31120308570190', 1, 'Brigif 27/Nusa Ina', '2021-08-24 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044667, NULL),
(267, 'B/730/VIII/2021', '2021-08-02', '0000-00-00', 'Pengiriman BP tersangka a.n Prada Marsal Bidji, NRP. 31200548080299,Jabatan Ta Denkav, Kesatuan Denk', 1, 'Kodam XVI/Pattimura', '2021-08-24 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044668, NULL),
(268, 'B/533/VIII/2021', '2021-08-23', '0000-00-00', 'Jawaban panggilan menghadap persidangan Dilmil III-18 Ambon a.n Sertu La Sam Wabula, NRP. 3104038199', 1, 'Korem 151/Binaiya', '2021-08-25 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044669, NULL),
(269, 'B/534/VIII/2021', '2021-08-23', '0000-00-00', 'Permohonan nasehat dan bantuan hukum a.n terdakwa Sertu Brusly Romodar, NRP. 3199028971079', 1, 'Pengadilan militer utama', '2021-08-25 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044670, NULL),
(270, 'R/95/VIII/2021', '2021-08-24', '0000-00-00', 'Permohonan Bantuan Hukum', 1, 'Kodam XVI/Pattimura', '2021-08-26 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044671, NULL),
(271, 'Sprin/406/VIII/2021', '2021-08-20', '0000-00-00', 'Sprin. menghadap di persidangan pengadilan militer III-18 Ambon a,n terdakwa Praka Ismail Sosal, NRP', 1, 'Brigif 27/Nusa Ina', '2021-08-26 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044672, NULL),
(272, 'B/923/VIII/2021', '2021-08-14', '0000-00-00', 'Jawaban panggilan menghadap persidangan pengadilan militer III-18 Ambon (Panggilan I)', 1, 'Brigif 27/Nusa Ina', '2021-08-26 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044673, NULL),
(273, 'B/629/VIII/2021', '2021-08-24', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer (Panggilan II) a.n terdakwa Prada Jeferson Refutu', 1, 'Otmil IV-19 Ambon', '2021-08-26 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044674, NULL),
(274, 'B/631/VIII/2021', '2021-08-25', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer (Panggilan II) a.n terdakwa Pratu Enjel Romero Si', 1, 'Otmil IV-19 Ambon', '2021-08-26 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044675, NULL),
(275, 'B/632/VIII/2021', '2021-08-25', '0000-00-00', 'Panggilan menghadap persidangan pengadilan miliet (Panggilan I) a.n terdakwa Sertu La Sam Wabula, NR', 1, 'Otmil IV-19 Ambon', '2021-08-26 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044676, NULL),
(276, 'B.201/BUD/08/2021', '2021-08-26', '0000-00-00', 'Permohonan salinan putusan perkara a.n terdakwa Wibowo Mukti', 1, 'Bank Rakyat Indonesia (BRI) Cabang Ammbon Unit Amb', '2021-08-29 00:00:00', 'Diarsipkan.', 1, NULL, NULL, NULL, NULL, 1633044677, NULL),
(277, 'B/543/VIII/2021', '2021-08-24', '0000-00-00', 'Jawaban ke III Panggilan menghadap persidangan Dilmil III-18 Ambon a.n terdakwa Kopda Pardi Ladjaenu', 1, 'Korem 151/Binaiya', '2021-08-31 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044678, NULL),
(278, 'Sprin/187/VIII/2021', '2021-08-30', '0000-00-00', 'Sprin. tugas dan tanggung jawab dalam jabatannya sehari-hari agar bertindak sebagai penasehat hukum ', 1, 'Kodam XVI/Pattimura', '2021-09-05 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044679, NULL),
(279, 'Sprin/188/VIII/2021', '2021-08-30', '0000-00-00', 'Sprin. tugas dan tanggung jawabnya sehari-hari agar bertindak sebagai penasehat hukum a.n Kapten Ckm', 1, 'Kodam XVI/Pattimura', '2021-09-05 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044680, NULL),
(280, 'Sprin/182/VIII/2021', '2021-08-27', '0000-00-00', 'Sprin. tugas dan tanggung jawab dalam jabatannya sehari-hari agar bertindak sebagai penasehat hukum ', 1, 'Kodam XVI/Pattimura', '2021-09-05 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044681, NULL),
(281, 'Sprin/181/VIII/2021', '2021-08-27', '0000-00-00', 'Sprin. tugas dan tanggung jawab dalam jabatannya sehari-hari agar bertindak sebagai penasehat hukum ', 1, 'Kodam XVI/Pattimura', '2021-09-05 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044682, NULL),
(282, 'B/604/VIII/2021', '2021-08-16', '0000-00-00', 'Penitapan tahanan a.n terdakwa Serda Ardi Haris, NRP. 21190213980499', 1, 'Otmil IV-19 Ambon', '2021-09-05 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044683, NULL),
(283, 'B/643/VIII/2021', '2021-08-30', '0000-00-00', 'Panggilan menghadap persidangan pengadilan Militer a.n terdakwa Serda Safuan, NRP. 31040261940982', 1, 'Otmil IV-19 Ambon', '2021-09-05 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044684, NULL),
(284, 'B/644/VIII/2021', '2021-08-30', '0000-00-00', 'Panggilan menghadap persidangan pengadilan Militer sebagai saksi a.n terdakwa Serda Safuan, NRP. 310', 1, 'Otmil IV-19 Ambon', '2021-09-05 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044685, NULL),
(285, 'B/648/IX/2021', '2021-09-01', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n terdakwa Kapten Isach Pasireron, NRP. 3910343', 1, 'Otmil IV-19 Ambon', '2021-09-05 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044686, NULL),
(286, 'B/639/VIII/2021', '2021-08-26', '0000-00-00', 'Pemberitahuan putusan dan usul PDTH a.n terdakwa Pratu Muhammad Tatang Iskandar , NRP. 3114030731089', 1, 'Otmil IV-19 Ambon', '2021-09-05 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044687, NULL),
(287, 'W.3 MIL/42/HK.07/VIII/2021', '2021-08-12', '0000-00-00', 'Penerimaan berkas perkara banding a.n. Terdakwa Randi Palio, Prada, NRP 31120303030293', 1, 'PENGADILAN MILITER TINGGI III SURABAYA', '2021-09-05 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044688, NULL),
(288, 'W.3 MIL/41/HK.07/VIII/2021', '2021-08-12', '0000-00-00', 'Penerimaan berkas perkara Banding a.n. Terdakwa Arifin Rumaf, Prada, NRP 31120611750392', 1, 'PENGADILAN MILITER TINGGI III SURABAYA', '2021-09-05 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044689, NULL),
(289, 'Sprin/445/IX/2021', '2021-09-03', '0000-00-00', 'Sprin. untuk menghadap persidangan pengadilan militer III-18 ambon sebagai saksi dalam perkara terda', 1, 'Brigif 27/Nusa Ina', '2021-09-06 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044690, NULL),
(290, 'B/658/IX/2021', '2021-09-06', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer (Panggilan III) a.n terdakwa Sertu La Arman, NRP.', 1, 'Otmil IV-19 Ambon', '2021-09-06 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044691, NULL),
(291, 'B/659/IX/2021', '2021-09-06', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n terdakwa Sertu Efendi Wael, NRP. 319707013302', 1, 'Otmil IV-19 Ambon', '2021-09-06 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044692, NULL),
(292, 'B/656/IX/2021', '2021-09-06', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n terdakwa Pratu Makruf, NRP. 31140378680492', 1, 'Otmil IV-19 Ambon', '2021-09-06 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044693, NULL),
(293, 'B/665/IX/2021', '2021-09-06', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n terdakwa Sertu Frengky Machartur Hendambo, NR', 1, 'Otmil IV-19 Ambon', '2021-09-06 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044694, NULL),
(294, 'B/167/VIII/2021', '2021-09-06', '0000-00-00', 'Laporan kemajuan pelaksanaan program kerja Lemasmil IV Makassar bulan agustus TA 2021', 1, 'Lembaga permasyarakatan militer IV Makassar', '2021-09-06 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044695, NULL),
(295, '364/Pan.7/SRT/129 K/MIL/2021', '2021-08-19', '0000-00-00', 'Penerimaan berkas perkara kasasi pidana militer a.n terdakwa Pratu Sakna Tambunan, NRP. 311600065802', 1, 'Mahkamah Agung RI', '2021-09-06 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044696, NULL),
(296, 'W.3 MIL/44/HK.07/VIII/2021', '2021-08-30', '0000-00-00', 'Penerimaan berkas perkara banding a.n terdakwa Praka Milton Sialeky, NRP. 31110568530992', 1, 'PENGADILAN MILITER TINGGI III SURABAYA', '2021-09-06 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044697, NULL),
(297, 'R/139/IX/2021', '2021-09-04', '0000-00-00', 'Permohonan bantuan pencarian dan penangkapan a.n Prada Lajanu Koipoy', 1, 'Kodam XVI/Pattimura', '2021-09-13 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044698, NULL),
(298, 'R/137/IX/2021', '2021-09-03', '0000-00-00', 'Laporan tindak pidana Desersi dimasa damai a.n Prada Lajanu Koipoy, NRP. 31190849800900', 1, 'Kodam XVI/Pattimura', '2021-09-13 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044699, NULL),
(299, 'Sprin/193/IX/2021', '2021-09-02', '0000-00-00', 'Sprin. tugas dan tanggung jawab sehari-hari agar bertindak sebagai penasehat hukum a.n Mayor Czi Eka', 1, 'Kodam XVI/Pattimura', '2021-09-13 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044700, NULL),
(300, 'Kep/499-18/VIII/2021', '2021-08-16', '0000-00-00', 'Pemberhentian denagn tindak hormat dari Dinas Keprajuritan TNI Angkatan Darat', 1, 'Kodam XVI/Pattimura', '2021-09-13 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044701, NULL),
(301, 'B/1011/IX/2021', '2021-09-06', '0000-00-00', 'Data Pelanggaran', 1, 'Otmil IV-19 Ambon', '2021-09-13 00:00:00', 'Diarsipkan.', 1, NULL, NULL, NULL, NULL, 1633044702, NULL),
(302, 'B/666/IX/2021', '2021-09-08', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer (Panggilan III) a.n terdakwa Prada Jeferson Refut', 1, 'Otmil IV-19 Ambon', '2021-09-13 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044703, NULL),
(303, 'B/667/IX/2021', '2021-09-08', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer (Panggilan III) a.n terdakwa Kopda Pieter Alfons,', 1, 'Otmil IV-19 Ambon', '2021-09-13 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044704, NULL),
(304, 'B/668/IX/2021', '2021-09-08', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer (Panggilan III) a.n terdakwa Pratu Enjel Romero S', 1, 'Otmil IV-19 Ambon', '2021-09-13 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044705, NULL),
(305, 'B/669/IX/2021', '2021-09-08', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer (Panggilan III) a.n terdakwa Sertu La Sam Wabula,', 1, 'Otmil IV-19 Ambon', '2021-09-13 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044706, NULL),
(306, 'B/670/IX/2021', '2021-09-08', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n terdakwa Pratu Marlon Benamen, NRP. 311603254', 1, 'Otmil IV-19 Ambon', '2021-09-13 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044707, NULL),
(307, 'B/671/IX/2021', '2021-09-08', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n terdakwa Serda Taufik Parlindah, NRP. 3101061', 1, 'Otmil IV-19 Ambon', '2021-09-13 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044708, NULL),
(308, 'B/672/IX/2021', '2021-09-08', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n terdakwa Kopda Husni Mulyadi, NRP. 3107146361', 1, 'Otmil IV-19 Ambon', '2021-09-13 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044709, NULL),
(309, 'B/673/IX/2021', '2021-09-08', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n terdakwa Praka Selwanus Jaflaun, NRP. 3109058', 1, 'Otmil IV-19 Ambon', '2021-09-13 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044710, NULL),
(310, 'W.3 MIL/46/HK.07/IX/2021', '2021-09-08', '0000-00-00', 'Penetapan penahanan Hakim Ketua Pengadilan Militer Tinggi III Surabaya a.n terdakwa Koptu Petrus Bat', 1, 'PENGADILAN MILITER TINGGI III SURABAYA', '2021-09-13 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044711, NULL),
(311, 'W.3 MIL/47/HK.07/IX/2021', '2021-09-10', '0000-00-00', 'Penetapan perpanjangan penahanan Hakim Ketua Pengadilan Militer Tinggi III Surabaya a.n terdakwa Pra', 1, 'PENGADILAN MILITER TINGGI III SURABAYA', '2021-09-13 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044712, NULL),
(312, '396/Pan.7/IX/2021/112/Pen/Tah/', '2021-09-13', '0000-00-00', 'Salinan penetapan penahanan ketua muda urusan lingkungan Peradilan Militer a.n terdakwa Prada Hengki', 1, 'Mahkamah Agung RI', '2021-09-14 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044713, NULL),
(313, '395/Pan.7/IX/2021/113/Pen/Tah/', '2021-09-13', '0000-00-00', 'Salinan penetapan penahanan ketua muda urusan lingkungan Peradilan Militer a.n terdakwa Prada Hengki', 1, 'Mahkamah Agung RI', '2021-09-14 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044714, NULL),
(314, 'B/547/VIII/2021', '2021-08-23', '0000-00-00', 'Jawaban ke II Panggilan menghadap persidangan Dilmil III-18 Ambon a.n terdakwa Sertu La Sam Wabula ,', 1, 'Korem 151/Binaiya', '2021-09-15 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044715, NULL),
(315, 'B/578/IX/2021', '2021-09-09', '0000-00-00', 'Jawaban ke III panggilan menghadap persidangan Dilmil III-18 Ambon a.n terdakwa Sertu La Sam Wabula,', 1, 'Korem 151/Binaiya', '2021-09-17 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044716, NULL),
(316, 'B/308/IX/2021', '2021-09-14', '0000-00-00', 'Permohonan bantuan hukum agar dapat mendampingi Tersangka a.n Serka Mustari Nunlehu, NRP. 640199', 1, 'Kodam XVI/Pattimura', '2021-09-17 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044717, NULL),
(317, 'R/248/IX/2021', '2021-09-03', '0000-00-00', 'Pengiriman berkas perkara kekerasan dalam rumah tangga a.n tersangka Praka Praka Lalu Rian Lesmana, ', 1, 'Polisi Militer Daerah Militer XVI/Pattimura', '2021-09-20 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044718, NULL),
(318, 'R/250/IX/2021', '2021-09-06', '0000-00-00', 'Pengiriman berkas perkara perzinahan a.n tersangka Praka Melky Berty Benhot Beay, NRP. 3107114542058', 1, 'Polisi Militer Daerah Militer XVI/Pattimura', '2021-09-20 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044719, NULL),
(319, 'R/145/IX/2021', '2021-09-13', '0000-00-00', 'Laporan kembali Desersi a.n Prada lajanu Koifuy, NRP, 31190849800900', 1, 'Kodam XVI/Pattimura', '2021-09-20 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044720, NULL),
(320, 'R/146/IX/2021', '2021-09-13', '0000-00-00', 'Pelimpahan perkara tindak pidana Desersi dimasa damai a.n Prada Lajanu Koifuy, NRP. 31190849800900', 1, 'Kodam XVI/Pattimura', '2021-09-20 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044721, NULL),
(321, 'Sprin/883/IX/2021', '2021-09-13', '0000-00-00', 'Sprin. agar menghadap di persidangan Pengadilan Militer III-18 Ambon', 1, 'Kodam XVI/Pattimura', '2021-09-20 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044722, NULL),
(322, 'Kep/33/ix/2021', '2021-09-13', '0000-00-00', 'Penahanan sementara komandan batalyon infanteri raider 733/masariku', 1, 'Kodam XVI/Pattimura', '2021-09-20 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044723, NULL),
(323, 'B/1150/IX/2021', '2021-09-13', '0000-00-00', 'Jawaban panggilan ke III (Tiga) menghadap persidangan pengadilan militer a.n terdakwa Pratu Enjel Ro', 1, 'Kodam XVI/Pattimura', '2021-09-20 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044724, NULL),
(324, 'B/071/VIII/2021', '2021-08-27', '0000-00-00', 'Jawaban panggilan ke II (Dua) menghadap persidangan pengadilan militer a.n terdakwa Pratu Enjel Rome', 1, 'Kodam XVI/Pattimura', '2021-09-20 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044725, NULL),
(325, 'B/1005/VIII/2021', '2021-08-28', '0000-00-00', 'Jawaban panggilan menghadap persidangan pengadilan milter III-18 Ambon (Panggilan II) a.n terdakwa P', 1, 'Brigif 27/Nusa Ina', '2021-09-20 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044726, NULL),
(326, 'B/691/IX/2021', '2021-09-16', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n terdakwa Serma Andi Victor Harianto, NRP. 210', 1, 'Otmil IV-19 Ambon', '2021-09-20 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044727, NULL),
(327, 'Spang/39/IX/2021', '2021-09-14', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n terdakwa Sertu Frengky Machartur Hendambo, NR', 1, 'Odmil IV-19 Ambon', '2021-09-20 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044728, NULL),
(328, 'Sprin/573/IX/2021', '2021-09-13', '0000-00-00', 'Sprin. pergi ke makassar dalam rangka menjalankan pidana penjara a.n terdakwa Praka Amiruddin Lessy,', 1, 'Lanud XVI/Ptm', '2021-09-20 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044729, NULL),
(329, 'sprin/888/IX/2021', '2021-09-09', '0000-00-00', 'Sprin. menghadap ke otmil IV-19 Ambon a.n terdakwa Serka Panzer C Gaspersz, NRP. 21080797040788', 1, 'Kodam XVI/Pattimura', '2021-09-20 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044730, NULL),
(330, 'Sprin/456/IX/2021', '2021-09-08', '0000-00-00', 'Sprin. untuk melaksanakan pengawalan terhadap terdakwa ke otmil IV-19 Ambon', 1, 'Brigif 27/Nusa Ina', '2021-09-20 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044731, NULL),
(331, 'Sprin/602/IX/2021', '2021-09-08', '0000-00-00', 'Sprin. untuk menghadap ke otmil IV-19 Ambon a.n terdakwa Serda Eric Setiawan, NRP. 21170124800597', 1, 'Kodam XVI/Pattimura', '2021-09-20 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044732, NULL),
(332, 'Sprin/603/IX/2021', '2021-09-08', '0000-00-00', 'Sprin. untuk Praka Dellon Dickinson , NRP. 31100248370888 agar mengawal terdakwa a.n Serda Eric Seti', 1, 'Kodam XVI/Pattimura', '2021-09-20 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044733, NULL),
(333, 'R/254/IX/2021', '2021-09-10', '0000-00-00', 'Pengiriman berkas perkara Desersi tersangka a.n Praka Firmansyah Sairon, NRP. 3110024360190', 1, 'Denpom XVI/Masohi', '2021-09-21 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044734, NULL),
(334, 'B/1080/IX/2021', '2021-09-13', '0000-00-00', 'Jawaban panggilan menghadap persidangan pengadilan militer III-18 ambon (panggilan III)', 1, 'Brigif 27/Nusa Ina', '2021-09-21 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044735, NULL),
(335, '1308/Djmt/B/9/2021', '2021-09-17', '0000-00-00', 'Penyampaian bahan rapat koordinasi pimpinan pengadilan', 1, 'Mahkamah Agung RI Dirjen Badilmil dan Peradilan Ta', '2021-09-21 00:00:00', 'Diarsipkan.', 1, NULL, NULL, NULL, NULL, 1633044736, NULL),
(336, 'B/696/IX/2021', '2021-09-17', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer (panggilan II) dalam perkara a.n Serda Taufik Par', 1, 'Odmil IV-19 Ambon', '2021-09-21 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044737, NULL),
(337, 'W.3 Mil/161/HK.01/IX/2021', '2021-09-20', '0000-00-00', 'Taphan atas nama terdakwa Serda Ardi Haris, NRP 21190213980499', 1, 'PENGADILAN MILITER TINGGI III SURABAYA', '2021-09-22 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044738, NULL),
(338, 'B/675/IX/2021', '2021-09-22', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n. Terdakwa Serda Nikson Elieser Manuhutu NRP. ', 1, 'Otmil IV-19 Ambon', '2021-09-23 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044739, NULL),
(339, 'B/676/IX/2021', '2021-09-22', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n. Terdakwa Kopda Bernadus Rumlus NRP. 31081861', 1, 'Otmil IV-19 Ambon', '2021-09-23 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044740, NULL),
(340, 'B/677/IX/2021', '2021-09-22', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n. Terdakwa Pratu Suarno Soamole NRP.3109050117', 1, 'Otmil IV-19 Ambon', '2021-09-23 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044741, NULL),
(341, 'B/678/IX/2021', '2021-09-22', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n. Terdakwa Sertu Almendo Haloham NRP. 21141100', 1, 'Otmil IV-19 Ambon', '2021-09-23 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044742, NULL),
(342, 'B/679/IX/2021', '2021-09-22', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n. Terdakwa Kopda Bernadus Rumlus NRP. 31081861', 1, 'Otmil IV-19 Ambon', '2021-09-23 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044743, NULL),
(343, 'B/697/IX/2021', '2021-09-22', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n. Terdakwa Pratu Marlon Benamen NRP. 311603254', 1, 'Otmil IV-19 Ambon', '2021-09-23 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044744, NULL),
(344, 'Kep/04/IX/2021', '2021-09-17', '0000-00-00', 'Sanksi Administratif a.n. Terdakwa Praka Ismail Sosal, NRP.31100263371289', 1, 'Yonif 731/Kabaresi', '2021-09-24 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044745, NULL),
(345, 'Sprin/203/IX/2021', '2021-09-17', '0000-00-00', 'Sprin agar bertindak sebagai penasehat hukum a.n. Serka Mustari Nunlehu, NRP.640199', 1, 'Kodam XVI/Pattimura', '2021-09-24 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044746, NULL),
(346, 'R/154/IX/2021', '2021-09-22', '0000-00-00', 'Pelimpahan Perkara Tindak Pidana Pelecehan Seksual atau Asusila a.n. Letda Inf Okki Abdurrazaaq.S.Tr', 1, 'Kodam XVI/Pattimura', '2021-09-24 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044747, NULL),
(347, 'Kep/34/IX/2021', '2021-09-22', '0000-00-00', 'Penahanan sementara a.n. terdakwa Letda Okki Abdurrazaaq.S.Tr. (Han)', 1, 'Yonif Raider 733/Masariku', '2021-09-24 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044748, NULL),
(348, 'B/109/Bebas/IX/2021', '2021-09-16', '0000-00-00', 'Pembebasan narapidana Militer a.n. Pratu Isak Bach NRP 311606992705', 1, 'Lembaga permasyarakatan militer IV Makassar', '2021-09-24 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044749, NULL),
(349, 'B/683/IX/2021', '2021-09-22', '0000-00-00', 'Penitipan tahanan a.n. terdakwa Pratu Makruf, NRP 31140378680492', 1, 'Otmil IV-19 Ambon', '2021-09-24 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044750, NULL);
INSERT INTO `surat_keluar1` (`id_surat_keluar`, `no_surat`, `tgl_surat`, `tgl_kirim`, `perihal`, `id_jenis_surat`, `kepada`, `kode_klasifikasi`, `deskripsi`, `id_petugas`, `nilai_guna`, `media`, `kondisi`, `satuan_lampiran`, `dibuat_pada`, `berkas_surat`) VALUES
(350, 'B/706/IX/2021', '2021-09-23', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n. terdakwa Sertu Syafrudin, NRP. 2118009857129', 1, 'Otmil IV-19 Ambon', '2021-09-24 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044751, NULL),
(351, 'B/707/IX/2021', '2021-09-23', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n. terdakwa Serka Dedi Handoko, NRP.21080726910', 1, 'Otmil IV-19 Ambon', '2021-09-24 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044752, NULL),
(352, 'B/708/IX/2021', '2021-09-23', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n. terdakwa Sertu Budi Wahyono, NRP.31000567240', 1, 'Otmil IV-19 Ambon', '2021-09-24 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044753, NULL),
(353, 'B/508/IX/2021', '2021-09-14', '0000-00-00', 'Usul pemberhentian dengan tidak hormat (PDTH) Praka La Ode Lukman, NRP.31080235511288', 1, 'Otmil IV-19 Ambon', '2021-09-24 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044754, NULL),
(354, 'B/1364/IX/2021', '2021-09-20', '0000-00-00', 'Permohonan keputusan pemberhentian dengan tidak hormat (PDTH) dari Dinas Militer TNI AD', 1, 'Korem 151/Binaiya', '2021-09-24 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044755, NULL),
(355, 'W.3 MIL/158/HK.01/IX/2021', '2021-09-17', '0000-00-00', 'Pengajuan Berkas perkara a.n. terdakwa Pratu Arifin Rumaf, NRP.31120611750392', 1, 'PENGADILAN MILITER TINGGI III SURABAYA', '2021-09-24 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044756, NULL),
(356, 'W.3 MIL/46/HK.04/IX/2021', '2021-09-17', '0000-00-00', 'Pengajuan berkas perkara a.n. terdakwa Pratu Randi Palio, NRP.31120303030293', 1, 'PENGADILAN MILITER TINGGI III SURABAYA', '2021-09-24 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044757, NULL),
(357, 'B/619/IX/2021', '2021-09-23', '0000-00-00', 'Permohonan keringanan Hukuman a.n terdakwa Serma Hendrik Dhunad Yokobus Lumatenina, NRP. 21040263110', 1, 'Komandan Deninteldam XVI/Pattimura', '2021-09-27 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044758, NULL),
(358, 'B/713/IX/2021', '2021-09-24', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n terdakwa Kopda Abdul Hair Lating, NRP. 310903', 1, 'Otmil IV-19 Ambon', '2021-09-27 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044759, NULL),
(359, 'B/714/IX/2021', '2021-09-24', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n terdakwa Prada Mizak Nouw, NRP.3119085680597', 1, 'Otmil IV-19 Ambon', '2021-09-27 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044760, NULL),
(360, 'B/715/IX/2021', '2021-09-24', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n terdakwa Pratu Irman Ode, NRP. 31140362580894', 1, 'Otmil IV-19 Ambon', '2021-09-27 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044761, NULL),
(361, 'B/175/IX/2021', '2021-09-20', '0000-00-00', 'Laporan penerimaan Napimil Pidana a.n. Praka Ismail Sosal, NRP 31100263371289', 1, 'Lembaga permasyarakatan militer IV Makassar', '2021-09-28 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044762, NULL),
(362, 'B/176/IX/2021', '2021-09-20', '0000-00-00', 'Laporan penerimaan Napimil Pidana a.n. Praka Amirudin Lessy, NRP 539616', 1, 'Lembaga permasyarakatan militer IV Makassar', '2021-09-28 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044763, NULL),
(363, 'B/177/IX/2021', '2021-09-20', '0000-00-00', 'Laporan penerimaan Napimil Pidana a.n. Serka Panzer. C. Gaspersz, NRP 21080797040788', 1, 'Lembaga permasyarakatan militer IV Makassar', '2021-09-28 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044764, NULL),
(364, 'B/178/IX/2021', '2021-09-20', '0000-00-00', 'Laporan penerimaan Napimil Pidana a.n. Serda Eric Setiawan, NRP.21170124800597', 1, 'Lembaga permasyarakatan militer IV Makassar', '2021-09-28 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044765, NULL),
(365, 'B/179/IX/2021', '2021-09-22', '0000-00-00', 'Laporan Napimil sakit dan dirawat di RS.TK.II Pelamonia a.n. Koptu Zainal Abidin Ollong, NRP 3101035', 1, 'Lembaga permasyarakatan militer IV Makassar', '2021-09-28 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044766, NULL),
(366, '165/Djmt/Ratgas/9/2021', '2021-09-24', '0000-00-00', 'Pendampingan zona integritas ke satker di lingkungan Dirjenbadilmiltun', 1, 'Mahkamah Agung RI Dirjen Badilmil dan Peradilan Ta', '2021-09-28 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044767, NULL),
(367, '1358/Djmt/B/9/2021', '2021-09-23', '0000-00-00', 'Pemanggilan peserta Bimtek Panitera/Panitera pengganti di lingkungan peradilan Militer TA 2021', 1, 'Mahkamah Agung RI Dirjen Badilmil dan Peradilan Ta', '2021-09-28 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044768, NULL),
(368, 'W.3 Mil/52/HK.04/IX/2021', '2021-09-24', '0000-00-00', 'Penerimaan berkas perkara banding a.n terdakwa Koptu Petrus Batmomolin, NRP 31040399400584', 1, 'PENGADILAN MILITER TINGGI III SURABAYA', '2021-09-29 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044769, NULL),
(369, 'W.3 Mil/51/HK.04/IX/2021', '2021-09-24', '0000-00-00', 'Taphan a.n. terdakwa Prada Yohanes Andres Saimima, NRP 31190370121199', 1, 'PENGADILAN MILITER TINGGI III SURABAYA', '2021-09-29 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044770, NULL),
(370, 'W.3Mil/56/HK.07/IX/2021', '2021-09-24', '0000-00-00', 'Berkas Perkara, salinan putusan, petikan putusan dan penetapan hakim a.n. terdakwa Praka Milton Sial', 1, 'PENGADILAN MILITER TINGGI III SURABAYA', '2021-09-29 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044771, NULL),
(371, 'B/722/IX/2021', '2021-09-28', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer. (Panggilan III)', 1, 'Otmil IV-19 Ambon', '2021-09-30 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044772, NULL),
(372, '-', '2021-09-28', '0000-00-00', 'Undangan mengikuti peringatan Hari Ulang Tahun Dharmayukti Karini XIX pada hari Jumat 1 Oktober 2021', 1, 'Pengurus Dharmayukti Karini Cabang Ambon', '2021-10-01 00:00:00', 'Diarsipkan.', 1, NULL, NULL, NULL, NULL, 1633044773, NULL),
(373, 'B/724/IX/2021', '2021-09-30', '0000-00-00', 'Panggilan menghadap persidangan Pengadilan Militer (Panggilan II) a.n saksi Ronaldo Awiara, Prajiuri', 1, 'Otmil IV-19 Ambon', '2021-10-04 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044774, NULL),
(374, '130/Pan.7/BKS/94K/Mil/2021', '2021-09-21', '0000-00-00', 'Permohonan Kasasi dari terdakwa Eko Irianto, Prada NRP. 31180881490799', 1, 'Mahkamah Agung RI', '2021-10-04 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044775, NULL),
(375, 'Miltama/B/1024/X/2021', '2021-10-01', '0000-00-00', 'Pengiriman daftar permasalahan Teknis Tahun 2021', 1, 'Pengadilan militer utama', '2021-10-06 00:00:00', 'Diarsipkan.', 1, NULL, NULL, NULL, NULL, 1633044776, NULL),
(376, 'B/113/Bebas/IX/2021', '2021-09-02', '0000-00-00', 'Pembebasan Narapidana Militer a.n. Sertu (K) Lin C D NRP 21140107500693', 1, 'Lembaga permasyarakatan militer IV Makassar', '2021-10-06 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044777, NULL),
(377, 'B/727/X/2021', '2021-10-04', '0000-00-00', 'Pemberitahuan penyelesaian perkara pelanggaran lalu lintas a.n terdakwa Sertu Almendo Haloham, NRP. ', 1, 'Otmil IV-19 Ambon', '2021-10-06 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044778, NULL),
(378, 'B/728/X/2021', '2021-10-04', '0000-00-00', 'Pemberitahuan penyelesaian perkara pelanggaran lalu lintas a.n terdakwa Pratu Suarno Soamole, NRP. 3', 1, 'Otmil IV-19 Ambon', '2021-10-06 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044779, NULL),
(379, 'B/729/X/2021', '2021-10-04', '0000-00-00', 'Pemberitahuan penyelesaian perkara pelanggaran lalu lintas a.n terdakwa Serka Deymon Peter Latuhihin', 1, 'Otmil IV-19 Ambon', '2021-10-06 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044780, NULL),
(380, 'B/730/X/2021', '2021-10-04', '0000-00-00', 'Pemberitahuan penyelesaian perkara pelanggaran lalu lintas a.n terdakwa Serda Nikson Elieser Manuhut', 1, 'Otmil IV-19 Ambon', '2021-10-06 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044781, NULL),
(381, 'B/731/X/2021', '2021-10-04', '0000-00-00', 'Pemberitahuan penyelesaian perkara pelanggaran lalu lintas a.n terdakwa Kopda Bernadus Rumlus, NRP. ', 1, 'Otmil IV-19 Ambon', '2021-10-06 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044782, NULL),
(382, 'B/732/X/2021', '2021-10-04', '0000-00-00', 'Pemberitahuan penyelesaian perkara pelanggaran lalu lintas a.n terdakwa Prada Rajikan Kasiransyah, N', 1, 'Otmil IV-19 Ambon', '2021-10-06 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044783, NULL),
(383, 'B/734/X/2021', '2021-10-04', '0000-00-00', 'Pemberitahuan penyelesaian perkara pelanggaran lalu lintas a.n terdakwa Serka Dedi Handoko, NRP. 210', 1, 'Otmil IV-19 Ambon', '2021-10-06 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044784, NULL),
(384, 'B/735/X/2021', '2021-10-04', '0000-00-00', 'Pemberitahuan penyelesaian perkara pelanggaran lalu lintas a.n terdakwa Kopda Abdul Hair, NRP. 31090', 1, 'Otmil IV-19 Ambon', '2021-10-06 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044785, NULL),
(385, 'B/736/X/2021', '2021-10-04', '0000-00-00', 'Pemberitahuan penyelesaian perkara pelanggaran lalu lintas a.n terdakwa Pratu Irman Ode, NRP. 311403', 1, 'Otmil IV-19 Ambon', '2021-10-06 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044786, NULL),
(386, 'B/737/X/2021', '2021-10-04', '0000-00-00', 'Pemberitahuan penyelesaian perkara pelanggaran lalu lintas a.n terdakwa Sertu Syafrudin, NRP. 211800', 1, 'Otmil IV-19 Ambon', '2021-10-06 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044787, NULL),
(387, 'B/738/X/2021', '2021-10-04', '0000-00-00', 'Pemberitahuan penyelesaian perkara pelanggaran lalu lintas a.n terdakwa Sertu Budi Wahyono, NRP. 310', 1, 'Otmil IV-19 Ambon', '2021-10-06 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044788, NULL),
(388, 'B/739/X/2021', '2021-10-05', '0000-00-00', 'Pemberitahuan penyelesaian perkara pelanggaran lalu lintas a.n terdakwa Prada Mizak Nouw, NRP. 31190', 1, 'Otmil IV-19 Ambon', '2021-10-06 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044789, NULL),
(389, 'R/281/IX/2021', '2021-09-28', '0000-00-00', 'Laporan telah kembali ke satuan Anggota Desersi a.n Pratu Pius Yonas Philips Kakare, NRP. 3116069943', 1, 'Kodam XVI/Pattimura, Detasemen Zeni Tempur 5/CMG', '2021-10-11 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044790, NULL),
(390, 'Kep/30/IX/2021', '2021-09-29', '0000-00-00', 'Penahanan Sementara a.n terdakwa Pratu Pius Yonas Philips Kakare, NRP. 31160699430694', 1, 'Kodam XVI/Pattimura, Detasemen Zeni Tempur 5/CMG', '2021-10-11 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044791, NULL),
(391, 'B/745/X/2021', '2021-10-08', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer (panggilan III) a.n. terdakwa Ronaldo Awiara seba', 1, 'Otmil IV-19 Ambon', '2021-10-11 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044792, NULL),
(392, 'B/763/X/2021', '2021-10-08', '0000-00-00', 'Panggilan menjalani pidana dan usul PDTH a.n. terpidana Kopda Pardi Ladjaenu, NRP 31100260890989', 1, 'Otmil IV-19 Ambon', '2021-10-11 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044793, NULL),
(393, 'B/749/X/2021', '2021-10-08', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer (panggilan II)', 1, 'Otmil IV-19 Ambon', '2021-10-11 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044794, NULL),
(394, 'B/750/X/2021', '2021-10-08', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n. terdakwa Serda La Ode Zani Asmin, NRP. 31960', 1, 'Otmil IV-19 Ambon', '2021-10-11 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044795, NULL),
(395, 'B/751/X/2021', '2021-10-08', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n. terdakwa Serda Muh Candra Ferdiawan, NRP. 13', 1, 'Otmil IV-19 Ambon', '2021-10-11 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044796, NULL),
(396, '415/Pan.7/Srt.Pet/129 K/Mil/20', '2021-10-04', '0000-00-00', 'Petikan Putusan Kasasi a.n Terdakwa Pratu Sakna Tambunan, NRP. 31160006580295', 1, 'Mahkamah Agung RI', '2021-10-11 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044797, NULL),
(397, 'W3.MIL/58/HK.07/X/2021', '2021-10-04', '0000-00-00', 'Surat pengantar berkas perkara dari pengadilan Militer Tinggi III Surabaya a.n. Terdakwa Koptu Petru', 1, 'PENGADILAN MILITER TINGGI III SURABAYA', '2021-10-11 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044798, NULL),
(398, 'B/125/X/2021', '2021-10-08', '0000-00-00', 'Data pelanggaran disiplin dan tindak pidana yang belum tuntas proses hukum', 1, 'Kodam XVI/Pattimura', '2021-10-11 00:00:00', 'Diarsipkan.', 1, NULL, NULL, NULL, NULL, 1633044799, NULL),
(399, 'B/748/X/2021', '2021-10-08', '0000-00-00', 'Pembebasan tahanan a.n. terdakwa Prada Marsal Bidji, NRP. 31200548080299', 1, 'Otmil IV-19 Ambon', '2021-10-11 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044800, NULL),
(400, 'B/762/X/2021', '2021-10-08', '0000-00-00', 'Pengawasan pidana percobaan a.n. terdakwa Serka Dimas Ari Setiawan NRP. 21100197140590', 1, 'Otmil IV-19 Ambon', '2021-10-11 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044801, NULL),
(401, 'B/753/X/2021', '2021-10-08', '0000-00-00', 'Pemberitahuan penyelesaian perkara pelanggaran lalu lintas a.n. Terdakwa Praka Selwanus Jaflaun. NRP', 1, 'Otmil IV-19 Ambon', '2021-10-11 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044802, NULL),
(412, 'OO34', '2022-02-02', '2022-02-08', 'UNDANGANA', NULL, 'OTMIL3333', 'SS333', 'UNDANGAN MAULID NABI', 8, 'Administrasi', 'Dokumen', 'Baik', 'Berkas', 1644362017, 'Surat-keluar05724.pdf'),
(413, 'PM/232/', '2022-02-08', '2022-02-13', 'Pemberitahuan', NULL, 'POMDAM', 'wepro', 'sdfadsfasd', 1, 'Hukum', 'Dokumen', 'Baik', 'Bundel', 1644710846, 'Surat-masuk30527.pdf');

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

--
-- Dumping data for table `surat_masuk`
--

INSERT INTO `surat_masuk` (`id_surat_masuk`, `no_surat`, `tgl_surat`, `tgl_terima`, `perihal`, `id_jenis_surat`, `pengirim`, `kode_klasifikasi`, `deskripsi`, `id_petugas`, `nilai_guna`, `media`, `kondisi`, `satuan_lampiran`, `dibuat_pada`, `berkas_surat`) VALUES
(1, 'R/129/IV/2021', '2021-04-16', '0000-00-00', 'Laporan Selesai Menjalani Pidana An. Sertu Saharudin', 1, 'Yonif 731/Kabaresi', '2021-05-05 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044402, NULL),
(2, 'R/17/IV/2021', '2021-04-22', '0000-00-00', 'Pelimpahan perkara dugaan penipuan yang dilakukan oleh Serma Andi Victor Harianto', 1, 'JASDAM XVI/PTM', '2021-05-05 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044403, NULL),
(3, 'R/385/IV/2021', '2021-04-21', '0000-00-00', 'Laporan selesai menjalan pidana an Sertu Saharudin Yonif 731/Kabaresi', 1, 'Brigif 27/Nusa Ina', '2021-05-05 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044404, NULL),
(4, 'R/141/IV/2021', '2021-04-27', '0000-00-00', 'Jawaban surat panggilan an Pratu Aprianus Jamlay', 1, 'Yonif 731/Kabaresi', '2021-05-05 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044405, NULL),
(5, '35/Pan.7/BKS/17 PK/Mil/2020', '2021-04-21', '0000-00-00', 'Permohonan PK dari Terpidana An Sertu Rustam Muhammad Anwar Suat, Rindam XVI/Ptm', 1, 'Mahkamah Agung RI', '2021-05-05 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044406, NULL),
(6, 'B/289/IV/2021', '2021-04-29', '0000-00-00', 'Panggilan menghadap persidangan an Serma Andi Victor Harianto Jasdam XVI/Ptm', 1, 'ODITUR MILITER IV-19 AMBON', '2021-05-05 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044407, NULL),
(7, 'B/292/IV/2021', '2021-04-29', '0000-00-00', 'Panggilan menghadap persidangan an Koptu Zainal Abidin Ollong Bekangdam XVI/Ptm', 1, 'ODITUR MILITER IV-19 AMBON', '2021-05-05 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044408, NULL),
(8, 'B/380/IV/2021', '2021-04-27', '0000-00-00', 'Jawaban panggilan III menghadap persidangan an Serda Andi Satria S,Kep', 1, 'KODIM 1504 AMBON', '2021-05-04 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044409, NULL),
(9, '185/Pan.7/SRT/79K/Mil/2021', '2021-04-09', '0000-00-00', 'Penerimaan berkas perkara kasasi pidana militer an Terdakwa Praka Joko Priono Renuat', 1, 'Mahkamah Agung RI', '2021-05-05 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044410, NULL),
(10, 'B/63/BEBAS/IV/2021', '2021-04-22', '0000-00-00', 'Pembebasan narapidana an Praka Umardani Salaputa Brigif 27/Nusa Ina', 1, 'Masmil IV Makassar', '2021-05-05 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044411, NULL),
(11, '------', '2021-04-30', '0000-00-00', 'Mohon bantuan proses hukum kasus nikah ganda yang dilakukan oleh suami saya Koptu Zainal Abidin Ollo', 1, 'PRIBADI', '2021-05-04 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044412, NULL),
(12, 'B/301/V/2021', '2021-05-03', '0000-00-00', 'Pemberitahuan penyelesaian perkara Lalin an Terdakwa Koptu Asperos Tomalata Kodim 1502/Masohi', 1, 'ODITUR MILITER IV-19 AMBON', '2021-05-04 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044413, NULL),
(13, 'B/299/V/2021', '2021-05-03', '0000-00-00', 'Panggilan 2 menghadap persidangan sebagai Saksi an Terdakwa Serma Andi Victor Harianto Jasdam XVI/Pt', 1, 'ODITUR MILITER IV-19 AMBON', '2021-05-04 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044414, NULL),
(14, 'B/390/V/2021', '2021-04-27', '0000-00-00', 'Jawaban Panggilan 3 menghadap persidangan sebagai saksi atas nama terdakwa Prada Leonardus Samangun', 1, 'Yonif 734/SNS', '2021-05-04 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044415, NULL),
(15, 'B/391/IV/2021', '2021-04-27', '0000-00-00', 'Jawaban Panggilan 3 menghadap persidangan sebagai saksi atas nama prada ahmad bole bolly', 1, 'Yonif 734/SNS', '2021-05-04 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044416, NULL),
(16, 'B/304/V/2021', '2021-05-05', '0000-00-00', 'Pemberitahuan Penyelesaian Perkara Pelanggaran Lalu Lintas, a.n. Terdakwa Pratu Marlon Benamen, NRP.', 1, 'ODITUR MILITER IV-19 AMBON', '2021-05-07 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044417, NULL),
(17, 'B/305/V/2021', '2021-05-05', '0000-00-00', 'Pemberitahuan penyelesaian perkara pelanggaran lalu lintas a.n. Terdakwa Serda Fachril Samad Rumulut', 1, 'ODITUR MILITER IV-19 AMBON', '2021-05-07 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044418, NULL),
(18, 'Sprin/60/IV/2021', '2021-04-08', '0000-00-00', 'Sprin, agar segera mempersiapkan diri untuk menjalani Pidana Penjara selama 8 (delapan) bulan dengan', 1, ' Denmadam XVI/Pattimura', '2021-05-07 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044419, NULL),
(19, 'Sprin/79/IV/2021', '2021-04-28', '0000-00-00', 'Sprin, seterimahnya surat perintah inin di samping tugas dan tanggung jawab dalam jabatan sehari-har', 1, 'Kumdam XVI/Pattimura', '2021-05-07 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044420, NULL),
(20, 'R/68/III/2021', '2021-03-24', '0000-00-00', 'Pengiriman berkas perkara desersi Tersangka an Kopda Pieter Alfons Kodim 1503/Tual', 1, 'Denpom XVI/Masohi', '2021-05-11 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044421, NULL),
(21, 'R/69/III/2021', '2021-03-24', '0000-00-00', 'Pengiriman berkas perkara desersi Tersangka an Kopda Pardi ladjaenu Kodim 1502/Masohi', 1, 'Denpom XVI/Masohi', '2021-05-11 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044422, NULL),
(22, 'R/83/IV/2021', '2021-04-06', '0000-00-00', 'Pengiriman berkas perkara penganiayaan Tersangka an. SerdanTaufik Parlindah Kodim 1511/Pulau Moa', 1, 'Denpom XVI/Masohi', '2021-05-11 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044423, NULL),
(23, 'R/84/IV/2021', '2021-04-08', '0000-00-00', 'Pengiriman berkas perkara kecelakan lalu lintas tersangka an Pratu marlon Benamen Yonif 734/SNS', 1, 'Denpom XVI/Masohi', '2021-05-11 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044424, NULL),
(24, '217/Pan.7/SRT.Pet/58K/Mil/2021', '2021-04-22', '0000-00-00', 'Petikan Putusan Kasasi An Terdakwa Serda Arfandi Hamid Yonif RK 732/Banau', 1, 'Mahkamah Agung RI', '2021-05-11 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044425, NULL),
(25, '212/Pan.7/IV/2021/59/Pen/Tah/M', '2021-04-21', '0000-00-00', 'Salinan penetapan penahanan Ketua Muda urusan Lingkungan Peradilan Miiter An Terdakwa Prada Eko Iria', 1, 'Mahkamah Agung RI', '2021-05-11 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044426, NULL),
(26, 'W3 MIL/47/HK.01/IV/2021', '2021-04-22', '0000-00-00', 'Penahanan Hakim Ketua Dilmilti III-sby Nomor TAP/8-K/PMT.III/BDG/AD/IV/2021 tanggal 22 April 2021 an', 1, 'Dilmilti III Surabaya', '2021-05-11 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044427, NULL),
(27, '223/Pan.7/Srt.Pet/79K/Mil/2021', '2021-04-27', '0000-00-00', 'Petikan putusan kasasi an Terdakwa Praka Joko Priono Renuat BKO Yonarmedn9/2/1 Kostrad', 1, 'Mahkamah Agung RI', '2021-05-11 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044428, NULL),
(28, 'W3 MIL/49/HK.01/IV/2021', '2021-04-23', '0000-00-00', 'Penerimaan berkas perkara tingkat banding A.n Terdakwa Pratu Muhammad tatang Iskandar, Yonif Raider ', 1, 'Dilmilti III Surabaya', '2021-05-11 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044429, NULL),
(29, 'B/307/V/2021', '2021-05-10', '0000-00-00', 'Panggilan menghadap persidangan an Terdakwa Praka martin Taniwel Denmadam XVI/Ptm', 1, 'ODITUR MILITER IV-19 AMBON', '2021-05-11 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044430, NULL),
(30, 'B/308/V/2021', '2021-05-10', '0000-00-00', 'Panggilan menghadap persidangan an Terdakwa Sertu Lory Leiwakabessy Kodim 1504/Ambon', 1, 'ODITUR MILITER IV-19 AMBON', '2021-05-11 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044431, NULL),
(31, 'B/445/V/2021', '2021-05-10', '0000-00-00', 'Data Pelanggaran', 1, 'Rindam XVI/Pattimura', '2021-05-11 00:00:00', 'Surat Diarsipkan', 1, NULL, NULL, NULL, NULL, 1633044432, NULL),
(32, 'R/418/V/2021', '2021-05-03', '0000-00-00', 'Laporan selesai menjalani pidana an Praka Umardani Salaputa Brigif 27/Nusa Ina', 1, 'Brigif 27/Nusa Ina', '2021-05-11 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044433, NULL),
(33, 'SPANG/19/V/2021', '2021-05-11', '0000-00-00', 'Surat panggilan II an Terdakwa Koptu Zainal Abidin Ollong Bekangdam XVI/Ptm', 1, 'ODITUR MILITER IV-19 AMBON', '2021-05-11 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044434, NULL),
(34, 'B/69/BEBAS/IV/2021', '2021-04-27', '0000-00-00', 'Pembebasan narapidana militer an Kopda Rudi F Kodim 1502/Masohi', 1, 'ODITUR MILITER IV-19 AMBON', '2021-05-11 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044435, NULL),
(35, 'W3 MIL/62/HK.01/V/2021', '2021-05-07', '0000-00-00', 'Salinan putusan Dilmilti III-Surabaya Nomor 21-K/PMT.III/BDG/AD/IV/2021 tanggal 04 Mei 2021 an terda', 1, 'Dilmilti III Surabaya', '2021-05-17 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044436, NULL),
(36, 'B/312/V/2021', '2021-05-17', '0000-00-00', 'Pembebasan terpidana an Praka Charles Hattu Yonif RK 732/Banau', 1, 'ODITUR MILITER IV-19 AMBON', '2021-05-17 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044437, NULL),
(37, 'W3 MIL/61/HK.01/V/2021', '2021-05-05', '0000-00-00', 'Penerimaan berkas perkara tingkat banding an Terdakwa Letda Czi Herman', 1, 'Dilmilti III Surabaya', '2021-05-17 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044438, NULL),
(38, 'W3 MIL/60/HK.01/V/2021', '2021-05-05', '0000-00-00', 'Penerimaan berkas perkara tingkat banding an Terdakwa Pratu Sakna Tambunan', 1, 'Dilmilti III Surabaya', '2021-05-17 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044439, NULL),
(39, 'B/101/IV/2021', '2021-04-30', '0000-00-00', 'Laporan kemajuan pelaksanaan program kerja lemasmil IV Makassar bulan April TA 2021', 1, 'Masmil IV Makassar', '2021-05-18 00:00:00', 'Surat Diarsipkan', 1, NULL, NULL, NULL, NULL, 1633044440, NULL),
(40, 'R/88/IV/2021', '2021-04-22', '0000-00-00', 'Pengiriman berkas perkara desersi an Terdakwa Serda Eric Setiawan Brigif 27/Nusa Ina', 1, 'Denpom XVI/Masohi', '2021-05-20 00:00:00', 'Surat Diarsipkan', 1, NULL, NULL, NULL, NULL, 1633044441, NULL),
(41, 'W3 MIL/19/HK.07/V/2021', '2021-05-04', '0000-00-00', 'Penetapan penahanan Hakim Kadilmilti III-Sby No. TAP/11-K/PMT.III/BDG/AD/V/2021 tanggal 03 Mei 2021 ', 1, 'Dilmilti III Surabaya', '2021-05-20 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044442, NULL),
(42, 'W3 MIL/18/HK.07/V/2021', '2021-05-04', '0000-00-00', 'Salinan putuan Dilmilti III-Sby No.17-K/PMT.III/BDG/AD/IV/2021 tanggal 27-04-2021 an Terdakwa Serka ', 1, 'Dilmilti III Surabaya', '2021-05-20 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044443, NULL),
(43, 'B/325/V/2021', '2021-05-20', '0000-00-00', 'Panggilan III menghadap persidangan sebagai Saksi an Terdakwa Pratu Randi Palio Yonif 731/Kabaresi', 1, 'ODITUR MILITER IV-19 AMBON', '2021-05-20 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044444, NULL),
(44, 'B/324/V/2021', '2021-05-20', '0000-00-00', 'Panggilan III menghadap persidangan sebagai Saksi an Terdakwa Prada Yohanes Andres Saimima Yonif 731', 1, 'ODITUR MILITER IV-19 AMBON', '2021-05-20 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044445, NULL),
(45, 'B/327/V/2021', '2021-05-20', '0000-00-00', 'Panggilan II menghadap persidangan sebagai Saksi an Terdakwa Pratu Aprianus Jamlay Yonif 731/Kabares', 1, 'ODITUR MILITER IV-19 AMBON', '2021-05-20 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044446, NULL),
(46, 'B/326/V/2021', '2021-05-20', '0000-00-00', 'Panggilan II menghadap persidangan senagai Saksi an terdakwa Praka La Ode Lukman Kodim 1507/Saumlaki', 1, 'ODITUR MILITER IV-19 AMBON', '2021-05-20 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044447, NULL),
(47, 'B/319/V/2021', '2021-05-19', '0000-00-00', 'Panggilan menghadap persidangan sebagai Saksi an Terdakwa Prada Hengki Tornado Pomdam XVI/Ptm', 1, 'ODITUR MILITER IV-19 AMBON', '2021-05-20 00:00:00', 'Surat Disatukan Dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044448, NULL),
(48, 'sprin/260/v/2021', '2021-05-21', '0000-00-00', 'Sprin.Diperintahkan menghadap di persidangan Pengadilan Militer III-18 Ambon.Pada hari senin, tangga', 1, 'Yonif 731/Kabaresi', '2021-05-24 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044449, NULL),
(49, 'sprin/261/v/2021', '2021-05-21', '0000-00-00', 'Sprin.Diperintahkan menghadap di persidangan Pengadilan Militer III-18 Ambon.Pada hari Senin, Tangga', 1, 'Yonif 731/Kabaresi', '2021-05-24 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044450, NULL),
(50, 'Kep/12/v/2021', '2021-05-20', '0000-00-00', 'Penyerahan Perkara a.n Praka Amirudin Lessy, NRP 539616 Kesatuan TNI AU Pattimura', 1, 'Lanut Pattimura', '2021-05-24 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044451, NULL),
(51, 'kep/02/IV/2021', '2021-04-30', '0000-00-00', 'Penyerahan Perkara a.n Adi Wiyanto Serda Mes NRP 76883 Kesatuan Lanal Ternate.', 1, 'Lantamal IX', '2021-05-24 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044452, NULL),
(52, 'B/332/V/2021', '2021-05-24', '0000-00-00', 'Panggilan III menghadap persidangan an Terdakwa Prada Yohanes Andres Saimima Yonif 731/Kabaresi', 1, 'ODITUR MILITER IV-19 AMBON', '2021-05-24 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044453, NULL),
(53, 'b/339/v/2021', '2021-05-27', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer (panggilan III) a.n Berty Tuatfaru NRP 3100033226', 1, 'Oditurat Militer IV-19', '2021-05-27 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044454, NULL),
(54, 'b/340/v/2021', '2021-05-27', '0000-00-00', 'Panggilan menghadap persidangan Pengadilan Militer (Panggilan III) a.n Ali Makatita NRP 315096204028', 1, 'Oditurat Militer IV-19', '2021-05-27 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044455, NULL),
(55, 'B/341/v/2021', '2021-05-27', '0000-00-00', 'Panggilan menghadap persidangan Pengadilan Militer (Panggilan III) a.n Rajiman Achmad NRP 3110025396', 1, 'ODITUR MILITER IV-19 AMBON', '2021-05-27 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044456, NULL),
(56, 'Kep/151/v/2021', '2021-05-03', '0000-00-00', 'Penahanan sementara komandan batalayon infentari 731/kabaresi', 1, 'Brigif 27/Nusa Ina', '2021-05-28 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044457, NULL),
(57, 'R/150/V/2021', '2021-05-03', '0000-00-00', 'LAPORAN PENANGKAPAN ANGGOTA YONIF 731/KABARESI A.N PRATU RANDI PALIO NRP 31120303030293', 1, 'Brigif 27/Nusa Ina', '2021-05-28 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044458, NULL),
(58, 'R/168/V/2021', '2021-05-21', '0000-00-00', 'JAWABAN SURAT PANGGILAN KE-2 ANGGOTA YONIF 731/KABARESI A.N PRATU APRIANUS JAMLAY NRP 31120277700490', 1, 'Brigif 27/Nusa Ina', '2021-05-28 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044459, NULL),
(59, 'R/160/V/2021', '2021-05-16', '0000-00-00', 'laporan selesai menjalani pidana a.n Praka Deni Afriadin NRP 31120311030490', 1, 'Brigif 27/Nusa Ina', '2021-05-28 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044460, NULL),
(60, 'B/441/V/2021', '2021-05-19', '0000-00-00', 'SELESAI MENJALANI PIDANA PERCOBAAN A.N SERDA NUH ARI FADILAH NRP 2100001367981', 1, 'Brigif 27/Nusa Ina', '2021-05-28 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044461, NULL),
(61, 'b/350/v/2021', '2021-05-28', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n Praka Muchlis Ibrahim NRP. 31080236760588', 1, 'ODITUR MILITER IV-19 AMBON', '2021-05-28 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044462, NULL),
(62, 'b/351/v/2021', '2021-05-28', '0000-00-00', 'Pengadilan menghadap persidangan pengadilan militer a.n Serda Gustianas Pelupessy NRP. 2119021091089', 1, 'ODITUR MILITER IV-19 AMBON', '2021-05-28 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044463, NULL),
(63, 'b/352/v/2021', '2021-05-28', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n Pelda Ambo Dale Nuhu NRP. 3930349130471', 1, 'ODITUR MILITER IV-19 AMBON', '2021-05-28 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044464, NULL),
(64, 'b/353/v/2021', '2021-05-28', '0000-00-00', 'Panggilan menghadap persidangan militer a.n Prada Fendi Glandinosero NRP. 31190363521298', 1, 'ODITUR MILITER IV-19 AMBON', '2021-05-28 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044465, NULL),
(65, 'b/73/bebas/v/2021', '2021-05-13', '0000-00-00', 'Pembebasan Narapidana Militer a.n Praka Deni A, NRP 31120311030490', 1, 'Lembaga permasyarakatan militer IV Makassar', '2021-06-02 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044466, NULL),
(66, '260/PAN.7/SRT/94 K/MIL/2021', '2021-05-18', '0000-00-00', 'Penerimaan berkas perkara kasasi pidana militer a.n terdakwa Eko Irianto', 1, 'Mahkamah Agung RI', '2021-06-02 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044467, NULL),
(67, 'B/371/VI/2021', '2021-06-07', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a. n Serda Adi Wiyanto, NRP 76883', 1, 'Oditur Militer IV-19 Ambon', '2021-06-08 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044468, NULL),
(68, 'B/274/V/2021', '2021-05-30', '0000-00-00', 'Permohonan keputusan pemberhentian dengan tidak hormat (PDTH) dari dinas Militer TNI AD a.n Serda An', 1, 'Kodam XVI/Pattimura', '2021-06-08 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044469, NULL),
(69, 'Kep/15/VI/2021', '2021-06-08', '0000-00-00', 'Penahanan sementara terhadap tersangka a.n Hendrik Dhunad Lumatunine, NRP 210400263110582', 1, 'Kodam XVI/Pattimura', '2021-06-08 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044470, NULL),
(70, 'B/589/V/2021', '2021-05-27', '0000-00-00', 'Jawaban panggilan persidangan oleh kopral satu Berty Tuatfaru NRP 31003322690479 sebagai tersangka p', 1, 'Komando Resor Militer 152/Babullah', '2021-06-08 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044471, NULL),
(71, 'B/413/V/2021', '2021-05-27', '0000-00-00', 'Jawaban panggilan menghadap pengadilan militer (panggilan III) a. n Praka Rajiman Achmad NRP 3110025', 1, 'Komando Resor Militer 152/Babullah', '2021-06-08 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044472, NULL),
(72, 'Sprin/88/V/2021', '2021-05-24', '0000-00-00', 'Perintah untuk melaksanakan bantuan dan nasehat hukum kpd Mayor Chk Kusjanto, S.H., NRP 219501172707', 1, 'Kodam XVI/Pattimura', '2021-06-08 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044473, NULL),
(73, 'B/379/VI/2021', '2021-06-09', '0000-00-00', 'PANGGILAN MENGHADAP PERSIDANGAN DI PENGADILAN MILITER A.N TERDAKWA PRAKA AMIRUDIN LESSY NRP.539616', 1, 'Otmil IV-19 Ambon', '2021-06-10 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044474, NULL),
(74, 'Spang/21/VI/2021', '2021-06-09', '0000-00-00', 'PANGGILAN MENGHADAP PERSIDANGAN DI PENGADILAN MILITER A.N TERDAKWA PRAKA MILTON SIALEKY NRP. 3111056', 1, 'Otmil IV-19 Ambon', '2021-06-10 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044475, NULL),
(75, 'b/389/vi/2021', '2021-06-09', '0000-00-00', 'PANGGILAN MENJALANI PIDANA A.N TERPIDANA KOPTU ZAINAL ABIDIN OLLONG NRP. 31010353620979', 1, 'Otmil IV-19 Ambon', '2021-06-10 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044476, NULL),
(76, 'B/383/VI/2021', '2021-06-09', '0000-00-00', 'PANGGILAN MENGHADAP PERSIDANGAN DI PENGADILAN MILITER (PANGGILAN II) A.N SERDA ADI WIYANTO NRP. 7688', 1, 'Otmil IV-19 Ambon', '2021-06-10 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044477, NULL),
(77, 'B/113/V/2021', '2021-05-31', '0000-00-00', 'LAPORAN KEMAJUAN PELAKSANAAN PROGRAM KERJA LEMASMIL IV MAKASSAR BULAN MEI TA.2021', 1, 'Lembaga permasyarakatan militer IV Makassar', '2021-06-10 00:00:00', 'Diarsipkan.', 1, NULL, NULL, NULL, NULL, 1633044478, NULL),
(78, 'R/139/VI/2021', '2021-06-10', '0000-00-00', 'Pengiriman Berkas Perkara Desersi Tersangka a.n Sertu Brusly Edgar Romodar, NRP 31990280971079', 1, 'Polisi Militer Daerah Militer XVI/Pattimura Detase', '2021-06-11 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044479, NULL),
(79, 'B/651/VI/2021', '2021-06-13', '0000-00-00', 'Tidak dapat menghadirkan saksi di persidangan terkait perkara tindak pedana penyalahgunaan munisi ol', 1, 'Yonif R 733/Masariku', '2021-06-14 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044480, NULL),
(80, 'B/652/VI/2021', '2021-06-13', '0000-00-00', 'Tidak dapat menghadirkan saksi di persidangan terkait perkara tindak pedana penyalahgunaan munisi ol', 1, 'Yonif R 733/Masariku', '2021-06-14 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044481, NULL),
(81, 'B/653/VI/2021', '2021-06-14', '0000-00-00', 'Tidak dapat menghadirkan saksi di persidangan terkait perkara tindak pedana penyalahgunaan munisi ol', 1, 'Yonif R 733/Masariku', '2021-06-14 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044482, NULL),
(82, 'B/622/VI/2021', '2021-06-10', '0000-00-00', 'Data pelanggaran anggota Rindam XVI/PATTIMURA yang belum tuntas proses hukumnya sampai dengan bulan ', 1, 'Kodam XVI/Pattimura', '2021-06-14 00:00:00', 'Diarsipkan.', 1, NULL, NULL, NULL, NULL, 1633044483, NULL),
(83, 'R/182/VI/2021', '2021-06-03', '0000-00-00', 'Pendapat dan saran pemberhentian dengan tidak hormat dari Dinas Kemiliteran a.n Pratu Randi Palio, N', 1, 'Otmil IV-19 Ambon', '2021-06-14 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044484, NULL),
(84, 'B/397/VI/2021', '2021-06-10', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer (panggilan III) terdakwa a.n. Serka Frans Palinus', 1, 'Otmil IV-19 Ambon', '2021-06-14 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044485, NULL),
(85, 'B/396/VI/2021', '2021-06-10', '0000-00-00', 'Panggilan menghadap persidangan Pengadilan Militer (Panggilan III) terdakwa a.n Praka La Ode Lukman,', 1, 'Otmil IV-19 Ambon', '2021-06-14 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044486, NULL),
(86, 'B/400/VI/2021', '2021-06-14', '0000-00-00', 'panggilan menghadap persidangan pengadilan militer (panggilan iii) terdakwa a.n. Pratu Aprianus Jaml', 1, 'Otmil IV-19 Ambon', '2021-06-14 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044487, NULL),
(87, '/392/VI/2021', '2021-06-10', '0000-00-00', 'PANGGILAN MENGHADAP PERSIDANGAN PENGADILAN MILITER (PANGGILAN III) terdakwa a.n Pratu Bambang Bahar,', 1, 'Otmil IV-19 Ambon', '2021-06-14 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044488, NULL),
(88, 'B/387/VI/2021', '2021-06-10', '0000-00-00', 'Panggilan menghadap Pesidangan Pengadilan Militer terdakwa a.n Pratu Arifin Rumaf, NRP 3112061175039', 1, 'Otmil IV-19 Ambon', '2021-06-14 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044489, NULL),
(89, 'B/377/VI/2021', '2021-06-09', '0000-00-00', 'Panggilan menghadap persidangan Pengadilan Militer terdakwa a.n Praka Milton Sialeky, NRP 3111056853', 1, 'Otmil IV-19 Ambon', '2021-06-14 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044490, NULL),
(90, 'B/386/VI/2021', '2021-06-10', '0000-00-00', 'panggilan menghadap persidangan pengadilan militer terdakwa a.n. Serka Muhammad Kasim Nukuhehe, NRP ', 1, 'Otmil IV-19 Ambon', '2021-06-14 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044491, NULL),
(91, 'B/395/VI/2021', '2021-06-14', '0000-00-00', 'Panggilan menghadap persidangan Pengadilan Militer a.n Serda Mes Adi Wiyanto, NRP 76883', 1, 'Otmil IV-19 Ambon', '2021-06-14 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044492, NULL),
(92, 'B/398/VI/2021', '2021-06-10', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer (panggilan III) terdakwa a.n. Koptu Berty Tuatfar', 1, 'Otmil IV-19 Ambon', '2021-06-14 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044493, NULL),
(93, 'B/399/VI/2021', '2021-06-10', '0000-00-00', 'Panggilan menghadap persidangan Pengadilan Militer (Panggilan IV) terdakwa a.n Praka Rajiman Achmad,', 1, 'Otmil IV-19 Ambon', '2021-06-14 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044494, NULL),
(94, 'B/407/VI/2021', '2021-06-11', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer terdakwa a.n Pratu Isak Gainau, NRP 3117036636029', 1, 'Otmil IV-19 Ambon', '2021-06-14 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044495, NULL),
(95, 'B/408/VI/2021', '2021-06-11', '0000-00-00', 'Pemberitahuan penyelesaian perkara pelanggaran lalu lintas a.n Praka Muchlis Ibrahim, NRP 3108023676', 1, 'Otmil IV-19 Ambon', '2021-06-14 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044496, NULL),
(96, 'B/410/VI/2021', '2021-06-11', '0000-00-00', 'Pemberitahuan penyelesaian perkara pelanggaran lalu lintas a.n Serda Gustianas pelupessy, NRP 211902', 1, 'Otmil IV-19 Ambon', '2021-06-14 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044497, NULL),
(97, 'B/409/VI/2021', '2021-06-11', '0000-00-00', 'pemberitahuan penyelesaian perkara pelanggaran lalu lintas a.n prada fendi glandinosero, NRP 3119036', 1, 'Otmil IV-19 Ambon', '2021-06-14 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044498, NULL),
(98, 'B/425/VI/2021', '2021-06-16', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer (panggilan II) terdakwa a.n. Agung Putra Yudha NR', 1, 'Otmil IV-19 Ambon', '2021-06-17 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044499, NULL),
(99, 'B/426/VI/2021', '2021-06-16', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer (panggilan II) terdakwa a.n. Aryo Nugroho D', 1, 'Otmil IV-19 Ambon', '2021-06-17 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044500, NULL),
(100, 'B/431/VI/2021', '2021-06-16', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n Praka Iradat Muin, NRP 31100533640789. dan Pr', 1, 'Otmil IV-19 Ambon', '2021-06-17 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044501, NULL),
(101, 'R/516/VI/2021', '2021-06-09', '0000-00-00', 'Pendapat dan saran pemberhentian dengan tidak hormat dari dinas kemiliteran a.n. Pratu Randi Palio N', 1, 'Kodam XVI/Pattimura', '2021-06-17 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044502, NULL),
(102, 'Sprin/107/VI/2021', '2021-06-16', '0000-00-00', 'Sprin. agar mempersiapkan diri untuk menjalani sisa pidana di lemasmil IV-Makassar', 1, 'Kodam XVI/Pattimura', '2021-06-17 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044503, NULL),
(103, 'Sprin/229/VI/2021', '2021-06-10', '0000-00-00', 'Sprin. untuk berangkat ke Otmil IV-19 Ambon guna menjalani sisa pidana penjara 6 (enam) bulan 25 (du', 1, 'Kodam XVI/Pattimura', '2021-06-17 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044504, NULL),
(104, 'B/429/VI/2021', '2021-06-16', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer terdakwa a.n. Cakrarianto Djole NRP 2117019741109', 1, 'Otmil IV-19 Ambon', '2021-06-17 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044505, NULL),
(105, 'R/114/V/2021', '2021-05-20', '0000-00-00', 'Pengiriman Berkas Perkara Kecelakaan lalu lintas tersangka a.n Koptu Asperos Tomatola, NRP 310107680', 1, 'Polisi Militer Daerah Militer XVI/Pattimura', '2021-06-18 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044506, NULL),
(106, 'Sprin/112/VI/2021', '2021-06-18', '0000-00-00', 'Sprin. Agar mempersiapkan diri untuk melaksanakan pendampingan terhadap Sertu (K) Iin Chayanti Djala', 1, 'Kumdam XVI/Pattimura', '2021-06-21 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044507, NULL),
(107, 'Kep/401-18/VI/2021', '2021-06-08', '0000-00-00', 'Pemberhentian dengan tidak hormat dari Dinas Keprajuritan TNI Angkatan Darat', 1, 'Kodam XVI/Pattimura', '2021-06-21 00:00:00', 'Diarsipkan.', 1, NULL, NULL, NULL, NULL, 1633044508, NULL),
(108, 'B/437/VI/2021', '2021-06-17', '0000-00-00', 'Pemberitahuan penyelesaian perkara pelanggaran lalu lintas a.n. terdakwa Sertu Lori Leiwakabessy NRP', 1, 'Otmil IV-19 Ambon', '2021-06-21 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044509, NULL),
(109, 'B/438/VI/2021', '2021-06-17', '0000-00-00', 'Pemberiyahuan penyelesaian perkara pelanggaran lalu lintas a.n. terdakwa praka Martin Taniwel NRP 31', 1, 'Otmil IV-19 Ambon', '2021-06-21 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044510, NULL),
(110, 'B/443/VI/2021', '2021-06-21', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer (panggilan II) terdakwa a.n. Praka Amirudin Lessy', 1, 'Otmil IV-19 Ambon', '2021-06-21 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044511, NULL),
(111, 'B/444/VI/2021', '2021-06-21', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer (panggilan II) terdakwa a.n. Praka Milton Sialeky', 1, 'Otmil IV-19 Ambon', '2021-06-22 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044512, NULL),
(112, 'R/146/VI/2021', '2021-06-16', '0000-00-00', 'Jawaban Surat Panggilan ke-3 anggota Yonif 731/Kabaresi a.n Pratu Aprianus Jamlay, NRP. 311202777004', 1, 'Yonif/731 Kabaresi', '2021-06-22 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044513, NULL),
(113, 'Kep/46/VI/2021', '2021-06-11', '0000-00-00', 'Penyerahan perkara Komandan Korem 152/Babullah a.n terdakwa Serda Cakrarianto Djole, NRP. 2117019741', 1, 'Korem 152/Babullah', '2021-06-22 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044514, NULL),
(114, 'Kep/47/VI/2021', '2021-06-11', '0000-00-00', 'Penyerahan Perkara Komandan Korem 152/Babullah a.n Terdakwa Praka Iradat Muin, NRP. 31100533640789, ', 1, 'Korem 152/Babullah', '2021-06-22 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044515, NULL),
(115, 'W.3 MIL/77/HK.01/VI/2021', '2021-06-10', '0000-00-00', 'Penerimaan Berkas Perkara Tingkat Banding an. Terdakwa Serda Wibowo Mukti, NRP. 21080797040788', 1, 'Dilmilti III Surabaya', '2021-06-23 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044516, NULL),
(116, 'W.3 MIL/76/HK.01/VI/2021', '2021-06-23', '0000-00-00', 'Penahanan Hakim Ketua Pengadilan Militer Tinggi III Surabaya Nomor TAP/19-K/PMT. III/BDG/AD/VI/2021 ', 1, 'Dilmilti III Surabaya', '2021-06-23 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044517, NULL),
(117, 'W.3 MIL/79/HK.01/VI/2021', '2021-06-10', '0000-00-00', 'Perpanjangan Penahanan Kepala Pengadilan Militer Tinggi III Surabaya Nomor TAP/22-K/PMT. III/BDG/AD/', 1, 'Dilmilti III Surabaya', '2021-06-23 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044518, NULL),
(118, 'B/169/VI/2021', '2021-06-08', '0000-00-00', 'Surat jawaban panggilan menghadap Persidangan Pengadilan Militer', 1, 'Pangkalan Utama TNI AL XIV, Pangkalan TNI AL Terna', '2021-06-23 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044519, NULL),
(119, 'B/170/VI/2021', '2021-06-11', '0000-00-00', 'Surat jawaban panggilan menghadap Pengadilan Militer (Panggilan II)', 1, 'Pangkalan Utama TNI AL XIV, Pangkalan TNI AL Terna', '2021-06-23 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044520, NULL),
(120, '276/Pan.7/VI/2021/69/Pen/Tah/Mil/S/2021', '2021-06-10', '0000-00-00', 'Surat Pengantar salinan Penetapan Perpanjangan Penahanan a.n Terdakwa Prada Eko Irianto, NRP. 311808', 1, 'Mahkamah Agung RI', '2021-06-23 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044521, NULL),
(121, 'B/453/VI/2021', '2021-06-24', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n. terdakwa kopda pardi ladjaenu, NRP 311002608', 1, 'Otmil IV-19 Ambon', '2021-06-24 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044522, NULL),
(122, 'B/452/VI/2021', '2021-06-24', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n. terdakwa kopda petrus batmomolin, NRP 310403', 1, 'Otmil IV-19 Ambon', '2021-06-24 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044523, NULL),
(123, 'R/200/VI/2021', '2021-06-18', '0000-00-00', 'Permohonan keringanan hukuman Serda Cakrarianto Djole, NRP. 21170197411096', 1, 'Yonif 732/Banau', '2021-06-25 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044524, NULL),
(124, 'R/197/VI/2021', '2021-06-18', '0000-00-00', 'Permohonan keringanan hukuman Kopda Mardiman Papuangan, NRP. 31090576650188', 1, 'Yonif 732/Banau', '2021-06-25 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044525, NULL),
(125, 'R/198/VI/2021', '2021-06-18', '0000-00-00', 'Permohonan keringanan hukuman Serda Willian De Fretes, NRP. 21190210340598', 1, 'Yonif 732/Banau', '2021-06-25 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044526, NULL),
(126, 'R/199/VI/2021', '2021-06-18', '0000-00-00', 'Permohonan keringanan hukuman Serda Donny Dominggus, NRP. 21190216951199', 1, 'Yonif 732/Banau', '2021-06-25 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044527, NULL),
(127, 'R/201/VI/2021', '2021-06-18', '0000-00-00', 'Permohonan keringanan hukuman Pratu Gabriel Titirloloby, NRP. 31170375190897', 1, 'Yonif 732/Banau', '2021-06-25 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044528, NULL),
(128, 'R/194/VI/2021', '2021-06-18', '0000-00-00', 'Permohonan keringanan hukuman Praka iradat muin NRP 31100533640789', 1, 'Yonif 732/Banau', '2021-06-25 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044529, NULL),
(129, 'R/193/VI/2021', '2021-06-18', '0000-00-00', 'Permohonan keringanan hukuman Pratu Saiful M. Saleh NRP 31140367870795', 1, 'Yonif 732/Banau', '2021-06-25 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044530, NULL),
(130, 'R/195/VI/2021', '2021-06-18', '0000-00-00', 'Permohonan keringanan hukuman Prada ramdani musli waralalo NRP 31190347040900', 1, 'Yonif 732/Banau', '2021-06-25 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044531, NULL),
(131, 'R/196/VI/2021', '2021-06-18', '0000-00-00', 'Permohonan keringanan hukuman Pratu La Ode Irfan NRP 31170406791296', 1, 'Yonif 732/Banau', '2021-06-25 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044532, NULL),
(132, 'B/466/VI/2021', '2021-06-25', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n. terdakwa Letda Ctp Syafrie Bosou NRP 2197020', 1, 'Otmil IV-19 Ambon', '2021-06-25 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044533, NULL),
(133, 'B/465/VI/2021', '2021-06-25', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n. terdakwa Serka Adi Kusuma Wahyudi NRP 210902', 1, 'Otmil IV-19 Ambon', '2021-06-25 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044534, NULL),
(134, 'B/464/VI/2021', '2021-06-25', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n. terdakwa Sertu Rivaldo Billy Akollo NRP 2118', 1, 'Otmil IV-19 Ambon', '2021-06-25 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044535, NULL),
(135, 'B/463/VI/2021', '2021-06-25', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n. terdakwa Serda La Rikwan Djabumona NRP 31604', 1, 'Otmil IV-19 Ambon', '2021-06-25 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044536, NULL),
(136, 'B/461/VI/2021', '2021-06-25', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n. terdakwa Praka La Alimudin NRP 3112030253129', 1, 'Otmil IV-19 Ambon', '2021-06-25 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044537, NULL),
(137, 'B/462/VI/2021', '2021-06-25', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n. terdakwaPraka Andre Utama Putra NRP311200018', 1, 'Otmil IV-19 Ambon', '2021-06-25 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044538, NULL),
(138, 'B/87/Bebas/VI/2021', '2021-06-22', '0000-00-00', 'Pembebasan narapidana militer a.n Pratu Dani Dimas Yuda, NRP. 31140187771293', 1, 'Lembaga permasyarakatan militer IV Makassar', '2021-06-28 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044539, NULL),
(139, 'W2-Mil01/660/HK.01/V/2021', '2021-05-27', '0000-00-00', 'Akte pemberitahuan isis putusan kasasi Nomor : APIK/93/PM II-08/AD/V/2021 An. Joko Priono Renuat, Ke', 1, 'Pengadilan Militer III-08 Jakarta', '2021-06-30 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044540, NULL),
(140, 'W.3 MIL/22/HK.04/VI/2021', '2021-06-23', '0000-00-00', 'Penetapan penahanan hakim ketua pengadilan militer III Surabaya Nomor : TAP/26-K/PMT III/BDG/AD/VI/2', 1, 'PENGADILAN MILITER TINGGI III SURABAYA', '2021-06-30 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044541, NULL),
(141, 'W.3 MIL/25/HK.04/VI/2021', '2021-06-25', '0000-00-00', 'Penerimaan berkas perkara tingkat banding a.n Terdakwa Hengki Tornado Prada NRP. 31130483871192', 1, 'PENGADILAN MILITER TINGGI III SURABAYA', '2021-06-30 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044542, NULL),
(142, 'W3-Mil05/218/HK.04/VI/2021', '2021-06-21', '0000-00-00', 'Pemberitahuan untuk datang di Kepaniteraan Dilmil III-16 Makassar', 1, 'Pengadilan Militer III-16 Makassar', '2021-06-30 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044543, NULL),
(143, 'W3-Mil05/220/HK.04/VI/2021', '2021-06-23', '0000-00-00', 'Pembacaan putusan banding terdakwa Herman Letda Czi NRP. 21040264510783', 1, 'Pengadilan Militer III-16 Makassar', '2021-06-30 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044544, NULL),
(144, 'B/492/VI/2021', '2021-06-29', '0000-00-00', 'Permohonan bantuan hukum untuk mendampingi tersangka a.n serma hendrik D.Y. Lumatunine, NRP 21040263', 1, 'Deninteldam XVI/Ptm', '2021-06-30 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044545, NULL),
(145, 'R/137/VI/2021', '2021-06-10', '0000-00-00', 'Pengiriman berkas perkara Desersi tersangka a.n Prada Jeferson Refutu, NRP. 31160667170296', 1, 'Polisi Militer Daerah Militer XVI/Pattimura Detase', '2021-07-02 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044546, NULL),
(146, 'R/154/VI/2021', '2021-06-18', '0000-00-00', 'Pengiriman berkas perkara desersi tersangka a.n Sertu La Sam Wabula, NRP. 31040381990882', 1, 'Polisi Militer Daerah Militer XVI/Pattimura Detase', '2021-07-02 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044547, NULL),
(147, 'B/481/VI/2021', '2021-06-30', '0000-00-00', 'Panggilan menjalani pidana dan usul PDTH A.n Terpidana Prada Leonardus Samangun, NRP. 31140361590694', 1, 'Otmil IV-19 Ambon', '2021-07-02 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044548, NULL),
(148, 'B/482/VI/2021', '2021-06-30', '0000-00-00', 'Panggilan menjalani pidana dan usul PDTH a.n terpidana Prada Ahmad Bole Boly, NRP. 31170372610297', 1, 'Otmil IV-19 Ambon', '2021-07-02 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044549, NULL),
(149, 'B/483/VI/2021', '2021-06-30', '0000-00-00', 'Panggilan menjalani pidana dan usul PDTH a.n terpidana Pratu Ari Susanto, NRP. 31130666520992', 1, 'Otmil IV-19 Ambon', '2021-07-02 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044550, NULL),
(150, 'B/484/VI/2021', '2021-06-30', '0000-00-00', 'Panggilan menjalani pidana dan usul PDTH a.n terpidana Serda Andi Satria S.Kep, NRP. 31000212981279', 1, 'Otmil IV-19 Ambon', '2021-07-02 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044551, NULL),
(151, 'B/485/VI/2021', '2021-06-30', '0000-00-00', 'Panggilan menjalani pidana dan usul PDTH a.n terpidana Praka Rustam Saman Wayatim, NRP. 310905887904', 1, 'Otmil IV-19 Ambon', '2021-07-02 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044552, NULL),
(152, 'B/492/VII/2021', '2021-07-01', '0000-00-00', 'Panggilan menghadap persidangan Pengadilan Militer a.n terdakwa Pratu Randi Palio, NRP. 311203030302', 1, 'Otmil IV-19 Ambon', '2021-07-02 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044553, NULL),
(153, 'B/494/VII/2021', '2021-07-01', '0000-00-00', 'Pemberitahuan penyelesaian perkara pelanggaran lalu lintas', 1, 'Otmil IV-19 Ambon', '2021-07-02 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044554, NULL),
(154, 'W3.MIL/26/HK.04/VI/2021', '2021-06-28', '0000-00-00', 'Perpanjang penahanan kepala pengadilan militer tinggi III surabaya Nomor TAP/27-K/PMT III/BDG/AD/VI/', 1, 'PENGADILAN MILITER TINGGI III SURABAYA', '2021-07-05 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044555, NULL),
(155, 'W3.MIL/97/HK.01/VI/2021', '2021-06-30', '0000-00-00', 'Penerimaan berkas perkara banding a.n terdakwa Hengki Tornado, Prada NRP. 31130483871192', 1, 'PENGADILAN MILITER TINGGI III SURABAYA', '2021-07-05 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044556, NULL),
(156, 'W3.MIL/96/HK.01/VI/2021', '2021-06-30', '0000-00-00', 'Penetapan penahanan hakim ketua pengadilan militer tinggi III surabaya Nomor TAP/28-K/PMT III/BDG/AD', 1, 'PENGADILAN MILITER TINGGI III SURABAYA', '2021-07-06 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044557, NULL),
(157, '291/Pan.7/VI/2021/78/Pen/Tah/M', '2021-06-28', '0000-00-00', 'Surat pengantar salinan penetapan penahanan ketua muda urusan lingkungan peradilan militer a.n terda', 1, 'Mahkamah Agung RI', '2021-07-05 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044558, NULL),
(158, 'W3.MIL/93/HK.01/VI/2021', '2021-06-28', '0000-00-00', 'Surat pengantar a.n terdakwa Wibowo Mukti, Serda NRP. 21160081580796 jabatan Tarmin Arsip Jemen Sren', 1, 'PENGADILAN MILITER TINGGI III SURABAYA', '2021-07-05 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044559, NULL),
(159, 'B/486/VII/2021', '2021-07-01', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n terdakwa Serda Fachril Samad Rumalutur, NRP. ', 1, 'Odmil IV-19 Ambon', '2021-07-05 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044560, NULL),
(160, 'B/496/VII/2021', '2021-07-05', '0000-00-00', 'Pemberitahuan penyelesaian perkara pelanggaran lalu lintas a.n terdakwa Sertu Rivaldo Billy Akollo, ', 1, 'Odmil IV-19 Ambon', '2021-07-05 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044561, NULL),
(161, 'B/497/VII/2021', '2021-07-05', '0000-00-00', 'Pemberitahuan penyelesaian perkara pelanggaran lalu lintas a.n terdakwa Praka La Rikwan Djabumona, N', 1, 'Odmil IV-19 Ambon', '2021-07-05 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044562, NULL),
(162, 'B/498/VII/2021', '2021-07-05', '0000-00-00', 'Pemberitahuan penyelesaian perkara pelanggaran lalu lintas a.n terdakwa Praka La Alimuddin, NRP. 311', 1, 'Odmil IV-19 Ambon', '2021-07-05 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044563, NULL),
(163, 'B/499/VII/2021', '2021-07-05', '0000-00-00', 'Pemberitahuan penyelesaian perkara pelanggaran lalu lintas a.n terdakwa Letda Ctp Syafrie Bosou, NRP', 1, 'Odmil IV-19 Ambon', '2021-07-05 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044564, NULL),
(164, 'B/500/VII/2021', '2021-07-05', '0000-00-00', 'Pemberitahuan penyelesaian perkara pelanggaran lalu lintas a.n terdakwa Pratu Isak Gainau, NRP. 3117', 1, 'Odmil IV-19 Ambon', '2021-07-05 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044565, NULL),
(165, 'R/229/VII/2021', '2021-07-05', '0000-00-00', 'Jawaban surat panggilan anggota Yonif 731/Kabaresi a.n Kopda Bajuka Tuasikal, NRP. 31080226030287', 1, 'Brigif 27/Nusa Ina', '2021-07-06 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044566, NULL),
(166, 'Sprin/230/VII/2021', '2021-07-05', '0000-00-00', 'Sprin.menghadap persidangan pengadilan militer III-18 ambon tanggal 6 juli 2021 pukul.08.30 WIT guna', 1, 'Brigif 27/Nusa Ina', '2021-07-06 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044567, NULL),
(167, 'Sprin/742/VII/2021', '2021-07-04', '0000-00-00', 'Sprin. untuk menghadiri persidangan pengadilan militer III-18 Ambon, dalam perkara terdakwa Serda Fa', 1, 'DEVISI INFANTERI 2/VIRACAKTI YUDHA RESIMEN ANTILE', '2021-07-06 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044568, NULL),
(168, 'B/123/VI/2021', '2021-06-28', '0000-00-00', 'Laporan penerimaan Napimil a.n Koptu Zainal Abidin Ollong NRP. 31010353620979', 1, 'Lembaga permasyarakatan militer IV Makassar', '2021-07-06 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044569, NULL),
(169, 'B/124/VI/2021', '2021-06-28', '0000-00-00', 'Laporan penerimaan Napimil a.n Sertu (K) Iin Chayanti Djalali, NRP. 21140107500693 NRP. 311606992705', 1, 'Lembaga permasyarakatan militer IV Makassar', '2021-07-06 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044570, NULL),
(170, 'B/125/VI/2021', '2021-06-28', '0000-00-00', 'Laporan penerimaan Napimil a.n Pratu Isak Bach NRP. 31160699270594', 1, 'Lembaga permasyarakatan militer IV Makassar', '2021-07-06 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044571, NULL),
(171, 'B/129/VI/2021', '2021-06-28', '0000-00-00', 'Laporan kemajuan pelaksanaan program kerja Lemasmil IV Makassar Bulan Juni TA 2021', 1, 'Lembaga permasyarakatan militer IV Makassar', '2021-07-06 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044572, NULL),
(172, 'B/122/VI/2021', '2021-06-28', '0000-00-00', 'Laporan penerimaan Napimil a.n Sertu La Mujiono NRP. 31980662050179', 1, 'Lembaga permasyarakatan militer IV Makassar', '2021-07-06 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044573, NULL),
(173, 'Sprin/124/VI/2021', '2021-06-30', '0000-00-00', 'Sprin. tugas dan tanggung jawab dalam jabatan sehari-hari agar bertindak sebagai Penasehat Hukum a.n', 1, 'Kumdam XVI/Pattimura', '2021-07-07 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044574, NULL),
(174, 'B/508/VII/2021', '2021-07-07', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer (II) a.n terdakwa Kopda Pardi Ladjaenu Nrp. 31002', 1, 'Otmil IV-19 Ambon', '2021-07-07 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044575, NULL),
(175, 'B/726/VII/2021', '2021-07-02', '0000-00-00', 'Data pelanggaran anggota Rindam XVI/Pattimura yang belum tuntas proses hukumya sampai dengan bulan j', 1, 'Komandan Rindam XVI/pattimura', '2021-07-07 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044576, NULL);
INSERT INTO `surat_masuk` (`id_surat_masuk`, `no_surat`, `tgl_surat`, `tgl_terima`, `perihal`, `id_jenis_surat`, `pengirim`, `kode_klasifikasi`, `deskripsi`, `id_petugas`, `nilai_guna`, `media`, `kondisi`, `satuan_lampiran`, `dibuat_pada`, `berkas_surat`) VALUES
(176, 'B/506/VII/2021', '2021-07-07', '0000-00-00', 'Penyetoran uang hasil pelaksanaan putusan Pengadilan Militer III-18 AmbonTW. II TA 2021', 1, 'Otmil IV-19 Ambon', '2021-07-08 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044577, NULL),
(177, 'B/502/VII/2021', '2021-07-08', '0000-00-00', 'Panggilan menjalani pidana dan usul PDTH a.n terpidana Pratu Bambang Bahar, NRP. 31140397991094', 1, 'Otmil IV-19 Ambon', '2021-07-08 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044578, NULL),
(178, 'B/509/VII/2021', '2021-07-08', '0000-00-00', 'Panggilan menjalani pidana dan usul PDTH a.n terpidana Kopda Ali Makatita, NRP. 31050962040285', 1, 'Otmil IV-19 Ambon', '2021-07-08 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044579, NULL),
(179, 'B/510/VII/2021', '2021-07-08', '0000-00-00', 'Panggilan menjalani pidana dan usul PDTH a.n terpidana Praka La Ode Lukman, NRP. 3108023551288.', 1, 'Otmil IV-19 Ambon', '2021-07-08 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044580, NULL),
(180, 'B/511/VII/2021', '2021-07-08', '0000-00-00', 'Panggilan menjalani pidana dan usul PDTH a.n terpidana Serka Frans Palinusa, NRP. 21100193670889', 1, 'Otmil IV-19 Ambon', '2021-07-08 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044581, NULL),
(181, 'B/512/VII/2021', '2021-07-08', '0000-00-00', 'Panggilan menjalani pidana dan usul PDTH a.n terpidana Praka Rajiman Achmad, NRP. 31100253960289', 1, 'Otmil IV-19 Ambon', '2021-07-08 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044582, NULL),
(182, 'B/514/VII/2021', '2021-07-08', '0000-00-00', 'Panggilan menjalani pidana dan usul PDTH a.n terpidana Pratu Aprianus Jamlay, NRP. 31120277700490', 1, 'Otmil IV-19 Ambon', '2021-07-08 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044583, NULL),
(183, 'B/515/VII/2021', '2021-07-08', '0000-00-00', 'Panggilan menjalani pidana dan usul PDTH a.n terpidana Koptu Berty Tuatfaru, NRP. 31000332690473', 1, 'Otmil IV-19 Ambon', '2021-07-08 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044584, NULL),
(184, '299/Pan.7/Srt.Pet/94K/Mil/2021', '2021-06-22', '0000-00-00', 'Petikan putusan kasasi a.n terdakwa Prada Eko Irianto, NRP. 311808814904799', 1, 'Mahkamah Agung RI', '2021-07-12 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044585, NULL),
(185, 'B/520/VII/2021', '2021-07-13', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n terdakwa Kopda Pieter Alfons, NRP. 3102078734', 1, 'Otmil IV-19 Ambon', '2021-07-19 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044586, NULL),
(186, 'B/519/VII/2021', '2021-07-13', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer sebagai saksi a.n terdakwa Praka Milton Sialeky, ', 1, 'Otmil IV-19 Ambon', '2021-07-19 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044587, NULL),
(187, 'B/150/VII/2021', '2021-07-12', '0000-00-00', 'Permohonan persetujuan Remisi Umum HUT Kemerdekaan RI ke-76 tahun 2021', 1, 'Lembaga permasyarakatan militer IV Makassar', '2021-07-19 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044588, NULL),
(188, 'B/146/VII/2021', '2021-07-09', '0000-00-00', 'Laporan penerimaan Napimil a.n terpidana Pratu Dani Dimas Yuda, NRP. 31140187771293', 1, 'Lembaga permasyarakatan militer IV Makassar', '2021-07-19 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044589, NULL),
(189, 'B/99/Bebas/VII/2021', '2021-07-04', '0000-00-00', 'Pembebasan Narapidana Militer a.n Praka Idris Tehuayo, NRP. 31110240181288', 1, 'Lembaga permasyarakatan militer IV Makassar', '2021-07-19 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044590, NULL),
(190, 'R/III/VII/2021', '2021-07-10', '0000-00-00', 'Usul pemberhentian dengan tidak hormat (PDTH) a.n Kopda Nikson Natraka, NRP 31010359860580 Ta Kodim ', 1, 'KODIM 1503/TUAL', '2021-07-19 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044591, NULL),
(191, '330/Pan.7/VII/2021/95/Pen/Tah/Mil/S/2021', '2021-07-21', '0000-00-00', 'Salinan penetapan perpanjangan penahanan Ketua Mahkama Agung RI a.n Pratu Muhammad Tatang Iskandar, ', 1, 'Mahkamah Agung RI', '2021-07-21 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044592, NULL),
(192, 'R/652/VII/2021', '2021-07-19', '0000-00-00', 'Udk dan catat dalam buku regiter induk, selanjutnya himpun dalam berkas Ybs', 1, 'Kodam XVI/Pattimura', '2021-07-23 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044593, NULL),
(193, 'B/528/VII/2021', '2021-07-16', '0000-00-00', 'Pengawasan pidana percobaan a.n terpidana Serka Muhammad Kasim Nukuhehe, NRP. 3900322581168', 1, 'Odmil IV-19 Ambon', '2021-07-23 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044594, NULL),
(194, 'B/530/VII/2021', '2021-07-16', '0000-00-00', 'Pengawasan pidana percobaan a.n para terpidana Praka Iradat Muin, NRP. 31100533640789 dan 1 orang', 1, 'Odmil IV-19 Ambon', '2021-07-23 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044595, NULL),
(195, 'B/553/VII/2021', '2021-07-26', '0000-00-00', 'Pemberitahuan penyelesaian perkara pelanggaran lalu lintas a.n terdakwa Pelda Ambo Dale Nuhu, NRP 39', 1, 'Otmil IV-19 Ambon', '2021-07-27 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044596, NULL),
(196, 'B/554/VII/2021', '2021-07-27', '0000-00-00', 'Pemberitahuan penyelesaian perkara pelanggaran lalu lintas a.n. terdakwa Praka Andre Putra Utama, NR', 1, 'Otmil IV-19 Ambon', '2021-07-27 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044597, NULL),
(197, '316/Pan.7/VII/2021/84/Pen/Tah/Mil/S/2021', '2021-07-12', '0000-00-00', 'Surat pengantar salinan penetapan penahanan ketua muda urusan lingkungan peradilan militer a.n Terda', 1, 'Mahkamah Agung RI', '2021-07-27 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044598, NULL),
(198, 'B/408/VII/2021', '2021-07-26', '0000-00-00', 'Permohonan surat keterangan tidak pernah dipidana personel Kumdam XVI/Pattimura', 1, 'Kumdam XVI/Pattimura', '2021-07-27 00:00:00', 'Diarsipkan.', 1, NULL, NULL, NULL, NULL, 1633044599, NULL),
(199, 'R/201/VII/2021', '2021-07-15', '0000-00-00', 'Pengiriman berkas perkara Asusila dan Penganiayaan Tersangka a.n. Serma Hendrik D.Y. Lumatenine, NRP', 1, 'Polisi Militer Daerah Militer XVI/Pattimura Detase', '2021-07-29 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044600, NULL),
(200, '335/Pan.7/Srt.Pet/118K/Mil/202', '2021-07-29', '0000-00-00', 'Petikan putusan kasasi a.n terdakwa Muhammad Tatang Iskandar, Pratu NRP. 31140307310894', 1, 'Mahkamah Agung RI', '2021-07-29 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044601, NULL),
(201, 'R/260/VII/2021', '2021-07-27', '0000-00-00', 'Permohonan pemberhentian dengan tidak hormat (PDTH) dari dinas militer TNI-AD Yonif 731/Kabaresi', 1, 'Yonif 731/Kabaresi', '2021-08-02 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044602, NULL),
(202, 'R/166/VI/2021', '2021-06-30', '0000-00-00', 'Penyerahan berkas perkara a.n Serma Andi Victor Harianto, NRP. 21010154081181', 1, 'Kodam XVI/Pattimura', '2021-08-02 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044603, NULL),
(203, 'R/203/VII/2021', '2021-07-23', '0000-00-00', 'Pengiriman berkas perkara penjualan senjata api rakitan jenis pistol tersangka a.n Serka Yosepus Saa', 1, 'Denpom XVI/2', '2021-08-02 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044604, NULL),
(204, 'Kep/323/VII/2021', '2021-07-26', '0000-00-00', 'Penyerahan perkara tersangka a.n Praka Ismail Sosal, NRP. 31100263371289', 1, 'Brigif 27/Nusa Ina', '2021-08-02 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044605, NULL),
(205, 'B/358/VII/2021', '2021-07-21', '0000-00-00', 'Pemberitahuan tidak dapat menjalani pidana a.n Praka La Ode Lukma, NRP. 31080235511288', 1, 'Kodim 1507/Saumlaki', '2021-08-02 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044606, NULL),
(206, 'R/239/VII/2021', '2021-07-16', '0000-00-00', 'Laporan selesai menjalani pidana a.n Praka Idris Tehuayo, NRP. 31110240181288', 1, 'Brigif 27/Nusa Ina', '2021-08-03 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044607, NULL),
(207, 'B/576/VIII/2021', '2021-08-04', '0000-00-00', 'Panggilan menghadap persidangan Pengadilan Militer a.n terdakwa Serka Dimas Ari Setiawan, NRP. 21100', 1, 'Otmil IV-19 Ambon', '2021-08-04 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044608, NULL),
(208, 'B/575/VIII/2021', '2021-08-04', '0000-00-00', 'Panggilan menghadap persidangan Pengadilan Militer a.n terdakwa Serda Ardi Haris, NRP. 2119021398049', 1, 'Otmil IV-19 Ambon', '2021-08-04 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044609, NULL),
(209, 'B/573/VIII/2021', '2021-08-04', '0000-00-00', 'Panggilan menghadap persidangan Pengadilan Militer a.n terdakwa Serda Safuan, NRP. 31040261940982', 1, 'Otmil IV-19 Ambon', '2021-08-04 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044610, NULL),
(210, 'B/577/VIII/2021', '2021-08-04', '0000-00-00', 'Panggilan menghadap persidangan Pengadilan Militer a.n terdakwa Pratu Enjel Romero Sianturi, NRP. 31', 1, 'Otmil IV-19 Ambon', '2021-08-04 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044611, NULL),
(211, 'B/578/VIII/2021', '2021-08-04', '0000-00-00', 'Panggilan menghadap persidangan Pengadilan Militer (panggilan II) a.n terdakwa Kopda Pieter Alfons, ', 1, 'Otmil IV-19 Ambon', '2021-08-04 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044612, NULL),
(212, 'B/579/VIII/2021', '2021-08-04', '0000-00-00', 'Panggilan menghadap persidangan Pengadilan Militer (Panggilan II) a.n terdakwa Sertu La Arman, NRP. ', 1, 'Otmil IV-19 Ambon', '2021-08-04 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044613, NULL),
(213, 'B/556/VIII/2021', '2021-08-04', '0000-00-00', 'Panggilan menghadap persidangan Pengadilan Militer a.n terdakwa Sertu La Arman, NRP. 31980326030776', 1, 'Otmil IV-19 Ambon', '2021-08-04 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044614, NULL),
(214, 'B/562/VIII/2021', '2021-08-04', '0000-00-00', 'Pembebasan dari tahanan a.n terdakwa Pratu Muhammad Tatang Iskandar, NRP. 31140307310894', 1, 'Otmil IV-19 Ambon', '2021-08-04 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044615, NULL),
(215, 'B/569/VIII/2021', '2021-08-04', '0000-00-00', 'Pelaksanaan pidana penjara a.n terpidana Serda Wibowo Mukti, NRP. 21160081580796', 1, 'Otmil IV-19 Ambon', '2021-08-04 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044616, NULL),
(216, 'W.3 MIL/102/HK.01/VII/2021', '2021-07-14', '0000-00-00', 'Penetapan perpanjangan penahanan Kepala Pengadilan Militer Tinggi III Surabaya Nomor TAP/31-K/PMT.II', 1, 'PENGADILAN MILITER TINGGI III SURABAYA', '2021-08-04 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044617, NULL),
(217, '1007/Djmt/B/8/2021', '2021-08-04', '0000-00-00', 'Permintaan data sarana dan prasarana dalam rangka mendukung terlaksananya administrasi peradilan sec', 1, 'Mahkamah Agung RI Dirjen Badilmil dan Peradilan Ta', '2021-08-06 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044618, NULL),
(218, 'Sprin/312/VIII/2021', '2021-07-31', '0000-00-00', 'Sprin. segera merencanakan, menyiapkan,melaksanakan penyelidikan dan penyidikan tindak pidana kekera', 1, 'KODAM XVI/PATTIMURA RESIMEN INDUK', '2021-08-09 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044619, NULL),
(219, 'B/574/VIII/2021', '2021-08-04', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n terdakwa Serda Safuan, NRP. 31040261940982', 1, 'Otmil IV-19 Ambon', '2021-08-09 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044620, NULL),
(220, '347/Pan.7/Srt.Pet/117K/Mil/202', '2021-08-03', '0000-00-00', 'Petikan Putusan Kasasi a.n terdakwa Serka Panzer C Gaspersz, NRP. 21080797040788', 1, 'Mahkamah Agung RI', '2021-08-09 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044621, NULL),
(221, 'B/855/VIII/2021', '2021-08-03', '0000-00-00', 'Data pelanggaran anggota Rindam XVI/Pattimura yang belum tuntas proses hukumnya sampai dengan bulan ', 1, 'Kodam XVI/Pattimura', '2021-08-09 00:00:00', 'Diarsipkan.', 1, NULL, NULL, NULL, NULL, 1633044622, NULL),
(222, 'R/679/VIII/2021', '2021-08-02', '0000-00-00', 'Permohonan skep pemberhentian tidak hormat (PDTH) dari Dinas Militer TNI AD a.n Pratu Aprianus Jamla', 1, 'Kodam XVI/Pattimura', '2021-08-09 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044623, NULL),
(223, 'B/719/VII/2021', '2021-07-16', '0000-00-00', 'Permohonan rekomendasi keringanan hukuman untuk tidak dipecat terdakwa a.n Prada Hengki Tornado', 1, 'Kodam XVI/Pattimura', '2021-08-09 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044624, NULL),
(224, 'R/198/VII/2021', '2021-07-12', '0000-00-00', 'Pengiriman berkas Perkara Desersi Tersangka a.n. Kopda Husni Mulyadi NRP 31071463610187', 1, 'Polisi Militer Daerah Militer XVI/Pattimura Detase', '2021-08-10 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044625, NULL),
(225, 'B/161/VII/2021', '2021-07-31', '0000-00-00', 'Laporan kemajuan pelaksanaan Program Kerja Lemasmil IV Makassar bulan Juli TA 2021', 1, 'Lembaga permasyarakatan militer IV Makassar', '2021-08-10 00:00:00', 'Diarsipkan.', 1, NULL, NULL, NULL, NULL, 1633044626, NULL),
(226, '335/Pan.7/Srt.Pet/118K/Mil/2021', '2021-07-29', '0000-00-00', 'Petikan putusan kasasi a.n. terdakwa Muhammad Tatang Iskandar, Pratu NRP 31140307310894', 1, 'Mahkamah Agung RI', '2021-08-10 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044627, NULL),
(227, 'W3.Mil/31/HK.04/VII/2021', '2021-07-30', '0000-00-00', 'Salinan putusan pengadilan militer tinggi III Surabaya a.n. terdakwa Hengki Tornado, Prada NRP 31130', 1, 'PENGADILAN MILITER TINGGI III SURABAYA', '2021-08-10 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044628, NULL),
(228, 'W3.Mil/120/HK.01/VII/2021', '2021-07-30', '0000-00-00', 'Salinan putusan pengadilan militer tinggi III Surabaya a.n. terdakwa Hengki Tornado, Prada NRP 31130', 1, 'PENGADILAN MILITER TINGGI III SURABAYA', '2021-08-10 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044629, NULL),
(229, '347/Pan.7/Srt.Pet/117K/Mil/2021', '2021-08-03', '0000-00-00', 'Petikan Putusan Kasasi a.n. terdakwa Panzer C. Gaspersz, Serka NRP 21080797040788', 1, 'Mahkamah Agung RI', '2021-08-10 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044630, NULL),
(230, '305/Pan.7/SRT/117K/Mil/2021', '2021-07-06', '0000-00-00', 'Penerimaan berkas perkara kasasi pidana militer a.n. terdakwa Panser C. Gaspersz, Serka NRP 21080797', 1, 'Mahkamah Agung RI', '2021-08-10 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044631, NULL),
(231, '306/Pan.7/SRT/118K/Mil/2021', '2021-07-06', '0000-00-00', 'Penerimaan berkas perkara kasasi pidana militer a.n. terdakwa Muhammad Tatang Iskandar Pratu NRP 311', 1, 'Mahkamah Agung RI', '2021-08-10 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044632, NULL),
(232, 'B/590/VIII/2021', '2021-08-10', '0000-00-00', 'Panggilan menghadap persidangan Pengadilan Militer a.n terdakwa Sertu La Sam Wabula, NRP. 3104038199', 1, 'Otmil IV-19 Ambon', '2021-08-12 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044633, NULL),
(233, 'B/591/VIII/2021', '2021-08-10', '0000-00-00', 'Panggilan menghadap persidangan Pengadilan Militer a.n terdakwa Sertu Efendi Wael, NRP. 319707013302', 1, 'Otmil IV-19 Ambon', '2021-08-12 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044634, NULL),
(234, 'B/592/VIII/2021', '2021-08-10', '0000-00-00', 'Panggilan menghadap persidangan Pengadilan Militer a.n terdakwa Prada Jeferson Refutu, NRP. 31160667', 1, 'Otmil IV-19 Ambon', '2021-08-12 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044635, NULL),
(235, 'B/965/VIII/2021', '2021-08-09', '0000-00-00', 'Jawaban panggilan menghadap persidangan Pengadilan Militer a.n terdakwa Pratu Enjel Romero Sianturi,', 1, 'Kodam XVI/Pattimura', '2021-08-16 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044636, NULL),
(236, 'B/454/VII/2021', '2021-07-08', '0000-00-00', 'Jawaban panggilan menghadap persidangan Dilmil III-18 Ambon a.n terdakwa Kopda Pardi Ladjaenu, NRP. ', 1, 'Korem 151/Binaiya', '2021-08-16 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044637, NULL),
(237, 'B/413/VI/2021', '2021-06-28', '0000-00-00', 'Jawaban panggilan menghadap persidangan Dilmil III-18 Ambon a.n terdakwa Kopda Pardi Ladjaenu, NRP. ', 1, 'Korem 151/Binaiya', '2021-08-16 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044638, NULL),
(238, '1055/Djmt/B/8/2021', '2021-08-12', '0000-00-00', 'Pendamping untuk pemantapan pembangunan ZI menuju WBK/WBBM di lingkungan Peradilan Militer dan Perad', 1, 'Mahkamah Agung RI Dirjen Badilmil dan Peradilan Ta', '2021-08-16 00:00:00', 'Diarsipkan.', 1, NULL, NULL, NULL, NULL, 1633044639, NULL),
(239, 'R/293/VIII/2021', '2021-08-17', '0000-00-00', 'Jawaban Surat panggilan anggota Yonif 731/Kabresi a.n Kapten Inf Isaach Pasireron, NRP. 391034352117', 1, 'Brigif 27/Nusa Ina', '2021-08-19 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044640, NULL),
(240, 'Sprin/400/VIII/2021', '2021-08-17', '0000-00-00', 'Sprin. agar menghadap di persidangan Pengadilan Militer III-18 Ambon guna didengar keterangannya seb', 1, 'Brigif 27/Nusa Ina', '2021-08-19 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044641, NULL),
(241, 'B/599/VIII/2021', '2021-08-12', '0000-00-00', 'Panggilan menghadap persidangan Pengadilan Militer a.n terdakwa Sertu Brusly Edgar Rumodar, NRP. 319', 1, 'Otmil IV-19 Ambon', '2021-08-19 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044642, NULL),
(242, 'B/600/VIII/2021', '2021-08-13', '0000-00-00', 'Panggilan menghadap persidangan Pengadilan Militer a.n terdakwa Sertu Brusly Edgar Rumodar, NRP. 319', 1, 'Otmil IV-19 Ambon', '2021-08-19 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044643, NULL),
(243, 'B/595/VIII/2021', '2021-08-13', '0000-00-00', 'Panggilan menghadap persidangan Pengadilan Militer a.n terdakwa Prada Yohanes Andreas Saimima, NRP. ', 1, 'Otmil IV-19 Ambon', '2021-08-19 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044644, NULL),
(244, 'B/597/VIII/2021', '2021-08-13', '0000-00-00', 'Panggilan menghadap persidangan Pengadilan Militer a.n terdakwa Sertu Brusly Edgar Rumodar, NRP. 319', 1, 'Otmil IV-19 Ambon', '2021-08-19 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044645, NULL),
(245, 'W.3 MIL/34/HK.04/VIII/2021', '2021-08-10', '0000-00-00', 'Penetapan Penahanan Hakim Ketua Pengadilan Militer Tinggi Surabaya a.n terdakwa Pratu Randi Palio, N', 1, 'PENGADILAN MILITER TINGGI III SURABAYA', '2021-08-19 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044646, NULL),
(246, 'W.3 MIL/43/HK.07/VIII/2021', '2021-08-16', '0000-00-00', 'Penetapan Penahanan Hakim Ketua Pengadilan Militer Tinggi Surabaya a.n terdakwa Praka Milton Sialeky', 1, 'PENGADILAN MILITER TINGGI III SURABAYA', '2021-08-19 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044647, NULL),
(247, 'W.3 MIL/133/HK.01/VIII/2021', '2021-08-10', '0000-00-00', 'Penetapan Penahanan Hakim Ketua Pengadilan Militer Tinggi Surabaya a.n terdakwa Pratu Arifin Rumaf, ', 1, 'PENGADILAN MILITER TINGGI III SURABAYA', '2021-08-19 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044648, NULL),
(248, 'R/202/VII/2021', '2021-07-12', '0000-00-00', 'Pengiriman berkas perkara penganiayaan tersangka a.n. Praka Laban Gou NRP 31110274250389', 1, 'Polisi Militer Daerah Militer XVI/Pattimura Detase', '2021-08-19 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044649, NULL),
(249, 'Miltama/und/36/VIII/2021', '2021-08-18', '0000-00-00', 'Undangan pembukaan Bimtek Kepaniteraan Dilmiltama TA 2021 Secara Virtual', 1, 'Pengadilan militer utama', '2021-08-20 00:00:00', 'Diarsipkan.', 1, NULL, NULL, NULL, NULL, 1633044650, NULL),
(250, 'B/607/VIII/2021', '2021-08-18', '0000-00-00', 'Panggilan menghadap persidangan Pengadilan Militer a.n terdakwa Koptu Asperos Tomatalla, NRP. 310107', 1, 'Otmil IV-19 Ambon', '2021-08-20 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044651, NULL),
(251, 'B/608/VIII/2021', '2021-08-18', '0000-00-00', 'Panggilan menghadap persidangan Pengadilan Militer a.n terdakwa Praka Ismail Sosal, NRP. 31100263371', 1, 'Otmil IV-19 Ambon', '2021-08-20 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044652, NULL),
(252, 'B/605/VIII/2021', '2021-08-18', '0000-00-00', 'Panggilan menghadap persidangan Pengadilan Militer a.n terdakwa Serda Eric Setiawan, NRP. 2117012480', 1, 'Otmil IV-19 Ambon', '2021-08-20 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044653, NULL),
(253, 'B/610/VIII/2021', '2021-08-18', '0000-00-00', 'Panggilan menghadap persidangan Pengadilan Militer (Panggilan III) a.n terdakwa Kopda Pardi Ladjaenu', 1, 'Otmil IV-19 Ambon', '2021-08-20 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044654, NULL),
(254, 'B/612/VIII/2021', '2021-08-18', '0000-00-00', 'Panggilan menghadap persidangan Pengadilan Militer a.n terdakwa Prada M.Ardian Aminullah, NRP. 31180', 1, 'Otmil IV-19 Ambon', '2021-08-20 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044655, NULL),
(255, 'B/613/VIII/2021', '2021-08-18', '0000-00-00', 'Panggilan menghadap persidangan Pengadilan Militer a.n terdakwa Rijkan Kasiransyah, NRP. 31190948150', 1, 'Otmil IV-19 Ambon', '2021-08-20 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044656, NULL),
(256, 'B/615/VIII/2021', '2021-08-18', '0000-00-00', 'Panggilan menghadap persidangan Pengadilan Militer a.n terdakwa Serda Ardi Haris, NRP. 2119021398049', 1, 'Otmil IV-19 Ambon', '2021-08-20 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044657, NULL),
(257, 'R/503/VIII/2021', '2021-08-18', '0000-00-00', 'Laporan telah menjalani masa percobaan a.n terdakwa Serka Rahim Hamzah, NRP. 21060244620784', 1, 'Kodam XVI/Pattimura', '2021-08-23 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044658, NULL),
(258, 'R/118/VIII/2021', '2021-08-16', '0000-00-00', 'Permohonan penerbitan skep PDTH a.n terpidana Pratu Muhammad Tatang Iskandar, NRP. 31140307310894', 1, 'Kodam XVI/Pattimura', '2021-08-24 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044659, NULL),
(259, 'W27-U2/551/KS.00/8/2021', '2021-08-19', '0000-00-00', 'Penyampaian persetujuan penggunaan pinjam pakai ruang sidang PN. Masohi', 1, 'PENGADILAN NEGERI MASOHI', '2021-08-24 00:00:00', 'Diarsipkan.', 1, NULL, NULL, NULL, NULL, 1633044660, NULL),
(260, '368/Pan.7/VIII/2021/102/Pen/Ta', '2021-08-20', '0000-00-00', 'Salinan Penetapan Penahanan a.n Terdakwa Sakna Tambunan Pratu, NRP 31160006580295', 1, 'Mahkamah Agung RI', '2021-08-24 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044661, NULL),
(261, 'W.3 MIL/40/HK.04/VIII/2021', '2021-08-25', '0000-00-00', 'Penetapan perpanjangan penahanan kepala Pengadilan Militer Tinggi III Surabaya a.n terdakwa Pratu Ra', 1, 'PENGADILAN MILITER TINGGI III SURABAYA', '2021-08-24 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044662, NULL),
(262, 'W.3 MIL/143/HK.01/VIII/2021', '2021-08-25', '0000-00-00', 'Penetapan perpanjangan penahanan kepala Pengadilan Militer Tinggi III Surabaya a.n terdakwa Pratu Ar', 1, 'PENGADILAN MILITER TINGGI III SURABAYA', '2021-08-24 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044663, NULL),
(263, 'Miltama/Sprin/421/VIII/2021', '2021-08-19', '0000-00-00', 'Sprin penunjukkan sbg peserta bimbingan teknis kepaniteraan Dilmiltama TA 2021 pada hari Senin s.d R', 1, 'Pengadilan militer utama', '2021-08-24 00:00:00', 'Diarsipkan.', 1, NULL, NULL, NULL, NULL, 1633044664, NULL),
(264, 'Sprin/164/VIII/2021', '2021-08-16', '0000-00-00', 'Sprin. tugas dan tanggung jawab dalam jabatan sehari-hari agar bertindak sebagai penasehat hukum a.n', 1, 'Kodam XVI/Pattimura', '2021-08-24 00:00:00', 'Diarsipkan.', 1, NULL, NULL, NULL, NULL, 1633044665, NULL),
(265, 'Kep/1/I/2021', '2021-01-24', '0000-00-00', 'Sanksi Administratif a.n terdakwa Praka Idris Tehuayo, NRP. 31110240181288', 1, 'Brigif 27/Nusa Ina', '2021-08-24 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044666, NULL),
(266, 'Kep/3/I/2021', '2021-01-28', '0000-00-00', 'Sanksi Administratif a.n terdakwa Pratu Yesen Madamar, NRP. 31120308570190', 1, 'Brigif 27/Nusa Ina', '2021-08-24 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044667, NULL),
(267, 'B/730/VIII/2021', '2021-08-02', '0000-00-00', 'Pengiriman BP tersangka a.n Prada Marsal Bidji, NRP. 31200548080299,Jabatan Ta Denkav, Kesatuan Denk', 1, 'Kodam XVI/Pattimura', '2021-08-24 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044668, NULL),
(268, 'B/533/VIII/2021', '2021-08-23', '0000-00-00', 'Jawaban panggilan menghadap persidangan Dilmil III-18 Ambon a.n Sertu La Sam Wabula, NRP. 3104038199', 1, 'Korem 151/Binaiya', '2021-08-25 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044669, NULL),
(269, 'B/534/VIII/2021', '2021-08-23', '0000-00-00', 'Permohonan nasehat dan bantuan hukum a.n terdakwa Sertu Brusly Romodar, NRP. 3199028971079', 1, 'Pengadilan militer utama', '2021-08-25 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044670, NULL),
(270, 'R/95/VIII/2021', '2021-08-24', '0000-00-00', 'Permohonan Bantuan Hukum', 1, 'Kodam XVI/Pattimura', '2021-08-26 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044671, NULL),
(271, 'Sprin/406/VIII/2021', '2021-08-20', '0000-00-00', 'Sprin. menghadap di persidangan pengadilan militer III-18 Ambon a,n terdakwa Praka Ismail Sosal, NRP', 1, 'Brigif 27/Nusa Ina', '2021-08-26 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044672, NULL),
(272, 'B/923/VIII/2021', '2021-08-14', '0000-00-00', 'Jawaban panggilan menghadap persidangan pengadilan militer III-18 Ambon (Panggilan I)', 1, 'Brigif 27/Nusa Ina', '2021-08-26 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044673, NULL),
(273, 'B/629/VIII/2021', '2021-08-24', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer (Panggilan II) a.n terdakwa Prada Jeferson Refutu', 1, 'Otmil IV-19 Ambon', '2021-08-26 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044674, NULL),
(274, 'B/631/VIII/2021', '2021-08-25', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer (Panggilan II) a.n terdakwa Pratu Enjel Romero Si', 1, 'Otmil IV-19 Ambon', '2021-08-26 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044675, NULL),
(275, 'B/632/VIII/2021', '2021-08-25', '0000-00-00', 'Panggilan menghadap persidangan pengadilan miliet (Panggilan I) a.n terdakwa Sertu La Sam Wabula, NR', 1, 'Otmil IV-19 Ambon', '2021-08-26 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044676, NULL),
(276, 'B.201/BUD/08/2021', '2021-08-26', '0000-00-00', 'Permohonan salinan putusan perkara a.n terdakwa Wibowo Mukti', 1, 'Bank Rakyat Indonesia (BRI) Cabang Ammbon Unit Amb', '2021-08-29 00:00:00', 'Diarsipkan.', 1, NULL, NULL, NULL, NULL, 1633044677, NULL),
(277, 'B/543/VIII/2021', '2021-08-24', '0000-00-00', 'Jawaban ke III Panggilan menghadap persidangan Dilmil III-18 Ambon a.n terdakwa Kopda Pardi Ladjaenu', 1, 'Korem 151/Binaiya', '2021-08-31 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044678, NULL),
(278, 'Sprin/187/VIII/2021', '2021-08-30', '0000-00-00', 'Sprin. tugas dan tanggung jawab dalam jabatannya sehari-hari agar bertindak sebagai penasehat hukum ', 1, 'Kodam XVI/Pattimura', '2021-09-05 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044679, NULL),
(279, 'Sprin/188/VIII/2021', '2021-08-30', '0000-00-00', 'Sprin. tugas dan tanggung jawabnya sehari-hari agar bertindak sebagai penasehat hukum a.n Kapten Ckm', 1, 'Kodam XVI/Pattimura', '2021-09-05 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044680, NULL),
(280, 'Sprin/182/VIII/2021', '2021-08-27', '0000-00-00', 'Sprin. tugas dan tanggung jawab dalam jabatannya sehari-hari agar bertindak sebagai penasehat hukum ', 1, 'Kodam XVI/Pattimura', '2021-09-05 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044681, NULL),
(281, 'Sprin/181/VIII/2021', '2021-08-27', '0000-00-00', 'Sprin. tugas dan tanggung jawab dalam jabatannya sehari-hari agar bertindak sebagai penasehat hukum ', 1, 'Kodam XVI/Pattimura', '2021-09-05 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044682, NULL),
(282, 'B/604/VIII/2021', '2021-08-16', '0000-00-00', 'Penitapan tahanan a.n terdakwa Serda Ardi Haris, NRP. 21190213980499', 1, 'Otmil IV-19 Ambon', '2021-09-05 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044683, NULL),
(283, 'B/643/VIII/2021', '2021-08-30', '0000-00-00', 'Panggilan menghadap persidangan pengadilan Militer a.n terdakwa Serda Safuan, NRP. 31040261940982', 1, 'Otmil IV-19 Ambon', '2021-09-05 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044684, NULL),
(284, 'B/644/VIII/2021', '2021-08-30', '0000-00-00', 'Panggilan menghadap persidangan pengadilan Militer sebagai saksi a.n terdakwa Serda Safuan, NRP. 310', 1, 'Otmil IV-19 Ambon', '2021-09-05 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044685, NULL),
(285, 'B/648/IX/2021', '2021-09-01', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n terdakwa Kapten Isach Pasireron, NRP. 3910343', 1, 'Otmil IV-19 Ambon', '2021-09-05 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044686, NULL),
(286, 'B/639/VIII/2021', '2021-08-26', '0000-00-00', 'Pemberitahuan putusan dan usul PDTH a.n terdakwa Pratu Muhammad Tatang Iskandar , NRP. 3114030731089', 1, 'Otmil IV-19 Ambon', '2021-09-05 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044687, NULL),
(287, 'W.3 MIL/42/HK.07/VIII/2021', '2021-08-12', '0000-00-00', 'Penerimaan berkas perkara banding a.n. Terdakwa Randi Palio, Prada, NRP 31120303030293', 1, 'PENGADILAN MILITER TINGGI III SURABAYA', '2021-09-05 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044688, NULL),
(288, 'W.3 MIL/41/HK.07/VIII/2021', '2021-08-12', '0000-00-00', 'Penerimaan berkas perkara Banding a.n. Terdakwa Arifin Rumaf, Prada, NRP 31120611750392', 1, 'PENGADILAN MILITER TINGGI III SURABAYA', '2021-09-05 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044689, NULL),
(289, 'Sprin/445/IX/2021', '2021-09-03', '0000-00-00', 'Sprin. untuk menghadap persidangan pengadilan militer III-18 ambon sebagai saksi dalam perkara terda', 1, 'Brigif 27/Nusa Ina', '2021-09-06 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044690, NULL),
(290, 'B/658/IX/2021', '2021-09-06', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer (Panggilan III) a.n terdakwa Sertu La Arman, NRP.', 1, 'Otmil IV-19 Ambon', '2021-09-06 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044691, NULL),
(291, 'B/659/IX/2021', '2021-09-06', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n terdakwa Sertu Efendi Wael, NRP. 319707013302', 1, 'Otmil IV-19 Ambon', '2021-09-06 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044692, NULL),
(292, 'B/656/IX/2021', '2021-09-06', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n terdakwa Pratu Makruf, NRP. 31140378680492', 1, 'Otmil IV-19 Ambon', '2021-09-06 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044693, NULL),
(293, 'B/665/IX/2021', '2021-09-06', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n terdakwa Sertu Frengky Machartur Hendambo, NR', 1, 'Otmil IV-19 Ambon', '2021-09-06 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044694, NULL),
(294, 'B/167/VIII/2021', '2021-09-06', '0000-00-00', 'Laporan kemajuan pelaksanaan program kerja Lemasmil IV Makassar bulan agustus TA 2021', 1, 'Lembaga permasyarakatan militer IV Makassar', '2021-09-06 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044695, NULL),
(295, '364/Pan.7/SRT/129 K/MIL/2021', '2021-08-19', '0000-00-00', 'Penerimaan berkas perkara kasasi pidana militer a.n terdakwa Pratu Sakna Tambunan, NRP. 311600065802', 1, 'Mahkamah Agung RI', '2021-09-06 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044696, NULL),
(296, 'W.3 MIL/44/HK.07/VIII/2021', '2021-08-30', '0000-00-00', 'Penerimaan berkas perkara banding a.n terdakwa Praka Milton Sialeky, NRP. 31110568530992', 1, 'PENGADILAN MILITER TINGGI III SURABAYA', '2021-09-06 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044697, NULL),
(297, 'R/139/IX/2021', '2021-09-04', '0000-00-00', 'Permohonan bantuan pencarian dan penangkapan a.n Prada Lajanu Koipoy', 1, 'Kodam XVI/Pattimura', '2021-09-13 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044698, NULL),
(298, 'R/137/IX/2021', '2021-09-03', '0000-00-00', 'Laporan tindak pidana Desersi dimasa damai a.n Prada Lajanu Koipoy, NRP. 31190849800900', 1, 'Kodam XVI/Pattimura', '2021-09-13 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044699, NULL),
(299, 'Sprin/193/IX/2021', '2021-09-02', '0000-00-00', 'Sprin. tugas dan tanggung jawab sehari-hari agar bertindak sebagai penasehat hukum a.n Mayor Czi Eka', 1, 'Kodam XVI/Pattimura', '2021-09-13 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044700, NULL),
(300, 'Kep/499-18/VIII/2021', '2021-08-16', '0000-00-00', 'Pemberhentian denagn tindak hormat dari Dinas Keprajuritan TNI Angkatan Darat', 1, 'Kodam XVI/Pattimura', '2021-09-13 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044701, NULL),
(301, 'B/1011/IX/2021', '2021-09-06', '0000-00-00', 'Data Pelanggaran', 1, 'Otmil IV-19 Ambon', '2021-09-13 00:00:00', 'Diarsipkan.', 1, NULL, NULL, NULL, NULL, 1633044702, NULL),
(302, 'B/666/IX/2021', '2021-09-08', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer (Panggilan III) a.n terdakwa Prada Jeferson Refut', 1, 'Otmil IV-19 Ambon', '2021-09-13 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044703, NULL),
(303, 'B/667/IX/2021', '2021-09-08', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer (Panggilan III) a.n terdakwa Kopda Pieter Alfons,', 1, 'Otmil IV-19 Ambon', '2021-09-13 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044704, NULL),
(304, 'B/668/IX/2021', '2021-09-08', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer (Panggilan III) a.n terdakwa Pratu Enjel Romero S', 1, 'Otmil IV-19 Ambon', '2021-09-13 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044705, NULL),
(305, 'B/669/IX/2021', '2021-09-08', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer (Panggilan III) a.n terdakwa Sertu La Sam Wabula,', 1, 'Otmil IV-19 Ambon', '2021-09-13 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044706, NULL),
(306, 'B/670/IX/2021', '2021-09-08', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n terdakwa Pratu Marlon Benamen, NRP. 311603254', 1, 'Otmil IV-19 Ambon', '2021-09-13 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044707, NULL),
(307, 'B/671/IX/2021', '2021-09-08', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n terdakwa Serda Taufik Parlindah, NRP. 3101061', 1, 'Otmil IV-19 Ambon', '2021-09-13 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044708, NULL),
(308, 'B/672/IX/2021', '2021-09-08', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n terdakwa Kopda Husni Mulyadi, NRP. 3107146361', 1, 'Otmil IV-19 Ambon', '2021-09-13 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044709, NULL),
(309, 'B/673/IX/2021', '2021-09-08', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n terdakwa Praka Selwanus Jaflaun, NRP. 3109058', 1, 'Otmil IV-19 Ambon', '2021-09-13 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044710, NULL),
(310, 'W.3 MIL/46/HK.07/IX/2021', '2021-09-08', '0000-00-00', 'Penetapan penahanan Hakim Ketua Pengadilan Militer Tinggi III Surabaya a.n terdakwa Koptu Petrus Bat', 1, 'PENGADILAN MILITER TINGGI III SURABAYA', '2021-09-13 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044711, NULL),
(311, 'W.3 MIL/47/HK.07/IX/2021', '2021-09-10', '0000-00-00', 'Penetapan perpanjangan penahanan Hakim Ketua Pengadilan Militer Tinggi III Surabaya a.n terdakwa Pra', 1, 'PENGADILAN MILITER TINGGI III SURABAYA', '2021-09-13 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044712, NULL),
(312, '396/Pan.7/IX/2021/112/Pen/Tah/', '2021-09-13', '0000-00-00', 'Salinan penetapan penahanan ketua muda urusan lingkungan Peradilan Militer a.n terdakwa Prada Hengki', 1, 'Mahkamah Agung RI', '2021-09-14 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044713, NULL),
(313, '395/Pan.7/IX/2021/113/Pen/Tah/', '2021-09-13', '0000-00-00', 'Salinan penetapan penahanan ketua muda urusan lingkungan Peradilan Militer a.n terdakwa Prada Hengki', 1, 'Mahkamah Agung RI', '2021-09-14 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044714, NULL),
(314, 'B/547/VIII/2021', '2021-08-23', '0000-00-00', 'Jawaban ke II Panggilan menghadap persidangan Dilmil III-18 Ambon a.n terdakwa Sertu La Sam Wabula ,', 1, 'Korem 151/Binaiya', '2021-09-15 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044715, NULL),
(315, 'B/578/IX/2021', '2021-09-09', '0000-00-00', 'Jawaban ke III panggilan menghadap persidangan Dilmil III-18 Ambon a.n terdakwa Sertu La Sam Wabula,', 1, 'Korem 151/Binaiya', '2021-09-17 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044716, NULL),
(316, 'B/308/IX/2021', '2021-09-14', '0000-00-00', 'Permohonan bantuan hukum agar dapat mendampingi Tersangka a.n Serka Mustari Nunlehu, NRP. 640199', 1, 'Kodam XVI/Pattimura', '2021-09-17 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044717, NULL),
(317, 'R/248/IX/2021', '2021-09-03', '0000-00-00', 'Pengiriman berkas perkara kekerasan dalam rumah tangga a.n tersangka Praka Praka Lalu Rian Lesmana, ', 1, 'Polisi Militer Daerah Militer XVI/Pattimura', '2021-09-20 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044718, NULL),
(318, 'R/250/IX/2021', '2021-09-06', '0000-00-00', 'Pengiriman berkas perkara perzinahan a.n tersangka Praka Melky Berty Benhot Beay, NRP. 3107114542058', 1, 'Polisi Militer Daerah Militer XVI/Pattimura', '2021-09-20 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044719, NULL),
(319, 'R/145/IX/2021', '2021-09-13', '0000-00-00', 'Laporan kembali Desersi a.n Prada lajanu Koifuy, NRP, 31190849800900', 1, 'Kodam XVI/Pattimura', '2021-09-20 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044720, NULL),
(320, 'R/146/IX/2021', '2021-09-13', '0000-00-00', 'Pelimpahan perkara tindak pidana Desersi dimasa damai a.n Prada Lajanu Koifuy, NRP. 31190849800900', 1, 'Kodam XVI/Pattimura', '2021-09-20 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044721, NULL),
(321, 'Sprin/883/IX/2021', '2021-09-13', '0000-00-00', 'Sprin. agar menghadap di persidangan Pengadilan Militer III-18 Ambon', 1, 'Kodam XVI/Pattimura', '2021-09-20 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044722, NULL),
(322, 'Kep/33/ix/2021', '2021-09-13', '0000-00-00', 'Penahanan sementara komandan batalyon infanteri raider 733/masariku', 1, 'Kodam XVI/Pattimura', '2021-09-20 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044723, NULL),
(323, 'B/1150/IX/2021', '2021-09-13', '0000-00-00', 'Jawaban panggilan ke III (Tiga) menghadap persidangan pengadilan militer a.n terdakwa Pratu Enjel Ro', 1, 'Kodam XVI/Pattimura', '2021-09-20 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044724, NULL),
(324, 'B/071/VIII/2021', '2021-08-27', '0000-00-00', 'Jawaban panggilan ke II (Dua) menghadap persidangan pengadilan militer a.n terdakwa Pratu Enjel Rome', 1, 'Kodam XVI/Pattimura', '2021-09-20 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044725, NULL),
(325, 'B/1005/VIII/2021', '2021-08-28', '0000-00-00', 'Jawaban panggilan menghadap persidangan pengadilan milter III-18 Ambon (Panggilan II) a.n terdakwa P', 1, 'Brigif 27/Nusa Ina', '2021-09-20 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044726, NULL),
(326, 'B/691/IX/2021', '2021-09-16', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n terdakwa Serma Andi Victor Harianto, NRP. 210', 1, 'Otmil IV-19 Ambon', '2021-09-20 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044727, NULL),
(327, 'Spang/39/IX/2021', '2021-09-14', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n terdakwa Sertu Frengky Machartur Hendambo, NR', 1, 'Odmil IV-19 Ambon', '2021-09-20 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044728, NULL),
(328, 'Sprin/573/IX/2021', '2021-09-13', '0000-00-00', 'Sprin. pergi ke makassar dalam rangka menjalankan pidana penjara a.n terdakwa Praka Amiruddin Lessy,', 1, 'Lanud XVI/Ptm', '2021-09-20 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044729, NULL),
(329, 'sprin/888/IX/2021', '2021-09-09', '0000-00-00', 'Sprin. menghadap ke otmil IV-19 Ambon a.n terdakwa Serka Panzer C Gaspersz, NRP. 21080797040788', 1, 'Kodam XVI/Pattimura', '2021-09-20 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044730, NULL),
(330, 'Sprin/456/IX/2021', '2021-09-08', '0000-00-00', 'Sprin. untuk melaksanakan pengawalan terhadap terdakwa ke otmil IV-19 Ambon', 1, 'Brigif 27/Nusa Ina', '2021-09-20 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044731, NULL),
(331, 'Sprin/602/IX/2021', '2021-09-08', '0000-00-00', 'Sprin. untuk menghadap ke otmil IV-19 Ambon a.n terdakwa Serda Eric Setiawan, NRP. 21170124800597', 1, 'Kodam XVI/Pattimura', '2021-09-20 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044732, NULL),
(332, 'Sprin/603/IX/2021', '2021-09-08', '0000-00-00', 'Sprin. untuk Praka Dellon Dickinson , NRP. 31100248370888 agar mengawal terdakwa a.n Serda Eric Seti', 1, 'Kodam XVI/Pattimura', '2021-09-20 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044733, NULL),
(333, 'R/254/IX/2021', '2021-09-10', '0000-00-00', 'Pengiriman berkas perkara Desersi tersangka a.n Praka Firmansyah Sairon, NRP. 3110024360190', 1, 'Denpom XVI/Masohi', '2021-09-21 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044734, NULL),
(334, 'B/1080/IX/2021', '2021-09-13', '0000-00-00', 'Jawaban panggilan menghadap persidangan pengadilan militer III-18 ambon (panggilan III)', 1, 'Brigif 27/Nusa Ina', '2021-09-21 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044735, NULL),
(335, '1308/Djmt/B/9/2021', '2021-09-17', '0000-00-00', 'Penyampaian bahan rapat koordinasi pimpinan pengadilan', 1, 'Mahkamah Agung RI Dirjen Badilmil dan Peradilan Ta', '2021-09-21 00:00:00', 'Diarsipkan.', 1, NULL, NULL, NULL, NULL, 1633044736, NULL),
(336, 'B/696/IX/2021', '2021-09-17', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer (panggilan II) dalam perkara a.n Serda Taufik Par', 1, 'Odmil IV-19 Ambon', '2021-09-21 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044737, NULL),
(337, 'W.3 Mil/161/HK.01/IX/2021', '2021-09-20', '0000-00-00', 'Taphan atas nama terdakwa Serda Ardi Haris, NRP 21190213980499', 1, 'PENGADILAN MILITER TINGGI III SURABAYA', '2021-09-22 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044738, NULL),
(338, 'B/675/IX/2021', '2021-09-22', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n. Terdakwa Serda Nikson Elieser Manuhutu NRP. ', 1, 'Otmil IV-19 Ambon', '2021-09-23 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044739, NULL),
(339, 'B/676/IX/2021', '2021-09-22', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n. Terdakwa Kopda Bernadus Rumlus NRP. 31081861', 1, 'Otmil IV-19 Ambon', '2021-09-23 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044740, NULL),
(340, 'B/677/IX/2021', '2021-09-22', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n. Terdakwa Pratu Suarno Soamole NRP.3109050117', 1, 'Otmil IV-19 Ambon', '2021-09-23 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044741, NULL),
(341, 'B/678/IX/2021', '2021-09-22', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n. Terdakwa Sertu Almendo Haloham NRP. 21141100', 1, 'Otmil IV-19 Ambon', '2021-09-23 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044742, NULL),
(342, 'B/679/IX/2021', '2021-09-22', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n. Terdakwa Kopda Bernadus Rumlus NRP. 31081861', 1, 'Otmil IV-19 Ambon', '2021-09-23 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044743, NULL),
(343, 'B/697/IX/2021', '2021-09-22', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n. Terdakwa Pratu Marlon Benamen NRP. 311603254', 1, 'Otmil IV-19 Ambon', '2021-09-23 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044744, NULL),
(344, 'Kep/04/IX/2021', '2021-09-17', '0000-00-00', 'Sanksi Administratif a.n. Terdakwa Praka Ismail Sosal, NRP.31100263371289', 1, 'Yonif 731/Kabaresi', '2021-09-24 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044745, NULL),
(345, 'Sprin/203/IX/2021', '2021-09-17', '0000-00-00', 'Sprin agar bertindak sebagai penasehat hukum a.n. Serka Mustari Nunlehu, NRP.640199', 1, 'Kodam XVI/Pattimura', '2021-09-24 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044746, NULL),
(346, 'R/154/IX/2021', '2021-09-22', '0000-00-00', 'Pelimpahan Perkara Tindak Pidana Pelecehan Seksual atau Asusila a.n. Letda Inf Okki Abdurrazaaq.S.Tr', 1, 'Kodam XVI/Pattimura', '2021-09-24 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044747, NULL),
(347, 'Kep/34/IX/2021', '2021-09-22', '0000-00-00', 'Penahanan sementara a.n. terdakwa Letda Okki Abdurrazaaq.S.Tr. (Han)', 1, 'Yonif Raider 733/Masariku', '2021-09-24 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044748, NULL),
(348, 'B/109/Bebas/IX/2021', '2021-09-16', '0000-00-00', 'Pembebasan narapidana Militer a.n. Pratu Isak Bach NRP 311606992705', 1, 'Lembaga permasyarakatan militer IV Makassar', '2021-09-24 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044749, NULL),
(349, 'B/683/IX/2021', '2021-09-22', '0000-00-00', 'Penitipan tahanan a.n. terdakwa Pratu Makruf, NRP 31140378680492', 1, 'Otmil IV-19 Ambon', '2021-09-24 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044750, NULL);
INSERT INTO `surat_masuk` (`id_surat_masuk`, `no_surat`, `tgl_surat`, `tgl_terima`, `perihal`, `id_jenis_surat`, `pengirim`, `kode_klasifikasi`, `deskripsi`, `id_petugas`, `nilai_guna`, `media`, `kondisi`, `satuan_lampiran`, `dibuat_pada`, `berkas_surat`) VALUES
(350, 'B/706/IX/2021', '2021-09-23', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n. terdakwa Sertu Syafrudin, NRP. 2118009857129', 1, 'Otmil IV-19 Ambon', '2021-09-24 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044751, NULL),
(351, 'B/707/IX/2021', '2021-09-23', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n. terdakwa Serka Dedi Handoko, NRP.21080726910', 1, 'Otmil IV-19 Ambon', '2021-09-24 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044752, NULL),
(352, 'B/708/IX/2021', '2021-09-23', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n. terdakwa Sertu Budi Wahyono, NRP.31000567240', 1, 'Otmil IV-19 Ambon', '2021-09-24 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044753, NULL),
(353, 'B/508/IX/2021', '2021-09-14', '0000-00-00', 'Usul pemberhentian dengan tidak hormat (PDTH) Praka La Ode Lukman, NRP.31080235511288', 1, 'Otmil IV-19 Ambon', '2021-09-24 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044754, NULL),
(354, 'B/1364/IX/2021', '2021-09-20', '0000-00-00', 'Permohonan keputusan pemberhentian dengan tidak hormat (PDTH) dari Dinas Militer TNI AD', 1, 'Korem 151/Binaiya', '2021-09-24 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044755, NULL),
(355, 'W.3 MIL/158/HK.01/IX/2021', '2021-09-17', '0000-00-00', 'Pengajuan Berkas perkara a.n. terdakwa Pratu Arifin Rumaf, NRP.31120611750392', 1, 'PENGADILAN MILITER TINGGI III SURABAYA', '2021-09-24 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044756, NULL),
(356, 'W.3 MIL/46/HK.04/IX/2021', '2021-09-17', '0000-00-00', 'Pengajuan berkas perkara a.n. terdakwa Pratu Randi Palio, NRP.31120303030293', 1, 'PENGADILAN MILITER TINGGI III SURABAYA', '2021-09-24 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044757, NULL),
(357, 'B/619/IX/2021', '2021-09-23', '0000-00-00', 'Permohonan keringanan Hukuman a.n terdakwa Serma Hendrik Dhunad Yokobus Lumatenina, NRP. 21040263110', 1, 'Komandan Deninteldam XVI/Pattimura', '2021-09-27 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044758, NULL),
(358, 'B/713/IX/2021', '2021-09-24', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n terdakwa Kopda Abdul Hair Lating, NRP. 310903', 1, 'Otmil IV-19 Ambon', '2021-09-27 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044759, NULL),
(359, 'B/714/IX/2021', '2021-09-24', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n terdakwa Prada Mizak Nouw, NRP.3119085680597', 1, 'Otmil IV-19 Ambon', '2021-09-27 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044760, NULL),
(360, 'B/715/IX/2021', '2021-09-24', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n terdakwa Pratu Irman Ode, NRP. 31140362580894', 1, 'Otmil IV-19 Ambon', '2021-09-27 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044761, NULL),
(361, 'B/175/IX/2021', '2021-09-20', '0000-00-00', 'Laporan penerimaan Napimil Pidana a.n. Praka Ismail Sosal, NRP 31100263371289', 1, 'Lembaga permasyarakatan militer IV Makassar', '2021-09-28 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044762, NULL),
(362, 'B/176/IX/2021', '2021-09-20', '0000-00-00', 'Laporan penerimaan Napimil Pidana a.n. Praka Amirudin Lessy, NRP 539616', 1, 'Lembaga permasyarakatan militer IV Makassar', '2021-09-28 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044763, NULL),
(363, 'B/177/IX/2021', '2021-09-20', '0000-00-00', 'Laporan penerimaan Napimil Pidana a.n. Serka Panzer. C. Gaspersz, NRP 21080797040788', 1, 'Lembaga permasyarakatan militer IV Makassar', '2021-09-28 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044764, NULL),
(364, 'B/178/IX/2021', '2021-09-20', '0000-00-00', 'Laporan penerimaan Napimil Pidana a.n. Serda Eric Setiawan, NRP.21170124800597', 1, 'Lembaga permasyarakatan militer IV Makassar', '2021-09-28 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044765, NULL),
(365, 'B/179/IX/2021', '2021-09-22', '0000-00-00', 'Laporan Napimil sakit dan dirawat di RS.TK.II Pelamonia a.n. Koptu Zainal Abidin Ollong, NRP 3101035', 1, 'Lembaga permasyarakatan militer IV Makassar', '2021-09-28 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044766, NULL),
(366, '165/Djmt/Ratgas/9/2021', '2021-09-24', '0000-00-00', 'Pendampingan zona integritas ke satker di lingkungan Dirjenbadilmiltun', 1, 'Mahkamah Agung RI Dirjen Badilmil dan Peradilan Ta', '2021-09-28 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044767, NULL),
(367, '1358/Djmt/B/9/2021', '2021-09-23', '0000-00-00', 'Pemanggilan peserta Bimtek Panitera/Panitera pengganti di lingkungan peradilan Militer TA 2021', 1, 'Mahkamah Agung RI Dirjen Badilmil dan Peradilan Ta', '2021-09-28 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044768, NULL),
(368, 'W.3 Mil/52/HK.04/IX/2021', '2021-09-24', '0000-00-00', 'Penerimaan berkas perkara banding a.n terdakwa Koptu Petrus Batmomolin, NRP 31040399400584', 1, 'PENGADILAN MILITER TINGGI III SURABAYA', '2021-09-29 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044769, NULL),
(369, 'W.3 Mil/51/HK.04/IX/2021', '2021-09-24', '0000-00-00', 'Taphan a.n. terdakwa Prada Yohanes Andres Saimima, NRP 31190370121199', 1, 'PENGADILAN MILITER TINGGI III SURABAYA', '2021-09-29 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044770, NULL),
(370, 'W.3Mil/56/HK.07/IX/2021', '2021-09-24', '0000-00-00', 'Berkas Perkara, salinan putusan, petikan putusan dan penetapan hakim a.n. terdakwa Praka Milton Sial', 1, 'PENGADILAN MILITER TINGGI III SURABAYA', '2021-09-29 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044771, NULL),
(371, 'B/722/IX/2021', '2021-09-28', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer. (Panggilan III)', 1, 'Otmil IV-19 Ambon', '2021-09-30 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044772, NULL),
(372, '-', '2021-09-28', '0000-00-00', 'Undangan mengikuti peringatan Hari Ulang Tahun Dharmayukti Karini XIX pada hari Jumat 1 Oktober 2021', 1, 'Pengurus Dharmayukti Karini Cabang Ambon', '2021-10-01 00:00:00', 'Diarsipkan.', 1, NULL, NULL, NULL, NULL, 1633044773, NULL),
(373, 'B/724/IX/2021', '2021-09-30', '0000-00-00', 'Panggilan menghadap persidangan Pengadilan Militer (Panggilan II) a.n saksi Ronaldo Awiara, Prajiuri', 1, 'Otmil IV-19 Ambon', '2021-10-04 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044774, NULL),
(374, '130/Pan.7/BKS/94K/Mil/2021', '2021-09-21', '0000-00-00', 'Permohonan Kasasi dari terdakwa Eko Irianto, Prada NRP. 31180881490799', 1, 'Mahkamah Agung RI', '2021-10-04 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044775, NULL),
(375, 'Miltama/B/1024/X/2021', '2021-10-01', '0000-00-00', 'Pengiriman daftar permasalahan Teknis Tahun 2021', 1, 'Pengadilan militer utama', '2021-10-06 00:00:00', 'Diarsipkan.', 1, NULL, NULL, NULL, NULL, 1633044776, NULL),
(376, 'B/113/Bebas/IX/2021', '2021-09-02', '0000-00-00', 'Pembebasan Narapidana Militer a.n. Sertu (K) Lin C D NRP 21140107500693', 1, 'Lembaga permasyarakatan militer IV Makassar', '2021-10-06 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044777, NULL),
(377, 'B/727/X/2021', '2021-10-04', '0000-00-00', 'Pemberitahuan penyelesaian perkara pelanggaran lalu lintas a.n terdakwa Sertu Almendo Haloham, NRP. ', 1, 'Otmil IV-19 Ambon', '2021-10-06 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044778, NULL),
(378, 'B/728/X/2021', '2021-10-04', '0000-00-00', 'Pemberitahuan penyelesaian perkara pelanggaran lalu lintas a.n terdakwa Pratu Suarno Soamole, NRP. 3', 1, 'Otmil IV-19 Ambon', '2021-10-06 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044779, NULL),
(379, 'B/729/X/2021', '2021-10-04', '0000-00-00', 'Pemberitahuan penyelesaian perkara pelanggaran lalu lintas a.n terdakwa Serka Deymon Peter Latuhihin', 1, 'Otmil IV-19 Ambon', '2021-10-06 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044780, NULL),
(380, 'B/730/X/2021', '2021-10-04', '0000-00-00', 'Pemberitahuan penyelesaian perkara pelanggaran lalu lintas a.n terdakwa Serda Nikson Elieser Manuhut', 1, 'Otmil IV-19 Ambon', '2021-10-06 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044781, NULL),
(381, 'B/731/X/2021', '2021-10-04', '0000-00-00', 'Pemberitahuan penyelesaian perkara pelanggaran lalu lintas a.n terdakwa Kopda Bernadus Rumlus, NRP. ', 1, 'Otmil IV-19 Ambon', '2021-10-06 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044782, NULL),
(382, 'B/732/X/2021', '2021-10-04', '0000-00-00', 'Pemberitahuan penyelesaian perkara pelanggaran lalu lintas a.n terdakwa Prada Rajikan Kasiransyah, N', 1, 'Otmil IV-19 Ambon', '2021-10-06 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044783, NULL),
(383, 'B/734/X/2021', '2021-10-04', '0000-00-00', 'Pemberitahuan penyelesaian perkara pelanggaran lalu lintas a.n terdakwa Serka Dedi Handoko, NRP. 210', 1, 'Otmil IV-19 Ambon', '2021-10-06 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044784, NULL),
(384, 'B/735/X/2021', '2021-10-04', '0000-00-00', 'Pemberitahuan penyelesaian perkara pelanggaran lalu lintas a.n terdakwa Kopda Abdul Hair, NRP. 31090', 1, 'Otmil IV-19 Ambon', '2021-10-06 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044785, NULL),
(385, 'B/736/X/2021', '2021-10-04', '0000-00-00', 'Pemberitahuan penyelesaian perkara pelanggaran lalu lintas a.n terdakwa Pratu Irman Ode, NRP. 311403', 1, 'Otmil IV-19 Ambon', '2021-10-06 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044786, NULL),
(386, 'B/737/X/2021', '2021-10-04', '0000-00-00', 'Pemberitahuan penyelesaian perkara pelanggaran lalu lintas a.n terdakwa Sertu Syafrudin, NRP. 211800', 1, 'Otmil IV-19 Ambon', '2021-10-06 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044787, NULL),
(387, 'B/738/X/2021', '2021-10-04', '0000-00-00', 'Pemberitahuan penyelesaian perkara pelanggaran lalu lintas a.n terdakwa Sertu Budi Wahyono, NRP. 310', 1, 'Otmil IV-19 Ambon', '2021-10-06 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044788, NULL),
(388, 'B/739/X/2021', '2021-10-05', '0000-00-00', 'Pemberitahuan penyelesaian perkara pelanggaran lalu lintas a.n terdakwa Prada Mizak Nouw, NRP. 31190', 1, 'Otmil IV-19 Ambon', '2021-10-06 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044789, NULL),
(389, 'R/281/IX/2021', '2021-09-28', '0000-00-00', 'Laporan telah kembali ke satuan Anggota Desersi a.n Pratu Pius Yonas Philips Kakare, NRP. 3116069943', 1, 'Kodam XVI/Pattimura, Detasemen Zeni Tempur 5/CMG', '2021-10-11 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044790, NULL),
(390, 'Kep/30/IX/2021', '2021-09-29', '0000-00-00', 'Penahanan Sementara a.n terdakwa Pratu Pius Yonas Philips Kakare, NRP. 31160699430694', 1, 'Kodam XVI/Pattimura, Detasemen Zeni Tempur 5/CMG', '2021-10-11 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044791, NULL),
(391, 'B/745/X/2021', '2021-10-08', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer (panggilan III) a.n. terdakwa Ronaldo Awiara seba', 1, 'Otmil IV-19 Ambon', '2021-10-11 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044792, NULL),
(392, 'B/763/X/2021', '2021-10-08', '0000-00-00', 'Panggilan menjalani pidana dan usul PDTH a.n. terpidana Kopda Pardi Ladjaenu, NRP 31100260890989', 1, 'Otmil IV-19 Ambon', '2021-10-11 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044793, NULL),
(393, 'B/749/X/2021', '2021-10-08', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer (panggilan II)', 1, 'Otmil IV-19 Ambon', '2021-10-11 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044794, NULL),
(394, 'B/750/X/2021', '2021-10-08', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n. terdakwa Serda La Ode Zani Asmin, NRP. 31960', 1, 'Otmil IV-19 Ambon', '2021-10-11 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044795, NULL),
(395, 'B/751/X/2021', '2021-10-08', '0000-00-00', 'Panggilan menghadap persidangan pengadilan militer a.n. terdakwa Serda Muh Candra Ferdiawan, NRP. 13', 1, 'Otmil IV-19 Ambon', '2021-10-11 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044796, NULL),
(396, '415/Pan.7/Srt.Pet/129 K/Mil/20', '2021-10-04', '0000-00-00', 'Petikan Putusan Kasasi a.n Terdakwa Pratu Sakna Tambunan, NRP. 31160006580295', 1, 'Mahkamah Agung RI', '2021-10-11 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044797, NULL),
(397, 'W3.MIL/58/HK.07/X/2021', '2021-10-04', '0000-00-00', 'Surat pengantar berkas perkara dari pengadilan Militer Tinggi III Surabaya a.n. Terdakwa Koptu Petru', 1, 'PENGADILAN MILITER TINGGI III SURABAYA', '2021-10-11 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, NULL, NULL, NULL, NULL, 1633044798, NULL),
(398, 'B/125/X/2021', '2021-10-08', '0000-00-00', 'Data pelanggaran disiplin dan tindak pidana yang belum tuntas proses hukum', 1, 'Kodam XVI/Pattimura', '2021-10-11 00:00:00', 'Diarsipkan.', 1, NULL, NULL, NULL, NULL, 1633044799, NULL),
(399, 'B/748/X/2021', '2021-10-08', '2021-12-01', 'Pembebasan tahanan a.n. terdakwa Prada Marsal Bidji, NRP. 31200548080299', 1, 'Otmil IV-19 Ambon', '2021-10-11 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, '', '', '', '', 1644725789, NULL),
(400, 'B/762/X/2021', '2021-10-08', '2022-01-01', 'Pengawasan pidana percobaan a.n. terdakwa Serka Dimas Ari Setiawan NRP. 21100197140590', 1, 'Otmil IV-19 Ambon', '2021-10-11 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, '', '', '', '', 1644725240, NULL),
(401, 'B/753/X/2021', '2021-10-08', '2022-02-13', 'Pemberitahuan penyelesaian perkara pelanggaran lalu lintas a.n. Terdakwa Praka Selwanus Jaflaun. NRP', 1, 'Otmil IV-19 Ambon', '2021-10-11 00:00:00', 'Disatukan dengan Berkas Perkara Ybs.', 1, '', '', '', '', 1644724511, NULL),
(411, 'OO34', '2022-02-02', '2022-02-08', 'UNDANGANA', NULL, 'OTMIL 99555', 'SS333', 'UNDANGAN MAULID NABI', 1, 'Administrasi', 'Dokumen', 'Baik', 'Berkas', 1644329163, 'Surat-masuk83614.pdf');

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
(1, 1, 1),
(5, 5, 2),
(29, 6, 1),
(30, 8, 2),
(25, 10, 2);

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
  MODIFY `id_surat_keluar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=414;

--
-- AUTO_INCREMENT for table `surat_masuk`
--
ALTER TABLE `surat_masuk`
  MODIFY `id_surat_masuk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=412;

--
-- AUTO_INCREMENT for table `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

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
