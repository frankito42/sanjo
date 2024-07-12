<?php
require "../../conn/conn.php";
$sqlPagos="SELECT p.`idPago`, p.`idUser`, u.nombreCompleto, p.`monto`, p.`fechaPago`, p.`mesPagoId`, p.`metodoPago`, p.`estado`
FROM `pagos` AS p
JOIN `users` AS u ON u.id = p.idUser
WHERE p.idPago = (SELECT MAX(idPago) FROM `pagos` where idUser=$_GET[id]) AND YEAR(`fechaPago`) = YEAR(NOW()) and idUser=$_GET[id];";
$pagos=$conn->prepare($sqlPagos);
$pagos->execute();
$pagos=$pagos->fetch(PDO::FETCH_ASSOC);
echo json_encode($pagos);
?>