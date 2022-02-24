<?php
//Created by Praveen Thappily www.pravysoft.org/praveen
//include_once("config.php");
//function to convert string to image
function prav_img($file,$width=100) {
	$img="<img src='$file' width='$width'>";
  return $img;
									
}


//function for  fileupload
function prav_upload($file,$folder="uploads") {
$file_name= basename($file["name"]);
$ext = pathinfo( $file_name, PATHINFO_EXTENSION);
$fnn=date("YmdHis").".".$ext;
$target_dir = "$folder/";
$target_file = $target_dir.$fnn;
move_uploaded_file($file["tmp_name"], $target_file);
return $target_file;
}



//function get table id resolve
//function get table id resolve
function prav_get($f1,$table,$f2,$value)
{
	 require "config.php";
    $sql55 = "SELECT $f1 FROM $table WHERE $f2 = $value";
    if($stmt55 = mysqli_prepare($link, $sql55)){
        if(mysqli_stmt_execute($stmt55)){
            $result55 = mysqli_stmt_get_result($stmt55);
            $row55 = mysqli_fetch_array($result55, MYSQLI_ASSOC);
			return($row55[$f1]);
            } 
        } 
}



// retrieves and enhances postdata table keys and values on CREATE and UPDATE events
function parse_columns($table_name, $postdata) {
    global $link;
    $vars = array();

    // prepare a default return value
    $default = null;

    // get all columns, including the ones not sent by the CRUD form
    $sql = "SELECT COLUMN_NAME, DATA_TYPE, IS_NULLABLE, COLUMN_DEFAULT, EXTRA
            FROM INFORMATION_SCHEMA.COLUMNS
            WHERE table_name = '".$table_name."'";
    $result = mysqli_query($link,$sql);
    while($row = mysqli_fetch_assoc($result))
    {

        $debug = 0;
        if ($debug) {
            echo "<pre>";
            // print_r($postdata);
            echo $row['COLUMN_NAME'] . "\t";
            echo $row['DATA_TYPE'] . "\t";
            echo $row['IS_NULLABLE'] . "\t";
            echo $row['COLUMN_DEFAULT'] . "\t";
            echo $row['EXTRA'] . "\t";
            echo $default . "\n";
            echo "</pre>";
        }

        switch($row['DATA_TYPE']) {

            // fix "Incorrect decimal value: '' error in STRICT_MODE or STRICT_TRANS_TABLE
            // @see https://dev.mysql.com/doc/refman/5.7/en/sql-mode.html
            case 'decimal':
                $default = 0;
                break;

            // fix "Incorrect datetime value: '0' " on non-null datetime columns
            // with 'CURRENT_TIMESTAMP' default not being set automatically
            // and refusing to take NULL value
            case 'datetime':
                if ($row['COLUMN_DEFAULT'] != 'CURRENT_TIMESTAMP' && $row['IS_NULLABLE'] == 'YES') {
                    $default = null;
                } else {
                    $default =  date('Y-m-d H:i:s');
                }
                if ($postdata[$row['COLUMN_NAME']] == 'CURRENT_TIMESTAMP') {
                    $_POST[$row['COLUMN_NAME']] =  date('Y-m-d H:i:s');
                }
                break;
        }

        // check that fieldname was set before sending values to pdo
        $vars[$row['COLUMN_NAME']] = isset($_POST[$row['COLUMN_NAME']]) && $_POST[$row['COLUMN_NAME']] ? trim($_POST[$row['COLUMN_NAME']]) : $default;
    }
    return $vars;
}



// get extra attributes for  table keys on CREATE and UPDATE events
function get_columns_attributes($table_name, $column) {
    global $link;
    $sql = "SELECT COLUMN_DEFAULT, COLUMN_COMMENT
            FROM INFORMATION_SCHEMA.COLUMNS
            WHERE table_name = '".$table_name."'
            AND column_name = '".$column."'";
    $result = mysqli_query($link,$sql);
    while($row = mysqli_fetch_assoc($result))
    {
        $debug = 0;
        if ($debug) {
            echo "<pre>";
            print_r($row);
            echo "</pre>";
        }
        return $row;
    }
}
?>