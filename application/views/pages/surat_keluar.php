<?php defined('BASEPATH') or exit('No direct script access allowed'); ?>

<div class="content-wrapper">
    <section class="content-header">
        <h1>
            Surat Keluar
            <!-- <small>Aplikasi Pengarsipan Surat</small> -->
        </h1>
    </section>
    <!-- Main content -->
    <section class="content container-fluid">
        <?php if ($this->ion_auth->is_admin()) { ?>
            <a href="#InputSuratKeluar" id="tab2" class="btn btn-info">
                <i class="fa fa-plus"></i> Tambah Data
            </a>
            <a href="#SuratKeluar" id="tab1" class="btn btn-info sr-only">
                <i class="fa fa-chevron-left"></i> Kembali
            </a>
            <button id="deleteList" disabled="disabled" class="btn btn-danger" onclick="deleteList()"><i class="fa fa-trash"></i> Hapus</button>
        <?php } ?>
        <a id="buttonLaporan" data-toggle="collapse" class="btn btn-success" href="#collapseOne" style="color: white;">
            <i class="fa fa-file-pdf-o"></i> Buat Laporan
        </a>
        <div class="tab-content">
            <div class="tab-pane fade in active" id="SuratKeluar">
                <div class="box box-primary" style="margin-top: 10px;">
                    <div class="box-body">
                        <div class="panel">
                            <div id="collapseOne" class="collapse">
                                <div class="panel-body">
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-default" onclick="laporanSuratKeluar('bulan_ini')">Bulan ini</button>
                                        <button type="button" class="btn btn-default" onclick="laporanSuratKeluar('minggu_ini')">Minggu ini</button>
                                        <button type="button" class="btn btn-default" onclick="laporanSuratKeluar('hari_ini')">Hari ini</button>
                                        <button type="button" class="btn btn-default" onclick="laporanSuratKeluar('bulan_kemarin')">Bulan Kemarin</button>
                                        <button type="button" class="btn btn-default" onclick="laporanSuratKeluar('kemarin')">Kemarin</button>
                                    </div>
                                    <hr>

                                    <form class="form-inline" action="<?php echo site_url('laporan/print_pdf/2') ?>" target="_blank" method="get">
                                        <!-- <p>Berdasarkan status disposisi</p>
                                <select name="status_disposisi" class="form-control">
                                    <option value="3" selected="selected">Semua</option>
                                    <option value="1">Sudah Disposisi</option>
                                    <option value="2">Belum Disposisi</option>
                                </select> -->
                                        <input type="hidden" name="status_disposisi" value="3" />
                                        <p></p>
                                        <p>Berdasarkan rentang tanggal surat</p>
                                        <div class="form-group">
                                            <div class="input-group">
                                                <div class="input-group-addon">
                                                    <i class="fa fa-calendar"></i>
                                                </div>
                                                <input type="text" name="start" class="form-control" required="required" placeholder="dd-mm-yyyy" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="input-group">
                                                <div class="input-group-addon">
                                                    <i class="fa fa-calendar"></i>
                                                </div>
                                                <input type="text" name="end" class="form-control" required="required" placeholder="dd-mm-yyyy" />
                                            </div>

                                        </div>
                                        <div class="form-group">
                                            <input type="submit" name="" value="Submit" class="btn btn-success" />
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="table-responsive">
                            <table id="surat_Keluar" class="display table table-bordered table-hover" width="100%">
                                <thead>
                                    <tr>
                                        <th><input type="checkbox" id="check-all"></th>
                                        <th>No</th>
                                        <th>Tgl Surat</th>
                                        <th>Tgl Kirim</th>
                                        <th>No. Surat</th>
                                        <th>Kepada</th>
                                        <th>Perihal</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody></tbody>
                            </table>
                        </div>
                    </div>
                </div>

            </div>
            <div class="tab-pane fade" id="InputSuratKeluar">
                <div class="box box-primary" style="margin-top: 10px;">
                    <div class="box-body" style="padding: 10px 20px;">
                        <form id="suratKeluar">
                            <input type="hidden" name="id_surat_keluar" />
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Kepada</label>
                                        <input type="text" name="kepada" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <label>Tanggal Kirim</label>
                                        <div class="input-group">
                                            <input type="text" name="tgl_kirim" class="form-control date-surat" />
                                            <div class="input-group-addon">
                                                <span class="fa fa-calendar"></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>Tanggal Surat</label>
                                        <div class="input-group">
                                            <input type="text" name="tgl_surat" id="inputTglSurat" class="form-control date-surat" />
                                            <div class="input-group-addon">
                                                <span class="fa fa-calendar"></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>Nomor Surat</label>
                                        <input type="text" name="no_surat" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <label>Perihal</label>
                                        <input type="text" name="perihal" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <label>Kode Klasifikasi</label>
                                        <input type="text" name="kode_klasifikasi" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <label>Isi Surat</label>
                                        <textarea name="deskripsi" class="form-control" rows="1"></textarea>
                                    </div>
                                    <input type="hidden" name="set_file_name" value="" />
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Nilai Guna</label>
                                        <select name="nilai_guna" class="form-control">
                                            <option value="" selected="selected">-- Pilih Nilai Guna --</option>
                                            <option value="Administrasi">Administrasi</option>
                                            <option value="Hukum">Hukum</option>
                                            <option value="Keuangan">Keuangan</option>
                                            <option value="IPTEK">IPTEK</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Media</label>
                                        <select name="media" class="form-control">
                                            <option value="" selected="selected">-- Pilih Media --</option>
                                            <option value="Dokumen">Dokumen</option>
                                            <option value="Audio">Audio</option>
                                            <option value="Vidio">Vidio</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Kondisi</label>
                                        <select name="kondisi" class="form-control">
                                            <option value="" selected="selected">-- Pilih Kondisi --</option>
                                            <option value="Baik">Baik</option>
                                            <option value="Rusak">Rusak</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Satuan Lampiran</label>
                                        <select name="satuan_lampiran" class="form-control">
                                            <option value="" selected="selected">-- Pilih Lampiran --</option>
                                            <option value="Berkas">Berkas</option>
                                            <option value="Bundel">Bundel</option>
                                            <option value="Exemplar">Exemplar</option>
                                            <option value="Lembar">Lembar</option>
                                            <option value="Buku">Buku</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label id="label-photo">Upload Surat</label>
                                        <div>
                                            <input name="berkas_surat" type="file">
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                </div>
                        </form>

                    </div>
                    <div class="box-footer text-right">
                        <button type="button" id="submitBtn" class="btn btn-primary btn-flat" onclick="save()">Simpan</button>
                        <button type="button" id="resetBtn" class="btn btn-danger btn-flat">Reset</button>
                    </div>
                </div>
            </div>
        </div>

    </section>

