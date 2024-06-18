USE final;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-12-2023 a las 08:43:49
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `michael7_profitexbd`
--

DELIMITER $$

CREATE DATABASE IF NOT EXISTS final;
USE final;
--
-- Procedimientos
--
CREATE PROCEDURE `SP_ActualizarEstadoEmpresaDestajero` (IN `piddestajero` INT, IN `pIdEstado` INT)   update empresadestajero set estado=pIdEstado  where IdEmpresaDestajero=piddestajero$$

CREATE PROCEDURE `SP_ActualizarEstadoPedido` (IN `pIdPedido` INT, IN `pIdEstado` INT)   update pedido set estado=pIdEstado where IdPedido=pIdPedido$$

CREATE PROCEDURE `SP_ActualizarEstadoServicioDestajero` (IN `ipservicio` INT, IN `pIdEstado` INT)   update serviciodestajero set estado=pIdEstado where IdServicioDestajero=ipservicio$$

CREATE PROCEDURE `sp_actualizar_estado_modelo_producto` (IN `pidmodelo` INT)   update modelo set estado=2 where idmodelo=pidmodelo$$

CREATE PROCEDURE `sp_aumentar_stock` (IN `pidproducto` INT, IN `pcantidad` INT)   update producto set stock=stock+pcantidad
where IdProducto=pidproducto$$

CREATE PROCEDURE `sp_CulminarServicioDestajero` (IN `pidservicio` INT, IN `pcantidadculminada` DECIMAL, IN `ptotalpagar` DECIMAL, IN `pestado` INT)   update serviciodestajero set cantidadtotalculminada=pcantidadculminada
,totalpagar=ptotalpagar,estado=pestado
where IdServicioDestajero=pidservicio$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `IdCliente` int(11) NOT NULL,
  `Ruc` char(11) NOT NULL,
  `RazonSocial` varchar(300) NOT NULL,
  `Direccion` varchar(300) NOT NULL,
  `Telefono` varchar(20) NOT NULL,
  `RepresentanteLegal` varchar(300) NOT NULL,
  `IdUsuarioRegistro` int(11) NOT NULL,
  `Estado` int(11) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`IdCliente`, `Ruc`, `RazonSocial`, `Direccion`, `Telefono`, `RepresentanteLegal`, `IdUsuarioRegistro`, `Estado`) VALUES
