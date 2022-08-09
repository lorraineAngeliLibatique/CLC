-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 15, 2020 at 02:38 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `clc_info_system_new`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteAuthor` (IN `AuthorID` INT(10))  BEGIN
  UPDATE tbl_author a SET a.isDeleted_A = 1
 WHERE a.authorID = AuthorID ;
     
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteBook` (IN `bookISBN` VARCHAR(15))  BEGIN
  UPDATE tbl_book b SET b.isDeleted_B = 1, b.availability = 0
 WHERE b.isbn = bookISBN;
     
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertAuthor` (IN `firstName` VARCHAR(30), IN `middleInitial` VARCHAR(5), IN `surName` VARCHAR(30))  BEGIN
  INSERT INTO tbl_author(firstname,middleinitial,surname)
  VALUES (firstName,middleInitial,surName);
     
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertBook` (IN `Isbn` VARCHAR(15), IN `BookTitle` VARCHAR(30), IN `Price` DECIMAL(14,2), IN `SalePercentage` INT(10), IN `Availability` SMALLINT(1), IN `CategoryID` INT(10), IN `DatePublished` DATE, IN `adminUsername` VARCHAR(30), IN `isBorrowed_B` SMALLINT(1))  BEGIN
  INSERT INTO tbl_book(isbn,bookTitle,price,salePercentage,availability,categoryID,datePublished,adminUsername,isBorrowed_B)
  VALUES (Isbn,BookTitle,Price,SalePercentage,Availability,CategoryID,DatePublished,adminUsername,isBorrowed_B);
     
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertBookAuthor` (IN `baAuthorID` INT, IN `baBookIsbn` VARCHAR(15))  BEGIN
 INSERT INTO tbl_book_author (`bookIsbn`, `AuthorID`) VALUES (baBookIsbn,baAuthorID);
     
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updateAuthor` (IN `AuthorID` INT(10), IN `firstName` VARCHAR(30), IN `middleInitial` VARCHAR(5), IN `surName` VARCHAR(30))  BEGIN
 UPDATE tbl_author a SET a.firstname = firstName, a.middleinitial = middleInitial, a.surname = surName
 WHERE a.authorID  = AuthorID;
     
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updateBook` (IN `bookIsbn` VARCHAR(15), IN `BookTitle` VARCHAR(30), IN `Price` DECIMAL, IN `SalePercentage` INT, IN `Availability` SMALLINT, IN `CategoryID` INT, IN `bookDatePublished` DATE)  BEGIN
  UPDATE tbl_book b SET b.bookTitle = BookTitle,
 b.price = Price, b.salePercentage = SalePercentage, b.availability= Availability, b.categoryID = CategoryID,
 b.datePublished = bookDatePublished
 WHERE b.isbn = bookIsbn;
     
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `username` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`username`, `password`, `email`) VALUES
('ClcAdmin', 'CA3ED9324D241B6B0AA16A129B9B9882', 'clcsystem02@gmail.com'),
('Kent', '202CB962AC59075B964B07152D234B70', 'computermypc0228@gmail.com'),
('LA', 'B035233E28E56BC9D5095CE4CCCD2D23', 'lorraineangelilibatique@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_author`
--

