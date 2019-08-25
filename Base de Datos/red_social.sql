-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-08-2019 a las 03:02:45
-- Versión del servidor: 10.1.34-MariaDB
-- Versión de PHP: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `red_social`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amigos`
--

CREATE TABLE `amigos` (
  `CodAm` int(11) NOT NULL,
  `usua_enviador` int(11) DEFAULT NULL,
  `usua_receptor` int(11) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `solicitud` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `amigos`
--

INSERT INTO `amigos` (`CodAm`, `usua_enviador`, `usua_receptor`, `status`, `solicitud`) VALUES
(1, 2, 1, b'1', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `CodCom` int(11) NOT NULL,
  `comentario` text,
  `CodPost` int(11) DEFAULT NULL,
  `CodUsua` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`CodCom`, `comentario`, `CodPost`, `CodUsua`) VALUES
(1, 'severo!!', 2, 1),
(2, 'woooow', 2, 1),
(3, 'vhjabhbkabjkd', 2, 2),
(4, ':o', 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mg`
--

CREATE TABLE `mg` (
  `CodLike` int(11) NOT NULL,
  `CodPost` int(11) DEFAULT NULL,
  `CodUsua` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `mg`
--

INSERT INTO `mg` (`CodLike`, `CodPost`, `CodUsua`) VALUES
(1, 2, 1),
(2, 2, 1),
(3, 2, 2),
(4, 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificaciones`
--

CREATE TABLE `notificaciones` (
  `CodNot` int(11) NOT NULL,
  `accion` bit(1) DEFAULT NULL,
  `visto` bit(1) DEFAULT NULL,
  `CodPost` int(11) DEFAULT NULL,
  `CodUsua` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `notificaciones`
--

INSERT INTO `notificaciones` (`CodNot`, `accion`, `visto`, `CodPost`, `CodUsua`) VALUES
(1, b'0', b'0', NULL, 1),
(2, b'1', b'1', 2, 1),
(3, b'0', b'1', 2, 1),
(4, b'1', b'1', 2, 1),
(5, b'1', b'1', 2, 2),
(6, b'0', b'1', 2, 2),
(7, b'0', b'0', 3, 1),
(8, b'1', b'0', 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `post`
--

CREATE TABLE `post` (
  `CodPost` int(11) NOT NULL,
  `contenido` text,
  `img` varchar(200) DEFAULT NULL,
  `CodUsua` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `post`
--

INSERT INTO `post` (`CodPost`, `contenido`, `img`, `CodUsua`) VALUES
(2, 'loooool', 'subidos/hora.png', 1),
(3, 'mmmmmm', 'subidos/hora.png\r\n', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `CodUsua` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `pass` varchar(200) DEFAULT NULL,
  `pais` varchar(100) DEFAULT NULL,
  `profesion` varchar(100) DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  `foto_perfil` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`CodUsua`, `nombre`, `usuario`, `pass`, `pais`, `profesion`, `edad`, `foto_perfil`) VALUES
(1, 'Angel', 'Strevens', '3c9909afec25354d551dae21590bb26e38d53f2173b8d3dc3eee4c047e7ab1c1eb8b85103e3be7ba613b31bb5c9c36214dc9f14a42fd7a2fdb84856bca5c44c2', 'Colombia', 'Sistemas', 18, 'subidos/perfil.jpg'),
(2, 'Linda', 'linda', 'e33294d67f7cb7a4a4dbc12af8dc12b1a417942dc6afa806c4a89aaf1eb27043e96c502c71cd3cb20d4956c180f801136cd18ee91ed245f2f4b25721702203ee', 'Colombia', 'Ingeniera', 26, 'subidos/hora.png');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `amigos`
--
ALTER TABLE `amigos`
  ADD PRIMARY KEY (`CodAm`),
  ADD KEY `usua_enviador` (`usua_enviador`),
  ADD KEY `usua_receptor` (`usua_receptor`);

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`CodCom`),
  ADD KEY `CodUsua` (`CodUsua`),
  ADD KEY `CodPost` (`CodPost`);

--
-- Indices de la tabla `mg`
--
ALTER TABLE `mg`
  ADD PRIMARY KEY (`CodLike`),
  ADD KEY `CodUsua` (`CodUsua`),
  ADD KEY `CodPost` (`CodPost`);

--
-- Indices de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  ADD PRIMARY KEY (`CodNot`),
  ADD KEY `CodUsua` (`CodUsua`),
  ADD KEY `fk_post` (`CodPost`);

--
-- Indices de la tabla `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`CodPost`),
  ADD KEY `CodUsua` (`CodUsua`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`CodUsua`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `amigos`
--
ALTER TABLE `amigos`
  MODIFY `CodAm` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `CodCom` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `mg`
--
ALTER TABLE `mg`
  MODIFY `CodLike` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  MODIFY `CodNot` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `post`
--
ALTER TABLE `post`
  MODIFY `CodPost` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `CodUsua` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `amigos`
--
ALTER TABLE `amigos`
  ADD CONSTRAINT `amigos_ibfk_1` FOREIGN KEY (`usua_enviador`) REFERENCES `usuarios` (`CodUsua`),
  ADD CONSTRAINT `amigos_ibfk_2` FOREIGN KEY (`usua_receptor`) REFERENCES `usuarios` (`CodUsua`);

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`CodUsua`) REFERENCES `usuarios` (`CodUsua`),
  ADD CONSTRAINT `comentarios_ibfk_2` FOREIGN KEY (`CodPost`) REFERENCES `post` (`CodPost`);

--
-- Filtros para la tabla `mg`
--
ALTER TABLE `mg`
  ADD CONSTRAINT `mg_ibfk_1` FOREIGN KEY (`CodUsua`) REFERENCES `usuarios` (`CodUsua`),
  ADD CONSTRAINT `mg_ibfk_2` FOREIGN KEY (`CodPost`) REFERENCES `post` (`CodPost`);

--
-- Filtros para la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  ADD CONSTRAINT `fk_post` FOREIGN KEY (`CodPost`) REFERENCES `post` (`CodPost`),
  ADD CONSTRAINT `notificaciones_ibfk_1` FOREIGN KEY (`CodUsua`) REFERENCES `usuarios` (`CodUsua`);

--
-- Filtros para la tabla `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `post_ibfk_1` FOREIGN KEY (`CodUsua`) REFERENCES `usuarios` (`CodUsua`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
