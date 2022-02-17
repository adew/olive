<?php defined('BASEPATH') or exit('No direct script access allowed'); ?>
<aside class="main-sidebar">
  <section class="sidebar">
    <ul class="sidebar-menu" data-widget="tree">
      <li class="header">Main Menu</li>
      <li class="active">
        <a href="<?php echo site_url('admin'); ?>">
          <i class="fa fa-home"></i>
          <span>Home</span>
        </a>
      </li>
      <li>
        <a href="<?php echo site_url('admin/page/surat_masuk'); ?>">
          <i class="fa fa-envelope"></i>
          <span>Surat Masuk</span>
        </a>
      </li>
      <li>
        <a href="<?php echo site_url('admin/page/surat_keluar'); ?>">
          <i class="fa fa-mail-forward"></i>
          <span>Surat Keluar</span>
        </a>
      </li>
      <!-- <li class="header">PERKARA</li>
        <li>
          <a href="<?php echo site_url('admin/dashboard_nominatif'); ?>">
            <i class="fa fa-home"></i>
            <span>Dashboard Nominatif</span>
          </a>
        </li>
        <li>
          <a href="<?php echo site_url('admin/page/data_nominatif'); ?>">
            <i class="fa fa-copy"></i>
            <span>Data Nominatif</span>
          </a>
        </li>
        <li>
          <a href="<?php echo site_url('admin/page/konsep_putusan'); ?>">
            <i class="fa fa-copy"></i>
            <span>Konsep Putusan</span>
          </a>
        </li> -->
      <li>
        <a href="<?php echo site_url('admin/page/data_petugas'); ?>">
          <i class="fa fa-user"></i>
          <span>Users</span>
        </a>
      </li>

      <!--
      <li class="header">LAPORAN DATA</li>
      <li>
        <a href="<?php echo site_url('laporan/view/surat_masuk'); ?>">
          <i class="fa fa-print"></i>
          <span>Surat Masuk</span>
        </a>
      </li>
      <li>
        <a href="<?php echo site_url('laporan/view/surat_keluar'); ?>">
          <i class="fa fa-print"></i>
          <span>Surat Keluar</span>
        </a>
      </li>
  
      <li>
        <a href="<?php echo site_url('laporan/view/disposisi_surat_masuk'); ?>">
          <i class="fa fa-print"></i>
          <span>Disposisi Surat Masuk</span>
        </a>
      </li>-->
      <!-- <li class="header">PENGATURAN</li>
        <li>
          <a href="<?php echo site_url('admin/db_backup'); ?>">
            <i class="fa fa-database"></i>
            <span>Database Backup</span>
          </a>
        </li> -->
    </ul>

  </section>

</aside>
<script type="text/javascript">
  $(document).ready(function() {
    $('<?= $sidebar; ?>').addClass("active");
    var url = window.location;
    // for sidebar menu but not for treeview submenu
    $('ul.sidebar-menu a').filter(function() {
      return this.href == url;
    }).parent().siblings().removeClass('active').end().addClass('active');
    // for treeview which is like a submenu
    $('ul.treeview-menu a').filter(function() {
      return this.href == url;
    }).parentsUntil(".sidebar-menu > .treeview-menu").siblings().removeClass('active menu-open').end().addClass('active menu-open');
  });
</script>