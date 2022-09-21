-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-09-2022 a las 03:47:48
-- Versión del servidor: 8.0.30
-- Versión de PHP: 8.1.6

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
-- Estructura de tabla para la tabla `academias`
--

CREATE TABLE `academias` (
  `id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `website` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `academias`
--

INSERT INTO `academias` (`id`, `name`, `website`) VALUES
(1, 'Argentina Programa ETAPA 1', 'argentinaprograma.com'),
(2, 'Argentina Programa ETAPA 2', 'argentinaprograma.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `id` int NOT NULL,
  `name` varchar(80) NOT NULL,
  `lastname` varchar(80) NOT NULL,
  `occupation` varchar(80) NOT NULL,
  `academia_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `alumnos`
--

INSERT INTO `alumnos` (`id`, `name`, `lastname`, `occupation`, `academia_id`) VALUES
(1, 'Josue', 'Hoenicka', 'Fullstack Developer', 2),
(3, 'Joel', 'Velazquez', 'Frontend Developer', 1),
(4, 'Abib', 'Mendoza', 'Frontend Developer', 1),
(5, 'Nicolas', 'Campos', 'Frontend Developer', 1),
(6, 'Gabriel', 'Velazquez', 'Backend Developer', 2),
(7, 'Gustavo', 'Rodriguez', 'Fullstack Developer', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos_has_modulos`
--

CREATE TABLE `alumnos_has_modulos` (
  `id` int NOT NULL,
  `alumnos_id` int NOT NULL,
  `modulos_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `alumnos_has_modulos`
--

INSERT INTO `alumnos_has_modulos` (`id`, `alumnos_id`, `modulos_id`) VALUES
(3, 1, 8),
(8, 3, 3),
(9, 3, 3),
(10, 4, 3),
(11, 5, 3),
(12, 6, 7),
(13, 7, 13);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulos`
--

CREATE TABLE `modulos` (
  `id` int NOT NULL,
  `academia_id` int NOT NULL,
  `module` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `modulos`
--

INSERT INTO `modulos` (`id`, `academia_id`, `module`) VALUES
(1, 1, 1),
(3, 1, 2),
(4, 1, 3),
(5, 2, 1),
(6, 2, 2),
(7, 2, 3),
(8, 2, 4),
(9, 2, 5),
(10, 2, 6),
(11, 2, 7),
(12, 2, 8),
(13, 2, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas`
--

CREATE TABLE `notas` (
  `id` int NOT NULL,
  `alumnos_id` int NOT NULL,
  `modulos_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `academias`
--
ALTER TABLE `academias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Alumnos_Academia_idx` (`academia_id`);

--
-- Indices de la tabla `alumnos_has_modulos`
--
ALTER TABLE `alumnos_has_modulos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Alumnos_has_Modulos_Modulos1_idx` (`modulos_id`),
  ADD KEY `fk_Alumnos_has_Modulos_Alumnos1_idx` (`alumnos_id`);

--
-- Indices de la tabla `modulos`
--
ALTER TABLE `modulos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Modulos_Academia1_idx` (`academia_id`);

--
-- Indices de la tabla `notas`
--
ALTER TABLE `notas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Alumnos_has_Modulos1_Modulos1_idx` (`modulos_id`),
  ADD KEY `fk_Alumnos_has_Modulos1_Alumnos1_idx` (`alumnos_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `academias`
--
ALTER TABLE `academias`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `alumnos_has_modulos`
--
ALTER TABLE `alumnos_has_modulos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `modulos`
--
ALTER TABLE `modulos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `notas`
--
ALTER TABLE `notas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD CONSTRAINT `fk_Alumnos_Academia` FOREIGN KEY (`academia_id`) REFERENCES `academias` (`id`);

--
-- Filtros para la tabla `alumnos_has_modulos`
--
ALTER TABLE `alumnos_has_modulos`
  ADD CONSTRAINT `fk_Alumnos_has_Modulos_Alumnos1` FOREIGN KEY (`alumnos_id`) REFERENCES `alumnos` (`id`),
  ADD CONSTRAINT `fk_Alumnos_has_Modulos_Modulos1` FOREIGN KEY (`modulos_id`) REFERENCES `modulos` (`id`);

--
-- Filtros para la tabla `modulos`
--
ALTER TABLE `modulos`
  ADD CONSTRAINT `fk_Modulos_Academia1` FOREIGN KEY (`academia_id`) REFERENCES `academias` (`id`);

--
-- Filtros para la tabla `notas`
--
ALTER TABLE `notas`
  ADD CONSTRAINT `fk_Alumnos_has_Modulos1_Alumnos1` FOREIGN KEY (`alumnos_id`) REFERENCES `alumnos` (`id`),
  ADD CONSTRAINT `fk_Alumnos_has_Modulos1_Modulos1` FOREIGN KEY (`modulos_id`) REFERENCES `modulos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
