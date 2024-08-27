<?php
require "../../conn/conn.php";

// Obtén los datos enviados desde el formulario de edición
$nombre = $_POST['nombreEdit'];
$dni = $_POST['dniEdit'];
$curso = $_POST['cursoEdit'];
$user = $_POST['userEdit'];
$pass = $_POST['passEdit'];
$id = $_POST['id'];

// Consulta SQL para actualizar la publicación
$sql = "UPDATE `users` SET 
`nombreCompleto`=:nombre,
`dni`=:dni,
`user`=:user,
`pass`=:pass,
`curso`=:curso WHERE id=:id";

// Preparar la consulta
$stmt = $conn->prepare($sql);
$stmt->bindParam(':nombre', $nombre);
$stmt->bindParam(':dni', $dni);
$stmt->bindParam(':user', $user);
$stmt->bindParam(':pass', $pass);
$stmt->bindParam(':curso', $curso);
$stmt->bindParam(':id', $id);

// Ejecutar la consulta
if ($stmt->execute()) {
    echo json_encode("ok");
} else {
    echo json_encode("Error al actualizar la publicación.");
}
?>
