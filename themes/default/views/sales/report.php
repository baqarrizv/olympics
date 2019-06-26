<?php
/*******EDIT LINES 3-8*******/
$DB_Server = "localhost"; //MySQL Server
$DB_Username = "root"; //MySQL Username
$DB_Password = "";             //MySQL Password
$DB_DBName = "paint-inv";         //MySQL Database Name
//$DB_TBLName = "sma_sales,sma_sale_item,sma_products,sma_subcategories"; //MySQL Table Name
$filename = "Device-Inventory-Report";
session_start();
if(empty($_SESSION['login_user']))
{

    header("location:login.php");
}

else
{

$ename = $_SESSION['login_user'];
$id = $_SESSION['login'];

}

//File Name
/*******YOU DO NOT NEED TO EDIT ANYTHING BELOW THIS LINE*******/
//create MySQL connection
$sql = "SELECT s.*, i.*,p.*,c.* FROM sma_sales s INNER JOIN sma_sale_items i ON s.id = i.sale_id INNER JOIN sma_products p ON i.product_id = p.id INNER JOIN sma_subcategories c ON p.subcategory_id = c.id GROUP BY s.reference_no";

$Connect = @mysql_connect($DB_Server, $DB_Username, $DB_Password) or die("Couldn't connect to MySQL:<br>" . mysql_error() . "<br>" . mysql_errno());
//select database
$Db = @mysql_select_db($DB_DBName, $Connect) or die("Couldn't select database:<br>" . mysql_error(). "<br>" . mysql_errno());
//execute query
$result = @mysql_query($sql,$Connect) or die("Couldn't execute query:<br>" . mysql_error(). "<br>" . mysql_errno());
$file_ending = "xls";
//header info for browser
header("Content-Type: application/xls");
header("Content-Disposition: attachment; filename=$filename.xls");
header("Pragma: no-cache");
header("Expires: 0");
/*******Start of Formatting for Excel*******/
//define separator (defines columns in excel & tabs in word)
$sep = "\t"; //tabbed character
//start of printing column names as names of MySQL fields
for ($i = 0; $i < mysql_num_fields($result); $i++) {
echo mysql_field_name($result,$i) . "\t";
}
print("\n");
//end of printing column names
//start while loop to get data
    while($row = mysql_fetch_row($result))
    {
        $schema_insert = "";
        for($j=0; $j<mysql_num_fields($result);$j++)
        {
            if(!isset($row[$j]))
                $schema_insert .= "NULL".$sep;
            elseif ($row[$j] != "")
                $schema_insert .= "$row[$j]".$sep;
            else
                $schema_insert .= "".$sep;
        }
        $schema_insert = str_replace($sep."$", "", $schema_insert);
        $schema_insert = preg_replace("/\r\n|\n\r|\n|\r/", " ", $schema_insert);
        $schema_insert .= "\t";
        print(trim($schema_insert));
        print "\n";
    }
?>