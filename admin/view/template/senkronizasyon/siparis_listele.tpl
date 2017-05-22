<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="btn btn-link">
            <a  href="<?php echo $hedef_site."/admin";?>" target="_blank"><?php echo $hedef_site." Siparişleri"; ?></a>
        </div>
    </div>
    <div class="table-responsive">

        <table class="table table-bordered table-hover">
            <thead>
                <tr>
                    <td>
                        Sipariş ID
                    </td>
                    <td>
                        Müşteri Adı
                    </td>
                    <td>
                        Sipariş Durumu
                    </td>
                    <td>
                        Toplam
                    </td>
                    <td>
                        Ekleme Tarihi
                    </td>
                </tr>
            </thead>
            <tbody>
                <?php if ($orders) { ?>
                    <?php foreach ($orders as $order) {
                    ?>
                    <tr>
                        <td class="text-right"><?php echo $order->order_id; ?></td>
                        <td class="text-left"><?php echo $order->customer; ?></td>
                        <td class="text-left"><?php echo $order->status; ?></td>
                        <td class="text-right"><?php echo $order->total; ?></td>
                        <td class="text-left"><?php echo $order->date_added; ?></td>
                    </tr>
                    <?php } ?>
                <?php } else { ?>
                    <tr>
                        <td class="text-center" colspan="6"><?php echo $text_no_results; ?></td>
                    </tr>
                <?php } ?>
            </tbody>
        </table>

    </div>
</div>
<?php echo $footer; ?>