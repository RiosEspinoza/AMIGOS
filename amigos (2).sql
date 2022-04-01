-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 01-04-2022 a las 21:19:20
-- Versión del servidor: 8.0.17
-- Versión de PHP: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `amigos`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `Amigos` (IN `Id` INT)  NO SQL
    DETERMINISTIC
BEGIN
SELECT * from Amigos where Id = 1;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amigos`
--

CREATE TABLE `amigos` (
  `Id` int(11) NOT NULL,
  `fecha_solicitud` date NOT NULL,
  `Id_Emisor` int(11) NOT NULL,
  `Id_Receptor` int(11) NOT NULL,
  `fecha_Aceptacion` date NOT NULL,
  `Estado` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `amigos`
--

INSERT INTO `amigos` (`Id`, `fecha_solicitud`, `Id_Emisor`, `Id_Receptor`, `fecha_Aceptacion`, `Estado`) VALUES
(1, '2022-03-02', 1, 3, '2022-03-05', 'Aceptada'),
(2, '2022-03-02', 2, 1, '2022-03-05', 'Aceptada'),
(3, '2022-03-25', 5, 2, '2022-03-05', 'Aceptada'),
(5, '2022-04-02', 3, 2, '2022-03-02', 'Aceptada');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `amigos_m`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `amigos_m` (
`Id_Receptor` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `amigo_m`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `amigo_m` (
`Id_Emisor` int(11)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `Id` int(20) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `correo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`Id`, `Nombre`, `Apellido`, `correo`) VALUES
(1, 'Juan', 'pedrozo', 'juan@gmail.com'),
(2, 'maria', 'perez', 'juana@gmail.com'),
(3, 'marta', 'lopez', 'mari@gmail.com'),
(5, 'Lucas', 'judas', 'lj@dd.com');

-- --------------------------------------------------------

--
-- Estructura para la vista `amigos_m`
--
DROP TABLE IF EXISTS `amigos_m`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `amigos_m`  AS  select `Id_Receptor` AS `Id_Receptor` from `amigos` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `amigo_m`
--
DROP TABLE IF EXISTS `amigo_m`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `amigo_m`  AS  select `Id_Emisor` AS `Id_Emisor` from `amigos` ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `amigos`
--
ALTER TABLE `amigos`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Id_Emisor_2` (`Id_Emisor`,`Id_Receptor`),
  ADD UNIQUE KEY `Id_Emior` (`Id_Emisor`),
  ADD KEY `Id_Emisor` (`Id_Emisor`,`Id_Receptor`),
  ADD KEY `Id_Resetor` (`Id_Receptor`);

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `personas`
--
ALTER TABLE `personas`
  MODIFY `Id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `amigos`
--
ALTER TABLE `amigos`
  ADD CONSTRAINT `amigos_ibfk_1` FOREIGN KEY (`Id_Emisor`) REFERENCES `personas` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `amigos_ibfk_2` FOREIGN KEY (`Id_Receptor`) REFERENCES `personas` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
