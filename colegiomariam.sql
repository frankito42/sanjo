-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-07-2024 a las 17:48:05
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `colegiomariam`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `idPago` int(11) NOT NULL,
  `idUser` int(11) NOT NULL,
  `monto` decimal(11,2) NOT NULL,
  `fechaPago` datetime NOT NULL,
  `mesPagoId` int(11) NOT NULL,
  `metodoPago` varchar(10) NOT NULL,
  `estado` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pagos`
--

INSERT INTO `pagos` (`idPago`, `idUser`, `monto`, `fechaPago`, `mesPagoId`, `metodoPago`, `estado`) VALUES
(1, 1, 50000.00, '2024-07-12 10:52:09', 1, 'Efectivo', 'pagado'),
(2, 1, 100000.00, '2024-07-12 12:46:13', 2, 'Efectivo', 'Pagado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `publicaciones`
--

CREATE TABLE `publicaciones` (
  `idP` int(11) NOT NULL,
  `titulo` varchar(50) DEFAULT NULL,
  `texto` text DEFAULT NULL,
  `direccion_archivo` varchar(50) DEFAULT NULL,
  `fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `publicaciones`
--

INSERT INTO `publicaciones` (`idP`, `titulo`, `texto`, `direccion_archivo`, `fecha`) VALUES
(3, 'Uniforme escolar', 'Descripcion de prueba para uniforme escolar, hay en todas las tallas.', 'uploads/2024-07-12080213.jpg', '2024-07-12'),
(4, 'Uniforme escolar coro', 'Uniforme escolar para el coro de estudiantes. Todas las tallas disponibles.', 'uploads/2024-07-12080416.jpg', '2024-07-12'),
(5, 'Uniforme blanco', 'Uniforme blanco de prueba para testeos.', 'uploads/2024-07-12081652.jpg', '2024-07-12'),
(6, 'Uniforme de escolta', 'Uniforme de prueba para testeos de la aplicacion web', 'uploads/2024-07-12081846.jpg', '2024-07-12'),
(7, 'Remera blanca', 'Remera blanca para educacion fisica. Todas las tallas disponibles.', 'uploads/2024-07-12082116.jpg', '2024-07-12'),
(8, 'Uniforme kit', 'Remera, zapatos, antejos etc.', 'uploads/2024-07-12093026.jpg', '2024-07-12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nombreCompleto` varchar(100) NOT NULL,
  `dni` int(11) NOT NULL,
  `user` varchar(50) NOT NULL,
  `pass` varchar(50) NOT NULL,
  `admin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `nombreCompleto`, `dni`, `user`, `pass`, `admin`) VALUES
(1, 'Francisco Javier Gonzalez', 42634753, 'pancho', '123', 0),
(8, 'profesor', 123123123, 'admin', '123', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`idPago`);

--
-- Indices de la tabla `publicaciones`
--
ALTER TABLE `publicaciones`
  ADD PRIMARY KEY (`idP`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `idPago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `publicaciones`
--
ALTER TABLE `publicaciones`
  MODIFY `idP` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
