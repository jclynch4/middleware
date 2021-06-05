CREATE TABLE IF NOT EXISTS `applicants` (
  `Username` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `First Name` varchar(50) NOT NULL,
  `Last Name` varchar(50) NOT NULL,
  `Gender` varchar(6) NOT NULL,
  `Date Of Birth` date NOT NULL,
  `Address` varchar(100) NOT NULL,
  `City` varchar(50) NOT NULL,
  `State` varchar(50) NOT NULL,
  `Zip Code` int NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Phone Number` int NOT NULL,
  `Country Of Origin` varchar(50) NOT NULL,
  `ID` int NOT NULL,
  KEY `ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `customers` (
  `Customer ID` int NOT NULL,
  `Address` varchar(50) NOT NULL,
  `Customer Name` varchar(50) NOT NULL,
  `Customer Last Name` varchar(50) NOT NULL,
  PRIMARY KEY (`Customer ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `employees` (
  `Username` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `First Name` varchar(50) NOT NULL,
  `Last Name` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `ID` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE IF NOT EXISTS `reservation` (
  `Check In Date` date NOT NULL,
  `Check Out Date` date NOT NULL,
  `Room Number` int NOT NULL,
  `Customer ID` int NOT NULL,
  `Reservation ID` int NOT NULL,
  `ID` int NOT NULL,
  PRIMARY KEY (`Reservation ID`),
  KEY `Room Number` (`Room Number`,`Customer ID`),
  KEY `reservation_ibfk_1` (`Customer ID`),
  KEY `ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `rooms` (
  `Room Number` int NOT NULL,
  `Floor` int NOT NULL,
  `No Of Beds` int NOT NULL,
  `Cost Per Night` int NOT NULL,
  `Room Service` int NOT NULL,
  PRIMARY KEY (`Room Number`),
  KEY `Room Service` (`Room Service`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Constraints for table `applicants`

ALTER TABLE `applicants`
  ADD CONSTRAINT `applicants_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `employees` (`ID`),
  ADD CONSTRAINT `applicants_ibfk_2` FOREIGN KEY (`ID`) REFERENCES `employees` (`ID`),
  ADD CONSTRAINT `applicants_ibfk_3` FOREIGN KEY (`ID`) REFERENCES `employees` (`ID`);

-- Constraints for table `reservation`

ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`Customer ID`) REFERENCES `customers` (`Customer ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`Room Number`) REFERENCES `rooms` (`Room Number`) ON DELETE CASCADE,
  ADD CONSTRAINT `reservation_ibfk_3` FOREIGN KEY (`ID`) REFERENCES `employees` (`ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `reservation_ibfk_4` FOREIGN KEY (`Customer ID`) REFERENCES `customers` (`Customer ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `reservation_ibfk_5` FOREIGN KEY (`Room Number`) REFERENCES `rooms` (`Room Number`) ON DELETE CASCADE,
  ADD CONSTRAINT `reservation_ibfk_6` FOREIGN KEY (`ID`) REFERENCES `employees` (`ID`) ON DELETE CASCADE;
COMMIT;
