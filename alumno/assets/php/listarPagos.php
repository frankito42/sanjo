<?php
require "../../../conn/conn.php";
$sqlPagos="SELECT `idPago`, `idUser`, `monto`, `fechaPago`, `mesPagoId`, `metodoPago`, `estado` FROM `pagos` WHERE `idUser`=$_GET[id] order by idPago desc/* and estado!='pendiente' */";
$pagos=$conn->prepare($sqlPagos);
$pagos->execute();
$pagos=$pagos->fetchAll(PDO::FETCH_ASSOC);
echo json_encode($pagos);
?>