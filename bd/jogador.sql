-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 01-Jun-2014 às 01:39
-- Versão do servidor: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `redesmm`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `jogador`
--

CREATE TABLE IF NOT EXISTS `jogador` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` text NOT NULL,
  `camisa` text NOT NULL,
  `status` text NOT NULL,
  `time` varchar(50) NOT NULL,
  `foto_path` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=37 ;

--
-- Extraindo dados da tabela `jogador`
--

INSERT INTO `jogador` (`id`, `nome`, `camisa`, `status`, `time`, `foto_path`) VALUES
(1, 'Julio Cesar', '1', 'titular', 'Brasil', './media/julio_cesar.jpg'),
(3, 'Lucio', '3', 'titular', 'Brasil', './media/lucio.jpg'),
(4, 'Daniel Alves', '13', 'titular', 'Brasil', './media/daniel_alves.jpg'),
(5, 'Juan', '4', 'titular', 'Brasil', './media/juan.jpg'),
(6, 'Maicon', '2', 'titular', 'Brasil', './media/maicon.jpg'),
(7, 'Gilberto Silva', '8', 'titular', 'Brasil', './media/gilberto_silva.jpg'),
(8, 'Elano', '7', 'titular', 'Brasil', './media/elano.jpg'),
(9, 'Felipe Melo', '5', 'titular', 'Brasil', './media/felipe_melo.jpg'),
(10, 'Kaka', '10', 'titular', 'Brasil', './media/kaka.jpg'),
(11, 'Robinho', '11', 'titular', 'Brasil', './media/robinho.jpg'),
(12, 'Luis Fabiano', '9', 'titular', 'Brasil', './media/luis_fabiano.jpg'),
(13, 'Gomes', '12', 'reserva', 'Brasil', './media/gomes.jpg'),
(14, 'Thiago Silva', '15', 'reserva', 'Brasil', './media/thiago_silva.jpg'),
(15, 'Luisao', '14', 'reserva', 'Brasil', './media/luisao.jpg'),
(16, 'Gilberto', '16', 'reserva', 'Brasil', './media/gilberto.jpg'),
(17, 'Ramires', '18', 'reserva', 'Brasil', './media/ramires.jpg'),
(18, 'Kleberson', '20', 'reserva', 'Brasil', './media/kleberson.jpg'),
(19, 'Josue', '17', 'reserva', 'Brasil', './media/josue.jpg'),
(20, 'Grafite', '23', 'reserva', 'Brasil', './media/grafite.jpg'),
(21, 'Nilmar', '21', 'reserva', 'Brasil', './media/nilmar.jpg'),
(22, 'Doni', '22', 'reserva', 'Brasil', './media/doni.jpg'),
(23, 'Michel Bastos', '6', 'reserva', 'Brasil', './media/michel_bastos.jpg');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
