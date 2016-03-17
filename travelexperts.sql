-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 17, 2016 at 09:36 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `travelexperts`
--

-- --------------------------------------------------------

--
-- Table structure for table `affiliations`
--

CREATE TABLE IF NOT EXISTS `affiliations` (
  `AffilitationId` varchar(10) NOT NULL,
  `AffName` varchar(50) DEFAULT NULL,
  `AffDesc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`AffilitationId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `affiliations`
--

INSERT INTO `affiliations` (`AffilitationId`, `AffName`, `AffDesc`) VALUES
('ACTA', 'Association of Canadian Travel Agents', NULL),
('ACTANEW', NULL, NULL),
('ACTANEWP', NULL, NULL),
('ACTAPGY', NULL, NULL),
('NEW', NULL, NULL),
('NEWPGY', NULL, NULL),
('PGY', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `agencies`
--

CREATE TABLE IF NOT EXISTS `agencies` (
  `AgencyId` int(11) NOT NULL AUTO_INCREMENT,
  `AgncyAddress` varchar(50) DEFAULT NULL,
  `AgncyCity` varchar(50) DEFAULT NULL,
  `AgncyProv` varchar(50) DEFAULT NULL,
  `AgncyPostal` varchar(50) DEFAULT NULL,
  `AgncyCountry` varchar(50) DEFAULT NULL,
  `AgncyPhone` varchar(50) DEFAULT NULL,
  `AgncyFax` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`AgencyId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `agencies`
--

INSERT INTO `agencies` (`AgencyId`, `AgncyAddress`, `AgncyCity`, `AgncyProv`, `AgncyPostal`, `AgncyCountry`, `AgncyPhone`, `AgncyFax`) VALUES
(1, '1155 8th Ave SW', 'Calagary', 'AB', 'T2P1N3', 'Canada', '4032719873', '4032719872'),
(2, '110 Main Street', 'Okatokes', 'AB', 'T7R3J5', 'Canada', '4035632381', '4035632382');

-- --------------------------------------------------------

--
-- Table structure for table `agents`
--

CREATE TABLE IF NOT EXISTS `agents` (
  `AgentId` int(11) NOT NULL AUTO_INCREMENT,
  `AgtFirstName` varchar(20) DEFAULT NULL,
  `AgtMiddleInitial` varchar(5) DEFAULT NULL,
  `AgtLastName` varchar(20) DEFAULT NULL,
  `AgtBusPhone` varchar(20) DEFAULT NULL,
  `AgtEmail` varchar(50) DEFAULT NULL,
  `AgtPosition` varchar(20) DEFAULT NULL,
  `AgencyId` int(11) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`AgentId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `agents`
--

INSERT INTO `agents` (`AgentId`, `AgtFirstName`, `AgtMiddleInitial`, `AgtLastName`, `AgtBusPhone`, `AgtEmail`, `AgtPosition`, `AgencyId`, `isActive`) VALUES
(1, 'Janet', NULL, 'Delton', '(403) 210-7801', 'janet.delton@travelexperts.com', 'Senior Agent', 1, 1),
(2, 'Judy', 'B.', 'Lisle', '(403) 210-7802', 'judy.lisle@travelexperts.com', 'Intermediate Agent', 2, 1),
(3, 'Dennis', 'C.', 'Reynolds', '(403) 210-7843', 'dennis.reynolds@travelexperts.com', 'Junior Agent', 3, 1),
(4, 'John', 'C.', 'Reilly', '(403) 210-7823', 'john.coville@travelexperts.com', 'Intermediate Agent', 4, 1),
(5, 'Janet', 'W.', 'Dahl', '(403) 210-7865', 'janice.dahl@travelexperts.com', 'Senior Agent', 5, 1),
(6, 'Bruce', 'J.', 'Dixon', '(403) 210-7867', 'bruce.dixon@travelexperts.com', 'Intermediate Agent', 6, 1),
(7, 'Beverly', 'S.', 'Jones', '(403) 210-7812', 'beverly.jones@travelexperts.com', 'Intermediate Agent', 2, 1),
(8, 'Jane', NULL, 'Merrill', '(403) 210-7868', 'jane.merrill@travelexperts.com', 'Senior Agent', 8, 1),
(9, 'Brian', 'S.', 'Peterson', '(403) 210-7833', 'brian.peterson@travelexperts.com', 'Junior Agent', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE IF NOT EXISTS `bookings` (
  `BookingId` int(11) NOT NULL AUTO_INCREMENT,
  `BookingDate` datetime DEFAULT NULL,
  `BookingNo` varchar(50) DEFAULT NULL,
  `TravelerCount` double DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `AgentID` int(11) DEFAULT NULL,
  `TripTypeId` varchar(1) DEFAULT NULL,
  `PackageId` int(11) DEFAULT NULL,
  `FeeId` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`BookingId`),
  KEY `BookingsCustomerId` (`CustomerId`),
  KEY `CustomersBookings` (`CustomerId`),
  KEY `TripTypesBookings` (`TripTypeId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1318 ;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`BookingId`, `BookingDate`, `BookingNo`, `TravelerCount`, `CustomerId`, `AgentID`, `TripTypeId`, `PackageId`, `FeeId`) VALUES
(15, '2001-03-05 00:00:00', 'WDR898', 1, 135, 3, 'L', 1, 'BK'),
(80, '2002-02-13 00:00:00', 'MKI334', 2, 122, 8, 'L', 1, 'BK'),
(161, '2002-09-27 00:00:00', 'SG4SD', 1, 105, 2, 'B', 2, 'BK'),
(172, '2002-10-03 00:00:00', 'FGFD64', 1, 104, 5, 'L', 2, 'BK'),
(228, '1999-02-20 00:00:00', 'KF83', 1, 119, 3, 'B', 2, 'BK'),
(312, '1999-04-28 00:00:00', 'SDSD33', 1, 130, 7, 'L', 3, 'BK'),
(409, '1999-09-07 00:00:00', 'FD53767', 2, 139, 5, 'B', 3, 'BK'),
(553, '1999-11-29 00:00:00', 'KKU7', 1, 109, 4, 'B', 4, 'BK'),
(598, '1999-12-13 00:00:00', 'FDSK3', 1, 121, 9, 'L', 4, 'BK'),
(622, '1999-12-19 00:00:00', 'JJJ77', 1, 106, 4, 'L', 1, 'BK'),
(910, '2000-03-19 00:00:00', 'GFF102', 1, 114, 6, 'B', 2, 'BK'),
(943, '2000-03-26 00:00:00', '34265Q67L', 2, 140, 7, 'L', 2, 'BK'),
(1075, '2000-04-23 00:00:00', '78755U', 2, 123, 9, 'L', 3, 'BK'),
(1089, '2000-04-24 00:00:00', 'T6657D', 2, 142, 1, 'B', 3, 'BK'),
(1178, '2000-05-30 00:00:00', 'LJJ108', 1, 118, 4, 'B', 3, 'BK'),
(1230, '2000-08-03 00:00:00', 'LJJ121', 1, 107, 2, 'B', 4, 'BK'),
(1306, '2007-12-05 00:00:00', 'LJJ122', 1, 107, 5, 'L', 1, 'BK'),
(1307, '2007-12-05 00:00:00', 'LJJ123', 2, 106, 1, 'L', 2, 'BK'),
(1308, '2007-12-05 00:00:00', 'LJJ124', 2, 108, 7, 'L', 4, 'BK'),
(1309, '2007-12-05 00:00:00', 'LJJ125', 2, 108, 9, 'L', 2, 'BK'),
(1310, '2007-12-05 00:00:00', 'LJJ126', 1, 107, 4, 'L', 3, 'BK'),
(1311, '2007-12-05 00:00:00', 'LJJ127', 3, 139, 2, 'L', 1, 'BK'),
(1312, '2007-12-05 00:00:00', 'LJJ128', 2, 139, 8, 'L', 4, 'BK'),
(1313, '2007-12-06 00:00:00', 'LJJ129', 2, 104, 3, 'L', 1, 'BK'),
(1315, '2007-12-06 00:00:00', 'LJJ130', 1, 106, 5, 'L', 3, 'BK'),
(1316, '2007-12-06 00:00:00', 'LJJ131', 5, 106, 7, 'L', 4, 'BK'),
(1317, '2007-12-06 00:00:00', 'LJJ132', 2, 107, 6, 'L', 2, 'BK');

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE IF NOT EXISTS `classes` (
  `ClassId` varchar(5) NOT NULL,
  `ClassName` varchar(20) NOT NULL,
  `ClassDesc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ClassId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`ClassId`, `ClassName`, `ClassDesc`) VALUES
('BSN', 'Business Class', NULL),
('DBL', 'Double', NULL),
('DLX', 'Delux', NULL),
('ECN', 'Economy', NULL),
('FST', 'First Class', NULL),
('INT', 'Interior', NULL),
('NA', 'Not Applicable', NULL),
('OCNV', 'Ocean View', NULL),
('SNG', 'Single', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `creditcards`
--

CREATE TABLE IF NOT EXISTS `creditcards` (
  `CreditCardId` int(11) NOT NULL AUTO_INCREMENT,
  `CCName` varchar(10) NOT NULL,
  `CCNumber` varchar(50) NOT NULL,
  `CCExpiry` datetime NOT NULL,
  `CustomerId` int(11) NOT NULL,
  PRIMARY KEY (`CreditCardId`),
  KEY `CustomersCreditCards` (`CustomerId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=280 ;

--
-- Dumping data for table `creditcards`
--

INSERT INTO `creditcards` (`CreditCardId`, `CCName`, `CCNumber`, `CCExpiry`, `CustomerId`) VALUES
(2, 'AMEX', '12342324248393', '2003-04-03 00:00:00', 123),
(26, 'AMEX', '33454212345651', '2003-09-29 00:00:00', 127),
(28, 'AMEX', '3422343212433430', '2003-07-19 00:00:00', 107),
(30, 'AMEX', '34458998784345', '2002-08-22 00:00:00', 140),
(31, 'AMEX', '345433789979389', '1999-11-05 00:00:00', 130),
(41, 'AMEX', '3522354387984530', '2002-06-09 00:00:00', 106),
(63, 'AMEX', '632456487984533', '2003-01-02 00:00:00', 142),
(69, 'AMEX', '78789007977999', '2002-08-22 00:00:00', 104),
(91, 'AMEX', '904883289756439', '2002-01-19 00:00:00', 133),
(99, 'Diners', '12093458976902', '2002-11-02 00:00:00', 143),
(123, 'Diners', '24348343482482', '2003-11-25 00:00:00', 109),
(141, 'Diners', '3749234924723790', '2003-05-01 00:00:00', 128),
(163, 'Diners', '6788922940392940', '2002-10-12 00:00:00', 139),
(167, 'Diners', '699834387984533', '2003-01-04 00:00:00', 118),
(169, 'Diners', '7482794729742320', '2002-04-12 00:00:00', 117),
(185, 'Diners', '8901128935238970', '1999-10-20 00:00:00', 141),
(201, 'MC', '3424345432894320', '2002-01-22 00:00:00', 120),
(230, 'VISA', '12122387984533', '2003-12-13 00:00:00', 121),
(239, 'VISA', '2311240543980120', '2002-11-03 00:00:00', 114),
(243, 'VISA', '23958389028923', '2002-08-22 00:00:00', 119),
(252, 'VISA', '3456683343353430', '2002-10-29 00:00:00', 135),
(272, 'VISA', '6543254233444530', '2002-01-22 00:00:00', 122),
(279, 'VISA', '78789007977999', '2002-08-22 00:00:00', 105);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE IF NOT EXISTS `customers` (
  `CustomerId` int(11) NOT NULL AUTO_INCREMENT,
  `CustFirstName` varchar(25) NOT NULL,
  `CustLastName` varchar(25) NOT NULL,
  `CustAddress` varchar(75) NOT NULL,
  `CustCity` varchar(50) NOT NULL,
  `CustProv` varchar(2) NOT NULL,
  `CustPostal` varchar(7) NOT NULL,
  `CustCountry` varchar(25) DEFAULT NULL,
  `CustHomePhone` varchar(20) DEFAULT NULL,
  `CustBusPhone` varchar(20) NOT NULL,
  `CustEmail` varchar(50) NOT NULL,
  `AgentId` int(11) DEFAULT NULL,
  `UserName` varchar(50) DEFAULT NULL,
  `Password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CustomerId`),
  KEY `EmployeesCustomers` (`AgentId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=144 ;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`CustomerId`, `CustFirstName`, `CustLastName`, `CustAddress`, `CustCity`, `CustProv`, `CustPostal`, `CustCountry`, `CustHomePhone`, `CustBusPhone`, `CustEmail`, `AgentId`, `UserName`, `Password`) VALUES
(104, 'fred', 'smith', '144-61 87th Ave, NE', 'Calgary', 'AB', 'T2J 6B6', 'Canada', '4032791223', '4032557865', '                                                  ', 4, 'fred', '1234'),
(105, 'Angel', 'Moskowitz', '320 John St., NE', 'Calgary', 'AB', 'T2J 7E3', 'Canada', '4032794228', '4036409874', 'amoskowitz@home.com                               ', 3, 'Angel', '1234'),
(106, 'Judith', 'Olvsade', '29 Elmwood Ave.,', 'Calgary', 'AB', 'T2Z 3M9', 'Canada', '4032795652', '4036861598', 'jolvsade@aol.com                                  ', 1, 'Judith', '1234'),
(107, 'Catherine', 'Mierzwa', '22-70 41st St.,NW', 'Calgary', 'AB', 'T2Z 2Z9', 'Canada', '4032796878', '4036404563', 'cmierzwa@msn.com                                  ', 5, 'Catherine', '1234'),
(108, 'Judy', 'Sethi', '63 Stratton Hall, SW', 'Calgary', 'AB', 'T1Y 6N4', 'Canada', '4032795111', '4036204789', 'judysehti@home.com                                ', 7, 'Judy', '1234'),
(109, 'Larry', 'Walter', '38 Bay 26th ST. #2A, NE', 'Calgary', 'AB', 'T2J 6B6', 'Canada', '4032793254', '4032845588', 'lwalter@aol.com                                   ', 4, 'Larry', '1234'),
(114, 'Winsome', 'Laporte', '268 E.3rd St, SW', 'Calgary', 'AB', 'T1Y 6N4', 'Canada', '4032691125', '4032844565', '                                                  ', 8, 'Winsome', '1234'),
(117, 'Nancy', 'Kuehn', '44-255 9th St., SW', 'Calgary', 'AB', 'T1Y 6N5', 'Canada', '4032693965', '4032843211', '                                                  ', 6, 'Nancy', '1234'),
(118, 'Hiedi', 'Lopez', '168 Rowayton Ave, NW', 'Calgary', 'AB', 'T3A 4ZG', 'Canada', '4032699856', '4035901587', 'hlopez@aol.com                                    ', 5, 'Hiedi', '1234'),
(119, 'Mardig', 'Abdou', '160-04 32nd Ave., SW', 'Calgary', 'AB', 'T2P 2G7', 'Canada', '4032691429', '4032251952', '                                                  ', 9, 'Mardig', '1234'),
(120, 'Ralph', 'Alexander', '2054 73rd St, SW', 'Calgary', 'AB', 'T2P 2G7', 'Canada', '4032691634', '4032256547', '                                                  ', 1, 'Ralph', '1234'),
(121, 'Sean', 'Pineda', '3 Salem Rd., NW', 'Calgary', 'AB', 'T2K 3E3', 'Canada', '4032691954', '4036864444', 'spineda@hotmail.com                               ', 3, 'Sean', '1234'),
(122, 'Julita', 'Lippen', '51-76 VanKleeck St., NW', 'Calgary', 'AB', 'T2K 6C5', 'Canada', '4032551956', '4035901478', 'jlippen@cadvision.co                              ', 4, 'Julita', '1234'),
(123, 'Pierre', 'Radicola', '322 Atkins Ave., SE', 'Calgary', 'AB', 'T3G 2C6', 'Canada', '4032551677', '4036867536', 'pradicola@home.com                                ', 8, 'Pierre', '1234'),
(127, 'Gary', 'Aung', '135-32 Louis Blvd, NE', 'Calgary', 'AB', 'T2V 2K5', 'Canada', '4032807858', '4037501587', '                                                  ', 9, 'Gary', '1234'),
(128, 'Jeff', 'Runyan', '109-15 Queens Blvd., NE', 'Calgary', 'AB', 'T2V 2K6', 'Canada', '4032809635', '4036201122', 'jrunyan@aol.com                                   ', 5, 'Jeff', '1234'),
(130, 'Lula', 'Oates', '11A Emory St., NE', 'Calgary', 'AB', 'T3E 3Z4', 'Canada', '4032439653', '4036861587', 'loates@aol.com                                    ', 9, 'Lula', '1234'),
(133, 'James', 'Reed', '109-621 96th St, NE', 'Calgary', 'AB', 'T3E 4A1', 'Canada', '4032432358', '4037201155', 'jreed@aol.com                                     ', 2, 'James', '1234'),
(135, 'Michelle', 'Masser', '379 Ovington Ave, NE', 'Calgary', 'AB', 'T2J 2S9', 'Canada', '4032441586', '4035908522', 'mmasser@aol.com                                   ', 6, 'Michelle', '1234'),
(138, 'John', 'Smith', '45 Plaza St. West #2D, NE', 'Calgary', 'AB', 'T3E 5C7', 'Canada', '4032449653', '4032837896', 'johnSmith@hotmail.co                              ', 7, 'John', '1234'),
(139, 'Angelo', 'Garshman', '82 Western Ave., NE', 'Calgary', 'AB', 'T3E 5C8', 'Canada', '4032259966', '4032696541', '                                                  ', 3, 'Angelo', '1234'),
(140, 'Derrick', 'Baltazar', '9111 Church Ave. #3N, NE', 'Calgary', 'AB', 'T3E 5C9', 'Canada', '4032255231', '4037502547', '                                                  ', 6, 'Derrick', '1234'),
(141, 'Robert', 'Boyd', '96-04 57th Ave #12A, NE', 'Calgary', 'AB', 'T3E 5C5', 'Canada', '4032255647', '4037509512', '                                                  ', 3, 'Robert', '1234'),
(142, 'Monica', 'Waldman', '257 Depot Rd., NE', 'Calgary', 'AB', 'T2J 6P3', 'Canada', '4032255629', '4032844566', 'mwaldman@aol.com                                  ', 2, 'Monica', '1234'),
(143, 'Gerard', 'Biers', '205 19th St., NE', 'Calgary', 'SK', 'T2J 6B6', 'Canada', '4032251952', '4037506578', '                                                  ', 8, 'Gerard', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE IF NOT EXISTS `employees` (
  `EmpFirstName` varchar(20) NOT NULL,
  `EmpMiddleInitial` varchar(5) DEFAULT NULL,
  `EmpLastName` varchar(20) NOT NULL,
  `EmpBusPhone` varchar(20) NOT NULL,
  `EmpEmail` varchar(50) NOT NULL,
  `EmpPosition` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`EmpFirstName`, `EmpMiddleInitial`, `EmpLastName`, `EmpBusPhone`, `EmpEmail`, `EmpPosition`) VALUES
('Janet', NULL, 'Delton', '(403) 210-7801', 'janet.delton@travelexperts.com', 'Senior Agent'),
('Judy', NULL, 'Lisle', '(403) 210-7802', 'judy.lisle@travelexperts.com', 'Intermediate Agent'),
('Dennis', 'C.', 'Reynolds', '(403) 210-7843', 'dennis.reynolds@travelexperts.com', 'Junior Agent'),
('John', NULL, 'Coville', '(403) 210-7823', 'john.coville@travelexperts.com', 'Intermediate Agent'),
('Janice', 'W.', 'Dahl', '(403) 210-7865', 'janice.dahl@travelexperts.com', 'Manager'),
('Bruce', 'J.', 'Dixon', '(403) 210-7867', 'bruce.dixon@travelexperts.com', 'Intermediate Agent'),
('Beverly', 'S.', 'Jones', '(403) 210-7812', 'beverly.jones@travelexperts.com', 'Intermediate Agent'),
('Jane', NULL, 'Merrill', '(403) 210-7868', 'jane.merrill@travelexperts.com', 'Senior Agent'),
('Brian', 'S.', 'Peterson', '(403) 210-7833', 'brian.peterson@travelexperts.com', 'Junior Agent');

-- --------------------------------------------------------

--
-- Table structure for table `fees`
--

CREATE TABLE IF NOT EXISTS `fees` (
  `FeeId` varchar(10) NOT NULL,
  `FeeName` varchar(50) NOT NULL,
  `FeeAmt` decimal(19,4) NOT NULL,
  `FeeDesc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`FeeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fees`
--

INSERT INTO `fees` (`FeeId`, `FeeName`, `FeeAmt`, `FeeDesc`) VALUES
('BK', 'Booking Charge', '25.0000', NULL),
('CH', 'Change', '15.0000', NULL),
('GR', 'Group Booking', '100.0000', NULL),
('NC', 'No Charge', '0.0000', NULL),
('NSF', 'Insufficient Funds', '25.0000', NULL),
('RF', 'Refund', '25.0000', NULL),
('RS', 'Research', '50.0000', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE IF NOT EXISTS `packages` (
  `PackageId` int(11) NOT NULL AUTO_INCREMENT,
  `PkgName` varchar(50) NOT NULL,
  `PkgStartDate` datetime DEFAULT NULL,
  `PkgEndDate` datetime DEFAULT NULL,
  `PkgDesc` varchar(50) DEFAULT NULL,
  `PkgBasePrice` decimal(19,4) NOT NULL,
  `PkgAgencyCommission` decimal(19,4) DEFAULT NULL,
  PRIMARY KEY (`PackageId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`PackageId`, `PkgName`, `PkgStartDate`, `PkgEndDate`, `PkgDesc`, `PkgBasePrice`, `PkgAgencyCommission`) VALUES
(1, 'Caribbean New Year', '2005-12-25 00:00:00', '2006-01-04 00:00:00', 'Cruise the Caribbean & Celebrate the New Year.', '630.0000', '400.0000'),
(2, 'Polynesian Paradise', '2005-12-12 00:00:00', '2005-12-20 00:00:00', '8 Day All Inclusive Hawaiian Vacation', '252.0000', '310.0000'),
(3, 'Asian Expedition', '2006-05-14 00:00:00', '2006-05-28 00:00:00', 'Airfaire, Hotel and Eco Tour.', '378.0000', '300.0000'),
(4, 'European Vacation', '2005-11-01 00:00:00', '2005-11-14 00:00:00', 'Euro Tour with Rail Pass and Travel Insurance', '380.0000', '280.0000');

-- --------------------------------------------------------

--
-- Table structure for table `packages_products`
--

CREATE TABLE IF NOT EXISTS `packages_products` (
  `PackageId` int(11) NOT NULL,
  `ProductId` int(11) NOT NULL,
  PRIMARY KEY (`PackageId`,`ProductId`),
  KEY `PackagesPackages_Products_Suppliers` (`PackageId`),
  KEY `Products_SuppliersPackages_Products_Suppliers` (`ProductId`),
  KEY `ProductSupplierId` (`ProductId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `packages_products`
--

INSERT INTO `packages_products` (`PackageId`, `ProductId`) VALUES
(1, 9),
(1, 33),
(1, 35),
(1, 80),
(1, 84),
(3, 4),
(4, 15),
(4, 50),
(4, 81);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `ProductId` int(11) NOT NULL AUTO_INCREMENT,
  `ProductTypeId` int(11) DEFAULT NULL,
  `SupplierId` int(11) DEFAULT NULL,
  `ProductName` longtext,
  `ProductRate` decimal(18,0) DEFAULT NULL,
  `ProductDesc` longtext,
  `ProductTotal` decimal(18,0) DEFAULT NULL,
  PRIMARY KEY (`ProductId`),
  KEY `Product_Supplier_ID` (`SupplierId`),
  KEY `ProductId` (`ProductTypeId`),
  KEY `ProductsProducts_Suppliers1` (`ProductTypeId`),
  KEY `ProductSupplierId` (`ProductId`),
  KEY `SuppliersProducts_Suppliers1` (`SupplierId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=94 ;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`ProductId`, `ProductTypeId`, `SupplierId`, `ProductName`, `ProductRate`, `ProductDesc`, `ProductTotal`) VALUES
(1, 1, 5492, 'Product 1 1', '13', 'Product Description 1 1', '126'),
(2, 1, 6505, 'Product 2 2', '13', 'Product Description 2 2', '126'),
(3, 8, 796, 'Product 3 3', '13', 'Product Description 3 3', '126'),
(4, 1, 4196, 'Product 4 4', '13', 'Product Description 4 4', '126'),
(6, 8, 1040, 'Product 5 5', '13', 'Product Description 5 5', '126'),
(7, 1, 3576, 'Product 6 6', '13', 'Product Description 6 6', '126'),
(8, 3, 845, 'Product 7 7', '13', 'Product Description 7 7', '126'),
(9, 7, 828, 'Product 8 8', '13', 'Product Description 8 8', '126'),
(10, 8, 5777, 'Product 9 9', '13', 'Product Description 9 9', '126'),
(11, 8, 5827, 'Product 10 10', '13', 'Product Description 10 10', '126'),
(12, 5, 3273, 'Product 11 11', '13', 'Product Description 11 11', '126'),
(13, 1, 80, 'Product 12 12', '13', 'Product Description 12 12', '126'),
(14, 8, 9396, 'Product 13 13', '13', 'Product Description 13 13', '126'),
(15, 8, 3589, 'Product 14 14', '13', 'Product Description 14 14', '126'),
(16, 1, 69, 'Product 15 15', '13', 'Product Description 15 15', '126'),
(19, 1, 3376, 'Product 16 16', '13', 'Product Description 16 16', '126'),
(20, 3, 323, 'Product 17 17', '13', 'Product Description 17 17', '126'),
(23, 1, 3549, 'Product 18 18', '13', 'Product Description 18 18', '126'),
(24, 5, 1918, 'Product 19 19', '13', 'Product Description 19 19', '126'),
(25, 3, 11156, 'Product 20 20', '13', 'Product Description 20 20', '126'),
(26, 8, 8837, 'Product 21 21', '13', 'Product Description 21 21', '126'),
(28, 8, 8089, 'Product 22 22', '13', 'Product Description 22 22', '126'),
(29, 1, 1028, 'Product 23 23', '13', 'Product Description 23 23', '126'),
(30, 1, 2466, 'Product 24 24', '13', 'Product Description 24 24', '126'),
(31, 5, 1406, 'Product 25 25', '13', 'Product Description 25 25', '126'),
(32, 3, 1416, 'Product 26 26', '13', 'Product Description 26 26', '126'),
(33, 5, 13596, 'Product 27 27', '13', 'Product Description 27 27', '126'),
(34, 1, 9323, 'Product 28 28', '13', 'Product Description 28 28', '126'),
(35, 5, 11237, 'Product 29 29', '13', 'Product Description 29 29', '126'),
(36, 8, 9785, 'Product 30 30', '13', 'Product Description 30 30', '126'),
(37, 5, 11163, 'Product 31 31', '13', 'Product Description 31 31', '126'),
(39, 9, 11172, 'Product 32 32', '13', 'Product Description 32 32', '126'),
(40, 8, 9285, 'Product 33 33', '13', 'Product Description 33 33', '126'),
(41, 5, 3622, 'Product 34 34', '13', 'Product Description 34 34', '126'),
(42, 5, 9323, 'Product 35 35', '13', 'Product Description 35 35', '126'),
(43, 1, 1766, 'Product 36 36', '13', 'Product Description 36 36', '126'),
(44, 1, 3212, 'Product 37 37', '13', 'Product Description 37 37', '126'),
(45, 9, 11174, 'Product 38 38', '13', 'Product Description 38 38', '126'),
(46, 8, 3600, 'Product 39 39', '13', 'Product Description 39 39', '126'),
(47, 9, 11160, 'Product 40 40', '13', 'Product Description 40 40', '126'),
(48, 8, 11549, 'Product 41 41', '13', 'Product Description 41 41', '126'),
(49, 4, 2827, 'Product 42 42', '13', 'Product Description 42 42', '126'),
(50, 9, 12657, 'Product 43 43', '13', 'Product Description 43 43', '126'),
(51, 8, 7377, 'Product 44 44', '13', 'Product Description 44 44', '126'),
(52, 5, 6550, 'Product 45 45', '13', 'Product Description 45 45', '126'),
(53, 4, 1634, 'Product 46 46', '13', 'Product Description 46 46', '126'),
(54, 8, 2140, 'Product 47 47', '13', 'Product Description 47 47', '126'),
(55, 3, 317, 'Product 48 48', '13', 'Product Description 48 48', '126'),
(56, 1, 1205, 'Product 49 49', '13', 'Product Description 49 49', '126'),
(57, 8, 3633, 'Product 50 50', '13', 'Product Description 50 50', '126'),
(58, 2, 6873, 'Product 51 51', '13', 'Product Description 51 51', '126'),
(59, 1, 7377, 'Product 52 52', '13', 'Product Description 52 52', '126'),
(60, 5, 7244, 'Product 53 53', '13', 'Product Description 53 53', '126'),
(61, 3, 2938, 'Product 54 54', '13', 'Product Description 54 54', '126'),
(63, 2, 5081, 'Product 55 55', '13', 'Product Description 55 55', '126'),
(64, 1, 3119, 'Product 56 56', '13', 'Product Description 56 56', '126'),
(65, 9, 2998, 'Product 57 57', '13', 'Product Description 57 57', '126'),
(66, 8, 3576, 'Product 58 58', '13', 'Product Description 58 58', '126'),
(67, 8, 2592, 'Product 59 59', '13', 'Product Description 59 59', '126'),
(68, 4, 100, 'Product 60 60', '13', 'Product Description 60 60', '126'),
(69, 9, 2987, 'Product 61 61', '13', 'Product Description 61 61', '126'),
(70, 4, 1005, 'Product 62 62', '13', 'Product Description 62 62', '126'),
(71, 4, 908, 'Product 63 63', '13', 'Product Description 63 63', '126'),
(72, 1, 5796, 'Product 64 64', '13', 'Product Description 64 64', '126'),
(73, 10, 2386, 'Product 65 65', '13', 'Product Description 65 65', '126'),
(74, 1, 3650, 'Product 66 66', '13', 'Product Description 66 66', '126'),
(75, 4, 1425, 'Product 67 67', '13', 'Product Description 67 67', '126'),
(76, 8, 6346, 'Product 68 68', '13', 'Product Description 68 68', '126'),
(78, 1, 1685, 'Product 69 69', '13', 'Product Description 69 69', '126'),
(79, 2, 2588, 'Product 70 70', '13', 'Product Description 70 70', '126'),
(80, 6, 1620, 'Product 71 71', '13', 'Product Description 71 71', '126'),
(81, 4, 1542, 'Product 72 72', '13', 'Product Description 72 72', '126'),
(82, 5, 9766, 'Product 73 73', '13', 'Product Description 73 73', '126'),
(83, 5, 5228, 'Product 74 74', '13', 'Product Description 74 74', '126'),
(84, 6, 9396, 'Product 75 75', '13', 'Product Description 75 75', '126'),
(87, 1, 1859, 'Product 76 76', '13', 'Product Description 76 76', '126'),
(90, 1, 1713, 'Product 77 77', '13', 'Product Description 77 77', '126'),
(93, 4, 3650, 'Product 78 78', '13', 'Product Description 78 78', '126');

-- --------------------------------------------------------

--
-- Table structure for table `producttypes`
--

CREATE TABLE IF NOT EXISTS `producttypes` (
  `ProductTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `ProdTypeName` varchar(50) NOT NULL,
  PRIMARY KEY (`ProductTypeId`),
  KEY `ProductId` (`ProductTypeId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `producttypes`
--

INSERT INTO `producttypes` (`ProductTypeId`, `ProdTypeName`) VALUES
(1, 'Air'),
(2, 'Attractions'),
(3, 'Car rental'),
(4, 'Cruise'),
(5, 'Hotel'),
(6, 'Motor Coach'),
(7, 'Railroad'),
(8, 'Tours'),
(9, 'Travel Insurance'),
(10, 'Yacht/Boat Charters');

-- --------------------------------------------------------

--
-- Table structure for table `regions`
--

CREATE TABLE IF NOT EXISTS `regions` (
  `RegionId` varchar(5) NOT NULL,
  `RegionName` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`RegionId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `regions`
--

INSERT INTO `regions` (`RegionId`, `RegionName`) VALUES
('AFR', 'Africa                   '),
('ANZ', 'Australia & New Zealand  '),
('ASIA', 'Asia                     '),
('EU', 'Europe & United Kingdom  '),
('MEAST', 'Middle East              '),
('MED', 'Mediterranean            '),
('NA', 'North America            '),
('OTHR', 'Other                    '),
('SA', 'South America            '),
('SP', 'South Pacific            ');

-- --------------------------------------------------------

--
-- Table structure for table `rewards`
--

CREATE TABLE IF NOT EXISTS `rewards` (
  `RewardId` int(11) NOT NULL,
  `RwdName` varchar(50) DEFAULT NULL,
  `RwdDesc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`RewardId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rewards`
--

INSERT INTO `rewards` (`RewardId`, `RwdName`, `RwdDesc`) VALUES
(1, 'Air Miles', NULL),
(2, 'AeroPlan', NULL),
(3, 'AeroPlan Gold', NULL),
(4, 'Coast Rewards', NULL),
(5, 'Mariott Rewards', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `suppliercontacts`
--

CREATE TABLE IF NOT EXISTS `suppliercontacts` (
  `SupplierContactId` int(11) NOT NULL AUTO_INCREMENT,
  `SupConFirstName` varchar(50) DEFAULT NULL,
  `SupConLastName` varchar(50) DEFAULT NULL,
  `SupConCompany` text,
  `SupConAddress` text,
  `SupConCity` text,
  `SupConProv` text,
  `SupConPostal` text,
  `SupConCountry` text,
  `SupConBusPhone` varchar(50) DEFAULT NULL,
  `SupConFax` varchar(50) DEFAULT NULL,
  `SupConEmail` text,
  `SupConURL` text,
  `AffiliationId` varchar(10) DEFAULT NULL,
  `SupplierId` int(11) DEFAULT NULL,
  PRIMARY KEY (`SupplierContactId`),
  KEY `AffiliationsSupCon` (`AffiliationId`),
  KEY `SuppliersSupCon` (`SupplierId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1167 ;

--
-- Dumping data for table `suppliercontacts`
--

INSERT INTO `suppliercontacts` (`SupplierContactId`, `SupConFirstName`, `SupConLastName`, `SupConCompany`, `SupConAddress`, `SupConCity`, `SupConProv`, `SupConPostal`, `SupConCountry`, `SupConBusPhone`, `SupConFax`, `SupConEmail`, `SupConURL`, `AffiliationId`, `SupplierId`) VALUES
(16, NULL, NULL, 'PACIFIC WINGS: Oahu-Molokai-Maui-Hawaii', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.newconcepts.ca', NULL, 69),
(17, NULL, NULL, 'WINAIR / WINDWARD ISLANDS AIRWAYS INTERNATIONAL', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.newconcepts.ca', NULL, 69),
(18, 'Stan Lee', NULL, 'SAIT', '123 fake st.', 'Calgary', 'Alberta', 't2t-2b5', 'Sweeeeeeten', '1234567', '7654321', 'thisisdumb@gmail.com', 'www.Ruby.com', 'helpme', 4),
(19, 'A.', 'Haziza', 'DIVI RESORTS', '1595 Calverton Court', 'Mississauga', 'ON', 'L5G 2W4', ' ', '9052748508', '9052714603', 'alhaziza@newconcepts.ca', 'http://www.newconcepts.ca', NULL, 69),
(20, 'A.', 'Haziza', 'TIMBERWOODS VACATION VILLAS', '7964 Timberwood Circle', 'Sarasota', 'FL', '34238', 'USA', '9419234966', '9419243109', 'reserve@timberwoods.com', 'www.timberwoods.com', NULL, 69),
(26, 'Nick', 'Kissanis', 'AMALIA HOTELS (GREECE)', '214 Bedford Rd', 'Toronto', 'ON', 'M5R 2K9', ' ', '4169674333', '4169676147', ' ', ' ', 'ACTAPGY', 80),
(27, 'Nick', 'Kissanis', 'CHAT/TRAVELINE', '214 Bedford Rd', 'Toronto', 'ON', 'M5R 2K9', ' ', '4169674333', '4169676147', ' ', ' ', 'ACTAPGY', 80),
(28, 'Nick', 'Kissanis', 'CHAT TOURS', '214 Bedford Rd', 'Toronto', 'ON', 'M5R 2K9', ' ', '4169674333', '4169676147', ' ', ' ', 'ACTAPGY', 80),
(47, 'Dr. Carlos', 'Pechtel de A', 'GLOBAL QUEST', '10316-124 St', 'Edmonton', 'AB', 'T5N 1R2', ' ', '7804823427', '7804826900', 'sales@avilatours.ca', ' ', NULL, 100),
(48, 'Dr. Carlos', 'Pechtel de A', 'MARINE EXPEDITIONS', '10316-124 St', 'Edmonton', 'AB', 'T5N 1R2', ' ', '7804823427', '7804826900', 'sales@avilatours.ca', ' ', NULL, 100),
(49, 'Dr. Carlos', 'Pechtel de A', 'AMAZON RIVER CRUISES', '10316-124 St', 'Edmonton', 'AB', 'T5N 1R2', ' ', '7804823427', '7804826900', 'sales@avilatours.ca', ' ', NULL, 100),
(51, NULL, NULL, 'EUROPE RIVER CRUISES/CROISI EUROPE', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 100),
(52, NULL, NULL, 'QUARK EXPEDITIONS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 100),
(53, 'Dr. Carlos', 'Pechtel de A', 'AVILA TOURS INC.', '10316-124 St', 'Edmonton', 'AB', 'T5N 1R2', ' ', '7804823427', '7804826900', 'sales@avilatours.ca', ' ', 'ACTAPGY', 100),
(56, NULL, NULL, 'TUMBACO GALAPAGOS YACHT CRUISES', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 100),
(65, NULL, NULL, 'CUBA CRUISE CORPORATION', '13 Hazelton Ave', 'Toronto', 'ON', 'M5R 2E1', ' ', '4169642569', '4169645644', 'cuba@blythtravel.com', 'http://www.cubacruising.com', 'PGY', 317),
(66, 'Sam', 'Blyth', 'BLYTH & COMPANY TRAVEL LTD.', '13 Hazelton Ave', 'Toronto', 'ON', 'M5R 2E1', ' ', '4169642569', '4169643416', 'blythco@blythtravel.com', 'http://www.blythtravel.com', 'PGY', 317),
(67, NULL, NULL, 'THE ROYAL SCOTSMAN', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.blythtravel.com', NULL, 317),
(68, NULL, NULL, 'THE EASTERN & ORIENTAL EXPRESS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.blythtravel.com', NULL, 317),
(70, NULL, NULL, 'THE BRITISH PULLMAN', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.blythtravel.com', NULL, 317),
(71, NULL, NULL, 'THE VENICE SIMPLON ORIENT EXPRESS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.blythtravel.com', NULL, 317),
(73, NULL, NULL, 'MOUNTAIN TRAVEL *SOBEK', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.blythtravel.com', NULL, 317),
(74, NULL, NULL, 'BACKROADS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.blythtravel.com', NULL, 317),
(75, NULL, NULL, 'EXOTIC SUN', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.blythtravel.com', NULL, 317),
(113, 'M.', 'Pangallo', 'COMPAGNIA ITALIANA TURISMO INC', '666 Sherbrooke W', 'Montreal', 'PQ', 'H3A 1E7', ' ', '5148454310', '5148459137', 'citmontreal@cittours.com', ' ', 'ACTAPGY', 323),
(114, NULL, NULL, 'ITALY/EURAILPASS/EUROPASS/GERMAN PASS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 323),
(121, 'Mary', 'Papamichael', 'CYPRUS AIRWAYS LTD', '34-09 Broadway', 'Astoria', 'NY', '11106', 'USA', '7182676882', '7182676885', 'kinisisusa@aol.com', ' ', NULL, 796),
(123, 'Mary', 'Papamichael', 'KINISIS TRAVEL & TOURS', '34-09 Broadway', 'Astoria', 'NY', '11106', 'USA', '7182676880', '7182676885', 'kinisisusa@aol.com', ' ', NULL, 796),
(127, NULL, NULL, 'BRITISH HERITAGE PASS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.dercanada.com', NULL, 828),
(128, 'Charlotte', ' Mikolaiczyk', 'DER TRAVEL SERVICE LTD', '904 The East Mall', 'Toronto (Etobicoke)', 'ON', 'M9B 6K2', ' ', '4166951209', '4166951210', 'der@dercanada.com', 'http://www.dercanada.com', 'ACTAPGY', 828),
(129, NULL, NULL, 'EUROLINE BUS PASS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.dercanada.com', NULL, 828),
(131, 'Charlotte', ' Mikolaiczyk', 'DERRAIL - EUROPEAN RAIL SERVICES', '904 The East Mall', 'Toronto (Etobicoke)', 'ON', 'M9B 6K2', ' ', '4166951209', '4166951210', 'der@dercanada.com', 'http://www.dercanada.com', NULL, 828),
(132, NULL, NULL, 'BENELUX PASS (BELGIUM LUXEMBOURG THE NETHERLANDS)', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.dercanada.com', NULL, 828),
(133, NULL, NULL, 'BRITRAIL PASS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.dercanada.com', NULL, 828),
(134, NULL, NULL, 'GREEK RAIL PASS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.dercanada.com', NULL, 828),
(135, NULL, NULL, 'EURAIL/EURO PASS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.dercanada.com', NULL, 828),
(136, NULL, NULL, 'BALKAN RAIL PASS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.dercanada.com', NULL, 828),
(137, NULL, NULL, 'GERMAN RAIL', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.dercanada.com', NULL, 828),
(138, NULL, NULL, 'EUROPEAN EAST PASS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.dercanada.com', NULL, 828),
(139, NULL, NULL, 'SCANRAIL NORWAY SWEDEN RAILPASS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.dercanada.com', NULL, 828),
(140, NULL, NULL, 'PARIS METRO PASS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.dercanada.com', NULL, 828),
(141, NULL, NULL, 'IBERIC FLEXIPASS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.dercanada.com', NULL, 828),
(142, NULL, NULL, 'SPAIN RAIL PASS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.dercanada.com', NULL, 828),
(143, NULL, NULL, 'HOLLAND RAIL PASS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.dercanada.com', NULL, 828),
(144, NULL, NULL, 'ITALIAN RAIL PASS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.dercanada.com', NULL, 828),
(145, NULL, NULL, 'AUSTRIAN RAILPASS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.dercanada.com', NULL, 828),
(146, NULL, NULL, 'LONDON VISITOR CARD', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.dercanada.com', NULL, 828),
(147, NULL, NULL, 'EUROSTAR SERVICES', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.dercanada.com', NULL, 828),
(150, 'Joanne', 'Lundy', 'DISCOVER THE WORLD MARKETING', '1599 Hurontario St', 'Mississauga', 'ON', 'L5G 4S1', ' ', '9058910093', '9058918026', 'toronto@discovertheworld.ca', ' ', 'PGY', 845),
(151, NULL, NULL, 'BRITISH MIDLAND', '1599 Hurontario St', 'Mississauga', 'ON', 'L5G 4S1', ' ', '9058910093', '9058918026', 'toronto@discovertheworld.ca', ' ', 'PGY', 845),
(152, 'Joanne', 'Lundy', 'AEROMEXICO', '1599 Hurontario St', 'Mississauga', 'ON', 'L5G 4S1', ' ', '9058910093', '9058918026', 'toronto@discovertheworld.ca', ' ', 'PGY', 845),
(153, 'Joanne', 'Lundy', 'AOM FRENCH AIRLINES', '1599 Hurontario St', 'Mississauga', 'ON', 'L5G 4S1', ' ', '9058910093', '9058918026', 'toronto@discovertheworld.ca', ' ', 'PGY', 845),
(154, NULL, NULL, 'AMERICA WEST AIRLINES', '4000 E Sky Harbor Blvd', 'Phoenix', 'AZ', '85034', ' ', '8002929378', NULL, 'toronto@discovertheworld.ca', 'http://www.americawest.com', NULL, 845),
(156, 'Joanne', 'Lundy', 'HYATT NORTH AMERICA/CARIBBEAN', '1599 Hurontario St', 'Mississauga', 'ON', 'L5G 4S1', ' ', '9052331234', '9058918026', 'toronto@discovertheworld.ca', 'www.hyatt.com', 'PGY', 845),
(161, 'Angie', 'Lo', 'ELITE ORIENT TOURS INC.', '170 University Ave', 'Toronto', 'ON', 'M5H 3B3', ' ', '4169773026', '4169773104', ' ', ' ', 'ACTAPGY', 908),
(165, 'Angie', 'Lo', 'JAPAN RAIL PASS', '170 University Ave', 'Toronto', 'ON', 'M5H 3B3', ' ', '4169773026', '4169773104', ' ', ' ', NULL, 908),
(167, 'Aideen', 'Hennessy', 'ENCORE CRUISES', '160 Bloor St E', 'Toronto', 'ON', 'M4W 1B9', ' ', '4169602516', '4169670303', ' ', ' ', 'ACTAPGY', 1005),
(168, NULL, NULL, 'CUNARD LINE', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 1005),
(169, NULL, NULL, 'WINDSTAR CRUISES', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 1005),
(170, NULL, NULL, 'CELEBRITY CRUISES', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 1005),
(171, NULL, NULL, 'SEABOURN CRUISE LINE', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 1005),
(172, NULL, NULL, 'ORIENT LINES', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 1005),
(173, NULL, NULL, 'SILVERSEA CRUISES', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 1005),
(174, NULL, NULL, 'STAR CLIPPERS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 1005),
(175, NULL, NULL, 'ROYAL CARIBBEAN INTERNATIONAL', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 1005),
(176, NULL, NULL, 'ROYAL OLYMPIC CRUISES', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 1005),
(177, NULL, NULL, 'HOLLAND AMERICA LINE', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 1005),
(178, NULL, NULL, 'RADISSON SEVEN SEAS CRUISES', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 1005),
(181, 'Maria', 'Conte', 'EUROCRUISES INC.', '33 Little W 12th St', 'New York', 'NY', '10014', 'USA', '2126912099', '2123664747', 'info@eurocruises.com', 'http://www.eurocruises.com', 'PGY', 1406),
(182, NULL, NULL, 'DELPHIN CRUISES', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.eurocruises.com', NULL, 1406),
(184, NULL, NULL, 'KRISTINA CRUISES', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.eurocruises.com', NULL, 1406),
(185, NULL, NULL, 'FRED. OLSEN CRUISE LINES', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.eurocruises.com', NULL, 1406),
(186, 'Marcel', 'Paoli', 'EUROP-AUTO-VACANCES/HOLIDAYS', '5174 Cote des Neiges', 'Montreal', 'PQ', 'H3T 1X8', ' ', '5147353083', '5143428802', 'europauto@netrover.com', 'http://www.europauto.qc.ca', 'ACTANEWP', 1028),
(187, NULL, NULL, 'EUROPCAR', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.europauto.qc.ca', NULL, 1028),
(188, 'M.', 'Schon', 'EXECUTIVE SUITES', 'Emerald Business Centre', 'Mississauga', 'ON', 'L5R 3K6', ' ', '9055029550', '9055020355', 'execsuit@idirect.com', 'http://www.execsuit.com', 'PGY', 1040),
(189, NULL, NULL, 'PARK SUITES', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 1040),
(210, 'Rochelle', 'Goldman', 'GOLDMAN MARKETING STRATEGY INC', '80 St Clair Ave E', 'Toronto', 'ON', 'M4T 1N6', ' ', '4169235705', '4169235628', 'gms@on.aibn.com', ' ', 'PGY', 1205),
(211, 'Rochelle', 'Goldman', 'HEBRIDEAN ISLAND CRUISES: THE HEBRIDEAN PRINCESS', '80 St Clair Ave E', 'Toronto', 'ON', 'M4T 1N6', ' ', '4169235705', '4169235628', 'gms@on.aibn.com', ' ', 'PGY', 1205),
(214, 'Bruce', 'Hodge', 'GOWAY TRAVEL LTD.', '3284 Yonge St', 'Toronto', 'ON', 'M4N 3M7', ' ', '4163221034', '4163221109', 'res@goway.com', 'http://www.goway.com', 'ACTAPGY', 1685),
(215, NULL, NULL, 'GREAT BARRIER REEF CRUISES', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.goway.com', NULL, 1685),
(216, NULL, NULL, 'FIJI (BLUE LAGOON) CRUISES', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.goway.com', NULL, 1685),
(217, NULL, NULL, 'YANTZE RIVER CRUISES', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.goway.com', NULL, 1685),
(219, 'Bruce', 'Hodge', 'AUSTRALIAN RAIL', '3284 Yonge St', 'Toronto', 'ON', 'M4N 3M7', ' ', '4163221034', '4163221109', 'res@goway.com', 'http://www.goway.com', NULL, 1685),
(221, NULL, NULL, 'AAT KINGS AUSTRALIAN TOURS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.goway.com', NULL, 1685),
(245, 'Marc', 'Vezina', 'TOURS MAISON - THE HOLIDAY NETWORK', '2155 Guy St', 'Montreal', 'PQ', 'H3H 2R9', ' ', '5149357103', '5149854492', ' ', 'http://www.holidaynetwork.ca', 'ACTAPGY', 1416),
(249, NULL, NULL, 'WOODS CAR RENTAL - BRITAIN', ' ', ' ', ' ', ' ', ' ', '8002688354', '4163671749', ' ', 'http://www.holidaynetwork.ca', 'PGY', 1416),
(250, NULL, NULL, 'ALAMO RENT A CAR', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.holidaynetwork.ca', NULL, 1416),
(251, NULL, NULL, 'DOLLAR HAWAII', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.holidaynetwork.ca', NULL, 1416),
(252, NULL, NULL, 'AVIS RENT A CAR', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.holidaynetwork.ca', NULL, 1416),
(257, NULL, NULL, 'KD RIVER CRUISES OF EUROPE', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.holidaynetwork.ca', NULL, 1416),
(258, NULL, NULL, 'DISNEY CRUISE LINE', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.holidaynetwork.ca', NULL, 1416),
(259, NULL, NULL, 'CRYSTAL CRUISES', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.holidaynetwork.ca', NULL, 1416),
(260, NULL, NULL, 'PRINCESS CRUISES', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.holidaynetwork.ca', NULL, 1416),
(261, NULL, NULL, 'SILVERSEA', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.holidaynetwork.ca', NULL, 1416),
(262, NULL, NULL, 'NORWEGIAN CRUISE LINES', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.holidaynetwork.ca', NULL, 1416),
(263, NULL, NULL, 'COSTA CRUISES', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.holidaynetwork.ca', NULL, 1416),
(264, NULL, NULL, 'SUN CRUISES', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.holidaynetwork.ca', NULL, 1416),
(266, 'Astrinos', ' Kozoronis', 'CARRIERS TRAVEL INTERNATIONAL INC. - THE HOLIDAY NETWORK', '75 The Donway W', 'Toronto', 'ON', 'M3C 2E9', ' ', '4164299000', '4164297159', ' ', 'http://www.holidaynetwork.ca', 'PGY', 1416),
(267, 'Leanda', 'Townsend', 'HOLIDAY HOUSE', '26 Wellington St E 5th Fl', 'Toronto', 'ON', 'M5E 1S2', ' ', '4163645100', '4163671836', ' ', 'http://www.holidaynetwork.ca', 'PGY', 1416),
(268, 'Leanda', 'Townsend', 'SIVER FERN - THE HOLIDAY NETWORK', '26 Wellington St E 5th Fl', 'Toronto', 'ON', 'M5E 1S2', ' ', '4163645100', '4163671836', ' ', 'http://www.holidaynetwork.ca', 'PGY', 1416),
(272, 'Erik', 'Elvejord', 'HOLLAND AMERICA LINE WESTOURS INC', '300 Elliott Ave W', 'Seattle', 'WA', '98119', 'USA', '8004260327', '2062863229', ' ', ' ', 'ACTAPGY', 1425),
(274, NULL, NULL, 'WESTOURS INC.', '300 Elliott Ave W', 'Seattle', 'WA', '98119', 'USA', '8004260327', '2064260329', ' ', ' ', 'ACTAPGY', 1425),
(282, NULL, NULL, 'EVAN EVANS TOURS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 1542),
(283, 'Helen', 'Panagides', 'INSIGHT VACATIONS CANADA LTD.', '2300 Yonge St', 'Toronto', 'ON', 'M4P 1E4', ' ', '4164822116', '4164824307', ' ', ' ', 'ACTAPGY', 1542),
(288, 'Jacques', 'Darcy', 'INTAIR TRANSIT', '1221 rue St-Hubert', 'Montreal', 'PQ', 'H2L 3Y8', ' ', '5142869747', '5148437678', ' ', ' ', 'ACTANEWP', 1620),
(289, 'Jacques', 'Darcy', 'INTAIR VACATIONS', '1221 rue St-Hubert', 'Montreal', 'PQ', 'H2L 3Y8', ' ', '5142862800', '5142861655', ' ', ' ', NULL, 1620),
(290, 'Jacques', 'Darcy', 'BOOMERANG TOURS', '1221 rue St-Hubert', 'Montreal', 'PQ', 'H2L 3Y8', ' ', '5142866035', '5142861655', ' ', ' ', NULL, 1620),
(291, 'Jacques', 'Darcy', 'INTAIR VACATIONS / INTAIR USA / INTAIR CRUISES', '1221 rue St-Hubert', 'Montreal', 'PQ', 'H2L 3Y8', ' ', '5142862800', '5142861655', ' ', ' ', NULL, 1620),
(294, NULL, NULL, 'TALL SHIP CRUISES (MAINE THE CARIBBEAN SOUTH PACIFIC)', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.cruising.nu', NULL, 1634),
(295, NULL, NULL, 'IVARAN CRUISE LINE (FREIGHTER CRUISES)-SOUTH AMERICA/CARIBBEAN', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.cruising.nu', NULL, 1634),
(296, NULL, NULL, 'ZEUS TALL SHIP CRUISES-GREECE', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.cruising.nu', NULL, 1634),
(297, NULL, NULL, 'TEMPTRESS CRUISES-COSTA RICA', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.cruising.nu', NULL, 1634),
(298, NULL, NULL, 'ARANUI CRUISES (FREIGHTER CRUISES) - TAHITI', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.cruising.nu', NULL, 1634),
(299, NULL, NULL, 'CROWN BLUE LINE/FRANCE CANAL & RIVER POWER BOATS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.cruising.nu', NULL, 1634),
(300, NULL, NULL, 'AMAZING GRACE (FREIGHTER CRUISES)-CARIBBEAN', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.cruising.nu', NULL, 1634),
(301, 'Michael', 'Tomlinson', 'WINDJAMMER BAREFOOT CRUISES', '200 10441-124th St', 'Edmonton', 'AB', 'T5N 1R7', ' ', '7804825022', '7804825328', 'islands@cruising.nu', 'http://www.cruising.nu', 'ACTAPGY', 1634),
(302, 'Michael', 'Tomlinson', 'ISLANDS IN THE SUN CRUISES', '200 10441-124th St', 'Edmonton', 'AB', 'T5N 1R7', ' ', '7804825022', '7804825328', 'islands@cruising.nu', 'http://www.cruising.nu', 'ACTAPGY', 1634),
(303, NULL, NULL, 'NEILSON CYCLING HOLIDAYS-GREECE/TURKEY', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.cruising.nu', NULL, 1634),
(304, NULL, NULL, 'ISLANDS IN THE SUN CRUISES', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.cruising.nu', NULL, 1634),
(305, NULL, NULL, 'SUNSAIL SAIL & STAY', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.cruising.nu', NULL, 1634),
(306, NULL, NULL, 'MOORINGS THE', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.cruising.nu', NULL, 1634),
(307, NULL, NULL, 'VIRGIN ISLANDS CHARTER YACHT LEAGUE CREWED YACHT HOLIDAYS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.cruising.nu', NULL, 1634),
(308, NULL, NULL, 'CLUB MARINER SAIL & STAY HOLIDAYS-ST. LUCIA/GRENADA/BVI', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.cruising.nu', NULL, 1634),
(309, NULL, NULL, 'NEILSON FLOTILLA SAILING-GREECE/TURKEY', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.cruising.nu', NULL, 1634),
(310, NULL, NULL, 'TRAWLERS IN PARADISE - CARIBBEAN USVI''S', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.cruising.nu', NULL, 1634),
(311, NULL, NULL, 'VIKING TOURS AND TALL SHIP CRUISES OF GREECE', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.cruising.nu', NULL, 1634),
(312, NULL, NULL, 'WINDJAMMER BAREFOOT CRUISES', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.cruising.nu', NULL, 1634),
(313, NULL, NULL, 'DIVE BELIZE-AGGRESSOR DIVE FLEET', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.cruising.nu', NULL, 1634),
(314, NULL, NULL, 'SUNSAIL YACHT CHARTERS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.cruising.nu', NULL, 1634),
(315, NULL, NULL, 'SOUTH FLORIDA SAILING SCHOOL & YACHT CHARTERS - FLORIDA KEYS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.cruising.nu', NULL, 1634),
(316, NULL, NULL, 'BAREBOAT YACHT CHARTERS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.cruising.nu', NULL, 1634),
(317, NULL, NULL, 'NEILSON CYCLING HOLIDAYS-DOMINICAN REPUBLIC/GRENADA', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.cruising.nu', NULL, 1634),
(318, NULL, NULL, 'SUNSAIL CLUB ANTIGUA', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.cruising.nu', NULL, 1634),
(319, NULL, NULL, 'HORIZON POWER/SAIL BVI''S', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.cruising.nu', NULL, 1634),
(320, NULL, NULL, 'AGGRESSOR DIVE HOLIDAYS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.cruising.nu', NULL, 1634),
(321, NULL, NULL, 'HOSEASONS - UK CANALBOATS (U-DRIVE) FRANCE/EUROPE', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.cruising.nu', NULL, 1634),
(322, NULL, NULL, 'QUEENSLAND YACHT CHARTERS - AUSTRALIAN BARRIER REEF', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.cruising.nu', NULL, 1634),
(323, NULL, NULL, 'COPPER SKY-NW PACIFIC', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.cruising.nu', NULL, 1634),
(330, 'Kenny', 'Lee', 'JETPACIFIC HOLIDAYS INC.', '120-8877 Odlin Cres', 'Richmond', 'BC', 'V6X 3Z7', ' ', '6042148932', '6042148933', 'jetpac@infoserve.net', ' ', 'ACTAPGY', 1713),
(331, NULL, NULL, 'BANGKOK AIRWAYS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 1713),
(333, NULL, NULL, 'BALI HAI CRUISES - BALI', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 1713),
(334, NULL, NULL, 'STAR CRUISES - SINGAPORE', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 1713),
(342, 'Chris', 'Rivers', 'KLM ROYAL DUTCH AIRLINES', '777 Bay St', 'Toronto', 'ON', 'M5G 2C8', ' ', '4162045151', '4162049708', ' ', ' ', 'ACTAPGY', 1766),
(343, NULL, NULL, 'NORTHWEST AIRLINES & KLM ROYAL DUTCH AIRLINES (NW/KL)', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 1766),
(357, 'Emile', 'Habib', 'LOTUS HOLIDAYS', '792 Kennedy Rd', 'Toronto (Scarborough)', 'ON', 'M1K 2C8', ' ', '4167517025', '4167510608', ' ', ' ', 'PGY', 1859),
(359, NULL, NULL, 'NILE CRUISES', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 1859),
(369, 'Corinne', 'Martin', 'MARKET SQUARE TOURS', '273 Donald St', 'Winnipeg', 'MB', 'R3C 1M9', ' ', '2049564279', '2049490188', 'sales@gctc-mst.com', 'http://www.greatcanadiantravel.com', 'ACTAPGY', 1918),
(370, 'Corinne', 'Martin', 'THE GREAT CANADIAN TRAVEL COMPANY LTD', '273 Donald St', 'Winnipeg', 'MB', 'R3C 1M9', ' ', '2049490199', '2049490188', 'sales@gctc-mst.com', 'http://www.greatcanadiantravel.com', NULL, 1918),
(371, 'Antonio', 'Alonso', 'MARKETING AHEAD', '433 Fifth Ave.', 'New York', 'NY', '10016', 'USA', '2126869213', '2126860271', ' ', ' ', 'PGY', 3273),
(372, NULL, NULL, 'PARADORES OF SPAIN', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 3273),
(373, NULL, NULL, 'POUSADAS OF PORTUGAL', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 3273),
(375, 'S.R.', 'Vale', 'MARTINAIR SERVICES', '111 Richmond St W', 'Toronto', 'ON', 'M5H 2G4', ' ', '4163643672', '4163643886', ' ', ' ', 'ACTAPGY', 3376),
(376, 'S.R.', 'Vale', 'MARTINAIR HOLLAND', '111 Richmond St W', 'Toronto', 'ON', 'M5H 2G4', ' ', '4163643672', '4163643886', ' ', ' ', 'PGY', 3376),
(396, 'Pat', 'Nagel', 'NAGEL TOURS LTD', 'Edmonton Inn', 'Edmonton', 'AB', 'T5G 0X5', ' ', '7804527345', '7804786666', ' ', 'http://www.nageltours.com', 'PGY', 2140),
(397, 'Pat', 'Nagel', 'OKANAGAN VALLEY WINE TRAIN', 'Edmonton Inn', 'Edmonton', 'AB', 'T5G 0X5', ' ', '7804888725', '7804827666', ' ', 'http://www.okanaganwinetrain.com', 'PGY', 2140),
(419, NULL, NULL, 'HOTEL NARROW BOATS/UK', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.infomatch.com/~pavlik', NULL, 2386),
(420, NULL, NULL, 'CROWN BLUE LINE FRANCE', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.infomatch.com/~pavlik', NULL, 2386),
(421, NULL, NULL, 'LOCABOAT - SELF-SKIPPERED PENICHETTES - EUROPE', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.infomatch.com/~pavlik', NULL, 2386),
(422, NULL, NULL, 'EUROPE RIVER CRUISES/CROISI EUROPE (ALSACE CROISIERES)', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.infomatch.com/~pavlik', NULL, 2386),
(423, NULL, NULL, 'CONTINENTAL WATERWAYS - HOTEL-BARGE CRUISES FRANCE', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.infomatch.com/~pavlik', NULL, 2386),
(424, NULL, NULL, 'BARGE CRUISES EUROPE', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.infomatch.com/~pavlik', NULL, 2386),
(425, NULL, NULL, 'CANAL & RIVER CRUISES EUROPE', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.infomatch.com/~pavlik', NULL, 2386),
(426, 'Janet', 'Pavlik', 'PAVLIK TRAVEL GROUP', '2221 Panorama Dr', 'N Vancouver', 'BC', 'V7G 1V4', ' ', '6049297911', '6049240634', 'pavlik@infomatch.com', 'http://www.infomatch.com/~pavlik', 'PGY', 2386),
(428, NULL, NULL, 'ANGLO WELSH SELF SKIPPERED BOATS(BRITAIN)', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.infomatch.com/~pavlik', NULL, 2386),
(429, NULL, NULL, 'IRELAND - SELF SKIPPERED CANAL BOATS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.infomatch.com/~pavlik', NULL, 2386),
(430, NULL, NULL, 'HOLLAND - CANAL BOATING', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.infomatch.com/~pavlik', NULL, 2386),
(431, NULL, NULL, 'CROWN BLUE LINE (FRANCE)', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.infomatch.com/~pavlik', NULL, 2386),
(434, 'Patricia', 'Fargeon', 'PLANET FRANCE INC.', '7351 Victoria Park Ave', 'Markham', 'ON', 'L3R 3A5', ' ', '9054796121', '9054795411', 'planet.pat@sympatico.ca', ' ', 'PGY', 2466),
(435, 'Patricia', 'Fargeon', 'PLANET EUROPE GROUP', '7351 Victoria Park Ave', 'Markham', 'ON', 'L3R 3A5', ' ', '9054797069', '9054795411', 'planet.pat@sympatico.ca', ' ', 'PGY', 2466),
(466, 'Gary C.', 'Sadler', 'UNIQUE VACATIONS (CANADA) INC.', '4211 Yonge St', 'Toronto (North York)', 'ON', 'M2P 2A9', ' ', '4162230028', '4162233306', ' ', ' ', 'ACTA', 2588),
(467, NULL, NULL, 'SANDALS AND BEACHES RESORTS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', 'ACTA', 2588),
(476, 'Ash', 'Mukherjee', 'ESPRIT/SERVICENTRE HOLIDAYS', '5945 Airport Rd', 'Mississauga', 'ON', 'L4V 1R9', ' ', '9056733333', '9056733327', 'tscash@aol.com', 'http://www.espritvacations.com', 'PGY', 2592),
(477, NULL, NULL, 'CLUBAVANTAGE GROUP TRAVE', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.espritvacations.com', NULL, 2592),
(496, 'Julio', 'Erhart', 'HOTEL NETS', '1235 Bay St', 'Toronto', 'ON', 'M5R 3K4', ' ', '4169214012', '4169698916', 'southwin@ican.net', ' ', NULL, 2827),
(497, 'Julio', 'Erhart', 'SOUTH WIND TOURS LTD.', '1235 Bay St', 'Toronto', 'ON', 'M5R 3K4', ' ', '4169214012', '4169698916', 'southwin@ican.net', ' ', NULL, 2827),
(500, 'Mela', 'Pascoe', 'SUN & LEISURE TRAVEL CORP', '401 The West Mall', 'Toronto (Etobicoke)', 'ON', 'M9C 5J5', ' ', '4166265199', '4166200009', ' ', ' ', 'PGY', 2938),
(501, NULL, NULL, 'CANADIAN TOURS INTERNATIONAL', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 2938),
(517, NULL, NULL, 'YANGTZE RIVER CRUISES', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.tourcanvacations.com', NULL, 2987),
(518, NULL, NULL, 'EASTERN & ORIENTAL EXPRESS/ROAD TO MANDALAY CRUISE BURMA', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.tourcanvacations.com', NULL, 2987),
(519, NULL, NULL, 'STAR CRUISE LINES-SINGAPORE', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.tourcanvacations.com', NULL, 2987),
(520, NULL, NULL, 'STAR CLIPPER-ASIA-CARIBBEAN-MEDITERRANEAN', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.tourcanvacations.com', NULL, 2987),
(521, 'Miki', 'Friendly', 'TOURCAN VACATIONS INC', '255 Duncan Mill Rd', 'Toronto', 'ON', 'M3B 3H9', ' ', '4163910334', '4163910986', 'tourcanvacations@tourcanvacations.com', 'http://www.tourcanvacations.com', 'ACTAPGY', 2987),
(522, 'Miki', 'Friendly', 'ROVOS RAIL - SOUTH AFRICA', '255 Duncan Mill Rd', 'Toronto', 'ON', 'M3B 3H9', ' ', '4163910334', '4163910986', 'tourcanvacations@tourcanvacations.com', 'http://www.tourcanvacations.com', NULL, 2987),
(523, NULL, NULL, 'ROYAL SCOTSMAN', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.tourcanvacations.com', NULL, 2987),
(524, NULL, NULL, 'VENICE SIMPLON - ORIENT - EXPRESS - LONDON/VENICE OR V.V. EASTERN & ORI', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.tourcanvacations.com', NULL, 2987),
(525, 'Miki', 'Friendly', 'VENICE SIMPLON -- ORIENT EXPRESS - EUROPE EASTERN & ORIENTAL ORIENT EXP', '255 Duncan Mill Rd', 'Toronto', 'ON', 'M3B 3H9', ' ', '4163910334', '4163910986', 'tourcanvac', ' ', NULL, 2987),
(526, 'Miki', 'Friendly', 'PALACE ON WHEELS - INDIA', '255 Duncan Mill Rd', 'Toronto', 'ON', 'M3B 3H9', ' ', '4163910334', '4163910986', 'tourcanvacations@tourcanvacations.com', 'http://www.tourcanvacations.com', NULL, 2987),
(532, 'Elisabeth', 'Dupuis', 'ALIOTOURS', '1410 Stanley St', 'Montreal', 'PQ', 'H3A 1P8', ' ', '5142871066', '5148435680', ' ', ' ', 'ACTA', 2998),
(533, 'Elisabeth', 'Dupuis', 'ALIO TOURS DIV. TOURS NEW YORK', '1410 Stanley St', 'Montreal', 'PQ', 'H3A 1P8', ' ', '5142871066', '5148435680', ' ', ' ', 'ACTA', 2998),
(538, 'Joaquin', 'Murillo', 'TRANS WORLD AIRLINES INC. (TWA)', '1751 Richardson St', 'Montreal', 'PQ', 'H3K 1G6', ' ', '5148448242', '5148440921', 'aviaction@median-aviation.com', 'http://www.median-aviation.com', 'PGY', 3119),
(540, 'Joaquin', 'Murillo', 'AVIACTION', 'Airway Centre 1 5955 Airport', 'Mississauga', 'ON', 'L4V 1R9', ' ', '9056778242', '9056779394', 'aviaction@median-aviation.com', 'http://www.median-aviation.com', 'PGY', 3119),
(550, 'Terri', 'Ronneseth', 'TREK AIR', '8412 - 109 St', 'Edmonton', 'AB', 'T6G 1E2', ' ', '7804399118', '7804335494', 'airfares@trekholidays.com', 'http://www.trekholidays.com', 'ACTAPGY', 3212),
(551, 'Terri', 'Ronneseth', 'TREK HOLIDAYS', '8412 - 109 St', 'Edmonton', 'AB', 'T6G 1E2', ' ', '7804399118', '7804335494', 'adventures@trekholidays.com', 'http://www.trekholidays.com', 'ACTAPGY', 3212),
(552, NULL, NULL, 'KARIBU SAFARIS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.trekholidays.com', NULL, 3212),
(553, NULL, NULL, 'PEREGRINE ADVENTURES/GECKO ADVENTURES', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.trekholidays.com', NULL, 3212),
(554, NULL, NULL, 'EXPLORE WORLDWIDE', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.trekholidays.com', NULL, 3212),
(555, NULL, NULL, 'DRAGOMAN HOLIDAYS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.trekholidays.com', NULL, 3212),
(556, NULL, NULL, 'KIRRA TOURS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.trekholidays.com', NULL, 3212),
(557, NULL, NULL, 'IMAGINATIVE TRAVELLER', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.trekholidays.com', NULL, 3212),
(558, NULL, NULL, 'ENCOUNTER OVERLAND', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.trekholidays.com', NULL, 3212),
(568, 'Vicky', 'Alberto', 'VIP INTERNATIONAL', '727-7th Ave SW', 'Calgary', 'AB', 'T2P 0Z5', ' ', '4032693566', '4032612046', 'info@vipintcorp.com', ' ', 'PGY', 3633),
(569, 'Kelly', 'Blake', 'ALL SUITES INTERNATIONAL', '727-7th Ave SW', 'Calgary', 'AB', 'T2P 0Z5', ' ', '4032664776', '4032665228', 'info@vipintcorp.com', ' ', 'PGY', 3633),
(586, 'Jeronimo', 'Rius', 'BONANZA HOLIDAYS', '1224 Stanley St', 'Montreal', 'PQ', 'H3B 2S7', ' ', '5143939501', '5143939504', 'bonanza@globalserve.net', ' ', 'ACTAPGY', 3549),
(598, NULL, NULL, 'AUSTRIA HOTELS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.bluedanubeholidays.com', NULL, 3576),
(599, NULL, NULL, 'CEDOK CZECH TOURIST/TRAVEL AGENCY', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.bluedanubeholidays.com', NULL, 3576),
(600, NULL, NULL, 'VIENNA INTERNATIONAL HOTELS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.bluedanubeholidays.com', NULL, 3576),
(601, NULL, NULL, 'DANUBIUS SPA HOTELS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.bluedanubeholidays.com', NULL, 3576),
(602, NULL, NULL, 'HUNGARIAN HOTELS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.bluedanubeholidays.com', NULL, 3576),
(604, NULL, NULL, 'GRAYLINE FRANCE', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.bluedanubeholidays.com', NULL, 3576),
(605, NULL, NULL, 'GRAYLINE AUSTRIA', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.bluedanubeholidays.com', NULL, 3576),
(606, NULL, NULL, 'GRAYLINE ITALY', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.bluedanubeholidays.com', NULL, 3576),
(607, NULL, NULL, 'GRAYLINE SPAIN', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.bluedanubeholidays.com', NULL, 3576),
(609, 'Madeline', 'Ferenzy', 'BLUE DANUBE HOLIDAYS', '80 Richmond St W', 'Toronto', 'ON', 'M5H 2A4', ' ', '4163625000', '4163628024', 'bluedanube@bluedanubeholidays.com', 'http://www.bluedanubeholidays.com', 'PGY', 3576),
(610, NULL, NULL, 'MAHART-HYDROFOIL', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.bluedanubeholidays.com', NULL, 3576),
(620, 'Susan', 'Savoie', 'GOLDEN ESCAPES', '75 The Donway W', 'Toronto', 'ON', 'M3C 2E9', ' ', '4164477683', '4164474824', 'admin@goldenescapes.com', 'http://www.goldenescapes.com', 'PGY', 3600),
(621, NULL, NULL, 'BACK ROADS TOURING COMPANY of Great Britain', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.goldenescapes.com', NULL, 3600),
(622, 'Sandra', 'Mirkovic', 'G.A.P ADVENTURES INC', 'The Great Adventure People', 'Toronto', 'ON', 'M5H 3H1', ' ', '4162600999', '4162601888', 'adventure@gap.ca', 'http://www.gap.ca', 'ACTAPGY', 3589),
(623, NULL, NULL, 'TREK AMERICA', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.gap.ca', NULL, 3589),
(624, NULL, NULL, 'EXODUS WORLDWIDE ADVENTURE HOLIDAYS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.gap.ca', NULL, 3589),
(625, NULL, NULL, 'TREK AUSTRALIA', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.gap.ca', NULL, 3589),
(626, NULL, NULL, 'INTREPID SOUTH EAST ASIA', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.gap.ca', NULL, 3589),
(627, NULL, NULL, 'GUERBA EXPEDITIONS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.gap.ca', NULL, 3589),
(628, NULL, NULL, 'AMADABLAM ADVENTURES', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.gap.ca', NULL, 3589),
(639, 'Paul', 'Chu', 'CHINA TRAVEL SERVICE (CANADA) INC', '556 W Broadway', 'Vancouver', 'BC', 'V5Z 1E9', ' ', '6048728787', '6048732823', ' ', ' ', 'ACTAPGY', 3622),
(641, 'Paul', 'Chu', 'CHINA TRAVEL AIR SERVICE HONG KONG LTD.', '556 W Broadway', 'Vancouver', 'BC', 'V5Z 1E9', ' ', '6048728787', '6048732823', ' ', ' ', NULL, 3622),
(642, 'Paul', 'Chu', 'SHENZHEN AIRLINE CHINA', '556 W Broadway', 'Vancouver', 'BC', 'V5Z 1E9', ' ', '6048728787', '6048732823', ' ', ' ', NULL, 3622),
(644, 'Paul', 'Chu', 'YANGTZE RIVER SPLENDID CHINA CRUISE LTD.', '556 W Broadway', 'Vancouver', 'BC', 'V5Z 1E9', ' ', '6048728787', '6048732823', ' ', ' ', NULL, 3622),
(646, 'Paul', 'Chu', 'CHINA TRAVEL HOTEL MANAGEMENT SERVICES HONG KONG LTD.', '556 W Broadway', 'Vancouver', 'BC', 'V5Z 1E9', ' ', '6048728787', '6048732823', ' ', ' ', NULL, 3622),
(648, 'Paul', 'Chu', 'CHINA NATIONAL RAILWAY', '556 W Broadway', 'Vancouver', 'BC', 'V5Z 1E9', ' ', '6048728787', '6048732823', ' ', ' ', NULL, 3622),
(662, NULL, NULL, 'CUNARD LINES', '6100 Blue Lagoon Drive', 'Miami', 'FL', '33126', ' ', '8007286273', NULL, ' ', 'http://www.cunard.com', 'ACTAPGY', 3650),
(681, 'Nigel', 'Wood', 'TRAVEL STUDIO', 'Suite 890', 'Vancouver', 'BC', 'V6C 1N5', ' ', '8005656670', '8006652998', 'tsyvr@baxter.net', 'http://www.travelstudio.com', NULL, 4196),
(683, NULL, NULL, 'ROVOS RAIL - SOUTH AFRICA', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.travelstudio.com', NULL, 4196),
(684, NULL, NULL, 'BLUE TRAIN - SOUTH AFRICA', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.travelstudio.com', NULL, 4196),
(706, 'Randy', 'Anger', 'ANHEUSER-BUSCH ADVENTURE PARKS', '358 Broadway Ave', 'Toronto', 'ON', 'M4P 1X2', ' ', '4164839410', '4164835982', ' ', ' ', 'PGY', 5081),
(707, NULL, NULL, 'BUSCH GARDENS TAMPA BAY, FLORIDA', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 5081),
(708, NULL, NULL, 'ADVENTURE ISLAND TAMPA BAY, FLORIDA', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 5081),
(709, NULL, NULL, 'SESAME PLACE, LANGHORNE PENNSYLVANIA', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 5081),
(710, NULL, NULL, 'SEAWORLD ADVENTURE PARK, ORLANDO FLORIDA', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 5081),
(711, NULL, NULL, 'SEAWORLD ADVENTURE PARK, CLEVELAND OHIO', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 5081),
(712, NULL, NULL, 'SEAWORLD ADVENTURE PARK, SAN DIEGO CALIFORNIA', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 5081),
(713, NULL, NULL, 'BUSCH GARDENS, WILLIAMSBURG VIRGINIA', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 5081),
(714, NULL, NULL, 'WATER COUNTRY USA, WILLIAMSBURG VIRGINIA', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 5081),
(715, NULL, NULL, 'SEAWORLD ADVENTURE PARK, SAN ANTONIO TEXAS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 5081),
(716, NULL, NULL, 'DISCOVERY COVE, ORLANDO FLORIDA', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 5081),
(726, 'Maybelle', 'Ravin', 'THE RMR GROUP INC', 'Taurus House', 'Toronto', 'ON', 'M4R 2E3', ' ', '4164858724', '4164858256', 'assoc@thermrgroup.ca', 'http://www.thermrgroup.ca', 'PGY', 5228),
(727, 'Maybelle', 'Ravin', 'KLM uk/buzz', 'Taurus House', 'Toronto', 'ON', 'M4R 2E3', ' ', '4164858724', '4164858256', 'assoc@thermrgroup.ca', 'http://www.thermrgroup.ca', 'PGY', 5228),
(728, 'Jackie', 'Lutz', 'THE RMR GROUP INC', 'Taurus House', 'Toronto', 'ON', 'M4R 2E3', ' ', '4164844864', '4164858256', 'assoc@thermrgroup.ca', 'http://www.thermrgroup.ca', 'PGY', 5228),
(733, 'Lourdes', 'Freire', 'SKYWAYS INTERNATIONAL', '486 College St', 'Toronto', 'ON', 'M6G 1A4', ' ', '4169238949', '4169601339', 'skyways@netcom.ca', 'http://www.addictravel.com', 'PGY', 5492),
(734, 'Lourdes', 'Freire', 'AEROCONTINENTE (CODE N6) PERUVIAN AIRLINES', '486 College St', 'Toronto', 'ON', 'M6G 1A4', ' ', '4169238949', '4169601339', 'skyways@netcom.ca', 'http://www.addictravel.com', 'PGY', 5492),
(739, 'Hope', 'Burridge', 'TRAVEL BY RAIL', '34 Flintridge Rd', 'Toronto (Scarborough)', 'ON', 'M1P 1G3', ' ', '4167010756', '4167010751', 'travelbyrail@hotmail.com', 'http://www.travelbyrail.com', 'PGY', 5777),
(740, NULL, NULL, 'BAUDHHA PARIKRAMA EXPRESS - INDIA', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.travelbyrail.com', NULL, 5777),
(741, NULL, NULL, 'PALACE ON WHEELS - INDIA', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.travelbyrail.com', NULL, 5777),
(742, NULL, NULL, 'ROYAL ORIENT - INDIA', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.travelbyrail.com', NULL, 5777),
(743, NULL, NULL, 'RAZDAN HOLIDAYS (INDIA)', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.travelbyrail.com', NULL, 5777),
(744, 'Paulo', 'Karbach', 'REPWORLD INC', '409-1200 W Pender St', 'Vancouver', 'BC', 'V6E 2S9', ' ', '6046837824', '6046837819', ' ', ' ', 'ACTAPGY', 5796),
(745, 'Paulo', 'Karbach', 'LTU INTERNATIONAL AIRWAYS', '409-1200 W Pender St', 'Vancouver', 'BC', 'V6E 2S9', ' ', '6046837824', '6046837819', ' ', ' ', NULL, 5796),
(746, 'Paulo', 'Karbach', 'LLOYD AEREO BOLIVIANO', '409-1200 W Pender St', 'Vancouver', 'BC', 'V6E 2S9', ' ', '6046837824', '6046837819', ' ', ' ', NULL, 5796),
(747, 'Paulo', 'Karbach', 'ACES (Aerolineas Centrales De Colombia S.A.)', '409-1200 W Pender St', 'Vancouver', 'BC', 'V6E 2S9', ' ', '6046837824', '6046837819', ' ', ' ', NULL, 5796),
(748, 'Paulo', 'Karbach', 'HARBOUR AIR SEAPLANES', '4760 Inglis Dr', 'Richmond', 'BC', 'V7B 1W4', ' ', '6042783478', '6042789897', ' ', ' ', NULL, 5796),
(749, 'Paulo', 'Karbach', 'HELIUSA', '409-1200 W Pender St', 'Vancouver', 'BC', 'V6E 2S9', ' ', '6046837824', '6046837819', ' ', ' ', NULL, 5796),
(750, 'Paulo', 'Karbach', 'ECUATORIANA', '409-1200 W Pender St', 'Vancouver', 'BC', 'V6E 2S9', ' ', '6046837824', '6046837819', ' ', ' ', NULL, 5796),
(751, 'Paulo', 'Karbach', 'SRI LANKAN AIRLINES', '409-1200 W Pender St', 'Vancouver', 'BC', 'V6E 2S9', ' ', '6046837824', '6046837819', ' ', ' ', NULL, 5796),
(752, 'Paulo', 'Karbach', 'AERO CALIFORNIA', '409-1200 W Pender St', 'Vancouver', 'BC', 'V6E 2S9', ' ', '6046837824', '6046837819', ' ', ' ', NULL, 5796),
(753, 'Paulo', 'Karbach', 'LAUDA AIR', '409-1200 W Pender St', 'Vancouver', 'BC', 'V6E 2S9', ' ', '6046837824', '6046837819', ' ', ' ', NULL, 5796),
(754, 'Paulo', 'Karbach', 'SURINAM AIRWAYS', '409-1200 W Pender St', 'Vancouver', 'BC', 'V6E 2S9', ' ', '6046837824', '6046837819', ' ', ' ', NULL, 5796),
(755, 'Paulo', 'Karbach', 'ETHIOPIAN AIRLINES', '409-1200 W Pender St', 'Vancouver', 'BC', 'V6E 2S9', ' ', '6046837824', '6046837819', ' ', ' ', NULL, 5796),
(756, 'Paulo', 'Karbach', 'ICELANDAIR', '409-1200 W Pender St', 'Vancouver', 'BC', 'V6E 2S9', ' ', '6046837824', '6046837819', ' ', ' ', NULL, 5796),
(757, 'Paulo', 'Karbach', 'MERIDIANA', '409-1200 W Pender St', 'Vancouver', 'BC', 'V6E 2S9', ' ', '6046837824', '6046837819', ' ', ' ', NULL, 5796),
(758, 'Paulo', 'Karbach', 'ASIANA AIRLINES', '409-1200 W Pender St', 'Vancouver', 'BC', 'V6E 2S9', ' ', '6046837824', '6046837819', ' ', ' ', NULL, 5796),
(759, 'Paulo', 'Karbach', 'TURKISH AIRLINES', '409-1200 W Pender St', 'Vancouver', 'BC', 'V6E 2S9', ' ', '6046837824', '6046837819', ' ', ' ', NULL, 5796),
(760, 'Paulo', 'Karbach', 'TAM BRAZILIAN AIRLINES', '409-1200 W Pender St', 'Vancouver', 'BC', 'V6E 2S9', ' ', '6046837824', '6046837819', ' ', ' ', NULL, 5796),
(761, 'Paulo', 'Karbach', 'GHANA AIRWAYS', '409-1200 W Pender St', 'Vancouver', 'BC', 'V6E 2S9', ' ', '6046837824', '6046837819', ' ', ' ', NULL, 5796),
(764, 'Tina', 'Myers', 'RESORT MARKETING INC', '19495 Biscayne Blvd', 'Aventura', 'FL', '33180-2', 'USA', '8004320221', '3059320023', 'radcblebch@aol.com', 'http://www.radisson.com/nassaubs', 'ACTAPGY', 5827),
(765, 'Tina', 'Myers', 'RESORT MARKETING', '19495 Biscayne Blvd', 'Aventura', 'FL', '33180-2', 'USA', '8004320221', '3059320023', 'radcblebch@aol.com', 'http://www.radisson.com/nassaubs', 'ACTAPGY', 5827),
(766, NULL, NULL, 'RADISSON CABLE BEACH RESORT', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 5827),
(767, 'Catherine', 'Evans', 'TOURS OF EXPLORATION', 'PO Box 48225', 'Vancouver', 'BC', 'V7X 1N8', ' ', '6048867300', '6048867304', 'info@toursexplore.com', 'http://www.toursexplore.com', 'PGY', 5857),
(768, NULL, NULL, 'DIRECTIONS IN TRVL SPECIALTY TRS INC', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.toursexplore.com', NULL, 5857),
(769, 'Gary', 'Murtagh', 'PASSAGES EXPEDITIONS', '597 Markham St', 'Toronto', 'ON', 'M6G 2L7', ' ', '4165885000', '4165889839', 'eldertreks@eldertreks.com', 'http://www.eldertreks.com', 'PGY', 6346),
(770, 'Gary', 'Murtagh', 'ELDERTREKS', '597 Markham St', 'Toronto', 'ON', 'M6G 2L7', ' ', '4165885000', '4165889839', 'eldertreks@eldertreks.com', 'http://www.eldertreks.com', 'PGY', 6346),
(776, 'Nilufer', 'Mama', 'GULF AIR', '77 Bloor St W', 'Toronto', 'ON', 'M5S 1M2', ' ', '4169664853', '4169668924', 'info@twai-canada.com', 'http://www.twai-canada.com', NULL, 6505),
(777, 'Nilufer', 'Mama', 'AEROMAR', '77 Bloor St W', 'Toronto', 'ON', 'M5S 1M2', ' ', '4169664853', '4169668924', 'info@twai-canada.com', 'http://www.twai-canada.com', NULL, 6505),
(778, 'Nilufer', 'Mama', 'AERO ASIA', '77 Bloor St W', 'Toronto', 'ON', 'M5S 1M2', ' ', '4169664853', '4169668924', 'info@twai-canada.com', 'http://www.twai-canada.com', NULL, 6505),
(779, 'Nilufer', 'Mama', 'JET AIRWAYS', '77 Bloor St W', 'Toronto', 'ON', 'M5S 1M2', ' ', '4169664853', '4169668924', 'info@twai-canada.com', 'http://www.twai-canada.com', NULL, 6505),
(780, 'Nilufer', 'Mama', 'TRADE WINDS ASSOCIATES CANADA INC', '77 Bloor St W', 'Toronto', 'ON', 'M5S 1M2', ' ', '4169664853', '4169668924', 'info@twai-canada.com', 'http://www.twai-canada.com', 'ACTAPGY', 6505),
(781, 'D.', 'Soota', 'LTI TOURS', '719 Yonge St', 'Toronto', 'ON', 'M4Y 2B5', ' ', '4169629661', '4169625910', 'info@ltitours.com', 'http://www.ltitours.com', 'PGY', 6550),
(783, NULL, NULL, 'EASTERN & ORIENTAL EXPRESS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.ltitours.com', NULL, 6550),
(784, NULL, NULL, 'PALACE ON WHEELS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.ltitours.com', NULL, 6550),
(786, 'Ashraf', 'Khan', 'BIMAN BANGLADESH AIRLINES', '206 Bloor St W', 'Toronto', 'ON', 'M5S IT8', ' ', '4169200110', '4169209598', ' ', ' ', 'PGY', 6873),
(788, 'Ashraf', 'Khan', 'AIR EXPRESS TRAVEL INC', '206 Bloor St W', 'Toronto', 'ON', 'M5S IT8', ' ', '4169200110', '4169209598', ' ', ' ', 'PGY', 6873),
(822, 'Rosie', 'Melkonian', 'WORLD ACCESS MARKETING', '33 Blue Ridge Rd', 'Toronto (North York)', 'ON', 'M2K 1R8', ' ', '4162235506', '4162220319', 'reservations@outrigger.com', ' ', 'PGY', 7244),
(823, 'Rosie', 'Melkonian', 'OUTRIGGER HOTELS & RESORTS', '33 Blue Ridge Rd', 'Toronto (North York)', 'ON', 'M2K 1R8', ' ', '4162235506', '4162220319', 'reservations@outrigger.com', ' ', 'PGY', 7244),
(825, NULL, NULL, 'BALKAN AIRLINES', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 7377),
(826, 'Subash', 'Chauhan', 'MAJESTIC TOURS', '545 N Rivermede Rd', 'Concord', 'ON', 'L4K 4H1', ' ', '9056604704', '9056603055', ' ', ' ', 'PGY', 7377),
(834, 'Robert', 'Townshend', 'MUSTIQUE AIRWAYS', '2011 Lawrence Ave W', 'Toronto', 'ON', 'M9N 3V3', ' ', '4162407700', '4162407701', 'travel@totaladvantage.com', ' ', 'PGY', 11160),
(835, 'Robert', 'Townshend', 'TOTAL ADVANTAGE TRAVEL & TOURS INC', '2011 Lawrence Ave W', 'Toronto', 'ON', 'M9N 3V3', ' ', '4162407700', '4162407701', 'travel@totaladvantage.com', ' ', 'PGY', 11160),
(839, 'Mary', 'Warner', 'EXCLUSIVE TOURS', '145 King St W', 'Toronto', 'ON', 'M5H 1J8', ' ', '4163688558', '4169559869', 'et@merit.ca', ' ', 'PGY', 8089),
(840, NULL, NULL, 'DANUBE CRUISES', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 8089),
(841, NULL, NULL, 'CONTINENTAL WATERWAYS - HOTEL BARGE CRUISES', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 8089),
(842, NULL, NULL, 'VIKING RIVER CRUISES', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 8089),
(843, NULL, NULL, 'BARGE CANAL & RIVER CRUISES EUROPE', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 8089),
(845, NULL, NULL, 'EUROPEAN WATERWAYS/LUXURY EUROPEAN BARGE CRUISES', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 8089),
(846, NULL, NULL, 'PETER DEILMANN EUROPAMERICA CRUISES:', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 8089),
(849, NULL, NULL, 'UNIWORLD EUROPE RIVER CRUISES & WATERWAYS OF RUSSIA', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 8089),
(862, 'Ross', 'de Gregorio', 'MANDITOURS - ITALY', '9625 Yonge St', 'Richmond Hill', 'ON', 'L4C 5T2', ' ', '9055088190', '9057372978', 'mandi@italia-magica.com', ' ', 'PGY', 9785),
(867, 'Stephen', 'Yo', 'KINTETSU INTERNATIONAL EXPRESS', '1550 Enterprises Rd', 'Mississauga', 'ON', 'L4W 4P4', ' ', '9056708710', '9056702238', 'outbound@kiecan.com', 'http://www.kiecan.com/outbound', 'PGY', 9766),
(868, 'Stephen', 'Yo', 'JAPAN RAIL PASS', '1550 Enterprises Rd', 'Mississauga', 'ON', 'L4W 4P4', ' ', '9056708710', '9056702238', 'outbound@kiecan.com', 'http://www.kiecan.com/outbound', 'PGY', 9766),
(872, 'Timo', 'Jokinen', 'SCANDITOURS', '191 Eglinton Ave E', 'Toronto', 'ON', 'M4P 1K1', ' ', '4164823006', '4164829447', 'toronto@scanditours.com', 'http://www.scanditours.com', 'PGY', 8837),
(873, NULL, NULL, 'STENA LINE (GSA CANADA)', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.scanditours.com', NULL, 8837),
(874, NULL, NULL, 'GOTA CANAL (GSA CANADA)', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.scanditours.com', NULL, 8837),
(875, NULL, NULL, 'DFDS SEAWAYS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.scanditours.com', NULL, 8837),
(876, NULL, NULL, 'VIKING LINE (GSA CANADA)', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.scanditours.com', NULL, 8837),
(877, NULL, NULL, 'ESTLINE', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.scanditours.com', NULL, 8837),
(878, NULL, NULL, 'FRED OLSEN LINE (GSA CANADA)', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.scanditours.com', NULL, 8837),
(886, 'Vonna', 'McDonald', 'BONAVENTURE TOURS', '205-221 W Esplanade', 'N Vancouver', 'BC', 'V7M 3J3', ' ', '6049907390', '6049907394', 'info@bonaventuretours.com', 'http://www.bonaventuretours.com', 'PGY', 9323),
(887, 'Vonna', 'McDonald', 'BONAVENTURE TOURS - UK & IRELAND - CANAL BOAT CHARTERS', '205-221 W Esplanade', 'N Vancouver', 'BC', 'V7M 3J3', ' ', '6049907390', '6049907394', 'info@bonaventuretours.com', 'http://www.bonaventuretours.com', 'PGY', 9323),
(888, 'Jim', 'Cohen', 'HOTELINK', '1027 Yonge St', 'Toronto', 'ON', 'M4W 2K9', ' ', '4169232003', '4169442245', 'info@skylinkholidays.com', ' ', 'PGY', 9396),
(895, 'Mari', 'Abe', 'JTB INTERNATIONAL (CANADA) LTD', '77 King St W', 'Toronto', 'ON', 'M5K 1E7', ' ', '4163675824', '4163674859', 'sales@jtbcnd.com', ' ', 'PGY', 9285),
(897, 'Mari', 'Abe', 'JAPAN RAIL PASS', '77 King St W', 'Toronto', 'ON', 'M5K 1E7', ' ', '4163675824', '4163674859', 'sales@jtbcnd.com', ' ', 'PGY', 9285),
(899, 'Mari', 'Abe', 'SUNRISE TOURS', '77 King St W', 'Toronto', 'ON', 'M5K 1E7', ' ', '4163675824', '4163674859', 'sales@jtbcnd.com', ' ', 'PGY', 9285),
(908, 'Eric', 'Douay', 'D-TOUR MARKETING', '625 W Rene Levesque Blvd', 'Montreal', 'PQ', 'H3B 1R2', ' ', '5143939585', '5143939029', 'dtour.marketing@planetepc.qc.ca', 'http://www.dtourmarketing.com', 'PGY', 11163),
(909, 'Eric', 'Douay', 'RIVAGES CROISIERES THE CARIBBEAN INTIMATE YACHT CRUISES', '625 W Rene Levesque Blvd', 'Montreal', 'PQ', 'H3B 1R2', ' ', '5143939585', '5143939029', 'dtour.marketing@planetepc.qc.ca', 'http://www.dtourmarketin', NULL, 11163),
(910, 'Eric', 'Douay', 'CONCORDE HOTELS (WORLDWIDE)', '625 W Rene Levesque Blvd', 'Montreal', 'PQ', 'H3B 1R2', ' ', '5143939585', '5143939029', 'dtour.marketing@planetepc.qc.ca', 'http://www.dtourmarketing.com', 'PGY', 11163),
(911, 'Eric', 'Douay', 'PRIMEREVE ''ALL-SUITE'' HOTEL (Martinique)', '625 W Rene Levesque Blvd', 'Montreal', 'PQ', 'H3B 1R2', ' ', '5143939585', '5143939029', 'dtour.marketing@planetepc.qc.ca', 'http://www.dtourmarketing.com', 'PGY', 11163),
(912, 'Eric', 'Douay', 'CHATEAUX & HOTELS DE FRANCE', '625 W Rene Levesque Blvd', 'Montreal', 'PQ', 'H3B 1R2', ' ', '5143939585', '5143939029', 'dtour.marketing@planetepc.qc.ca', 'http://www.dtourmarketing.com', 'PGY', 11163),
(913, 'Michael', 'Merrithew', 'MERIT TRAVEL GROUP INC', '145 King St W', 'Toronto', 'ON', 'M5H 1J8', ' ', '4163688558', '4169559869', 'golf@merit.ca', ' ', 'PGY', 11172),
(914, 'Michael', 'Merrithew', 'GOLF HOLIDAYS', '145 King St W', 'Toronto', 'ON', 'M5H 1J8', ' ', '4163688558', '4169559869', 'golf@merit.ca', ' ', 'PGY', 11172),
(938, 'Hugo', 'Maggi', 'GRUPO TACA', '1235 Bay St', 'Toronto', 'ON', 'M5R 3K4', ' ', '4169682222', '4169680363', ' ', 'http://www.grupotaca.com', 'PGY', 11174),
(939, NULL, NULL, 'LACSA AIRLINES OF COSTA RICA', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 11174),
(942, 'Loreen', 'Walter', 'DKM COACH LINES LTD', '1908 Spruce Hill Rd', 'Pickering', 'ON', 'L1V 1S7', ' ', '4164104680', '4168313384', 'dkmcl@home.com', 'http://www.dkmtravel.com', 'PGY', 11237),
(943, NULL, NULL, 'CASINO DIRECT', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 11237),
(957, NULL, NULL, 'ALITOURS CAR RENTAL BY HERTZ', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 11156);
INSERT INTO `suppliercontacts` (`SupplierContactId`, `SupConFirstName`, `SupConLastName`, `SupConCompany`, `SupConAddress`, `SupConCity`, `SupConProv`, `SupConPostal`, `SupConCountry`, `SupConBusPhone`, `SupConFax`, `SupConEmail`, `SupConURL`, `AffiliationId`, `SupplierId`) VALUES
(958, 'Tony', 'Veca', 'ALITOURS INTERNATIONAL INC.', '792 St. Clair Ave W', 'Toronto', 'ON', 'M6C 1B6', ' ', '4166537751', '4166539010', 'alitours@baxter.net', 'http://www.alitours.com', 'PGY', 11156),
(1113, 'Cindy', ' Harris', 'TRANS SIBERIAN RAILWAY', '1847 W 4th Ave', 'Vancouver', 'BC', 'V6J 1M4', ' ', '6046061830', '6047378854', 'adventure@freshtracks.com', 'http://www.goactivevacations.com', 'PGY', 11549),
(1114, 'Cindy', ' Harris', 'GO ACTIVE VACATIONS', '1847 W 4th Ave', 'Vancouver', 'BC', 'V6J 1M4', ' ', '6046061830', '6047378854', 'team@goactivevacations.com', 'http://www.goactivevacations.com', 'PGY', 11549),
(1115, 'Cindy', ' Harris', 'FRESH TRACKS CANADA', '1847 W 4th Ave', 'Vancouver', 'BC', 'V6J 1M4', ' ', '6047378743', '6047185110', 'adventure@freshtracks.com', 'http://www.goactivevacations.com', 'PGY', 11549),
(1126, 'Bashiruddin', 'Ahmed', 'SAAAI TRAVEL INC.', '1410 Guy St', 'Montreal', 'PQ', 'H3H 2L7', ' ', '5149311100', '5149311200', 'saaaitravel@sympatico.ca', ' ', 'PGY', 12657),
(1127, 'Bashiruddin', 'Ahmed', 'BIMAN BANGLADESH AIRLINES', '1410 Guy St', 'Montreal', 'PQ', 'H3H 2L7', ' ', '5149311100', '5149311200', 'saaaitravel@sympatico.ca', ' ', 'PGY', 12657),
(1128, 'Bashiruddin', 'Ahmed', 'SAAAI TRAVEL', '1410 Guy St', 'Montreal', 'PQ', 'H3H 2L7', ' ', '5149314070', '5149339992', 'saaaitravel@sympatico.ca', ' ', 'PGY', 12657),
(1129, 'Bashiruddin', 'Ahmed', 'S.I. TRAVELS', '1410 Guy St', 'Montreal', 'PQ', 'H3H 2L7', ' ', '5149314070', '5149339992', 'saaaitravel@sympatico.ca', ' ', 'PGY', 12657),
(1158, 'Kristin', 'Karbach', 'A & TIC SUPPORT INC.', '80 John Stiver Cres', 'Markham', 'ON', 'L3R 9B3', ' ', '9059439763', '9059439764', 'elcotour-na@netcom.ca', ' ', 'PGY', 13596),
(1159, 'Kristin', 'Karbach', 'ELCOTOUR - BRAZIL TOUR SPECIALISTS', '80 John Stiver Cres', 'Markham', 'ON', 'L3R 9B3', ' ', '9059439763', '9059439764', 'elcotour-na@netcom.ca', ' ', 'PGY', 13596),
(1164, 'Cyril', 'Figgis', 'SAIT', '123 fake st.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1165, 'Cyril', 'Figgis', 'SAIT', '123 fake st.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1166, 'Cyril', 'Figgis', 'SAIT', '123 fake st.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE IF NOT EXISTS `suppliers` (
  `SupplierId` int(11) NOT NULL AUTO_INCREMENT,
  `SupName` text,
  PRIMARY KEY (`SupplierId`),
  KEY `SupplierId` (`SupplierId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13600 ;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`SupplierId`, `SupName`) VALUES
(69, 'NEW CONCEPTS - CANADA'),
(80, 'CHAT / TRAVELINE'),
(100, 'AVILA TOURS INC.'),
(317, 'BLYTH & COMPANY TRAVEL'),
(323, 'COMPAGNIA ITALIANA TURISM'),
(796, 'CYPRUS AIRWAYS LTD'),
(828, 'DER TRAVEL SERVICE LTD'),
(845, 'DISCOVER THE WORLD MARKET'),
(908, 'ELITE ORIENT TOURS INC.'),
(1005, 'ENCORE CRUISES'),
(1028, 'EUROP-AUTO-VACANCES/HOLIDAYS'),
(1040, 'EXECUTIVE SUITES'),
(1205, 'GOLDMAN MARKETING'),
(1406, 'EUROCRUISES INC.'),
(1416, 'THE HOLIDAY NETWORK'),
(1425, 'HOLLAND AMERICA LINE WEST'),
(1542, 'INSIGHT VACATIONS CANADA'),
(1620, 'INTAIR VACATIONS'),
(1634, 'ISLANDS IN THE SUN CRUISE'),
(1685, 'GOWAY TRAVEL LTD.'),
(1713, 'JETPACIFIC HOLIDAYS INC'),
(1766, 'KLM ROYAL DUTCH AIRLINES'),
(1859, 'LOTUS HOLIDAYS'),
(1918, 'MARKET SQUARE TOURS'),
(2140, 'NAGEL TOURS LTD'),
(2386, 'PAVLIK TRAVEL GROUP'),
(2466, 'PLANET FRANCE/PLANET EURO'),
(2588, 'UNIQUE VACATIONS (CANADA)'),
(2592, 'ESPRIT/SERVICENTRE HOLIDAYS'),
(2827, 'SOUTH WIND TOURS LTD.'),
(2938, 'SUN & LEISURE TRAVEL CORP.'),
(2987, 'TOURCAN VACATIONS INC'),
(2998, 'ALIOTOURS'),
(3119, 'MEDIAN AVIATION RESOURCES'),
(3212, 'TREK HOLIDAYS'),
(3273, 'MARKETING AHEAD'),
(3376, 'MARTINAIR SERVICES'),
(3549, 'BONANZA HOLIDAYS'),
(3576, 'BLUE DANUBE HOLIDAYS'),
(3589, 'G.A.P ADVENTURES INC.'),
(3600, 'GOLDEN ESCAPES'),
(3622, 'CHINA TRAVEL SERVICE (CAN)'),
(3633, 'VIP INTERNATIONAL'),
(3650, 'CUNARD LINES'),
(4196, 'TRAVEL STUDIO'),
(5081, 'ANHEUSER-BUSCH ADVENTURE'),
(5228, 'THE RMR GROUP INC'),
(5492, 'SKYWAYS INTERNATIONAL'),
(5777, 'TRAVEL BY RAIL'),
(5796, 'REPWORLD INC.'),
(5827, 'RESORT MARKETING INC'),
(5857, 'TOURS OF EXPLORATION'),
(6346, 'PASSAGES EXPEDITIONS'),
(6505, 'TRADE WINDS ASSOCIATES'),
(6550, 'LTI TOURS'),
(6873, 'BIMAN BANGLADESH AIRLINES'),
(7244, 'WORLD ACCESS MARKETING'),
(7377, 'MAJESTIC TOURS'),
(8089, 'EXCLUSIVE TOURS'),
(8837, 'SCANDITOURS'),
(9285, 'JTB INTERNATIONAL (CANADA)'),
(9323, 'BONAVE'),
(9396, 'SKYLINK TICKET CENTRE'),
(9766, 'KINTETSU INTERNATIONAL'),
(9785, 'MANDITOURS INTL INC.'),
(11156, 'ALITOURS INTERNATIONAL INC.'),
(11160, 'TOTAL ADVANTAGE TRAVEL'),
(11163, 'D-TOUR MARKETING'),
(11172, 'MERIT TRAVEL GROUP INC.'),
(11174, 'GRUPO TACA'),
(11237, 'DKM COACH LINES LTD'),
(11549, 'GO ACTIVE VACATIONS'),
(12657, 'SAAAI TRAVEL INC.'),
(13596, 'A & TIC SUPPORT INC.'),
(13597, 'Emile'),
(13598, 'Royal'),
(13599, 'Royal');

-- --------------------------------------------------------

--
-- Table structure for table `triptypes`
--

CREATE TABLE IF NOT EXISTS `triptypes` (
  `TripTypeId` varchar(1) NOT NULL,
  `TTName` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`TripTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `triptypes`
--

INSERT INTO `triptypes` (`TripTypeId`, `TTName`) VALUES
('B', 'Business                 '),
('G', 'Group                    '),
('L', 'Leisure                  ');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
