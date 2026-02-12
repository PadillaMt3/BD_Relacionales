-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-02-2026 a las 16:17:51
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
-- Base de datos: `tienda`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `ID` int(11) NOT NULL,
  `Nombre` varchar(200) NOT NULL,
  `Precio` double NOT NULL,
  `Marca` varchar(40) NOT NULL,
  `Descripción` varchar(200) NOT NULL,
  `Cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`ID`, `Nombre`, `Precio`, `Marca`, `Descripción`, `Cantidad`) VALUES
(0, 'Repuesto para Carpeta Scribe Carta Clásico Blanco 50 Hojas\r\n', 0, 'Scribe', 'Encuentra el Repuesto para Carpeta de la marca Scribe, la opción perfecta para mantener tus documentos y apuntes siempre en orden. Cuenta con hojas blancas que guían tu escritura y mejoran la presenta', 100),
(1, 'Lápiz Grafito Paper Mate Mirado Hexagonal 5 Piezas', 0, 'paper mate', 'El Lápiz Grafito de la marca Paper Mate fabricado con madera resistente y de forma hexagonal, te permitirá realizar trazos firmes y precisos cómodamente. Su acabado laqueado no se agrieta ni se descar', 150),
(2, 'Paquete de Hojas d\'Skool Tamaño Carta Colores Fluorescentes y Sólidos 100 Hojas\r\n', 0, 'd\'Skool ', 'Complementa tus artículos escolares con el Paquete de Hojas de Color de la marca d\'Skool. Son perfectas para trabajos escolares o proyectos personales, las podrás usar para hacer manualidades, cartas ', 100);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
