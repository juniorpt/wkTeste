-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           8.0.35 - MySQL Community Server - GPL
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para wktechnology
DROP DATABASE IF EXISTS `wktechnology`;
CREATE DATABASE IF NOT EXISTS `wktechnology` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `wktechnology`;

-- Copiando estrutura para tabela wktechnology.clientes
DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `COD_CLIENTE` int NOT NULL AUTO_INCREMENT,
  `NOME` varchar(255) NOT NULL,
  `CIDADE` varchar(100) DEFAULT NULL,
  `UF` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`COD_CLIENTE`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela wktechnology.clientes: ~0 rows (aproximadamente)
INSERT INTO `clientes` (`COD_CLIENTE`, `NOME`, `CIDADE`, `UF`) VALUES
	(1, 'Paulo Moreira da Costa Junior', 'Diadema', 'SP'),
	(2, 'Eliana Sousa de Lima', 'Diadema', 'SP'),
	(3, 'Edison Drye', 'Recife', 'PE'),
	(4, 'Mihoko Scholl', 'Recide', 'PE'),
	(5, 'Ajani Harding', 'Cajazeiras', 'PB'),
	(6, 'Ruthie Coco', 'Cajazeiras', 'PB'),
	(7, 'Orazio Hart', 'Recife', 'PE'),
	(8, 'Vinaya Justus', 'Recide', 'PE'),
	(9, 'Laila', 'Natal', 'RN'),
	(10, 'Cloe', 'Natal', 'RN'),
	(11, 'Isabel', 'Campina Grande', 'PB'),
	(12, 'Sabrina Michele', 'Patos', 'PB'),
	(13, 'Davi', 'Sousa', 'PB'),
	(14, 'Daniel', 'Natal', 'RN'),
	(15, 'Lorenzo', 'Rio de Janeiro', 'RJ'),
	(16, 'Bryan', 'São Paulo', 'SP'),
	(17, 'Pedro', 'Patos', 'PB'),
	(18, 'Augusto', 'Aparecida', 'PB'),
	(19, 'Calebe', 'São Paulo', 'SP');