(1, '20563297655', 'TEJIDOS CELESTE 2', 'CALLE 123', 'CALLE 123', 'CALLE 123', 1, 1),
(2, '1071044115', 'FRANK SAC', 'FDF', 'FDF', 'FDF', 0, 0),
(3, '22323232323', 'df', '32dfdf', '32dfdf', '32dfdf', 0, 1),
(4, '23232323323', 'dfdf', 'sdfd', 'sdfd', 'sdfd', 0, 1),
(5, '34343434343', 'fgf', 'fgg', 'fgg', 'fgg', 0, 1),
(6, '34343434343', 'frgfg', 'fgf', 'fgf', 'fgf', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresadestajero`
--

CREATE TABLE `empresadestajero` (
  `IdEmpresaDestajero` int(11) NOT NULL,
  `Ruc` varchar(20) NOT NULL,
  `RazonSocial` varchar(300) NOT NULL,
  `Direccion` varchar(300) NOT NULL,
  `Telefono` varchar(20) NOT NULL,
  `RepresentanteLegal` varchar(300) NOT NULL,
  `IdUsuarioRegistro` int(11) NOT NULL,
  `Estado` int(11) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `empresadestajero`
--

INSERT INTO `empresadestajero` (`IdEmpresaDestajero`, `Ruc`, `RazonSocial`, `Direccion`, `Telefono`, `RepresentanteLegal`, `IdUsuarioRegistro`, `Estado`) VALUES
(1, '3434', 'servicio ', 'dfdf', 'dfdf', 'dfdf', 0, 1),
(2, '23232', 'dfdfdf', '2323', '2323', '2323', 0, 2),
(3, '3434', 'DGFFG', '34', '34', '34', 0, 2),
(4, '454', 'FGFG', 'FG', 'FG', 'FG', 0, 2),
(5, '34343434343', '3fdgfg', 'fgfg', 'fgfg', 'fgfg', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modelo`
--

CREATE TABLE `modelo` (
  `IdModelo` int(11) NOT NULL,
  `Nombre` varchar(300) NOT NULL,
  `Estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `modelo`
--

INSERT INTO `modelo` (`IdModelo`, `Nombre`, `Estado`) VALUES
(1, 'CUELLO UVE MANGA LARGA', 2),
(2, 'POLO CUELLO CAMISERO MANGA LARGA', 2),
(3, 'POLO CUELLO REDONDO MANGA LARGA', 2),
(4, 'POLO CUELLO CHINO MANGA LARGA', 2),
(5, 'POLO CUELLO UVE MANGA CORTA', 2),
(6, 'POLO CUELLO CAMISERO MANGA CORTA', 2),
(7, 'POLO CUELLO REDONDO MANGA CORTA', 2),
(8, 'POLO CUELLO CHINO MANGA CORTA', 2),
(9, 'POLO CUELLO UVE MANGA TRES CUARTOS', 2),
(10, 'POLO CUELLO REDONDO MANGA TRES CUARTOS', 2),
(11, 'POLO CUELLO CHINO MANGA TRES CUARTOS', 2),
(12, 'polo corto', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `IdPedido` int(11) NOT NULL,
  `IdCliente` int(11) NOT NULL,
  `Fecha` varchar(10) NOT NULL,
  `FechaDevolucion` varchar(10) NOT NULL,
  `TotalGeneral` decimal(10,2) NOT NULL,
  `Comentario` varchar(300) NOT NULL,
  `IdUsuarioRegistro` int(11) NOT NULL,
  `FechaRegistro` datetime NOT NULL DEFAULT current_timestamp(),
  `Estado` int(11) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`IdPedido`, `IdCliente`, `Fecha`, `FechaDevolucion`, `TotalGeneral`, `Comentario`, `IdUsuarioRegistro`, `FechaRegistro`, `Estado`) VALUES
(6, 1, '02/12/2023', '10/12/2023', 26.00, '', 0, '2023-12-02 16:25:33', 1),
(7, 1, '02/12/2023', '10/12/2023', 29.20, '', 0, '2023-12-02 17:36:26', 1),
(8, 1, '02/12/2023', '01/01/2024', 9.20, '', 0, '2023-12-02 19:06:10', 2),
(9, 2, '02/12/2023', '01/01/2024', 9.20, '', 0, '2023-12-02 19:09:37', 1),
(10, 2, '02/12/2023', '01/01/2024', 30.40, '', 0, '2023-12-02 22:51:27', 2),
(11, 2, '01/12/2023', '02/02/2024', 4.60, '', 0, '2023-12-02 22:53:02', 1),
(12, 1, '02/12/2023', '01/01/2024', 76.00, '', 0, '2023-12-02 22:53:52', 2),
(13, 2, '02/12/2023', '11/12/2023', 76.00, '', 0, '2023-12-02 22:58:32', 3),
(14, 1, '02/12/2023', '01/01/2024', 76.00, '', 0, '2023-12-02 22:59:49', 2),
(15, 1, '02/12/2023', '01/01/2024', 76.00, '', 0, '2023-12-02 23:01:56', 2),
(16, 2, '02/02/2023', '01/01/2024', 76.00, '', 0, '2023-12-02 23:04:42', 2),
(17, 1, '02/12/2023', '01/01/2024', 76.00, '', 0, '2023-12-02 23:06:08', 2),
(18, 2, '04/12/2023', '29/12/2023', 15.20, 'dfdfdf', 0, '2023-12-04 18:59:17', 4),
(19, 1, '05/12/2023', '30/12/2023', 13.20, 'ddcgdfgfg', 0, '2023-12-05 00:16:18', 2),
(20, 1, '07/12/2023', '30/12/2023', 35.60, '', 0, '2023-12-07 06:31:16', 3),
(21, 1, '07/12/2023', '30/12/2023', 25.80, 'dfdf', 0, '2023-12-07 19:02:01', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidodetalle`
--

CREATE TABLE `pedidodetalle` (
  `IdPedido` int(11) NOT NULL,
  `IdProducto` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Precio` decimal(10,2) NOT NULL,
  `Total` decimal(10,2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `pedidodetalle`
--

INSERT INTO `pedidodetalle` (`IdPedido`, `IdProducto`, `Cantidad`, `Precio`, `Total`) VALUES
(6, 3, 2, 4.60, 9.20),
(6, 4, 3, 5.60, 16.80),
(7, 4, 2, 5.60, 11.20),
(7, 1, 3, 6.00, 18.00),
(8, 3, 2, 4.60, 9.20),
(9, 3, 2, 4.60, 9.20),
(10, 6, 4, 7.60, 30.40),
(11, 3, 1, 4.60, 4.60),
(12, 6, 10, 7.60, 76.00),
(13, 6, 10, 7.60, 76.00),
(14, 6, 10, 7.60, 76.00),
(15, 6, 10, 7.60, 76.00),
(16, 6, 10, 7.60, 76.00),
(17, 6, 10, 7.60, 76.00),
(18, 6, 2, 7.60, 15.20),
(19, 5, 2, 6.60, 13.20),
(20, 10, 2, 2.50, 5.00),
(20, 5, 3, 6.60, 19.80),
(20, 2, 3, 3.60, 10.80),
(21, 11, 2, 3.00, 6.00),
(21, 5, 3, 6.60, 19.80);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `IdProducto` int(11) NOT NULL,
  `IdModelo` int(11) NOT NULL,
  `Descripcion` varchar(300) NOT NULL,
  `CostoPrenda` decimal(10,2) NOT NULL,
  `PrecioFabricacion` decimal(10,2) NOT NULL,
  `PrecioElaboracionDestajero` decimal(10,2) NOT NULL,
  `Stock` int(11) NOT NULL,
  `IdUsuarioRegistro` int(11) NOT NULL,
  `Estado` int(11) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`IdProducto`, `IdModelo`, `Descripcion`, `CostoPrenda`, `PrecioFabricacion`, `PrecioElaboracionDestajero`, `Stock`, `IdUsuarioRegistro`, `Estado`) VALUES
(1, 9, 'Polo Manga Larga', 6.00, 6.00, 4.00, 115, 1, 1),
(2, 5, 'Polo manga corta', 3.60, 3.60, 2.50, 218, 1, 1),
(3, 6, 'Viviri', 4.60, 4.60, 3.50, 216, 1, 1),
(4, 8, 'Jorge chavez', 5.60, 5.60, 4.00, 217, 1, 1),
(5, 10, 'Polo cuello V', 6.60, 6.60, 6.00, 226, 1, 1),
(6, 11, 'Polo Cuello Redondo', 1.60, 7.60, 6.50, 231, 1, 1),
(7, 2, 'dfvgf', 2.00, 2.00, 232.00, 232, 0, 1),
(8, 1, 'POLO', 1.00, 1.00, 100.00, 100, 0, 0),
(9, 4, 'dfdf', 3.00, 3.00, 10.00, 10, 0, 1),
(10, 3, 'polo2', 2.50, 2.50, 20.00, 22, 0, 1),
(13, 12, '23', 3.00, 6.00, 34.00, 34, 0, 1),
(12, 7, 'obs', 2.00, 6.00, 24.00, 24, 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `serviciodestajero`
--

CREATE TABLE `serviciodestajero` (
  `IdServicioDestajero` int(11) NOT NULL,
  `IdPedido` int(11) NOT NULL,
  `IdEmpresDestajero` int(11) NOT NULL,
  `Fecha` varchar(10) NOT NULL,
  `FechaDevolucion` varchar(10) NOT NULL,
  `TotalGeneral` decimal(10,2) NOT NULL,
  `Descuento` decimal(10,2) NOT NULL DEFAULT 0.00,
  `TotalPagar` decimal(10,2) DEFAULT NULL,
  `CantidadTotalEntregado` int(11) NOT NULL,
  `CantidadTotalCulminado` int(11) DEFAULT NULL,
  `FechaRegistro` datetime NOT NULL DEFAULT current_timestamp(),
  `IdUsuarioRegistro` int(11) NOT NULL,
  `Estado` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `serviciodestajero`
--

INSERT INTO `serviciodestajero` (`IdServicioDestajero`, `IdPedido`, `IdEmpresDestajero`, `Fecha`, `FechaDevolucion`, `TotalGeneral`, `Descuento`, `TotalPagar`, `CantidadTotalEntregado`, `CantidadTotalCulminado`, `FechaRegistro`, `IdUsuarioRegistro`, `Estado`) VALUES
(1, 15, 1, '03/12/2023', '01/01/2024', 65.00, 0.00, 70.00, 10, 10, '2023-12-03 13:21:58', 0, '2'),
(2, 16, 1, '03/12/2023', '01/01/2024', 65.00, 0.00, 70.00, 10, 10, '2023-12-03 15:59:42', 0, '2'),
(3, 10, 2, '05/12/2023', '29/12/2023', 26.00, 0.00, NULL, 4, NULL, '2023-12-05 13:49:58', 0, '1'),
(4, 12, 3, '06/12/2023', '22/12/2023', 65.00, 0.00, NULL, 10, NULL, '2023-12-05 13:52:13', 0, '1'),
(5, 14, 4, '05/12/2023', '29/12/2023', 65.00, 0.00, 65.00, 10, 10, '2023-12-05 13:55:45', 0, '2'),
(6, 15, 4, '05/12/2023', '29/12/2023', 65.00, 7.60, 50.90, 10, 9, '2023-12-05 17:02:59', 0, '2'),
(7, 19, 4, '05/12/2023', '30/12/2023', 12.00, 0.00, 12.00, 2, 2, '2023-12-05 17:49:47', 0, '2'),
(8, 8, 1, '05/12/2023', '30/12/2023', 7.00, 0.00, 7.00, 2, 2, '2023-12-05 18:30:12', 0, '2'),
(9, 18, 1, '05/12/2023', '22/12/2023', 13.00, 0.00, 13.00, 2, 2, '2023-12-05 18:33:06', 0, '2'),
(10, 13, 1, '07/12/2023', '30/12/2023', 65.00, 0.00, 65.00, 10, 10, '2023-12-07 06:29:48', 0, '2'),
(11, 20, 1, '07/12/2023', '23/12/2023', 65.50, 0.00, 58.00, 8, 5, '2023-12-07 06:32:15', 0, '2'),
(12, 21, 1, '07/12/2023', '23/12/2023', 58.00, 0.00, 40.00, 5, 2, '2023-12-07 19:02:47', 0, '2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `serviciodestajerodetalle`
--

CREATE TABLE `serviciodestajerodetalle` (
  `IdServicioDestajero` int(11) NOT NULL,
  `IdProducto` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Precio` decimal(10,2) NOT NULL,
  `Total` decimal(10,2) NOT NULL,
  `CantidadEntregada` decimal(10,2) DEFAULT NULL,
  `SubTotal` decimal(10,2) DEFAULT NULL,
  `Descuento` decimal(10,2) NOT NULL DEFAULT 0.00,
  `TotalPagar` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `serviciodestajerodetalle`
--

INSERT INTO `serviciodestajerodetalle` (`IdServicioDestajero`, `IdProducto`, `Cantidad`, `Precio`, `Total`, `CantidadEntregada`, `SubTotal`, `Descuento`, `TotalPagar`) VALUES
(1, 6, 10, 7.00, 65.00, 10.00, 70.00, 0.00, 70.00),
(2, 6, 10, 7.00, 65.00, 10.00, 70.00, 0.00, 70.00),
(5, 6, 10, 6.50, 65.00, 10.00, 65.00, 0.00, 65.00),
(6, 6, 10, 6.50, 65.00, 9.00, 58.50, 7.60, 50.90),
(7, 5, 2, 6.00, 12.00, 2.00, 12.00, 0.00, 12.00),
(8, 3, 2, 3.50, 7.00, 2.00, 7.00, 0.00, 7.00),
(9, 6, 2, 6.50, 13.00, 2.00, 13.00, 0.00, 13.00),
(10, 6, 10, 6.50, 65.00, 10.00, 65.00, 0.00, 65.00),
(11, 10, 2, 20.00, 40.00, 2.00, 40.00, 0.00, 40.00),
(11, 5, 3, 6.00, 18.00, 3.00, 18.00, 0.00, 18.00),
(11, 2, 3, 2.50, 7.50, NULL, NULL, 0.00, 0.00),
(12, 11, 2, 20.00, 40.00, 2.00, 40.00, 0.00, 40.00),
(12, 5, 3, 6.00, 18.00, NULL, NULL, 0.00, 0.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `IdUsuario` int(11) NOT NULL,
  `Nombres` varchar(200) NOT NULL,
  `Usuario` varchar(200) NOT NULL,
  `Clave` varchar(300) NOT NULL,
  `Estado` int(11) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`IdUsuario`, `Nombres`, `Usuario`, `Clave`, `Estado`) VALUES
(1, 'Franco Perez Acuña', 'fperez', '1234', 1),
(2, 'Michel', 'michel', '1234', 1),
(3, 'jose', 'jose', '1234', 1),
(4, 'juan', 'juan', '123456', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`IdCliente`),
  ADD KEY `IdUsuarioRegistro` (`IdUsuarioRegistro`);

--
-- Indices de la tabla `empresadestajero`
--
ALTER TABLE `empresadestajero`
  ADD PRIMARY KEY (`IdEmpresaDestajero`),
  ADD KEY `IdUsuarioRegistro` (`IdUsuarioRegistro`);

--
-- Indices de la tabla `modelo`
--
ALTER TABLE `modelo`
  ADD PRIMARY KEY (`IdModelo`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`IdPedido`),
  ADD KEY `IdUsuarioRegistro` (`IdUsuarioRegistro`),
  ADD KEY `IdCliente` (`IdCliente`);

--
-- Indices de la tabla `pedidodetalle`
--
ALTER TABLE `pedidodetalle`
  ADD KEY `IdPedido` (`IdPedido`),
  ADD KEY `IdProducto` (`IdProducto`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`IdProducto`),
  ADD UNIQUE KEY `IdModelo` (`IdModelo`);

--
-- Indices de la tabla `serviciodestajero`
--
ALTER TABLE `serviciodestajero`
  ADD PRIMARY KEY (`IdServicioDestajero`),
  ADD KEY `IdPedido` (`IdPedido`),
  ADD KEY `IdEmpresDestajero` (`IdEmpresDestajero`),
  ADD KEY `IdUsuarioRegistro` (`IdUsuarioRegistro`);

--
-- Indices de la tabla `serviciodestajerodetalle`
--
ALTER TABLE `serviciodestajerodetalle`
  ADD KEY `IdProducto` (`IdProducto`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`IdUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `IdCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `empresadestajero`
--
ALTER TABLE `empresadestajero`
  MODIFY `IdEmpresaDestajero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `modelo`
--
ALTER TABLE `modelo`
  MODIFY `IdModelo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `IdPedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `IdProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `serviciodestajero`
--
ALTER TABLE `serviciodestajero`
  MODIFY `IdServicioDestajero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `IdUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
