-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-05-2018 a las 01:15:22
-- Versión del servidor: 10.1.32-MariaDB
-- Versión de PHP: 5.6.36

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistema_escuela`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiantes`
--

CREATE TABLE `estudiantes` (
  `id` int(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `session` varchar(50) NOT NULL,
  `turno` varchar(50) NOT NULL,
  `sede` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estudiantes`
--

INSERT INTO `estudiantes` (`id`, `nombre`, `apellido`, `email`, `session`, `turno`, `sede`) VALUES
(1, 'jonathan', 'castro', 'castrov_30@hotmail.com', 'a50', 'noche', 'centro'),
(2, 'derek', 'ramirez', 'derek@gmail.com', 'a40', 'tarde', 'naranjos'),
(3, 'chin', 'chon', 'chin@gmail.com', 'a30', 'noche', 'naranjos'),
(4, 'john', 'virmeo', 'virmeo@gmail.com', 'a30', 'noche', 'centro'),
(5, 'pepito', 'pepito', 'pepito@hotmail.com', 'a30', 'noche', 'naranjos'),
(6, '', '', '', 'a30', 'tarde', 'centro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarios`
--

CREATE TABLE `horarios` (
  `id` int(50) NOT NULL,
  `hora` int(50) NOT NULL,
  `profesor` varchar(50) NOT NULL,
  `materia` varchar(50) NOT NULL,
  `session` varchar(50) NOT NULL,
  `turno` varchar(50) NOT NULL,
  `sede` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `horarios`
--

INSERT INTO `horarios` (`id`, `hora`, `profesor`, `materia`, `session`, `turno`, `sede`) VALUES
(1, 6, 'yosmar', 'matematica1', 'a60', 'noche', 'centro'),
(2, 7, 'ramon', 'ingles1', 'a45', 'noche', 'centro'),
(3, 6, 'gabriela', 'estadistica1', 'a46', 'tarde', 'naranjos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesores`
--

CREATE TABLE `profesores` (
  `id` int(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `session` varchar(50) NOT NULL,
  `turno` varchar(50) NOT NULL,
  `sede` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `profesores`
--

INSERT INTO `profesores` (`id`, `nombre`, `apellido`, `email`, `session`, `turno`, `sede`) VALUES
(1, 'yosmar', 'chacon', 'yosmar@hotmail.com', 'a41', 'noche', 'centro'),
(2, 'charbel', 'wakan', 'wakan@yahoo.com', 'a89', 'mañana', 'naranjos'),
(3, 'victor', 'lion', 'lion@gmail.com', 'a30', 'noche', 'naranjos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sede`
--

CREATE TABLE `sede` (
  `id` int(50) NOT NULL,
  `sede` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sede`
--

INSERT INTO `sede` (`id`, `sede`) VALUES
(1, 'centro'),
(2, 'naranjos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `session`
--

CREATE TABLE `session` (
  `id` int(11) NOT NULL,
  `session` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `session`
--

INSERT INTO `session` (`id`, `session`) VALUES
(1, 'a40'),
(2, 'a41'),
(3, 'a42'),
(4, 'a43'),
(5, 'a44'),
(6, 'a45');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turno`
--

CREATE TABLE `turno` (
  `id` int(11) NOT NULL,
  `turno` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `turno`
--

INSERT INTO `turno` (`id`, `turno`) VALUES
(1, 'matutino'),
(2, 'vespertino'),
(3, 'nocturno');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `nacimiento` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telefono` bigint(50) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `contrasena` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `apellido`, `nacimiento`, `email`, `telefono`, `usuario`, `contrasena`) VALUES
(1, 'jonathan', 'castro', '19-10-1989', 'castrov_30@hotmail.com', 4246666666, 'admin', 'admin'),
(2, 'petra', 'chacon', '10-10-2001', 'algo@gmail.com', 4249999999, 'petra', 'petrica'),
(3, 'shawn', 'walker', '10-09-1920', 'shanw@yahoo.com', 4247777777, 'shawn', 'shawn'),
(4, 'prueba', 'prueba', '01-05-2018', 'algo@hotmail.com', 5459051, 'prueba', 'perro'),
(5, 'petro', 'kamil', '01-07-2017', 'petro@gmail.com', 5456753, 'petro', 'petro1');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `horarios`
--
ALTER TABLE `horarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `profesores`
--
ALTER TABLE `profesores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sede`
--
ALTER TABLE `sede`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `turno`
--
ALTER TABLE `turno`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `horarios`
--
ALTER TABLE `horarios`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `profesores`
--
ALTER TABLE `profesores`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `sede`
--
ALTER TABLE `sede`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `session`
--
ALTER TABLE `session`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `turno`
--
ALTER TABLE `turno`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;