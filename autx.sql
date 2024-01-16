-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-05-2021 a las 04:27:27
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `autx`
--
CREATE DATABASE IF NOT EXISTS `autx` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `autx`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `Id_usu_cliente` int(11) NOT NULL,
  `Id_tipo_cliente` int(11) NOT NULL,
  `Nom_cliente` varchar(100) NOT NULL,
  `Contra_cliente` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`Id_usu_cliente`, `Id_tipo_cliente`, `Nom_cliente`, `Contra_cliente`) VALUES
(8, 1, 'Drez', 'd84d53f781558dda9f5c19781ee17c7b'),
(16, 1, 'Almita', '06803d8f9679e22ea90dd18c8e2df59b'),
(21, 1, 'Griselda', '4d186321c1a7f0f354b297e8914ab240');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `idCompras` int(11) NOT NULL,
  `idCliente` int(10) UNSIGNED NOT NULL,
  `idPago` int(10) UNSIGNED NOT NULL,
  `FechaCompras` varchar(11) DEFAULT NULL,
  `Monto` double NOT NULL,
  `Estado` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`idCompras`, `idCliente`, `idPago`, `FechaCompras`, `Monto`, `Estado`) VALUES
(1, 0, 1, '21-01-10', 108, 'realizado'),
(2, 0, 1, '21-01-12', 0, 'realizado'),
(3, 0, 1, '21-01-12', 54, 'realizado'),
(4, 0, 1, '21-01-12', 54, 'realizado'),
(5, 0, 1, '21-01-12', 66, 'realizado'),
(6, 0, 1, '21-01-13', 36.5, 'realizado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_compras`
--

CREATE TABLE `detalle_compras` (
  `idDetalle` int(11) NOT NULL,
  `idProducto` int(10) UNSIGNED NOT NULL,
  `idCompras` int(10) UNSIGNED NOT NULL,
  `Cantidad` int(10) UNSIGNED DEFAULT NULL,
  `PrecioCompra` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `detalle_compras`
--

INSERT INTO `detalle_compras` (`idDetalle`, `idProducto`, `idCompras`, `Cantidad`, `PrecioCompra`) VALUES
(1, 1, 1, 2, 22.5),
(2, 2, 1, 2, 31.5),
(3, 1, 3, 1, 22.5),
(4, 2, 3, 1, 31.5),
(5, 1, 4, 1, 22.5),
(6, 2, 4, 1, 31.5),
(7, 2, 5, 1, 16),
(8, 1, 5, 1, 50),
(9, 5, 6, 1, 17),
(10, 2, 6, 1, 19.5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `Id_emple` int(11) NOT NULL,
  `Id_tipo_emple` int(11) NOT NULL,
  `Fecha_emple` varchar(100) NOT NULL,
  `Direccion_emple` text NOT NULL,
  `Postal_emple` varchar(100) NOT NULL,
  `Usuario_emple` varchar(100) NOT NULL,
  `contra_emple` varchar(100) NOT NULL,
  `Telefono_emple` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`Id_emple`, `Id_tipo_emple`, `Fecha_emple`, `Direccion_emple`, `Postal_emple`, `Usuario_emple`, `contra_emple`, `Telefono_emple`) VALUES
(16, 4, '10/12/20', 'ProyectCode', '1111', 'Admin', '21232f297a57a5a743894a0e4a801fc3', '5524475927'),
(24, 3, '12/12/20', 'qwerty', 'qwert', 'Alien', '21232f297a57a5a743894a0e4a801fc3', '5524475927'),
(37, 2, '11/12/21', 'Chimali', '02240', 'Maridrix', 'bc6717c2ac3cab7c0e2a59874ec8b49f', '5524475927'),
(38, 2, '12/12/20', 'Iztapalapa', '02240', 'Osdroix', '94674562a2c2833203491f29d420eed2', '5524475927');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `idPago` int(10) UNSIGNED NOT NULL,
  `Monto` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `Id_producto` int(11) NOT NULL,
  `Id_tipo_producto` int(11) NOT NULL,
  `Nom_producto` varchar(100) NOT NULL,
  `Fecha_producto` varchar(100) DEFAULT NULL,
  `Precio_producto` double NOT NULL,
  `Num_producto` int(11) NOT NULL,
  `Descripcion_producto` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`Id_producto`, `Id_tipo_producto`, `Nom_producto`, `Fecha_producto`, `Precio_producto`, `Num_producto`, `Descripcion_producto`) VALUES
(1, 5, 'Paracetamol 250mg', '2011-12-23', 89, 1, 'https://tradepoint.com.mx/tienda/2943-large_default/excedrin-250-mg-250-mg-65-mg-481668.jpg'),
(2, 1, 'Queso_oaxaca', '22/12/21', 19.5, 10, 'data:image/jpeg;base64,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'),
(3, 4, 'Chile verde', '20-02-21', 3, 10, 'https://selecciones.com.mx/wp-content/uploads/2019/02/curiosidades-de-los-chiles-verdes.jpg'),
(4, 4, 'Chile rojo', '20-02-21', 3, 10, 'https://www.eluniversal.com.mx/sites/default/files/2017/05/08/chile_rojo_istock_el_universal.jpg'),
(5, 7, 'Medias Noches Bimbo', '23-03-21', 17, 12, 'https://bimbo-com-mx-assets.s3.amazonaws.com/s3fs-public/product_sweet_bread_bimbo/CARRUSEL__Medias-Noches-Clascio_1.jpg'),
(6, 3, 'Chetos flamin hot Chico.', '22-12-21', 10, 10, 'https://www.sixtogo.com.mx/media/catalog/product/1/8/18._cheetos_fh_115g.jpg'),
(7, 8, 'Cloro Patitos Desechable 1L', '--------', 11.5, 10, 'https://cdn.shopify.com/s/files/1/0706/6309/products/00750126820002L_1000x.jpg?v=1563808832'),
(8, 6, 'Magnum Almedras', '--------', 32, 20, 'https://www.heladosholanda.com.mx/content/dam/unilever/magnum/mexico/pack_shot/7506306413368_magnum_almendras-1251165-png.png'),
(9, 9, 'Croquetas Dog Chaowd 15 kg', '--------', 600, 1, 'https://www.chedraui.com.mx/medias/7501777017787-00-CH1200Wx1200H?context=bWFzdGVyfHJvb3R8MTM0MTY4fGltYWdlL2pwZWd8aDJlL2hkNi85ODI2MjIxMDMxNDU0LmpwZ3xiOTNjNjhlZDdiMWQwYTBlOGViZjczNDhmZTc2YWNjZGVlZDMyNmJjNjJiMTI5ODdmYTFmM2Q3MTg1ODVlZWZk'),
(10, 2, 'Naranja Alemena 1kilo', '--------', 10, 10, 'http://t1.gstatic.com/licensed-image?q=tbn:ANd9GcQqRX7whsKXsCrR4pJVmF8NWgYwIIL1AStX9ZRLNTqQ95T-silBP8QVpv-H4OyCCDhoIQKFvGtRuROgnQ4VOLs');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarjeta`
--

CREATE TABLE `tarjeta` (
  `Id_cliente_tarjeta` int(11) NOT NULL,
  `Num_tarjeta` varchar(100) NOT NULL,
  `Fecha_tiquet` varchar(100) NOT NULL,
  `Cod_tarjeta` varchar(100) NOT NULL,
  `Tipo_tarjeta` varchar(100) NOT NULL,
  `Id_dueño` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiquet`
--

CREATE TABLE `tiquet` (
  `Id_tiquet` int(11) NOT NULL,
  `Id_empleado_tiquet` int(11) NOT NULL,
  `Fecha_tiquet` varchar(100) NOT NULL,
  `Producto_tiquet` text NOT NULL,
  `total_tiquet` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tiquet`
--

INSERT INTO `tiquet` (`Id_tiquet`, `Id_empleado_tiquet`, `Fecha_tiquet`, `Producto_tiquet`, `total_tiquet`) VALUES
(6, 37, ' Tue May 11 15:54:37 CDT 2021', '[modelo.Carrito@1d79b618, modelo.Carrito@3118b5ee, modelo.Carrito@452dbdbd]', 706),
(7, 38, ' Tue May 11 19:46:47 CDT 2021', '[modelo.Carrito@45d90a83, modelo.Carrito@1ea31b5e, modelo.Carrito@23ac69]', 112);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiquet_carrito`
--

CREATE TABLE `tiquet_carrito` (
  `Id_tiquet` int(11) NOT NULL,
  `Id_cliente_tiquet` varchar(100) NOT NULL,
  `Fecha_tiquet` varchar(100) NOT NULL,
  `Producto_tiquet` text NOT NULL,
  `total_tiquet` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_cliente`
--

CREATE TABLE `usuario_cliente` (
  `Id_usu_cliente` int(11) NOT NULL,
  `Nom_usu_cliente` varchar(100) NOT NULL,
  `App_usu_cliente` varchar(100) NOT NULL,
  `App2_usu_cliente` varchar(100) NOT NULL,
  `Correo_usu_cliente` varchar(100) NOT NULL,
  `Sexo_usu_cliente` varchar(100) NOT NULL,
  `Edad_usu_cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario_cliente`
--

INSERT INTO `usuario_cliente` (`Id_usu_cliente`, `Nom_usu_cliente`, `App_usu_cliente`, `App2_usu_cliente`, `Correo_usu_cliente`, `Sexo_usu_cliente`, `Edad_usu_cliente`) VALUES
(8, 'Hayelquesea', 'nose', 'otroapellido', 'ahiinventalotu@quesigue.com', 'F', 19),
(16, 'Almita', 'Cardoso', 'Mendoza', 'Quintero@gmail.com', 'F', 20),
(21, 'OSCAR', 'Quintero', 'Hernandez', 'Quintero@gmail.com', 'M', 19);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_empleado`
--

CREATE TABLE `usuario_empleado` (
  `Id_usu_emple` int(11) NOT NULL,
  `Nom_usu_emple` varchar(100) NOT NULL,
  `App_usu_emple` varchar(100) NOT NULL,
  `App2_usu_emple` varchar(100) NOT NULL,
  `Correo_usu_emple` varchar(100) NOT NULL,
  `sexo_uso_emple` varchar(100) NOT NULL,
  `Edad_usu_emple` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario_empleado`
--

INSERT INTO `usuario_empleado` (`Id_usu_emple`, `Nom_usu_emple`, `App_usu_emple`, `App2_usu_emple`, `Correo_usu_emple`, `sexo_uso_emple`, `Edad_usu_emple`) VALUES
(16, 'Aut_X', 'Administrador', 'Maya', 'oscarquintero159@gmail.com', 'Otros', 20),
(24, 'Oscar', 'Quintero', 'Hernandez', 'oscarquintero159@gmail.com', 'M', 20),
(37, 'Mari_Carmen', 'Rivera', 'Mendoza', 'mari@gmail.com', 'F', 19),
(38, 'OSCAR_', 'Quintero', 'Hernandez', 'oscarquintero159@gmail.com', 'M', 20);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`Id_usu_cliente`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`idCompras`);

--
-- Indices de la tabla `detalle_compras`
--
ALTER TABLE `detalle_compras`
  ADD PRIMARY KEY (`idDetalle`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`Id_emple`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`Id_producto`);

--
-- Indices de la tabla `tarjeta`
--
ALTER TABLE `tarjeta`
  ADD PRIMARY KEY (`Id_cliente_tarjeta`),
  ADD UNIQUE KEY `Id_dueño` (`Id_dueño`);

--
-- Indices de la tabla `tiquet`
--
ALTER TABLE `tiquet`
  ADD PRIMARY KEY (`Id_tiquet`);

--
-- Indices de la tabla `tiquet_carrito`
--
ALTER TABLE `tiquet_carrito`
  ADD PRIMARY KEY (`Id_tiquet`),
  ADD UNIQUE KEY `Id_cliente_tiquet` (`Id_cliente_tiquet`);

--
-- Indices de la tabla `usuario_cliente`
--
ALTER TABLE `usuario_cliente`
  ADD PRIMARY KEY (`Id_usu_cliente`);

--
-- Indices de la tabla `usuario_empleado`
--
ALTER TABLE `usuario_empleado`
  ADD PRIMARY KEY (`Id_usu_emple`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `Id_usu_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `idCompras` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `detalle_compras`
--
ALTER TABLE `detalle_compras`
  MODIFY `idDetalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `Id_emple` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `Id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tarjeta`
--
ALTER TABLE `tarjeta`
  MODIFY `Id_cliente_tarjeta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tiquet`
--
ALTER TABLE `tiquet`
  MODIFY `Id_tiquet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `tiquet_carrito`
--
ALTER TABLE `tiquet_carrito`
  MODIFY `Id_tiquet` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario_cliente`
--
ALTER TABLE `usuario_cliente`
  MODIFY `Id_usu_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `usuario_empleado`
--
ALTER TABLE `usuario_empleado`
  MODIFY `Id_usu_emple` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
