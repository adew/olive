<?php

class Model_data_dashboard extends CI_Model
{
	public function bulan()
	{
		$bulan = array(
			1 => 'Jan',
			2 => 'Feb',
			3 => 'Mar',
			4 => 'April',
			5 => 'Mei',
			6 => 'Juni',
			7 => 'Juli',
			8 => 'Agust',
			9 => 'Sept',
			10 => 'Okt',
			11 => 'Nov',
			12 => 'Des',
		);
		return $bulan;
	}


	public function __construct()
	{
		parent::__construct();
	}

	public function getSuratMasuk($tahun)
	{
		$this->db->where('YEAR(tgl_terima)', $tahun);
		$this->db->from('surat_masuk');

		$query = $this->db->get();

		return $query->result_array();
	}

	public function getSuratKeluar($tahun)
	{
		$this->db->where('YEAR(tgl_kirim)', $tahun);
		$this->db->from('surat_keluar1');

		$query = $this->db->get();

		return $query->result_array();
	}
}
