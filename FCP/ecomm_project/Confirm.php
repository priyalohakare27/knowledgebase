<?php
include_once "HeaderHtml.php";
include_once "Helper.php";
$helperObj=new Helper("ecomm");
$pricedb;
$userdb=$_SESSION['user'];
$prodiddb;
$tabledb="buy_details";
$fielddb="user_id,product_id,price";

include_once "variables.php";
include_once "DuplicateCode.php";

$obj1=new Duplicate_code();
$obj1->duplicateFunction1($array1);
foreach ($arra[0] as $booking) {
$temp=$booking;
$temp=explode(",", $temp);
    foreach ($temp as $key=>$booking2) {
		if ($key == 0) {
		$prodiddb= substr($booking2,-7,7);
		}
       if ($key==2) {
				$price+=$booking2;
				$pricedb=$booking2;
}
		if ($key==5) {
$valuesdb="'$userdb','$prodiddb','$pricedb'";
$result=$helperObj->insert($tabledb, $fielddb, $valuesdb);	
}
}
}
$parts = explode("@", "$emailid");
$username = $parts[0];
?>
<div id="body">
<h1 style="color:magenta">Thank you....<?php echo $username;?></h1>
<?php  echo "<h3 style='color:blue'> You shoped for $price</h1>";
echo "</div>";
include_once "html/FooterHtml.html";
?>