<?php
require "../../conn/conn.php";
$sqlPagos="SELECT p.`idPago`, p.`idUser`,u.nombreCompleto, p.`monto`, p.`fechaPago`, p.`mesPagoId`, p.`metodoPago`, p.`estado` FROM `pagos` as p JOIN users as u on u.id=p.idUser;";
$pagos=$conn->prepare($sqlPagos);
$pagos->execute();
$pagos=$pagos->fetchAll(PDO::FETCH_ASSOC);
echo json_encode($pagos);
?>