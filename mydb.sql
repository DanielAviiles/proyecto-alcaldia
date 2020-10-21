-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 21-10-2020 a las 16:56:22
-- Versión del servidor: 10.4.13-MariaDB
-- Versión de PHP: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mydb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `antivirus`
--

CREATE TABLE `antivirus` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `antivirus_has_licencias`
--

CREATE TABLE `antivirus_has_licencias` (
  `antivirus_id` int(11) NOT NULL,
  `licencias_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area_trabajo`
--

CREATE TABLE `area_trabajo` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `area_trabajo`
--

INSERT INTO `area_trabajo` (`id`, `nombre`) VALUES
(1, 'AREAA'),
(2, 'AREAB'),
(3, 'AREAC'),
(4, 'AREAD'),
(5, 'AREAE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `capacidad`
--

CREATE TABLE `capacidad` (
  `id` int(11) NOT NULL,
  `volumen` varchar(45) NOT NULL,
  `marca_disco_id` int(11) NOT NULL,
  `tipo_disco_id` int(11) NOT NULL,
  `estado_disco_id` int(11) DEFAULT NULL,
  `equipo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `capacidad`
--

INSERT INTO `capacidad` (`id`, `volumen`, `marca_disco_id`, `tipo_disco_id`, `estado_disco_id`, `equipo_id`) VALUES
(1, '1000', 3, 1, NULL, 1),
(2, '1000', 3, 1, NULL, 2),
(3, '1000', 4, 1, NULL, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

CREATE TABLE `cargo` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cargo`
--

INSERT INTO `cargo` (`id`, `nombre`) VALUES
(1, 'CARGA'),
(2, 'CARGB'),
(3, 'CARGC'),
(4, 'CARGD'),
(5, 'CARGE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `componentes`
--

CREATE TABLE `componentes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dependencia`
--

CREATE TABLE `dependencia` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `dependencia`
--

INSERT INTO `dependencia` (`id`, `nombre`) VALUES
(1, 'A'),
(2, 'B'),
(3, 'C'),
(4, 'D'),
(5, 'E'),
(6, 'F');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `distribucion`
--

CREATE TABLE `distribucion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa_proveedor`
--

CREATE TABLE `empresa_proveedor` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `nit` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empresa_proveedor`
--

INSERT INTO `empresa_proveedor` (`id`, `nombre`, `nit`) VALUES
(1, 'EMPRESAA', '8001976284'),
(2, 'EMPRESAB', '1237894561'),
(3, 'EMPRESAC', '6324120897');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo`
--

CREATE TABLE `equipo` (
  `id` int(11) NOT NULL,
  `codigo_equipo` varchar(45) NOT NULL,
  `registro` varchar(45) NOT NULL,
  `fecha_adquision` datetime NOT NULL,
  `fecha_instalacion` datetime NOT NULL,
  `fecha_funcionamiento` datetime NOT NULL,
  `objeto_contrato` text NOT NULL,
  `num_inventario` varchar(45) NOT NULL,
  `fecha_garantia_inicio` date NOT NULL,
  `fecha_garantia_fin` date NOT NULL,
  `n_pci` int(11) NOT NULL,
  `n_usb` int(11) NOT NULL,
  `vga` tinyint(4) NOT NULL,
  `hdmi` tinyint(4) NOT NULL,
  `rj45` tinyint(4) NOT NULL,
  `wifi` tinyint(4) NOT NULL,
  `n_disipadores` int(11) NOT NULL,
  `fecha_baja` date DEFAULT NULL,
  `motivo_baja` text DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `usuario_id` int(11) NOT NULL,
  `secretaria_id` int(11) NOT NULL,
  `area_trabajo_id` int(11) NOT NULL,
  `tipo_compra_id` int(11) DEFAULT NULL,
  `tipo_equipo_id` int(11) NOT NULL,
  `empresa_proveedor_id` int(11) NOT NULL,
  `referencia_id` int(11) NOT NULL,
  `procesamiento_id` int(11) NOT NULL,
  `perifericos_id` int(11) NOT NULL,
  `escaner_id` int(11) DEFAULT NULL,
  `impresora_id` int(11) NOT NULL,
  `monitor_id` int(11) NOT NULL,
  `estado_pc_id` int(11) NOT NULL,
  `informacion_id` int(11) DEFAULT NULL,
  `procesador_id` int(11) NOT NULL,
  `forma_adquision_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `equipo`
--

INSERT INTO `equipo` (`id`, `codigo_equipo`, `registro`, `fecha_adquision`, `fecha_instalacion`, `fecha_funcionamiento`, `objeto_contrato`, `num_inventario`, `fecha_garantia_inicio`, `fecha_garantia_fin`, `n_pci`, `n_usb`, `vga`, `hdmi`, `rj45`, `wifi`, `n_disipadores`, `fecha_baja`, `motivo_baja`, `descripcion`, `usuario_id`, `secretaria_id`, `area_trabajo_id`, `tipo_compra_id`, `tipo_equipo_id`, `empresa_proveedor_id`, `referencia_id`, `procesamiento_id`, `perifericos_id`, `escaner_id`, `impresora_id`, `monitor_id`, `estado_pc_id`, `informacion_id`, `procesador_id`, `forma_adquision_id`) VALUES
(1, '687654SDFSDFA', 'JHBSD241654', '2020-10-20 00:00:00', '2020-10-21 00:00:00', '2020-10-22 00:00:00', 'SJDHFGVBSJKGAFGSEGJ', '24DFSDF3354', '2020-10-20', '2021-10-20', 3, 5, 1, 1, 1, 2, 3, NULL, NULL, NULL, 2, 2, 4, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, NULL, 1, 1),
(2, '23416SDFSDF', 'SDOGH1354', '2020-10-20 00:00:00', '2020-10-21 00:00:00', '2020-10-22 00:00:00', 'FKLJFYGKJHNDSFKUJHFGBKJGFFKJGJHSDBHJHSDJHHGDS', '34A6543SDF', '2020-11-21', '2021-11-21', 3, 5, 1, 1, 1, 1, 3, NULL, NULL, NULL, 1, 5, 3, NULL, 2, 2, 3, 3, 3, 3, 2, 2, 1, NULL, 3, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `escaner`
--

CREATE TABLE `escaner` (
  `id` int(11) NOT NULL,
  `marca_escaner` varchar(45) NOT NULL,
  `serial` varchar(45) NOT NULL,
  `num_inv` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `escaner`
--

INSERT INTO `escaner` (`id`, `marca_escaner`, `serial`, `num_inv`) VALUES
(1, 'Samsung', 'SDG18546', '13546SDHB'),
(3, 'Samsung', 'SGGF2315', 'QWEOIUWE36654632');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_funcionamiento`
--

CREATE TABLE `estado_funcionamiento` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL DEFAULT 'Bueno'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_pc`
--

CREATE TABLE `estado_pc` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estado_pc`
--

INSERT INTO `estado_pc` (`id`, `nombre`) VALUES
(1, 'BUENO'),
(2, 'REGULAR'),
(3, 'MALO'),
(4, 'DADO DE BAJA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `forma_adquision`
--

CREATE TABLE `forma_adquision` (
  `id` int(11) NOT NULL,
  `nProceso` varchar(45) DEFAULT NULL,
  `vProceso` varchar(45) DEFAULT NULL,
  `tipo_adquisicion_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `forma_adquision`
--

INSERT INTO `forma_adquision` (`id`, `nProceso`, `vProceso`, `tipo_adquisicion_id`) VALUES
(1, NULL, NULL, 2),
(2, '1346SGSDGS', NULL, 3),
(3, '1346SGSDGS', NULL, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `impresora`
--

CREATE TABLE `impresora` (
  `id` int(11) NOT NULL,
  `marca_impresora` varchar(45) NOT NULL,
  `serial` varchar(45) NOT NULL,
  `num_inv` varchar(45) NOT NULL,
  `tipo_conexion` tinyint(4) NOT NULL,
  `tipo_impresora_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `impresora`
--

INSERT INTO `impresora` (`id`, `marca_impresora`, `serial`, `num_inv`, `tipo_conexion`, `tipo_impresora_id`) VALUES
(1, 'EPSON', 'ASD165', '321654', 2, 4),
(2, 'EPSON', 'ASD165', '321654', 4, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `informacion`
--

CREATE TABLE `informacion` (
  `id` int(11) NOT NULL,
  `registro_fotografico` varchar(65) NOT NULL,
  `fecha_actualizacion` date NOT NULL,
  `usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `licencias`
--

CREATE TABLE `licencias` (
  `id` int(11) NOT NULL,
  `serial` varchar(55) NOT NULL,
  `fecha_compra` date DEFAULT NULL,
  `fecha_vencimiento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `licencias_has_equipo`
--

CREATE TABLE `licencias_has_equipo` (
  `licencias_id` int(11) NOT NULL,
  `equipo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `licencias_has_ofimatico`
--

CREATE TABLE `licencias_has_ofimatico` (
  `licencias_id` int(11) NOT NULL,
  `ofimatico_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `licencias_has_sistema_operativo`
--

CREATE TABLE `licencias_has_sistema_operativo` (
  `licencias_id` int(11) NOT NULL,
  `sistema_operativo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `licencias_has_software`
--

CREATE TABLE `licencias_has_software` (
  `licencias_id` int(11) NOT NULL,
  `software_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mantenimiento`
--

CREATE TABLE `mantenimiento` (
  `id` int(11) NOT NULL,
  `ruido` text NOT NULL,
  `observacion` text NOT NULL,
  `descripcion_backup` text NOT NULL,
  `peso_backup` int(11) NOT NULL,
  `ubicacion` varchar(45) NOT NULL,
  `fecha_backup` datetime NOT NULL,
  `programa_instalado` text NOT NULL,
  `parte_cambiada` text DEFAULT NULL,
  `descripcion_mantenimiento` text NOT NULL,
  `observacion_usuario` text NOT NULL,
  `estado_funcionamiento_id` int(11) NOT NULL,
  `fecha_entrega` date DEFAULT NULL,
  `tipo_mantenimiento_has_componentes_tipo_mantenimiento_id` int(11) NOT NULL,
  `tipo_mantenimiento_has_componentes_componentes_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca_disco`
--

CREATE TABLE `marca_disco` (
  `id` int(11) NOT NULL,
  `nombre` varchar(75) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `marca_disco`
--

INSERT INTO `marca_disco` (`id`, `nombre`) VALUES
(1, 'Seagate'),
(2, 'Hitachi'),
(3, 'Western Digital'),
(4, 'Toshiba'),
(5, 'ADATA'),
(6, 'Samsung');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca_dvd`
--

CREATE TABLE `marca_dvd` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `marca_dvd`
--

INSERT INTO `marca_dvd` (`id`, `nombre`) VALUES
(1, 'LG');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca_mouse`
--

CREATE TABLE `marca_mouse` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `tipo_entrada` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `marca_mouse`
--

INSERT INTO `marca_mouse` (`id`, `nombre`, `tipo_entrada`) VALUES
(1, 'Microsoft', 1),
(2, 'Logitech', 1),
(3, 'Logitech', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca_pc`
--

CREATE TABLE `marca_pc` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `marca_pc`
--

INSERT INTO `marca_pc` (`id`, `nombre`) VALUES
(1, 'Lenovo'),
(2, 'HP'),
(3, 'Dell'),
(4, 'Acer'),
(5, 'Asus'),
(6, 'Apple');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca_procesador`
--

CREATE TABLE `marca_procesador` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `marca_procesador`
--

INSERT INTO `marca_procesador` (`id`, `nombre`) VALUES
(1, 'INTEL'),
(2, 'AMD');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca_ram`
--

CREATE TABLE `marca_ram` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `marca_ram`
--

INSERT INTO `marca_ram` (`id`, `nombre`) VALUES
(1, 'Corsair'),
(2, 'Kingston'),
(3, 'HyperX'),
(4, 'G.Skill');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca_teclado`
--

CREATE TABLE `marca_teclado` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `tipo_entrada` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `marca_teclado`
--

INSERT INTO `marca_teclado` (`id`, `nombre`, `tipo_entrada`) VALUES
(1, 'Microsoft', 1),
(2, 'Corsair', 1),
(3, 'Corsair', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `monitor`
--

CREATE TABLE `monitor` (
  `id` int(11) NOT NULL,
  `marca` varchar(45) NOT NULL,
  `modelo` varchar(45) NOT NULL,
  `serial` varchar(45) NOT NULL,
  `num_inventario` varchar(45) NOT NULL,
  `tipo_monitor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `monitor`
--

INSERT INTO `monitor` (`id`, `marca`, `modelo`, `serial`, `num_inventario`, `tipo_monitor_id`) VALUES
(1, 'DELL', '2020ER', 'ASDA123546', '74534536', 2),
(2, 'ACER', '2020ER', 'SADF321354', '36546321', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ofimatico`
--

CREATE TABLE `ofimatico` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pdf`
--

CREATE TABLE `pdf` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pdf_has_licencias`
--

CREATE TABLE `pdf_has_licencias` (
  `pdf_id` int(11) NOT NULL,
  `licencias_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perifericos`
--

CREATE TABLE `perifericos` (
  `id` int(11) NOT NULL,
  `lector_tarjeta` tinyint(4) NOT NULL,
  `tarjeta_video` tinyint(4) NOT NULL,
  `unidad_quemadora` tinyint(4) NOT NULL,
  `estabilizador` tinyint(4) NOT NULL,
  `ups` tinyint(4) NOT NULL,
  `marca_teclado_id` int(11) NOT NULL,
  `marca_dvd_id` int(11) DEFAULT NULL,
  `marca_mouse_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `perifericos`
--

INSERT INTO `perifericos` (`id`, `lector_tarjeta`, `tarjeta_video`, `unidad_quemadora`, `estabilizador`, `ups`, `marca_teclado_id`, `marca_dvd_id`, `marca_mouse_id`) VALUES
(1, 1, 1, 1, 1, 0, 1, 1, 1),
(2, 1, 1, 0, 1, 1, 2, NULL, 2),
(3, 1, 1, 0, 1, 1, 3, NULL, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `procesador`
--

CREATE TABLE `procesador` (
  `id` int(11) NOT NULL,
  `frecuencia` decimal(3,2) NOT NULL,
  `marca_procesador_id` int(11) NOT NULL,
  `estado_funcionamiento_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `procesador`
--

INSERT INTO `procesador` (`id`, `frecuencia`, `marca_procesador_id`, `estado_funcionamiento_id`) VALUES
(1, '3.10', 1, NULL),
(2, '3.50', 2, NULL),
(3, '3.50', 2, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ram`
--

CREATE TABLE `ram` (
  `id` int(11) NOT NULL,
  `frecuencia` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `marca_id` int(11) NOT NULL,
  `tipo_ram_id` int(11) NOT NULL,
  `estado_funcionamiento_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ram`
--

INSERT INTO `ram` (`id`, `frecuencia`, `cantidad`, `marca_id`, `tipo_ram_id`, `estado_funcionamiento_id`) VALUES
(1, 3200, 4, 3, 4, NULL),
(2, 3200, 4, 4, 4, NULL),
(3, 3200, 4, 4, 4, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `referencia`
--

CREATE TABLE `referencia` (
  `id` int(11) NOT NULL,
  `modelo_pc` varchar(45) NOT NULL,
  `serial_pc` varchar(45) NOT NULL,
  `marca_pc_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `referencia`
--

INSERT INTO `referencia` (`id`, `modelo_pc`, `serial_pc`, `marca_pc_id`) VALUES
(1, '2020ASD1', '321SDFS2313', 4),
(2, '2021SDJHGAS', '63546ASDFA', 5),
(3, '2021SDJHGAS', '63546ASDFA', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reporte`
--

CREATE TABLE `reporte` (
  `id` int(11) NOT NULL,
  `fecha_reporte` date NOT NULL,
  `fecha_evento` date NOT NULL,
  `descripcion_evento` text NOT NULL,
  `tipo_dano` varchar(45) NOT NULL,
  `parte_afectada` varchar(45) NOT NULL,
  `datos_generales` text NOT NULL,
  `diagnostico` text NOT NULL,
  `observaciones` text NOT NULL,
  `diagnostico_final` text NOT NULL,
  `usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id`, `nombre`) VALUES
(1, 'Admin'),
(2, 'Ingeniero');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `secretaria`
--

CREATE TABLE `secretaria` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `dependencia_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `secretaria`
--

INSERT INTO `secretaria` (`id`, `nombre`, `dependencia_id`) VALUES
(1, 'SECA', 1),
(2, 'SECB', 1),
(3, 'SECC', 2),
(4, 'SECD', 4),
(5, 'SECE', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sistema_operativo`
--

CREATE TABLE `sistema_operativo` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `distribucion_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `software`
--

CREATE TABLE `software` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `version` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_adquisicion`
--

CREATE TABLE `tipo_adquisicion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_adquisicion`
--

INSERT INTO `tipo_adquisicion` (`id`, `nombre`) VALUES
(1, 'COMPRA'),
(2, 'DONACION'),
(3, 'COMODATO'),
(4, 'OTRO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_compra`
--

CREATE TABLE `tipo_compra` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_compra`
--

INSERT INTO `tipo_compra` (`id`, `nombre`) VALUES
(1, 'De contado'),
(2, 'Cuotas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_disco`
--

CREATE TABLE `tipo_disco` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_disco`
--

INSERT INTO `tipo_disco` (`id`, `nombre`) VALUES
(1, 'SATA'),
(2, 'IDE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_equipo`
--

CREATE TABLE `tipo_equipo` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_equipo`
--

INSERT INTO `tipo_equipo` (`id`, `nombre`) VALUES
(1, 'ESCRITORIO'),
(2, 'PORTATIL');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_impresora`
--

CREATE TABLE `tipo_impresora` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_impresora`
--

INSERT INTO `tipo_impresora` (`id`, `nombre`) VALUES
(1, 'TIPOA'),
(2, 'TIPOB'),
(3, 'TIPOC'),
(4, 'TIPOD');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_mantenimiento`
--

CREATE TABLE `tipo_mantenimiento` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_mantenimiento_has_componentes`
--

CREATE TABLE `tipo_mantenimiento_has_componentes` (
  `tipo_mantenimiento_id` int(11) NOT NULL,
  `componentes_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_monitor`
--

CREATE TABLE `tipo_monitor` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_monitor`
--

INSERT INTO `tipo_monitor` (`id`, `nombre`) VALUES
(1, 'INTEGRADO'),
(2, 'EXTERNO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_ram`
--

CREATE TABLE `tipo_ram` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_ram`
--

INSERT INTO `tipo_ram` (`id`, `nombre`) VALUES
(1, 'DDR'),
(2, 'DDR2'),
(3, 'DDR3'),
(4, 'DDR4');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nombre_completo` varchar(55) NOT NULL,
  `user` varchar(45) NOT NULL,
  `pass` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  `rol_id` int(11) NOT NULL,
  `cargo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre_completo`, `user`, `pass`, `email`, `telefono`, `rol_id`, `cargo_id`) VALUES
(1, 'Daniel Felipe Aviles Paipa', 'daniel', '123', 'daniel@gmail.com', '3214568475', 1, 2),
(2, 'Robinson Davis Villabon Trujillo', 'robinson', '123', 'robinson@gmail.com', '3517891526', 2, 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `antivirus`
--
ALTER TABLE `antivirus`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `antivirus_has_licencias`
--
ALTER TABLE `antivirus_has_licencias`
  ADD PRIMARY KEY (`antivirus_id`,`licencias_id`),
  ADD KEY `fk_antivirus_has_licencias_licencias1_idx` (`licencias_id`),
  ADD KEY `fk_antivirus_has_licencias_antivirus1_idx` (`antivirus_id`);

--
-- Indices de la tabla `area_trabajo`
--
ALTER TABLE `area_trabajo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `capacidad`
--
ALTER TABLE `capacidad`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_capacidad_tipo_disco1_idx` (`tipo_disco_id`),
  ADD KEY `fk_capacidad_estado_disco1_idx` (`estado_disco_id`),
  ADD KEY `fk_capacidad_marca_disco1` (`marca_disco_id`),
  ADD KEY `fk_capacidad_equipo1` (`equipo_id`);

--
-- Indices de la tabla `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `componentes`
--
ALTER TABLE `componentes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `dependencia`
--
ALTER TABLE `dependencia`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `distribucion`
--
ALTER TABLE `distribucion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `empresa_proveedor`
--
ALTER TABLE `empresa_proveedor`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_equipo_usuario1_idx` (`usuario_id`),
  ADD KEY `fk_equipo_secretaria1_idx` (`secretaria_id`),
  ADD KEY `fk_equipo_area_trabajo1_idx` (`area_trabajo_id`),
  ADD KEY `fk_equipo_tipo_compra1_idx` (`tipo_compra_id`),
  ADD KEY `fk_equipo_tipo_equipo1_idx` (`tipo_equipo_id`),
  ADD KEY `fk_equipo_empresa_proveedor1_idx` (`empresa_proveedor_id`),
  ADD KEY `fk_equipo_referencia1_idx` (`referencia_id`),
  ADD KEY `fk_equipo_procesamiento1_idx` (`procesamiento_id`),
  ADD KEY `fk_equipo_perifericos1_idx` (`perifericos_id`),
  ADD KEY `fk_equipo_escaner1_idx` (`escaner_id`),
  ADD KEY `fk_equipo_impresora1_idx` (`impresora_id`),
  ADD KEY `fk_equipo_monitor1_idx` (`monitor_id`),
  ADD KEY `fk_equipo_estado_pc1_idx` (`estado_pc_id`),
  ADD KEY `fk_equipo_informacion1_idx` (`informacion_id`),
  ADD KEY `fk_equipo_procesador1_idx` (`procesador_id`),
  ADD KEY `fk_equipo_forma_adquision1_idx` (`forma_adquision_id`);

--
-- Indices de la tabla `escaner`
--
ALTER TABLE `escaner`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `serial_UNIQUE` (`serial`);

--
-- Indices de la tabla `estado_funcionamiento`
--
ALTER TABLE `estado_funcionamiento`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estado_pc`
--
ALTER TABLE `estado_pc`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `forma_adquision`
--
ALTER TABLE `forma_adquision`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_forma_adquision_tipo_adquisicion1_idx` (`tipo_adquisicion_id`);

--
-- Indices de la tabla `impresora`
--
ALTER TABLE `impresora`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_impresora_tipo_impresora1_idx` (`tipo_impresora_id`);

--
-- Indices de la tabla `informacion`
--
ALTER TABLE `informacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_informacion_usuario1_idx` (`usuario_id`);

--
-- Indices de la tabla `licencias`
--
ALTER TABLE `licencias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `licencias_has_equipo`
--
ALTER TABLE `licencias_has_equipo`
  ADD PRIMARY KEY (`licencias_id`,`equipo_id`),
  ADD KEY `fk_licencias_has_equipo_equipo1_idx` (`equipo_id`),
  ADD KEY `fk_licencias_has_equipo_licencias1_idx` (`licencias_id`);

--
-- Indices de la tabla `licencias_has_ofimatico`
--
ALTER TABLE `licencias_has_ofimatico`
  ADD PRIMARY KEY (`licencias_id`,`ofimatico_id`),
  ADD KEY `fk_licencias_has_ofimatico_ofimatico1_idx` (`ofimatico_id`),
  ADD KEY `fk_licencias_has_ofimatico_licencias1_idx` (`licencias_id`);

--
-- Indices de la tabla `licencias_has_sistema_operativo`
--
ALTER TABLE `licencias_has_sistema_operativo`
  ADD PRIMARY KEY (`licencias_id`,`sistema_operativo_id`),
  ADD KEY `fk_licencias_has_sistema_operativo_sistema_operativo1_idx` (`sistema_operativo_id`),
  ADD KEY `fk_licencias_has_sistema_operativo_licencias1_idx` (`licencias_id`);

--
-- Indices de la tabla `licencias_has_software`
--
ALTER TABLE `licencias_has_software`
  ADD PRIMARY KEY (`licencias_id`,`software_id`),
  ADD KEY `fk_licencias_has_software_software1_idx` (`software_id`),
  ADD KEY `fk_licencias_has_software_licencias1_idx` (`licencias_id`);

--
-- Indices de la tabla `mantenimiento`
--
ALTER TABLE `mantenimiento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_mantenimiento_estado_funcionamiento1_idx` (`estado_funcionamiento_id`),
  ADD KEY `fk_mantenimiento_tipo_mantenimiento_has_componentes1_idx` (`tipo_mantenimiento_has_componentes_tipo_mantenimiento_id`,`tipo_mantenimiento_has_componentes_componentes_id`);

--
-- Indices de la tabla `marca_disco`
--
ALTER TABLE `marca_disco`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `marca_dvd`
--
ALTER TABLE `marca_dvd`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `marca_mouse`
--
ALTER TABLE `marca_mouse`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `marca_pc`
--
ALTER TABLE `marca_pc`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `marca_procesador`
--
ALTER TABLE `marca_procesador`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `marca_ram`
--
ALTER TABLE `marca_ram`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `marca_teclado`
--
ALTER TABLE `marca_teclado`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `monitor`
--
ALTER TABLE `monitor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_monitor_tipo_monitor1_idx` (`tipo_monitor_id`);

--
-- Indices de la tabla `ofimatico`
--
ALTER TABLE `ofimatico`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pdf`
--
ALTER TABLE `pdf`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pdf_has_licencias`
--
ALTER TABLE `pdf_has_licencias`
  ADD PRIMARY KEY (`pdf_id`,`licencias_id`),
  ADD KEY `fk_pdf_has_licencias_licencias1_idx` (`licencias_id`),
  ADD KEY `fk_pdf_has_licencias_pdf1_idx` (`pdf_id`);

--
-- Indices de la tabla `perifericos`
--
ALTER TABLE `perifericos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_perifericos_marca_teclado1_idx` (`marca_teclado_id`),
  ADD KEY `fk_perifericos_marca_mouse1_idx` (`marca_mouse_id`),
  ADD KEY `fk_perifericos_marca_dvd1` (`marca_dvd_id`);

--
-- Indices de la tabla `procesador`
--
ALTER TABLE `procesador`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_procesador_estado_funcionamiento1_idx` (`estado_funcionamiento_id`),
  ADD KEY `fk_procesador_marca_procesador1_idx` (`marca_procesador_id`);

--
-- Indices de la tabla `ram`
--
ALTER TABLE `ram`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_procesamiento_marca1_idx` (`marca_id`),
  ADD KEY `fk_procesamiento_tipo_ram1_idx` (`tipo_ram_id`),
  ADD KEY `fk_procesamiento_estado_funcionamiento1_idx` (`estado_funcionamiento_id`);

--
-- Indices de la tabla `referencia`
--
ALTER TABLE `referencia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_referencia_marca_cpu1_idx` (`marca_pc_id`);

--
-- Indices de la tabla `reporte`
--
ALTER TABLE `reporte`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_reporte_usuario1_idx` (`usuario_id`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `secretaria`
--
ALTER TABLE `secretaria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_secretaria_dependencia_idx` (`dependencia_id`);

--
-- Indices de la tabla `sistema_operativo`
--
ALTER TABLE `sistema_operativo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_sistema_operativo_distribucion1_idx` (`distribucion_id`);

--
-- Indices de la tabla `software`
--
ALTER TABLE `software`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_adquisicion`
--
ALTER TABLE `tipo_adquisicion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_compra`
--
ALTER TABLE `tipo_compra`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_disco`
--
ALTER TABLE `tipo_disco`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_equipo`
--
ALTER TABLE `tipo_equipo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_impresora`
--
ALTER TABLE `tipo_impresora`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_mantenimiento`
--
ALTER TABLE `tipo_mantenimiento`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_mantenimiento_has_componentes`
--
ALTER TABLE `tipo_mantenimiento_has_componentes`
  ADD PRIMARY KEY (`tipo_mantenimiento_id`,`componentes_id`),
  ADD KEY `fk_tipo_mantenimiento_has_componentes_componentes1_idx` (`componentes_id`),
  ADD KEY `fk_tipo_mantenimiento_has_componentes_tipo_mantenimiento1_idx` (`tipo_mantenimiento_id`);

--
-- Indices de la tabla `tipo_monitor`
--
ALTER TABLE `tipo_monitor`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_ram`
--
ALTER TABLE `tipo_ram`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_usuario_rol1_idx` (`rol_id`),
  ADD KEY `fk_usuario_cargo1_idx` (`cargo_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `antivirus`
--
ALTER TABLE `antivirus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `area_trabajo`
--
ALTER TABLE `area_trabajo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `capacidad`
--
ALTER TABLE `capacidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `cargo`
--
ALTER TABLE `cargo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `componentes`
--
ALTER TABLE `componentes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `dependencia`
--
ALTER TABLE `dependencia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `distribucion`
--
ALTER TABLE `distribucion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empresa_proveedor`
--
ALTER TABLE `empresa_proveedor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `equipo`
--
ALTER TABLE `equipo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `escaner`
--
ALTER TABLE `escaner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `estado_funcionamiento`
--
ALTER TABLE `estado_funcionamiento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estado_pc`
--
ALTER TABLE `estado_pc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `forma_adquision`
--
ALTER TABLE `forma_adquision`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `impresora`
--
ALTER TABLE `impresora`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `informacion`
--
ALTER TABLE `informacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `licencias`
--
ALTER TABLE `licencias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mantenimiento`
--
ALTER TABLE `mantenimiento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `marca_disco`
--
ALTER TABLE `marca_disco`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `marca_dvd`
--
ALTER TABLE `marca_dvd`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `marca_mouse`
--
ALTER TABLE `marca_mouse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `marca_pc`
--
ALTER TABLE `marca_pc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `marca_procesador`
--
ALTER TABLE `marca_procesador`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `marca_ram`
--
ALTER TABLE `marca_ram`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `marca_teclado`
--
ALTER TABLE `marca_teclado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `monitor`
--
ALTER TABLE `monitor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `ofimatico`
--
ALTER TABLE `ofimatico`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pdf`
--
ALTER TABLE `pdf`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `perifericos`
--
ALTER TABLE `perifericos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `procesador`
--
ALTER TABLE `procesador`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ram`
--
ALTER TABLE `ram`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `referencia`
--
ALTER TABLE `referencia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `reporte`
--
ALTER TABLE `reporte`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `secretaria`
--
ALTER TABLE `secretaria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `sistema_operativo`
--
ALTER TABLE `sistema_operativo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `software`
--
ALTER TABLE `software`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_adquisicion`
--
ALTER TABLE `tipo_adquisicion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tipo_compra`
--
ALTER TABLE `tipo_compra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipo_disco`
--
ALTER TABLE `tipo_disco`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipo_equipo`
--
ALTER TABLE `tipo_equipo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipo_impresora`
--
ALTER TABLE `tipo_impresora`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tipo_mantenimiento`
--
ALTER TABLE `tipo_mantenimiento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_monitor`
--
ALTER TABLE `tipo_monitor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipo_ram`
--
ALTER TABLE `tipo_ram`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `antivirus_has_licencias`
--
ALTER TABLE `antivirus_has_licencias`
  ADD CONSTRAINT `fk_antivirus_has_licencias_antivirus1` FOREIGN KEY (`antivirus_id`) REFERENCES `antivirus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_antivirus_has_licencias_licencias1` FOREIGN KEY (`licencias_id`) REFERENCES `licencias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `capacidad`
--
ALTER TABLE `capacidad`
  ADD CONSTRAINT `fk_capacidad_equipo1` FOREIGN KEY (`equipo_id`) REFERENCES `equipo` (`id`),
  ADD CONSTRAINT `fk_capacidad_estado_disco1` FOREIGN KEY (`estado_disco_id`) REFERENCES `estado_funcionamiento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_capacidad_marca_disco1` FOREIGN KEY (`marca_disco_id`) REFERENCES `marca_disco` (`id`),
  ADD CONSTRAINT `fk_capacidad_tipo_disco1` FOREIGN KEY (`tipo_disco_id`) REFERENCES `tipo_disco` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD CONSTRAINT `fk_equipo_area_trabajo1` FOREIGN KEY (`area_trabajo_id`) REFERENCES `area_trabajo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_equipo_empresa_proveedor1` FOREIGN KEY (`empresa_proveedor_id`) REFERENCES `empresa_proveedor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_equipo_escaner1` FOREIGN KEY (`escaner_id`) REFERENCES `escaner` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_equipo_estado_pc1` FOREIGN KEY (`estado_pc_id`) REFERENCES `estado_pc` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_equipo_forma_adquision1` FOREIGN KEY (`forma_adquision_id`) REFERENCES `forma_adquision` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_equipo_impresora1` FOREIGN KEY (`impresora_id`) REFERENCES `impresora` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_equipo_informacion1` FOREIGN KEY (`informacion_id`) REFERENCES `informacion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_equipo_monitor1` FOREIGN KEY (`monitor_id`) REFERENCES `monitor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_equipo_perifericos1` FOREIGN KEY (`perifericos_id`) REFERENCES `perifericos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_equipo_procesador1` FOREIGN KEY (`procesador_id`) REFERENCES `procesador` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_equipo_procesamiento1` FOREIGN KEY (`procesamiento_id`) REFERENCES `ram` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_equipo_referencia1` FOREIGN KEY (`referencia_id`) REFERENCES `referencia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_equipo_secretaria1` FOREIGN KEY (`secretaria_id`) REFERENCES `secretaria` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_equipo_tipo_compra1` FOREIGN KEY (`tipo_compra_id`) REFERENCES `tipo_compra` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_equipo_tipo_equipo1` FOREIGN KEY (`tipo_equipo_id`) REFERENCES `tipo_equipo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_equipo_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `forma_adquision`
--
ALTER TABLE `forma_adquision`
  ADD CONSTRAINT `fk_forma_adquision_tipo_adquisicion1` FOREIGN KEY (`tipo_adquisicion_id`) REFERENCES `tipo_adquisicion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `impresora`
--
ALTER TABLE `impresora`
  ADD CONSTRAINT `fk_impresora_tipo_impresora1` FOREIGN KEY (`tipo_impresora_id`) REFERENCES `tipo_impresora` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `informacion`
--
ALTER TABLE `informacion`
  ADD CONSTRAINT `fk_informacion_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `licencias_has_equipo`
--
ALTER TABLE `licencias_has_equipo`
  ADD CONSTRAINT `fk_licencias_has_equipo_equipo1` FOREIGN KEY (`equipo_id`) REFERENCES `equipo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_licencias_has_equipo_licencias1` FOREIGN KEY (`licencias_id`) REFERENCES `licencias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `licencias_has_ofimatico`
--
ALTER TABLE `licencias_has_ofimatico`
  ADD CONSTRAINT `fk_licencias_has_ofimatico_licencias1` FOREIGN KEY (`licencias_id`) REFERENCES `licencias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_licencias_has_ofimatico_ofimatico1` FOREIGN KEY (`ofimatico_id`) REFERENCES `ofimatico` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `licencias_has_sistema_operativo`
--
ALTER TABLE `licencias_has_sistema_operativo`
  ADD CONSTRAINT `fk_licencias_has_sistema_operativo_licencias1` FOREIGN KEY (`licencias_id`) REFERENCES `licencias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_licencias_has_sistema_operativo_sistema_operativo1` FOREIGN KEY (`sistema_operativo_id`) REFERENCES `sistema_operativo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `licencias_has_software`
--
ALTER TABLE `licencias_has_software`
  ADD CONSTRAINT `fk_licencias_has_software_licencias1` FOREIGN KEY (`licencias_id`) REFERENCES `licencias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_licencias_has_software_software1` FOREIGN KEY (`software_id`) REFERENCES `software` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `mantenimiento`
--
ALTER TABLE `mantenimiento`
  ADD CONSTRAINT `fk_mantenimiento_estado_funcionamiento1` FOREIGN KEY (`estado_funcionamiento_id`) REFERENCES `estado_funcionamiento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_mantenimiento_tipo_mantenimiento_has_componentes1` FOREIGN KEY (`tipo_mantenimiento_has_componentes_tipo_mantenimiento_id`,`tipo_mantenimiento_has_componentes_componentes_id`) REFERENCES `tipo_mantenimiento_has_componentes` (`tipo_mantenimiento_id`, `componentes_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `monitor`
--
ALTER TABLE `monitor`
  ADD CONSTRAINT `fk_monitor_tipo_monitor1` FOREIGN KEY (`tipo_monitor_id`) REFERENCES `tipo_monitor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pdf_has_licencias`
--
ALTER TABLE `pdf_has_licencias`
  ADD CONSTRAINT `fk_pdf_has_licencias_licencias1` FOREIGN KEY (`licencias_id`) REFERENCES `licencias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pdf_has_licencias_pdf1` FOREIGN KEY (`pdf_id`) REFERENCES `pdf` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `perifericos`
--
ALTER TABLE `perifericos`
  ADD CONSTRAINT `fk_perifericos_marca_dvd1` FOREIGN KEY (`marca_dvd_id`) REFERENCES `marca_dvd` (`id`),
  ADD CONSTRAINT `fk_perifericos_marca_mouse1` FOREIGN KEY (`marca_mouse_id`) REFERENCES `marca_mouse` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_perifericos_marca_teclado1` FOREIGN KEY (`marca_teclado_id`) REFERENCES `marca_teclado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `procesador`
--
ALTER TABLE `procesador`
  ADD CONSTRAINT `fk_procesador_estado_funcionamiento1` FOREIGN KEY (`estado_funcionamiento_id`) REFERENCES `estado_funcionamiento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_procesador_marca_procesador1` FOREIGN KEY (`marca_procesador_id`) REFERENCES `marca_procesador` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ram`
--
ALTER TABLE `ram`
  ADD CONSTRAINT `fk_procesamiento_estado_funcionamiento1` FOREIGN KEY (`estado_funcionamiento_id`) REFERENCES `estado_funcionamiento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_procesamiento_marca1` FOREIGN KEY (`marca_id`) REFERENCES `marca_ram` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_procesamiento_tipo_ram1` FOREIGN KEY (`tipo_ram_id`) REFERENCES `tipo_ram` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `referencia`
--
ALTER TABLE `referencia`
  ADD CONSTRAINT `fk_referencia_marca_cpu1` FOREIGN KEY (`marca_pc_id`) REFERENCES `marca_pc` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `reporte`
--
ALTER TABLE `reporte`
  ADD CONSTRAINT `fk_reporte_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `secretaria`
--
ALTER TABLE `secretaria`
  ADD CONSTRAINT `fk_secretaria_dependencia` FOREIGN KEY (`dependencia_id`) REFERENCES `dependencia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `sistema_operativo`
--
ALTER TABLE `sistema_operativo`
  ADD CONSTRAINT `fk_sistema_operativo_distribucion1` FOREIGN KEY (`distribucion_id`) REFERENCES `distribucion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tipo_mantenimiento_has_componentes`
--
ALTER TABLE `tipo_mantenimiento_has_componentes`
  ADD CONSTRAINT `fk_tipo_mantenimiento_has_componentes_componentes1` FOREIGN KEY (`componentes_id`) REFERENCES `componentes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tipo_mantenimiento_has_componentes_tipo_mantenimiento1` FOREIGN KEY (`tipo_mantenimiento_id`) REFERENCES `tipo_mantenimiento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_cargo1` FOREIGN KEY (`cargo_id`) REFERENCES `cargo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuario_rol1` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
