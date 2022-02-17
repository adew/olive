<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <h1>
      Home
      <small>Halaman Utama</small>
    </h1>
    <ol class="breadcrumb">
      <!-- <li><a href="index.php"><i class="fa fa-dashboard"></i> Beranda</a></li> -->
      <!-- <li class="active">Dashboard</li> -->
    </ol>
  </section>

  <!-- Main content -->
  <section class="content" style="min-height: 600px;">
    <!-- Small boxes (Stat box) -->
    <div class="row">
      <div class="col-lg-3 col-xs-6">
        <!-- small box -->

        <div class="small-box bg-aqua">
          <div class="inner">
            <h3><?= $jml_surat_masuk; ?></h3>
            <p>Surat Masuk</p>
          </div>
          <div class="icon">
            <i class="ion ion-android-mail"></i>
          </div>
          <a href="<?= site_url('admin/page/surat_masuk'); ?>" class="small-box-footer">Lihat <i class="fa fa-arrow-circle-right"></i></a>
        </div>
      </div>
      <!-- ./col -->
      <div class="col-lg-3 col-xs-6">
        <!-- small box -->
        <div class="small-box bg-green">
          <div class="inner">
            <h3><?= $jml_surat_keluar ?></h3>
            <p>Surat Keluar</p>
          </div>
          <div class="icon">
            <i class="fa ion-android-share"></i>
          </div>
          <a href="<?= site_url('admin/page/surat_keluar'); ?>" class="small-box-footer">Lihat <i class="fa fa-arrow-circle-right"></i></a>
        </div>
      </div>
      <!-- ./col -->
      <div class="col-lg-3 col-xs-6">
        <!-- small box -->
        <div class="small-box bg-yellow">
          <div class="inner">
            <h3><?= $jml_petugas ?></h3>
            <p>Petugas</p>
          </div>
          <div class="icon">
            <i class="fa ion-android-contacts"></i>
          </div>
          <a href="<?= site_url('admin/page/data_petugas'); ?>" class="small-box-footer">Lihat <i class="fa fa-arrow-circle-right"></i></a>
        </div>
      </div>
      <!-- ./col -->
    </div>
    <!-- /.row -->
    <div class="row">
      <div class="col-xs-12">
        <div class="box box-warning">
          <div class="box-header">
            <h3 class="box-title"><i class="fa fa-calendar-check-o"></i> Monitoring Tahun <?= $filter_tahun ?></h3>
          </div>
          <div class="col-xs-12" style="margin-bottom: 10px;">
            <form action="" method="post" name="adminForm">
              <table width="100%" border="0" cellspacing="0" cellpadding="0" class="adminlist">
                <tfoot>
                  <tr>
                    <td colspan="6">
                      <div class="select-wrapper" style="width:35%;">
                        <select class="form-control select2" name="tahun" id="filterBulan" tabindex="1" onchange="form.submit();" style="width:100%;">
                          <?php
                          $year_array = array();
                          for ($i = date('Y') - 2; $i <= date('Y'); $i++) {
                            $year_array[$i] = $i;
                          }
                          foreach ($year_array as $value) {
                            if ($value == $filter_tahun) {
                              echo '<option selected="selected" value="' . $value . '"> Tahun ' . $value . '</option>';
                            } else {
                              echo '<option value="' . $value . '"> Tahun ' . $value . '</option>';
                            }
                          }
                          ?>
                        </select>
                      </div>
                    </td>
                  </tr>
                </tfoot>
              </table>
            </form>
          </div>
          <!-- /.box-header -->
          <div class="box-body" style="overflow: auto;">
            <div class="col-md-12">
              <div id="container-surat"></div>
            </div>

          </div>
          <!-- /.box-body -->
        </div>
        <!-- /.box -->
      </div>
      <!-- /.col -->
    </div>
    <!-- /.row -->
  </section>
  <!-- /.content -->
</div>

<!-- <script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/series-label.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script> -->

<script src="<?= base_url() ?>assets/highchart/highcharts.js" type="text/javascript"></script>
<script src="<?= base_url() ?>assets/highchart/series-label.js" type="text/javascript"></script>
<script src="<?= base_url() ?>assets/highchart/exporting.js" type="text/javascript"></script>
<script src="<?= base_url() ?>assets/highchart/export-data.js" type="text/javascript"></script>
<script src="<?= base_url() ?>assets/highchart/accessibility.js" type="text/javascript"></script>

<script type="text/javascript">
  Highcharts.chart('container-surat', {
    chart: {
      type: 'column'
    },
    title: {
      text: 'Surat Masuk dan Surat Keluar'
    },
    yAxis: {
      title: {
        text: 'Jumlah Surat'
      }
    },
    xAxis: {
      title: false,
      categories: ['<?= implode("','", $bulan) ?>'],
      crosshair: true
    },
    credits: {
      enabled: false
    },
    legend: {
      layout: 'vertical',
      align: 'right',
      verticalAlign: 'middle'
    },
    plotOptions: {
      series: {
        label: {
          connectorAllowed: false
        },
      }
    },

    series: [
      <?php
      $series = array();
      foreach (array('surat_masuk', 'surat_keluar') as $jsurat) {
        $data = array();
        foreach ($bulan as $kbulan => $vbulan) {
          $data[] = (int) $semuasurat[$jsurat][$kbulan];
          // $data[] = (int) array_sum($semuasurat[$jsurat][$kbulan]);
        }
        switch ($jsurat) {
          case "surat_masuk":
            $color = '#00c0ef';
            break;
          case "surat_keluar":
            $color = '#00a65a';
            break;
        }
        $series[] = "{color: '" . $color . "', name: '" . $jsurat . "', data: [" . implode(',', $data) . "]}";
      }
      echo implode(',', $series);
      ?>
    ],

    responsive: {
      rules: [{
        condition: {
          maxWidth: 500
        },
        chartOptions: {
          legend: {
            layout: 'horizontal',
            align: 'center',
            verticalAlign: 'bottom'
          }
        }
      }]
    }

  });
</script>