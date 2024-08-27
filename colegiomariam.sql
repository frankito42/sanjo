-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-08-2024 a las 19:19:42
-- Versión del servidor: 10.4.24-MariaDB-log
-- Versión de PHP: 8.1.6

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `admin` int(11) NOT NULL,
  `curso` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `nombreCompleto`, `dni`, `user`, `pass`, `admin`, `curso`) VALUES
(8, 'profesor', 123123123, 'admin', '123', 1, '5to'),
(15, 'FRANCO, Matias', 0, '', '', 0, '4TO A'),
(16, 'GODOY, Milagros Elizabet', 0, '', '', 0, '4TO A'),
(17, 'OLMEDO, Diego', 0, '', '', 0, '4TO A'),
(18, 'RAMOS, Sofía Yanay', 0, '', '', 0, '4TO A'),
(19, 'SAMUDIO, Juan Ignacio', 0, '', '', 0, '4TO A'),
(20, 'SANTA CLARA, Ana Valentina', 0, '', '', 0, '4TO A'),
(21, 'SILVA, Franco David', 0, '', '', 0, '4TO A'),
(22, 'TORRES CHUVE, Rafael', 0, '', '', 0, '4TO A'),
(23, 'ACEVEDO, Máximo Fernando', 0, '', '', 0, '4TO A'),
(24, 'ARANDA, Brenda Antonia', 0, '', '', 0, '4TO A'),
(25, 'BENITEZ, Matías Luis Alejandro', 0, '', '', 0, '4TO A'),
(26, 'BRAVO MOREIRA, Santiago Eduardo', 0, '', '', 0, '4TO A'),
(27, 'MARECO, Estefanía', 0, '', '', 0, '4TO A'),
(28, 'CARDOZO, Dylan', 0, '', '', 0, '4TO A'),
(29, 'ALARCÓN, Fabricio Lionel', 0, '', '', 0, '4TO A'),
(30, 'ALONSO, Franco', 0, '', '', 0, '4TO A'),
(31, 'CÁCERES VERA, Gabriel Sebastián', 0, '', '', 0, '4TO A'),
(32, 'CANDIA, Celeste Esperanza', 0, '', '', 0, '4TO A'),
(33, 'CRISTALDO, Santino Bautista', 0, '', '', 0, '4TO A'),
(34, 'ESPINOLA GOMEZ, Antonella Araceli', 0, '', '', 0, '4TO A'),
(35, 'FORQUERA, Ian Mateo', 0, '', '', 0, '4TO A'),
(36, 'FERNANDEZ, Angel Mauricio', 0, '', '', 0, '4TO A'),
(37, 'FILLIEZ, Mauricio Darío', 0, '', '', 0, '4TO A'),
(38, 'GOMEZ, Facundo Agustín', 0, '', '', 0, '4TO A'),
(39, 'GONZALEZ, Victor Venancio', 0, '', '', 0, '4TO A'),
(40, 'IBARRA, Miriana Angelen', 0, '', '', 0, '4TO A'),
(41, 'KOHLER, Santino Luis', 0, '', '', 0, '4TO A'),
(42, 'LÓPEZ ÁVALOS, Iara Mariel', 0, '', '', 0, '4TO A'),
(43, 'MORINIGO, Mauricio Miguel', 0, '', '', 0, '4TO A'),
(44, 'MICHATEK, Saira María Luján', 0, '', '', 0, '4TO B'),
(45, 'MOTTA, Brian Pier', 0, '', '', 0, '4TO B'),
(46, 'ORQUERA, Luciana Mariangel', 0, '', '', 0, '4TO B'),
(47, 'RAMIREZ, Agustina Milagros', 0, '', '', 0, '4TO B'),
(48, 'RIVERO, Valentina Amanda', 0, '', '', 0, '4TO B'),
(49, 'ROA, Tomás Emiliano', 0, '', '', 0, '4TO B'),
(50, 'VARGAS RAMIREZ, Camila Anahí', 0, '', '', 0, '4TO B'),
(51, 'VIGGIANO, Martina Alma', 0, '', '', 0, '4TO B'),
(52, 'ARDILES, Milagros Yael Angelen', 0, '', '', 0, '4TO B'),
(53, 'ARIAS, Alexa Ascención', 0, '', '', 0, '4TO B'),
(54, 'BAREIRO, Tiago Andrés', 0, '', '', 0, '4TO B'),
(55, 'BRIZUELA, Benjamín de Jesús', 0, '', '', 0, '4TO B'),
(56, 'CARDOZO, Luciano', 0, '', '', 0, '4TO B'),
(57, 'CERDAN, Alexis José Manuel', 0, '', '', 0, '4TO B'),
(58, 'DUARTE , Facundo Benjamín', 0, '', '', 0, '4TO B'),
(59, 'MARTINEZ, Matías', 0, '', '', 0, '4TO B'),
(60, 'MARTINEZ, Chiara Gabriela', 0, '', '', 0, '5TO A'),
(61, 'MARECO, Sofìa Mariel', 0, '', '', 0, '5TO A'),
(62, 'NUÑEZ, Oscar Guillermo', 0, '', '', 0, '5TO A'),
(63, 'SNEAD, Giovana Esperanza', 0, '', '', 0, '5TO A'),
(64, 'SUAREZ, Luciano Sebastian', 0, '', '', 0, '5TO A'),
(65, 'TOLEDO, Jesús Adrián', 0, '', '', 0, '5TO A'),
(66, 'WIRZ OTTO, Alexander', 0, '', '', 0, '5TO A'),
(67, 'ACOSTA, Xiomara Valentina', 0, '', '', 0, '5TO A'),
(68, 'AGUILERA, Eduardo Manuel', 0, '', '', 0, '5TO A'),
(69, 'AMARILLA, Rodrigo Gabriel', 0, '', '', 0, '5TO A'),
(70, 'BRAVO, Milagros', 0, '', '', 0, '5TO A'),
(71, 'CACERES, Zunilda Catalina', 0, '', '', 0, '5TO A'),
(72, 'CENTURIÓN, Juan Ramón', 0, '', '', 0, '5TO A'),
(73, 'FLORES, Lucas Facundo', 0, '', '', 0, '5TO A'),
(74, 'FRANCO, Vicente Ezequiel', 0, '', '', 0, '5TO A'),
(75, 'GIMENEZ CASTILLO, Alfieri Adolfo', 0, '', '', 0, '5TO A'),
(76, 'GONZALEZ, Ayelén Monserrat', 0, '', '', 0, '5TO A'),
(77, 'GONZALEZ, Jeremìas', 0, '', '', 0, '5TO A'),
(78, 'MORINIGO, Ximena Micaela', 0, '', '', 0, '5TO B'),
(79, 'OCAMPOS, Victor Leonel', 0, '', '', 0, '5TO B'),
(80, 'ONIEVA, Tiago Sebastian', 0, '', '', 0, '5TO B'),
(81, 'IBARROLA, Benjamín', 0, '', '', 0, '5TO B'),
(82, 'ROJAS, Román Antonio', 0, '', '', 0, '5TO B'),
(83, 'SOSA, Tiago Lisandro', 0, '', '', 0, '5TO B'),
(84, 'VALLEJOS, Gaston Ezequiel', 0, '', '', 0, '5TO B'),
(85, 'YURRITA, Leandro Damián', 0, '', '', 0, '5TO B'),
(86, 'ALVAREZ, Maximo Gabriel', 0, '', '', 0, '5TO B'),
(87, 'BRASSEL AGUAYO, Mayneli', 0, '', '', 0, '5TO B'),
(88, 'CABALLERO, Luis Nicolás', 0, '', '', 0, '5TO B'),
(89, 'FERNANDEZ ARCE, Nabila Yanel', 0, '', '', 0, '5TO B'),
(90, 'FIGUEREDO, Blas Maximiliano', 0, '', '', 0, '5TO B'),
(91, 'GOMEZ, Agusto Benjamin', 0, '', '', 0, '5TO B'),
(92, 'GOMEZ, Joaquin Ezequiel', 0, '', '', 0, '5TO B'),
(93, 'MATTO, Fernanada', 0, '', '', 0, '5TO B'),
(94, 'GONZALEZ, Facundo Leonardo', 0, '', '', 0, '5TO B'),
(95, 'GONZALEZ, Laura Antonela', 0, '', '', 0, '5TO B'),
(96, 'KIEFFER, Ruben Maximiliano', 0, '', '', 0, '5TO B'),
(97, 'LESME, Florencia María Itati', 0, '', '', 0, '5TO B'),
(98, 'LYNCH, María Pía', 0, '', '', 0, '5TO B'),
(99, 'MARTÍNEZ, Jorge Maximiliano', 0, '', '', 0, '5TO B'),
(100, 'MEZA ALONZO, Luisa María Angeles', 0, '', '', 0, '5TO B'),
(101, 'OJANDO Leonel', 0, '', '', 0, '5TO B'),
(102, 'AGUIRRE, Joaquín Miguel Angel', 0, '', '', 0, '6TO A'),
(103, 'AYALA  MEDINA, Fernanda Abril', 0, '', '', 0, '6TO A'),
(104, 'BENITEZ, Gabriel Luis Eduardo', 0, '', '', 0, '6TO A'),
(105, 'CABRAL, Samira del Carmen', 0, '', '', 0, '6TO A'),
(106, 'CACERES GONZALEZ, Lautaro R.', 0, '', '', 0, '6TO A'),
(107, 'CHAVEZ, Mateo Alejandro', 0, '', '', 0, '6TO A'),
(108, 'CRISTALDO Nicolás', 0, '', '', 0, '6TO A'),
(109, 'DELLAGNOLO, Rocío Belén', 0, '', '', 0, '6TO A'),
(110, 'ESPINOZA, Juan Francisco', 0, '', '', 0, '6TO A'),
(111, 'GALEANO, Mariam', 0, '', '', 0, '6TO A'),
(112, 'GARCIA PACHECO, Franco B.', 0, '', '', 0, '6TO A'),
(113, 'GOMEZ, Daiana Ayelén', 0, '', '', 0, '6TO A'),
(114, 'GONZALEZ, Magalí Valentina', 0, '', '', 0, '6TO A'),
(115, 'GONZALEZ, Ximena Ailén', 0, '', '', 0, '6TO A'),
(116, 'MARTINEZ, Farid Benjamin', 0, '', '', 0, '6TO A'),
(117, 'MEAURIO, Candela Tatiana Nicole', 0, '', '', 0, '6TO A'),
(118, 'MORA, Florencia Monserrat', 0, '', '', 0, '6TO A'),
(119, 'MOREL, Valentina Luján', 0, '', '', 0, '6TO A'),
(120, 'ORTIZ, Agustín Emanuel', 0, '', '', 0, '6TO A'),
(121, 'ORTÍZ, Sebastían Gabriel', 0, '', '', 0, '6TO A'),
(122, 'QUINODOZ, Federico Fabián', 0, '', '', 0, '6TO A'),
(123, 'RIVERO, Maximiliano Gabriel', 0, '', '', 0, '6TO A'),
(124, 'ROLON REYES, Edgar Ramón', 0, '', '', 0, '6TO A'),
(125, 'SOSA, Nicolás Emanuel', 0, '', '', 0, '6TO A'),
(126, 'VILLALBA, Oscar Sebastían', 0, '', '', 0, '6TO A'),
(127, 'AMARILLA, Gonzalo Ismael', 0, '', '', 0, '6TO B'),
(128, 'AMARILLA, Lionel Martín', 0, '', '', 0, '6TO B'),
(129, 'BRIZUELA, Bianca Mailén', 0, '', '', 0, '6TO B'),
(130, 'CASTILLO, Bautista Juan Enrique', 0, '', '', 0, '6TO B'),
(131, 'GAONA, Lautaro Diego', 0, '', '', 0, '6TO B'),
(132, 'GIMENEZ RODRIGUEZ, Carlo Javier', 0, '', '', 0, '6TO B'),
(133, 'GIMENEZ, Mauro Rafael', 0, '', '', 0, '6TO B'),
(134, 'GONZALEZ, Andrés Mauro Gabiel', 0, '', '', 0, '6TO B'),
(135, 'LESME, Leandro', 0, '', '', 0, '6TO B'),
(136, 'MARTINEZ, Franco Sebastín', 0, '', '', 0, '6TO B'),
(137, 'MORINIGO, Jorge', 0, '', '', 0, '6TO B'),
(138, 'PEREIRA SOSA, Alejandra Daniela', 0, '', '', 0, '6TO B'),
(139, 'REYES, Alexander Ezequiel', 0, '', '', 0, '6TO B'),
(140, 'RODRIGUEZ, Ángela', 0, '', '', 0, '6TO B'),
(141, 'PEÑA IBAÑES, Luciano', 0, '', '', 0, '6TO B'),
(142, 'ROMERO, Gonzalo Nicolás', 0, '', '', 0, '6TO B'),
(143, 'RUIZ DIAZ, Alexis', 0, '', '', 0, '6TO B'),
(144, 'SANTA CRUZ, Milagros', 0, '', '', 0, '6TO B'),
(145, 'SECCO DEL SOL, Agustín', 0, '', '', 0, '6TO B'),
(146, 'ZARATE, Luciano Adrián', 0, '', '', 0, '6TO B'),
(147, 'AGUIRRE VALLARIS, Leandro E.', 0, '', '', 0, '7MO A'),
(148, 'BAREIRO, Jennifer Ailen', 0, '', '', 0, '7MO A'),
(149, 'BENÍTEZ, Lautaro Maximiliano', 0, '', '', 0, '7MO A'),
(150, 'CACERES, Karen Abigail', 0, '', '', 0, '7MO A'),
(151, 'CASTILLO, Iara Jimena', 0, '', '', 0, '7MO A'),
(152, 'FLORENTIN, Matías Alejandro', 0, '', '', 0, '7MO A'),
(153, 'KUNZ VALLES, Micaela María J.', 0, '', '', 0, '7MO A'),
(154, 'MARTINEZ, Franco Daniel', 0, '', '', 0, '7MO A'),
(155, 'MARCHI, Antonella Beatriz', 0, '', '', 0, '7MO A'),
(156, 'OLMEDO, Maiara Guadalupe', 0, '', '', 0, '7MO A'),
(157, 'ORTIZ, Milagros Yamile', 0, '', '', 0, '7MO A'),
(158, 'PIERRO, Andres Francisco', 0, '', '', 0, '7MO A'),
(159, 'QUIÑONEZ, Aldana Jaqueline E.', 0, '', '', 0, '7MO A'),
(160, 'RECALDE ORREGO, Carlos Andres', 0, '', '', 0, '7MO A'),
(161, 'ROLÓN Roberto Matias Ivan', 0, '', '', 0, '7MO A'),
(162, 'SAMUDIO, Mariano Cesar Alejandro', 0, '', '', 0, '7MO A'),
(163, 'VALDOVINOS, Ariadna Monserrat', 0, '', '', 0, '7MO A'),
(164, 'YURRITA, Fabricio', 0, '', '', 0, '7MO A'),
(165, 'BARRETO, Camila', 0, '', '', 0, '7MO B'),
(166, 'BRAVO, Brenda Celeste', 0, '', '', 0, '7MO B'),
(167, 'ESTIGARRIBIA, Jonathan D', 0, '', '', 0, '7MO B'),
(168, 'MERELES, Juan Ignacio', 0, '', '', 0, '7MO B'),
(169, 'PORTILLO, María Agustina', 0, '', '', 0, '7MO B'),
(170, 'VILLALBA Enrique Ismael', 0, '', '', 0, '7MO B'),
(171, 'YAHARI, Jennyfer Monserrat', 0, '', '', 0, '7MO B');

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
  MODIFY `idPago` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `publicaciones`
--
ALTER TABLE `publicaciones`
  MODIFY `idP` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=172;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