</div>

</div>


<!-- <script src="<?php echo base_url('assets/js/jquery-3.2.1.min.js'); ?>"></script>
<script src="<?php echo base_url('assets/bootstrap/js/bootstrap.min.js'); ?>"></script> -->
<script src="<?php echo base_url('assets/js/moment.js'); ?>"></script>
<script src="<?php echo base_url('assets/datatables/js/jquery.dataTables.min.js'); ?>"></script>
<script src="<?php echo base_url('assets/datatables/js/dataTables.bootstrap.min.js'); ?>"></script>
<script src="<?php echo base_url('assets/bootstrap-datepicker/js/bootstrap-datepicker.min.js'); ?>"></script>
<!-- <script src="<?php echo base_url('assets/adminlte/js/adminlte.min.js'); ?>"></script> -->

<script>
    var table;
    $(document).ready(function() {

        $('a#tab1').click(function(e) {
            e.preventDefault();
            $('#deleteList').show();
            $('#buttonLaporan').show();
            $(this).tab('show');
            $(this).addClass('sr-only');
        });

        $('a#tab2').click(function(e) {
            e.preventDefault();
            save_method = 'add';
            $(this).tab('show');
            $('#deleteList').hide();
            $('#buttonLaporan').hide();
            $('a#tab1').removeClass('sr-only');
        });

        table = $('#surat_Keluar').DataTable({

            "processing": true,
            "serverSide": true,
            "order": [],

            "ajax": {
                "url": "<?php echo site_url('admin/get_surat_keluar'); ?>",
                "type": "POST"
            },


            "columnDefs": [{
                    "targets": [0],
                    "orderable": false,
                },
                {
                    "targets": [1],
                    "orderable": false,
                },
                {
                    "targets": [-1],
                    "orderable": false,
                },
            ],

        });


        $("#check-all").click(function() {
            $(".data-check").prop('checked', $(this).prop('checked'));
            enableDeleteBtn();
        });

        $('.date-surat').datepicker({
            autoclose: true,
            format: 'dd-mm-yyyy',
            todayHighlight: true,
            orientation: "bottom"
        });

        $('[name="start"], [name="end"] ').datepicker({
            autoclose: true,
            format: "dd-mm-yyyy",
            todayHighlight: true,
            orientation: "bottom"
        });

        $('#resetBtn').click(function(e) {
            e.preventDefault();
            $('#suratKeluar')[0].reset();
        });
    });

    function laporanSuratKeluar(waktu) {
        var start, end;
        switch (waktu) {
            case 'bulan_ini':
                start = moment().startOf('month');
                end = moment().endOf('month');
                $('[name="start"]').val(start.format('DD-MM-YYYY'));
                $('[name="end"]').val(end.format('DD-MM-YYYY'));
                break;
            case 'minggu_ini':
                start = moment().subtract(6, 'days');
                end = moment();
                $('[name="start"]').val(start.format('DD-MM-YYYY'));
                $('[name="end"]').val(end.format('DD-MM-YYYY'));
                break;
            case 'hari_ini':
                start = moment();
                end = moment();
                $('[name="start"]').val(start.format('DD-MM-YYYY'));
                $('[name="end"]').val(end.format('DD-MM-YYYY'));
                break;
            case 'bulan_kemarin':
                start = moment().subtract(1, 'month').startOf('month');
                end = moment().subtract(1, 'month').endOf('month');
                $('[name="start"]').val(start.format('DD-MM-YYYY'));
                $('[name="end"]').val(end.format('DD-MM-YYYY'));
                break;
            case 'kemarin':
                start = moment().subtract(1, 'days');
                end = moment().subtract(1, 'days');
                $('[name="start"]').val(start.format('DD-MM-YYYY'));
                $('[name="end"]').val(end.format('DD-MM-YYYY'));
                break;
        }
    }

    function enableDeleteBtn() {
        var total = 0;
        $('.data-check').each(function() {
            total += $(this).prop('checked');
        });

        if (total > 0)
            $('#deleteList').prop('disabled', false);
        else
            $('#deleteList').prop('disabled', true);
    }



    function editSuratKeluar(id) {
        save_method = 'update';
        $('#suratKeluar')[0].reset();
        $('a#tab2').tab('show');

        $.ajax({
            url: "<?php echo site_url('admin/surat_keluar_byid/') ?>" + id,
            type: "GET",
            dataType: "JSON",
            success: function(data) {
                $('a#tab1').removeClass('sr-only');
                $('#deleteList').hide();
                $('[name="id_surat_keluar"]').val(data.id_surat_keluar);
                $('[name="no_surat"]').val(data.no_surat);
                $('[name="tgl_surat"]').val(data.tgl_surat);
                $('[name="tgl_kirim"]').val(data.tgl_kirim);
                $('[name="perihal"]').val(data.perihal);
                // $('[name="jenis_surat"]').val(data.id_jenis_surat);
                $('[name="kepada"]').val(data.kepada);
                $('[name="kode_klasifikasi"]').val(data.kode_klasifikasi);
                $('[name="deskripsi"]').val(data.deskripsi);
                $('[name="nilai_guna"]').val(data.nilai_guna);
                $('[name="media"]').val(data.media);
                $('[name="kondisi"]').val(data.kondisi);
                $('[name="satuan_lampiran"]').val(data.satuan_lampiran);
                $('[name="set_file_name"]').val(data.berkas_surat);
            },
            error: function(jqXHR, textStatus, errorThrown) {
                alert('Error getting data from ajax');
            }
        });
    }

    function showModal(id) {
        $('#disposisiSuratKeluar')[0].reset();
        $('#modal1').modal('show');

        $.ajax({
            url: "<?php echo site_url('admin/surat_Keluar_byid/') ?>" + id,
            type: "GET",
            dataType: "JSON",
            success: function(data) {

                $('[name="idSurat1"]').val(id);
                $('#noSurat').text(data.no_surat);
                $('#tglSurat').text(data.tgl_surat);
                $('#tglKirim').text(data.tgl_kirim);
                $('#perihal').text(data.perihal);
                // $('#tglDisposisi').text('<?php echo mdate('%Y-%m-%d', time()); ?>');
                $('#kepada').text(data.kepada);
                $('#kodeKlasifikasi').text(data.kode_klasifikasi);
                $('#isiSurat').text(data.deskripsi);
                $('#nilaiGuna').text(data.nilai_guna);
                $('#media').text(data.media);
                $('#kondisi').text(data.kondisi);
                $('#satuanLampiran').text(data.satuan_lampiran);
                $('#berkasSurat').text(data.berkas_surat);
                $("a#berkasSurat").attr("href", "<?php echo base_url('uploads/keluar/') ?>" + data.berkas_surat);


            },
            error: function(jqXHR, textStatus, errorThrown) {
                alert('Error getting data from ajax');
            }
        });
    }

    function save() {

        var url;

        if (save_method == 'add') {
            url = "<?php echo site_url('admin/input_surat_Keluar') ?>";
        } else {
            url = "<?php echo site_url('admin/update_surat_Keluar') ?>";
        }

        var formData = new FormData($('#suratKeluar')[0]);
        $.ajax({
            url: url,
            type: "POST",
            data: formData,
            contentType: false,
            processData: false,
            dataType: "JSON",
            success: function(data) {
                if (data.status) {
                    $('#suratKeluar')[0].reset();
                    table.ajax.reload(null, false);
                    $('a#tab1').tab('show');
                    $('.content-header').append('<div style="margin: 15px 0 0 0;" class="alert alert-success alert-dismissible"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button><h4><i class="icon fa fa-check"></i> Berhasil!</h4>Data telah disimpan.</div>');
                } else {
                    for (var i = 0; i < data.inputerror.length; i++) {
                        $('[name="' + data.inputerror[i] + '"]').parent().parent().addClass('has-error'); //select parent twice to select div form-group class and add has-error class
                        $('[name="' + data.inputerror[i] + '"]').next().text(data.error_string[i]); //select span help-block class set text error string
                    }
                }

            },
            error: function(jqXHR, textStatus, errorThrown) {
                alert('Input Data gagal!');

            }
        });
    }

    function deleteList() {
        var list_id = [];
        $(".data-check:checked").each(function() {
            list_id.push(this.value);
        });
        if (list_id.length > 0) {
            if (confirm('Hapus ' + list_id.length + ' data?')) {
                $.ajax({
                    type: "POST",
                    data: {
                        id: list_id
                    },
                    url: "<?php echo site_url('admin/hapus_surat_keluar') ?>",
                    dataType: "JSON",
                    success: function(data) {
                        if (data.status) {
                            $('#deleteList').attr('disabled', true);
                            table.ajax.reload(null, false);
                        } else {
                            alert('Failed.');
                        }

                    },
                    error: function(jqXHR, textStatus, errorThrown) {
                        alert('Error deleting data');
                    }
                });
            }
        } else {
            alert('no data selected');
        }
    }
