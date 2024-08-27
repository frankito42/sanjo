<?php
require "../../conn/conn.php";
$sqlPagos="SELECT * FROM `pagos` WHERE `idUser`=$_GET[id]";
$pagos=$conn->prepare($sqlPagos);
$pagos->execute();
$pagos=$pagos->fetchAll(PDO::FETCH_ASSOC);
echo json_encode($pagos);
?>