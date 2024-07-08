-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-07-2024 a las 06:27:56
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
-- Base de datos: `usuarios`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contratacion`
--

CREATE TABLE `contratacion` (
  `id_contratacion` int(11) NOT NULL,
  `tipo_contratacion` varchar(45) NOT NULL,
  `precio` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `contratacion`
--

INSERT INTO `contratacion` (`id_contratacion`, `tipo_contratacion`, `precio`) VALUES
(1, 'anual', 120000.00),
(2, 'semestral', 58000.00),
(3, 'mensual', 9999.99),
(4, 'semanal', 2659.99);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `id_formaPago` int(11) NOT NULL,
  `pago` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pagos`
--

INSERT INTO `pagos` (`id_formaPago`, `pago`) VALUES
(1, 'efectivo'),
(2, 'debito'),
(3, 'tarjeta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `id_servicios` int(11) NOT NULL,
  `clase` varchar(45) NOT NULL,
  `diasHorarios` varchar(45) NOT NULL,
  `profesor` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`id_servicios`, `clase`, `diasHorarios`, `profesor`) VALUES
(1, 'Gap', 'Lun, Mie Y Vier 10HS', 'Sofia Gonzalez'),
(2, 'Crossfit', 'Mar , Jue Y Sab 8HS', 'Uriel Sosa'),
(3, 'Taekwondo', 'Lun, Mie Y Vie 15HS', 'Raúl Soler'),
(4, 'Musculacion', 'Pase libre', 'Santiago Silva'),
(5, 'Funcional', 'Mar , Jue Y Sab 11HS', 'Noelia Mirra'),
(6, 'Yoga', 'Mar , Jue Y Sab 9HS', 'Carolina Martinez');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursales`
--

CREATE TABLE `sucursales` (
  `id_sucursales` int(11) NOT NULL,
  `nombre_sucursal` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `wasap` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sucursales`
--

INSERT INTO `sucursales` (`id_sucursales`, `nombre_sucursal`, `direccion`, `wasap`) VALUES
(1, 'Palermo', 'Av. Cnel. Días 1854', 1136542789),
(2, 'Devoto', 'Av. Beiró', 1156312473),
(3, 'Caballito', 'Av. Rivadavia', 1111389456);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `edad` int(3) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `id_sucursales` int(11) NOT NULL,
  `id_servicios` int(11) NOT NULL,
  `id_contratacion` int(11) NOT NULL,
  `id_formaPago` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre`, `apellido`, `edad`, `email`, `password`, `id_sucursales`, `id_servicios`, `id_contratacion`, `id_formaPago`) VALUES
(2, 'Yolanda', 'Ruiz', 30, 'yoly@gmail', '0198gallo', 2, 1, 1, 1),
(3, 'Mario', 'Gimenez', 45, 'gimenez@gmail.com', '1236hola', 2, 4, 2, 2),
(4, 'Maria', 'Carrasco', 31, 'maria@gmail.com', '8956gato', 1, 6, 3, 3),
(5, 'Susana', 'Far', 27, 'susana@gmail.com', '2554', 3, 2, 1, 2),
(8, 'Roberto', 'Casan', 29, 'roberto@gmail.com', '5601lola', 1, 2, 1, 3),
(15, 'Pablo', 'Ramirez', 33, 'ramirez@gmail', '', 2, 1, 1, 1),
(16, 'Luis', 'Escobar', 50, 'escobar@gmail', '', 2, 2, 1, 3),
(17, 'Tamara', 'Paes', 20, 'paes@gmail', '', 2, 1, 1, 2),
(18, 'Diego', 'Presa', 27, 'diego@gmail', '122536589', 3, 1, 2, 2),
(19, 'Valeria', 'Paz', 45, 'valeria@gmail.com', '', 1, 1, 1, 1),
(20, 'Lorena', 'Gil', 26, 'gil@gmail.com', '', 1, 2, 1, 2),
(25, 'Tomas', 'Fernandez', 26, 'gil@gmail.com', '', 1, 2, 1, 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `contratacion`
--
ALTER TABLE `contratacion`
  ADD PRIMARY KEY (`id_contratacion`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id_formaPago`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`id_servicios`);

--
-- Indices de la tabla `sucursales`
--
ALTER TABLE `sucursales`
  ADD PRIMARY KEY (`id_sucursales`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `id_forma_pago` (`id_contratacion`),
  ADD KEY `id_servicios` (`id_servicios`),
  ADD KEY `id_sucursales` (`id_sucursales`),
  ADD KEY `id_contratacion` (`id_contratacion`),
  ADD KEY `id_forma_pago_2` (`id_formaPago`),
  ADD KEY `id_formaPago` (`id_formaPago`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `contratacion`
--
ALTER TABLE `contratacion`
  MODIFY `id_contratacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id_formaPago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `id_servicios` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `sucursales`
--
ALTER TABLE `sucursales`
  MODIFY `id_sucursales` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_contratacion`) REFERENCES `contratacion` (`id_contratacion`),
  ADD CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`id_servicios`) REFERENCES `servicios` (`id_servicios`),
  ADD CONSTRAINT `usuario_ibfk_3` FOREIGN KEY (`id_sucursales`) REFERENCES `sucursales` (`id_sucursales`),
  ADD CONSTRAINT `usuario_ibfk_4` FOREIGN KEY (`id_formaPago`) REFERENCES `pagos` (`id_formaPago`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
