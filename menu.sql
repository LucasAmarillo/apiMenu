-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-10-2024 a las 02:45:54
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `menu`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comidas`
--

CREATE TABLE `comidas` (
  `id_plato` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `ingredientes` varchar(255) DEFAULT NULL,
  `id_tipoPlato` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comidas`
--

INSERT INTO `comidas` (`id_plato`, `nombre`, `precio`, `ingredientes`, `id_tipoPlato`) VALUES
(1, 'CocaCola 1Lts', 2600.00, '', 3),
(2, 'Agua 1Lts', 1000.00, '', 3),
(3, 'Pepsi 1Lts', 2300.00, '', 3),
(4, 'Cerveza Quilmes 1Lts', 2500.00, '', 3),
(5, 'Cerveza Heineken 1Lts', 2400.00, '', 3),
(6, 'Cepita Manzana 1Lts', 1500.00, '', 3),
(7, 'Vino Tinto Rutini', 10700.00, '', 3),
(8, 'Vino Toro Blanco', 3200.00, '', 3),
(9, 'Ensalada Clasica', 1.00, 'Lechuga,Tomate,Cebolla,Zanahoria,Sal', 2),
(10, 'Ensalada Cesar', 1.00, 'Lechuga costina,Pollo,Huevo,Aceite de oliva,Pimenton,Queso parmesano,Vinagre,Limon', 2),
(11, 'Empanadas Salteñas 3 Unidades', 1.00, 'Carne de nalga,Cebolla,Cebolla de verdeo,Morron rojo,Papa,Sal,Oregano,Pimenton,Aji molido,Huevo', 2),
(12, 'Empanadas de pollo 3 Unidades', 1.00, 'Pollo,Cebolla,Cebolla de verdeo,Aji molido,Sal,Salsa barbacoa,Crema de leche,Huevo', 2),
(13, 'Papas Fritas con Cheddar', 1.00, 'Papas,Queso cheddar,Manteca,Cebolla en polvo,Queso parmesano,Harina,Leche', 2),
(14, 'Papas Noisette', 1.00, 'Papas,Perejil picado,Aceite de oliva,Sal,Pimienta,Huevo,Harina', 2),
(15, 'Bife de Chorizo con Papas Fritas', 1.00, 'Bife de chorizo,Manteca,Perejil picado,Ajo,Sal,Pimienta,Aceite de oliva,Papas,Huevo', 1),
(16, 'Pastel de Papa', 1.00, 'Carne picada,Cebolla,Cebolla de verdeo,Queso,Papa,Morron rojo,Huevo,Sal,Pimienta,Ajo,Aji molido,Oregano', 1),
(17, 'Espaguetis de Espinaca con Verdudas', 1.00, 'Manteca,Cebolla,Ajo,Leche descremada,Morron rojo,Morron verde,Zanahoria,Espinacas,Sal,Queso parmesano,Aceite', 1),
(18, 'Ñoquis de Calabaza', 1.00, 'Calabaza,Harina,Huevo,Queso cremoso,Queso parmesano,Sal,Pimienta,Nuez moscada,Aceite de oliva', 1),
(19, 'Sorrentinos de Ricota y Acelga', 1.00, 'Harina,Huevo,Acelga,Ricota,Queso muzarella,Sal', 1),
(20, 'Canelones de Pollo y Verduras', 1.00, 'Panqueque,Acelga,Pollo,Cebolla,Morron rojo,Huevo,Sal,Tomate,Cebolla de verdeo', 1),
(21, 'Tiramisu', 1.00, 'Queso mascarpone,Nata,Azucar,Cafe,Cacao en polvo,Vainillas,Whisky', 4),
(22, 'Vigilante', 1.00, 'Queso cremoso,Dulce de batata,Dulce de membrillo', 4),
(23, 'Vaso Oreo', 1.00, 'Galletas oreo,Crema de leche,Helado(Americana,Chocolate,Dulce de leche),Crema batida,Dulce de leche', 4),
(24, 'Brownie con Helado', 1.00, 'Brownie de chocolate,Frutos rojos,Helado(Americana,Chocolate,Dulce de leche,Vainilla),Frutillas', 4),
(25, 'Ensalada de Frutas', 1.00, 'Banana,Manzana,Naranja,Pera,Durazno,Ciruela,Kiwi,Frutilla,Arandanos', 4),
(26, 'Flan con Dulce de Leche', 1.00, 'Leche,Azucar,Esencia de vainilla,Huevo,Dulce de leche', 4),
(27, 'Salsa 4 Quesos', 1.00, 'Queso parmesano,Queso azul,Queso cheddar,Queso maasdam,Leche,Nuez moscada,Pimienta', 5),
(28, 'Salsa Bolognesa', 1.00, 'Cebolla,Ajo,Morron rojo,Tomate,Vino,Zanahoria,Oregano,Laurel,Sal,Pimienta,Aceite de oliva,Carne picada', 5),
(29, 'Salsa Pesto', 1.00, 'Albaca,Ajo,Aceite de oliva,Nueces,Queso parmesano,Sal', 5),
(30, 'Salsa de Tomate', 1.00, 'Tomate,Cebolla,Ajo,Oregano,Albaca,Sal,Pimienta', 5),
(31, 'Salsa Blanca', 1.00, 'Manteca,Harina,Leche,Sal,Pimienta,Nuez moscada', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_comidas`
--

CREATE TABLE `tipo_comidas` (
  `id_plato` int(11) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_comidas`
--

INSERT INTO `tipo_comidas` (`id_plato`, `descripcion`) VALUES
(1, 'Plato Principal'),
(2, 'Entradas'),
(3, 'Bebidas'),
(4, 'Postres'),
(5, 'Salsas');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comidas`
--
ALTER TABLE `comidas`
  ADD PRIMARY KEY (`id_plato`);

--
-- Indices de la tabla `tipo_comidas`
--
ALTER TABLE `tipo_comidas`
  ADD PRIMARY KEY (`id_plato`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comidas`
--
ALTER TABLE `comidas`
  MODIFY `id_plato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `tipo_comidas`
--
ALTER TABLE `tipo_comidas`
  MODIFY `id_plato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
