
--
-- Database: `bankanalysis`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `CATG_KEY` int(11) NOT NULL AUTO_INCREMENT,
  `CATEGORY` text NOT NULL,
  PRIMARY KEY (`CATG_KEY`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`CATG_KEY`, `CATEGORY`) VALUES
(1, 'ATMWID'),
(2, 'BANKFEE'),
(3, 'BANKINT'),
(4, 'BSNL'),
(5, 'CABLE-DTH'),
(6, 'CLOTHING'),
(7, 'DIVIDEND'),
(8, 'ENTERTAIN'),
(9, 'GROCERY'),
(10, 'HEALTH'),
(11, 'INSU-LIC'),
(12, 'LOAN'),
(13, 'MISC'),
(14, 'MISC-EXP'),
(15, 'MISC-INC'),
(16, 'MISC-REFUND'),
(17, 'MOBILE'),
(18, 'PROPERTYTAX'),
(19, 'SALARY'),
(20, 'SAVING'),
(21, 'SAVING-RD'),
(22, 'SHAREKHAN'),
(23, 'TNEB'),
(24, 'USTAX'),
(25, 'WATERTAX');

-- --------------------------------------------------------

--
-- Table structure for table `transactiondetails`
--

CREATE TABLE IF NOT EXISTS `transactiondetails` (
  `TRAN_KEY` double NOT NULL AUTO_INCREMENT,
  `VALUE_DT` date NOT NULL,
  `TRAN_DT` date NOT NULL,
  `REMARK` text NOT NULL,
  `TYPE` text NOT NULL,
  `AMT` double NOT NULL,
  `BALANCE` double NOT NULL,
  `CATEGORY` text NOT NULL,
  `INS_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`TRAN_KEY`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=174 ;

--
-- Dumping data for table `transactiondetails`
--

INSERT INTO `transactiondetails` (`TRAN_KEY`, `VALUE_DT`, `TRAN_DT`, `REMARK`, `TYPE`, `AMT`, `BALANCE`, `CATEGORY`, `INS_TS`) VALUES
(168, '2014-12-31', '2014-12-31', 'Salary', 'CR', 2000, 5000, 'MISC', '2015-03-17 05:46:22'),
(169, '2015-01-01', '2015-01-01', 'Electriciy', 'DB', 197, 4803, 'TNEB', '2015-03-17 05:46:22'),
(170, '2015-01-01', '2015-01-01', 'Interest', 'CR', 20, 4823, 'BANKINT', '2015-03-17 05:46:22'),
(171, '2015-01-02', '2015-01-02', 'Bill002', 'DB', 2070, 2753, 'CABLE-DTH', '2015-03-17 05:46:23'),
(172, '2015-01-02', '2015-01-02', 'Bill003', 'DB', 640, 2113, 'GROCERY', '2015-03-17 05:46:23'),
(173, '2015-01-02', '2015-01-02', 'BIL/00070', 'DB', 812, 1301, 'BSNL', '2015-03-17 05:46:23');
