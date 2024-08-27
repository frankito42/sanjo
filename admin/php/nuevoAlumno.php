<?php
require "../../conn/conn.php";

// Obtén los datos enviados desde el formulario de edición
$nombreNew = $_POST['nombreNew'];
$dniNew = $_POST['dniNew'];
$cursoNew=$_POST['cursoNew'];
$userNew=$_POST['userNew'];
$passNew=$_POST['passNew'];

// Consulta SQL para actualizar la publicación


$sql = "INSERT INTO `users`(`nombreCompleto`, `dni`, `user`, `pass`, `curso`) 
VALUES (:n,:d,:u,:p,:c)";

// Preparar la consulta
$stmt = $conn->prepare($sql);
$stmt->bindParam(':n', $nombreNew);
$stmt->bindParam(':d', $dniNew);
$stmt->bindParam(':u', $userNew);
$stmt->bindParam(':p', $passNew);
$stmt->bindParam(':c', $cursoNew);

// Ejecutar la consulta
if ($stmt->execute()) {
    echo json_encode("ok");
} else {
    echo json_encode("Error al guardar el pago.");
}
?>
