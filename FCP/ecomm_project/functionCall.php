<?php
include_once "DuplicateCode.php";
$obj1=new Duplicate_code();
$obj1->duplicateFunction1($array1);
echo '<tr>';
$obj2=new Duplicate_code();
$price=$obj2->duplicateFunction2($array1);
echo "</tr>";
?>
<tr>
<td colspan="4"><h4 style="color:DarkRed;text-align:center">Total Price</h4></td>
<td><h4 style="color:DarkRed;text-align:center"><?php  echo $price;?></h4></td>
</tr>