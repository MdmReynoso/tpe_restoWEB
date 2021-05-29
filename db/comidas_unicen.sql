-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-05-2021 a las 00:47:53
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `comidas_unicen.sql`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorías`
--

CREATE TABLE `categorías` (
  `id_categoria` int(11) NOT NULL,
  `nombres` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categorías`
--

INSERT INTO `categorías` (`id_categoria`, `nombres`) VALUES
(1, 'ENTRADAS/MINUTAS'),
(2, 'PLATO PRINCIPAL'),
(3, 'POSTRES');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `platos`
--

CREATE TABLE `platos` (
  `id_plato` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `detalles` text NOT NULL,
  `id_nacionalidad` varchar(200) NOT NULL,
  `id_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `platos`
--

INSERT INTO `platos` (`id_plato`, `nombre`, `detalles`, `id_nacionalidad`, `id_categoria`) VALUES
(1, 'Bruschetta', 'Consiste en rebanadas de pan tostado, rebozadas con algún ajo y puestas a la parrilla para que se doren', 'italia', 1),
(2, 'Focaccia de cebolla', 'La focaccia es una especie de pan plano cubierto con hierbas y otros productos alimenticios.​​Se trata de un plato tradicional de la cocina italiana muy relacionado con la popular pizza', 'Italia', 1),
(3, 'Lasaña rellena tradicional', 'La lasaña es un tipo de pasta. Se suele servir en láminas superpuestas intercaladas con capas de ingredientes al gusto, más frecuentemente carne en salsa boloñesa', 'Italia', 2),
(4, 'Cannoli', 'El cannoli es un dulce típico de la región italiana de Sicilia, de donde es originario. Consiste en una masa enrollada en forma de tubo que dentro lleva ingredientes mezclados con queso ricota.', 'Italia', 3),
(5, 'Arrollado de atún', 'Es un plato frío ideal para servir en días calurosos como entrada fresca antes de un plato principal. Se compone de un pionono (plancha de bizcochuelo finita) que se rellena con una mezcla de atún en lata, mayonesa, tomate pisado, huevo duro y mostaza. Se presenta en una fuente cubierto de mayonesa y decorado con tomatitos cherry y lechuga.', 'Argentina', 1),
(6, 'Asado', 'El asado argentino es el plato más popular y representativo de la gastronomía argentina. Consiste en trozos de carne (habitualmente de vaca, aunque también pueden incluirse partes del cordero o el cabrito) asados a la parrilla o al calor del fuego a manos de una persona que recibe el nombre de asador o parrillero. El método más extendido de preparación es el espiedo, que consiste en pinchar los trozos en un asta metálica. No obstante, también está muy extendido el método de asado horizontal.', 'Argentina', 2),
(7, 'Alfajores', 'Estos consisten en dos galletas unidas por algún relleno, como chocolate, dulce de leche, dulce de frutas, entre muchísimos otros. A su vez suelen estar recubiertos por chocolate o dulce de leche.', 'Argentina', 3),
(8, 'Gazpacho', 'El gazpacho es una sopa fría de pan majado, agua, aceite de oliva, vinagre, tomate, pepino, cebolla, ajo y pimiento verde, deliciosa y refrescante durante los meses de verano.', 'España', 1),
(9, 'Paella', 'La paella es la comida española más popular fuera de nuestras fronteras. Puedes encontrar paellas de pescado y marisco (¡nuestra favorita!), de carne, de verduras e incluso mixta, con un poquito de cada. Aunque es posible encontrarla por toda España, donde mejor sabe es en una terracita junto al mar en la costa mediterránea.\r\n\r\n', 'España', 2),
(10, 'Flan', 'El flan es un postre español que más comúnmente podemos encontrar, elaborar y consumir en cualquier parte.\r\n\r\nQuizás el tipo de flan más habitual es el flan de huevo, pero en los últimos años se han extendido otras variantes como el flan de vainilla, de café o de queso.', 'España', 3),
(11, 'Arepas de mandioca', 'Estas divinas arepas de mandioca, son suculentas y puedes servirlas en un desayuno o como parte de un almuerzo.', 'Brasil', 1),
(12, 'Acarajé', 'El acarajé es un plato de origen africano, muy típico también en Bahía, que te seducirá con su olor irresistible que recorre las calles. Básicamente, es un bollo hecho con una pasta de judías carillas, gambas, cebolla, sal y pimienta al gusto, que después de pasarlo por la batidora, se frie en aceite vegetal y se rellena con gambas cocidas, vatapá, cebolla y ocra.', 'Brasil', 2),
(13, 'cocadas', 'Las cocadas clásicas se elaboran con coco, huevos, manteca, harina de trigo y azúcar. Como variantes, existen recetas que incluyen banana, batata de umbu o guayaba, canela, vainilla o leche condensada.', 'Brasil', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `password` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `nombre`, `password`) VALUES
(2, 'Flavia', '17873732782823'),
(3, 'María Del Mar', '2723738234628346');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorías`
--
ALTER TABLE `categorías`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `platos`
--
ALTER TABLE `platos`
  ADD PRIMARY KEY (`id_plato`),
  ADD KEY `fk_categoria_plato` (`id_categoria`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorías`
--
ALTER TABLE `categorías`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `platos`
--
ALTER TABLE `platos`
  MODIFY `id_plato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `platos`
--
ALTER TABLE `platos`
  ADD CONSTRAINT `fk_categoria_plato` FOREIGN KEY (`id_categoria`) REFERENCES `categorías` (`id_categoria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