</script>

<div class="modal fade in" id="modal1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header bg-primary">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span></button>
                <h4 class="modal-title">Detail Surat Keluar</h4>
            </div>
            <form id="disposisiSuratKeluar" target="_blank" action="<?php echo site_url('admin/buat_disposisi'); ?>" method="POST">
                <div class="modal-body">

                    <input type="hidden" name="idSurat1" />
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Kepada</label>
                                <p id="kepada"></p>
                            </div>
                            <div class="form-group">
                                <label>Tanggal Kirim</label>
                                <p id="tglKirim"></p>
                            </div>
                            <div class="form-group">
                                <label>Tanggal Surat</label>
                                <p id="tglSurat"></p>
                            </div>
                            <div class="form-group">
                                <label>No. Surat</label>
                                <p id="noSurat"></p>
                            </div>
                            <div class="form-group">
                                <label>Perihal</label>
                                <p id="perihal"></p>
                            </div>
                            <div class="form-group">
                                <label>Kode Klasifikasi</label>
                                <p id="kodeKlasifikasi"></p>
                            </div>
                            <div class="form-group">
                                <label>Isi Surat</label>
                                <p id="isiSurat"></p>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Nilai Guna</label>
                                <p id="nilaiGuna">&nbsp;</p>
                            </div>
                            <div class="form-group">
                                <label>Media</label>
                                <p id="media">&nbsp;</p>
                            </div>
                            <div class="form-group">
                                <label>Kondisi</label>
                                <p id="kondisi">&nbsp;</p>
                            </div>
                            <div class="form-group">
                                <label>Satuan Lampiran</label>
                                <p id="satuanLampiran">&nbsp;</p>
                            </div>
                            <div class="form-group">
                                <label>File Surat</label>
                                <p><a href="" id="berkasSurat">&nbsp;</a></p>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <!-- <button type="submit" id="printBtn" class="btn btn-primary btn-flat" onclick="location.reload()">Ya</button> -->
                    <button type="button" class="btn btn-primary btn-danger btn-flat" data-dismiss="modal">Close</button>
                </div>
            </form>

        </div>
    </div>

</div>

</body>

</html>