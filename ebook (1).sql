-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 24, 2026 at 05:07 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ebook`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `bid` int(11) NOT NULL,
  `bname` varchar(50) NOT NULL,
  `author` varchar(50) NOT NULL,
  `type` enum('novel','comic','manga','artbook') NOT NULL,
  `pages` int(3) NOT NULL,
  `about` varchar(255) NOT NULL,
  `bcover` varchar(255) NOT NULL,
  `bfile` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`bid`, `bname`, `author`, `type`, `pages`, `about`, `bcover`, `bfile`, `price`) VALUES
(5, 'The Gahekna Protocol', 'MilyLilPaws', 'novel', 2, 'This is the story of Cole’s journey into a realm known as \"Gehegna\"—a place so harrowing that those who have ventured deep within and miraculously survived can describe it only as a \"hell on earth.\"\r\nIn this twisted world, consumed by madness, the lands a', '1792841384_GeheknaCover.png', '1792841384_The Gahekna Protocol.pdf', 10.00),
(6, 'Age  of  Golden  Empire', 'MilyLilPaws', 'novel', 2, 'With blood and tears.\r\nThey fought against an adversary that outmatched them in every way. Yet they would never surrender. Never would they yield their homeland to the Empire. \r\nIf the Empire wanted it, they would have to step over their dead bodies to ta', '1792852718_AgeofGoldenEmpire.png', '1792852718_Age  of  Golden  Empire.pdf', 10.00),
(7, 'Age of Golden Empire: Whispering Wing', 'MilyLilPaws', 'novel', 2, 'Across the continent, the Golden Empire had conquered more than half the known world. Its colossal tanks rolled through ruined cities, its bombers darkened the skies, and its golden banners flew over the ashes of nations that had once sworn never to surre', '1792852856_AgeofGoldenEmpire_WhisperingWing.png', '1792852856_Age of Golden Empire Whispering Wing.pdf', 10.00),
(8, 'Paladin', 'MilyLilPaws', 'novel', 4, '\"I shall be the shield of the helpless, the sword against cruelty, and the light that guides those lost in darkness.\r\nI shall not abandon those who cry for aid, nor turn away from those who stand beneath the shadow of death.\r\nI shall defend the innocent, ', '1792852918_Paladin.png', '1792852918_Paladin.pdf', 20.00),
(9, 'Rouge', 'MilyLilPaws', 'novel', 4, 'Humanity had inherited their legacy.\r\nAbove the clouds of industrial smoke stood magnificent cities of brass, iron, and glass, where wealthy families enjoyed warm homes, mechanical servants, and endless luxuries. Beneath them lay the slums, where exhauste', '1792853123_Rogue.png', '1792853123_Rouge.pdf', 20.00),
(10, 'Witch', 'MilyLilPaws', 'novel', 4, '\"Legends never die. They just wait for someone to turn the volume up.\"\r\nHumanity had entered an age where almost everything could be manufactured.\r\nEverything except magic.\r\nOr so everyone believed.\r\nOur story begins with a girl who had absolutely no inte', '1792853237_Witch.png', '1792853237_Witch.pdf', 20.00),
(11, 'Rainwalker', 'MilyLilPaws', 'novel', 4, '\"When the rain never ends, someone has to walk through it.\"\r\nOn the twenty-third day of September, the rain began to fall.\r\nAt first, nobody thought much of it. The weather stations had predicted a storm, and the people went about their lives beneath umbr', '1792853431_Rainwalker.png', '1792853431_Rainwalker.pdf', 20.00),
(12, 'The Menu You Didn’t Order', 'MilyLilPaws', 'novel', 4, '\"You don\'t have to know what you want to eat. Sometimes, you just need someone to listen.\"\r\nThere was a little restaurant tucked away on a quiet street, somewhere between a laundromat that never seemed to close and a convenience store that sold terrible c', '1792853543_ThemenuYoudidntorder.png', '1792853543_The Menu You Didnt Order.pdf', 20.00);

-- --------------------------------------------------------

--
-- Table structure for table `book_genres`
--

CREATE TABLE `book_genres` (
  `bid` int(11) NOT NULL,
  `gid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `book_genres`
--