CREATE TABLE `tbl_author` (
  `authorID` int(10) NOT NULL,
  `surname` varchar(30) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `middleinitial` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_author`
--

INSERT INTO `tbl_author` (`authorID`, `surname`, `firstname`, `middleinitial`) VALUES
(11, 'Stanley', 'Andy', ''),
(12, 'Lucado', 'Max', ''),
(13, 'Tozer', 'A.W.', ''),
(14, 'Merritt', 'James ', ''),
(15, 'Baxter', 'Richard', ''),
(16, 'Cowman', 'L.B.', ''),
(17, 'Beers', 'Gilbert', 'V.'),
(18, 'Avery', 'Ben', ''),
(19, 'Saltares', 'Javier', ''),
(20, 'Rydelnik ', 'Michael ', ''),
(21, 'Vanlaningham', 'Michael ', ''),
(22, 'Radmacher', 'Earl ', 'D.'),
(23, 'Edwards', 'James ', 'R.'),
(24, 'Myers', 'Jeff ', ''),
(25, 'Fresco', 'J.V.', ''),
(26, 'Zacharias', 'Ravi ', ''),
(27, 'Jantz,Phd', 'Gregory ', 'L.'),
(28, 'Mcmurray', 'Ann ', ''),
(29, 'Nee', 'Watchman ', ''),
(30, 'Washington Carr', 'Dr. Josie', ''),
(31, 'Chambers', 'Oswald ', ''),
(32, 'Anderson', 'Neil ', 'T.'),
(33, 'Stoval', 'Jim ', ''),
(34, 'Wallis', 'Arthur ', ''),
(35, 'Bartel', 'Blaine ', ''),
(36, 'Jones', 'Donna ', ''),
(37, 'Jeremiah', 'Dr. David', ''),
(38, 'Partner', 'Daniel ', ''),
(39, 'Ayris', 'Art ', 'A.'),
(40, 'Lucado', 'Max ', ''),
(41, 'Lucado', 'Denalyn ', ''),
(42, 'Flint', 'Christopher ', ''),
(43, 'Lau', 'Ava ', ''),
(44, 'Deik', 'Sarah ', 'A.'),
(45, 'Baoku', 'Hafeez', ''),
(46, 'McDowell', 'Josh', ''),
(47, 'McDowell', 'Sean', ''),
(48, 'Phillips', 'John', ''),
(49, 'Rowell', 'Edward', 'K.'),
(50, 'Wright', 'Norman', 'H.'),
(51, 'Author', 'No', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_book`
--

CREATE TABLE `tbl_book` (
  `isbn` varchar(15) NOT NULL,
  `bookTitle` varchar(50) NOT NULL,
  `datePublished` date DEFAULT NULL,
  `price` decimal(14,2) NOT NULL,
  `availability` smallint(1) DEFAULT 1,
  `categoryID` int(10) NOT NULL,
  `adminUsername` varchar(30) NOT NULL,
  `salePercentage` int(10) DEFAULT NULL,
  `isBorrowed_B` smallint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_book`
--

INSERT INTO `tbl_book` (`isbn`, `bookTitle`, `datePublished`, `price`, `availability`, `categoryID`, `adminUsername`, `salePercentage`, `isBorrowed_B`) VALUES
('9717890137', '365 Read-aloud Bedtime Bible Stories', '2000-06-09', '375.00', 1, 12, 'LA', 2, 1),
('9780718016319', 'Lucado Treasury Of Bedtime Prayers', '2005-04-16', '975.00', 0, 12, 'LA', 4, 0),
('9780718074210', 'Anxious for Nothing', '2015-11-04', '975.00', 1, 10, 'LA', 1, 0),
('9780736961011', '52 Weeks with Jesus', '2018-07-14', '475.00', 1, 11, 'LA', 5, 1),
('9780736975896', 'The Bondage Breaker Devotional', '2020-11-04', '775.00', 1, 11, 'LA', 1, 0),
('9780764216244', 'The Pursuit of God', '2018-11-11', '675.00', 1, 10, 'LA', 4, 0),
('9780781405799', 'The Toddler\'s Bible', '2013-07-12', '875.00', 1, 12, 'LA', 1, 1),
('9780781413602', 'Understanding the Faith', '2012-01-09', '1975.00', 1, 14, 'LA', 1, 0),
('9780785214380', 'Nelson\'s New Illustrated Bible Commentary', '2014-05-25', '1875.00', 1, 13, 'LA', 1, 0),
('9780801046155', 'Romans(Understanding the Bible Commentary Series)', '2012-03-16', '1775.00', 1, 13, 'LA', 1, 1),
('9780801098901', 'Reforming Apologetics', '2014-07-11', '1975.00', 1, 14, 'LA', 3, 1),
('9780802428677', 'The Moody Bible Commentary', '2014-07-12', '2775.00', 1, 13, 'LA', 2, 1),
('9780849908224', 'I, Isaac, Take Thee, Rebekah', '2016-12-12', '775.00', 1, 10, 'LA', 1, 1),
('9780849947162', 'The Grace of God', '2015-11-04', '775.00', 1, 10, 'LA', 2, 1),
('9781414387672', 'NLT Girls SlimelineBible', '2017-07-03', '1475.00', 1, 15, 'LA', 1, 1),
('9781434702937', 'Preschooler\'s Bible', '2013-07-12', '875.00', 0, 12, 'LA', 1, 1),
('978971781316', 'Daily Grace for Teens', '2019-08-13', '325.00', 1, 11, 'LA', 1, 1),
('9789717891774', 'Taming Your Family Zoo', '2000-06-06', '195.00', 0, 18, 'LA', 3, 1),
('9789717891880', 'The Ultimate Gift', '2020-08-19', '250.00', 1, 17, 'LA', 1, 0),
('9789717891958', 'The Big Black Book For Parents', '2011-08-19', '275.00', 1, 18, 'LA', 1, 0),
('9789717892245', '100 New Testament Sermon Outlines', '2007-07-21', '175.00', 0, 19, 'LA', 2, 1),
('9789717892498', 'In The Day Of Thy Power', '2020-06-10', '350.00', 1, 17, 'LA', 5, 1),
('9789717892511', 'Hopeful Parenting', '2000-06-09', '350.00', 1, 18, 'LA', 2, 1),
('9789717892559', 'My Utmost For His Highest', '2017-05-11', '275.00', 1, 11, 'LA', 1, 1),
('9789717892658', 'Changed Into His Likeness', '2017-02-03', '350.00', 1, 16, 'LA', 1, 1),
('9789717892832', '101 Questions', '2005-04-20', '295.00', 1, 12, 'LA', 2, 1),
('9789717892849', 'The Book of God', '2013-07-19', '295.00', 1, 12, 'LA', 2, 0),
('9789717892900', 'Controlling Your Anger Before It Controls You', '2016-12-09', '350.00', 1, 16, 'LA', 1, 1),
('9789717892917', 'A Better Way To Think', '2007-07-24', '375.00', 1, 19, 'LA', 2, 1),
('9789717893013', 'Sex, God, And The Single Life', '2007-07-14', '295.00', 0, 12, 'LA', 1, 0),
('9789717893075', '1001 Quotes, Illustrations, And Humorous Stories F', '2007-07-23', '495.00', 0, 19, 'LA', 3, 1),
('9789717893303', 'Streams in the Dessert', '2020-08-09', '450.00', 1, 11, 'LA', 1, 0),
('9789717893556', 'Why True Love Waits', '2007-07-20', '775.00', 1, 12, 'LA', 2, 1),
('978971789440', 'The Bible & The Meaning Of Life', '2005-04-11', '375.00', 1, 12, 'LA', 2, 1),
('9789717897965', 'Igod', '2017-04-19', '100.00', 0, 11, 'LA', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_book_author`
--

CREATE TABLE `tbl_book_author` (
  `bookIsbn` varchar(15) NOT NULL,
  `AuthorID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_book_author`
--

INSERT INTO `tbl_book_author` (`bookIsbn`, `AuthorID`) VALUES
('9780849947162', 11),
('9780718074210', 12),
('9780764216244', 13),
('9780736961011', 14),
('978971781316', 15),
('9789717893303', 16),
('9781434702937', 17),
('9780781405799', 17),
('9789717892849', 18),
('9789717892849', 19),
('9780802428677', 20),
('9780802428677', 21),
('9780785214380', 22),
('9780801046155', 23),
('9780849908224', 26),
('9789717892900', 27),
('9789717892900', 28),
('9789717892658', 29),
('9789717897965', 30),
('9789717892559', 31),
('9780736975896', 32),
('9789717891880', 33),
('9789717892498', 34),
('9789717891958', 35),
('9789717891774', 36),
('9789717892511', 37),
('9717890137', 38),
('9789717892832', 39),
('9780718016319', 40),
('9780718016319', 41),
('978971789440', 42),
('978971789440', 43),
('978971789440', 44),
('9789717893013', 45),
('9789717893556', 46),
('9789717893556', 47),
('9789717892245', 48),
('9789717893075', 49),
('9789717892917', 50),
('9780801098901', 25),
('9781414387672', 51);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `categoryID` int(10) NOT NULL,
  `category` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`categoryID`, `category`) VALUES
(7, ''),
(14, 'APOLOGETICS'),
(12, 'CHILDREN/YOUTH'),
(10, 'CHRISTIAN LIVING'),
(13, 'COMMENTARY'),
(11, 'DEVOTIONAL'),
(17, 'INSPIRATIONAL'),
(15, 'NEW LIVING TRANSLATI'),
(18, 'PARENTING'),
(19, 'REFERENCES'),
(16, 'SELF-HELP');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_log`
--

CREATE TABLE `tbl_log` (
  `LID` int(10) NOT NULL,
  `SearchedBooks` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_log`
--

INSERT INTO `tbl_log` (`LID`, `SearchedBooks`) VALUES
(4, '1000'),
(5, '1000'),
(6, '1000'),
(7, '1000'),
(8, '1001'),
(9, 'W'),
(10, 'Reforming'),
(11, 'NLT'),
(12, 'NLT'),
(13, 'References'),
(14, 'Reference'),
(15, 'Apolo'),
(16, 'Reforming'),
(17, 'God'),
(18, 'NLT');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sale_percentage`
--

CREATE TABLE `tbl_sale_percentage` (
  `saleID` int(10) NOT NULL,
  `salePercentage` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_sale_percentage`
--

INSERT INTO `tbl_sale_percentage` (`saleID`, `salePercentage`) VALUES
(1, 0),
(2, 10),
(3, 20),
(4, 50),
(5, 70),
(6, 90);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_adminauthor`
-- (See below for the actual view)
--
CREATE TABLE `vw_adminauthor` (
`authorID` int(10)
,`Author Name` varchar(67)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_adminbook`
-- (See below for the actual view)
--
CREATE TABLE `vw_adminbook` (
`isbn` varchar(15)
,`bookTitle` varchar(50)
,`datePublished` date
,`category` varchar(20)
,`price` decimal(14,2)
,`salePercentage` int(5)
,`New Price` decimal(26,2)
,`Book Status` varchar(13)
,`Borrowed Book` varchar(18)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_adminbookauthor`
-- (See below for the actual view)
--
CREATE TABLE `vw_adminbookauthor` (
`bookIsbn` varchar(15)
,`bookTitle` varchar(50)
,`authorID` int(10)
,`Author Name` varchar(61)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_adminmostsearchedlog`
-- (See below for the actual view)
--
CREATE TABLE `vw_adminmostsearchedlog` (
`LID` int(10)
,`SearchedBooks` varchar(50)
,`Frequency` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_customerlistview`
-- (See below for the actual view)
--
CREATE TABLE `vw_customerlistview` (
`bookTitle` varchar(50)
,`Author Name` varchar(61)
,`datePublished` date
,`price` decimal(14,2)
,`category` varchar(20)
,`salePercentage` int(5)
,`New Price` decimal(26,2)
,`Book Status` varchar(13)
,`Borrowed Book` varchar(18)
,`isbn` varchar(15)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_sortbyavailablebooks`
-- (See below for the actual view)
--
CREATE TABLE `vw_sortbyavailablebooks` (
`bookTitle` varchar(50)
,`Author Name` varchar(67)
,`datePublished` date
,`price` decimal(14,2)
,`category` varchar(20)
,`salePercentage` int(5)
,`New Price` decimal(26,2)
,`Book Status` varchar(13)
,`Borrowed Book` varchar(18)
,`isbn` varchar(15)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_sortbybooksforsale`
-- (See below for the actual view)
--
CREATE TABLE `vw_sortbybooksforsale` (
`bookTitle` varchar(50)
,`Author Name` varchar(67)
,`datePublished` date
,`price` decimal(14,2)
,`category` varchar(20)
,`salePercentage` int(5)
,`New Price` decimal(26,2)
,`Book Status` varchar(13)
,`Borrowed Book` varchar(18)
,`isbn` varchar(15)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_sortbyborrowedbooks`
-- (See below for the actual view)
--
CREATE TABLE `vw_sortbyborrowedbooks` (
`bookTitle` varchar(50)
,`Author Name` varchar(67)
,`datePublished` date
,`price` decimal(14,2)
,`category` varchar(20)
,`salePercentage` int(5)
,`New Price` decimal(26,2)
,`Book Status` varchar(13)
,`Borrowed Book` varchar(18)
,`isbn` varchar(15)
);

-- --------------------------------------------------------

--
-- Structure for view `vw_adminauthor`
--
DROP TABLE IF EXISTS `vw_adminauthor`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_adminauthor`  AS  select `a`.`authorID` AS `authorID`,concat(`a`.`firstname`,' ',`a`.`middleinitial`,' ',`a`.`surname`) AS `Author Name` from `tbl_author` `a` ;

-- --------------------------------------------------------

--
-- Structure for view `vw_adminbook`
--
DROP TABLE IF EXISTS `vw_adminbook`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_adminbook`  AS  select `b`.`isbn` AS `isbn`,`b`.`bookTitle` AS `bookTitle`,`b`.`datePublished` AS `datePublished`,`c`.`category` AS `category`,`b`.`price` AS `price`,`s`.`salePercentage` AS `salePercentage`,round(`b`.`price` - `s`.`salePercentage` / 100 * `b`.`price`,2) AS `New Price`,case when `b`.`availability` like 1 then 'Available' else 'Not Available' end AS `Book Status`,case when `b`.`isBorrowed_B` like 1 then 'Can be Borrowed' else 'Cannot be Borrowed' end AS `Borrowed Book` from ((`tbl_book` `b` join `tbl_category` `c` on(`b`.`categoryID` = `c`.`categoryID`)) join `tbl_sale_percentage` `s` on(`b`.`salePercentage` = `s`.`saleID`)) ;

-- --------------------------------------------------------

--
-- Structure for view `vw_adminbookauthor`
--
DROP TABLE IF EXISTS `vw_adminbookauthor`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_adminbookauthor`  AS  select `ba`.`bookIsbn` AS `bookIsbn`,`b`.`bookTitle` AS `bookTitle`,`a`.`authorID` AS `authorID`,concat(`a`.`firstname`,' ',`a`.`surname`) AS `Author Name` from ((`tbl_book_author` `ba` join `tbl_book` `b` on(`ba`.`bookIsbn` = `b`.`isbn`)) join `tbl_author` `a` on(`ba`.`AuthorID` = `a`.`authorID`)) ;

-- --------------------------------------------------------

--
-- Structure for view `vw_adminmostsearchedlog`
--
DROP TABLE IF EXISTS `vw_adminmostsearchedlog`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_adminmostsearchedlog`  AS  select `l`.`LID` AS `LID`,`l`.`SearchedBooks` AS `SearchedBooks`,count(`l`.`SearchedBooks`) AS `Frequency` from `tbl_log` `l` group by `l`.`SearchedBooks` ;

-- --------------------------------------------------------

--
-- Structure for view `vw_customerlistview`
--
DROP TABLE IF EXISTS `vw_customerlistview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_customerlistview`  AS  select `b`.`bookTitle` AS `bookTitle`,concat(`a`.`firstname`,' ',`a`.`surname`) AS `Author Name`,`b`.`datePublished` AS `datePublished`,`b`.`price` AS `price`,`c`.`category` AS `category`,`s`.`salePercentage` AS `salePercentage`,round(`b`.`price` - `s`.`salePercentage` / 100 * `b`.`price`,2) AS `New Price`,case when `b`.`availability` like 1 then 'Available' else 'Not Available' end AS `Book Status`,case when `b`.`isBorrowed_B` like 1 then 'Can be Borrowed' else 'Cannot be Borrowed' end AS `Borrowed Book`,`b`.`isbn` AS `isbn` from ((((`tbl_book_author` `ba` join `tbl_book` `b` on(`ba`.`bookIsbn` = `b`.`isbn`)) join `tbl_author` `a` on(`ba`.`AuthorID` = `a`.`authorID`)) join `tbl_category` `c` on(`b`.`categoryID` = `c`.`categoryID`)) join `tbl_sale_percentage` `s` on(`b`.`salePercentage` = `s`.`saleID`)) ;

-- --------------------------------------------------------

--
-- Structure for view `vw_sortbyavailablebooks`
--
DROP TABLE IF EXISTS `vw_sortbyavailablebooks`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_sortbyavailablebooks`  AS  select `b`.`bookTitle` AS `bookTitle`,concat(`a`.`firstname`,' ',`a`.`middleinitial`,' ',`a`.`surname`) AS `Author Name`,`b`.`datePublished` AS `datePublished`,`b`.`price` AS `price`,`c`.`category` AS `category`,`sp`.`salePercentage` AS `salePercentage`,round(`b`.`price` - `sp`.`salePercentage` / 100 * `b`.`price`,2) AS `New Price`,case when `b`.`availability` like 1 then 'Available' else 'Not Available' end AS `Book Status`,case when `b`.`isBorrowed_B` like 1 then 'Can be Borrowed' else 'Cannot be Borrowed' end AS `Borrowed Book`,`b`.`isbn` AS `isbn` from ((((`tbl_book_author` `ba` join `tbl_author` `a` on(`ba`.`AuthorID` = `a`.`authorID`)) join `tbl_book` `b` on(`b`.`isbn` = `ba`.`bookIsbn`)) join `tbl_category` `c` on(`b`.`categoryID` = `c`.`categoryID`)) join `tbl_sale_percentage` `sp` on(`b`.`salePercentage` = `sp`.`saleID`)) where `b`.`availability` = 1 ;

-- --------------------------------------------------------

--
-- Structure for view `vw_sortbybooksforsale`
--
DROP TABLE IF EXISTS `vw_sortbybooksforsale`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_sortbybooksforsale`  AS  select `b`.`bookTitle` AS `bookTitle`,concat(`a`.`firstname`,' ',`a`.`middleinitial`,' ',`a`.`surname`) AS `Author Name`,`b`.`datePublished` AS `datePublished`,`b`.`price` AS `price`,`c`.`category` AS `category`,`sp`.`salePercentage` AS `salePercentage`,round(`b`.`price` - `sp`.`salePercentage` / 100 * `b`.`price`,2) AS `New Price`,case when `b`.`availability` like 1 then 'Available' else 'Not Available' end AS `Book Status`,case when `b`.`isBorrowed_B` like 1 then 'Can be Borrowed' else 'Cannot be Borrowed' end AS `Borrowed Book`,`b`.`isbn` AS `isbn` from ((((`tbl_book_author` `ba` join `tbl_author` `a` on(`ba`.`AuthorID` = `a`.`authorID`)) join `tbl_book` `b` on(`b`.`isbn` = `ba`.`bookIsbn`)) join `tbl_category` `c` on(`b`.`categoryID` = `c`.`categoryID`)) join `tbl_sale_percentage` `sp` on(`b`.`salePercentage` = `sp`.`saleID`)) where `sp`.`salePercentage` <> 0 ;

-- --------------------------------------------------------

--
-- Structure for view `vw_sortbyborrowedbooks`
--
DROP TABLE IF EXISTS `vw_sortbyborrowedbooks`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_sortbyborrowedbooks`  AS  select `b`.`bookTitle` AS `bookTitle`,concat(`a`.`firstname`,' ',`a`.`middleinitial`,' ',`a`.`surname`) AS `Author Name`,`b`.`datePublished` AS `datePublished`,`b`.`price` AS `price`,`c`.`category` AS `category`,`sp`.`salePercentage` AS `salePercentage`,round(`b`.`price` - `sp`.`salePercentage` / 100 * `b`.`price`,2) AS `New Price`,case when `b`.`availability` like 1 then 'Available' else 'Not Available' end AS `Book Status`,case when `b`.`isBorrowed_B` like 1 then 'Can be Borrowed' else 'Cannot be Borrowed' end AS `Borrowed Book`,`b`.`isbn` AS `isbn` from ((((`tbl_book_author` `ba` join `tbl_author` `a` on(`ba`.`AuthorID` = `a`.`authorID`)) join `tbl_book` `b` on(`b`.`isbn` = `ba`.`bookIsbn`)) join `tbl_category` `c` on(`b`.`categoryID` = `c`.`categoryID`)) join `tbl_sale_percentage` `sp` on(`b`.`salePercentage` = `sp`.`saleID`)) where `b`.`isBorrowed_B` = 1 ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `tbl_author`
--
ALTER TABLE `tbl_author`
  ADD PRIMARY KEY (`authorID`);

--
-- Indexes for table `tbl_book`
--
ALTER TABLE `tbl_book`
  ADD PRIMARY KEY (`isbn`),
  ADD KEY `tbl_book_ibfk_2` (`categoryID`),
  ADD KEY `tbl_book_ibfk_3` (`adminUsername`),
  ADD KEY `tbl_book_ibfk_4` (`salePercentage`);

--
-- Indexes for table `tbl_book_author`
--
ALTER TABLE `tbl_book_author`
  ADD KEY `tbl_book_author_ibfk_1` (`bookIsbn`),
  ADD KEY `tbl_book_author_ibfk_2` (`AuthorID`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`categoryID`),
  ADD UNIQUE KEY `category` (`category`);

--
-- Indexes for table `tbl_log`
--
ALTER TABLE `tbl_log`
  ADD PRIMARY KEY (`LID`);

--
-- Indexes for table `tbl_sale_percentage`
--
ALTER TABLE `tbl_sale_percentage`
  ADD PRIMARY KEY (`saleID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_author`
--
ALTER TABLE `tbl_author`
  MODIFY `authorID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `categoryID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tbl_log`
--
ALTER TABLE `tbl_log`
  MODIFY `LID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tbl_sale_percentage`
--
ALTER TABLE `tbl_sale_percentage`
  MODIFY `saleID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_book`
--
ALTER TABLE `tbl_book`
  ADD CONSTRAINT `tbl_book_ibfk_2` FOREIGN KEY (`categoryID`) REFERENCES `tbl_category` (`categoryID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_book_ibfk_3` FOREIGN KEY (`adminUsername`) REFERENCES `tbl_admin` (`username`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_book_ibfk_4` FOREIGN KEY (`salePercentage`) REFERENCES `tbl_sale_percentage` (`saleID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_book_author`
--
ALTER TABLE `tbl_book_author`
  ADD CONSTRAINT `tbl_book_author_ibfk_1` FOREIGN KEY (`bookIsbn`) REFERENCES `tbl_book` (`isbn`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_book_author_ibfk_2` FOREIGN KEY (`AuthorID`) REFERENCES `tbl_author` (`authorID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
