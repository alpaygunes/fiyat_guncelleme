<?php
class ModelOrtakpanelSliderresimupload extends Model
{

    /*function uploadtobayi($gets,$posts,$files){
        $hedef_site     = $gets['hedef_site'];


        $fileName = $files['resim0']['tmp_name'];
        $fileSize = filesize($fileName);

        if(!file_exists($fileName)) {
            $out['status'] = 'error';
            $out['message'] = 'File not found.';
            exit(json_encode($out));
        }

        $finfo = finfo_open(FILEINFO_MIME_TYPE);
        $finfo = finfo_file($finfo, $fileName);

        $cFile  = new CURLFile($fileName, $finfo, 'resim0');
        $data1  = array( "filedata" => $cFile, "filename" => 'agslider0.jpg');



        $curl             = curl_init();
        curl_setopt($curl, CURLOPT_URL, $hedef_site);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($curl, CURLOPT_POST, true);
        curl_setopt($curl, CURLOPT_POSTFIELDS, $data1);
        curl_setopt($curl, CURLOPT_INFILESIZE, $fileSize);
        $data           = curl_exec($curl);
        curl_close($curl);
    }*/
}