INSERT INTO `book_genres` (`bid`, `gid`) VALUES
(5, 1),
(5, 2),
(5, 6),
(6, 1),
(6, 2),
(7, 1),
(7, 2),
(7, 4),
(8, 1),
(8, 3),
(9, 1),
(9, 2),
(9, 3),
(10, 1),
(10, 3),
(11, 1),
(11, 2),
(11, 6),
(12, 4);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `bid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `eorder`
--

CREATE TABLE `eorder` (
  `oid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `tprice` decimal(10,2) NOT NULL,
  `pstatus` enum('pending','paid','succeed','failed') NOT NULL,
  `ptime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `eorder`
--

INSERT INTO `eorder` (`oid`, `uid`, `tprice`, `pstatus`, `ptime`) VALUES
(2, 5, 20.00, 'paid', '2026-10-24 18:28:07'),
(3, 5, 20.00, 'paid', '2026-10-24 21:56:48'),
(4, 5, 20.00, 'paid', '2026-10-24 22:00:35');

-- --------------------------------------------------------

--
-- Table structure for table `euser`
--

CREATE TABLE `euser` (
  `uid` int(11) NOT NULL,
  `uname` varchar(50) NOT NULL,
  `upass` varchar(255) NOT NULL,
  `dob` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `euser`
--

INSERT INTO `euser` (`uid`, `uname`, `upass`, `dob`) VALUES
(5, 'Meya', '$2y$10$eG/ggatYdpGZ7LdtoTrLpuluKMDbAtXwqJaxCDanMNVzNU6DDqF6q', '2000-08-10');

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

CREATE TABLE `genres` (
  `gid` int(11) NOT NULL,
  `gname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `genres`
--

INSERT INTO `genres` (`gid`, `gname`) VALUES
(1, 'Action'),
(2, 'Sci-fi'),
(3, 'Fantasy'),
(4, 'Romance'),
(5, 'Thriller'),
(6, 'Horror');

-- --------------------------------------------------------

--
-- Table structure for table `library`
--

CREATE TABLE `library` (
  `uid` int(11) NOT NULL,
  `bid` int(11) NOT NULL,
  `oid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `oid` int(11) NOT NULL,
  `bid` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`oid`, `bid`, `price`) VALUES
(3, 7, 10.00),
(3, 6, 10.00),
(4, 11, 20.00);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`bid`);

--
-- Indexes for table `book_genres`
--
ALTER TABLE `book_genres`
  ADD KEY `gid` (`gid`),
  ADD KEY `bid` (`bid`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `uid` (`uid`,`bid`),
  ADD KEY `carttobid` (`bid`);

--
-- Indexes for table `eorder`
--
ALTER TABLE `eorder`
  ADD PRIMARY KEY (`oid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `euser`
--
ALTER TABLE `euser`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`gid`);

--
-- Indexes for table `library`
--
ALTER TABLE `library`
  ADD KEY `uid` (`uid`,`bid`,`oid`),
  ADD KEY `librarytobid` (`bid`),
  ADD KEY `librarytooid` (`oid`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD KEY `oid` (`oid`),
  ADD KEY `bid` (`bid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `bid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `eorder`
--
ALTER TABLE `eorder`
  MODIFY `oid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `euser`
--
ALTER TABLE `euser`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `genres`
--
ALTER TABLE `genres`
  MODIFY `gid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `book_genres`
--
ALTER TABLE `book_genres`
  ADD CONSTRAINT `b_g` FOREIGN KEY (`bid`) REFERENCES `books` (`bid`),
  ADD CONSTRAINT `gid` FOREIGN KEY (`gid`) REFERENCES `genres` (`gid`);

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `carttobid` FOREIGN KEY (`bid`) REFERENCES `books` (`bid`),
  ADD CONSTRAINT `carttouid` FOREIGN KEY (`uid`) REFERENCES `euser` (`uid`);

--
-- Constraints for table `eorder`
--
ALTER TABLE `eorder`
  ADD CONSTRAINT `uid` FOREIGN KEY (`uid`) REFERENCES `euser` (`uid`);

--
-- Constraints for table `library`
--
ALTER TABLE `library`
  ADD CONSTRAINT `librarytobid` FOREIGN KEY (`bid`) REFERENCES `books` (`bid`),
  ADD CONSTRAINT `librarytooid` FOREIGN KEY (`oid`) REFERENCES `eorder` (`oid`),
  ADD CONSTRAINT `librarytouid` FOREIGN KEY (`uid`) REFERENCES `euser` (`uid`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `orderforbook` FOREIGN KEY (`bid`) REFERENCES `books` (`bid`),
  ADD CONSTRAINT `orderfororder` FOREIGN KEY (`oid`) REFERENCES `eorder` (`oid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
