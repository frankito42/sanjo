<?php
require "../../conn/conn.php";

// Obtén los datos enviados desde el formulario de edición
$idUser = $_POST['alumnoId'];
$monto = $_POST['monto'];
$meseSelect=$_POST['meseSelect'];
$metodoPago=$_POST['metodo'];

// Consulta SQL para actualizar la publicación


$sql = "INSERT INTO `pagos`(`idUser`, `monto`, `fechaPago`, `mesPagoId`, `metodoPago`, `estado`) VALUES 
(:idUser,:monto,NOW(),:mes,:metodoPago,'Pagado')";

// Preparar la consulta
$stmt = $conn->prepare($sql);
$stmt->bindParam(':idUser', $idUser);
$stmt->bindParam(':monto', $monto);
$stmt->bindParam(':mes', $meseSelect);
$stmt->bindParam(':metodoPago', $metodoPago);

// Ejecutar la consulta
if ($stmt->execute()) {
    echo json_encode("ok");
} else {
    echo json_encode("Error al guardar el pago.");
}
?>
