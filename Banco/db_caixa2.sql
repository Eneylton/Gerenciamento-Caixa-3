-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 23-Dez-2021 às 15:00
-- Versão do servidor: 10.4.18-MariaDB
-- versão do PHP: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `db_caixa2`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `acessos`
--

CREATE TABLE `acessos` (
  `id` int(11) NOT NULL,
  `nivel` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `acessos`
--

INSERT INTO `acessos` (`id`, `nivel`) VALUES
(1, 'admin'),
(2, 'Assitente'),
(3, 'Coordenador'),
(4, 'Auxiliar');

-- --------------------------------------------------------

--
-- Estrutura da tabela `caixa`
--

CREATE TABLE `caixa` (
  `id` int(11) NOT NULL,
  `data` timestamp NULL DEFAULT current_timestamp(),
  `valor` decimal(10,2) DEFAULT NULL,
  `forma_pagamento_id` int(11) NOT NULL,
  `usuarios_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `caixa`
--

INSERT INTO `caixa` (`id`, `data`, `valor`, `forma_pagamento_id`, `usuarios_id`) VALUES
(28, '2021-12-01 11:43:32', '418.00', 2, 0),
(29, '2021-12-03 11:33:00', '378.00', 2, 0),
(30, '2021-12-04 11:28:18', '883.00', 2, 0),
(31, '2021-12-06 11:18:39', '1928.00', 2, 0),
(32, '2021-12-07 12:00:14', '403.00', 2, 0),
(33, '2021-12-08 12:39:20', '980.00', 2, 0),
(34, '2021-12-09 11:37:59', '895.00', 2, 0),
(35, '2021-12-10 12:00:55', '537.00', 2, 0),
(36, '2021-12-11 11:21:08', '223.00', 2, 0),
(37, '2021-12-13 11:30:46', '268.00', 2, 0),
(38, '2021-12-14 11:31:15', '313.00', 2, 0),
(39, '2021-12-15 11:12:38', '356.00', 2, 0),
(40, '2021-12-16 11:56:39', '321.00', 2, 0),
(41, '2021-12-17 11:16:53', '274.00', 2, 0),
(42, '2021-12-18 11:20:38', '370.00', 2, 0),
(43, '2021-12-20 11:20:15', '215.00', 2, 0),
(44, '2021-12-21 11:29:58', '217.00', 2, 0),
(45, '2021-12-22 11:57:40', '0.00', 2, 0),
(46, '2021-12-23 11:29:29', '130.00', 2, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cargos`
--

CREATE TABLE `cargos` (
  `id` int(11) NOT NULL,
  `descricao` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cargos`
--

INSERT INTO `cargos` (`id`, `descricao`) VALUES
(1, 'Asssistente de Logística'),
(3, NULL),
(4, 'Supervisor de Operações Logísticas Interior'),
(5, 'Encarregada de Expedição'),
(6, 'Assistente da qualidade'),
(7, 'Auxiliar de Logística'),
(8, 'Diretora'),
(9, 'Assistente Financeiro'),
(10, 'Coordenadora de RH');

-- --------------------------------------------------------

--
-- Estrutura da tabela `catdespesas`
--

CREATE TABLE `catdespesas` (
  `id` int(11) NOT NULL,
  `nome` varchar(105) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `catdespesas`
--

INSERT INTO `catdespesas` (`id`, `nome`) VALUES
(1, 'ADITIVO'),
(2, 'BALANCIAMENTO'),
(3, 'ALINHAMENTO+ PRODUTO'),
(11, 'ALINHAMENTO'),
(15, 'ALINHAMENTO / BALANCIAMENTO'),
(16, 'ENCALHAMENTO'),
(17, 'LIMPEZA DE BICO'),
(18, 'MÃO DE OBRA '),
(19, 'MECÂNICA GERAL'),
(20, 'LIMPEZA DO MOTOR'),
(21, 'REVISÃO CARRO G'),
(22, 'REVISÃO CARRO P'),
(23, 'SERVIÇOS MECÂNICOS'),
(24, 'SUSPENSÃO'),
(25, 'TROCA DE ÓLEO + FILTRO'),
(26, 'VENDA DE BATERIAS'),
(27, 'VENDA DE PEÇAS /SERVIÇOS'),
(28, 'VENDA DE PRODUTO'),
(29, 'VENDA PEÇAS'),
(30, 'REVISÃO SIMPLES'),
(31, 'REVISÃO GERAL'),
(32, 'OLEO + FILTRO'),
(33, 'ÁGUA'),
(34, 'ALIMENTAÇÃO'),
(35, 'COMPRA DE PEÇAS'),
(36, 'MATERIAL DE ESCRITÓRIO'),
(37, 'MERCEARIA'),
(38, 'PAGAMENTO JEFSON'),
(39, 'EXAMES ADM'),
(40, 'TROCA DE ÓLEO'),
(41, 'COMBUSTIVEL'),
(42, 'PADARIA'),
(43, 'VALE'),
(44, 'EXAME MÉDICO'),
(45, 'SANITIZAÇÃO'),
(46, 'LIMPEZA DE BICO');

-- --------------------------------------------------------

--
-- Estrutura da tabela `extra`
--

CREATE TABLE `extra` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `extra`
--

INSERT INTO `extra` (`id`, `nome`) VALUES
(2, 'LIMPEZA DO MOTOR'),
(3, 'GORJETAS'),
(4, 'LIMPEZA DE BICO'),
(5, 'ENCALHAMENTO');

-- --------------------------------------------------------

--
-- Estrutura da tabela `forma_pagamento`
--

CREATE TABLE `forma_pagamento` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `forma_pagamento`
--

INSERT INTO `forma_pagamento` (`id`, `nome`) VALUES
(2, 'Dinheiro'),
(3, 'Cartão de Crédito 1x'),
(4, 'Cartão de Crédito 2x'),
(5, 'Cartão de Crédito 3x'),
(6, 'Cartão de Crédito 4x'),
(7, 'Cartão de Débito'),
(8, 'Pix');

-- --------------------------------------------------------

--
-- Estrutura da tabela `maobra`
--

CREATE TABLE `maobra` (
  `id` int(11) NOT NULL,
  `data` timestamp NULL DEFAULT current_timestamp(),
  `cartao` decimal(10,2) DEFAULT NULL,
  `dinheiro` decimal(10,2) DEFAULT NULL,
  `debito` decimal(10,2) DEFAULT NULL,
  `pix` decimal(10,2) DEFAULT NULL,
  `transferencia` decimal(10,2) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `veiculo` varchar(45) DEFAULT NULL,
  `placa` varchar(45) DEFAULT NULL,
  `descricao` varchar(335) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `mecanicos_id` int(11) NOT NULL,
  `caixa_id` int(11) NOT NULL,
  `catdespesas_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `maobra`
--

INSERT INTO `maobra` (`id`, `data`, `cartao`, `dinheiro`, `debito`, `pix`, `transferencia`, `tipo`, `veiculo`, `placa`, `descricao`, `status`, `mecanicos_id`, `caixa_id`, `catdespesas_id`) VALUES
(131, '2021-12-01 18:36:31', '0.00', '0.00', '0.00', '100.00', '0.00', 0, 'JETTA', 'NENHUM', '', 0, 6, 28, 1),
(132, '2021-12-01 19:00:03', NULL, NULL, '100.00', NULL, NULL, 0, 'PRISMA', 'OJZ-3082', '', 0, 3, 28, 27),
(133, '2021-12-01 19:25:12', '50.00', NULL, NULL, NULL, NULL, 0, 'CRUZE', 'nao informado', '', 0, 7, 28, 18),
(134, '2021-12-01 19:28:30', '37.50', '37.50', NULL, NULL, NULL, 0, 'gol', 'NÃO INFORMADO', '', 0, 9, 28, 27),
(135, '2021-12-01 19:31:24', '40.00', '0.00', '0.00', '0.00', '0.00', 0, 'onix', 'pto9991', '', 0, 8, 28, 1),
(137, '2021-12-03 17:17:47', NULL, '25.00', NULL, NULL, NULL, 0, 'SANDERO', 'OJE 9844', '', 0, 1, 29, 27),
(138, '2021-12-03 18:41:00', NULL, NULL, '450.00', NULL, NULL, 0, 'BLESER', 'OXR 4911', '', 0, 6, 29, 27),
(139, '2021-12-04 13:21:53', NULL, '25.00', NULL, NULL, NULL, 0, 'bora', 'nhs 3964', '', 0, 4, 30, 27),
(140, '2021-12-04 14:00:08', '125.00', NULL, NULL, NULL, NULL, 0, 'palio', 'NÃO INFORMADO', '', 0, 7, 30, 27),
(141, '2021-12-04 14:28:14', NULL, NULL, '100.00', NULL, NULL, 0, 'hrv ', 'NÃO INFORMADO', '', 0, 6, 30, 27),
(142, '2021-12-04 15:13:13', '37.50', NULL, '37.50', NULL, NULL, 0, 'FIELSTA', 'OJK-5160', '', 0, 8, 30, 27),
(143, '2021-12-04 15:20:36', '50.00', NULL, NULL, '50.00', NULL, 0, 'FORD FIESTA', 'OJF8241', '', 0, 1, 30, 27),
(144, '2021-12-04 15:50:04', NULL, NULL, NULL, '75.00', NULL, 0, 'SANDERO', 'NÃO INFORMADO', '', 0, 7, 30, 27),
(145, '2021-12-06 12:57:47', NULL, NULL, NULL, '25.00', NULL, 0, 'UP', 'PSO 3068', 'PAGO LOJA', 0, 3, 31, 27),
(146, '2021-12-06 13:29:31', '75.00', NULL, NULL, NULL, NULL, 0, 'CLASSIC', 'NÃO INFORMADO', '', 0, 14, 31, 27),
(147, '2021-12-06 14:06:04', '50.00', NULL, '50.00', NULL, NULL, 0, 'CLASSIC', 'NMU 3566', '', 0, 5, 31, 27),
(148, '2021-12-06 18:00:01', NULL, '50.00', NULL, NULL, NULL, 0, 'ECO  SPORT', 'NÃO INFORMADO', '', 0, 14, 31, 27),
(149, '2021-12-06 21:03:24', NULL, '100.00', NULL, NULL, NULL, 0, 'SPIN', 'NÃO INFORMADO', '', 0, 7, 31, 27),
(150, '2021-12-06 21:06:35', '100.00', NULL, NULL, NULL, NULL, 0, 'SPIN', 'NÃO INFORMADO', '', 0, 7, 31, 27),
(151, '2021-12-07 12:37:36', '150.00', '0.00', '0.00', '0.00', '0.00', 0, 'DOBLO', 'QOX  1J13', '', 0, 1, 32, 1),
(152, '2021-12-07 14:11:15', '75.00', NULL, NULL, NULL, NULL, 0, 'FRONTIER', 'NÃO INFORMADO', '', 0, 2, 32, 27),
(153, '2021-12-07 15:03:33', '50.00', NULL, NULL, NULL, NULL, 0, 'FIESTA', 'OIX 1032', '', 0, 5, 32, 27),
(157, '2021-12-07 18:46:35', NULL, '100.00', NULL, NULL, NULL, 0, 'FOX', 'NÃO INFORMADO', '', 0, 11, 32, 27),
(158, '2021-12-07 18:50:02', NULL, NULL, '75.00', NULL, NULL, 0, 'CELTA', 'NÃO INFORMADO', '', 0, 8, 32, 27),
(159, '2021-12-07 20:22:26', '75.00', NULL, NULL, NULL, NULL, 0, 'CLASSIC', 'NÃO INFORMADO', '', 0, 5, 32, 27),
(160, '2021-12-07 20:28:29', NULL, NULL, NULL, '130.00', NULL, 0, 'RENEGADE', 'NÃO INFORMADO', 'PAGO PIX LOJA', 0, 9, 32, 28),
(162, '2021-12-07 21:00:07', NULL, '90.00', NULL, NULL, NULL, 0, 'GOL', 'OJJ 2863', '', 0, 4, 32, 27),
(163, '2021-12-07 21:02:23', '50.00', NULL, NULL, NULL, NULL, 0, 'UNO', 'NÃO INFORMADO', '', 0, 3, 32, 27),
(164, '2021-12-07 21:05:11', '100.00', NULL, NULL, NULL, NULL, 0, 'POLO', 'NÃO INFORMADO', 'PAGO NA MAQUINA JEFFERSON.', 0, 7, 32, 27),
(165, '2021-12-07 21:07:58', '50.00', NULL, NULL, NULL, NULL, 0, 'UNO', 'NÃO INFORMADO', 'PASSADA NA MAQUINA JEFFERSON', 0, 10, 32, 27),
(166, '2021-12-07 21:15:30', '125.00', NULL, NULL, NULL, NULL, 0, 'CLIO', 'NÃO INFORMADO', '', 0, 1, 32, 27),
(167, '2021-12-07 21:24:10', '25.00', NULL, NULL, NULL, NULL, 0, 'ONIX', 'NÃO INFORMADO', '', 0, 1, 32, 27),
(168, '2021-12-07 21:29:39', NULL, NULL, '15.00', NULL, NULL, 0, 'NENHUM', 'NÃO INFORMADO', '', 0, 8, 32, 11),
(169, '2021-12-08 12:56:49', NULL, NULL, '75.00', NULL, NULL, 0, 'HILLUX', 'NÃO INFORMADO', '', 0, 2, 33, 27),
(170, '2021-12-08 13:46:25', '100.00', NULL, NULL, NULL, NULL, 0, 'PALIO', 'NÃO INFORMADO', '', 0, 6, 33, 40),
(171, '2021-12-08 14:49:16', NULL, NULL, '40.00', NULL, NULL, 0, 'COBOLT', 'NÃO INFORMADO', '', 0, 8, 33, 27),
(172, '2021-12-08 16:31:56', '50.00', NULL, NULL, NULL, NULL, 0, 'GOLF', 'NÃO INFORMADO', '', 0, 7, 33, 27),
(173, '2021-12-09 11:39:08', '150.00', NULL, NULL, NULL, NULL, 0, 'ONIX', 'psy 8769', '', 0, 11, 34, 27),
(174, '2021-12-09 13:49:31', '75.00', NULL, NULL, NULL, NULL, 0, 'CLASSIC', 'NÃO INFORMADO', '', 0, 6, 34, 27),
(175, '2021-12-09 16:59:49', '50.00', NULL, NULL, NULL, NULL, 0, 'FORD KA', 'NÃO INFORMADO', '', 0, 4, 34, 27),
(176, '2021-12-09 18:08:03', '50.00', NULL, NULL, NULL, NULL, 0, 'FIESTA', 'NÃO INFORMADO', '', 0, 14, 34, 3),
(183, '2021-12-09 19:20:05', NULL, '30.00', NULL, NULL, NULL, 0, 'SW4', 'NÃO INFORMADO', '', 0, 14, 34, 23),
(185, '2021-12-09 19:31:17', NULL, '35.00', NULL, NULL, NULL, 0, 'STRADA', 'NÃO INFORMADO', '', 0, 7, 34, 27),
(186, '2021-12-09 20:18:51', NULL, NULL, '300.00', NULL, NULL, 0, 'PRISMA', 'PSM 9964', '', 0, 5, 34, 27),
(187, '2021-12-09 20:34:57', '75.00', '0.00', '0.00', '0.00', '0.00', 0, 'KA', 'NÃO INFORMADO', '', 0, 8, 34, 1),
(189, '2021-12-09 21:11:21', NULL, NULL, NULL, '25.00', NULL, 0, 'UNO', 'NÃO INFORMADO', 'PG PIX LOJA', 0, 4, 34, 27),
(192, '2021-12-09 21:27:31', NULL, '90.00', NULL, NULL, NULL, 0, 'NENHUM', 'NENHUM', '', 0, 14, 34, 15),
(193, '2021-12-09 21:29:43', NULL, '50.00', NULL, NULL, NULL, 0, 'DUSTER', 'NÃO INFORMADO', '', 0, 1, 34, 27),
(194, '2021-12-09 21:31:53', NULL, NULL, '50.00', NULL, NULL, 0, 'CLASSIC', 'NÃO INFORMADO', '', 0, 3, 34, 27),
(195, '2021-12-09 21:34:48', '25.00', NULL, NULL, NULL, NULL, 0, 'GOL', 'NÃO INFORMADO', '', 0, 3, 34, 27),
(196, '2021-12-08 14:49:15', NULL, NULL, '75.00', NULL, NULL, 0, 'NENHUM', 'NÃO INFORMADO', NULL, 0, 15, 33, 15),
(197, '2021-12-10 17:24:16', '20.00', NULL, NULL, NULL, NULL, 0, 'MOBI\'', 'NÃO INFORMADO', '', 0, 11, 35, 27),
(198, '2021-12-10 17:25:43', NULL, NULL, '100.00', NULL, NULL, 0, 'CROSFOX', 'NWX 7626', '', 0, 1, 35, 27),
(199, '2021-12-10 19:04:10', '50.00', NULL, NULL, NULL, NULL, 0, 'SIENA', 'NÃO INFORMADO', '', 0, 10, 35, 27),
(201, '2021-12-10 20:16:50', '975.00', '0.00', '0.00', '0.00', '0.00', 0, 'C3', 'NÃO INFORMADO', '', 0, 10, 35, 1),
(202, '2021-12-10 20:19:47', NULL, NULL, '150.00', NULL, NULL, 0, 'DUSTER', 'NÃO INFORMADO', '', 0, 5, 35, 23),
(203, '2021-12-10 20:25:27', NULL, '50.00', NULL, NULL, NULL, 0, 'MARCH', 'PSD 1F96', '', 0, 3, 35, 23),
(204, '2021-12-10 21:24:10', NULL, NULL, '45.00', NULL, NULL, 0, 'NENHUM', 'NÃO INFORMADO', '', 0, 15, 35, 11),
(205, '2021-12-10 21:27:31', NULL, NULL, '75.00', NULL, NULL, 0, 'DUSTER', 'NÃO INFORMADO', '', 0, 8, 35, 18),
(206, '2021-12-11 14:47:56', '100.00', NULL, NULL, NULL, NULL, 0, 'CLASSIC', 'NÃO INFORMADO', '', 0, 5, 36, 15),
(207, '2021-12-11 14:55:51', NULL, NULL, '25.00', NULL, NULL, 0, 'KA', 'NÃO INFORMADO', '', 0, 10, 36, 28),
(208, '2021-12-11 15:59:11', NULL, NULL, '40.00', NULL, NULL, 0, 'GOL', 'NÃO INFORMADO', '', 0, 14, 36, 18),
(209, '2021-12-11 16:33:02', NULL, NULL, '50.00', NULL, NULL, 0, 'KA', '', '', 0, 6, 36, 18),
(210, '2021-12-11 16:35:33', '725.00', NULL, NULL, NULL, NULL, 0, 'ECOSPORT', 'NÃO INFORMADO', '', 0, 7, 36, 18),
(211, '2021-12-13 12:05:02', NULL, '50.00', NULL, NULL, NULL, 0, 's10', 'ptl4834', '', 0, 15, 37, 18),
(212, '2021-12-13 13:51:40', NULL, NULL, '50.00', NULL, NULL, 0, 'LOGAN', 'NÃO INFORMADO', '', 0, 11, 37, 15),
(213, '2021-12-13 14:46:57', '25.00', NULL, NULL, NULL, NULL, 0, 'SIENA', 'NÃO INFORMADO', '', 0, 11, 37, 27),
(214, '2021-12-13 14:47:38', '25.00', NULL, NULL, NULL, NULL, 0, 'SIENA', 'NÃO INFORMADO', '', 0, 11, 37, 27),
(215, '2021-12-13 19:24:57', '40.00', NULL, NULL, NULL, NULL, 0, 'SANDERO', 'NÃO INFORMADO', '', 0, 10, 37, 27),
(217, '2021-12-13 20:04:07', '75.00', NULL, NULL, NULL, NULL, 0, 'C3', 'NÃO INFORMADO', '', 0, 4, 37, 27),
(219, '2021-12-13 20:59:19', NULL, NULL, '25.00', NULL, NULL, 0, 'UNO', 'OXU1006', '', 0, 16, 37, 27),
(220, '2021-12-13 21:37:55', '75.00', NULL, NULL, NULL, NULL, 0, 'PALIO', 'NÃO INFORMADO', '', 0, 9, 37, 27),
(221, '2021-12-13 21:39:31', '115.00', NULL, NULL, NULL, NULL, 0, 'PUNTO', 'NÃO INFORMADO', '', 0, 8, 37, 27),
(222, '2021-12-13 21:40:45', '100.00', NULL, NULL, NULL, NULL, 0, 'VERSA', 'NÃO INFORMADO', '', 0, 10, 37, 27),
(223, '2021-12-13 21:43:35', NULL, '75.00', NULL, NULL, NULL, 0, 'ONIX', 'NÃO INFORMADO', '', 0, 6, 37, 27),
(224, '2021-12-11 11:54:46', NULL, NULL, '75.00', NULL, NULL, 0, 'NENHUM', 'NÃO INFORMADO', '', 0, 15, 36, 15),
(225, '2021-12-14 12:51:36', '125.00', NULL, NULL, NULL, NULL, 0, 'DOBLO', 'PTM 3D68', '', 0, 8, 38, 27),
(226, '2021-12-14 13:16:57', NULL, NULL, '25.00', NULL, NULL, 0, 'HONDA CITY', 'PTL 4647', '', 0, 11, 38, 18),
(227, '2021-12-14 14:29:43', '125.00', NULL, NULL, NULL, NULL, 0, 'VOYAGE', 'nmr 5825', '', 0, 10, 38, 27),
(228, '2021-12-14 16:33:53', '125.00', NULL, NULL, NULL, NULL, 0, 'PICASSO', 'OSB 1C11', '', 0, 2, 38, 15),
(229, '2021-12-14 16:34:49', NULL, '25.00', NULL, NULL, NULL, 0, 'CLASSIC', 'NÃO INFORMADO', '', 0, 11, 38, 18),
(230, '2021-12-14 17:33:20', NULL, NULL, '25.00', NULL, NULL, 0, 'ARGO', 'NÃO INFORMADO', '', 0, 15, 38, 18),
(233, '2021-12-14 19:24:23', NULL, NULL, '25.00', NULL, NULL, 0, 'PEGEOT', 'NÃO INFORMADO', '', 0, 2, 38, 27),
(234, '2021-12-14 20:06:06', '150.00', NULL, NULL, NULL, NULL, 0, 'VERSA', 'NÃO INFORMADO', '', 0, 4, 38, 27),
(235, '2021-12-14 20:42:13', '150.00', NULL, NULL, NULL, NULL, 0, 'VOYAGE', 'NWW 0355', '', 0, 5, 38, 27),
(236, '2021-12-14 20:43:35', NULL, NULL, '250.00', NULL, NULL, 0, 'HILLUX', 'NÃO INFORMADO', '', 0, 2, 38, 27),
(238, '2021-12-14 21:07:57', '25.00', NULL, NULL, NULL, NULL, 0, 'MONTANA', 'NÃO INFORMADO', '', 0, 11, 38, 27),
(239, '2021-12-14 21:34:17', NULL, NULL, '100.00', NULL, NULL, 0, 'PALIO', 'NÃO INFORMADO', '', 0, 10, 38, 18),
(240, '2021-12-14 21:38:30', NULL, NULL, '75.00', NULL, NULL, 0, 'NENHUM', 'NÃO INFORMADO', '', 0, 14, 38, 18),
(241, '2021-12-14 21:46:06', NULL, NULL, '25.00', NULL, NULL, 0, 'HB20', 'NÃO INFORMADO', '', 0, 2, 38, 18),
(246, '2021-12-15 12:16:26', '375.00', NULL, '375.00', NULL, NULL, 0, 'PRISMA', 'NÃO INFORMADO', '', 0, 3, 39, 27),
(247, '2021-12-15 12:21:38', '150.00', NULL, '150.00', NULL, NULL, 0, 'PALIO', 'NÃO INFORMADO', '', 0, 9, 39, 27),
(251, '2021-12-15 17:20:42', NULL, NULL, '35.00', NULL, NULL, 0, 'TUCSON', 'MXG 9A60', '', 0, 8, 39, 27),
(254, '2021-12-15 17:53:18', '150.00', NULL, NULL, NULL, NULL, 0, 'PALIO', 'NÃO INFORMADO', '', 0, 6, 39, 27),
(257, '2021-12-15 20:56:01', '125.00', NULL, NULL, NULL, NULL, 0, 'SANDERO', 'NÃO INFORMADO', '', 0, 10, 39, 27),
(258, '2021-12-15 20:57:17', NULL, '35.00', NULL, NULL, NULL, 0, 'FIESTA', 'NÃO INFORMADO', '', 0, 7, 39, 27),
(259, '2021-12-15 20:59:08', NULL, NULL, '75.00', NULL, NULL, 0, 'NENHUM', 'NÃO INFORMADO', '', 0, 14, 39, 15),
(260, '2021-12-16 13:32:20', NULL, NULL, '25.00', NULL, NULL, 0, 'ECOSPORT', 'NÃO INFORMADO', 'PAGO PIX LOJA', 0, 8, 40, 27),
(261, '2021-12-16 17:24:19', NULL, NULL, '25.00', NULL, NULL, 0, 'CERATTO', 'nxo 1955', '', 0, 11, 40, 18),
(262, '2021-12-16 20:16:35', '75.00', NULL, NULL, NULL, NULL, 0, 'HILLUX', 'NÃO INFORMADO', '', 0, 2, 40, 27),
(263, '2021-12-16 20:17:29', NULL, NULL, '125.00', NULL, NULL, 0, 'DUSTER', 'NÃO INFORMADO', '', 0, 10, 40, 27),
(264, '2021-12-16 21:10:13', '100.00', NULL, '100.00', NULL, NULL, 0, 'FIESTA', 'OWJ 9292', '', 0, 3, 40, 27),
(265, '2021-12-16 21:31:47', NULL, NULL, '75.00', NULL, NULL, 0, 'NENHUM', 'NÃO INFORMADO', '', 0, 15, 40, 15),
(266, '2021-12-17 13:34:32', NULL, '25.00', NULL, NULL, NULL, 0, 'UNO', 'NÃO INFORMADO', '', 0, 7, 41, 27),
(267, '2021-12-17 18:40:39', NULL, '100.00', NULL, NULL, NULL, 0, 'AGILE', 'NÃO INFORMADO', '', 0, 9, 41, 27),
(269, '2021-12-17 19:12:35', '100.00', NULL, NULL, NULL, NULL, 0, 'COBOLT', 'PSD 6123', '', 0, 16, 41, 27),
(270, '2021-12-17 20:14:00', '25.00', NULL, NULL, NULL, NULL, 0, 'SANDERO', 'NÃO INFORMADO', '', 0, 2, 41, 27),
(271, '2021-12-17 20:23:36', NULL, NULL, '75.00', NULL, NULL, 0, 'KIWD', 'NÃO INFORMADO', '', 0, 5, 41, 27),
(272, '2021-12-17 20:59:04', NULL, NULL, '90.00', NULL, NULL, 0, 'NENHUM', 'NÃO INFORMADO', '', 0, 15, 41, 15),
(273, '2021-12-17 21:00:06', NULL, NULL, '200.00', NULL, NULL, 0, 'RENEGADE', 'NÃO INFORMADO', '', 0, 2, 41, 27),
(274, '2021-12-18 13:16:54', '75.00', NULL, NULL, NULL, NULL, 0, 'ONI XJOY', 'QWS 9G65', '', 0, 7, 42, 27),
(275, '2021-12-18 13:29:28', NULL, '75.00', NULL, NULL, NULL, 0, 'HR', 'NÃO INFORMADO', '', 0, 15, 42, 27),
(277, '2021-12-18 14:11:06', '35.00', NULL, NULL, NULL, NULL, 0, 'S10', '', '', 0, 3, 42, 27),
(278, '2021-12-20 14:36:31', NULL, NULL, NULL, '100.00', NULL, 0, 'VOYAGE', 'NÃO INFORMADO', 'PAGO  PIX LOJA ', 0, 10, 43, 27),
(279, '2021-12-20 16:36:11', '0.00', '0.00', '50.00', '0.00', '0.00', 0, 'CELTA', 'NÃO INFORMADO', '', 0, 7, 43, 1),
(280, '2021-12-20 19:39:16', '87.50', NULL, '87.50', NULL, NULL, 0, 'ECOSPORT', 'QJQ 8425', '', 0, 8, 43, 27),
(281, '2021-12-20 19:43:44', NULL, '200.00', NULL, NULL, NULL, 0, 'TORO', 'NÃO INFORMADO', '', 0, 10, 43, 18),
(282, '2021-12-20 21:19:25', NULL, NULL, NULL, '142.50', NULL, 0, 'PALIO', 'OIX 1243', 'PAGO PIX LOJA', 0, 2, 43, 27),
(283, '2021-12-20 21:22:12', NULL, NULL, '25.00', NULL, NULL, 0, 'PEGEOT', 'NÃO INFORMADO', '', 0, 3, 43, 27),
(284, '2021-12-20 21:24:59', NULL, NULL, '135.00', NULL, NULL, 0, 'NENHUM', 'NÃO INFORMADO', '', 0, 15, 43, 15),
(285, '2021-12-21 12:04:49', '50.00', NULL, NULL, NULL, NULL, 0, 'PALIO', 'OJG 2483', '', 0, 8, 44, 27),
(286, '2021-12-18 13:29:28', '0.00', NULL, '25.00', NULL, NULL, 0, 'hb20', 'OJG 2007', NULL, 0, 16, 42, 27),
(287, '2021-12-18 13:29:28', NULL, NULL, '50.00', NULL, NULL, 0, 'clio', 'NÃO INFORMADO', NULL, 0, 10, 42, 27),
(288, '2021-12-18 13:29:28', NULL, NULL, '30.00', NULL, NULL, 0, 'palio', 'NÃO INFORMADO', NULL, 0, 2, 42, 27),
(289, '2021-12-18 13:29:28', NULL, NULL, '105.00', NULL, NULL, NULL, 'Alinhamento / balanciamento', 'NÃO INFORMADO', NULL, 0, 15, 42, 27),
(290, '2021-12-21 14:29:38', '50.00', NULL, NULL, NULL, NULL, 0, 'VERSA', 'NÃO INFORMADO', '', 0, 3, 44, 27),
(291, '2021-12-21 14:53:27', '25.00', NULL, NULL, NULL, NULL, 0, 'HB20', 'PTC 0038', '', 0, 5, 44, 27),
(292, '2021-12-21 14:54:41', NULL, '25.00', NULL, NULL, NULL, 0, 'GOL', 'PSA 2455', '', 0, 15, 44, 18),
(293, '2021-12-21 14:59:00', '75.00', NULL, NULL, NULL, NULL, 0, 'ONIX', 'PSA 2455', '', 0, 10, 44, 27),
(294, '2021-12-21 19:14:37', NULL, NULL, NULL, '50.00', NULL, 0, 'palio', 'NÃO INFORMADO', 'pago pix loja', 0, 16, 44, 27),
(295, '2021-12-21 19:50:34', NULL, NULL, NULL, '20.00', NULL, 0, 'HILLUX', 'nkp 8129', 'PAGO PIX LOJA', 0, 11, 44, 25),
(296, '2021-12-21 20:13:01', NULL, NULL, '25.00', NULL, NULL, 0, 'ARGO', 'NÃO INFORMADO', '', 0, 5, 44, 27),
(297, '2021-12-21 20:56:30', NULL, NULL, '50.00', NULL, NULL, 0, 'MARCH', 'NÃO INFORMADO', '', 0, 10, 44, 27),
(298, '2021-12-21 21:10:14', NULL, '125.00', NULL, NULL, NULL, 0, 'STRADA', 'NÃO INFORMADO', '', 0, 3, 44, 27),
(299, '2021-12-21 21:17:25', '175.00', NULL, NULL, NULL, NULL, 0, 'HILLUX', 'NÃO INFORMADO', '', 0, 2, 44, 27),
(300, '2021-12-21 21:25:33', NULL, NULL, '150.00', NULL, NULL, 0, 'NENHUM', 'NÃO INFORMADO', '', 0, 14, 44, 15),
(301, '2021-12-21 21:27:11', NULL, NULL, NULL, '75.00', NULL, 0, 'CELTA', 'NÃO INFORMADO', 'PAGO PIX LOJA', 0, 11, 44, 23),
(302, '2021-12-21 21:33:42', NULL, NULL, '150.00', NULL, NULL, 0, 'FUSION', 'NÃO INFORMADO', '', 0, 14, 44, 23),
(303, '2021-12-21 21:43:00', NULL, NULL, NULL, '150.00', NULL, 0, 'HILLUX', 'NÃO INFORMADO', 'PAGO PIX LOJA', 0, 2, 44, 27),
(304, '2021-12-22 11:36:49', NULL, NULL, NULL, NULL, '25.00', 0, 'SPIN', 'NÃO INFORMADO', 'CLIENTE TRANSFERIU PARA CONTA DE JEFFERSON O PAGAMENTO DA SPIN.', 0, 7, 44, 27),
(305, '2021-12-22 11:58:14', NULL, '50.00', NULL, NULL, NULL, 0, 'HILLUX ', 'NÃO INFORMADO', '', 0, 2, 45, 18),
(306, '2021-12-22 14:34:00', NULL, NULL, NULL, '150.00', NULL, 0, 'UNO', 'OPQ 2G59', 'PAGO PIX LOJA', 0, 6, 45, 27),
(307, '2021-12-22 15:00:06', NULL, '100.00', NULL, NULL, NULL, 0, 'STRADA', 'NÃO INFORMADO', '', 0, 3, 45, 27),
(308, '2021-12-22 16:40:14', '175.00', NULL, NULL, NULL, NULL, 0, 'SIENA', 'NÃO INFORMADO', '', 0, 15, 44, 27),
(309, '2021-12-22 16:42:15', '175.00', NULL, NULL, NULL, NULL, 0, 'SIENNA', 'NÃO INFORMADO', '', 0, 15, 45, 27),
(310, '2021-12-22 17:44:24', '25.00', NULL, NULL, NULL, NULL, 0, 'COROLLA', 'OIS 9191', '', 0, 4, 45, 27),
(311, '2021-12-22 18:04:06', '25.00', NULL, NULL, NULL, NULL, 0, 'PALIO', 'OXZ 7203', '', 0, 7, 45, 28),
(312, '2021-12-22 19:48:08', '125.00', NULL, NULL, NULL, NULL, 0, 'SANDERO', 'PSF 4267', '', 0, 15, 45, 27),
(313, '2021-12-22 20:00:16', NULL, NULL, '50.00', NULL, NULL, 0, 'KIWD', 'PTA 7899', '', 0, 8, 45, 18),
(314, '2021-12-22 20:04:30', '400.00', '400.00', NULL, NULL, NULL, 0, 'FIESTA', 'NXJ 5105', 'PAGO PIX LOJA', 0, 6, 45, 27),
(315, '2021-12-22 20:16:16', NULL, '25.00', NULL, NULL, NULL, 0, 'HB20', 'NÃO INFORMADO', '', 0, 8, 45, 18),
(316, '2021-12-22 20:42:23', '100.00', NULL, NULL, NULL, NULL, 0, 'VERSA', 'OIX 3776', '', 0, 7, 45, 27),
(317, '2021-12-22 20:44:24', '20.00', NULL, '20.00', NULL, NULL, 0, 'PALIO', 'NÃO INFORMADO', '', 0, 10, 45, 27),
(318, '2021-12-23 11:41:07', '75.00', NULL, NULL, NULL, NULL, 0, 'LOGAN', 'PSK 4459', '', 0, 15, 46, 27),
(319, '2021-12-23 13:37:06', '40.00', NULL, NULL, NULL, NULL, 0, 'KIWD', 'ptw 7803', '', 0, 5, 46, 29);

-- --------------------------------------------------------

--
-- Estrutura da tabela `mecanicos`
--

CREATE TABLE `mecanicos` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `mecanicos`
--

INSERT INTO `mecanicos` (`id`, `nome`) VALUES
(1, 'ATANIEL'),
(2, 'BARRERINHAS'),
(3, 'GABRIEL'),
(4, 'CARLOS (PINTOR)'),
(5, 'MAYCON'),
(6, 'JOSIVALDO'),
(7, 'ZORRO'),
(8, 'NETO'),
(9, 'KARLYSON'),
(10, 'ROBSON'),
(11, 'MATHEUS JUNIOR'),
(14, 'NENHUM'),
(15, 'JEFERSON'),
(16, 'ADALBERTO'),
(17, 'FLAVIA');

-- --------------------------------------------------------

--
-- Estrutura da tabela `movimentacoes`
--

CREATE TABLE `movimentacoes` (
  `id` int(11) NOT NULL,
  `data` timestamp NULL DEFAULT current_timestamp(),
  `cartao` decimal(10,2) DEFAULT NULL,
  `dinheiro` decimal(10,2) DEFAULT NULL,
  `debito` decimal(10,2) DEFAULT NULL,
  `pix` decimal(10,2) DEFAULT NULL,
  `transferencia` decimal(10,2) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `veiculo` varchar(45) DEFAULT NULL,
  `placa` varchar(45) DEFAULT NULL,
  `descricao` varchar(335) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `catdespesas_id` int(11) NOT NULL,
  `caixa_id` int(11) NOT NULL,
  `mecanicos_id` int(11) NOT NULL,
  `maobra` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `movimentacoes`
--

INSERT INTO `movimentacoes` (`id`, `data`, `cartao`, `dinheiro`, `debito`, `pix`, `transferencia`, `tipo`, `veiculo`, `placa`, `descricao`, `status`, `catdespesas_id`, `caixa_id`, `mecanicos_id`, `maobra`) VALUES
(165, '2021-12-01 11:49:51', '0.00', '0.00', '160.00', '0.00', '0.00', 1, 'STRADA', 'NÃO INFORMADO', '', 1, 32, 28, 5, '0.00'),
(166, '2021-12-01 11:51:04', '490.00', '0.00', '0.00', '0.00', '0.00', 1, 'ONIX', 'NÃO INFORMADO', '', 1, 26, 28, 1, '0.00'),
(167, '2021-12-01 11:53:38', '0.00', '0.00', '490.00', '0.00', '0.00', 1, 'SPIN', 'NÃO INFORMADO', '', 1, 26, 28, 1, '0.00'),
(168, '2021-12-01 12:21:03', '0.00', '90.00', '0.00', '0.00', '0.00', 0, '', '', '', 1, 35, 28, 14, '0.00'),
(169, '2021-12-01 13:38:59', '0.00', '10.00', '0.00', '0.00', '0.00', 1, 'clio', 'NÃO INFORMADO', '', 1, 29, 28, 3, '0.00'),
(173, '2021-12-01 14:18:13', '335.00', '0.00', '0.00', '0.00', '0.00', 1, 'tiggo', 'ptr 5f64', '', 1, 25, 28, 11, '0.00'),
(177, '2021-12-01 15:03:54', '0.00', '100.00', '0.00', '0.00', '0.00', 0, '', '', '', 1, 34, 28, 14, '0.00'),
(183, '2021-12-01 18:15:06', '0.00', '0.00', '60.00', '0.00', '0.00', 1, 'FRONTIER', 'OUC 4184', '', 1, 1, 28, 11, '0.00'),
(184, '2021-12-01 18:36:31', '200.00', '0.00', '0.00', '0.00', '0.00', 1, 'JETTA', 'NENHUM', '', 1, 23, 28, 6, '200.00'),
(185, '2021-12-01 18:46:49', '0.00', '25.00', '0.00', '0.00', '0.00', 1, 'PALIO', 'NÃO INFORMADO', '', 1, 32, 28, 14, '0.00'),
(186, '2021-12-01 19:00:03', '0.00', '0.00', '380.00', '0.00', '0.00', 1, 'PRISMA', 'OJZ-3082', '', 1, 27, 28, 3, '200.00'),
(188, '2021-12-01 19:28:31', '600.00', '220.00', '0.00', '0.00', '0.00', 1, 'gol', 'NÃO INFORMADO', '', 1, 27, 28, 9, '150.00'),
(189, '2021-12-01 19:31:24', '750.00', '0.00', '0.00', '0.00', '0.00', 1, 'onix', 'pto9991', '', 1, 31, 28, 8, '80.00'),
(190, '2021-12-01 19:35:31', '0.00', '0.00', '40.00', '0.00', '0.00', 1, 'TORO', 'NÃO INFORMADO', '', 1, 1, 28, 8, '0.00'),
(191, '2021-12-01 19:36:58', '480.00', '0.00', '0.00', '0.00', '0.00', 1, 'TIGREE', 'NÃO INFORMADO', '', 1, 26, 28, 1, '0.00'),
(192, '2021-12-01 19:38:13', '180.00', '0.00', '0.00', '0.00', '0.00', 1, 'GOL', 'NÃO INFORMADO', '', 1, 32, 28, 8, '0.00'),
(193, '2021-12-01 19:39:23', '230.00', '0.00', '0.00', '0.00', '0.00', 1, 'MARCH', 'NÃO INFORMADO', '', 1, 40, 28, 4, '0.00'),
(194, '2021-12-01 19:40:20', '0.00', '100.00', '0.00', '0.00', '0.00', 1, 'CRUZE', 'NÃO INFORMADO', '', 1, 18, 28, 7, '100.00'),
(195, '2021-12-01 19:46:36', '0.00', '20.00', '0.00', '0.00', '0.00', 0, 'FRONTIER', 'NÃO INFORMADO', 'ENTROU COMO DÉBITO NO VALOR DE 60 REAIS ', 1, 1, 28, 11, '0.00'),
(196, '2021-12-03 11:42:16', '0.00', '0.00', '100.00', '0.00', '0.00', 1, 'TORO', 'NÃO INFORMADO', '', 1, 29, 29, 8, '0.00'),
(197, '2021-12-03 11:42:54', '30.00', '0.00', '0.00', '0.00', '0.00', 1, 'LOGAN', 'NÃO INFORMADO', '', 1, 29, 29, 2, '0.00'),
(199, '2021-12-03 11:53:58', '0.00', '0.00', '0.00', '350.00', '0.00', 1, 'ONIX', 'NÃO INFORMADO', 'PG PIX LOJA', 1, 26, 29, 1, '0.00'),
(200, '2021-12-03 12:18:32', '0.00', '35.00', '0.00', '0.00', '0.00', 1, 'COBOLT', 'OXU 2E15', '', 1, 28, 29, 1, '0.00'),
(202, '2021-12-03 12:20:15', '0.00', '250.00', '0.00', '0.00', '0.00', 1, 'HR-V', 'QEA 7J54', '', 1, 29, 29, 2, '0.00'),
(204, '2021-12-03 12:42:56', '0.00', '0.00', '0.00', '550.00', '0.00', 1, 'JEEP RENEGADE', 'PRN 4248', 'PG PIX LOJA', 1, 27, 29, 2, '0.00'),
(205, '2021-12-03 13:32:32', '0.00', '50.00', '0.00', '0.00', '0.00', 1, 'yaris', 'ROD 7J79', '', 1, 15, 29, 8, '0.00'),
(206, '2021-12-03 14:03:08', '0.00', '180.00', '0.00', '0.00', '0.00', 1, 'LINEA', 'NÃO INFORMADO', '', 1, 40, 29, 8, '0.00'),
(207, '2021-12-03 14:14:29', '0.00', '0.00', '340.00', '0.00', '0.00', 1, 'COBOLT', 'NÃO INFORMADO', '', 1, 29, 29, 7, '0.00'),
(211, '2021-12-03 15:00:11', '0.00', '0.00', '0.00', '280.00', '0.00', 1, 'L200', 'NÃO INFORMADO', '', 1, 32, 29, 7, '0.00'),
(212, '2021-12-03 15:01:06', '0.00', '0.00', '400.00', '0.00', '0.00', 1, 'LOGA', 'NÃO INFORMADO', '', 1, 25, 29, 3, '0.00'),
(213, '2021-12-03 15:07:38', '0.00', '10.00', '0.00', '0.00', '0.00', 1, 'L200', 'NÃO INFORMADO', '', 1, 29, 29, 2, '0.00'),
(215, '2021-12-03 16:47:20', '0.00', '20.00', '0.00', '0.00', '0.00', 0, '', 'NÃO INFORMADO', '', 1, 41, 29, 6, '0.00'),
(216, '2021-12-03 17:08:54', '0.00', '0.00', '350.00', '0.00', '0.00', 1, 'VERSA', 'NÃO INFORMADO', '', 1, 29, 29, 3, '0.00'),
(217, '2021-12-03 17:17:47', '0.00', '760.00', '0.00', '0.00', '0.00', 1, 'SANDERO', 'OJE 9844', '', 1, 27, 29, 1, '50.00'),
(218, '2021-12-03 18:41:00', '0.00', '0.00', '1720.00', '0.00', '0.00', 1, 'BLESER', 'OXR 4911', '', 1, 27, 29, 6, '900.00'),
(220, '2021-12-04 11:57:43', '0.00', '400.00', '0.00', '0.00', '0.00', 1, 'FIORINO', 'NÃO INFORMADO', '', 1, 26, 30, 1, '0.00'),
(221, '2021-12-04 12:01:31', '0.00', '0.00', '160.00', '0.00', '0.00', 1, 'STRADA', 'NÃO INFORMADO', '', 1, 32, 30, 10, '0.00'),
(222, '2021-12-04 12:02:35', '0.00', '450.00', '0.00', '0.00', '0.00', 1, 'COROLLA', '', '', 1, 26, 30, 1, '0.00'),
(223, '2021-12-04 12:22:31', '0.00', '0.00', '0.00', '80.00', '0.00', 1, 'LOGAN', 'NÃO INFORMADO', 'PG LOJA', 1, 29, 30, 9, '0.00'),
(225, '2021-12-04 13:21:53', '0.00', '200.00', '0.00', '0.00', '0.00', 1, 'bora', 'nhs 3964', '', 1, 27, 30, 4, '50.00'),
(226, '2021-12-04 13:47:33', '0.00', '0.00', '40.00', '0.00', '0.00', 1, 'fiesta', 'NÃO INFORMADO', '', 1, 1, 30, 14, '0.00'),
(227, '2021-12-04 13:48:16', '0.00', '0.00', '180.00', '0.00', '0.00', 1, 'ONIX', 'NÃO INFORMADO', '', 1, 40, 30, 14, '0.00'),
(228, '2021-12-04 13:49:09', '25.00', '0.00', '0.00', '0.00', '0.00', 1, 'hb20', 'NÃO INFORMADO', '', 1, 29, 30, 14, '0.00'),
(229, '2021-12-04 13:52:08', '450.00', '0.00', '0.00', '0.00', '0.00', 1, 'hillux', 'psn 9c31', '', 1, 25, 30, 2, '0.00'),
(231, '2021-12-04 14:00:08', '1500.00', '0.00', '0.00', '0.00', '0.00', 1, 'palio', 'NÃO INFORMADO', '', 1, 27, 30, 7, '250.00'),
(232, '2021-12-04 14:28:14', '0.00', '0.00', '350.00', '0.00', '0.00', 1, 'hrv ', 'NÃO INFORMADO', '', 1, 27, 30, 6, '200.00'),
(233, '2021-12-04 14:37:06', '0.00', '25.00', '0.00', '0.00', '0.00', 1, 'up', 'oxu 1j67', '', 1, 28, 30, 5, '0.00'),
(234, '2021-12-04 14:55:24', '0.00', '20.00', '0.00', '0.00', '0.00', 0, '', '', '', 1, 41, 30, 14, '0.00'),
(235, '2021-12-04 15:06:00', '30.00', '0.00', '0.00', '0.00', '0.00', 1, 'MOBI\'', 'PTJ-2389', '', 1, 28, 30, 1, '0.00'),
(236, '2021-12-04 15:13:13', '500.00', '0.00', '500.00', '0.00', '0.00', 1, 'FIELSTA', 'OJK-5160', '', 1, 27, 30, 8, '150.00'),
(237, '2021-12-04 15:20:36', '900.00', '0.00', '0.00', '870.00', '0.00', 1, 'FORD FIESTA', 'OJF8241', '', 1, 27, 30, 1, '200.00'),
(238, '2021-12-04 15:23:45', '0.00', '10.00', '0.00', '0.00', '0.00', 0, '', '', '', 1, 42, 30, 14, '0.00'),
(239, '2021-12-04 15:50:04', '0.00', '0.00', '0.00', '790.00', '0.00', 1, 'SANDERO', 'NÃO INFORMADO', '', 1, 27, 30, 7, '150.00'),
(240, '2021-12-06 12:36:48', '0.00', '100.00', '0.00', '0.00', '0.00', 1, 'HRV', 'NÃO INFORMADO', '', 1, 32, 31, 1, '0.00'),
(241, '2021-12-06 12:57:47', '0.00', '0.00', '0.00', '400.00', '0.00', 1, 'UP', 'PSO 3068', 'PAGO LOJA', 1, 27, 31, 3, '50.00'),
(242, '2021-12-06 13:01:26', '0.00', '105.00', '0.00', '0.00', '0.00', 0, 'GAS', '', 'COMPRA DE GÁS PARA COZINHA', 1, 37, 31, 14, '0.00'),
(243, '2021-12-06 13:29:31', '550.00', '0.00', '0.00', '0.00', '0.00', 1, 'CLASSIC', 'NÃO INFORMADO', '', 1, 27, 31, 14, '150.00'),
(244, '2021-12-06 13:58:15', '0.00', '50.00', '0.00', '0.00', '0.00', 0, 'MOTO', 'NÃO INFORMADO', '', 1, 41, 31, 1, '0.00'),
(245, '2021-12-06 14:06:04', '300.00', '0.00', '230.00', '0.00', '0.00', 1, 'CLASSIC', 'NMU 3566', '', 1, 27, 31, 5, '200.00'),
(246, '2021-12-06 14:06:57', '0.00', '0.00', '40.00', '0.00', '0.00', 1, 'LOGAN', 'NÃO INFORMADO', '', 1, 1, 31, 3, '0.00'),
(247, '2021-12-06 14:09:16', '180.00', '0.00', '0.00', '0.00', '0.00', 1, 'UP', 'NÃO INFORMADO', '', 1, 40, 31, 3, '0.00'),
(248, '2021-12-06 14:29:23', '0.00', '0.00', '450.00', '0.00', '0.00', 1, 'AGILE', 'NÃO INFORMADO', '', 1, 26, 31, 1, '0.00'),
(249, '2021-12-06 14:39:19', '0.00', '370.00', '0.00', '0.00', '0.00', 0, '', '', '', 1, 34, 31, 14, '0.00'),
(250, '2021-12-06 14:44:21', '490.00', '0.00', '0.00', '0.00', '0.00', 1, 'PRISMA', 'NÃO INFORMADO', '', 1, 26, 31, 1, '0.00'),
(251, '2021-12-06 15:02:46', '0.00', '0.00', '230.00', '0.00', '0.00', 1, 'STRADA', 'NÃO INFORMADO', '', 1, 3, 31, 10, '0.00'),
(252, '2021-12-06 18:00:01', '0.00', '140.00', '0.00', '0.00', '0.00', 1, 'ECO  SPORT', 'NÃO INFORMADO', '', 1, 27, 31, 14, '100.00'),
(253, '2021-12-06 18:03:27', '140.00', '0.00', '0.00', '0.00', '0.00', 1, 'SIENA', 'NÃO INFORMADO', '', 1, 40, 31, 11, '0.00'),
(255, '2021-12-06 19:41:22', '0.00', '460.00', '0.00', '0.00', '0.00', 1, 'LOGAN', 'NÃO INFORMADO', '', 1, 26, 31, 9, '0.00'),
(256, '2021-12-06 19:51:31', '0.00', '0.00', '190.00', '0.00', '0.00', 1, 'CROSFOX', 'NÃO INFORMADO', '', 1, 25, 31, 2, '0.00'),
(257, '2021-12-06 19:59:43', '430.00', '0.00', '0.00', '0.00', '0.00', 1, 'VOYAGE', 'NÃO INFORMADO', '', 1, 29, 31, 11, '0.00'),
(258, '2021-12-06 20:11:48', '250.00', '0.00', '0.00', '0.00', '0.00', 1, 'LOGAN', 'OJP 2H43', '', 1, 23, 31, 2, '0.00'),
(259, '2021-12-06 20:22:14', '420.00', '0.00', '0.00', '0.00', '0.00', 1, 'CRETA', 'PTN 0068', '', 1, 29, 31, 9, '0.00'),
(260, '2021-12-06 20:23:55', '490.00', '0.00', '0.00', '0.00', '0.00', 1, 'PALIO', 'NÃO INFORMADO', '', 1, 29, 31, 11, '0.00'),
(261, '2021-12-06 20:35:32', '250.00', '0.00', '0.00', '0.00', '0.00', 1, 'PUNTO', 'NÃO INFORMADO', '', 1, 29, 31, 1, '0.00'),
(262, '2021-12-06 20:47:26', '0.00', '50.00', '0.00', '0.00', '0.00', 1, 'HB20', 'NÃO INFORMADO', '', 1, 29, 31, 14, '0.00'),
(263, '2021-12-06 20:58:10', '0.00', '130.00', '0.00', '0.00', '0.00', 1, 'CLASSIC', 'NÃO INFORMADO', '', 1, 28, 31, 14, '0.00'),
(265, '2021-12-06 21:06:35', '1780.00', '0.00', '0.00', '0.00', '0.00', 1, 'SPIN', 'NÃO INFORMADO', '', 1, 27, 31, 7, '200.00'),
(267, '2021-12-07 12:22:02', '120.00', '0.00', '0.00', '0.00', '0.00', 1, 'SPIN', 'OXY 5280', '', 1, 29, 32, 8, '0.00'),
(268, '2021-12-07 12:37:36', '300.00', '0.00', '0.00', '0.00', '0.00', 1, 'DOBLO', 'QOX  1J13', '', 1, 23, 32, 1, '300.00'),
(269, '2021-12-07 13:57:36', '0.00', '0.00', '100.00', '0.00', '0.00', 1, 'GRAN SIENNA', 'NÃO INFORMADO', '', 1, 25, 32, 10, '0.00'),
(270, '2021-12-07 14:11:15', '500.00', '0.00', '0.00', '0.00', '0.00', 1, 'FRONTIER', 'NÃO INFORMADO', '', 1, 27, 32, 2, '150.00'),
(271, '2021-12-07 14:33:48', '0.00', '170.00', '0.00', '0.00', '0.00', 1, 'PRISMA', 'NÃO INFORMADO', '', 1, 32, 32, 9, '0.00'),
(272, '2021-12-07 14:41:52', '0.00', '123.00', '0.00', '0.00', '0.00', 0, 'ALIMENTACAO', '', 'PAGAMENTO DA ALIMENTAÇÃO', 1, 34, 32, 14, '0.00'),
(273, '2021-12-07 15:03:33', '400.00', '0.00', '0.00', '0.00', '0.00', 1, 'FIESTA', 'OIX 1032', '', 1, 27, 32, 5, '100.00'),
(274, '2021-12-07 17:01:22', '150.00', '0.00', '0.00', '0.00', '0.00', 1, 'STRADA', 'NÃO INFORMADO', '', 1, 29, 32, 14, '0.00'),
(275, '2021-12-07 18:08:12', '0.00', '0.00', '180.00', '0.00', '0.00', 1, 'COROLLA', 'NXQ 4064', '', 1, 40, 32, 14, '0.00'),
(279, '2021-12-07 18:46:35', '0.00', '1000.00', '0.00', '0.00', '0.00', 1, 'FOX', 'NÃO INFORMADO', '', 1, 27, 32, 11, '200.00'),
(280, '2021-12-07 18:50:02', '0.00', '0.00', '1290.00', '0.00', '0.00', 1, 'CELTA', 'NÃO INFORMADO', '', 1, 27, 32, 8, '150.00'),
(281, '2021-12-07 19:30:29', '0.00', '0.00', '30.00', '0.00', '0.00', 1, 'ETIOS', 'NÃO INFORMADO', '', 1, 26, 32, 14, '0.00'),
(282, '2021-12-07 19:43:06', '0.00', '0.00', '80.00', '0.00', '0.00', 1, 'MARCH', 'NÃO INFORMADO', '', 1, 25, 32, 7, '0.00'),
(284, '2021-12-07 20:09:02', '0.00', '20.00', '0.00', '0.00', '0.00', 0, '', '', 'COMPRA DE PÃO PARA 4 DIAS', 1, 42, 32, 1, '0.00'),
(285, '2021-12-07 20:22:26', '440.00', '0.00', '0.00', '0.00', '0.00', 1, 'CLASSIC', 'NÃO INFORMADO', '', 1, 27, 32, 5, '150.00'),
(286, '2021-12-07 20:28:29', '0.00', '0.00', '0.00', '300.00', '0.00', 1, 'RENEGADE', 'NÃO INFORMADO', 'PAGO PIX LOJA', 1, 28, 32, 9, '260.00'),
(287, '2021-12-07 20:44:40', '0.00', '60.00', '0.00', '0.00', '0.00', 0, '', '', 'PAGO SERVIÇO EXTRA DE LIMPEZA', 1, 20, 32, 10, '0.00'),
(289, '2021-12-07 21:00:07', '0.00', '1160.00', '0.00', '0.00', '0.00', 1, 'GOL', 'OJJ 2863', '', 1, 27, 32, 4, '180.00'),
(290, '2021-12-07 21:02:23', '250.00', '0.00', '0.00', '0.00', '0.00', 1, 'UNO', 'NÃO INFORMADO', '', 1, 27, 32, 3, '100.00'),
(291, '2021-12-07 21:03:29', '0.00', '0.00', '0.00', '350.00', '0.00', 1, 'STRADA', 'NÃO INFORMADO', 'PAGO  PIX LOJA', 1, 26, 32, 3, '0.00'),
(292, '2021-12-07 21:05:11', '980.00', '0.00', '0.00', '0.00', '0.00', 1, 'POLO', 'NÃO INFORMADO', 'PAGO NA MAQUINA JEFFERSON.', 1, 27, 32, 7, '200.00'),
(293, '2021-12-07 21:07:58', '140.00', '0.00', '0.00', '0.00', '0.00', 1, 'UNO', 'NÃO INFORMADO', 'PASSADA NA MAQUINA JEFFERSON', 1, 27, 32, 10, '100.00'),
(294, '2021-12-07 21:15:30', '2030.00', '0.00', '0.00', '0.00', '0.00', 1, 'CLIO', 'NÃO INFORMADO', '', 1, 27, 32, 1, '250.00'),
(295, '2021-12-07 21:24:10', '240.00', '0.00', '0.00', '0.00', '0.00', 1, 'ONIX', 'NÃO INFORMADO', '', 1, 27, 32, 1, '50.00'),
(296, '2021-12-07 21:29:39', '0.00', '0.00', '30.00', '0.00', '0.00', 1, 'NENHUM', 'NÃO INFORMADO', '', 1, 11, 32, 8, '30.00'),
(297, '2021-12-07 21:35:23', '0.00', '50.00', '0.00', '0.00', '0.00', 1, 'HB20', 'NÃO INFORMADO', '', 1, 27, 32, 10, '0.00'),
(298, '2021-12-08 12:40:50', '0.00', '0.00', '95.00', '0.00', '0.00', 1, 'PALIO', 'NÃO INFORMADO', '', 1, 25, 33, 11, '0.00'),
(299, '2021-12-08 12:41:42', '0.00', '0.00', '150.00', '0.00', '0.00', 1, 'CELTA', 'NÃO INFORMADO', '', 1, 28, 33, 8, '0.00'),
(301, '2021-12-08 12:42:58', '0.00', '20.00', '0.00', '0.00', '0.00', 0, 'C3', 'NÃO INFORMADO', '', 1, 41, 33, 10, '0.00'),
(302, '2021-12-08 12:43:43', '0.00', '90.00', '0.00', '0.00', '0.00', 0, 'NENHUM', 'NÃO INFORMADO', '', 1, 37, 33, 1, '0.00'),
(304, '2021-12-08 12:46:42', '0.00', '60.00', '0.00', '0.00', '0.00', 0, 'NENHUM', 'NÃO INFORMADO', 'PAGO RESTANTE DA LIMPEZA DE MOTOR, MÊS DE NOVEMBRO.', 1, 20, 33, 9, '0.00'),
(305, '2021-12-08 12:56:49', '0.00', '0.00', '620.00', '0.00', '0.00', 1, 'HILLUX', 'NÃO INFORMADO', '', 1, 27, 33, 2, '150.00'),
(306, '2021-12-08 13:00:27', '0.00', '15.00', '0.00', '145.00', '0.00', 1, 'ARGO', 'PTF 0152', '', 1, 25, 33, 3, '0.00'),
(307, '2021-12-08 13:13:02', '0.00', '0.00', '60.00', '0.00', '0.00', 1, 'CERATTO', 'MWX 4873', '', 1, 15, 33, 4, '0.00'),
(308, '2021-12-08 13:26:27', '0.00', '70.00', '0.00', '0.00', '0.00', 1, 'VECTRA', 'NÃO INFORMADO', '', 1, 29, 33, 14, '0.00'),
(309, '2021-12-08 13:27:55', '0.00', '5.00', '0.00', '0.00', '0.00', 0, 'NENHUM', 'NÃO INFORMADO', 'PAGO RESTANTE DA LIMPEZA DE MOTOR, MÊS DE NOVEMBRO', 1, 20, 33, 10, '0.00'),
(310, '2021-12-08 13:31:35', '0.00', '10.00', '0.00', '0.00', '0.00', 0, 'NENHUM', 'NÃO INFORMADO', 'COMPRAR PEÇA PARA LOJA', 1, 35, 33, 4, '0.00'),
(311, '2021-12-08 13:46:25', '380.00', '0.00', '0.00', '0.00', '0.00', 1, 'PALIO', 'NÃO INFORMADO', '', 1, 40, 33, 6, '200.00'),
(312, '2021-12-08 14:10:12', '0.00', '0.00', '25.00', '0.00', '0.00', 1, 'VERSA', 'NÃO INFORMADO', '', 1, 29, 33, 2, '0.00'),
(313, '2021-12-08 14:23:16', '15.00', '0.00', '0.00', '0.00', '0.00', 1, 'NENHUM', 'NÃO INFORMADO', '', 1, 28, 33, 14, '0.00'),
(314, '2021-12-08 14:28:31', '0.00', '0.00', '50.00', '0.00', '0.00', 1, 'CELTA', 'NÃO INFORMADO', '', 1, 15, 33, 3, '0.00'),
(315, '2021-12-08 14:49:16', '0.00', '0.00', '450.00', '0.00', '0.00', 1, 'COBOLT', 'NÃO INFORMADO', '', 1, 27, 33, 8, '80.00'),
(316, '2021-12-08 14:55:44', '0.00', '132.00', '0.00', '0.00', '0.00', 0, 'NENHUM', 'NÃO INFORMADO', '', 1, 34, 33, 14, '0.00'),
(317, '2021-12-08 15:04:39', '0.00', '70.00', '0.00', '0.00', '0.00', 1, 'S10', 'NÃO INFORMADO', '', 1, 15, 33, 8, '0.00'),
(318, '2021-12-08 16:31:56', '330.00', '0.00', '0.00', '0.00', '0.00', 1, 'GOLF', 'NÃO INFORMADO', '', 1, 27, 33, 7, '100.00'),
(320, '2021-12-08 17:04:08', '0.00', '25.00', '0.00', '0.00', '0.00', 0, 'NENHUM', 'NÃO INFORMADO', 'PAGAMENTO DE FRETE, DE ENTREGA DE PEÇA PARA A LOJA', 1, 35, 33, 14, '0.00'),
(321, '2021-12-08 18:48:15', '0.00', '100.00', '0.00', '0.00', '0.00', 1, 'LOGAN', 'NHF4626', '', 1, 40, 33, 2, '0.00'),
(322, '2021-12-09 11:39:08', '2950.00', '0.00', '0.00', '0.00', '0.00', 1, 'ONIX', 'psy 8769', '', 1, 27, 34, 11, '300.00'),
(324, '2021-12-09 12:06:09', '0.00', '20.00', '0.00', '0.00', '0.00', 0, 'NENHUM', 'NÃO INFORMADO', '', 1, 41, 34, 7, '0.00'),
(325, '2021-12-09 12:23:33', '0.00', '0.00', '35.00', '0.00', '0.00', 1, 'LOGAN', 'NÃO INFORMADO', '', 1, 28, 34, 14, '0.00'),
(326, '2021-12-09 12:32:10', '0.00', '0.00', '280.00', '0.00', '0.00', 1, 'S10', 'PTL 4834', '', 1, 29, 34, 2, '0.00'),
(327, '2021-12-09 13:07:44', '0.00', '80.00', '0.00', '0.00', '0.00', 1, 'LOGAN', 'NÃO INFORMADO', '', 1, 29, 34, 14, '0.00'),
(328, '2021-12-09 13:14:58', '100.00', '0.00', '0.00', '0.00', '0.00', 1, 'HB20', 'OWV 7628', '', 1, 29, 34, 3, '0.00'),
(329, '2021-12-09 13:28:59', '160.00', '0.00', '0.00', '0.00', '0.00', 1, 'CELTA', 'NÃO INFORMADO', '', 1, 25, 34, 2, '0.00'),
(330, '2021-12-09 13:49:31', '850.00', '0.00', '0.00', '0.00', '0.00', 1, 'CLASSIC', 'NÃO INFORMADO', '', 1, 27, 34, 6, '150.00'),
(331, '2021-12-09 14:10:17', '55.00', '0.00', '200.00', '0.00', '0.00', 1, 'SANDERO', 'QPH  5639', '', 1, 32, 34, 2, '0.00'),
(332, '2021-12-09 14:29:40', '160.00', '0.00', '0.00', '0.00', '0.00', 1, 'VOYAGE', 'NÃO INFORMADO', '', 1, 32, 34, 14, '0.00'),
(335, '2021-12-09 16:57:21', '0.00', '0.00', '330.00', '0.00', '0.00', 1, 'FORD KA', 'PTJ6783', '', 1, 29, 34, 3, '0.00'),
(336, '2021-12-09 16:59:49', '475.00', '0.00', '0.00', '0.00', '0.00', 1, 'FORD KA', 'NÃO INFORMADO', '', 1, 27, 34, 4, '100.00'),
(337, '2021-12-09 17:01:59', '0.00', '0.00', '75.00', '0.00', '0.00', 1, 'AGILE', 'NÃO INFORMADO', '', 1, 32, 34, 2, '0.00'),
(338, '2021-12-09 17:27:15', '0.00', '150.00', '0.00', '0.00', '0.00', 1, 'COMBI', 'NÃO INFORMADO', '', 1, 32, 34, 14, '0.00'),
(341, '2021-12-09 18:04:58', NULL, '36500.00', NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, 38, 28, 14, NULL),
(342, '2021-12-09 18:05:24', NULL, '47500.00', NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, 38, 29, 14, NULL),
(343, '2021-12-09 18:05:56', '0.00', '565.00', '0.00', '0.00', '0.00', 0, '', '', 'PAGAMENTO DE JEFFERSON', 1, 38, 30, 14, '0.00'),
(344, '2021-12-09 18:06:03', NULL, '45000.00', NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, 38, 31, 14, NULL),
(345, '2021-12-09 18:06:10', NULL, '131500.00', NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, 38, 32, 14, NULL),
(349, '2021-12-09 18:08:03', '120.00', '0.00', '0.00', '0.00', '0.00', 1, 'FIESTA', 'NÃO INFORMADO', '', 1, 3, 34, 14, '100.00'),
(350, '2021-12-09 18:24:17', '0.00', '10.00', '0.00', '0.00', '0.00', 0, 'NENHUM', 'NÃO INFORMADO', 'REPASSE DE VALOR PARA ADALBERTO, PELA COMPRA DO CAFÉ, QUE O MESMO COMPROU COM SEU DIHEIRO', 1, 34, 34, 14, '0.00'),
(351, '2021-12-09 18:27:54', '0.00', '60.00', '0.00', '0.00', '0.00', 1, 'VERSA', 'NÃO INFORMADO', '', 1, 15, 34, 2, '0.00'),
(354, '2021-12-09 19:20:05', '0.00', '60.00', '0.00', '0.00', '0.00', 1, 'SW4', 'NÃO INFORMADO', '', 1, 23, 34, 14, '60.00'),
(355, '2021-12-09 19:21:55', '120.00', '0.00', '0.00', '0.00', '0.00', 1, 'FIESTA', 'NÃO INFORMADO', '', 1, 27, 34, 14, '100.00'),
(356, '2021-12-09 19:23:14', '50.00', '0.00', '0.00', '0.00', '0.00', 1, 'CELTA', 'OJD 2353', '', 1, 15, 34, 8, '0.00'),
(357, '2021-12-09 19:29:34', '0.00', '0.00', '220.00', '0.00', '0.00', 1, 'PUNTO', 'OJI 1342', '', 1, 3, 34, 7, '0.00'),
(358, '2021-12-09 19:31:17', '0.00', '120.00', '0.00', '0.00', '0.00', 1, 'STRADA', 'NÃO INFORMADO', '', 1, 27, 34, 7, '70.00'),
(359, '2021-12-09 19:49:35', '0.00', '9.00', '0.00', '0.00', '0.00', 0, 'NENHUM', 'NÃO INFORMADO', 'COMPRA DE 2 PINCEIS PARA ETIQUETA DE ÓLEO.', 1, 36, 34, 14, '0.00'),
(360, '2021-12-09 20:18:51', '0.00', '0.00', '4520.00', '0.00', '0.00', 1, 'PRISMA', 'PSM 9964', '', 1, 27, 34, 5, '600.00'),
(361, '2021-12-09 20:29:48', '0.00', '140.00', '0.00', '0.00', '0.00', 0, 'NENHUM', 'NÃO INFORMADO', '', 1, 35, 34, 1, '0.00'),
(362, '2021-12-09 20:34:57', '550.00', '0.00', '0.00', '0.00', '0.00', 1, 'KA', 'NÃO INFORMADO', '', 1, 27, 34, 8, '150.00'),
(363, '2021-12-09 20:36:56', '0.00', '0.00', '0.00', '850.00', '0.00', 1, 'SANDERO', 'NÃO INFORMADO', 'PAGO PIX LOJA', 1, 26, 34, 1, '0.00'),
(365, '2021-12-09 21:11:21', '0.00', '0.00', '0.00', '675.00', '0.00', 1, 'UNO', 'NÃO INFORMADO', 'PG PIX LOJA', 1, 27, 34, 4, '50.00'),
(367, '2021-12-09 21:29:43', '0.00', '300.00', '0.00', '0.00', '0.00', 1, 'DUSTER', 'NÃO INFORMADO', '', 1, 27, 34, 1, '100.00'),
(368, '2021-12-09 21:31:53', '0.00', '0.00', '420.00', '0.00', '0.00', 1, 'CLASSIC', 'NÃO INFORMADO', '', 1, 27, 34, 3, '100.00'),
(369, '2021-12-09 21:34:48', '120.00', '0.00', '0.00', '0.00', '0.00', 1, 'GOL', 'NÃO INFORMADO', '', 1, 27, 34, 3, '50.00'),
(370, '2021-12-09 21:51:20', '0.00', '246.25', '0.00', '0.00', '0.00', 0, 'NENHUM', 'NÃO INFORMADO', 'COMPRA DE MERCEARIA DO MÊS.', 1, 37, 34, 14, '0.00'),
(373, '2021-12-10 12:07:02', '0.00', '0.00', '30.00', '0.00', '0.00', 1, 'STRADA', 'NÃO INFORMADO', '', 1, 28, 35, 1, '0.00'),
(374, '2021-12-10 12:07:42', '0.00', '0.00', '450.00', '0.00', '0.00', 1, 'CLASSIC', 'NÃO INFORMADO', '', 1, 26, 35, 1, '0.00'),
(375, '2021-12-10 13:06:35', '150.00', '0.00', '0.00', '0.00', '0.00', 1, 'NENHUM', 'NÃO INFORMADO', 'TOTALDE ALINHAMENTO ', 1, 15, 33, 15, '0.00'),
(377, '2021-12-10 13:54:58', '0.00', '40.00', '0.00', '0.00', '0.00', 1, 'PRISMA', 'oxt 2157', '', 1, 28, 35, 1, '0.00'),
(379, '2021-12-10 17:24:16', '80.00', '0.00', '0.00', '0.00', '0.00', 1, 'MOBI\'', 'NÃO INFORMADO', '', 1, 27, 35, 11, '40.00'),
(380, '2021-12-10 17:25:43', '0.00', '0.00', '420.00', '0.00', '0.00', 1, 'CROSFOX', 'NWX 7626', '', 1, 27, 35, 1, '200.00'),
(382, '2021-12-10 18:24:02', '0.00', '276.00', '0.00', '0.00', '0.00', 0, 'ALIMENTACAO', '', 'PAGAMENTO DE DOIS DIAS DO ALMOÇO.', 1, 34, 35, 17, '0.00'),
(383, '2021-12-10 18:36:12', '220.00', '0.00', '0.00', '0.00', '0.00', 1, 'L200', 'NÃO INFORMADO', '', 1, 15, 35, 11, '0.00'),
(384, '2021-12-10 19:04:10', '180.00', '0.00', '0.00', '0.00', '0.00', 1, 'SIENA', 'NÃO INFORMADO', '', 1, 27, 35, 10, '100.00'),
(385, '2021-12-10 19:12:02', '0.00', '0.00', '40.00', '0.00', '0.00', 1, 'SANDERO', 'NÃO INFORMADO', '', 1, 28, 35, 2, '0.00'),
(386, '2021-12-10 19:31:15', '170.00', '0.00', '0.00', '0.00', '0.00', 1, 'ARGO', 'PTI 3460', '', 1, 25, 35, 1, '0.00'),
(387, '2021-12-10 19:31:53', '0.00', '0.00', '160.00', '0.00', '0.00', 1, 'SANDERO', 'NÃO INFORMADO', '', 1, 25, 35, 15, '0.00'),
(388, '2021-12-10 19:41:44', '0.00', '200.00', '0.00', '0.00', '0.00', 1, 'PALIO', 'PSC 9896', '', 1, 25, 35, 2, '0.00'),
(390, '2021-12-10 19:45:58', '365.00', '0.00', '0.00', '0.00', '0.00', 1, 'ARGO', 'ROD 3178', '', 1, 25, 35, 11, '0.00'),
(393, '2021-12-10 20:16:50', '2600.00', '0.00', '0.00', '0.00', '0.00', 1, 'C3', 'NÃO INFORMADO', '', 1, 27, 35, 10, '1800.00'),
(394, '2021-12-10 20:17:52', '0.00', '0.00', '600.00', '0.00', '0.00', 1, 'L200', 'NÃO INFORMADO', '', 1, 25, 35, 2, '0.00'),
(395, '2021-12-10 20:18:38', '0.00', '0.00', '60.00', '0.00', '0.00', 1, 'FIESTA', 'NÃO INFORMADO', '', 1, 15, 35, 16, '0.00'),
(396, '2021-12-10 20:19:47', '0.00', '0.00', '300.00', '0.00', '0.00', 1, 'DUSTER', 'NÃO INFORMADO', '', 1, 23, 35, 5, '300.00'),
(397, '2021-12-10 20:21:51', '0.00', '0.00', '655.00', '0.00', '0.00', 1, 'AMAROK', 'NÃO INFORMADO', '', 1, 25, 35, 10, '0.00'),
(398, '2021-12-10 20:25:27', '0.00', '100.00', '0.00', '0.00', '0.00', 1, 'MARCH', 'PSD 1F96', '', 1, 23, 35, 3, '100.00'),
(399, '2021-12-10 20:28:37', '0.00', '20.00', '0.00', '0.00', '0.00', 0, 'ECO  SPORT', 'NÃO INFORMADO', 'COMPRA DE COMBUSTÍVEL', 1, 41, 35, 7, '0.00'),
(400, '2021-12-10 20:31:01', '0.00', '70.00', '0.00', '0.00', '0.00', 0, 'L200', 'NÃO INFORMADO', 'CLIENTE NÃO REALIZOU AL+ BL, E FOI DEVOLVIDO O DINHEIRO, QUE ENTROU COMO DÉBITO NA MAQUINA \r\n DA LOJA.', 1, 15, 35, 2, '0.00'),
(401, '2021-12-10 20:36:29', '40.00', '0.00', '0.00', '0.00', '0.00', 1, 'PALIO', 'NÃO INFORMADO', '', 1, 28, 35, 2, '0.00'),
(402, '2021-12-10 20:47:46', '0.00', '300.00', '0.00', '0.00', '0.00', 0, 'NENHUM', 'NÃO INFORMADO', 'SAIDA DE VALE PARA O FUNCIONÁRIO ADALBERTO.', 1, 43, 35, 17, '0.00'),
(403, '2021-12-10 20:51:53', '0.00', '30.00', '0.00', '0.00', '0.00', 1, 'CLASSIC', 'NÃO INFORMADO', '', 1, 28, 35, 16, '0.00'),
(404, '2021-12-10 21:11:58', '0.00', '20.00', '0.00', '0.00', '0.00', 0, 'MOTO', 'NÃO INFORMADO', 'COMPRA  DE COMBUSTÍVEL', 1, 41, 35, 1, '0.00'),
(405, '2021-12-10 21:14:16', '385.00', '0.00', '0.00', '0.00', '0.00', 1, 'COROLLA', 'NÃO INFORMADO', '', 1, 25, 35, 8, '0.00'),
(406, '2021-12-10 21:24:10', '0.00', '0.00', '90.00', '0.00', '0.00', 1, 'NENHUM', 'NÃO INFORMADO', '', 1, 11, 35, 15, '90.00'),
(407, '2021-12-10 21:27:31', '0.00', '0.00', '150.00', '0.00', '0.00', 1, 'DUSTER', 'NÃO INFORMADO', '', 1, 18, 35, 8, '150.00'),
(408, '2021-12-11 11:34:56', '0.00', '160.00', '0.00', '0.00', '0.00', 1, 'GOL', 'OSB 5957', '', 1, 32, 36, 5, '0.00'),
(409, '2021-12-11 11:35:33', '0.00', '40.00', '0.00', '0.00', '0.00', 1, 'KIWD', 'NÃO INFORMADO', '', 1, 40, 36, 16, '0.00'),
(410, '2021-12-11 11:37:13', '0.00', '0.00', '30.00', '0.00', '0.00', 1, 'CLASSIC', 'NÃO INFORMADO', '', 1, 11, 36, 8, '0.00'),
(411, '2021-12-11 11:49:50', '0.00', '0.00', '160.00', '0.00', '0.00', 1, 'ONIX', 'NÃO INFORMADO', '', 1, 40, 36, 10, '0.00'),
(412, '2021-12-11 12:19:31', '180.00', '0.00', '0.00', '0.00', '0.00', 1, 'SANDERO', 'OIS 9E42', '', 1, 25, 36, 8, '0.00'),
(413, '2021-12-11 12:35:18', '0.00', '0.00', '220.00', '0.00', '0.00', 1, 'JEEP RENEGADE', 'NÃO INFORMADO', '', 1, 25, 36, 10, '0.00'),
(414, '2021-12-11 12:39:42', '0.00', '200.00', '0.00', '0.00', '0.00', 1, 'DOBLO', 'NÃO INFORMADO', '', 1, 32, 36, 11, '0.00'),
(415, '2021-12-11 12:53:51', '0.00', '150.00', '0.00', '0.00', '0.00', 1, 'CLASSIC', '', '', 1, 25, 36, 10, '0.00'),
(416, '2021-12-11 13:05:34', '0.00', '200.00', '0.00', '0.00', '0.00', 1, 'GOL', 'NHG 2321', '', 1, 29, 36, 4, '0.00'),
(417, '2021-12-11 13:19:21', '0.00', '0.00', '340.00', '0.00', '0.00', 1, 'SRV', 'JUK 9701', '', 1, 25, 36, 8, '0.00'),
(418, '2021-12-11 13:23:59', '490.00', '0.00', '0.00', '0.00', '0.00', 1, 'HB20', 'NÃO INFORMADO', '', 1, 26, 36, 1, '0.00'),
(419, '2021-12-11 13:28:18', '325.00', '0.00', '0.00', '0.00', '0.00', 1, 'RANGER', 'NÃO INFORMADO', '', 1, 25, 36, 11, '0.00'),
(420, '2021-12-11 13:48:00', '390.00', '0.00', '0.00', '0.00', '0.00', 1, 'SANDERO', 'PSD 7007', '', 1, 25, 36, 3, '0.00'),
(421, '2021-12-11 14:07:40', '0.00', '330.00', '0.00', '0.00', '0.00', 1, 'HILLUX', 'NÃO INFORMADO', '', 1, 25, 36, 7, '0.00'),
(422, '2021-12-11 14:09:01', '180.00', '0.00', '0.00', '0.00', '0.00', 1, 'KIWD', 'PTH 8811', '', 1, 29, 36, 16, '0.00'),
(424, '2021-12-11 14:22:03', '0.00', '15.00', '0.00', '0.00', '0.00', 1, 'LINEA', 'NÃO INFORMADO', '', 1, 29, 36, 8, '0.00'),
(425, '2021-12-11 14:38:12', '0.00', '0.00', '0.00', '180.00', '0.00', 1, 'FOX', 'NÃO INFORMADO', 'PAGO PIX LOJA', 1, 25, 36, 11, '0.00'),
(426, '2021-12-11 14:47:56', '250.00', '0.00', '0.00', '0.00', '0.00', 1, 'CLASSIC', 'NÃO INFORMADO', '', 1, 15, 36, 5, '200.00'),
(427, '2021-12-11 14:51:19', '390.00', '0.00', '0.00', '0.00', '0.00', 1, 'SANDERO', 'PSD 7007', '', 1, 25, 36, 3, '0.00'),
(428, '2021-12-11 14:55:51', '0.00', '0.00', '80.00', '0.00', '0.00', 1, 'KA', 'NÃO INFORMADO', '', 1, 28, 36, 10, '50.00'),
(429, '2021-12-11 15:03:41', '0.00', '0.00', '160.00', '0.00', '0.00', 1, 'CLASSIC', 'NÃO INFORMADO', '', 1, 25, 36, 5, '0.00'),
(430, '2021-12-11 15:59:11', '0.00', '0.00', '230.00', '0.00', '0.00', 1, 'GOL', 'NÃO INFORMADO', '', 1, 18, 36, 14, '80.00'),
(431, '2021-12-11 16:02:20', '290.00', '0.00', '0.00', '0.00', '0.00', 1, 'Q3', 'NÃO INFORMADO', '', 1, 25, 36, 11, '0.00'),
(432, '2021-12-11 16:03:47', '0.00', '0.00', '270.00', '0.00', '0.00', 1, 'ARGO', 'NÃO INFORMADO', '', 1, 25, 36, 14, '0.00'),
(433, '2021-12-11 16:12:54', '0.00', '50.00', '0.00', '0.00', '0.00', 0, 'ALIMENTACAO', 'NÃO INFORMADO', 'PAGAMENTO DO ALMOÇO ', 1, 34, 36, 17, '0.00'),
(434, '2021-12-11 16:30:43', '350.00', '0.00', '0.00', '0.00', '0.00', 1, 'COROLLA', 'NXQ4069', '', 1, 29, 36, 16, '0.00'),
(435, '2021-12-11 16:33:03', '0.00', '0.00', '140.00', '0.00', '0.00', 1, 'KA', '', '', 1, 18, 36, 6, '100.00'),
(437, '2021-12-11 16:35:33', '2900.00', '0.00', '0.00', '0.00', '0.00', 1, 'ECOSPORT', 'NÃO INFORMADO', '', 1, 18, 36, 7, '1450.00'),
(438, '2021-12-11 16:58:42', '0.00', '0.00', '50.00', '0.00', '0.00', 1, 'LOGAN', 'NÃO INFORMADO', '', 1, 15, 36, 14, '0.00'),
(439, '2021-12-13 12:02:38', '490.00', '0.00', '0.00', '0.00', '0.00', 1, 'KIWD', 'NÃO INFORMADO', '', 1, 26, 37, 3, '0.00'),
(440, '2021-12-13 12:05:02', '0.00', '100.00', '0.00', '0.00', '0.00', 1, 's10', 'ptl4834', '', 1, 18, 37, 15, '100.00'),
(441, '2021-12-13 12:51:52', '0.00', '500.00', '0.00', '0.00', '0.00', 1, 'CELTA', 'nww 9043', '', 1, 29, 37, 15, '0.00'),
(442, '2021-12-13 13:00:32', '0.00', '0.00', '220.00', '0.00', '0.00', 1, 'SANDERO', 'NÃO INFORMADO', '', 1, 28, 37, 4, '0.00'),
(443, '2021-12-13 13:16:51', '0.00', '0.00', '160.00', '0.00', '0.00', 1, 'SANDERO', 'NÃO INFORMADO', '', 1, 25, 37, 8, '0.00'),
(444, '2021-12-13 13:41:06', '0.00', '0.00', '150.00', '0.00', '0.00', 1, 'ONIX', 'NÃO INFORMADO', '', 1, 29, 37, 2, '0.00'),
(445, '2021-12-13 13:44:31', '0.00', '160.00', '0.00', '0.00', '0.00', 1, 'HB20', 'NÃO INFORMADO', '', 1, 25, 37, 16, '0.00'),
(446, '2021-12-13 13:51:40', '0.00', '0.00', '150.00', '0.00', '0.00', 1, 'LOGAN', 'NÃO INFORMADO', '', 1, 15, 37, 11, '100.00'),
(447, '2021-12-13 14:20:55', '0.00', '0.00', '300.00', '0.00', '0.00', 1, 'CAPTUR', 'PTH 0A60', '', 1, 25, 37, 4, '0.00'),
(448, '2021-12-13 14:21:32', '0.00', '0.00', '30.00', '0.00', '0.00', 1, 'L200', 'NXD 3998', '', 1, 2, 37, 2, '0.00'),
(449, '2021-12-13 14:22:19', '0.00', '100.00', '0.00', '0.00', '0.00', 0, 'NENHUM', 'NÃO INFORMADO', 'COMPRA DE PEÇA PARA A LOJA', 1, 35, 37, 3, '0.00'),
(452, '2021-12-13 14:47:38', '90.00', '0.00', '0.00', '0.00', '0.00', 1, 'SIENA', 'NÃO INFORMADO', '', 1, 27, 37, 11, '50.00'),
(453, '2021-12-13 16:40:46', '70.00', '0.00', '0.00', '0.00', '0.00', 1, 'SIENA', 'NÃO INFORMADO', '', 1, 15, 37, 8, '0.00'),
(454, '2021-12-13 17:13:07', '0.00', '230.00', '0.00', '0.00', '0.00', 1, 'HB20', 'NÃO INFORMADO', '', 1, 25, 37, 11, '0.00'),
(455, '2021-12-13 18:03:23', '30.00', '0.00', '30.00', '0.00', '0.00', 1, 'ka', 'pte 8790', '', 1, 3, 37, 16, '0.00'),
(456, '2021-12-13 18:25:34', '0.00', '160.00', '0.00', '0.00', '0.00', 1, 'KIWD', 'NÃO INFORMADO', '', 1, 15, 37, 4, '0.00'),
(457, '2021-12-13 19:11:01', '0.00', '35.00', '0.00', '0.00', '0.00', 1, 'ONIX', 'NÃO INFORMADO', '', 1, 28, 37, 16, '0.00'),
(458, '2021-12-13 19:24:57', '730.00', '0.00', '0.00', '0.00', '0.00', 1, 'SANDERO', 'NÃO INFORMADO', '', 1, 27, 37, 10, '80.00'),
(460, '2021-12-13 19:39:53', '0.00', '130.00', '0.00', '0.00', '0.00', 0, 'ALIMENTACAO', 'NÃO INFORMADO', 'PAGAMENTO DO ALMOÇO DO DIA 13/12/2021', 1, 34, 37, 17, '0.00'),
(461, '2021-12-13 19:46:12', '0.00', '1000.00', '0.00', '0.00', '0.00', 0, 'NENHUM', 'NÃO INFORMADO', 'PAGAMENTO DE  JEFFERSON', 1, 38, 36, 17, '0.00'),
(462, '2021-12-13 19:56:44', '0.00', '30.00', '0.00', '0.00', '0.00', 0, 'NENHUM', 'NÃO INFORMADO', 'COMPRA DE PEÇA PARA LOJA', 1, 35, 37, 3, '0.00'),
(463, '2021-12-13 20:04:07', '500.00', '0.00', '0.00', '0.00', '0.00', 1, 'C3', 'NÃO INFORMADO', '', 1, 27, 37, 4, '150.00'),
(466, '2021-12-13 20:52:04', '0.00', '0.00', '0.00', '300.00', '0.00', 1, 'SANDERO', 'PSY 5440', 'PAGO PIX LOJA', 1, 25, 37, 8, '0.00'),
(467, '2021-12-13 20:53:56', '0.00', '50.00', '0.00', '0.00', '0.00', 0, 'MOTO', 'NÃO INFORMADO', 'COMPRA DE COMBUSTÍVEL', 1, 41, 37, 3, '0.00'),
(468, '2021-12-13 20:59:19', '0.00', '0.00', '190.00', '0.00', '0.00', 1, 'UNO', 'OXU1006', '', 1, 27, 37, 16, '50.00'),
(471, '2021-12-13 21:37:55', '610.00', '0.00', '0.00', '0.00', '0.00', 1, 'PALIO', 'NÃO INFORMADO', '', 1, 27, 37, 9, '150.00'),
(472, '2021-12-13 21:39:31', '1255.00', '0.00', '0.00', '0.00', '0.00', 1, 'PUNTO', 'NÃO INFORMADO', '', 1, 27, 37, 8, '230.00'),
(473, '2021-12-13 21:40:45', '1250.00', '0.00', '0.00', '0.00', '0.00', 1, 'VERSA', 'NÃO INFORMADO', '', 1, 27, 37, 10, '200.00'),
(474, '2021-12-13 21:43:35', '0.00', '420.00', '0.00', '0.00', '0.00', 1, 'ONIX', 'NÃO INFORMADO', '', 1, 27, 37, 6, '150.00'),
(475, '2021-12-14 11:30:08', '0.00', '0.00', '60.00', '0.00', '0.00', 1, 'NENHUM', 'NÃO INFORMADO', '', 1, 15, 37, 15, '0.00'),
(476, '2021-12-14 11:30:51', '0.00', '650.00', '0.00', '0.00', '0.00', 0, 'NENHUM', 'NÃO INFORMADO', 'PAGAMENTO DE JEFFERSON', 1, 38, 37, 17, '0.00'),
(477, '2021-12-14 11:32:02', '260.00', '0.00', '200.00', '0.00', '0.00', 1, 'KIWD', 'PTN 4625', '', 1, 26, 38, 3, '0.00'),
(478, '2021-12-14 11:34:20', '0.00', '20.00', '0.00', '0.00', '0.00', 0, 'PRISMA', 'NÃO INFORMADO', 'COMPRA DE COMBUSTÍVEL', 1, 41, 38, 3, '0.00'),
(479, '2021-12-14 11:54:46', '0.00', '0.00', '150.00', '0.00', '0.00', 1, 'NENHUM', 'NÃO INFORMADO', '', 1, 15, 36, 15, '150.00'),
(480, '2021-12-14 12:49:50', '0.00', '0.00', '50.00', '0.00', '0.00', 1, 'RANGER', 'NÃO INFORMADO', '', 1, 2, 38, 9, '0.00'),
(481, '2021-12-14 12:51:36', '850.00', '0.00', '0.00', '0.00', '0.00', 1, 'DOBLO', 'PTM 3D68', '', 1, 27, 38, 8, '250.00'),
(482, '2021-12-14 13:16:57', '0.00', '0.00', '50.00', '0.00', '0.00', 1, 'HONDA CITY', 'PTL 4647', '', 1, 18, 38, 11, '50.00'),
(483, '2021-12-14 13:21:59', '760.00', '0.00', '0.00', '0.00', '0.00', 1, 'ETIOS', 'OXN 0864', '', 1, 25, 38, 16, '0.00'),
(484, '2021-12-14 14:23:37', '250.00', '0.00', '0.00', '0.00', '0.00', 1, 'tucson', 'pib 7855', '', 1, 29, 38, 2, '0.00'),
(485, '2021-12-14 14:29:43', '610.00', '0.00', '0.00', '0.00', '0.00', 1, 'VOYAGE', 'nmr 5825', '', 1, 27, 38, 10, '250.00'),
(487, '2021-12-14 14:34:51', '0.00', '150.00', '0.00', '0.00', '0.00', 0, 'ALIMENTACAO', 'NÃO INFORMADO', 'PAGAMENTO DO ALMOÇO', 1, 34, 38, 17, '0.00'),
(488, '2021-12-14 16:33:53', '300.00', '0.00', '0.00', '0.00', '0.00', 1, 'PICASSO', 'OSB 1C11', '', 1, 15, 38, 2, '250.00'),
(489, '2021-12-14 16:34:49', '0.00', '50.00', '0.00', '0.00', '0.00', 1, 'CLASSIC', 'NÃO INFORMADO', '', 1, 18, 38, 11, '50.00'),
(490, '2021-12-14 17:03:16', '0.00', '10.00', '0.00', '0.00', '0.00', 0, 'STRADA', 'HPP1084', 'COMPRA DE COMBUSTÍVEL', 1, 41, 38, 11, '0.00'),
(492, '2021-12-14 17:33:20', '0.00', '0.00', '50.00', '0.00', '0.00', 1, 'ARGO', 'NÃO INFORMADO', '', 1, 18, 38, 15, '50.00'),
(493, '2021-12-14 17:37:08', '0.00', '12.00', '0.00', '0.00', '0.00', 0, 'AGUA', 'NÃO INFORMADO', 'PAGAMENTO DE 2 GALÕES DE ÁGUA.', 1, 33, 38, 17, '0.00'),
(494, '2021-12-14 18:27:17', '490.00', '0.00', '0.00', '0.00', '0.00', 1, 'NEW FIESTA', 'PTJ OF01', '', 1, 25, 38, 9, '0.00'),
(495, '2021-12-14 18:53:10', '0.00', '105.00', '0.00', '0.00', '0.00', 0, 'AGUA', 'NÃO INFORMADO', 'PAGAMENTO DE 30 GALÕES DE ÁGUA. PARA Sr. JORGE DIAS', 1, 33, 38, 17, '0.00'),
(497, '2021-12-14 19:11:33', '300.00', '0.00', '50.00', '0.00', '0.00', 1, 'COROLLA', 'MNZ 7310', '', 1, 25, 38, 7, '0.00'),
(498, '2021-12-14 19:13:50', '0.00', '390.00', '0.00', '0.00', '0.00', 1, 'GOL', 'PTP 7111', '', 1, 25, 38, 9, '0.00'),
(500, '2021-12-14 19:21:49', '0.00', '50.00', '0.00', '0.00', '0.00', 1, 'GOL ', 'NÃO INFORMADO', '', 1, 18, 38, 9, '50.00'),
(501, '2021-12-14 19:24:23', '0.00', '0.00', '350.00', '0.00', '0.00', 1, 'PEGEOT', 'NÃO INFORMADO', '', 1, 27, 38, 2, '50.00'),
(502, '2021-12-14 20:06:06', '2000.00', '0.00', '0.00', '0.00', '0.00', 1, 'VERSA', 'NÃO INFORMADO', '', 1, 27, 38, 4, '300.00'),
(503, '2021-12-14 20:08:00', '120.00', '0.00', '0.00', '0.00', '0.00', 1, 'MOBI', 'PSP 0E06', '', 1, 29, 38, 8, '0.00'),
(504, '2021-12-14 20:36:59', '180.00', '0.00', '0.00', '50.00', '0.00', 1, 'MARCH', 'OXY 1577', 'PAGO PIX  LOJA 50 REAIS DO AL + BL', 1, 25, 38, 11, '0.00'),
(505, '2021-12-14 20:42:13', '1285.00', '0.00', '0.00', '0.00', '0.00', 1, 'VOYAGE', 'NWW 0355', '', 1, 27, 38, 5, '300.00'),
(507, '2021-12-14 20:50:41', '0.00', '1350.00', '550.00', '0.00', '0.00', 1, 'HILLUX', 'NÃO INFORMADO', '', 1, 27, 38, 2, '500.00'),
(509, '2021-12-14 21:07:57', '490.00', '0.00', '0.00', '0.00', '0.00', 1, 'MONTANA', 'NÃO INFORMADO', '', 1, 27, 38, 11, '50.00'),
(510, '2021-12-14 21:34:17', '0.00', '0.00', '200.00', '0.00', '0.00', 1, 'PALIO', 'NÃO INFORMADO', '', 1, 18, 38, 10, '200.00'),
(511, '2021-12-14 21:38:30', '0.00', '0.00', '150.00', '0.00', '0.00', 1, 'NENHUM', 'NÃO INFORMADO', '', 1, 18, 38, 14, '150.00'),
(512, '2021-12-14 21:46:06', '0.00', '0.00', '50.00', '0.00', '0.00', 1, 'HB20', 'NÃO INFORMADO', '', 1, 18, 38, 2, '50.00'),
(513, '2021-12-14 21:47:13', '0.00', '0.00', '0.00', '100.00', '0.00', 1, 'HB20', 'NÃO INFORMADO', 'PG LOJA PIX', 1, 18, 38, 14, '50.00'),
(514, '2021-12-15 11:49:05', '0.00', '0.00', '20.00', '0.00', '0.00', 1, 'PEGEOT', 'OXR 5653', '', 1, 28, 39, 15, '0.00'),
(517, '2021-12-15 12:05:39', '0.00', '350.00', '0.00', '0.00', '0.00', 1, 'VERSA', 'NÃO INFORMADO', '', 1, 29, 39, 16, '0.00'),
(519, '2021-12-15 12:15:23', '40.00', '0.00', '0.00', '0.00', '0.00', 1, 'FIAT UNO', 'NÃO INFORMADO', '', 1, 28, 39, 11, '0.00'),
(520, '2021-12-15 12:16:26', '1000.00', '0.00', '1835.00', '0.00', '0.00', 1, 'PRISMA', 'NÃO INFORMADO', '', 1, 27, 39, 3, '1500.00'),
(521, '2021-12-15 12:21:38', '1200.00', '0.00', '2080.00', '0.00', '0.00', 1, 'PALIO', 'NÃO INFORMADO', '', 1, 27, 39, 9, '600.00'),
(522, '2021-12-15 12:30:33', NULL, '58500.00', NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, 38, 28, 14, NULL),
(523, '2021-12-15 12:30:41', NULL, '97500.00', NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, 38, 28, 14, NULL),
(524, '2021-12-15 12:32:05', '0.00', '0.00', '0.00', '300.00', '0.00', 1, 'CLASSIC', 'NÃO INFORMADO', 'PAGO PIX LOJA', 1, 26, 39, 3, '0.00'),
(525, '2021-12-15 12:33:38', NULL, '49000.00', NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, 38, 33, 14, NULL),
(526, '2021-12-15 12:38:28', NULL, '105500.00', NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, 38, 34, 14, NULL),
(527, '2021-12-15 12:38:37', NULL, '146500.00', NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, 38, 35, 14, NULL),
(528, '2021-12-15 12:40:36', '0.00', '190.00', '0.00', '0.00', '0.00', 1, 'MOBI', 'PTE 8934', '', 1, 29, 39, 9, '0.00'),
(529, '2021-12-15 13:03:46', '0.00', '180.00', '0.00', '0.00', '0.00', 1, 'LOGAN', 'NÃO INFORMADO', '', 1, 25, 39, 7, '0.00'),
(530, '2021-12-15 13:15:34', '0.00', '80.00', '0.00', '0.00', '0.00', 1, 'FIESTA', 'NNA 2776', '', 1, 29, 39, 4, '0.00'),
(531, '2021-12-15 13:43:32', NULL, '125000.00', NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, 38, 37, 14, NULL),
(532, '2021-12-15 14:08:38', '0.00', '45.00', '0.00', '0.00', '0.00', 1, 'HILLUX', 'NÃO INFORMADO', '', 1, 28, 39, 17, '0.00'),
(533, '2021-12-15 14:09:51', '0.00', '250.00', '0.00', '0.00', '0.00', 1, 'SAVEIRO', 'NÃO INFORMADO', '', 1, 29, 39, 8, '0.00'),
(534, '2021-12-15 14:18:16', '0.00', '180.00', '0.00', '0.00', '0.00', 1, 'PRISMA', 'NÃO INFORMADO', '', 1, 25, 39, 6, '0.00'),
(535, '2021-12-15 14:26:47', '0.00', '0.00', '210.00', '0.00', '0.00', 1, 'CRONOS', 'NÃO INFORMADO', '', 1, 28, 39, 3, '0.00'),
(536, '2021-12-15 14:35:21', '0.00', '50.00', '0.00', '0.00', '0.00', 1, 'LOGAN', 'FKP 5I27', '', 1, 15, 39, 2, '0.00'),
(537, '2021-12-15 14:57:43', '0.00', '0.00', '300.00', '0.00', '0.00', 1, 'TUCSON', 'NWW 1526', '', 1, 25, 39, 11, '0.00'),
(538, '2021-12-15 14:58:57', '0.00', '174.00', '0.00', '0.00', '0.00', 0, 'ALIMENTACAO', 'NÃO INFORMADO', 'PAGO ALIMENTAÇÃO DO DIA 15/12/2021', 1, 34, 39, 17, '0.00'),
(539, '2021-12-15 17:27:14', '0.00', '0.00', '160.00', '0.00', '0.00', 1, 'TUCSON', 'MXG 9A60', '', 1, 27, 39, 8, '70.00'),
(540, '2021-12-15 17:53:18', '735.00', '0.00', '0.00', '0.00', '0.00', 1, 'PALIO', 'NÃO INFORMADO', '', 1, 27, 39, 6, '300.00'),
(541, '2021-12-15 18:20:51', '0.00', '400.00', '0.00', '0.00', '0.00', 1, 'PRISMA', 'OJF 6315', '', 1, 25, 39, 6, '0.00'),
(542, '2021-12-15 18:26:22', '0.00', '450.00', '0.00', '0.00', '0.00', 1, 'PALIO', 'NÃO INFORMADO', '', 1, 26, 39, 3, '0.00'),
(545, '2021-12-15 18:48:24', '280.00', '0.00', '0.00', '0.00', '0.00', 1, 'ONIX', 'NÃO INFORMADO', '', 1, 25, 39, 8, '0.00'),
(546, '2021-12-15 18:56:02', '0.00', '76.00', '0.00', '0.00', '0.00', 0, 'MATERIAIS', 'NÃO INFORMADO', 'COMPRA DE MATERIAL PARA ESCRITORIO e  EPIS para funcionários.', 1, 36, 39, 17, '0.00'),
(548, '2021-12-15 19:49:56', '0.00', '0.00', '140.00', '0.00', '0.00', 1, 'SIENA', 'NÃO INFORMADO', '', 1, 25, 39, 11, '0.00'),
(549, '2021-12-15 20:29:52', '0.00', '0.00', '490.00', '0.00', '0.00', 1, 'FORD KA', 'NÃO INFORMADO', '', 1, 26, 39, 5, '0.00'),
(550, '2021-12-15 20:56:01', '1360.00', '0.00', '0.00', '0.00', '0.00', 1, 'SANDERO', 'NÃO INFORMADO', '', 1, 27, 39, 10, '250.00'),
(551, '2021-12-15 20:57:17', '0.00', '240.00', '0.00', '0.00', '0.00', 1, 'FIESTA', 'NÃO INFORMADO', '', 1, 27, 39, 7, '70.00'),
(552, '2021-12-15 20:59:08', '0.00', '0.00', '150.00', '0.00', '0.00', 1, 'NENHUM', 'NÃO INFORMADO', '', 1, 15, 39, 14, '150.00'),
(553, '2021-12-16 12:01:57', '0.00', '0.00', '180.00', '0.00', '0.00', 1, 'MARCH', 'NXO 0A16', '', 1, 40, 40, 3, '0.00'),
(554, '2021-12-16 12:09:12', '0.00', '0.00', '490.00', '0.00', '0.00', 1, 'DUSTER', 'NÃO INFORMADO', '', 1, 26, 40, 3, '0.00'),
(555, '2021-12-16 12:10:12', '0.00', '0.00', '160.00', '0.00', '0.00', 1, 'FIESTA', 'NÃO INFORMADO', '', 1, 25, 40, 15, '0.00'),
(556, '2021-12-16 12:30:38', '490.00', '0.00', '0.00', '0.00', '0.00', 1, 'GOL', 'OJI 4999', '', 1, 26, 40, 16, '0.00'),
(557, '2021-12-16 12:46:14', '100.00', '0.00', '0.00', '0.00', '0.00', 1, 'GOL', 'OJI 4999', '', 1, 29, 40, 4, '0.00'),
(558, '2021-12-16 12:52:02', '0.00', '0.00', '40.00', '0.00', '0.00', 1, 'FORD KA', 'NÃO INFORMADO', '', 1, 28, 40, 3, '0.00'),
(559, '2021-12-16 13:17:33', '665.00', '0.00', '0.00', '0.00', '0.00', 1, 'ETIOS', 'psy 3334', '', 1, 29, 40, 2, '0.00'),
(560, '2021-12-16 13:23:31', '0.00', '0.00', '0.00', '60.00', '0.00', 1, 'kicks', 'NÃO INFORMADO', 'PAGO PIX LOJA', 1, 29, 40, 15, '0.00'),
(561, '2021-12-16 13:32:20', '0.00', '0.00', '420.00', '0.00', '0.00', 1, 'ECOSPORT', 'NÃO INFORMADO', 'PAGO PIX LOJA', 1, 27, 40, 8, '50.00'),
(562, '2021-12-16 13:45:27', '0.00', '0.00', '20.00', '0.00', '0.00', 1, 'CELTA', 'NÃO INFORMADO', '', 1, 29, 40, 15, '0.00'),
(563, '2021-12-16 14:08:48', '180.00', '0.00', '0.00', '0.00', '0.00', 1, 'GOL', 'PSY 0360', '', 1, 25, 40, 8, '0.00'),
(564, '2021-12-16 14:48:32', '0.00', '0.00', '20.00', '0.00', '0.00', 1, 'KA', 'NÃO INFORMADO', '', 1, 29, 40, 17, '0.00'),
(565, '2021-12-16 15:01:22', '0.00', '142.00', '0.00', '0.00', '0.00', 0, 'ALIMENTACAO', 'NÃO INFORMADO', 'PAGAMENTO DA ALIMENTAÇÃO DO DIA 16/12/2021', 1, 34, 40, 17, '0.00'),
(566, '2021-12-16 17:24:19', '0.00', '0.00', '50.00', '0.00', '0.00', 1, 'CERATTO', 'nxo 1955', '', 1, 18, 40, 11, '50.00'),
(567, '2021-12-16 17:28:25', '0.00', '160.00', '0.00', '0.00', '0.00', 1, 'UNO', 'NÃO INFORMADO', '', 1, 25, 40, 16, '0.00'),
(568, '2021-12-16 17:35:43', '0.00', '50.00', '0.00', '0.00', '0.00', 0, 'EXAME MÉDICO', 'NÃO INFORMADO', 'PAGAMENTO DE EXAME MÉDICO', 1, 44, 40, 17, '0.00'),
(569, '2021-12-16 17:41:34', '220.00', '0.00', '0.00', '0.00', '0.00', 1, 'GOLF', 'NNA 9290', '', 1, 25, 40, 8, '0.00'),
(570, '2021-12-16 17:50:31', '0.00', '30.00', '0.00', '0.00', '0.00', 0, 'NENHUM', 'NÃO INFORMADO', 'COMPRA DE COMBUSTÍVEL', 1, 41, 40, 14, '0.00'),
(571, '2021-12-16 17:54:51', '0.00', '0.00', '270.00', '0.00', '0.00', 1, 'CORSA SEDAN', 'HQA 2411', '', 1, 29, 40, 4, '0.00'),
(572, '2021-12-16 18:02:16', '0.00', '40.00', '0.00', '0.00', '0.00', 1, 'SIENNA', 'NÃO INFORMADO', '', 1, 28, 40, 9, '0.00'),
(573, '2021-12-16 18:25:30', '0.00', '10.00', '0.00', '0.00', '0.00', 0, 'PADARIA', '', 'COMPRA DE PÃO PARA DOIS DIAS. 17 e 18 DE DEZEMBRO', 1, 42, 40, 3, '0.00'),
(574, '2021-12-16 19:00:35', '180.00', '0.00', '200.00', '0.00', '0.00', 1, 'ECOSPORT', 'QQM 9E00', '', 1, 25, 40, 11, '0.00'),
(575, '2021-12-16 19:45:13', '30.00', '0.00', '0.00', '0.00', '0.00', 1, 'MOBI', 'NÃO INFORMADO', '', 1, 11, 40, 8, '0.00'),
(576, '2021-12-16 20:06:08', '0.00', '15.00', '0.00', '0.00', '0.00', 0, 'NENHUM', 'NÃO INFORMADO', 'COMPRA DE LÂMPADA', 1, 35, 40, 3, '0.00'),
(577, '2021-12-16 20:16:35', '2090.00', '0.00', '0.00', '0.00', '0.00', 1, 'HILLUX', 'NÃO INFORMADO', '', 1, 27, 40, 2, '150.00'),
(578, '2021-12-16 20:17:29', '0.00', '0.00', '1065.00', '0.00', '0.00', 1, 'DUSTER', 'NÃO INFORMADO', '', 1, 27, 40, 10, '250.00'),
(579, '2021-12-16 20:43:09', '350.00', '0.00', '0.00', '0.00', '0.00', 1, 'FORD KA', 'NÃO INFORMADO', '', 1, 26, 40, 3, '0.00'),
(580, '2021-12-16 21:10:13', '900.00', '0.00', '510.00', '0.00', '0.00', 1, 'FIESTA', 'OWJ 9292', '', 1, 27, 40, 3, '400.00'),
(581, '2021-12-16 21:23:56', '430.00', '0.00', '60.00', '0.00', '0.00', 1, 'FIESTA', 'NÃO INFORMADO', '', 1, 26, 40, 15, '0.00'),
(582, '2021-12-16 21:31:47', '0.00', '0.00', '150.00', '0.00', '0.00', 1, 'NENHUM', 'NÃO INFORMADO', '', 1, 15, 40, 15, '150.00'),
(583, '2021-12-17 13:34:32', '0.00', '200.00', '0.00', '0.00', '0.00', 1, 'UNO', 'NÃO INFORMADO', '', 1, 27, 41, 7, '50.00'),
(584, '2021-12-17 13:35:07', '350.00', '0.00', '0.00', '0.00', '0.00', 1, 'ECOSPORT', 'NÃO INFORMADO', '', 1, 26, 41, 3, '0.00'),
(585, '2021-12-17 14:05:23', '200.00', '0.00', '0.00', '0.00', '0.00', 1, 'ARGO', 'ptb 0340', '', 1, 29, 41, 4, '0.00'),
(586, '2021-12-17 14:19:24', '0.00', '30.00', '0.00', '0.00', '0.00', 0, 'prisma', 'nht 3491', 'compra de combustível', 1, 41, 41, 5, '0.00'),
(587, '2021-12-17 14:21:20', '0.00', '0.00', '80.00', '0.00', '0.00', 1, 'COROLLA', 'psj 9905', '', 1, 15, 41, 8, '0.00'),
(588, '2021-12-17 14:38:57', '0.00', '50.00', '0.00', '0.00', '0.00', 1, 'HB20', 'NÃO INFORMADO', '', 1, 29, 41, 16, '0.00'),
(589, '2021-12-17 14:52:38', '190.00', '0.00', '0.00', '0.00', '0.00', 1, 'cla', 'nho 9464', '', 1, 25, 41, 11, '0.00'),
(590, '2021-12-17 17:21:45', '0.00', '180.00', '0.00', '0.00', '0.00', 1, 'ECOSPORT', 'NÃO INFORMADO', '', 1, 25, 41, 4, '0.00'),
(591, '2021-12-17 17:38:05', '180.00', '0.00', '0.00', '0.00', '0.00', 1, 'SANDERO', 'pty 2119', '', 1, 25, 41, 11, '0.00'),
(592, '2021-12-17 18:30:39', '0.00', '174.00', '0.00', '0.00', '0.00', 0, 'ALIMENTACAO', 'NÃO INFORMADO', 'PAGAMENTO DA ALIMENTAÇÃO DIA 17/12/2021', 1, 34, 41, 17, '0.00'),
(593, '2021-12-17 18:40:39', '0.00', '200.00', '0.00', '0.00', '0.00', 1, 'AGILE', 'NÃO INFORMADO', '', 1, 27, 41, 9, '200.00'),
(597, '2021-12-17 18:57:53', '0.00', '150.00', '0.00', '0.00', '0.00', 1, 'yaris', 'NÃO INFORMADO', '', 1, 25, 41, 4, '0.00'),
(598, '2021-12-17 18:59:50', '0.00', '0.00', '0.00', '210.00', '0.00', 1, 'GOL', 'NÃO INFORMADO', 'PAGO PIX  LOJA', 1, 25, 41, 8, '0.00'),
(599, '2021-12-17 19:01:14', '0.00', '0.00', '50.00', '0.00', '0.00', 1, 'SANDERO', 'NÃO INFORMADO', '', 1, 15, 41, 4, '0.00'),
(600, '2021-12-17 19:04:17', '60.00', '0.00', '0.00', '0.00', '0.00', 1, 'PALIO', 'NÃO INFORMADO', '', 1, 15, 41, 11, '0.00'),
(602, '2021-12-17 19:12:35', '550.00', '0.00', '0.00', '0.00', '0.00', 1, 'COBOLT', 'PSD 6123', '', 1, 27, 41, 16, '200.00'),
(603, '2021-12-17 19:14:24', '0.00', '20.00', '0.00', '0.00', '0.00', 0, 'NENHUM', 'NÃO INFORMADO', 'COMPRA DE COMBUSTÍVEL', 1, 41, 41, 3, '0.00'),
(604, '2021-12-17 19:21:23', '575.00', '0.00', '0.00', '0.00', '0.00', 1, 'SENTRA', 'NÃO INFORMADO', '', 1, 29, 41, 8, '0.00'),
(605, '2021-12-17 20:14:00', '245.00', '0.00', '0.00', '0.00', '0.00', 1, 'SANDERO', 'NÃO INFORMADO', '', 1, 27, 41, 2, '50.00'),
(606, '2021-12-17 20:23:36', '0.00', '0.00', '750.00', '0.00', '0.00', 1, 'KIWD', 'NÃO INFORMADO', '', 1, 27, 41, 5, '150.00'),
(607, '2021-12-17 20:38:49', '0.00', '0.00', '30.00', '0.00', '0.00', 1, 'SANDERO', 'NÃO INFORMADO', '', 1, 29, 41, 16, '0.00'),
(608, '2021-12-17 20:48:37', '0.00', '40.00', '0.00', '0.00', '0.00', 1, 'NENHUM', 'NÃO INFORMADO', '', 1, 28, 41, 4, '0.00'),
(609, '2021-12-17 20:59:04', '0.00', '0.00', '180.00', '0.00', '0.00', 1, 'NENHUM', 'NÃO INFORMADO', '', 1, 15, 41, 15, '180.00'),
(610, '2021-12-17 21:00:06', '400.00', '0.00', '0.00', '0.00', '0.00', 1, 'RENEGADE', 'NÃO INFORMADO', '', 1, 27, 41, 2, '400.00'),
(611, '2021-12-18 12:29:58', '180.00', '0.00', '0.00', '0.00', '0.00', 1, 'POLO', 'PTN 4915', '', 1, 25, 42, 2, '0.00'),
(612, '2021-12-18 12:37:25', '60.00', '0.00', '0.00', '0.00', '0.00', 1, 'SONIC', 'NÃO INFORMADO', '', 1, 15, 42, 15, '0.00'),
(613, '2021-12-18 12:51:00', '0.00', '120.00', '0.00', '0.00', '0.00', 1, 'PALIO', 'PSK 4068', '', 1, 29, 42, 2, '0.00'),
(614, '2021-12-18 12:52:45', '0.00', '0.00', '40.00', '0.00', '0.00', 1, 'SIENA', 'NÃO INFORMADO', '', 1, 15, 42, 14, '0.00'),
(615, '2021-12-18 12:54:18', '0.00', '0.00', '150.00', '0.00', '0.00', 1, 'GOL', 'PTO 7261', '', 1, 3, 42, 15, '0.00'),
(616, '2021-12-18 13:09:16', '0.00', '0.00', '250.00', '0.00', '0.00', 1, 'HR', 'PSJ 6265', '', 1, 25, 42, 4, '0.00'),
(617, '2021-12-18 13:10:15', '560.00', '0.00', '0.00', '0.00', '0.00', 1, 'HB20', 'OXU 2E32', '', 1, 25, 42, 5, '0.00'),
(618, '2021-12-18 13:11:37', '30.00', '0.00', '0.00', '0.00', '0.00', 1, 'ETIOS', 'PSA  8241', '', 1, 11, 42, 15, '0.00'),
(619, '2021-12-18 13:12:15', '0.00', '0.00', '440.00', '0.00', '0.00', 1, 'HB20', 'OJG 2007', '', 1, 25, 42, 16, '0.00'),
(620, '2021-12-18 13:16:54', '960.00', '0.00', '0.00', '0.00', '0.00', 1, 'ONI XJOY', 'QWS 9G65', '', 1, 27, 42, 7, '150.00'),
(621, '2021-12-18 13:27:50', '0.00', '25.00', '0.00', '0.00', '0.00', 0, 'PADARIA', 'NÃO INFORMADO', 'PAGAMENTO DE 5 DIAS DO PÃO PARA A SEMANA, ENTREGUE A GABRIEL.', 1, 42, 42, 17, '0.00'),
(622, '2021-12-18 13:29:28', '0.00', '780.00', '0.00', '0.00', '0.00', 1, 'HR', 'NÃO INFORMADO', '', 1, 27, 42, 15, '150.00'),
(623, '2021-12-18 13:52:20', '50.00', '0.00', '0.00', '0.00', '0.00', 1, 'ARGO', 'ROB 2D64', '', 1, 15, 42, 16, '0.00'),
(624, '2021-12-18 14:10:52', '410.00', '0.00', '0.00', '0.00', '0.00', 1, 'S10', '', '', 1, 27, 42, 3, '70.00'),
(625, '2021-12-18 14:11:06', '410.00', '0.00', '0.00', '0.00', '0.00', 1, 'S10', '', '', 1, 27, 42, 3, '70.00'),
(626, '2021-12-18 14:33:58', '450.00', '0.00', '0.00', '0.00', '0.00', 1, 'CLIO', 'NÃO INFORMADO', '', 1, 29, 42, 10, '0.00'),
(627, '2021-12-18 14:46:52', '0.00', '0.00', '60.00', '0.00', '0.00', 1, 'CIVIC', 'NÃO INFORMADO', '', 1, 28, 42, 16, '0.00'),
(628, '2021-12-18 15:06:06', '320.00', '0.00', '0.00', '0.00', '0.00', 1, 'KICKS', 'NÃO INFORMADO', '', 1, 25, 42, 5, '0.00'),
(629, '2021-12-18 15:13:40', '0.00', '0.00', '0.00', '400.00', '0.00', 1, 'CLASSIC', 'NÃO INFORMADO', 'PAGO PIX LOJA', 1, 25, 42, 4, '0.00'),
(630, '2021-12-20 11:20:59', '0.00', '60.00', '0.00', '0.00', '0.00', 1, 'GOL', 'NÃO INFORMADO', '', 1, 28, 43, 5, '0.00');
INSERT INTO `movimentacoes` (`id`, `data`, `cartao`, `dinheiro`, `debito`, `pix`, `transferencia`, `tipo`, `veiculo`, `placa`, `descricao`, `status`, `catdespesas_id`, `caixa_id`, `mecanicos_id`, `maobra`) VALUES
(631, '2021-12-20 11:41:47', '0.00', '50.00', '0.00', '0.00', '0.00', 1, 'VOYAGE', 'djl 5820', '', 1, 15, 43, 8, '0.00'),
(632, '2021-12-20 11:59:59', '0.00', '150.00', '0.00', '0.00', '0.00', 1, 'ONIX', 'ptr 3856', '', 1, 29, 43, 3, '0.00'),
(633, '2021-12-20 12:04:47', '0.00', '0.00', '0.00', '410.00', '0.00', 1, 'COROLLA', 'NÃO INFORMADO', 'PAGO PIX LOJA', 1, 25, 43, 7, '0.00'),
(634, '2021-12-20 12:15:16', '0.00', '0.00', '60.00', '0.00', '0.00', 1, 'PEGEOUT', 'NÃO INFORMADO', '', 1, 15, 43, 8, '0.00'),
(635, '2021-12-20 12:38:25', '0.00', '230.00', '0.00', '0.00', '0.00', 1, 'ETIOS', 'NÃO INFORMADO', '', 1, 25, 43, 3, '0.00'),
(636, '2021-12-20 12:57:52', '0.00', '0.00', '40.00', '0.00', '0.00', 1, 'LOGAN', 'PSK 4459', '', 1, 28, 43, 3, '0.00'),
(637, '2021-12-20 13:44:41', '0.00', '0.00', '0.00', '270.00', '0.00', 1, 'S10', 'NOV  8922', 'PAGO PIX LOJA', 1, 25, 43, 16, '0.00'),
(638, '2021-12-20 13:45:45', '0.00', '0.00', '290.00', '0.00', '0.00', 1, 'VERSA', 'NXI 8597', '', 1, 26, 43, 5, '0.00'),
(639, '2021-12-20 13:46:54', '0.00', '0.00', '0.00', '330.00', '0.00', 1, 'HB20 ', 'NÃO INFORMADO', 'PAGO PIX LOJA', 1, 29, 43, 5, '0.00'),
(640, '2021-12-20 13:50:13', '0.00', '0.00', '240.00', '0.00', '0.00', 1, 'SANDERO', 'NÃO INFORMADO', '', 1, 25, 43, 7, '0.00'),
(641, '2021-12-20 13:57:30', '0.00', '0.00', '0.00', '25.00', '0.00', 1, 'MOBI', 'NÃO INFORMADO', 'PAGO PIX LOJA', 1, 29, 43, 16, '0.00'),
(642, '2021-12-20 14:25:07', '0.00', '120.00', '0.00', '40.00', '0.00', 1, 'FORD KA ', 'PSM 9365', '', 1, 25, 43, 5, '0.00'),
(643, '2021-12-20 14:32:07', '0.00', '0.00', '0.00', '50.00', '0.00', 1, 'HB20', 'NÃO INFORMADO', 'PAGO PIX LOJA', 1, 28, 43, 5, '0.00'),
(644, '2021-12-20 14:34:55', '40.00', '0.00', '0.00', '0.00', '0.00', 1, 'ONIX', 'NÃO INFORMADO', '', 1, 28, 43, 5, '0.00'),
(645, '2021-12-20 14:36:31', '0.00', '0.00', '0.00', '1270.00', '0.00', 1, 'VOYAGE', 'NÃO INFORMADO', 'PAGO  PIX LOJA ', 1, 27, 43, 10, '200.00'),
(646, '2021-12-20 14:54:28', '0.00', '50.00', '0.00', '0.00', '0.00', 0, 'COMBUSTIVEL', 'NÃO INFORMADO', 'COMPRA DE COMBUSTÍVEL', 1, 41, 43, 3, '0.00'),
(647, '2021-12-20 15:00:52', '0.00', '240.00', '0.00', '0.00', '0.00', 1, 'HR', 'NÃO INFORMADO', '', 1, 25, 43, 2, '0.00'),
(648, '2021-12-20 15:03:27', '0.00', '7.00', '0.00', '0.00', '0.00', 1, 'NENHUM', 'NÃO INFORMADO', '', 1, 29, 43, 16, '0.00'),
(649, '2021-12-20 16:36:11', '0.00', '0.00', '1000.00', '0.00', '0.00', 1, 'CELTA', 'NÃO INFORMADO', '', 1, 18, 43, 15, '1000.00'),
(650, '2021-12-20 16:39:52', '0.00', '105.00', '0.00', '0.00', '0.00', 0, 'ALIMENTACAO', 'NÃO INFORMADO', 'PAGAMENTO DE ALIMENTAÇÃO DO DIA 20/12/2021', 1, 34, 43, 17, '0.00'),
(651, '2021-12-20 16:56:37', '0.00', '100.00', '0.00', '0.00', '0.00', 1, 'UNO', 'OIV 9872', '', 1, 29, 43, 2, '0.00'),
(652, '2021-12-20 18:09:21', '50.00', '0.00', '0.00', '0.00', '0.00', 1, 'HB20', 'NÃO INFORMADO', '', 1, 15, 43, 8, '0.00'),
(653, '2021-12-20 18:24:03', '195.00', '0.00', '0.00', '0.00', '0.00', 1, 'FIESTA', 'NÃO INFORMADO', '', 1, 25, 43, 3, '0.00'),
(654, '2021-12-20 19:26:26', '0.00', '0.00', '0.00', '300.00', '0.00', 1, 'FIESTA', 'OJQ 6211', 'PAGO PIX LOJA', 1, 25, 43, 8, '0.00'),
(655, '2021-12-20 19:29:16', '0.00', '0.00', '30.00', '0.00', '0.00', 1, 'HB20', 'NÃO INFORMADO', '', 1, 11, 43, 2, '0.00'),
(656, '2021-12-20 19:39:16', '3000.00', '0.00', '350.00', '0.00', '0.00', 1, 'ECOSPORT', 'QJQ 8425', '', 1, 27, 43, 8, '350.00'),
(657, '2021-12-20 19:43:44', '0.00', '400.00', '0.00', '0.00', '0.00', 1, 'TORO', 'NÃO INFORMADO', '', 1, 18, 43, 10, '400.00'),
(658, '2021-12-20 20:26:49', '0.00', '0.00', '180.00', '0.00', '0.00', 1, 'KA', 'QNI8131', '', 1, 25, 43, 17, '0.00'),
(659, '2021-12-20 20:48:48', '0.00', '0.00', '60.00', '0.00', '0.00', 1, 'SIENNA', 'PTC C685', '', 1, 15, 43, 8, '0.00'),
(660, '2021-12-20 21:16:56', '180.00', '0.00', '0.00', '0.00', '0.00', 1, 'FOX', 'PSG 8465', '', 1, 25, 43, 3, '0.00'),
(661, '2021-12-20 21:19:25', '0.00', '0.00', '0.00', '400.00', '0.00', 1, 'PALIO', 'OIX 1243', 'PAGO PIX LOJA', 1, 27, 43, 2, '285.00'),
(662, '2021-12-20 21:22:12', '0.00', '0.00', '160.00', '0.00', '0.00', 1, 'PEGEOT', 'NÃO INFORMADO', '', 1, 27, 43, 3, '50.00'),
(663, '2021-12-20 21:24:59', '0.00', '0.00', '270.00', '0.00', '0.00', 1, 'NENHUM', 'NÃO INFORMADO', '', 1, 15, 43, 14, '270.00'),
(664, '2021-12-21 11:53:07', '0.00', '180.00', '0.00', '0.00', '0.00', 1, 'SANDERO', 'PSM 0341', '', 1, 25, 44, 7, '0.00'),
(665, '2021-12-21 12:00:10', NULL, '61500.00', NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, 38, 41, 14, NULL),
(666, '2021-12-21 12:04:49', '370.00', '0.00', '0.00', '0.00', '0.00', 1, 'PALIO', 'OJG 2483', '', 1, 27, 44, 8, '100.00'),
(667, '2021-12-21 12:06:09', '0.00', '0.00', '0.00', '330.00', '0.00', 1, 'HB20', 'PSQ 7018', 'PAGO PIX LOJA', 1, 29, 44, 3, '0.00'),
(668, '2021-12-21 12:08:26', '0.00', '160.00', '0.00', '0.00', '0.00', 1, 'UP', 'OXV 4652', '', 1, 25, 44, 5, '0.00'),
(669, '2021-12-21 12:53:24', '0.00', '50.00', '0.00', '0.00', '0.00', 1, 'HB20', 'NÃO INFORMADO', '', 1, 15, 44, 2, '0.00'),
(670, '2021-12-21 13:18:48', '0.00', '29.00', '0.00', '0.00', '0.00', 0, 'MERCEARIA', 'NÃO INFORMADO', 'COMPRA DE COPO PARA CAFÉ E SACO DE LIXO PARA LOJA', 1, 37, 44, 4, '0.00'),
(671, '2021-12-21 14:26:44', '50.00', '0.00', '0.00', '0.00', '0.00', 1, 'SANDERO', 'NÃO INFORMADO', '', 1, 15, 44, 11, '0.00'),
(672, '2021-12-21 14:29:38', '450.00', '0.00', '0.00', '0.00', '0.00', 1, 'VERSA', 'NÃO INFORMADO', '', 1, 27, 44, 3, '100.00'),
(673, '2021-12-21 14:36:49', '490.00', '0.00', '0.00', '0.00', '0.00', 1, 'FIESTA', 'NÃO INFORMADO', '', 1, 26, 44, 3, '0.00'),
(674, '2021-12-21 14:46:39', '200.00', '0.00', '0.00', '0.00', '0.00', 1, 'VOYAGE', 'NÃO INFORMADO', '', 1, 29, 44, 5, '0.00'),
(675, '2021-12-21 14:47:31', '0.00', '158.00', '0.00', '0.00', '0.00', 0, 'ALIMENTACAO', 'NÃO INFORMADO', 'PAGO ALIMENTAÇÃO DO DIA 21/12/2021', 1, 34, 44, 17, '0.00'),
(676, '2021-12-21 14:53:27', '170.00', '0.00', '0.00', '0.00', '0.00', 1, 'HB20', 'PTC 0038', '', 1, 27, 44, 5, '50.00'),
(677, '2021-12-21 14:54:41', '0.00', '50.00', '0.00', '0.00', '0.00', 1, 'GOL', 'PSA 2455', '', 1, 18, 44, 15, '50.00'),
(678, '2021-12-21 14:59:00', '540.00', '0.00', '0.00', '0.00', '0.00', 1, 'ONIX', 'PSA 2455', '', 1, 27, 44, 10, '150.00'),
(679, '2021-12-21 15:07:16', '160.00', '0.00', '0.00', '0.00', '0.00', 1, 'SIENA', 'NÃO INFORMADO', '', 1, 25, 44, 2, '0.00'),
(680, '2021-12-21 16:43:24', '330.00', '0.00', '0.00', '0.00', '0.00', 1, 'KA', 'NÃO INFORMADO', '', 1, 25, 44, 7, '0.00'),
(681, '2021-12-21 16:45:25', '0.00', '0.00', '90.00', '0.00', '0.00', 1, 'yaris', 'PTG 3487', '', 1, 3, 44, 8, '0.00'),
(682, '2021-12-21 17:14:27', '0.00', '0.00', '40.00', '0.00', '0.00', 1, 'ARGO', 'NÃO INFORMADO', '', 1, 28, 44, 17, '0.00'),
(683, '2021-12-21 17:35:54', '0.00', '47.00', '0.00', '0.00', '0.00', 0, 'MERCEARIA', 'NÃO INFORMADO', 'COMPRA DE 6 PACOTES DE CAFÉ', 1, 37, 44, 17, '0.00'),
(684, '2021-12-21 17:51:21', '60.00', '0.00', '0.00', '0.00', '0.00', 1, 'KIWD', 'NÃO INFORMADO', '', 1, 28, 44, 11, '0.00'),
(685, '2021-12-21 18:00:31', '0.00', '0.00', '440.00', '0.00', '0.00', 1, 'yaris', 'PTH 2879', '', 1, 25, 44, 8, '0.00'),
(686, '2021-12-21 19:12:57', '0.00', '0.00', '170.00', '0.00', '0.00', 1, 'PRISMA', 'NÃO INFORMADO', '', 1, 25, 44, 5, '0.00'),
(687, '2021-12-21 19:13:27', '290.00', '0.00', '0.00', '0.00', '0.00', 1, 'HILLUX', 'NÃO INFORMADO', '', 1, 25, 44, 4, '0.00'),
(688, '2021-12-21 19:14:37', '0.00', '0.00', '0.00', '400.00', '0.00', 1, 'palio', 'NÃO INFORMADO', 'pago pix loja', 1, 27, 44, 16, '100.00'),
(689, '2021-12-21 19:16:35', '0.00', '100.00', '0.00', '110.00', '0.00', 1, 'HRV', 'psn 9058', 'pago pix loja', 1, 25, 44, 5, '0.00'),
(690, '2021-12-21 19:17:23', '0.00', '0.00', '180.00', '0.00', '0.00', 1, 'VERSA', 'NÃO INFORMADO', '', 1, 25, 44, 14, '0.00'),
(691, '2021-12-21 19:18:13', '180.00', '0.00', '0.00', '0.00', '0.00', 1, 'HB20', 'NÃO INFORMADO', '', 1, 25, 44, 11, '0.00'),
(692, '2021-12-21 19:30:05', '0.00', '0.00', '150.00', '0.00', '0.00', 1, 'PALIO', 'NÃO INFORMADO', '', 1, 25, 44, 8, '0.00'),
(693, '2021-12-21 19:50:34', '0.00', '0.00', '0.00', '350.00', '0.00', 1, 'HILLUX', 'nkp 8129', 'PAGO PIX LOJA', 1, 25, 44, 11, '40.00'),
(694, '2021-12-21 20:01:24', '60.00', '0.00', '0.00', '0.00', '0.00', 1, 'COROLLA', 'PTS 4D68', '', 1, 15, 44, 8, '0.00'),
(695, '2021-12-21 20:05:46', '400.00', '600.00', '0.00', '0.00', '0.00', 1, 'TORO', 'PTI 6779', '', 1, 26, 44, 5, '0.00'),
(696, '2021-12-21 20:13:01', '0.00', '0.00', '250.00', '0.00', '0.00', 1, 'ARGO', 'NÃO INFORMADO', '', 1, 27, 44, 5, '50.00'),
(697, '2021-12-21 20:55:07', '350.00', '0.00', '0.00', '0.00', '0.00', 1, 'HB20', 'NÃO INFORMADO', '', 1, 26, 44, 3, '0.00'),
(698, '2021-12-21 20:56:30', '0.00', '0.00', '130.00', '0.00', '0.00', 1, 'MARCH', 'NÃO INFORMADO', '', 1, 27, 44, 10, '100.00'),
(699, '2021-12-21 20:57:18', '0.00', '0.00', '150.00', '0.00', '0.00', 1, 'CLASSIC', 'MXC 7317', '', 1, 25, 44, 5, '0.00'),
(700, '2021-12-21 21:10:14', '0.00', '800.00', '0.00', '0.00', '0.00', 1, 'STRADA', 'NÃO INFORMADO', '', 1, 27, 44, 3, '250.00'),
(701, '2021-12-21 21:17:25', '1000.00', '0.00', '0.00', '0.00', '0.00', 1, 'HILLUX', 'NÃO INFORMADO', '', 1, 27, 44, 2, '350.00'),
(702, '2021-12-21 21:23:24', '0.00', '30.00', '0.00', '0.00', '0.00', 0, 'FUSION', 'NÃO INFORMADO', 'GORJETA PAGA NO DEBITO', 1, 23, 44, 10, '0.00'),
(703, '2021-12-21 21:25:33', '0.00', '0.00', '300.00', '0.00', '0.00', 1, 'NENHUM', 'NÃO INFORMADO', '', 1, 15, 44, 14, '300.00'),
(704, '2021-12-21 21:27:11', '0.00', '0.00', '0.00', '170.00', '0.00', 1, 'CELTA', 'NÃO INFORMADO', 'PAGO PIX LOJA', 1, 23, 44, 11, '150.00'),
(705, '2021-12-21 21:33:42', '0.00', '0.00', '300.00', '0.00', '0.00', 1, 'FUSION', 'NÃO INFORMADO', '', 1, 23, 44, 14, '300.00'),
(706, '2021-12-21 21:43:00', '0.00', '0.00', '0.00', '800.00', '0.00', 1, 'HILLUX', 'NÃO INFORMADO', 'PAGO PIX LOJA', 1, 27, 44, 2, '300.00'),
(707, '2021-12-22 11:36:49', '0.00', '0.00', '0.00', '0.00', '890.00', 1, 'SPIN', 'NÃO INFORMADO', 'CLIENTE TRANSFERIU PARA CONTA DE JEFFERSON O PAGAMENTO DA SPIN.', 1, 27, 44, 7, '50.00'),
(708, '2021-12-22 11:43:45', '0.00', '395.00', '0.00', '0.00', '0.00', 1, 'FIESTA', 'NÃO INFORMADO', '', 1, 25, 44, 10, '0.00'),
(709, '2021-12-22 11:58:14', '0.00', '100.00', '0.00', '0.00', '0.00', 1, 'HILLUX ', 'NÃO INFORMADO', '', 1, 18, 45, 2, '100.00'),
(710, '2021-12-22 12:15:10', '0.00', '0.00', '180.00', '0.00', '0.00', 1, 'FOX ', 'PSP 9004', '', 1, 25, 45, 8, '0.00'),
(711, '2021-12-22 12:24:28', '210.00', '0.00', '0.00', '0.00', '0.00', 1, 'PALIO', 'OJQ  5432', '', 1, 25, 45, 11, '0.00'),
(712, '2021-12-22 12:37:44', '0.00', '0.00', '250.00', '0.00', '0.00', 1, 'SW4', 'NXF 6G17', '', 1, 25, 45, 2, '0.00'),
(713, '2021-12-22 12:49:45', '0.00', '10.00', '0.00', '0.00', '0.00', 0, 'NENHUM', 'NÃO INFORMADO', 'COMPRA DE COMBUSTÍVEL , FUNCIONÁRIO CARLOS', 1, 41, 45, 4, '0.00'),
(714, '2021-12-22 13:40:09', '0.00', '300.00', '0.00', '0.00', '0.00', 1, 'STRADA', 'PTN 3823', '', 1, 25, 45, 8, '0.00'),
(715, '2021-12-22 14:02:17', '180.00', '0.00', '0.00', '0.00', '0.00', 1, 'TUCSON', 'NNB 5646', '', 1, 29, 45, 10, '0.00'),
(716, '2021-12-22 14:24:38', '0.00', '0.00', '60.00', '0.00', '0.00', 1, 'COROLLA', 'psk 9f05', '', 1, 15, 45, 2, '0.00'),
(717, '2021-12-22 14:25:16', '0.00', '0.00', '180.00', '0.00', '0.00', 1, 'COROLLA', 'pse 7259', '', 1, 25, 45, 16, '0.00'),
(718, '2021-12-22 14:26:10', '0.00', '0.00', '160.00', '0.00', '0.00', 1, 'ARGO', 'PTQ ', '', 1, 25, 45, 11, '0.00'),
(719, '2021-12-22 14:34:00', '0.00', '0.00', '0.00', '3220.00', '0.00', 1, 'UNO', 'OPQ 2G59', 'PAGO PIX LOJA', 1, 27, 45, 6, '300.00'),
(720, '2021-12-22 14:51:58', '0.00', '0.00', '160.00', '0.00', '0.00', 1, 'CLASSIC', 'NHJ 1G13', '', 1, 25, 45, 8, '0.00'),
(721, '2021-12-22 14:53:08', '0.00', '120.00', '0.00', '0.00', '0.00', 0, 'ALIMENTACAO', 'NÃO INFORMADO', 'PAGO ALIMENTAÇÃO DO DIA 22/12/2021', 1, 34, 45, 14, '0.00'),
(722, '2021-12-22 15:00:06', '0.00', '400.00', '0.00', '0.00', '0.00', 1, 'STRADA', 'NÃO INFORMADO', '', 1, 27, 45, 3, '200.00'),
(724, '2021-12-22 16:42:15', '400.00', '0.00', '0.00', '0.00', '0.00', 1, 'SIENNA', 'NÃO INFORMADO', '', 1, 27, 45, 15, '350.00'),
(725, '2021-12-22 17:07:52', '0.00', '50.00', '0.00', '0.00', '0.00', 1, 'ETIOS', 'OJD 7311', '', 1, 15, 45, 11, '0.00'),
(726, '2021-12-22 17:44:24', '620.00', '0.00', '0.00', '0.00', '0.00', 1, 'COROLLA', 'OIS 9191', '', 1, 27, 45, 4, '50.00'),
(727, '2021-12-22 18:02:03', '0.00', '0.00', '180.00', '0.00', '0.00', 1, 'POLO', 'PTD 3276', '', 1, 25, 45, 11, '0.00'),
(728, '2021-12-22 18:02:59', '180.00', '0.00', '0.00', '0.00', '0.00', 1, 'ETIOS', 'OJK 6392', '', 1, 29, 45, 4, '0.00'),
(729, '2021-12-22 18:04:06', '90.00', '0.00', '0.00', '0.00', '0.00', 1, 'PALIO', 'OXZ 7203', '', 1, 28, 45, 7, '50.00'),
(730, '2021-12-22 18:12:07', '0.00', '80.00', '0.00', '0.00', '0.00', 1, 'TUCSON', 'PSN 7188', '', 1, 3, 45, 3, '0.00'),
(731, '2021-12-22 18:31:37', '160.00', '0.00', '0.00', '0.00', '0.00', 1, 'ONI XJOY', 'PTK 2008', '', 1, 25, 45, 7, '0.00'),
(732, '2021-12-22 18:32:21', '0.00', '0.00', '160.00', '0.00', '0.00', 1, 'CLASSIC', 'OIR 6456', '', 1, 25, 45, 3, '0.00'),
(733, '2021-12-22 19:25:58', '0.00', '180.00', '0.00', '0.00', '0.00', 1, 'HB20', 'NÃO INFORMADO', '', 1, 25, 45, 8, '0.00'),
(734, '2021-12-22 19:48:08', '630.00', '0.00', '0.00', '0.00', '0.00', 1, 'SANDERO', 'PSF 4267', '', 1, 27, 45, 15, '250.00'),
(735, '2021-12-22 20:00:16', '0.00', '0.00', '100.00', '0.00', '0.00', 1, 'KIWD', 'PTA 7899', '', 1, 18, 45, 8, '100.00'),
(736, '2021-12-22 20:04:30', '1300.00', '1000.00', '0.00', '2500.00', '0.00', 1, 'FIESTA', 'NXJ 5105', 'PAGO PIX LOJA', 1, 27, 45, 6, '1600.00'),
(737, '2021-12-22 20:16:16', '0.00', '50.00', '0.00', '0.00', '0.00', 1, 'HB20', 'NÃO INFORMADO', '', 1, 18, 45, 8, '50.00'),
(738, '2021-12-22 20:19:02', '0.00', '160.00', '0.00', '0.00', '0.00', 1, 'STRADA', 'NÃO INFORMADO', '', 1, 25, 45, 11, '0.00'),
(739, '2021-12-22 20:28:07', '0.00', '0.00', '70.00', '0.00', '0.00', 1, 'FRONTIER', 'NÃO INFORMADO', '', 1, 15, 45, 4, '0.00'),
(740, '2021-12-22 20:42:23', '1220.00', '0.00', '0.00', '0.00', '0.00', 1, 'VERSA', 'OIX 3776', '', 1, 27, 45, 7, '200.00'),
(741, '2021-12-22 20:44:24', '800.00', '0.00', '500.00', '0.00', '0.00', 1, 'PALIO', 'NÃO INFORMADO', '', 1, 27, 45, 10, '80.00'),
(742, '2021-12-22 20:53:38', '0.00', '60.00', '0.00', '0.00', '0.00', 0, 'UNO', 'NÃO INFORMADO', 'PAGO PARA JEFFERSON,  CLIENTE ENVIOU PARA O PIX LOJA.', 1, 45, 45, 6, '0.00'),
(743, '2021-12-22 20:55:11', '0.00', '0.00', '220.00', '0.00', '0.00', 1, 'CRUZE', 'NÃO INFORMADO', '', 1, 25, 45, 6, '0.00'),
(744, '2021-12-23 11:41:07', '420.00', '0.00', '0.00', '0.00', '0.00', 1, 'LOGAN', 'PSK 4459', '', 1, 27, 46, 15, '150.00'),
(745, '2021-12-23 11:44:21', '0.00', '0.00', '70.00', '0.00', '0.00', 1, 'FRONTIER', 'psj 1371', '', 1, 15, 46, 11, '0.00'),
(746, '2021-12-23 11:58:43', '490.00', '0.00', '0.00', '0.00', '0.00', 1, 'FORD KA', 'NÃO INFORMADO', '', 1, 26, 46, 15, '0.00'),
(747, '2021-12-23 12:33:12', '0.00', '0.00', '40.00', '0.00', '0.00', 1, 'TUCSON', 'NÃO INFORMADO', '', 1, 28, 46, 3, '0.00'),
(748, '2021-12-23 12:39:27', '490.00', '0.00', '0.00', '0.00', '0.00', 1, 'KIWD', 'NÃO INFORMADO', '', 1, 26, 46, 15, '0.00'),
(749, '2021-12-23 13:08:01', '0.00', '0.00', '180.00', '0.00', '0.00', 1, 'CLASSIC', 'nmz 5686', '', 1, 25, 46, 4, '0.00'),
(750, '2021-12-23 13:11:21', '0.00', '50.00', '0.00', '0.00', '0.00', 1, 'strada', 'NÃO INFORMADO', '', 1, 15, 46, 8, '0.00'),
(751, '2021-12-23 13:15:32', '80.00', '0.00', '0.00', '0.00', '0.00', 1, 'SANDERO', 'NÃO INFORMADO', '', 1, 29, 46, 3, '0.00'),
(752, '2021-12-23 13:26:01', '390.00', '0.00', '0.00', '0.00', '0.00', 1, 'COROLLA', 'pip 8f74', '', 1, 26, 46, 15, '0.00'),
(753, '2021-12-23 13:35:57', '285.00', '0.00', '0.00', '0.00', '0.00', 1, 'GOL', 'NÃO INFORMADO', '', 1, 25, 46, 6, '0.00'),
(754, '2021-12-23 13:37:06', '500.00', '0.00', '0.00', '0.00', '0.00', 1, 'KIWD', 'ptw 7803', '', 1, 29, 46, 5, '80.00'),
(755, '2021-12-23 13:51:38', '330.00', '0.00', '0.00', '0.00', '0.00', 1, 'DUSTER', 'NÃO INFORMADO', '', 1, 25, 46, 6, '0.00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagamento`
--

CREATE TABLE `pagamento` (
  `id` int(11) NOT NULL,
  `data` date DEFAULT current_timestamp(),
  `valor` decimal(10,2) DEFAULT NULL,
  `saldo` decimal(10,2) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `comentario` varchar(100) DEFAULT NULL,
  `caixa_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `pagamento`
--

INSERT INTO `pagamento` (`id`, `data`, `valor`, `saldo`, `status`, `comentario`, `caixa_id`) VALUES
(18, '2021-12-01', '0.00', '585.00', 1, '', 28),
(19, '2021-12-03', '0.00', '1135.00', 1, 'PAGO 390 REAIS NO PIX, HB20.', 29),
(20, '2021-12-04', '0.00', '565.00', 1, '', 30),
(21, '2021-12-06', '0.00', '730.00', 1, 'LINK DE PAGAMENTO  DE 360,00', 31),
(22, '2021-12-07', '0.00', '1110.00', 1, '', 32),
(26, '2021-12-08', '0.00', '490.00', 1, '', 33),
(28, '2021-12-09', '0.00', '1055.00', 1, '', 34),
(30, '2021-12-02', '0.00', '975.00', 1, 'DESCONTADO 150,00 DE VENDA DE UMA PEÇA PASSADA NA MAQUININHA JEFFERSON', 28),
(31, '2021-12-10', '0.00', '1465.00', 1, '', 35),
(32, '2021-12-13', '0.00', '660.00', 1, NULL, 36),
(33, '2021-12-14', '1250.00', '1250.00', 0, '', 37),
(36, '2021-12-11', '0.00', '1015.00', 1, NULL, 36),
(37, '2021-12-15', '1470.00', '1470.00', 0, NULL, 39),
(38, '2021-12-16', '525.00', '525.00', 0, NULL, 40),
(39, '2021-12-17', '0.00', '615.00', 1, '', 41),
(40, '2021-12-18', '395.00', '395.00', 0, NULL, 42),
(41, '2021-12-20', '827.50', '827.50', 0, NULL, 43),
(42, '2021-12-22', '1395.00', '1395.00', 0, NULL, 44),
(43, '2021-12-22', '1665.00', '1665.00', 0, NULL, 45),
(44, '2021-12-23', '115.00', '115.00', 0, NULL, 46);

-- --------------------------------------------------------

--
-- Estrutura da tabela `servicos`
--

CREATE TABLE `servicos` (
  `id` int(11) NOT NULL,
  `data` date DEFAULT current_timestamp(),
  `data1` timestamp NULL DEFAULT current_timestamp(),
  `extra_id` int(11) NOT NULL,
  `mecanicos_id` int(11) NOT NULL,
  `valor` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `servicos`
--

INSERT INTO `servicos` (`id`, `data`, `data1`, `extra_id`, `mecanicos_id`, `valor`) VALUES
(12, '2021-11-01', '2021-11-23 17:46:13', 2, 2, '20.00'),
(13, '2021-11-01', '2021-11-23 17:46:38', 2, 2, '20.00'),
(15, '2021-11-13', '2021-11-23 17:48:17', 2, 9, '20.00'),
(16, '2021-11-04', '2021-11-23 17:48:41', 2, 5, '20.00'),
(17, '2021-11-04', '2021-11-23 17:49:04', 3, 1, '10.00'),
(18, '2021-11-05', '2021-11-23 17:50:52', 3, 1, '10.00'),
(19, '2021-11-08', '2021-11-23 17:51:25', 2, 5, '40.00'),
(20, '2021-11-08', '2021-11-23 17:51:44', 2, 1, '20.00'),
(21, '2021-11-09', '2021-11-23 17:52:16', 3, 10, '15.00'),
(22, '2021-11-10', '2021-11-23 17:54:14', 2, 5, '20.00'),
(23, '2021-11-11', '2021-11-23 17:54:37', 2, 5, '40.00'),
(24, '2021-11-13', '2021-11-23 17:55:06', 2, 5, '20.00'),
(25, '2021-11-16', '2021-11-23 17:55:46', 3, 5, '10.00'),
(26, '2021-11-16', '2021-11-23 17:56:30', 2, 5, '20.00'),
(27, '2021-11-04', '2021-11-23 17:56:50', 3, 3, '30.00'),
(28, '2021-11-13', '2021-11-23 17:57:08', 3, 8, '5.00'),
(29, '2021-11-19', '2021-11-23 17:57:45', 2, 1, '20.00'),
(30, '2021-11-20', '2021-11-23 17:57:58', 2, 3, '20.00'),
(31, '2021-11-19', '2021-11-23 17:58:18', 2, 9, '20.00'),
(32, '2021-11-13', '2021-11-23 17:58:40', 2, 10, '20.00'),
(33, '2021-11-01', '2021-11-23 17:58:54', 2, 3, '20.00'),
(34, '2021-11-04', '2021-11-23 17:59:06', 2, 2, '20.00'),
(35, '2021-11-04', '2021-11-23 17:59:25', 2, 7, '20.00'),
(36, '2021-11-22', '2021-11-23 18:00:49', 3, 11, '25.00'),
(37, '2021-11-20', '2021-11-23 18:01:27', 2, 3, '20.00'),
(38, '2021-11-17', '2021-11-23 18:01:52', 2, 3, '20.00'),
(39, '2021-11-19', '2021-11-23 18:02:08', 2, 3, '20.00'),
(40, '2021-11-19', '2021-11-23 18:02:31', 2, 9, '20.00'),
(41, '2021-11-11', '2021-11-23 18:08:50', 2, 5, '20.00'),
(42, '2021-11-17', '2021-11-23 18:09:29', 2, 8, '20.00'),
(43, '2021-11-19', '2021-11-23 18:10:31', 2, 10, '30.00'),
(44, '2021-11-13', '2021-11-23 18:12:58', 2, 9, '20.00'),
(45, '2021-11-23', '2021-11-23 18:13:15', 2, 9, '20.00'),
(46, '2021-12-06', '2021-12-06 19:46:06', 5, 1, '55.00'),
(47, '2021-12-06', '2021-12-06 19:47:01', 2, 3, '20.00'),
(48, '2021-12-06', '2021-12-06 19:47:03', 2, 3, '20.00'),
(49, '2021-12-09', '2021-12-09 13:55:14', 3, 8, '90.00'),
(50, '2021-12-09', '2021-12-09 16:51:14', 5, 3, '10.00'),
(51, '2021-12-09', '2021-12-09 20:55:47', 2, 5, '20.00'),
(52, '2021-12-11', '2021-12-11 14:03:40', 2, 3, '20.00'),
(54, '2021-12-11', '2021-12-11 14:52:49', 5, 7, '30.00'),
(55, '2021-12-13', '2021-12-13 13:22:41', 2, 8, '20.00'),
(56, '2021-12-13', '2021-12-13 16:41:05', 5, 8, '10.00'),
(57, '2021-12-13', '2021-12-13 20:42:16', 2, 9, '20.00'),
(58, '2021-12-14', '2021-12-14 18:27:51', 2, 9, '20.00'),
(59, '2021-12-14', '2021-12-14 20:13:55', 2, 9, '20.00'),
(60, '2021-12-15', '2021-12-15 12:40:59', 2, 9, '20.00'),
(61, '2021-12-15', '2021-12-15 14:41:56', 5, 8, '15.00'),
(62, '2021-12-16', '2021-12-16 13:17:53', 2, 2, '20.00'),
(63, '2021-12-16', '2021-12-16 17:41:54', 2, 8, '20.00'),
(64, '2021-12-17', '2021-12-17 14:16:32', 5, 11, '30.00'),
(65, '2021-12-17', '2021-12-17 14:21:56', 5, 8, '15.00'),
(66, '2021-12-20', '2021-12-20 13:10:05', 2, 5, '20.00'),
(67, '2021-12-21', '2021-12-21 16:39:57', 5, 8, '15.00'),
(68, '2021-12-21', '2021-12-21 17:55:24', 2, 8, '20.00'),
(69, '2021-12-23', '2021-12-23 12:32:42', 2, 3, '20.00'),
(70, '2021-12-23', '2021-12-23 13:46:14', 3, 11, '20.00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `cargos_id` int(11) NOT NULL,
  `acessos_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `email`, `senha`, `cargos_id`, `acessos_id`) VALUES
(4, 'admin', 'admin@eneylton.com', '$2y$10$mZ.QuTVOWHefiG58kSk2K.BW3VDnDFu/l1fhYaBmRhQ5eJTJImThm', 1, 1),
(7, 'Eneylton Barros', 'eneylton@hotmail.com', '$2y$10$JZR7X2ZpplGhF4dtchAhJedF/Y0/4ynAOd8VBlR4ehJfLOKHX4mLG', 1, 2),
(13, 'ene', 'enex@gmail.com.br', '202cb962ac59075b964b07152d234b70', 1, 3);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `acessos`
--
ALTER TABLE `acessos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `caixa`
--
ALTER TABLE `caixa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_caixa_forma_pagamento1_idx` (`forma_pagamento_id`),
  ADD KEY `fk_caixa_usuarios1_idx` (`usuarios_id`);

--
-- Índices para tabela `cargos`
--
ALTER TABLE `cargos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `catdespesas`
--
ALTER TABLE `catdespesas`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `extra`
--
ALTER TABLE `extra`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `forma_pagamento`
--
ALTER TABLE `forma_pagamento`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `maobra`
--
ALTER TABLE `maobra`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_movimentacoes_copy1_mecanicos1_idx` (`mecanicos_id`),
  ADD KEY `fk_maobra_caixa_idx` (`caixa_id`),
  ADD KEY `fk_maobra_catdespesas1_idx` (`catdespesas_id`);

--
-- Índices para tabela `mecanicos`
--
ALTER TABLE `mecanicos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `movimentacoes`
--
ALTER TABLE `movimentacoes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_movimentacoes_catdespesas1_idx` (`catdespesas_id`),
  ADD KEY `fk_movimentacoes_caixa1_idx` (`caixa_id`),
  ADD KEY `fk_movimentacoes_mecanicos1_idx` (`mecanicos_id`);

--
-- Índices para tabela `pagamento`
--
ALTER TABLE `pagamento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pagamento_caixa1_idx` (`caixa_id`);

--
-- Índices para tabela `servicos`
--
ALTER TABLE `servicos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_servicos_extra1_idx` (`extra_id`),
  ADD KEY `fk_servicos_mecanicos1_idx` (`mecanicos_id`);

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `fk_usuarios_cargos_idx` (`cargos_id`),
  ADD KEY `fk_usuarios_acessos1_idx` (`acessos_id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `acessos`
--
ALTER TABLE `acessos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `caixa`
--
ALTER TABLE `caixa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT de tabela `cargos`
--
ALTER TABLE `cargos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `catdespesas`
--
ALTER TABLE `catdespesas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT de tabela `extra`
--
ALTER TABLE `extra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `forma_pagamento`
--
ALTER TABLE `forma_pagamento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `maobra`
--
ALTER TABLE `maobra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=320;

--
-- AUTO_INCREMENT de tabela `mecanicos`
--
ALTER TABLE `mecanicos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de tabela `movimentacoes`
--
ALTER TABLE `movimentacoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=756;

--
-- AUTO_INCREMENT de tabela `pagamento`
--
ALTER TABLE `pagamento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de tabela `servicos`
--
ALTER TABLE `servicos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `maobra`
--
ALTER TABLE `maobra`
  ADD CONSTRAINT `fk_maobra_caixa` FOREIGN KEY (`caixa_id`) REFERENCES `caixa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_maobra_catdespesas1` FOREIGN KEY (`catdespesas_id`) REFERENCES `catdespesas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `pagamento`
--
ALTER TABLE `pagamento`
  ADD CONSTRAINT `fk_pagamento_caixa1` FOREIGN KEY (`caixa_id`) REFERENCES `caixa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `servicos`
--
ALTER TABLE `servicos`
  ADD CONSTRAINT `fk_servicos_extra1` FOREIGN KEY (`extra_id`) REFERENCES `extra` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_servicos_mecanicos1` FOREIGN KEY (`mecanicos_id`) REFERENCES `mecanicos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
