<?php
require "../../conn/conn.php";
$sqlPagos="SELECT u.curso,u.`id`, u.`nombreCompleto`, u.`dni`, GROUP_CONCAT(p.mesPagoId separator ',') mesesPagados FROM `users` = u 
LEFT JOIN pagos as p on p.idUser = u.id
WHERE u.admin!=1 GROUP BY u.id;";
$pagos=$conn->prepare($sqlPagos);
$pagos->execute();
$pagos=$pagos->fetchAll(PDO::FETCH_ASSOC);
echo json_encode($pagos);




?>