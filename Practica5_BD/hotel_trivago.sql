-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-02-2026 a las 16:21:24
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
-- Base de datos: `hotel trivago`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `atencion`
--

CREATE TABLE `atencion` (
  `ID_atencion` int(11) NOT NULL,
  `ID_reserva` int(11) NOT NULL,
  `ID_empleado` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `nota` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `atencion`
--

INSERT INTO `atencion` (`ID_atencion`, `ID_reserva`, `ID_empleado`, `fecha`, `nota`) VALUES
(1, 1, 1, '2026-02-10', 'Al principio me trató muy amable, pero luego me tiró la maleta en la carita, al parecer el botones solo aguanta que le metan el pie en la escaleras 2/10'),
(2, 2, 3, '2026-02-10', 'Oigan, quien fue el que contrató a la therian de recepción, me maulló y me aruñó'),
(3, 3, 4, '2026-02-09', 'muy negro para apellidarse blanco'),
(4, 5, 3, '2026-02-09', 'al que estaba frente a mí lo aruñó la recpcionista, creo que es therian la empleada, mejor decidí pedir reembolso'),
(5, 10, 4, '2026-02-10', 'Me trató muy bien, aunque otro cliente le dijo que era muy negro para apellidarse blanco, y creo que tiene razón.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `ID_cliente` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `Telefono` int(15) NOT NULL,
  `fecha_registro` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`ID_cliente`, `nombre`, `email`, `Telefono`, `fecha_registro`) VALUES
(1, 'chichinyuchinyachinyatumaye wong lópez', 'chichinyuchinyatumayesita@gmail.com', 1678890909, '2026-02-01'),
(2, 'Luisa bernan garcia', 'lulu99@gmail.com', 1870954349, '2026-02-02'),
(3, 'Dayanna Mora Tellez', 'morayfrutosrojos@gmail.com', 1867594087, '2026-02-03'),
(4, 'elsa patito quiñonez', 'labotitatalla5@gmail.com', 1870954350, '2026-02-04'),
(5, 'natalia melo cantú', 'natilladefresa@gmail.com', 1870954301, '2026-02-05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `ID_empleado` int(11) NOT NULL,
  `ID_hotel` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `puesto` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`ID_empleado`, `ID_hotel`, `nombre`, `puesto`, `email`) VALUES
(1, 1, 'Alexis Lisandro Solozano', 'Botones', 'linaza.solecito@gmail.com'),
(2, 1, 'José Pacheco Recono', 'Director general', 'pacheco.pechuga20@gmail.com'),
(3, 2, 'María Higuera Lopez', 'Recepcionista', 'higuera.chimenea@gmail.com'),
(4, 2, 'Walter Blanco Molina', 'Mozo de habitación', 'Walter.Boron@gmail.com'),
(5, 3, 'Maria José Portillo Díaz', 'Administración', 'mariajosé.aveces.josémaria@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habitacion`
--

CREATE TABLE `habitacion` (
  `ID_habitacion` int(11) NOT NULL,
  `ID_hotel` int(11) NOT NULL,
  `numero` int(30) NOT NULL,
  `tipo` varchar(30) NOT NULL,
  `precio_noche` double NOT NULL,
  `estado` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `habitacion`
--

INSERT INTO `habitacion` (`ID_habitacion`, `ID_hotel`, `numero`, `tipo`, `precio_noche`, `estado`) VALUES
(1, 1, 178, 'doble', 1800, 'Vacía y limpia'),
(2, 2, 200, 'doble', 2000, 'Ocupado'),
(3, 3, 34, 'Individual', 1500, 'Vacio y sucio'),
(4, 1, 180, 'cuádruple', 4000, 'Vacía y limpia'),
(5, 2, 215, 'triple', 2200, 'Bloqueada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hotel`
--

CREATE TABLE `hotel` (
  `ID_hotel` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Ciudad` varchar(50) NOT NULL,
  `Telefono` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `hotel`
--

INSERT INTO `hotel` (`ID_hotel`, `Nombre`, `Ciudad`, `Telefono`) VALUES
(1, 'Trivago', 'Navolato', 2147271540),
(2, 'Paraiso', 'Barrancosyork', 1870954346),
(3, 'oasis', 'culiacancito', 988768765);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `ID_pago` int(11) NOT NULL,
  `ID_reserva` int(11) NOT NULL,
  `fecha_pago` date NOT NULL,
  `monto` double NOT NULL,
  `metodo` varchar(100) NOT NULL,
  `referencia` varchar(100) NOT NULL,
  `estado_pago` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `pago`
--

INSERT INTO `pago` (`ID_pago`, `ID_reserva`, `fecha_pago`, `monto`, `metodo`, `referencia`, `estado_pago`) VALUES
(1, 1, '2026-02-08', 1500, 'tarjeta', '099887349823345698', 'Pagado'),
(2, 2, '2026-02-03', 3000, 'Pago Mixto', '098765432178563401', 'Pagado'),
(3, 3, '2026-02-08', 1500, 'Efectivo', '098765432187345621', 'Pagado'),
(4, 4, '2026-03-01', 2000, 'Efectivo', 'pendiente', 'pendiente'),
(5, 5, '2026-02-08', 3500, 'Transferencia', '094874763409871245', 'Reembolsado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva`
--

CREATE TABLE `reserva` (
  `ID_reserva` int(11) NOT NULL,
  `ID_cliente` int(11) NOT NULL,
  `ID_habitacion` int(11) NOT NULL,
  `fecha_entrada` date NOT NULL,
  `fecha_salida` date NOT NULL,
  `num_huespedes` int(11) NOT NULL,
  `estado_reserva` varchar(20) NOT NULL,
  `fecha_creacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `reserva`
--

INSERT INTO `reserva` (`ID_reserva`, `ID_cliente`, `ID_habitacion`, `fecha_entrada`, `fecha_salida`, `num_huespedes`, `estado_reserva`, `fecha_creacion`) VALUES
(1, 1, 1, '2026-02-18', '2026-02-22', 2, 'Vigente', '2026-02-08'),
(2, 2, 4, '2026-02-18', '2026-02-22', 6, 'Vigente', '2026-02-03'),
(3, 3, 3, '2026-02-13', '2026-02-15', 1, 'Expirada', '2026-02-08'),
(4, 4, 2, '2026-03-05', '2026-03-07', 2, 'confirmada', '2026-03-01'),
(5, 5, 4, '2026-03-05', '2026-03-10', 5, 'confirmada', '2026-02-08'),
(6, 3, 5, '2026-02-18', '2026-02-26', 4, 'Vigente', '2026-02-08'),
(7, 3, 3, '2026-02-18', '2026-02-21', 1, 'Vigente', '2026-02-11'),
(8, 3, 4, '2026-02-18', '2026-02-26', 6, 'Vigente', '2026-02-11'),
(9, 2, 5, '2026-02-20', '2026-02-24', 4, 'confirmada', '2026-02-18'),
(10, 2, 2, '2026-02-18', '2026-02-22', 2, 'Vigente', '2026-02-11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva_servicio`
--

CREATE TABLE `reserva_servicio` (
  `ID_reserva` int(11) NOT NULL,
  `ID_servicio` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_unitario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `reserva_servicio`
--

INSERT INTO `reserva_servicio` (`ID_reserva`, `ID_servicio`, `cantidad`, `precio_unitario`) VALUES
(1, 2, 1, 2300),
(1, 3, 5, 750),
(7, 1, 2, 3000),
(1, 5, 2, 5000),
(2, 4, 1, 750),
(3, 2, 2, 2000),
(1, 1, 1, 1500),
(9, 5, 3, 3500),
(1, 5, 6, 7000),
(3, 2, 4, 10000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `ID_servicio` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `precio_base` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `servicio`
--

INSERT INTO `servicio` (`ID_servicio`, `nombre`, `precio_base`) VALUES
(1, 'Servicio de Spa', 1500),
(2, 'Cine VIP', 2000),
(3, 'Servicio de lavandería y tintotería', 250),
(4, 'Gimnasio', 700),
(5, 'Entrada Arcade', 1000);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `atencion`
--
ALTER TABLE `atencion`
  ADD PRIMARY KEY (`ID_atencion`),
  ADD KEY `ID_reserva` (`ID_reserva`),
  ADD KEY `ID_empleado` (`ID_empleado`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`ID_cliente`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`ID_empleado`),
  ADD KEY `ID_hotel` (`ID_hotel`);

--
-- Indices de la tabla `habitacion`
--
ALTER TABLE `habitacion`
  ADD PRIMARY KEY (`ID_habitacion`),
  ADD KEY `ID_hotel` (`ID_hotel`);

--
-- Indices de la tabla `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`ID_hotel`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`ID_pago`),
  ADD KEY `ID_reserva` (`ID_reserva`);

--
-- Indices de la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`ID_reserva`),
  ADD KEY `ID_cliente` (`ID_cliente`),
  ADD KEY `ID_habitacion` (`ID_habitacion`);

--
-- Indices de la tabla `reserva_servicio`
--
ALTER TABLE `reserva_servicio`
  ADD KEY `ID_reserva` (`ID_reserva`),
  ADD KEY `ID_servicio` (`ID_servicio`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`ID_servicio`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `atencion`
--
ALTER TABLE `atencion`
  MODIFY `ID_atencion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `ID_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `ID_empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `habitacion`
--
ALTER TABLE `habitacion`
  MODIFY `ID_habitacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `hotel`
--
ALTER TABLE `hotel`
  MODIFY `ID_hotel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `ID_pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `reserva`
--
ALTER TABLE `reserva`
  MODIFY `ID_reserva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `servicio`
  MODIFY `ID_servicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `atencion`
--
ALTER TABLE `atencion`
  ADD CONSTRAINT `atencion_ibfk_1` FOREIGN KEY (`ID_reserva`) REFERENCES `reserva` (`ID_reserva`),
  ADD CONSTRAINT `atencion_ibfk_2` FOREIGN KEY (`ID_empleado`) REFERENCES `empleado` (`ID_empleado`);

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`ID_hotel`) REFERENCES `hotel` (`ID_hotel`);

--
-- Filtros para la tabla `habitacion`
--
ALTER TABLE `habitacion`
  ADD CONSTRAINT `habitacion_ibfk_1` FOREIGN KEY (`ID_hotel`) REFERENCES `hotel` (`ID_hotel`);

--
-- Filtros para la tabla `pago`
--
ALTER TABLE `pago`
  ADD CONSTRAINT `pago_ibfk_1` FOREIGN KEY (`ID_reserva`) REFERENCES `reserva` (`ID_reserva`);

--
-- Filtros para la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `reserva_ibfk_1` FOREIGN KEY (`ID_cliente`) REFERENCES `cliente` (`ID_cliente`),
  ADD CONSTRAINT `reserva_ibfk_2` FOREIGN KEY (`ID_habitacion`) REFERENCES `habitacion` (`ID_habitacion`);

--
-- Filtros para la tabla `reserva_servicio`
--
ALTER TABLE `reserva_servicio`
  ADD CONSTRAINT `reserva_servicio_ibfk_1` FOREIGN KEY (`ID_reserva`) REFERENCES `reserva` (`ID_reserva`),
  ADD CONSTRAINT `reserva_servicio_ibfk_2` FOREIGN KEY (`ID_servicio`) REFERENCES `servicio` (`ID_servicio`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
