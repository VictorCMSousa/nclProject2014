-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 17-Maio-2014 às 16:54
-- Versão do servidor: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
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
(2, 'Julio Cesar', '1', 'titular', 'Brasil', './media/julio_cesar.jpg'),
(3, 'Jefferson', '12', 'reserva', 'Brasil', './media/grafite.jpg'),
(4, 'Daniel Alves', '2', 'titular', 'Brasil', './media/grafite.jpg'),
(5, 'Dante', '3', 'titular', 'Brasil', './media/josue.jpg'),
(6, 'David Luiz', '4', 'titular', 'Brasil', './media/josue.jpg'),
(7, 'Marcelo', '6', 'titular', 'Brasil', './media/josue.jpg'),
(8, 'Paulinho', '5', 'titular', 'Brasil', './media/kaka.jpg'),
(9, 'Hernanes', '7', 'titular', 'Brasil', './media/kaka.jpg'),
(10, 'Oscar', '8', 'titular', 'Brasil', './media/kaka.jpg'),
(11, 'Ramires', '9', 'titular', 'Brasil', './media/kaka.jpg'),
(12, 'Neymar', '10', 'titular', 'Brasil', './media/ramires.jpg'),
(13, 'Fred', '11', 'titular', 'Brasil', './media/ramires.jpg'),
(14, 'Hulk', '13', 'reserva', 'Brasil', './media/ramires.jpg'),
(15, 'Bernard', '14', 'reserva', 'Brasil', './media/ramires.jpg'),
(16, 'Willian', '15', 'reserva', 'Brasil', './media/juan.jpg'),
(17, 'Luiz Gustavo', '16', 'reserva', 'Brasil', './media/juan.jpg'),
(18, 'Maicon', '17', 'reserva', 'Brasil', './media/juan.jpg'),
(19, 'Maxwell', '18', 'reserva', 'Brasil', './media/juan.jpg'),
(20, 'Thiago Silva', '19', 'reserva', 'Brasil', './media/juan.jpg'),
(21, 'Henrique', '20', 'reserva', 'Brasil', './media/juan.jpg'),
(22, 'Romero', '1', 'titular', 'Argentina', './media/juan.jpg'),
(23, 'Zabaleta', '2', 'titular', 'Argentina', './media/juan.jpg'),
(24, 'Basanta', '3', 'titular', 'Argentina', './media/juan.jpg'),
(25, 'Fernandez', '4', 'titular', 'Argentina', './media/juan.jpg'),
(26, 'Rojo', '5', 'titular', 'Argentina', './media/lucio.jpg'),
(27, 'Mascherano', '6', 'titular', 'Argentina', './media/lucio.jpg'),
(28, 'Gago', '7', 'titular', 'Argentina', './media/lucio.jpg'),
(29, 'di Maria', '8', 'titular', 'Argentina', './media/lucio.jpg'),
(30, 'Messi', '10', 'titular', 'Argentina', './media/lucio.jpg'),
(31, 'Aguero', '9', 'titular', 'Argentina', './media/elano.jpg'),
(32, 'Higuain', '11', 'titular', 'Argentina', './media/elano.jpg'),
(33, 'Biglia', '12', 'titular', 'Argentina', './media/elano.jpg'),
(34, 'Palacio', '13', 'reserva', 'Argentina', './media/elano.jpg'),
(35, 'Lavezzi', '14', 'reserva', 'Argentina', './media/elano.jpg'),
(36, 'Rodriguez', '15', 'reserva', 'Argentina', './media/elano.jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `partida`
--

CREATE TABLE IF NOT EXISTS `partida` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_time1` int(11) NOT NULL,
  `id_time2` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `substituicao`
--

CREATE TABLE IF NOT EXISTS `substituicao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_jog_entra` int(11) NOT NULL,
  `id_jog_sai` int(11) NOT NULL,
  `id_partida` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Extraindo dados da tabela `substituicao`
--

INSERT INTO `substituicao` (`id`, `id_jog_entra`, `id_jog_sai`, `id_partida`) VALUES
(1, 1, 12, 1),
(2, 1, 2, 1),
(3, 1, 2, 1),
(4, 1, 2, 1),
(5, 1, 2, 1),
(6, 1, 2, 1),
(7, 1, 2, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `time`
--

CREATE TABLE IF NOT EXISTS `time` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `time`
--

INSERT INTO `time` (`id`, `nome`) VALUES
(1, 'Brasil'),
(2, 'Argentina');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