-- Copiando estrutura para tabela wktechnology.pedidos_dados_gerais
DROP TABLE IF EXISTS `pedidos_dados_gerais`;
CREATE TABLE IF NOT EXISTS `pedidos_dados_gerais` (
  `COD_PEDIDO` int NOT NULL,
  `DATA_EMISSAO` date DEFAULT NULL,
  `COD_CLIENTE` int NOT NULL,
  `VALOR_TOTAL` decimal(19,2) DEFAULT '0.00',
  PRIMARY KEY (`COD_PEDIDO`),
  KEY `FK_CLIENTES_PEDIDOS_DADOS_GERAIS` (`COD_CLIENTE`),
  CONSTRAINT `FK_CLIENTES_PEDIDOS_DADOS_GERAIS` FOREIGN KEY (`COD_CLIENTE`) REFERENCES `clientes` (`COD_CLIENTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela wktechnology.pedidos_dados_gerais: ~0 rows (aproximadamente)
INSERT INTO `pedidos_dados_gerais` (`COD_PEDIDO`, `DATA_EMISSAO`, `COD_CLIENTE`, `VALOR_TOTAL`) VALUES
	(1, '2024-06-05', 1, 12.87),
	(2, '2024-06-05', 1, 8.58),
	(3, '2024-06-05', 1, 12.87),
	(4, '2024-06-05', 1, 1162.40),
	(5, '2024-06-05', 2, 1107.22),
	(6, '2024-06-05', 6, 2519.10),
	(7, '2024-06-05', 15, 5038.20),
	(8, '2024-06-05', 12, 5038.20),
	(9, '2024-06-05', 1, 5038.20),
	(10, '2024-06-05', 13, 1126.33),
	(11, '2024-06-05', 14, 1398.94),
	(12, '2024-06-05', 2, 21.45),
	(13, '2024-06-05', 2, 8.58),
	(14, '2024-06-05', 2, 8.58),
	(15, '2024-06-05', 2, 141.57),
	(16, '2024-06-05', 2, 150.15);

-- Copiando estrutura para tabela wktechnology.pedidos_produtos
DROP TABLE IF EXISTS `pedidos_produtos`;
CREATE TABLE IF NOT EXISTS `pedidos_produtos` (
  `COD_PEDIDOSPRODUTOS` int NOT NULL AUTO_INCREMENT,
  `COD_PEDIDO` int NOT NULL,
  `COD_PRODUTO` int NOT NULL,
  `QUANTIDADE` int NOT NULL,
  `VLR_UNITARIO` decimal(10,2) DEFAULT '0.00',
  `VLR_TOTAL` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`COD_PEDIDOSPRODUTOS`),
  KEY `COD_PEDIDO` (`COD_PEDIDO`),
  CONSTRAINT `FK_PEDIDOS_DADOSGERAIS_PRODUTOS` FOREIGN KEY (`COD_PEDIDO`) REFERENCES `pedidos_dados_gerais` (`COD_PEDIDO`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela wktechnology.pedidos_produtos: ~0 rows (aproximadamente)
INSERT INTO `pedidos_produtos` (`COD_PEDIDOSPRODUTOS`, `COD_PEDIDO`, `COD_PRODUTO`, `QUANTIDADE`, `VLR_UNITARIO`, `VLR_TOTAL`) VALUES
	(1, 1, 2, 3, 4.29, 12.87),
	(2, 2, 2, 2, 4.29, 8.58),
	(3, 3, 2, 3, 4.29, 12.87),
	(4, 4, 6, 5, 33.00, 165.00),
	(5, 5, 5, 5, 199.48, 997.40),
	(6, 5, 6, 2, 54.91, 109.82),
	(7, 6, 7, 1, 2519.10, 2519.10),
	(8, 7, 7, 2, 2519.10, 5038.20),
	(9, 8, 7, 2, 2519.10, 5038.20),
	(10, 9, 7, 2, 2519.10, 5038.20),
	(11, 10, 2, 5, 4.29, 21.45),
	(12, 10, 3, 2, 37.99, 75.98),
	(13, 10, 4, 1, 1028.90, 1028.90),
	(14, 11, 13, 2, 499.99, 999.98),
	(15, 11, 5, 2, 199.48, 398.96),
	(16, 12, 2, 5, 4.29, 21.45),
	(17, 13, 2, 3, 4.29, 12.87),
	(18, 14, 2, 9, 4.29, 38.61),
	(19, 15, 2, 8, 4.29, 34.32),
	(20, 16, 2, 23, 4.29, 98.67),
	(21, 16, 2, 12, 4.29, 51.48);

-- Copiando estrutura para tabela wktechnology.produtos
DROP TABLE IF EXISTS `produtos`;
CREATE TABLE IF NOT EXISTS `produtos` (
  `COD_PRODUTO` int NOT NULL AUTO_INCREMENT,
  `DESCRICAO` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `PRECOVENDA` decimal(19,2) DEFAULT NULL,
  `IMAGEM1` varchar(250) DEFAULT NULL,
  `IMAGEM2` varchar(250) DEFAULT NULL,
  `IMAGEM3` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`COD_PRODUTO`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela wktechnology.produtos: ~0 rows (aproximadamente)
INSERT INTO `produtos` (`COD_PRODUTO`, `DESCRICAO`, `PRECOVENDA`, `IMAGEM1`, `IMAGEM2`, `IMAGEM3`) VALUES
	(2, 'Pipoca para Microondas YOKI com Tempero Toque de Chef KITANO 100g', 4.29, 'C:\\Users\\sbeta\\Documents\\Desenvolvimento\\Visual\\Delphi\\WKTechnology\\imgs\\pipoca.jpg', 'C:\\Users\\sbeta\\Documents\\Desenvolvimento\\Visual\\Delphi\\WKTechnology\\imgs\\pipoca2.jpg', 'C:\\Users\\sbeta\\Documents\\Desenvolvimento\\Visual\\Delphi\\WKTechnology\\imgs\\pipoca3.jpg'),
	(3, 'Arroz Branco Tio João 5 Kg', 37.99, 'C:\\Users\\sbeta\\Documents\\Desenvolvimento\\Visual\\Delphi\\WKTechnology\\imgs\\arrozTioJoao5kg.jpg', '', ''),
	(4, 'Epson EcoTank L3250 - Multifuncional, Tanque de Tinta Colorida, Wi-Fi Direct, USB, Bivolt, Preto', 1028.90, 'C:\\Users\\sbeta\\Documents\\Desenvolvimento\\Visual\\Delphi\\WKTechnology\\imgs\\51T-6cdhyaL.__AC_SX300_SY300_QL70_ML2_.jpg', '', ''),
	(5, 'Kit de Garrafas de Tinta Original Epson EcoTank T544 - Magenta, Amarelo, Ciano, Preto', 199.48, 'C:\\Users\\sbeta\\Documents\\Desenvolvimento\\Visual\\Delphi\\WKTechnology\\imgs\\71J6JbK1DWL._AC_SY450_.jpg', '', ''),
	(6, 'Mouse sem fio Logitech M170 com Design Ambidestro Compacto, Conexão USB e Pilha Inclusa - Preto', 54.91, 'C:\\Users\\sbeta\\Documents\\Desenvolvimento\\Visual\\Delphi\\WKTechnology\\imgs\\61L7qTIMduL.__AC_SX300_SY300_QL70_ML2_.jpg', '', ''),
	(7, 'Notebook Dell Inspiron I15-I120K-A10P 15.6" Full HD 12ª Geração Intel Core i3 8GB 256GB SSD Windows 11 Preto', 2519.10, 'C:\\Users\\sbeta\\Documents\\Desenvolvimento\\Visual\\Delphi\\WKTechnology\\imgs\\71epkJC5SxL._AC_SX569_.jpg', 'C:\\Users\\sbeta\\Documents\\Desenvolvimento\\Visual\\Delphi\\WKTechnology\\imgs\\61Fc-PNlrGL._AC_SX569_.jpg', 'C:\\Users\\sbeta\\Documents\\Desenvolvimento\\Visual\\Delphi\\WKTechnology\\imgs\\61Fc-PNlrGL._AC_SX569_.jpg'),
	(8, 'Monitor LG Widescreen 24MP400-23.8\', Preto', 679.00, 'C:\\Users\\sbeta\\Documents\\Desenvolvimento\\Visual\\Delphi\\WKTechnology\\imgs\\611obp3dECL._AC_SY450_.jpg', '', ''),
	(9, 'TP-Link Deco M4 - Kit Roteador Wi-Fi Mesh Gigabit, 5GHz', 534.90, 'C:\\Users\\sbeta\\Documents\\Desenvolvimento\\Visual\\Delphi\\WKTechnology\\imgs\\51eesnC76aL.__AC_SX300_SY300_QL70_ML2_.jpg', 'C:\\Users\\sbeta\\Documents\\Desenvolvimento\\Visual\\Delphi\\WKTechnology\\imgs\\514RUpfUFxL._AC_SY450_.jpg', 'C:\\Users\\sbeta\\Documents\\Desenvolvimento\\Visual\\Delphi\\WKTechnology\\imgs\\514RUpfUFxL._AC_SY450_.jpg'),
	(10, 'Switch Gigabit De Mesa Com 5 Portas 10/100/1000 Ls1005G Smb', 112.99, 'C:\\Users\\sbeta\\Documents\\Desenvolvimento\\Visual\\Delphi\\WKTechnology\\imgs\\51ODPN-LjcL._AC_SX569_.jpg', 'C:\\Users\\sbeta\\Documents\\Desenvolvimento\\Visual\\Delphi\\WKTechnology\\imgs\\61VJGsIA-bL._AC_SX569_.jpg', 'C:\\Users\\sbeta\\Documents\\Desenvolvimento\\Visual\\Delphi\\WKTechnology\\imgs\\61VJGsIA-bL._AC_SX569_.jpg'),
	(11, 'Roteador TP Link Mesh Gigabit Wi-Fi 5GHz Archer C6', 229.90, 'C:\\Users\\sbeta\\Documents\\Desenvolvimento\\Visual\\Delphi\\WKTechnology\\imgs\\51-A2g8Mo8L.__AC_SX300_SY300_QL70_ML2_.jpg', 'C:\\Users\\sbeta\\Documents\\Desenvolvimento\\Visual\\Delphi\\WKTechnology\\imgs\\51zAaEk2bLL._AC_SY450_.jpg', 'C:\\Users\\sbeta\\Documents\\Desenvolvimento\\Visual\\Delphi\\WKTechnology\\imgs\\51zAaEk2bLL._AC_SY450_.jpg'),
	(12, 'Clamper Energia 5 Tomadas', 56.00, 'C:\\Users\\sbeta\\Documents\\Desenvolvimento\\Visual\\Delphi\\WKTechnology\\imgs\\51so1BCVEhL._AC_SX679_.jpg', 'C:\\Users\\sbeta\\Documents\\Desenvolvimento\\Visual\\Delphi\\WKTechnology\\imgs\\51C9M7zl-5L._AC_SX679_.jpg', 'C:\\Users\\sbeta\\Documents\\Desenvolvimento\\Visual\\Delphi\\WKTechnology\\imgs\\51C9M7zl-5L._AC_SX679_.jpg'),
	(13, 'GPU RX 550 4GB GDDR5 128 Bits Dual-Fan Projeto Edge PVEX5504GBDF – Pcyes', 499.99, 'C:\\Users\\sbeta\\Documents\\Desenvolvimento\\Visual\\Delphi\\WKTechnology\\imgs\\61pACiOK2IL._AC_.jpg', 'C:\\Users\\sbeta\\Documents\\Desenvolvimento\\Visual\\Delphi\\WKTechnology\\imgs\\51Cr5QRZEfL._AC_.jpg', 'C:\\Users\\sbeta\\Documents\\Desenvolvimento\\Visual\\Delphi\\WKTechnology\\imgs\\51Cr5QRZEfL._AC_.jpg'),
	(14, 'Case para HD transparente, Usb 3.0, transmissão 6gbps, Sata 2.5", Hhd ou Ssd, Ecase-300', 14.40, 'C:\\Users\\sbeta\\Documents\\Desenvolvimento\\Visual\\Delphi\\WKTechnology\\imgs\\51XdvpEJ85L._AC_SX450_.jpg', 'C:\\Users\\sbeta\\Documents\\Desenvolvimento\\Visual\\Delphi\\WKTechnology\\imgs\\51l-a5bqpTL._AC_SY450_.jpg', 'C:\\Users\\sbeta\\Documents\\Desenvolvimento\\Visual\\Delphi\\WKTechnology\\imgs\\51l-a5bqpTL._AC_SY450_.jpg'),
	(15, 'Hd Ssd Kingston 240gb Sata 3 A400 2,5 Notebook', 158.89, 'C:\\Users\\sbeta\\Documents\\Desenvolvimento\\Visual\\Delphi\\WKTechnology\\imgs\\ssd1.jpg', 'C:\\Users\\sbeta\\Documents\\Desenvolvimento\\Visual\\Delphi\\WKTechnology\\imgs\\ssd2.jpg', 'C:\\Users\\sbeta\\Documents\\Desenvolvimento\\Visual\\Delphi\\WKTechnology\\imgs\\ssd2.jpg'),
	(16, 'Kit 3 Cooler Ventoinha Fan Rgb 120mm 12cm Bpc-Kdl-Argb Controle Remoto e Hub', 88.89, 'C:\\Users\\sbeta\\Documents\\Desenvolvimento\\Visual\\Delphi\\WKTechnology\\imgs\\cooler1.jpg', 'C:\\Users\\sbeta\\Documents\\Desenvolvimento\\Visual\\Delphi\\WKTechnology\\imgs\\cooler2.jpg', 'C:\\Users\\sbeta\\Documents\\Desenvolvimento\\Visual\\Delphi\\WKTechnology\\imgs\\cooler2.jpg'),
	(17, 'SSD Kingston NV2 1TB NVMe M.2 2280 (Leitura até 3500MB/s e Gravação até 2100MB/s)', 440.00, 'C:\\Users\\sbeta\\Documents\\Desenvolvimento\\Visual\\Delphi\\WKTechnology\\imgs\\71NfMZKkpQL._AC_SY450_.jpg', '', ''),
	(18, 'Processador AMD Ryzen 5 5600G, 3.9GHz (4.4GHz Max Turbo), AM4, Vídeo Integrado, 6 Núcleos', 842.10, 'C:\\Users\\sbeta\\Documents\\Desenvolvimento\\Visual\\Delphi\\WKTechnology\\imgs\\amdRyzen1.jpg', 'C:\\Users\\sbeta\\Documents\\Desenvolvimento\\Visual\\Delphi\\WKTechnology\\imgs\\amdRyzen2.jpg', 'C:\\Users\\sbeta\\Documents\\Desenvolvimento\\Visual\\Delphi\\WKTechnology\\imgs\\amdRyzen2.jpg'),
	(19, 'Placa Mãe Gigabyte B550M AORUS Elite, Chipset B550, AMD AM4, mATX, DDR4', 759.00, 'C:\\Users\\sbeta\\Documents\\Desenvolvimento\\Visual\\Delphi\\WKTechnology\\imgs\\81QyMksmunL._AC_SX450_.jpg', 'C:\\Users\\sbeta\\Documents\\Desenvolvimento\\Visual\\Delphi\\WKTechnology\\imgs\\91hqongH+aL._AC_SX450_.jpg', 'C:\\Users\\sbeta\\Documents\\Desenvolvimento\\Visual\\Delphi\\WKTechnology\\imgs\\91hqongH+aL._AC_SX450_.jpg'),
	(20, 'Headset Gamer Sem Fio Logitech G733 7.1 Dolby Surround com Tecnologia Blue VO!CE, RGB LIGHTSYNC, Drivers de Áudio Avançados e Bateria Recarregável para PC e PlayStation - Azul', 899.00, 'C:\\Users\\sbeta\\Documents\\Desenvolvimento\\Visual\\Delphi\\WKTechnology\\imgs\\71zbEsVnAiL._AC_SX679_.jpg', '', ''),
	(21, 'Webcam Full HD Logitech C920s com Microfone Embutido e Proteção de Privacidade para Chamadas e Gravações em Video Widescreen 1080p - Compatível com Logitech Capture', 379.99, 'C:\\Users\\sbeta\\Documents\\Desenvolvimento\\Visual\\Delphi\\WKTechnology\\imgs\\Webcam1.jpg', 'C:\\Users\\sbeta\\Documents\\Desenvolvimento\\Visual\\Delphi\\WKTechnology\\imgs\\Webcam2.jpg', 'C:\\Users\\sbeta\\Documents\\Desenvolvimento\\Visual\\Delphi\\WKTechnology\\imgs\\Webcam2.jpg'),
	(22, 'Galaxy Tab A9+, Wifi, 11\' polegadas, 4GB RAM, 64 GB, Câmera Principal 8 MP, Câmera Traseira 5 MP', 999.90, 'C:\\Users\\sbeta\\Documents\\Desenvolvimento\\Visual\\Delphi\\WKTechnology\\imgs\\Galaxy Tab1.jpg', '', '');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
