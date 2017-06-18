<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <h1><?php echo $heading_title; ?></h1>
        </div>
    </div>
    <div class="container-fluid">
        <div class="panel panel-default">
            <div class="panel-heading">

                <?php include ("kendin_tasarla_siparis.tpl");?>


            </div>
        </div>
    </div>
    </div>
<?php echo $footer; ?>

<script language="javascript">
    var tasarlanmisIcerik = [];
    $(document).ready(function () {
        tasarlanmisIcerik = <?php echo $iceriklerArr?>;
        if(tasarlanmisIcerik!=''){
            onizlemeIceriklerArr = JSON.parse(JSON.stringify(tasarlanmisIcerik));
            for (var k in onizlemeIceriklerArr) {
                if (onizlemeIceriklerArr.hasOwnProperty(k)) {
                    icerik              = onizlemeIceriklerArr[k];
                    icerik.istemiyorum_chck       = "checked";
                    //break;
                }
            }
            ciz();
        }
    })
</script>
