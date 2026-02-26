-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-02-2026 a las 14:27:19
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
-- Base de datos: `spotify`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `artistas`
--

CREATE TABLE `artistas` (
  `ID_artista` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `artista_canciones`
--

CREATE TABLE `artista_canciones` (
  `ID_artista` int(11) NOT NULL,
  `ID_cancion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `canciones`
--

CREATE TABLE `canciones` (
  `ID_cancion` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `duracion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cancion_genero`
--

CREATE TABLE `cancion_genero` (
  `ID_cancion` int(11) NOT NULL,
  `ID_genero` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `favoritos`
--

CREATE TABLE `favoritos` (
  `ID_usuario` int(11) NOT NULL,
  `ID_cancion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `generos`
--

CREATE TABLE `generos` (
  `ID_genero` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `membresia`
--

CREATE TABLE `membresia` (
  `ID_membresia` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `precio` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `playlist`
--

CREATE TABLE `playlist` (
  `ID_playlist` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `n_canciones` int(11) NOT NULL,
  `ID_usuario` int(11) NOT NULL,
  `duración` time(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `playlist_canciones`
--

CREATE TABLE `playlist_canciones` (
  `ID_playlist` int(11) NOT NULL,
  `ID_cancion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `ID_usuario` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `ID_membresia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `artistas`
--
ALTER TABLE `artistas`
  ADD PRIMARY KEY (`ID_artista`);

--
-- Indices de la tabla `artista_canciones`
--
ALTER TABLE `artista_canciones`
  ADD KEY `ID_artista` (`ID_artista`),
  ADD KEY `ID_cancion` (`ID_cancion`);

--
-- Indices de la tabla `canciones`
--
ALTER TABLE `canciones`
  ADD PRIMARY KEY (`ID_cancion`);

--
-- Indices de la tabla `cancion_genero`
--
ALTER TABLE `cancion_genero`
  ADD KEY `ID_cancion` (`ID_cancion`),
  ADD KEY `ID_genero` (`ID_genero`);

--
-- Indices de la tabla `favoritos`
--
ALTER TABLE `favoritos`
  ADD KEY `ID_usuario` (`ID_usuario`),
  ADD KEY `ID_cancion` (`ID_cancion`);

--
-- Indices de la tabla `generos`
--
ALTER TABLE `generos`
  ADD PRIMARY KEY (`ID_genero`);

--
-- Indices de la tabla `membresia`
--
ALTER TABLE `membresia`
  ADD PRIMARY KEY (`ID_membresia`);

--
-- Indices de la tabla `playlist`
--
ALTER TABLE `playlist`
  ADD PRIMARY KEY (`ID_playlist`),
  ADD KEY `ID_usuario` (`ID_usuario`);

--
-- Indices de la tabla `playlist_canciones`
--
ALTER TABLE `playlist_canciones`
  ADD KEY `ID_playlist` (`ID_playlist`),
  ADD KEY `ID_cancion` (`ID_cancion`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`ID_usuario`),
  ADD KEY `ID_membresia` (`ID_membresia`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `artistas`
--
ALTER TABLE `artistas`
  MODIFY `ID_artista` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `canciones`
--
ALTER TABLE `canciones`
  MODIFY `ID_cancion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `generos`
--
ALTER TABLE `generos`
  MODIFY `ID_genero` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `membresia`
--
ALTER TABLE `membresia`
  MODIFY `ID_membresia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `playlist`
--
ALTER TABLE `playlist`
  MODIFY `ID_playlist` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `ID_usuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `artista_canciones`
--
ALTER TABLE `artista_canciones`
  ADD CONSTRAINT `artista_canciones_ibfk_1` FOREIGN KEY (`ID_artista`) REFERENCES `artistas` (`ID_artista`),
  ADD CONSTRAINT `artista_canciones_ibfk_2` FOREIGN KEY (`ID_cancion`) REFERENCES `canciones` (`ID_cancion`);

--
-- Filtros para la tabla `cancion_genero`
--
ALTER TABLE `cancion_genero`
  ADD CONSTRAINT `cancion_genero_ibfk_1` FOREIGN KEY (`ID_cancion`) REFERENCES `canciones` (`ID_cancion`),
  ADD CONSTRAINT `cancion_genero_ibfk_2` FOREIGN KEY (`ID_genero`) REFERENCES `generos` (`ID_genero`);

--
-- Filtros para la tabla `favoritos`
--
ALTER TABLE `favoritos`
  ADD CONSTRAINT `favoritos_ibfk_1` FOREIGN KEY (`ID_usuario`) REFERENCES `usuarios` (`ID_usuario`);

--
-- Filtros para la tabla `playlist_canciones`
--
ALTER TABLE `playlist_canciones`
  ADD CONSTRAINT `playlist_canciones_ibfk_1` FOREIGN KEY (`ID_cancion`) REFERENCES `canciones` (`ID_cancion`),
  ADD CONSTRAINT `playlist_canciones_ibfk_2` FOREIGN KEY (`ID_playlist`) REFERENCES `playlist` (`ID_playlist`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`ID_usuario`) REFERENCES `playlist` (`ID_playlist`),
  ADD CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`ID_membresia`) REFERENCES `membresia` (`ID_membresia`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
