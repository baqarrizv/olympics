-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 02, 2019 at 07:15 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hascol_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `sma_adjustments`
--

CREATE TABLE `sma_adjustments` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_adjustments`
--

INSERT INTO `sma_adjustments` (`id`, `date`, `product_id`, `option_id`, `quantity`, `warehouse_id`, `note`, `created_by`, `updated_by`, `type`) VALUES
(1, '2017-11-03 22:30:00', 1, NULL, '10.0000', 1, '&lt;p&gt;jjj&lt;&sol;p&gt;', 1, NULL, 'addition'),
(2, '2017-11-09 16:50:00', 1, NULL, '100.0000', 3, '&lt;p&gt;asd&lt;&sol;p&gt;', 1, NULL, 'addition'),
(3, '2017-11-08 19:55:00', 1, NULL, '1000.0000', 1, '&lt;p&gt;yes&lt;&sol;p&gt;', 1, NULL, 'addition'),
(4, '2017-11-09 02:00:00', 1, NULL, '507.0000', 1, '&lt;p&gt;Clearing Garbage&lt;&sol;p&gt;', 1, NULL, 'subtraction'),
(5, '2017-11-09 02:01:00', 7, NULL, '9001.0000', 1, '&lt;p&gt;Important&lt;&sol;p&gt;', 1, NULL, 'subtraction'),
(6, '2017-11-09 02:02:00', 6, NULL, '99000.0000', 1, '&lt;p&gt;Big one&lt;&sol;p&gt;', 1, NULL, 'subtraction'),
(7, '2018-01-22 17:10:00', 12, NULL, '10.0000', 1, '&lt;p&gt;asd&lt;&sol;p&gt;', 1, NULL, 'addition'),
(8, '2018-01-22 17:15:00', 13, NULL, '10.0000', 2, '&lt;p&gt;asdasd&lt;&sol;p&gt;', 1, 1, 'addition'),
(9, '2018-01-22 17:15:00', 14, NULL, '10.0000', 1, '&lt;p&gt;asdasdasd&lt;&sol;p&gt;', 1, NULL, 'addition');

-- --------------------------------------------------------

--
-- Table structure for table `sma_calendar`
--

CREATE TABLE `sma_calendar` (
  `id` int(11) NOT NULL,
  `title` varchar(55) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `start` datetime NOT NULL,
  `end` datetime DEFAULT NULL,
  `color` varchar(7) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_captcha`
--

CREATE TABLE `sma_captcha` (
  `captcha_id` bigint(13) UNSIGNED NOT NULL,
  `captcha_time` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(16) CHARACTER SET latin1 NOT NULL DEFAULT '0',
  `word` varchar(20) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_categories`
--

CREATE TABLE `sma_categories` (
  `id` int(11) NOT NULL,
  `code` varchar(55) NOT NULL,
  `name` varchar(55) NOT NULL,
  `image` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_categories`
--

INSERT INTO `sma_categories` (`id`, `code`, `name`, `image`) VALUES
(1, 'Mobile', 'Samsung Mobile', '05d694e7cfa2b3deb1ab117a6c15bfdd.jpg'),
(2, 'C2', 'Nokia Mobile', '3d94e43d9947a6e7aad97d8fac482e7b.jpg'),
(3, 'Med', 'Medicine', NULL),
(4, 'IOL', 'IOL', NULL),
(5, 'Inst', 'Instruments', NULL),
(6, 'DC', 'Hospital Supplies (DC)', NULL),
(7, 'IC', 'Hospital Supplies (IC)', NULL),
(8, 'Equipment', 'Equipment Accessories', NULL),
(9, 'Stationery', 'Stationery', NULL),
(10, 'Computer', 'Computer Accessories', NULL),
(11, 'bar-789', 'Bar (Juices)', NULL),
(12, 'DIESEL', 'Diesel', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_combo_items`
--

CREATE TABLE `sma_combo_items` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `item_code` varchar(20) NOT NULL,
  `quantity` decimal(12,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_combo_items`
--

INSERT INTO `sma_combo_items` (`id`, `product_id`, `item_code`, `quantity`, `unit_price`) VALUES
(1, 15, 'man-8955', '1.0000', '10.0000'),
(2, 15, 'sugar-9558', '1.0000', '55.0000'),
(3, 15, 'milk-985', '1.0000', '80.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_companies`
--

CREATE TABLE `sma_companies` (
  `id` int(11) NOT NULL,
  `group_id` int(10) UNSIGNED DEFAULT NULL,
  `group_name` varchar(20) NOT NULL,
  `customer_group_id` int(11) DEFAULT NULL,
  `customer_group_name` varchar(100) DEFAULT NULL,
  `name` varchar(55) NOT NULL,
  `company` varchar(255) NOT NULL,
  `vat_no` varchar(100) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(55) NOT NULL,
  `state` varchar(55) DEFAULT NULL,
  `postal_code` varchar(8) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `cf1` varchar(100) DEFAULT NULL,
  `cf2` varchar(100) DEFAULT NULL,
  `cf3` varchar(100) DEFAULT NULL,
  `cf4` varchar(100) DEFAULT NULL,
  `cf5` varchar(100) DEFAULT NULL,
  `cf6` varchar(100) DEFAULT NULL,
  `invoice_footer` text,
  `payment_term` int(11) DEFAULT '0',
  `logo` varchar(255) DEFAULT 'logo.png',
  `award_points` int(11) DEFAULT '0',
  `deposit_amount` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_companies`
--

INSERT INTO `sma_companies` (`id`, `group_id`, `group_name`, `customer_group_id`, `customer_group_name`, `name`, `company`, `vat_no`, `address`, `city`, `state`, `postal_code`, `country`, `phone`, `email`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `invoice_footer`, `payment_term`, `logo`, `award_points`, `deposit_amount`) VALUES
(1, 3, 'customer', 1, 'General', 'Walk-in Customer', 'Walk-in Customer', '', 'Customer Address', 'Petaling Jaya', 'Selangor', '46000', 'Malaysia', '0123456789', 'customer@tecdiary.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL),
(2, 4, 'supplier', NULL, NULL, 'Test Supplier', 'Supplier Company Name', NULL, 'Supplier Address', 'Petaling Jaya', 'Selangor', '46050', 'Malaysia', '0123456789', 'supplier@tecdiary.com', '-', '-', '-', '-', '-', '-', NULL, 0, 'logo.png', 0, NULL),
(3, NULL, 'biller', NULL, NULL, 'Mian Saleem', 'Test Biller', '5555', 'Biller adddress', 'City', '', '', 'Country', '012345678cghdfhd', 'saleem@tecdiary.com', '', '', '', '', '', '', ' Thank you for shopping with us. Please come again', 0, 'logo1.png', 0, NULL),
(4, 3, 'customer', 1, 'General', 'Mubashir Hussain', 'CSMD Soft', '0123456789', 'B1-7-3', 'Kuala lumpur', 'Malaysia', '50000', 'Malaysia', '0129703973', 'mubashirhussain0007@yahoo.com', '', '', '', '', '', 'mubashirhussain0007@yahoo.com', NULL, 0, 'logo.png', 0, NULL),
(5, 4, 'supplier', NULL, NULL, 'Faizan Qayyum', 'Faizan Group Of Services', '0123456789', 'Signature Park', 'Kota Damansara', 'Selangor', '47810', 'Malaysia', '009601133588035', 'faizan@gmail.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL),
(6, 4, 'supplier', NULL, NULL, 'aaaaaaaa', 'aaaa', '222222222222', '777777777', 'hhhhhhh', 'rerer', '22222222', 'rrrrrrr', '5656757', 'qqq@eeee.com', '333333333', '22', 'ggghg', 'hgg', 'hgh', '', NULL, 0, 'logo.png', 0, NULL),
(7, 3, 'customer', 1, 'General', 'Umer', 'mgma', '', 'karachi pakistan', 'karcahi', '', '', '', '0909009090900', 'umer@magmacc.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL),
(8, 3, 'customer', 1, 'General', 'Saleem Ahmed', 'None', '', 'asasa', 'asas', '', '', 'Pakistan', 'asasa', 'admin@gmail.com', 'Dr. Kidwai Patient', 'Patient# 123455', '', '', '', '', NULL, 0, 'logo.png', 0, NULL),
(9, 4, 'supplier', NULL, NULL, 'asdada', 'CSMD01', 'asdas', 'adas', 'sda', '', '', '', 'asd', 'sda@gmail.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL),
(10, 3, 'customer', 1, 'General', 'Patient', 'None', '', 'karachi, Pakistan', 'Karachi', 'Sindh', '', '', '0987766778', 'patient@gmail.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL),
(11, 3, 'customer', 1, 'General', 'Magma', 'Magma', '12', 'karachi, pakistan', 'karachi', '', '43210', '', '03462503768', 'umer.technexia@gmail.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL),
(16, 3, 'customer', 1, 'General', 'yasir raza', 'Abc company', '0', 'blaj blah', 'karachi', 'sindh', '0', 'pakistan', '03331234567', 'yasirraza@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'logo.png', 0, NULL),
(18, 3, 'customer', 1, 'General', 'hbhbh', 'bb', '0', 'bsadbsa', 'karachi', 'sindh', '0', 'pakistan', '0321313457', 'helo@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'logo.png', 0, NULL),
(19, 4, 'supplier', NULL, NULL, 'Yasir Raza', 'ABC COmpany pvt ltd', '0', 'blah blha', 'karachi', 'sindh', '0', 'pakistan', '03331234567', 'yasirrrr@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'logo.png', 0, NULL),
(20, 4, 'supplier', NULL, NULL, 'finance', 'fin supplier', '0', 'blah blah', 'karachi', 'sindh', '0', 'pakistan', '03001234567', 'fin@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'logo.png', 0, NULL),
(21, 3, 'customer', 4, 'New Customer (+10)', 'hascol12', 'hascol12', '0', 'blah blah', 'karachi', 'sindh', '0', 'paksitan', '03003622917', 'umerhascol@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'logo.png', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_costing`
--

CREATE TABLE `sma_costing` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `sale_item_id` int(11) NOT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `purchase_item_id` int(11) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `purchase_net_unit_cost` decimal(25,4) DEFAULT NULL,
  `purchase_unit_cost` decimal(25,4) DEFAULT NULL,
  `sale_net_unit_price` decimal(25,4) NOT NULL,
  `sale_unit_price` decimal(25,4) NOT NULL,
  `quantity_balance` decimal(15,4) DEFAULT NULL,
  `inventory` tinyint(1) DEFAULT '0',
  `overselling` tinyint(1) DEFAULT '0',
  `option_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_costing`
--

INSERT INTO `sma_costing` (`id`, `date`, `product_id`, `sale_item_id`, `sale_id`, `purchase_item_id`, `quantity`, `purchase_net_unit_cost`, `purchase_unit_cost`, `sale_net_unit_price`, `sale_unit_price`, `quantity_balance`, `inventory`, `overselling`, `option_id`) VALUES
(1, '2016-07-02', 1, 1, 1, 1, '1.0000', '3000.0000', '3180.0000', '3200.0000', '3392.0000', '11.0000', 1, 0, NULL),
(2, '2016-07-02', 2, 2, 2, 2, '1.0000', '2000.0000', '2120.0000', '2200.0000', '2332.0000', '11.0000', 1, 0, NULL),
(3, '2016-07-02', 1, 3, 3, 1, '1.0000', '3000.0000', '3180.0000', '3000.0000', '3180.0000', '10.0000', 1, 0, NULL),
(4, '2016-08-07', 1, 4, 4, 1, '1.0000', '3000.0000', '3180.0000', '3000.0000', '3180.0000', '9.0000', 1, 0, NULL),
(5, '2016-10-09', 1, 5, 5, 1, '1.0000', '3000.0000', '3180.0000', '3000.0000', '3180.0000', '8.0000', 1, 0, NULL),
(6, '2017-11-08', 7, 6, 6, 7, '1.0000', '10.0000', '10.0000', '10.0000', '10.0000', '9999.0000', 1, 0, NULL),
(7, '2017-11-08', 1, 7, 6, 1, '1.0000', '3000.0000', '3180.0000', '3000.0000', '3180.0000', '17.0000', 1, 0, NULL),
(8, '2017-11-08', 1, 8, 7, 8, '10.0000', '0.0000', '0.0000', '3000.0000', '3180.0000', '65.0000', 1, 0, NULL),
(9, '2017-11-08', 6, 9, 7, 6, '100.0000', '100.0000', '100.0000', '100.0000', '100.0000', '0.0000', 1, 0, NULL),
(10, '2017-11-08', 9, 10, 8, 18, '1.0000', '0.0000', '0.0000', '0.0000', '0.0000', '329.0000', 1, 0, 5),
(11, '2017-11-08', 2, 11, 9, 24, '1.0000', '2000.0000', '2120.0000', '2200.0000', '2332.0000', '0.0000', 1, 0, NULL),
(12, '2017-11-08', 2, 12, 10, 22, '2.0000', '2000.0000', '2120.0000', '2200.0000', '2332.0000', '1.0000', 1, 0, NULL),
(13, '2017-11-08', 10, 13, 11, 31, '1.0000', '0.0000', '0.0000', '100.0000', '100.0000', '0.0000', 1, 0, 7),
(14, '2017-11-09', 11, 14, 12, 41, '1.0000', '60.0000', '60.0000', '0.0000', '0.0000', '9.0000', 1, 0, 9),
(15, '2018-01-13', 6, 15, 13, 34, '5.0000', '100.0000', '100.0000', '100.0000', '100.0000', '95.0000', 1, 0, NULL),
(16, '2018-01-13', 7, 16, 13, 7, '1.0000', '10.0000', '10.0000', '10.0000', '10.0000', '996.0000', 1, 0, NULL),
(17, '2018-01-22', 12, 17, 14, 43, '1.0000', '0.0000', '0.0000', '80.0000', '80.0000', '9.0000', 1, 0, NULL),
(18, '2018-03-12', 7, 18, 15, 7, '100.0000', '10.0000', '10.0000', '10.0000', '10.0000', '896.0000', 1, 0, NULL),
(19, '2018-03-12', 1, 19, 15, 1, '100.0000', '3000.0000', '3180.0000', '0.0000', '0.0000', '410.0000', 1, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_currencies`
--

CREATE TABLE `sma_currencies` (
  `id` int(11) NOT NULL,
  `code` varchar(5) NOT NULL,
  `name` varchar(55) NOT NULL,
  `rate` decimal(12,4) NOT NULL,
  `auto_update` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_currencies`
--

INSERT INTO `sma_currencies` (`id`, `code`, `name`, `rate`, `auto_update`) VALUES
(1, 'USD', 'US Dollar', '1.0000', 0),
(2, 'MYR', 'Malaysian Ringgit', '0.7340', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_customer_groups`
--

CREATE TABLE `sma_customer_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `percent` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_customer_groups`
--

INSERT INTO `sma_customer_groups` (`id`, `name`, `percent`) VALUES
(1, 'General', 0),
(2, 'Reseller', -5),
(3, 'Distributor', -15),
(4, 'New Customer (+10)', 10);

-- --------------------------------------------------------

--
-- Table structure for table `sma_date_format`
--

CREATE TABLE `sma_date_format` (
  `id` int(11) NOT NULL,
  `js` varchar(20) NOT NULL,
  `php` varchar(20) NOT NULL,
  `sql` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_date_format`
--

INSERT INTO `sma_date_format` (`id`, `js`, `php`, `sql`) VALUES
(1, 'mm-dd-yyyy', 'm-d-Y', '%m-%d-%Y'),
(2, 'mm/dd/yyyy', 'm/d/Y', '%m/%d/%Y'),
(3, 'mm.dd.yyyy', 'm.d.Y', '%m.%d.%Y'),
(4, 'dd-mm-yyyy', 'd-m-Y', '%d-%m-%Y'),
(5, 'dd/mm/yyyy', 'd/m/Y', '%d/%m/%Y'),
(6, 'dd.mm.yyyy', 'd.m.Y', '%d.%m.%Y');

-- --------------------------------------------------------

--
-- Table structure for table `sma_deliveries`
--

CREATE TABLE `sma_deliveries` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sale_id` int(11) NOT NULL,
  `do_reference_no` varchar(50) NOT NULL,
  `sale_reference_no` varchar(50) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_deposits`
--

CREATE TABLE `sma_deposits` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `company_id` int(11) NOT NULL,
  `amount` decimal(25,4) NOT NULL,
  `paid_by` varchar(50) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_expenses`
--

CREATE TABLE `sma_expenses` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference` varchar(50) NOT NULL,
  `amount` decimal(25,4) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `created_by` varchar(55) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_expenses`
--

INSERT INTO `sma_expenses` (`id`, `date`, `reference`, `amount`, `note`, `created_by`, `attachment`, `category_id`, `warehouse_id`) VALUES
(1, '2018-01-13 21:27:00', 'asdw', '50000.0000', '', '1', NULL, 4, 1),
(2, '2018-01-13 21:29:00', 'xzcasc', '10000.0000', '', '1', NULL, 4, 21);

-- --------------------------------------------------------

--
-- Table structure for table `sma_expense_categories`
--

CREATE TABLE `sma_expense_categories` (
  `id` int(11) NOT NULL,
  `code` varchar(55) NOT NULL,
  `name` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_expense_categories`
--

INSERT INTO `sma_expense_categories` (`id`, `code`, `name`) VALUES
(1, '1001', 'Electric Bill'),
(2, '1002', 'Water Bill'),
(3, '1003', 'Telephone Bill'),
(4, '1004', 'Shop Rent'),
(5, '1005', 'Staff Salary'),
(6, '1006', 'Payment By Cash'),
(7, '1007', 'Payment By Cheque'),
(8, '1008', 'Buy Misc. Items'),
(9, '1009', 'Commission'),
(10, '1010', 'Printer Cartridge');

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_areas`
--

CREATE TABLE `sma_fin_areas` (
  `area_code` int(11) NOT NULL,
  `description` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sma_fin_areas`
--

INSERT INTO `sma_fin_areas` (`area_code`, `description`, `inactive`) VALUES
(1, 'Global', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_attachments`
--

CREATE TABLE `sma_fin_attachments` (
  `id` int(11) UNSIGNED NOT NULL,
  `description` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type_no` int(11) NOT NULL DEFAULT '0',
  `trans_no` int(11) NOT NULL DEFAULT '0',
  `unique_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tran_date` date NOT NULL DEFAULT '0000-00-00',
  `filename` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `filesize` int(11) NOT NULL DEFAULT '0',
  `filetype` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_audit_trail`
--

CREATE TABLE `sma_fin_audit_trail` (
  `id` int(11) NOT NULL,
  `type` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `trans_no` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `user` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `description` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fiscal_year` int(11) NOT NULL DEFAULT '0',
  `gl_date` date NOT NULL DEFAULT '0000-00-00',
  `gl_seq` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_bank_accounts`
--

CREATE TABLE `sma_fin_bank_accounts` (
  `account_code` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `account_type` smallint(6) NOT NULL DEFAULT '0',
  `bank_account_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `bank_account_number` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `bank_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `bank_address` tinytext COLLATE utf8_unicode_ci,
  `bank_curr_code` char(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dflt_curr_act` tinyint(1) NOT NULL DEFAULT '0',
  `id` smallint(6) NOT NULL,
  `bank_charge_act` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `last_reconciled_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ending_reconcile_balance` double NOT NULL DEFAULT '0',
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sma_fin_bank_accounts`
--

INSERT INTO `sma_fin_bank_accounts` (`account_code`, `account_type`, `bank_account_name`, `bank_account_number`, `bank_name`, `bank_address`, `bank_curr_code`, `dflt_curr_act`, `id`, `bank_charge_act`, `last_reconciled_date`, `ending_reconcile_balance`, `inactive`) VALUES
('1060', 0, 'Current account', 'N/A', 'N/A', '', 'PKR', 1, 1, '5690', '0000-00-00 00:00:00', 0, 0),
('1065', 3, 'Petty Cash account', 'N/A', 'N/A', '', 'PKR', 0, 2, '5690', '0000-00-00 00:00:00', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_bank_trans`
--

CREATE TABLE `sma_fin_bank_trans` (
  `id` int(11) NOT NULL,
  `type` smallint(6) DEFAULT NULL,
  `trans_no` int(11) DEFAULT NULL,
  `bank_act` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ref` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `trans_date` date NOT NULL DEFAULT '0000-00-00',
  `amount` double DEFAULT NULL,
  `dimension_id` int(11) NOT NULL DEFAULT '0',
  `dimension2_id` int(11) NOT NULL DEFAULT '0',
  `person_type_id` int(11) NOT NULL DEFAULT '0',
  `person_id` tinyblob,
  `reconciled` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_bom`
--

CREATE TABLE `sma_fin_bom` (
  `id` int(11) NOT NULL,
  `parent` char(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `component` char(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `workcentre_added` int(11) NOT NULL DEFAULT '0',
  `loc_code` char(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `quantity` double NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sma_fin_bom`
--

INSERT INTO `sma_fin_bom` (`id`, `parent`, `component`, `workcentre_added`, `loc_code`, `quantity`) VALUES
(1, '201', '101', 1, 'DEF', 1),
(2, '201', '102', 1, 'DEF', 1),
(3, '201', '103', 1, 'DEF', 1),
(4, '201', '301', 1, 'DEF', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_budget_trans`
--

CREATE TABLE `sma_fin_budget_trans` (
  `id` int(11) NOT NULL,
  `tran_date` date NOT NULL DEFAULT '0000-00-00',
  `account` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `memo_` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `amount` double NOT NULL DEFAULT '0',
  `dimension_id` int(11) DEFAULT '0',
  `dimension2_id` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_chart_class`
--

CREATE TABLE `sma_fin_chart_class` (
  `cid` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `class_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ctype` tinyint(1) NOT NULL DEFAULT '0',
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sma_fin_chart_class`
--

INSERT INTO `sma_fin_chart_class` (`cid`, `class_name`, `ctype`, `inactive`) VALUES
('1', 'Assets', 1, 0),
('2', 'Liabilities', 2, 0),
('3', 'Income', 4, 0),
('4', 'Costs', 6, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_chart_master`
--

CREATE TABLE `sma_fin_chart_master` (
  `account_code` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `account_code2` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `account_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `account_type` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sma_fin_chart_master`
--

INSERT INTO `sma_fin_chart_master` (`account_code`, `account_code2`, `account_name`, `account_type`, `inactive`) VALUES
('1060', '', 'Checking Account', '1', 0),
('1065', '', 'Petty Cash', '1', 0),
('1200', '', 'Accounts Receivables', '1', 0),
('1205', '', 'Allowance for doubtful accounts', '1', 0),
('1510', '', 'Inventory', '2', 0),
('1520', '', 'Stocks of Raw Materials', '2', 0),
('1530', '', 'Stocks of Work In Progress', '2', 0),
('1540', '', 'Stocks of Finished Goods', '2', 0),
('1550', '', 'Goods Received Clearing account', '2', 0),
('1820', '', 'Office Furniture &amp; Equipment', '3', 0),
('1825', '', 'Accum. Amort. -Furn. &amp; Equip.', '3', 0),
('1840', '', 'Vehicle', '3', 0),
('1845', '', 'Accum. Amort. -Vehicle', '3', 0),
('2100', '', 'Accounts Payable', '4', 0),
('2105', '', 'Deferred Income', '4', 0),
('2110', '', 'Accrued Income Tax - Federal', '4', 0),
('2120', '', 'Accrued Income Tax - State', '4', 0),
('2130', '', 'Accrued Franchise Tax', '4', 0),
('2140', '', 'Accrued Real &amp; Personal Prop Tax', '4', 0),
('2150', '', 'Sales Tax', '4', 0),
('2160', '', 'Accrued Use Tax Payable', '4', 0),
('2210', '', 'Accrued Wages', '4', 0),
('2220', '', 'Accrued Comp Time', '4', 0),
('2230', '', 'Accrued Holiday Pay', '4', 0),
('2240', '', 'Accrued Vacation Pay', '4', 0),
('2310', '', 'Accr. Benefits - 401K', '4', 0),
('2320', '', 'Accr. Benefits - Stock Purchase', '4', 0),
('2330', '', 'Accr. Benefits - Med, Den', '4', 0),
('2340', '', 'Accr. Benefits - Payroll Taxes', '4', 0),
('2350', '', 'Accr. Benefits - Credit Union', '4', 0),
('2360', '', 'Accr. Benefits - Savings Bond', '4', 0),
('2370', '', 'Accr. Benefits - Garnish', '4', 0),
('2380', '', 'Accr. Benefits - Charity Cont.', '4', 0),
('2620', '', 'Bank Loans', '5', 0),
('2680', '', 'Loans from Shareholders', '5', 0),
('3350', '', 'Common Shares', '6', 0),
('3590', '', 'Retained Earnings - prior years', '7', 0),
('4010', '', 'Sales', '8', 0),
('4430', '', 'Shipping &amp; Handling', '9', 0),
('4440', '', 'Interest', '9', 0),
('4450', '', 'Foreign Exchange Gain', '9', 0),
('4500', '', 'Prompt Payment Discounts', '9', 0),
('4510', '', 'Discounts Given', '9', 0),
('5010', '', 'Cost of Goods Sold - Retail', '10', 0),
('5020', '', 'Material Usage Varaiance', '10', 0),
('5030', '', 'Consumable Materials', '10', 0),
('5040', '', 'Purchase price Variance', '10', 0),
('5050', '', 'Purchases of materials', '10', 0),
('5060', '', 'Discounts Received', '10', 0),
('5100', '', 'Freight', '10', 0),
('5410', '', 'Wages &amp; Salaries', '11', 0),
('5420', '', 'Wages - Overtime', '11', 0),
('5430', '', 'Benefits - Comp Time', '11', 0),
('5440', '', 'Benefits - Payroll Taxes', '11', 0),
('5450', '', 'Benefits - Workers Comp', '11', 0),
('5460', '', 'Benefits - Pension', '11', 0),
('5470', '', 'Benefits - General Benefits', '11', 0),
('5510', '', 'Inc Tax Exp - Federal', '11', 0),
('5520', '', 'Inc Tax Exp - State', '11', 0),
('5530', '', 'Taxes - Real Estate', '11', 0),
('5540', '', 'Taxes - Personal Property', '11', 0),
('5550', '', 'Taxes - Franchise', '11', 0),
('5560', '', 'Taxes - Foreign Withholding', '11', 0),
('5610', '', 'Accounting &amp; Legal', '12', 0),
('5615', '', 'Advertising &amp; Promotions', '12', 0),
('5620', '', 'Bad Debts', '12', 0),
('5626', '', 'Loan Adjustments', '4', 0),
('5660', '', 'Amortization Expense', '12', 0),
('5685', '', 'Insurance', '12', 0),
('5690', '', 'Interest &amp; Bank Charges', '12', 0),
('5700', '', 'Office Supplies', '12', 0),
('5760', '', 'Rent', '12', 0),
('5765', '', 'Repair &amp; Maintenance', '12', 0),
('5780', '', 'Telephone', '12', 0),
('5785', '', 'Travel &amp; Entertainment', '12', 0),
('5790', '', 'Utilities', '12', 0),
('5795', '', 'Registrations', '12', 0),
('5800', '', 'Licenses', '12', 0),
('5810', '', 'Foreign Exchange Loss', '12', 0),
('772', '', 'SRB Tax', '4', 0),
('94244659', '', 'With Holding Tax', '4', 0),
('9990', '', 'Year Profit/Loss', '12', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_chart_types`
--

CREATE TABLE `sma_fin_chart_types` (
  `id` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `class_id` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parent` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '-1',
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sma_fin_chart_types`
--

INSERT INTO `sma_fin_chart_types` (`id`, `name`, `class_id`, `parent`, `inactive`) VALUES
('1', 'Current Assets', '1', '', 0),
('10', 'Cost of Goods Sold', '4', '', 0),
('11', 'Payroll Expenses', '4', '', 0),
('12', 'General &amp; Administrative expenses', '4', '', 0),
('2', 'Inventory Assets', '1', '', 0),
('3', 'Capital Assets', '1', '', 0),
('4', 'Current Liabilities', '2', '', 0),
('5', 'Long Term Liabilities', '2', '', 0),
('6', 'Share Capital', '2', '', 0),
('7', 'Retained Earnings', '2', '', 0),
('8', 'Sales Revenue', '3', '', 0),
('9', 'Other Revenue', '3', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_comments`
--

CREATE TABLE `sma_fin_comments` (
  `type` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL DEFAULT '0',
  `date_` date DEFAULT '0000-00-00',
  `memo_` tinytext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sma_fin_comments`
--

INSERT INTO `sma_fin_comments` (`type`, `id`, `date_`, `memo_`) VALUES
(12, 1, '2017-05-10', 'Cash invoice 1'),
(12, 2, '2017-05-07', 'Cash invoice 2'),
(13, 4, '2017-05-07', 'Recurrent Invoice covers period 04/01/2017 - 04/07/2017.'),
(10, 4, '2017-05-07', 'Recurrent Invoice covers period 04/01/2017 - 04/07/2017.'),
(12, 3, '2017-05-07', 'Cash invoice 4'),
(0, 1, '2017-12-31', 'Closing Year'),
(17, 1, '2019-01-09', 'on purchase find b quality '),
(17, 2, '2019-01-09', 'from purcahse 001/2019 '),
(12, 5, '2019-04-23', 'Default #5'),
(13, 6, '2019-04-23', 'sadsa'),
(12, 6, '2019-04-23', 'Default #7'),
(12, 9, '2019-04-23', 'Default #10'),
(12, 12, '2019-04-24', 'Default #11'),
(12, 17, '2019-04-25', '4673424'),
(20, 2, '2019-04-25', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_credit_status`
--

CREATE TABLE `sma_fin_credit_status` (
  `id` int(11) NOT NULL,
  `reason_description` char(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dissallow_invoices` tinyint(1) NOT NULL DEFAULT '0',
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sma_fin_credit_status`
--

INSERT INTO `sma_fin_credit_status` (`id`, `reason_description`, `dissallow_invoices`, `inactive`) VALUES
(1, 'Good History', 0, 0),
(3, 'No more work until payment received', 1, 0),
(4, 'In liquidation', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_crm_categories`
--

CREATE TABLE `sma_fin_crm_categories` (
  `id` int(11) NOT NULL COMMENT 'pure technical key',
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'contact type e.g. customer',
  `action` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'detailed usage e.g. department',
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT 'for category selector',
  `description` tinytext COLLATE utf8_unicode_ci NOT NULL COMMENT 'usage description',
  `system` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'nonzero for core system usage',
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sma_fin_crm_categories`
--

INSERT INTO `sma_fin_crm_categories` (`id`, `type`, `action`, `name`, `description`, `system`, `inactive`) VALUES
(1, 'cust_branch', 'general', 'General', 'General contact data for customer branch (overrides company setting)', 1, 0),
(2, 'cust_branch', 'invoice', 'Invoices', 'Invoice posting (overrides company setting)', 1, 0),
(3, 'cust_branch', 'order', 'Orders', 'Order confirmation (overrides company setting)', 1, 0),
(4, 'cust_branch', 'delivery', 'Deliveries', 'Delivery coordination (overrides company setting)', 1, 0),
(5, 'customer', 'general', 'General', 'General contact data for customer', 1, 0),
(6, 'customer', 'order', 'Orders', 'Order confirmation', 1, 0),
(7, 'customer', 'delivery', 'Deliveries', 'Delivery coordination', 1, 0),
(8, 'customer', 'invoice', 'Invoices', 'Invoice posting', 1, 0),
(9, 'supplier', 'general', 'General', 'General contact data for supplier', 1, 0),
(10, 'supplier', 'order', 'Orders', 'Order confirmation', 1, 0),
(11, 'supplier', 'delivery', 'Deliveries', 'Delivery coordination', 1, 0),
(12, 'supplier', 'invoice', 'Invoices', 'Invoice posting', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_crm_contacts`
--

CREATE TABLE `sma_fin_crm_contacts` (
  `id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL DEFAULT '0' COMMENT 'foreign key to crm_contacts',
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'foreign key to crm_categories',
  `action` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'foreign key to crm_categories',
  `entity_id` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'entity id in related class table'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sma_fin_crm_contacts`
--

INSERT INTO `sma_fin_crm_contacts` (`id`, `person_id`, `type`, `action`, `entity_id`) VALUES
(4, 2, 'supplier', 'general', '2'),
(5, 3, 'cust_branch', 'general', '1'),
(7, 3, 'customer', 'general', '1'),
(8, 1, 'supplier', 'general', '1'),
(9, 4, 'cust_branch', 'general', '2'),
(10, 4, 'customer', 'general', '2'),
(11, 5, 'supplier', 'general', '3'),
(12, 6, 'cust_branch', 'general', '3'),
(13, 6, 'customer', 'general', '3'),
(14, 7, 'cust_branch', 'general', '4'),
(15, 7, 'customer', 'general', '4'),
(16, 15, 'cust_branch', 'general', '8'),
(17, 15, 'customer', 'general', '14'),
(18, 16, 'cust_branch', 'general', '9'),
(19, 16, 'customer', 'general', '15'),
(20, 17, 'cust_branch', 'general', '10'),
(21, 17, 'customer', 'general', '16');

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_crm_persons`
--

CREATE TABLE `sma_fin_crm_persons` (
  `id` int(11) NOT NULL,
  `ref` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `name2` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` tinytext COLLATE utf8_unicode_ci,
  `phone` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone2` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` char(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sma_fin_crm_persons`
--

INSERT INTO `sma_fin_crm_persons` (`id`, `ref`, `name`, `name2`, `address`, `phone`, `phone2`, `fax`, `email`, `lang`, `notes`, `inactive`) VALUES
(1, 'Dino Saurius', 'John Doe', NULL, 'N/A', NULL, NULL, NULL, NULL, NULL, '', 0),
(2, 'Beefeater', 'Joe Oversea', NULL, 'N/A', NULL, NULL, NULL, NULL, NULL, '', 0),
(3, 'Donald Easter', 'Donald Easter LLC', NULL, 'N/A', NULL, NULL, NULL, NULL, NULL, '', 0),
(4, 'MoneyMaker', 'MoneyMaker Ltd.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0),
(5, 'Alamin', '', '', '', '', '', '', '', '', '', 0),
(6, 'Muhammad Umer', 'Muhammad Umer', '', 'karachi, pakistan\nkarachi, pakistan', '03462503768', '', '', 'umer.technexia@gmail.com', '', '', 0),
(7, 'yasir', 'Yasir raza', '', 'abc street', '03331324567', '', '', 'yasir@gmail.com', '', '', 0),
(10, 'yasir', 'yasir', 'yasir', 'blah', '03331234567', '03331234567', NULL, 'yasirraza@gmail.com', NULL, 'NA', 0),
(11, 'hvjdskvj', 'hvjdskvj', 'hvjdskvj', 'safklsan', '6165651561', '6165651561', NULL, 'yasirrazads@gmail.com', NULL, 'gyhjukil', 0),
(13, 'hbhbh', 'hbhbh', 'hbhbh', 'bsadbsa', '0321313457', '0321313457', NULL, 'helo@gmail.com', NULL, 'NA', 0),
(14, 'hascol12', 'hascol12', 'hascol12', 'blah blah', '03003622917', '03003622917', NULL, 'umerhascol@gmail.com', NULL, 'asdsad', 0),
(15, 'yasir raza', 'Yasir Raza', '', 'abc', '03003622917', '03003622917', '', 'yasirraza@gmail.com', '', '', 0),
(16, 'yasir raza sahab ', 'yasir raza', '', 'asdsad', '', '', '', '', '', '', 0),
(17, 'Hascol', 'Hascol Petrolium', '', 'abc karachi', '', '', '', '', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_currencies`
--

CREATE TABLE `sma_fin_currencies` (
  `currency` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `curr_abrev` char(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `curr_symbol` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `country` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `hundreds_name` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `auto_update` tinyint(1) NOT NULL DEFAULT '1',
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sma_fin_currencies`
--

INSERT INTO `sma_fin_currencies` (`currency`, `curr_abrev`, `curr_symbol`, `country`, `hundreds_name`, `auto_update`, `inactive`) VALUES
('Euro', 'EUR', 'â‚¬', 'Europe', 'Cents', 1, 0),
('Pounds', 'GBP', 'Â£', 'England', 'Pence', 1, 0),
('Pakistani Rupee', 'PKR', 'Rs', 'Pakistan', 'Paisa', 0, 0),
('US Dollars', 'USD', '$', 'United States', 'Cents', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_cust_allocations`
--

CREATE TABLE `sma_fin_cust_allocations` (
  `id` int(11) NOT NULL,
  `person_id` int(11) DEFAULT NULL,
  `amt` double UNSIGNED DEFAULT NULL,
  `date_alloc` date NOT NULL DEFAULT '0000-00-00',
  `trans_no_from` int(11) DEFAULT NULL,
  `trans_type_from` int(11) DEFAULT NULL,
  `trans_no_to` int(11) DEFAULT NULL,
  `trans_type_to` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sma_fin_cust_allocations`
--

INSERT INTO `sma_fin_cust_allocations` (`id`, `person_id`, `amt`, `date_alloc`, `trans_no_from`, `trans_type_from`, `trans_no_to`, `trans_type_to`) VALUES
(1, 1, 6240, '2017-05-10', 1, 12, 1, 10),
(2, 1, 300, '2017-05-07', 2, 12, 2, 10),
(3, 1, 0, '2017-05-07', 3, 12, 4, 10),
(4, 4, 4000000, '2019-04-23', 5, 12, 5, 10),
(5, 4, 16, '2019-04-23', 6, 12, 7, 10),
(6, 4, 200, '0000-00-00', 7, 12, 6, 10),
(7, 15, 1000000, '2019-04-23', 9, 12, 10, 10),
(9, 14, 40000, '0000-00-00', 11, 12, 9, 10),
(10, 15, 40000, '2019-04-24', 12, 12, 11, 10),
(11, 4, 19800, '0000-00-00', 13, 12, 6, 10),
(12, 14, 6115063, '0000-00-00', 17, 12, 14, 10),
(13, 14, 200, '0000-00-00', 18, 12, 17, 10),
(14, 14, 4000000, '2019-04-23', 10, 12, 8, 10),
(15, 16, 5411560, '0000-00-00', 19, 12, 21, 10),
(16, 16, 5411560, '0000-00-00', 20, 12, 20, 10),
(17, 16, 1981518, '0000-00-00', 21, 12, 22, 10);

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_cust_branch`
--

CREATE TABLE `sma_fin_cust_branch` (
  `branch_code` int(11) NOT NULL,
  `debtor_no` int(11) NOT NULL DEFAULT '0',
  `br_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `branch_ref` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `br_address` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `area` int(11) DEFAULT NULL,
  `salesman` int(11) NOT NULL DEFAULT '0',
  `default_location` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tax_group_id` int(11) DEFAULT NULL,
  `sales_account` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sales_discount_account` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `receivables_account` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `payment_discount_account` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `default_ship_via` int(11) NOT NULL DEFAULT '1',
  `br_post_address` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `group_no` int(11) NOT NULL DEFAULT '0',
  `notes` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `bank_account` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sma_fin_cust_branch`
--

INSERT INTO `sma_fin_cust_branch` (`branch_code`, `debtor_no`, `br_name`, `branch_ref`, `br_address`, `area`, `salesman`, `default_location`, `tax_group_id`, `sales_account`, `sales_discount_account`, `receivables_account`, `payment_discount_account`, `default_ship_via`, `br_post_address`, `group_no`, `notes`, `bank_account`, `inactive`) VALUES
(1, 1, 'Donald Easter LLC', 'Donald Easter', 'N/A', 1, 1, 'DEF', 1, '', '4510', '1200', '4500', 1, 'N/A', 0, '', NULL, 0),
(2, 2, 'MoneyMaker Ltd.', 'MoneyMaker', '', 1, 1, 'DEF', 2, '', '4510', '1200', '4500', 1, '', 0, '', NULL, 0),
(3, 3, 'Muhammad Umer', 'Muhammad Umer', 'karachi, pakistan\nkarachi, pakistan', 1, 1, 'DEF', 1, '', '4510', '1200', '4500', 1, 'karachi, pakistan\nkarachi, pakistan', 0, '', NULL, 0),
(4, 4, 'Yasir raza', 'yasir', 'abc street', 1, 1, 'DEF', 1, '', '4510', '1200', '4500', 1, 'abc street', 0, '', '6515165', 0),
(5, 7, 'hvjdskvj', 'hvjdskvj', 'safklsan', 1, 1, 'DEF', 1, '0', '4510', '1200', '4500', 1, 'safklsan', 0, 'NA', NULL, 0),
(6, 12, 'hbhbh', 'hbhbh', 'bsadbsa', 1, 1, 'DEF', 1, '0', '4510', '1200', '4500', 1, 'bsadbsa', 0, 'NA', NULL, 0),
(7, 13, 'hascol12', 'hascol12', 'blah blah', 1, 1, 'DEF', 1, '0', '4510', '1200', '4500', 1, 'blah blah', 0, 'NA', NULL, 0),
(8, 14, 'Yasir Raza', 'yasir raza', 'abc', 1, 1, 'DEF', 2, '', '4510', '1200', '4500', 1, 'abc', 0, 'jhbsajdbkj', '3632233232665', 0),
(9, 15, 'yasir raza', 'yasir raza sahab ', 'asdsad', 1, 1, 'DEF', 1, '', '4510', '1200', '4500', 1, 'asdsad', 0, '', NULL, 0),
(10, 16, 'Hascol Petrolium', 'Hascol', 'abc karachi', 1, 1, 'DEF', 1, '', '4510', '1200', '4500', 1, 'abc karachi', 0, '', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_debtors_master`
--

CREATE TABLE `sma_fin_debtors_master` (
  `debtor_no` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `debtor_ref` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `address` tinytext COLLATE utf8_unicode_ci,
  `tax_id` varchar(55) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `curr_code` char(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sales_type` int(11) NOT NULL DEFAULT '1',
  `dimension_id` int(11) NOT NULL DEFAULT '0',
  `dimension2_id` int(11) NOT NULL DEFAULT '0',
  `credit_status` int(11) NOT NULL DEFAULT '0',
  `payment_terms` int(11) DEFAULT NULL,
  `discount` double NOT NULL DEFAULT '0',
  `pymt_discount` double NOT NULL DEFAULT '0',
  `credit_limit` float NOT NULL DEFAULT '1000',
  `notes` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sma_fin_debtors_master`
--

INSERT INTO `sma_fin_debtors_master` (`debtor_no`, `name`, `debtor_ref`, `address`, `tax_id`, `curr_code`, `sales_type`, `dimension_id`, `dimension2_id`, `credit_status`, `payment_terms`, `discount`, `pymt_discount`, `credit_limit`, `notes`, `inactive`) VALUES
(1, 'Donald Easter LLC', 'Donald Easter', 'N/A', '123456789', 'USD', 1, 0, 0, 1, 4, 0, 0, 1000, '', 0),
(2, 'MoneyMaker Ltd.', 'MoneyMaker', 'N/A', '54354333', 'EUR', 1, 1, 0, 1, 1, 0, 0, 1000, '', 0),
(3, 'Muhammad Umer', 'Muhammad Umer', 'karachi, pakistan\nkarachi, pakistan', '', 'PKR', 1, 0, 0, 1, 4, 0, 0, 1000, '', 0),
(4, 'Yasir raza', 'yasir', 'abc street', '51651', 'PKR', 1, 0, 0, 1, 4, 0, 0, 1000, '', 0),
(7, 'hvjdskvj', 'hvjdskvj', 'safklsan', '51651', 'PKR', 1, 0, 0, 1, 4, 0, 0, 652, 'gyhjukil', 0),
(12, 'hbhbh', 'hbhbh', 'bsadbsa', '51651', 'PKR', 1, 0, 0, 1, 4, 0, 0, 10000, 'NA', 0),
(13, 'hascol12', 'hascol12', 'blah blah', '51651', 'PKR', 1, 0, 0, 1, 4, 0, 0, 100000, 'asdsad', 0),
(14, 'Yasir Raza', 'yasir raza', 'abc', '6565456', 'PKR', 1, 1, 0, 1, 2, 0, 0, 5000000, 'jhbsajdbkj', 0),
(15, 'yasir raza', 'yasir raza sahab ', 'asdsad', '12313', 'PKR', 1, 0, 0, 1, 4, 0, 0, 1000, '', 0),
(16, 'Hascol Petrolium', 'Hascol', 'abc karachi', '516515611', 'PKR', 1, 0, 0, 1, 10, 0, 0, 5000000000, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_debtor_trans`
--

CREATE TABLE `sma_fin_debtor_trans` (
  `trans_no` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `type` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `version` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `debtor_no` int(11) UNSIGNED NOT NULL,
  `branch_code` int(11) NOT NULL DEFAULT '-1',
  `tran_date` date NOT NULL DEFAULT '0000-00-00',
  `due_date` date NOT NULL DEFAULT '0000-00-00',
  `reference` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tpe` int(11) NOT NULL DEFAULT '0',
  `order_` int(11) NOT NULL DEFAULT '0',
  `ov_amount` double NOT NULL DEFAULT '0',
  `ov_gst` double NOT NULL DEFAULT '0',
  `ov_freight` double NOT NULL DEFAULT '0',
  `ov_freight_tax` double NOT NULL DEFAULT '0',
  `ov_discount` double NOT NULL DEFAULT '0',
  `alloc` double NOT NULL DEFAULT '0',
  `prep_amount` double NOT NULL DEFAULT '0',
  `rate` double NOT NULL DEFAULT '1',
  `ship_via` int(11) DEFAULT NULL,
  `dimension_id` int(11) NOT NULL DEFAULT '0',
  `dimension2_id` int(11) NOT NULL DEFAULT '0',
  `payment_terms` int(11) DEFAULT NULL,
  `tax_included` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_debtor_trans_details`
--

CREATE TABLE `sma_fin_debtor_trans_details` (
  `id` int(11) NOT NULL,
  `debtor_trans_no` int(11) DEFAULT NULL,
  `debtor_trans_type` int(11) DEFAULT NULL,
  `stock_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` tinytext COLLATE utf8_unicode_ci,
  `unit_price` double NOT NULL DEFAULT '0',
  `unit_tax` double NOT NULL DEFAULT '0',
  `quantity` double NOT NULL DEFAULT '0',
  `discount_percent` double NOT NULL DEFAULT '0',
  `standard_cost` double NOT NULL DEFAULT '0',
  `qty_done` double NOT NULL DEFAULT '0',
  `src_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_dimensions`
--

CREATE TABLE `sma_fin_dimensions` (
  `id` int(11) NOT NULL,
  `reference` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type_` tinyint(1) NOT NULL DEFAULT '1',
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `date_` date NOT NULL DEFAULT '0000-00-00',
  `due_date` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sma_fin_dimensions`
--

INSERT INTO `sma_fin_dimensions` (`id`, `reference`, `name`, `type_`, `closed`, `date_`, `due_date`) VALUES
(1, '001/2017', 'Cost Centre', 1, 0, '2017-05-05', '2017-05-25');

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_exchange_rates`
--

CREATE TABLE `sma_fin_exchange_rates` (
  `id` int(11) NOT NULL,
  `curr_code` char(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rate_buy` double NOT NULL DEFAULT '0',
  `rate_sell` double NOT NULL DEFAULT '0',
  `date_` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sma_fin_exchange_rates`
--

INSERT INTO `sma_fin_exchange_rates` (`id`, `curr_code`, `rate_buy`, `rate_sell`, `date_`) VALUES
(1, 'EUR', 1.123, 1.123, '2017-05-07');

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_fiscal_year`
--

CREATE TABLE `sma_fin_fiscal_year` (
  `id` int(11) NOT NULL,
  `begin` date DEFAULT '0000-00-00',
  `end` date DEFAULT '0000-00-00',
  `closed` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sma_fin_fiscal_year`
--

INSERT INTO `sma_fin_fiscal_year` (`id`, `begin`, `end`, `closed`) VALUES
(1, '2017-01-01', '2017-12-31', 1),
(2, '2018-01-01', '2018-12-31', 1),
(3, '2018-07-01', '2019-06-30', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_gl_trans`
--

CREATE TABLE `sma_fin_gl_trans` (
  `counter` int(11) NOT NULL,
  `type` smallint(6) NOT NULL DEFAULT '0',
  `type_no` int(11) NOT NULL DEFAULT '0',
  `tran_date` date NOT NULL DEFAULT '0000-00-00',
  `account` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `memo_` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `amount` double NOT NULL DEFAULT '0',
  `dimension_id` int(11) NOT NULL DEFAULT '0',
  `dimension2_id` int(11) NOT NULL DEFAULT '0',
  `person_type_id` int(11) DEFAULT NULL,
  `person_id` tinyblob
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sma_fin_gl_trans`
--

INSERT INTO `sma_fin_gl_trans` (`counter`, `type`, `type_no`, `tran_date`, `account`, `memo_`, `amount`, `dimension_id`, `dimension2_id`, `person_type_id`, `person_id`) VALUES
(1, 25, 1, '2017-05-05', '1510', '101', 20000, 0, 0, NULL, NULL),
(2, 25, 1, '2017-05-05', '1510', '102', 15000, 0, 0, NULL, NULL),
(3, 25, 1, '2017-05-05', '1510', '103', 1000, 0, 0, NULL, NULL),
(4, 25, 1, '2017-05-05', '1550', '', -36000, 0, 0, NULL, NULL),
(5, 13, 1, '2017-05-10', '5010', '', 4000, 0, 0, NULL, NULL),
(6, 13, 1, '2017-05-10', '1510', '', -4000, 0, 0, NULL, NULL),
(7, 10, 1, '2017-05-10', '4010', '', -5714.29, 0, 0, NULL, NULL),
(8, 10, 1, '2017-05-10', '4010', '', -228.57, 0, 0, NULL, NULL),
(9, 10, 1, '2017-05-10', '1200', '', 6240, 0, 0, 2, 0x31),
(10, 10, 1, '2017-05-10', '2150', '', -297.14, 0, 0, NULL, NULL),
(11, 12, 1, '2017-05-10', '1065', '', 6240, 0, 0, NULL, NULL),
(12, 12, 1, '2017-05-10', '1200', '', -6240, 0, 0, 2, 0x31),
(13, 26, 1, '2017-05-05', '1510', '1 * iPad Air 2 16GB', -400, 0, 0, NULL, NULL),
(14, 26, 1, '2017-05-05', '1510', '1 * iPhone 6 64GB', -300, 0, 0, NULL, NULL),
(15, 26, 1, '2017-05-05', '1510', '1 * iPhone Cover Case', -20, 0, 0, NULL, NULL),
(16, 26, 1, '2017-05-05', '1510', 'Produced 2 * AP Surf Set', 720, 0, 0, NULL, NULL),
(17, 25, 2, '2017-05-05', '1510', '101', 3000, 0, 0, NULL, NULL),
(18, 25, 2, '2017-05-05', '1550', '', -3000, 0, 0, NULL, NULL),
(19, 20, 1, '2017-05-05', '2150', '', 150, 0, 0, NULL, NULL),
(20, 20, 1, '2017-05-05', '2100', '', -3150, 0, 0, 3, 0x31),
(21, 20, 1, '2017-05-05', '1550', '', 3000, 0, 0, NULL, NULL),
(22, 13, 2, '2017-05-07', '5010', '', 200, 0, 0, NULL, NULL),
(23, 13, 2, '2017-05-07', '1510', '', -200, 0, 0, NULL, NULL),
(24, 10, 2, '2017-05-07', '4010', '', -285.71, 0, 0, NULL, NULL),
(25, 10, 2, '2017-05-07', '1200', '', 300, 0, 0, 2, 0x31),
(26, 10, 2, '2017-05-07', '2150', '', -14.29, 0, 0, NULL, NULL),
(27, 12, 2, '2017-05-07', '1065', '', 300, 0, 0, NULL, NULL),
(28, 12, 2, '2017-05-07', '1200', '', -300, 0, 0, 2, 0x31),
(29, 13, 3, '2017-05-07', '5010', '', 150, 1, 0, NULL, NULL),
(30, 13, 3, '2017-05-07', '1510', '', -150, 0, 0, NULL, NULL),
(31, 13, 3, '2017-05-07', '5010', '', 10, 1, 0, NULL, NULL),
(32, 13, 3, '2017-05-07', '1510', '', -10, 0, 0, NULL, NULL),
(33, 10, 3, '2017-05-07', '4010', '', -250, 1, 0, NULL, NULL),
(34, 10, 3, '2017-05-07', '4010', '', -50, 1, 0, NULL, NULL),
(35, 10, 3, '2017-05-07', '1200', '', 300, 0, 0, 2, 0x32),
(36, 12, 3, '2017-05-07', '1065', '', 0, 0, 0, NULL, NULL),
(37, 1, 1, '2017-05-07', '5010', '', 5, 1, 0, NULL, NULL),
(38, 1, 1, '2017-05-07', '1060', '', -5, 0, 0, NULL, NULL),
(39, 0, 1, '2017-12-31', '3590', 'Closing Year', -2163.57, 0, 0, NULL, NULL),
(40, 0, 1, '2017-12-31', '9990', 'Closing Year', 2163.57, 0, 0, NULL, NULL),
(41, 25, 3, '2019-01-09', '1510', 'A-3654', 15000, 0, 0, NULL, NULL),
(42, 25, 3, '2019-01-09', '1550', '', -15000, 0, 0, NULL, NULL),
(43, 17, 1, '2019-01-09', '5040', 'on purchase find b quality ', 3000, 0, 0, NULL, NULL),
(44, 17, 1, '2019-01-09', '1510', 'on purchase find b quality ', -3000, 0, 0, NULL, NULL),
(45, 17, 2, '2019-01-09', '5040', 'from purcahse 001/2019 ', -3000, 0, 0, NULL, NULL),
(46, 17, 2, '2019-01-09', '1510', 'from purcahse 001/2019 ', 3000, 0, 0, NULL, NULL),
(47, 2, 1, '2019-01-10', '1200', '', -50000, 0, 0, 0, ''),
(48, 2, 1, '2019-01-10', '1060', '', 50000, 0, 0, NULL, NULL),
(49, 12, 4, '2019-04-23', '1060', '', 20000, 0, 0, NULL, NULL),
(50, 12, 4, '2019-04-23', '1200', '', -20000, 0, 0, 2, 0x34),
(51, 10, 5, '2019-04-23', '4010', '', -3809523.81, 0, 0, NULL, NULL),
(52, 10, 5, '2019-04-23', '1200', '', 4000000, 0, 0, 2, 0x34),
(53, 10, 5, '2019-04-23', '2150', '', -190476.19, 0, 0, NULL, NULL),
(54, 12, 5, '2019-04-23', '1065', '', 4000000, 0, 0, NULL, NULL),
(55, 12, 5, '2019-04-23', '1200', '', -4000000, 0, 0, 2, 0x34),
(56, 2, 2, '2019-04-23', '1200', '', -20000, 1, 0, 2, 0x34),
(57, 2, 2, '2019-04-23', '1060', '', 20000, 0, 0, NULL, NULL),
(58, 10, 6, '2019-04-23', '4010', '', -19047.62, 0, 0, NULL, NULL),
(59, 10, 6, '2019-04-23', '1200', '', 20000, 0, 0, 2, 0x34),
(60, 10, 6, '2019-04-23', '2150', '', -952.38, 0, 0, NULL, NULL),
(61, 10, 7, '2019-04-23', '4010', '', -20, 0, 0, NULL, NULL),
(62, 10, 7, '2019-04-23', '4510', '', 4, 0, 0, NULL, NULL),
(63, 10, 7, '2019-04-23', '1200', '', 16, 0, 0, 2, 0x34),
(64, 12, 6, '2019-04-23', '1065', '', 16, 0, 0, NULL, NULL),
(65, 12, 6, '2019-04-23', '1200', '', -16, 0, 0, 2, 0x34),
(66, 12, 7, '2019-04-23', '1060', '', 200, 0, 0, NULL, NULL),
(67, 12, 7, '2019-04-23', '1200', '', -200, 0, 0, 2, 0x34),
(68, 10, 8, '2019-04-23', '4010', '', -4000000, 1, 0, NULL, NULL),
(69, 10, 8, '2019-04-23', '1200', '', 4000000, 0, 0, 2, 0x3134),
(70, 12, 8, '2019-04-23', '1060', '', 2000, 0, 0, NULL, NULL),
(71, 12, 8, '2019-04-23', '1200', '', -2000, 0, 0, 2, 0x3134),
(72, 22, 1, '2019-04-23', '2100', '', 2000, 0, 0, 3, 0x34),
(73, 22, 1, '2019-04-23', '1060', '', -2000, 0, 0, NULL, NULL),
(74, 10, 9, '2019-04-23', '4010', '', -40000, 1, 0, NULL, NULL),
(75, 10, 9, '2019-04-23', '1200', '', 40000, 0, 0, 2, 0x3134),
(76, 10, 10, '2019-04-23', '4010', '', -1000000, 0, 0, NULL, NULL),
(77, 10, 10, '2019-04-23', '1200', '', 1000000, 0, 0, 2, 0x3135),
(78, 12, 9, '2019-04-23', '1065', '', 1000000, 0, 0, NULL, NULL),
(79, 12, 9, '2019-04-23', '1200', '', -1000000, 0, 0, 2, 0x3135),
(80, 12, 10, '2019-04-23', '1060', '', 3000000, 0, 0, NULL, NULL),
(81, 12, 10, '2019-04-23', '1200', '', -4000000, 0, 0, 2, 0x3134),
(82, 12, 10, '2019-04-23', '4500', '', 1000000, 0, 0, NULL, NULL),
(83, 12, 11, '2019-04-24', '1060', '', 39980, 0, 0, NULL, NULL),
(84, 12, 11, '2019-04-24', '1200', '', -40000, 0, 0, 2, 0x3134),
(85, 12, 11, '2019-04-24', '4500', '', 20, 0, 0, NULL, NULL),
(86, 10, 11, '2019-04-24', '4010', '', -40000, 0, 0, NULL, NULL),
(87, 10, 11, '2019-04-24', '1200', '', 40000, 0, 0, 2, 0x3135),
(88, 12, 12, '2019-04-24', '1065', '', 40000, 0, 0, NULL, NULL),
(89, 12, 12, '2019-04-24', '1200', '', -40000, 0, 0, 2, 0x3135),
(90, 12, 13, '2019-04-24', '1060', '', 19800, 0, 0, NULL, NULL),
(91, 12, 13, '2019-04-24', '1200', '', -19800, 0, 0, 2, 0x34),
(92, 10, 12, '2019-04-24', '4010', '', -40000, 0, 0, NULL, NULL),
(93, 10, 12, '2019-04-24', '1200', '', 40000, 0, 0, 2, 0x3135),
(94, 12, 14, '2019-04-24', '1060', '', 200, 0, 0, NULL, NULL),
(95, 12, 14, '2019-04-24', '1200', '', -200, 0, 0, 2, 0x3135),
(96, 12, 15, '2019-04-24', '1060', '', 400, 0, 0, NULL, NULL),
(97, 12, 15, '2019-04-24', '1200', '', -400, 0, 0, 2, 0x3135),
(98, 12, 16, '2019-04-24', '1060', '', 200, 0, 0, NULL, NULL),
(99, 12, 16, '2019-04-24', '1200', '', -200, 0, 0, 2, 0x3135),
(100, 12, 16, '2019-04-24', '772', '', 40, 0, 0, 2, 0x3135),
(101, 12, 16, '2019-04-24', '5626', '', 10, 0, 0, 2, 0x3135),
(102, 12, 16, '2019-04-24', '94244659', '', 8, 0, 0, 2, 0x3135),
(103, 10, 13, '2019-04-25', '4010', '', -4000, 1, 0, NULL, NULL),
(104, 10, 13, '2019-04-25', '4510', '', 400, 1, 0, NULL, NULL),
(105, 10, 13, '2019-04-25', '1200', '', 3600, 0, 0, 2, 0x3134),
(106, 10, 14, '2019-04-25', '4010', '', -5411560, 1, 0, NULL, NULL),
(107, 10, 14, '2019-04-25', '1200', '', 6115063, 0, 0, 2, 0x3134),
(108, 10, 14, '2019-04-25', '4430', '', -703503, 0, 0, NULL, NULL),
(109, 12, 17, '2019-04-25', '1060', '', 6115063, 0, 0, NULL, NULL),
(110, 12, 17, '2019-04-25', '1200', '', -6115063, 0, 0, 2, 0x3134),
(111, 12, 17, '2019-04-25', '772', '', 140700, 0, 0, 2, 0x3134),
(112, 12, 17, '2019-04-25', '5626', '', 811734, 0, 0, 2, 0x3134),
(113, 12, 17, '2019-04-25', '94244659', '', 489205, 0, 0, 2, 0x3134),
(114, 25, 4, '2019-04-25', '1510', '23561', 1000000, 0, 0, NULL, NULL),
(115, 25, 4, '2019-04-25', '1550', '', -1000000, 0, 0, NULL, NULL),
(116, 20, 2, '2019-04-25', '2100', '', -1000000, 0, 0, 3, 0x34),
(117, 20, 2, '2019-04-25', '1550', '', 1000000, 1, 0, NULL, NULL),
(118, 10, 15, '2019-04-25', '4010', '', -0.14, 1, 0, NULL, NULL),
(119, 10, 15, '2019-04-25', '1200', '', 0.14, 0, 0, 2, 0x3134),
(120, 10, 16, '2019-04-25', '4010', '', -7000, 1, 0, NULL, NULL),
(121, 10, 16, '2019-04-25', '1200', '', 7000, 0, 0, 2, 0x3134),
(122, 10, 17, '2019-04-25', '4010', '', -7000, 1, 0, NULL, NULL),
(123, 10, 17, '2019-04-25', '1200', '', 7000, 0, 0, 2, 0x3134),
(124, 12, 18, '2019-04-25', '1060', '', 180, 0, 0, NULL, NULL),
(125, 12, 18, '2019-04-25', '1200', '', -200, 0, 0, 2, 0x3134),
(126, 12, 18, '2019-04-25', '4500', '', 20, 0, 0, NULL, NULL),
(127, 12, 18, '2019-04-25', '772', '', 36, 0, 0, 2, 0x3134),
(128, 12, 18, '2019-04-25', '5626', '', 27, 0, 0, 2, 0x3134),
(129, 12, 18, '2019-04-25', '94244659', '', 2.88, 0, 0, 2, 0x3134),
(130, 10, 18, '2019-04-26', '4010', '', -172412.24, 1, 0, NULL, NULL),
(131, 10, 18, '2019-04-26', '1200', '', 172412.24, 0, 0, 2, 0x3134),
(132, 10, 19, '2019-04-29', '4010', '', -280, 1, 0, NULL, NULL),
(133, 10, 19, '2019-04-29', '1200', '', 280, 0, 0, 2, 0x3134),
(134, 10, 20, '2019-04-29', '4010', '', -5411560, 0, 0, NULL, NULL),
(135, 10, 20, '2019-04-29', '1200', '', 5411560, 0, 0, 2, 0x3136),
(136, 10, 21, '2019-04-29', '4010', '', -5411560, 0, 0, NULL, NULL),
(137, 10, 21, '2019-04-29', '1200', '', 5411560, 0, 0, 2, 0x3136),
(138, 12, 19, '2019-04-29', '1060', '', 5411560, 0, 0, NULL, NULL),
(139, 12, 19, '2019-04-29', '1200', '', -5411560, 0, 0, 2, 0x3136),
(140, 12, 19, '2019-04-29', '772', '', 40, 0, 0, 2, 0x3136),
(141, 12, 19, '2019-04-29', '5626', '', 30, 0, 0, 2, 0x3136),
(142, 12, 19, '2019-04-29', '94244659', '', 0, 0, 0, 2, 0x3136),
(143, 12, 20, '2019-04-29', '1060', '', 5411560, 0, 0, NULL, NULL),
(144, 12, 20, '2019-04-29', '1200', '', -5411560, 0, 0, 2, 0x3136),
(145, 12, 20, '2019-04-29', '772', '', 0, 0, 0, 2, 0x3136),
(146, 12, 20, '2019-04-29', '5626', '', 0, 0, 0, 2, 0x3136),
(147, 12, 20, '2019-04-29', '94244659', '', 0, 0, 0, 2, 0x3136),
(148, 10, 22, '2019-04-29', '4010', '', -990990, 0, 0, NULL, NULL),
(149, 10, 22, '2019-04-29', '4010', '', -990528, 0, 0, NULL, NULL),
(150, 10, 22, '2019-04-29', '1200', '', 1981518, 0, 0, 2, 0x3136),
(151, 12, 21, '2019-04-29', '1060', '', 1981518, 0, 0, NULL, NULL),
(152, 12, 21, '2019-04-29', '1200', '', -1981518, 0, 0, 2, 0x3136),
(153, 12, 21, '2019-04-29', '772', '', 200000, 0, 0, 2, 0x3136),
(154, 12, 21, '2019-04-29', '5626', '', 0, 0, 0, 2, 0x3136),
(155, 12, 21, '2019-04-29', '94244659', '', 190000, 0, 0, 2, 0x3136),
(156, 10, 23, '2019-04-29', '4010', '', -5, 0, 0, NULL, NULL),
(157, 10, 23, '2019-04-29', '1200', '', 5, 0, 0, 2, 0x3136),
(158, 10, 24, '2019-04-29', '4010', '', -5, 0, 0, NULL, NULL),
(159, 10, 24, '2019-04-29', '1200', '', 5, 0, 0, 2, 0x3136);

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_grn_batch`
--

CREATE TABLE `sma_fin_grn_batch` (
  `id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL DEFAULT '0',
  `purch_order_no` int(11) DEFAULT NULL,
  `reference` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `delivery_date` date NOT NULL DEFAULT '0000-00-00',
  `loc_code` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rate` double DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_grn_items`
--

CREATE TABLE `sma_fin_grn_items` (
  `id` int(11) NOT NULL,
  `grn_batch_id` int(11) DEFAULT NULL,
  `po_detail_item` int(11) NOT NULL DEFAULT '0',
  `item_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` tinytext COLLATE utf8_unicode_ci,
  `qty_recd` double NOT NULL DEFAULT '0',
  `quantity_inv` double NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_groups`
--

CREATE TABLE `sma_fin_groups` (
  `id` smallint(6) UNSIGNED NOT NULL,
  `description` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sma_fin_groups`
--

INSERT INTO `sma_fin_groups` (`id`, `description`, `inactive`) VALUES
(1, 'Small', 0),
(2, 'Medium', 0),
(3, 'Large', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_item_codes`
--

CREATE TABLE `sma_fin_item_codes` (
  `id` int(11) UNSIGNED NOT NULL,
  `item_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `stock_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `category_id` smallint(6) UNSIGNED NOT NULL,
  `quantity` double NOT NULL DEFAULT '1',
  `is_foreign` tinyint(1) NOT NULL DEFAULT '0',
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_item_tax_types`
--

CREATE TABLE `sma_fin_item_tax_types` (
  `id` int(11) NOT NULL,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `exempt` tinyint(1) NOT NULL DEFAULT '0',
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sma_fin_item_tax_types`
--

INSERT INTO `sma_fin_item_tax_types` (`id`, `name`, `exempt`, `inactive`) VALUES
(1, 'Regular', 0, 0),
(2, 'Special', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_item_tax_type_exemptions`
--

CREATE TABLE `sma_fin_item_tax_type_exemptions` (
  `item_tax_type_id` int(11) NOT NULL DEFAULT '0',
  `tax_type_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sma_fin_item_tax_type_exemptions`
--

INSERT INTO `sma_fin_item_tax_type_exemptions` (`item_tax_type_id`, `tax_type_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_item_units`
--

CREATE TABLE `sma_fin_item_units` (
  `abbr` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `decimals` tinyint(2) NOT NULL,
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sma_fin_item_units`
--

INSERT INTO `sma_fin_item_units` (`abbr`, `name`, `decimals`, `inactive`) VALUES
('each', 'Each', 0, 0),
('KG', 'Kilogram', 0, 0),
('Ltr', 'Litre', 0, 0),
('M. Tonne', 'Martic Tonne', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_journal`
--

CREATE TABLE `sma_fin_journal` (
  `type` smallint(6) NOT NULL DEFAULT '0',
  `trans_no` int(11) NOT NULL DEFAULT '0',
  `tran_date` date DEFAULT '0000-00-00',
  `reference` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `source_ref` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `event_date` date DEFAULT '0000-00-00',
  `doc_date` date NOT NULL DEFAULT '0000-00-00',
  `currency` char(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `amount` double NOT NULL DEFAULT '0',
  `rate` double NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sma_fin_journal`
--

INSERT INTO `sma_fin_journal` (`type`, `trans_no`, `tran_date`, `reference`, `source_ref`, `event_date`, `doc_date`, `currency`, `amount`, `rate`) VALUES
(0, 1, '2017-12-31', '001/2012', '', '2017-12-31', '2017-12-31', 'USD', 2163.57, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_locations`
--

CREATE TABLE `sma_fin_locations` (
  `loc_code` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `location_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `delivery_address` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `phone2` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fax` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contact` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fixed_asset` tinyint(1) NOT NULL DEFAULT '0',
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sma_fin_locations`
--

INSERT INTO `sma_fin_locations` (`loc_code`, `location_name`, `delivery_address`, `phone`, `phone2`, `fax`, `email`, `contact`, `fixed_asset`, `inactive`) VALUES
('DEF', 'Default', 'N/A', '', '', '', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_loc_stock`
--

CREATE TABLE `sma_fin_loc_stock` (
  `loc_code` char(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `stock_id` char(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reorder_level` double NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sma_fin_loc_stock`
--

INSERT INTO `sma_fin_loc_stock` (`loc_code`, `stock_id`, `reorder_level`) VALUES
('DEF', '101', 0),
('DEF', '102', 0),
('DEF', '103', 0),
('DEF', '201', 0),
('DEF', '202', 0),
('DEF', '235165', 0),
('DEF', '301', 0),
('DEF', 'A-3654', 0),
('DEF', 'A-8758', 0),
('DEF', 'A-9587', 0),
('DEF', 'gtry', 0),
('DEF', 't2', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_payment_terms`
--

CREATE TABLE `sma_fin_payment_terms` (
  `terms_indicator` int(11) NOT NULL,
  `terms` char(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `days_before_due` smallint(6) NOT NULL DEFAULT '0',
  `day_in_following_month` smallint(6) NOT NULL DEFAULT '0',
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sma_fin_payment_terms`
--

INSERT INTO `sma_fin_payment_terms` (`terms_indicator`, `terms`, `days_before_due`, `day_in_following_month`, `inactive`) VALUES
(1, 'Due 15th Of the Following Month', 0, 17, 0),
(2, 'Due By End Of The Following Month', 0, 30, 0),
(3, 'Payment due within 10 days', 10, 0, 0),
(4, 'Cash Only', 0, 0, 0),
(7, 'Cheque', 90, 0, 0),
(8, 'Pay Order', 90, 0, 0),
(9, 'Draft', 90, 0, 0),
(10, 'Bank Transfer', 90, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_prices`
--

CREATE TABLE `sma_fin_prices` (
  `id` int(11) NOT NULL,
  `stock_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sales_type_id` int(11) NOT NULL DEFAULT '0',
  `curr_abrev` char(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `price` double NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sma_fin_prices`
--

INSERT INTO `sma_fin_prices` (`id`, `stock_id`, `sales_type_id`, `curr_abrev`, `price`) VALUES
(1, '101', 1, 'USD', 300),
(2, '102', 1, 'USD', 250),
(3, '103', 1, 'USD', 50),
(4, 'A-3654', 1, 'PKR', 20),
(5, '235165', 1, 'PKR', 2000),
(6, 'gtry', 1, 'PKR', 0.14),
(9, 't2', 1, 'PKR', 462);

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_printers`
--

CREATE TABLE `sma_fin_printers` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `queue` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `host` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `port` smallint(11) UNSIGNED NOT NULL,
  `timeout` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sma_fin_printers`
--

INSERT INTO `sma_fin_printers` (`id`, `name`, `description`, `queue`, `host`, `port`, `timeout`) VALUES
(1, 'QL500', 'Label printer', 'QL500', 'server', 127, 20),
(2, 'Samsung', 'Main network printer', 'scx4521F', 'server', 515, 5),
(3, 'Local', 'Local print server at user IP', 'lp', '', 515, 10);

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_print_profiles`
--

CREATE TABLE `sma_fin_print_profiles` (
  `id` smallint(6) UNSIGNED NOT NULL,
  `profile` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `report` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `printer` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sma_fin_print_profiles`
--

INSERT INTO `sma_fin_print_profiles` (`id`, `profile`, `report`, `printer`) VALUES
(1, 'Out of office', '', 0),
(2, 'Sales Department', '', 0),
(3, 'Central', '', 2),
(4, 'Sales Department', '104', 2),
(5, 'Sales Department', '105', 2),
(6, 'Sales Department', '107', 2),
(7, 'Sales Department', '109', 2),
(8, 'Sales Department', '110', 2),
(9, 'Sales Department', '201', 2);

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_purch_data`
--

CREATE TABLE `sma_fin_purch_data` (
  `supplier_id` int(11) NOT NULL DEFAULT '0',
  `stock_id` char(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `price` double NOT NULL DEFAULT '0',
  `suppliers_uom` char(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `conversion_factor` double NOT NULL DEFAULT '1',
  `supplier_description` char(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sma_fin_purch_data`
--

INSERT INTO `sma_fin_purch_data` (`supplier_id`, `stock_id`, `price`, `suppliers_uom`, `conversion_factor`, `supplier_description`) VALUES
(1, '101', 200, '', 1, 'iPad Air 2 16GB'),
(1, '102', 150, '', 1, 'iPhone 6 64GB'),
(1, '103', 10, '', 1, 'iPhone Cover Case'),
(3, 'A-3654', 15, '', 1, 'Charcoal'),
(4, '23561', 1000, '', 1, 'petrol');

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_purch_orders`
--

CREATE TABLE `sma_fin_purch_orders` (
  `order_no` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL DEFAULT '0',
  `comments` tinytext COLLATE utf8_unicode_ci,
  `ord_date` date NOT NULL DEFAULT '0000-00-00',
  `reference` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `requisition_no` tinytext COLLATE utf8_unicode_ci,
  `into_stock_location` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `delivery_address` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `total` double NOT NULL DEFAULT '0',
  `prep_amount` double NOT NULL DEFAULT '0',
  `alloc` double NOT NULL DEFAULT '0',
  `tax_included` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sma_fin_purch_orders`
--

INSERT INTO `sma_fin_purch_orders` (`order_no`, `supplier_id`, `comments`, `ord_date`, `reference`, `requisition_no`, `into_stock_location`, `delivery_address`, `total`, `prep_amount`, `alloc`, `tax_included`) VALUES
(1, 1, NULL, '2017-05-05', '001/2017', NULL, 'DEF', 'N/A', 37800, 0, 0, 0),
(2, 1, NULL, '2017-05-05', 'auto', 'rr4', 'DEF', 'N/A', 3150, 0, 0, 0),
(3, 3, '', '2019-01-09', 'auto', '', 'DEF', 'N/A', 15000, 0, 0, 0),
(4, 4, '', '2019-03-29', '001/2019', '', 'DEF', 'N/A', 20390, 0, 0, 0),
(5, 4, '', '2019-04-04', '002/2019', '51651516', 'DEF', 'N/A', 7000, 0, 0, 0),
(6, 4, 'yes', '2019-04-25', 'auto', '12345', 'DEF', 'abcd nazimabad', 1000000, 0, 0, 0),
(7, 3, 'as', '2019-04-25', '003/2019', 'aaa', 'DEF', 'N/A', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_purch_order_details`
--

CREATE TABLE `sma_fin_purch_order_details` (
  `po_detail_item` int(11) NOT NULL,
  `order_no` int(11) NOT NULL DEFAULT '0',
  `item_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` tinytext COLLATE utf8_unicode_ci,
  `delivery_date` date NOT NULL DEFAULT '0000-00-00',
  `qty_invoiced` double NOT NULL DEFAULT '0',
  `unit_price` double NOT NULL DEFAULT '0',
  `act_price` double NOT NULL DEFAULT '0',
  `std_cost_unit` double NOT NULL DEFAULT '0',
  `quantity_ordered` double NOT NULL DEFAULT '0',
  `quantity_received` double NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sma_fin_purch_order_details`
--

INSERT INTO `sma_fin_purch_order_details` (`po_detail_item`, `order_no`, `item_code`, `description`, `delivery_date`, `qty_invoiced`, `unit_price`, `act_price`, `std_cost_unit`, `quantity_ordered`, `quantity_received`) VALUES
(1, 1, '101', 'iPad Air 2 16GB', '2017-05-15', 0, 200, 200, 200, 100, 100),
(2, 1, '102', 'iPhone 6 64GB', '2017-05-15', 0, 150, 150, 150, 100, 100),
(3, 1, '103', 'iPhone Cover Case', '2017-05-15', 0, 10, 10, 10, 100, 100),
(4, 2, '101', 'iPad Air 2 16GB', '2017-05-05', 15, 200, 200, 200, 15, 15),
(5, 3, 'A-3654', 'Charcoal', '2019-01-09', 0, 15, 15, 15, 1000, 1000),
(6, 4, '235165', 'Petrol', '2019-04-08', 0, 200, 0, 0, 100, 0),
(7, 4, '72341230', 'testing 123', '2019-04-08', 0, 10, 0, 0, 39, 0),
(8, 5, '651561', 'Highoctane', '2019-04-14', 0, 2000, 0, 0, 1, 0),
(9, 5, '235165', 'Petrol', '2019-04-14', 0, 50, 0, 0, 100, 0),
(10, 6, '23561', 'petrol', '2019-04-25', 1000, 1000, 1000, 1000, 1000, 1000),
(11, 7, '23561', 'petrol', '2019-05-05', 0, 0, 0, 0, 100, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_quick_entries`
--

CREATE TABLE `sma_fin_quick_entries` (
  `id` smallint(6) UNSIGNED NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `description` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `usage` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `base_amount` double NOT NULL DEFAULT '0',
  `base_desc` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bal_type` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sma_fin_quick_entries`
--

INSERT INTO `sma_fin_quick_entries` (`id`, `type`, `description`, `usage`, `base_amount`, `base_desc`, `bal_type`) VALUES
(1, 1, 'Maintenance', NULL, 0, 'Amount', 0),
(2, 4, 'Phone', NULL, 0, 'Amount', 0),
(3, 2, 'Cash Sales', 'Retail sales without invoice', 0, 'Amount', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_quick_entry_lines`
--

CREATE TABLE `sma_fin_quick_entry_lines` (
  `id` smallint(6) UNSIGNED NOT NULL,
  `qid` smallint(6) UNSIGNED NOT NULL,
  `amount` double DEFAULT '0',
  `memo` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `dest_id` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dimension_id` smallint(6) UNSIGNED DEFAULT NULL,
  `dimension2_id` smallint(6) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sma_fin_quick_entry_lines`
--

INSERT INTO `sma_fin_quick_entry_lines` (`id`, `qid`, `amount`, `memo`, `action`, `dest_id`, `dimension_id`, `dimension2_id`) VALUES
(1, 1, 0, '', 't-', '1', 0, 0),
(2, 2, 0, '', 't-', '1', 0, 0),
(3, 3, 0, '', 't-', '1', 0, 0),
(4, 3, 0, '', '=', '4010', 0, 0),
(5, 1, 0, '', '=', '5765', 0, 0),
(6, 2, 0, '', '=', '5780', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_recurrent_invoices`
--

CREATE TABLE `sma_fin_recurrent_invoices` (
  `id` smallint(6) UNSIGNED NOT NULL,
  `description` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `order_no` int(11) UNSIGNED NOT NULL,
  `debtor_no` int(11) UNSIGNED DEFAULT NULL,
  `group_no` smallint(6) UNSIGNED DEFAULT NULL,
  `days` int(11) NOT NULL DEFAULT '0',
  `monthly` int(11) NOT NULL DEFAULT '0',
  `begin` date NOT NULL DEFAULT '0000-00-00',
  `end` date NOT NULL DEFAULT '0000-00-00',
  `last_sent` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sma_fin_recurrent_invoices`
--

INSERT INTO `sma_fin_recurrent_invoices` (`id`, `description`, `order_no`, `debtor_no`, `group_no`, `days`, `monthly`, `begin`, `end`, `last_sent`) VALUES
(1, 'Weekly Maintenance', 6, 1, 1, 7, 0, '2017-04-01', '2020-05-07', '2017-04-08');

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_reflines`
--

CREATE TABLE `sma_fin_reflines` (
  `id` int(11) NOT NULL,
  `trans_type` int(11) NOT NULL,
  `prefix` char(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pattern` varchar(35) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `description` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `default` tinyint(1) NOT NULL DEFAULT '0',
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sma_fin_reflines`
--

INSERT INTO `sma_fin_reflines` (`id`, `trans_type`, `prefix`, `pattern`, `description`, `default`, `inactive`) VALUES
(1, 0, '', '{001}/{YYYY}', '', 1, 0),
(2, 1, '', '{001}/{YYYY}', '', 1, 0),
(3, 2, '', '{001}/{YYYY}', '', 1, 0),
(4, 4, '', '{001}/{YYYY}', '', 1, 0),
(5, 10, '', '{001}/{YYYY}', '', 1, 0),
(6, 11, '', '{001}/{YYYY}', '', 1, 0),
(7, 12, '', '{001}/{YYYY}', '', 1, 0),
(8, 13, '', '{001}/{YYYY}', '', 1, 0),
(9, 16, '', '{001}/{YYYY}', '', 1, 0),
(10, 17, '', '{001}/{YYYY}', '', 1, 0),
(11, 18, '', '{001}/{YYYY}', '', 1, 0),
(12, 20, '', '{001}/{YYYY}', '', 1, 0),
(13, 21, '', '{001}/{YYYY}', '', 1, 0),
(14, 22, '', '{001}/{YYYY}', '', 1, 0),
(15, 25, '', '{001}/{YYYY}', '', 1, 0),
(16, 26, '', '{001}/{YYYY}', '', 1, 0),
(17, 28, '', '{001}/{YYYY}', '', 1, 0),
(18, 29, '', '{001}/{YYYY}', '', 1, 0),
(19, 30, '', '{001}/{YYYY}', '', 1, 0),
(20, 32, '', '{001}/{YYYY}', '', 1, 0),
(21, 35, '', '{001}/{YYYY}', '', 1, 0),
(22, 40, '', '{001}/{YYYY}', '', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_refs`
--

CREATE TABLE `sma_fin_refs` (
  `id` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `reference` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sma_fin_refs`
--

INSERT INTO `sma_fin_refs` (`id`, `type`, `reference`) VALUES
(1, 0, '001/2012'),
(1, 1, '001/2017'),
(1, 2, '001/2019'),
(2, 2, '002/2019'),
(1, 10, '001/2017'),
(5, 10, '001/2019'),
(2, 10, '002/2017'),
(6, 10, '002/2019'),
(3, 10, '003/2017'),
(7, 10, '003/2019'),
(4, 10, '004/2017'),
(8, 10, '004/2019'),
(9, 10, '005/2019'),
(10, 10, '006/2019'),
(11, 10, '007/2019'),
(12, 10, '008/2019'),
(13, 10, '009/2019'),
(14, 10, '010/2019'),
(15, 10, '011/2019'),
(16, 10, '012/2019'),
(17, 10, '013/2019'),
(18, 10, '014/2019'),
(19, 10, '015/2019'),
(20, 10, '016/2019'),
(21, 10, '017/2019'),
(22, 10, '018/2019'),
(23, 10, '019/2019'),
(24, 10, '020/2019'),
(1, 12, '001/2017'),
(4, 12, '001/2019'),
(2, 12, '002/2017'),
(5, 12, '002/2019'),
(3, 12, '003/2017'),
(6, 12, '003/2019'),
(7, 12, '004/2019'),
(8, 12, '005/2019'),
(9, 12, '006/2019'),
(10, 12, '007/2019'),
(11, 12, '008/2019'),
(12, 12, '009/2019'),
(13, 12, '010/2019'),
(14, 12, '011/2019'),
(15, 12, '012/2019'),
(16, 12, '013/2019'),
(17, 12, '014/2019'),
(18, 12, '015/2019'),
(19, 12, '016/2019'),
(20, 12, '017/2019'),
(21, 12, '018/2019'),
(6, 13, '001/2019'),
(8, 13, '002/2019'),
(9, 13, '003/2019'),
(11, 13, '004/2019'),
(13, 13, '005/2019'),
(1, 17, '001/2019'),
(2, 17, '002/2019'),
(1, 18, '001/2017'),
(4, 18, '001/2019'),
(5, 18, '002/2019'),
(7, 18, '003/2019'),
(1, 20, '001/2017'),
(2, 20, '001/2019'),
(1, 22, '001/2019'),
(1, 25, '001/2017'),
(3, 25, '001/2019'),
(1, 26, '001/2017'),
(2, 26, '002/2017'),
(3, 26, '003/2017'),
(3, 30, '001/2017'),
(8, 30, '001/2019'),
(4, 30, '002/2017'),
(10, 30, '002/2019'),
(6, 30, '003/2017'),
(12, 30, '003/2019'),
(14, 30, '004/2019'),
(16, 30, '005/2019'),
(1, 32, '001/2019'),
(1, 40, '001/2017');

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_salesman`
--

CREATE TABLE `sma_fin_salesman` (
  `salesman_code` int(11) NOT NULL,
  `salesman_name` char(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `salesman_phone` char(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `salesman_fax` char(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `salesman_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `provision` double NOT NULL DEFAULT '0',
  `break_pt` double NOT NULL DEFAULT '0',
  `provision2` double NOT NULL DEFAULT '0',
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sma_fin_salesman`
--

INSERT INTO `sma_fin_salesman` (`salesman_code`, `salesman_name`, `salesman_phone`, `salesman_fax`, `salesman_email`, `provision`, `break_pt`, `provision2`, `inactive`) VALUES
(1, 'Sales Person', '', '', '', 5, 1000, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_sales_orders`
--

CREATE TABLE `sma_fin_sales_orders` (
  `order_no` int(11) NOT NULL,
  `trans_type` smallint(6) NOT NULL DEFAULT '30',
  `version` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `debtor_no` int(11) NOT NULL DEFAULT '0',
  `branch_code` int(11) NOT NULL DEFAULT '0',
  `reference` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `customer_ref` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `comments` tinytext COLLATE utf8_unicode_ci,
  `ord_date` date NOT NULL DEFAULT '0000-00-00',
  `order_type` int(11) NOT NULL DEFAULT '0',
  `ship_via` int(11) NOT NULL DEFAULT '0',
  `delivery_address` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `contact_phone` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deliver_to` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `freight_cost` double NOT NULL DEFAULT '0',
  `from_stk_loc` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `delivery_date` date NOT NULL DEFAULT '0000-00-00',
  `payment_terms` int(11) DEFAULT NULL,
  `total` double NOT NULL DEFAULT '0',
  `prep_amount` double NOT NULL DEFAULT '0',
  `alloc` double NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_sales_order_details`
--

CREATE TABLE `sma_fin_sales_order_details` (
  `id` int(11) NOT NULL,
  `order_no` int(11) NOT NULL DEFAULT '0',
  `trans_type` smallint(6) NOT NULL DEFAULT '30',
  `stk_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` tinytext COLLATE utf8_unicode_ci,
  `qty_sent` double NOT NULL DEFAULT '0',
  `unit_price` double NOT NULL DEFAULT '0',
  `quantity` double NOT NULL DEFAULT '0',
  `invoiced` double NOT NULL DEFAULT '0',
  `discount_percent` double NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_sales_pos`
--

CREATE TABLE `sma_fin_sales_pos` (
  `id` smallint(6) UNSIGNED NOT NULL,
  `pos_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `cash_sale` tinyint(1) NOT NULL,
  `credit_sale` tinyint(1) NOT NULL,
  `pos_location` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `pos_account` smallint(6) UNSIGNED NOT NULL,
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sma_fin_sales_pos`
--

INSERT INTO `sma_fin_sales_pos` (`id`, `pos_name`, `cash_sale`, `credit_sale`, `pos_location`, `pos_account`, `inactive`) VALUES
(1, 'Default', 1, 1, 'DEF', 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_sales_types`
--

CREATE TABLE `sma_fin_sales_types` (
  `id` int(11) NOT NULL,
  `sales_type` char(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tax_included` int(1) NOT NULL DEFAULT '0',
  `factor` double NOT NULL DEFAULT '1',
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sma_fin_sales_types`
--

INSERT INTO `sma_fin_sales_types` (`id`, `sales_type`, `tax_included`, `factor`, `inactive`) VALUES
(1, 'Storage', 1, 1, 0),
(2, 'Gantry', 0, 0.7, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_security_roles`
--

CREATE TABLE `sma_fin_security_roles` (
  `id` int(11) NOT NULL,
  `role` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sections` text COLLATE utf8_unicode_ci,
  `areas` text COLLATE utf8_unicode_ci,
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sma_fin_security_roles`
--

INSERT INTO `sma_fin_security_roles` (`id`, `role`, `description`, `sections`, `areas`, `inactive`) VALUES
(1, 'Inquiries', 'Inquiries', '768;2816;3072;3328;5632;5888;8192;8448;10752;11008;13312;15872;16128', '257;258;259;260;513;514;515;516;517;518;519;520;521;522;523;524;525;773;774;2822;3073;3075;3076;3077;3329;3330;3331;3332;3333;3334;3335;5377;5633;5640;5889;5890;5891;7937;7938;7939;7940;8193;8194;8450;8451;10497;10753;11009;11010;11012;13313;13315;15617;15618;15619;15620;15621;15622;15623;15624;15625;15626;15873;15882;16129;16130;16131;16132;775', 0),
(2, 'System Administrator', 'System Administrator', '256;512;768;2816;3072;3328;5376;5632;5888;7936;8192;8448;9472;9728;10496;10752;11008;13056;13312;15616;15872;16128', '257;258;259;260;513;514;515;516;517;518;519;520;521;522;523;524;525;526;769;770;771;772;773;774;775;2817;2818;2819;2820;2821;2822;2823;3073;3074;3082;3075;3076;3077;3078;3079;3080;3081;3329;3330;3331;3332;3333;3334;3335;5377;5633;5634;5635;5636;5637;5641;5638;5639;5640;5889;5890;5891;7937;7938;7939;7940;8193;8194;8195;8196;8197;8449;8450;8451;9473;9474;9475;9476;9729;10497;10753;10754;10755;10756;10757;11009;11010;11011;11012;13057;13313;13314;13315;15617;15618;15619;15620;15621;15622;15623;15624;15628;15625;15626;15627;15630;15629;15873;15874;15875;15876;15877;15878;15879;15880;15883;15881;15882;15884;16129;16130;16131;16132;9217;9218;9220', 0),
(3, 'Salesman', 'Salesman', '768;3072;5632;8192;15872', '773;774;3073;3075;3081;5633;8194;15873;775', 0),
(4, 'Stock Manager', 'Stock Manager', '768;2816;3072;3328;5632;5888;8192;8448;10752;11008;13312;15872;16128', '2818;2822;3073;3076;3077;3329;3330;3330;3330;3331;3331;3332;3333;3334;3335;5633;5640;5889;5890;5891;8193;8194;8450;8451;10753;11009;11010;11012;13313;13315;15882;16129;16130;16131;16132;775', 0),
(5, 'Production Manager', 'Production Manager', '512;768;2816;3072;3328;5632;5888;8192;8448;10752;11008;13312;15616;15872;16128', '521;523;524;2818;2819;2820;2821;2822;2823;3073;3074;3076;3077;3078;3079;3080;3081;3329;3330;3330;3330;3331;3331;3332;3333;3334;3335;5633;5640;5640;5889;5890;5891;8193;8194;8196;8197;8450;8451;10753;10755;11009;11010;11012;13313;13315;15617;15619;15620;15621;15624;15624;15876;15877;15880;15882;16129;16130;16131;16132;775', 0),
(6, 'Purchase Officer', 'Purchase Officer', '512;768;2816;3072;3328;5376;5632;5888;8192;8448;10752;11008;13312;15616;15872;16128', '521;523;524;2818;2819;2820;2821;2822;2823;3073;3074;3076;3077;3078;3079;3080;3081;3329;3330;3330;3330;3331;3331;3332;3333;3334;3335;5377;5633;5635;5640;5640;5889;5890;5891;8193;8194;8196;8197;8449;8450;8451;10753;10755;11009;11010;11012;13313;13315;15617;15619;15620;15621;15624;15624;15876;15877;15880;15882;16129;16130;16131;16132;775', 0),
(7, 'AR Officer', 'AR Officer', '512;768;2816;3072;3328;5632;5888;8192;8448;10752;11008;13312;15616;15872;16128', '521;523;524;771;773;774;2818;2819;2820;2821;2822;2823;3073;3073;3074;3075;3076;3077;3078;3079;3080;3081;3081;3329;3330;3330;3330;3331;3331;3332;3333;3334;3335;5633;5633;5634;5637;5638;5639;5640;5640;5889;5890;5891;8193;8194;8194;8196;8197;8450;8451;10753;10755;11009;11010;11012;13313;13315;15617;15619;15620;15621;15624;15624;15873;15876;15877;15878;15880;15882;16129;16130;16131;16132;775', 0),
(8, 'AP Officer', 'AP Officer', '512;768;2816;3072;3328;5376;5632;5888;8192;8448;10752;11008;13312;15616;15872;16128', '257;258;259;260;521;523;524;769;770;771;772;773;774;2818;2819;2820;2821;2822;2823;3073;3074;3082;3076;3077;3078;3079;3080;3081;3329;3330;3331;3332;3333;3334;3335;5377;5633;5635;5640;5889;5890;5891;7937;7938;7939;7940;8193;8194;8196;8197;8449;8450;8451;10497;10753;10755;11009;11010;11012;13057;13313;13315;15617;15619;15620;15621;15624;15876;15877;15880;15882;16129;16130;16131;16132;775', 0),
(9, 'Accountant', 'New Accountant', '768;3072;3328;5376;5632;5888;8192;8448;10752;11008;13312;15616;15872;16128', '771;772;773;774;775;3073;3074;3075;3076;3077;3078;3079;3080;3081;3329;3330;3331;3332;3333;3334;3335;5377;5633;5634;5635;5637;5638;5639;5640;5889;5890;5891;8193;8194;8196;8197;8449;8450;8451;10753;10755;11009;11010;11012;13313;13315;15617;15618;15619;15620;15621;15624;15873;15876;15877;15878;15880;15882;16129;16130;16131;16132;257;258;259;260;521;523;524;2820;2821;2822;2823;7937;7938;7939;7940;10497', 0),
(10, 'Sub Admin', 'Sub Admin', '512;768;2816;3072;3328;5376;5632;5888;8192;8448;10752;11008;13312;15616;15872;16128', '257;258;259;260;521;523;524;771;772;773;774;2818;2819;2820;2821;2822;2823;3073;3074;3082;3075;3076;3077;3078;3079;3080;3081;3329;3330;3331;3332;3333;3334;3335;5377;5633;5634;5635;5637;5638;5639;5640;5889;5890;5891;7937;7938;7939;7940;8193;8194;8196;8197;8449;8450;8451;10497;10753;10755;11009;11010;11012;13057;13313;13315;15617;15619;15620;15621;15624;15873;15874;15876;15877;15878;15879;15880;15882;16129;16130;16131;16132;775', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_shippers`
--

CREATE TABLE `sma_fin_shippers` (
  `shipper_id` int(11) NOT NULL,
  `shipper_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `phone` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `phone2` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contact` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `address` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sma_fin_shippers`
--

INSERT INTO `sma_fin_shippers` (`shipper_id`, `shipper_name`, `phone`, `phone2`, `contact`, `address`, `inactive`) VALUES
(1, 'Default', '', '', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_sql_trail`
--

CREATE TABLE `sma_fin_sql_trail` (
  `id` int(11) UNSIGNED NOT NULL,
  `sql` text COLLATE utf8_unicode_ci NOT NULL,
  `result` tinyint(1) NOT NULL,
  `msg` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_stock_category`
--

CREATE TABLE `sma_fin_stock_category` (
  `category_id` int(11) NOT NULL,
  `description` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dflt_tax_type` int(11) NOT NULL DEFAULT '1',
  `dflt_units` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'each',
  `dflt_mb_flag` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'B',
  `dflt_sales_act` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dflt_cogs_act` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dflt_inventory_act` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dflt_adjustment_act` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dflt_wip_act` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dflt_dim1` int(11) DEFAULT NULL,
  `dflt_dim2` int(11) DEFAULT NULL,
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  `dflt_no_sale` tinyint(1) NOT NULL DEFAULT '0',
  `dflt_no_purchase` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sma_fin_stock_category`
--

INSERT INTO `sma_fin_stock_category` (`category_id`, `description`, `dflt_tax_type`, `dflt_units`, `dflt_mb_flag`, `dflt_sales_act`, `dflt_cogs_act`, `dflt_inventory_act`, `dflt_adjustment_act`, `dflt_wip_act`, `dflt_dim1`, `dflt_dim2`, `inactive`, `dflt_no_sale`, `dflt_no_purchase`) VALUES
(1, 'Components', 1, 'each', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0),
(2, 'Fuel', 1, 'each', 'B', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0),
(3, 'Systems', 1, 'each', 'M', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0),
(4, 'Services', 1, 'hr', 'D', '4010', '5010', '1510', '5040', '1530', 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_stock_fa_class`
--

CREATE TABLE `sma_fin_stock_fa_class` (
  `fa_class_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parent_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `long_description` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `depreciation_rate` double NOT NULL DEFAULT '0',
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_stock_master`
--

CREATE TABLE `sma_fin_stock_master` (
  `stock_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `category_id` int(11) NOT NULL DEFAULT '0',
  `tax_type_id` int(11) NOT NULL DEFAULT '0',
  `description` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `long_description` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `units` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'each',
  `mb_flag` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'B',
  `sales_account` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cogs_account` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `inventory_account` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `adjustment_account` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `wip_account` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dimension_id` int(11) DEFAULT NULL,
  `dimension2_id` int(11) DEFAULT NULL,
  `purchase_cost` double NOT NULL DEFAULT '0',
  `material_cost` double NOT NULL DEFAULT '0',
  `labour_cost` double NOT NULL DEFAULT '0',
  `overhead_cost` double NOT NULL DEFAULT '0',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  `no_sale` tinyint(1) NOT NULL DEFAULT '0',
  `no_purchase` tinyint(1) NOT NULL DEFAULT '0',
  `editable` tinyint(1) NOT NULL DEFAULT '0',
  `depreciation_method` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `depreciation_rate` double NOT NULL DEFAULT '0',
  `depreciation_factor` double NOT NULL DEFAULT '1',
  `depreciation_start` date NOT NULL DEFAULT '0000-00-00',
  `depreciation_date` date NOT NULL DEFAULT '0000-00-00',
  `fa_class_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sma_fin_stock_master`
--

INSERT INTO `sma_fin_stock_master` (`stock_id`, `category_id`, `tax_type_id`, `description`, `long_description`, `units`, `mb_flag`, `sales_account`, `cogs_account`, `inventory_account`, `adjustment_account`, `wip_account`, `dimension_id`, `dimension2_id`, `purchase_cost`, `material_cost`, `labour_cost`, `overhead_cost`, `inactive`, `no_sale`, `no_purchase`, `editable`, `depreciation_method`, `depreciation_rate`, `depreciation_factor`, `depreciation_start`, `depreciation_date`, `fa_class_id`) VALUES
('gtry', 4, 1, 'Gantry', 'Gantry', 'Ltr', 'D', '4010', '5010', '1510', '5040', '1530', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, '0000-00-00', '0000-00-00', '');

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_stock_moves`
--

CREATE TABLE `sma_fin_stock_moves` (
  `trans_id` int(11) NOT NULL,
  `trans_no` int(11) NOT NULL DEFAULT '0',
  `stock_id` char(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` smallint(6) NOT NULL DEFAULT '0',
  `loc_code` char(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tran_date` date NOT NULL DEFAULT '0000-00-00',
  `price` double NOT NULL DEFAULT '0',
  `reference` char(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `qty` double NOT NULL DEFAULT '1',
  `standard_cost` double NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_suppliers`
--

CREATE TABLE `sma_fin_suppliers` (
  `supplier_id` int(11) NOT NULL,
  `supp_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `supp_ref` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `address` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `supp_address` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `gst_no` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contact` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `supp_account_no` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `website` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `bank_account` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `curr_code` char(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_terms` int(11) DEFAULT NULL,
  `tax_included` tinyint(1) NOT NULL DEFAULT '0',
  `dimension_id` int(11) DEFAULT '0',
  `dimension2_id` int(11) DEFAULT '0',
  `tax_group_id` int(11) DEFAULT NULL,
  `credit_limit` double NOT NULL DEFAULT '0',
  `purchase_account` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `payable_account` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `payment_discount_account` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `notes` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sma_fin_suppliers`
--

INSERT INTO `sma_fin_suppliers` (`supplier_id`, `supp_name`, `supp_ref`, `address`, `supp_address`, `gst_no`, `contact`, `supp_account_no`, `website`, `bank_account`, `curr_code`, `payment_terms`, `tax_included`, `dimension_id`, `dimension2_id`, `tax_group_id`, `credit_limit`, `purchase_account`, `payable_account`, `payment_discount_account`, `notes`, `inactive`) VALUES
(1, 'Dino Saurius Inc.', 'Dino Saurius', 'N/A', '', '987654321', '', '', '', '', 'USD', 3, 0, 0, 0, 1, 0, '', '2100', '5060', '', 0),
(2, 'Beefeater Ltd.', 'Beefeater', 'N/A', '', '67565590', '', '', '', '', 'GBP', 4, 0, 0, 0, 1, 0, '', '2100', '5060', '', 0),
(3, 'Alamin', 'Alamin', '', '', '12', '', '', '', 'HBL', 'PKR', 4, 0, 0, 0, 2, 100000, '', '2100', '5060', '', 0),
(4, 'Yasir Raza', 'Yasir Raza', 'blah blha', 'nbakjsfbjkas', '61565165', 'NA', 'NA', 'NA', 'NA', 'PKR', 4, 0, 0, 0, 2, 203165, 'NA', '2100', '5060', 'kch bhi nae', 0),
(5, 'finance', 'finance', 'i dont know realy', 'blah blah', '94984', 'NA', 'NA', 'NA', 'NA', 'PKR', 3, 0, 0, 0, 2, 5161651, 'NA', '2100', '5060', '2 number supplier', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_supp_allocations`
--

CREATE TABLE `sma_fin_supp_allocations` (
  `id` int(11) NOT NULL,
  `person_id` int(11) DEFAULT NULL,
  `amt` double UNSIGNED DEFAULT NULL,
  `date_alloc` date NOT NULL DEFAULT '0000-00-00',
  `trans_no_from` int(11) DEFAULT NULL,
  `trans_type_from` int(11) DEFAULT NULL,
  `trans_no_to` int(11) DEFAULT NULL,
  `trans_type_to` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_supp_invoice_items`
--

CREATE TABLE `sma_fin_supp_invoice_items` (
  `id` int(11) NOT NULL,
  `supp_trans_no` int(11) DEFAULT NULL,
  `supp_trans_type` int(11) DEFAULT NULL,
  `gl_code` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `grn_item_id` int(11) DEFAULT NULL,
  `po_detail_item_id` int(11) DEFAULT NULL,
  `stock_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` tinytext COLLATE utf8_unicode_ci,
  `quantity` double NOT NULL DEFAULT '0',
  `unit_price` double NOT NULL DEFAULT '0',
  `unit_tax` double NOT NULL DEFAULT '0',
  `memo_` tinytext COLLATE utf8_unicode_ci,
  `dimension_id` int(11) NOT NULL DEFAULT '0',
  `dimension2_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_supp_trans`
--

CREATE TABLE `sma_fin_supp_trans` (
  `trans_no` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `type` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `supplier_id` int(11) UNSIGNED NOT NULL,
  `reference` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `supp_reference` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tran_date` date NOT NULL DEFAULT '0000-00-00',
  `due_date` date NOT NULL DEFAULT '0000-00-00',
  `ov_amount` double NOT NULL DEFAULT '0',
  `ov_discount` double NOT NULL DEFAULT '0',
  `ov_gst` double NOT NULL DEFAULT '0',
  `rate` double NOT NULL DEFAULT '1',
  `alloc` double NOT NULL DEFAULT '0',
  `tax_included` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_sys_prefs`
--

CREATE TABLE `sma_fin_sys_prefs` (
  `name` varchar(35) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `category` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `length` smallint(6) DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sma_fin_sys_prefs`
--

INSERT INTO `sma_fin_sys_prefs` (`name`, `category`, `type`, `length`, `value`) VALUES
('accounts_alpha', 'glsetup.general', 'tinyint', 1, '0'),
('accumulate_shipping', 'glsetup.customer', 'tinyint', 1, ''),
('add_pct', 'setup.company', 'int', 5, '-1'),
('allow_negative_prices', 'glsetup.inventory', 'tinyint', 1, '1'),
('allow_negative_stock', 'glsetup.inventory', 'tinyint', 1, '1'),
('alternative_tax_include_on_docs', 'setup.company', 'tinyint', 1, '1'),
('auto_curr_reval', 'setup.company', 'smallint', 6, '1'),
('bank_charge_act', 'glsetup.general', 'varchar', 15, '5690'),
('barcodes_on_stock', 'setup.company', 'tinyint', 1, ''),
('base_sales', 'setup.company', 'int', 11, '1'),
('bcc_email', 'setup.company', 'varchar', 100, ''),
('company_logo_report', 'setup.company', 'tinyint', 1, '1'),
('coy_logo', 'setup.company', 'varchar', 100, 'Almezan.png'),
('coy_name', 'setup.company', 'varchar', 60, 'ZY Bulk Terminal'),
('coy_no', 'setup.company', 'varchar', 25, ''),
('creditors_act', 'glsetup.purchase', 'varchar', 15, '2100'),
('curr_default', 'setup.company', 'char', 3, 'PKR'),
('debtors_act', 'glsetup.sales', 'varchar', 15, '1200'),
('default_adj_act', 'glsetup.items', 'varchar', 15, '5040'),
('default_cogs_act', 'glsetup.items', 'varchar', 15, '5010'),
('default_credit_limit', 'glsetup.customer', 'int', 11, '1000'),
('default_delivery_required', 'glsetup.sales', 'smallint', 6, '1'),
('default_dim_required', 'glsetup.dims', 'int', 11, '20'),
('default_inv_sales_act', 'glsetup.items', 'varchar', 15, '4010'),
('default_inventory_act', 'glsetup.items', 'varchar', 15, '1510'),
('default_loss_on_asset_disposal_act', 'glsetup.items', 'varchar', 15, '5660'),
('default_prompt_payment_act', 'glsetup.sales', 'varchar', 15, '4500'),
('default_quote_valid_days', 'glsetup.sales', 'smallint', 6, '30'),
('default_receival_required', 'glsetup.purchase', 'smallint', 6, '10'),
('default_sales_act', 'glsetup.sales', 'varchar', 15, '4010'),
('default_sales_discount_act', 'glsetup.sales', 'varchar', 15, '4510'),
('default_wip_act', 'glsetup.items', 'varchar', 15, '1530'),
('default_workorder_required', 'glsetup.manuf', 'int', 11, '20'),
('deferred_income_act', 'glsetup.sales', 'varchar', 15, '2105'),
('depreciation_period', 'glsetup.company', 'tinyint', 1, '1'),
('domicile', 'setup.company', 'varchar', 55, ''),
('email', 'setup.company', 'varchar', 100, 'delta@delta.com'),
('exchange_diff_act', 'glsetup.general', 'varchar', 15, '4450'),
('f_year', 'setup.company', 'int', 11, '3'),
('fax', 'setup.company', 'varchar', 30, ''),
('freight_act', 'glsetup.customer', 'varchar', 15, '4430'),
('gl_closing_date', 'setup.closing_date', 'date', 8, '2018-12-31'),
('grn_clearing_act', 'glsetup.purchase', 'varchar', 15, '1550'),
('gst_no', 'setup.company', 'varchar', 25, '33445566'),
('legal_text', 'glsetup.customer', 'tinytext', 0, ''),
('loc_notification', 'glsetup.inventory', 'tinyint', 1, ''),
('login_tout', 'setup.company', 'smallint', 6, '600'),
('no_customer_list', 'setup.company', 'tinyint', 1, ''),
('no_item_list', 'setup.company', 'tinyint', 1, ''),
('no_supplier_list', 'setup.company', 'tinyint', 1, ''),
('no_zero_lines_amount', 'glsetup.sales', 'tinyint', 1, '1'),
('past_due_days', 'glsetup.general', 'int', 11, '30'),
('phone', 'setup.company', 'varchar', 30, ''),
('po_over_charge', 'glsetup.purchase', 'int', 11, '10'),
('po_over_receive', 'glsetup.purchase', 'int', 11, '10'),
('postal_address', 'setup.company', 'tinytext', 0, 'N/A'),
('print_invoice_no', 'glsetup.sales', 'tinyint', 1, '0'),
('print_item_images_on_quote', 'glsetup.inventory', 'tinyint', 1, ''),
('profit_loss_year_act', 'glsetup.general', 'varchar', 15, '9990'),
('pyt_discount_act', 'glsetup.purchase', 'varchar', 15, '5060'),
('retained_earnings_act', 'glsetup.general', 'varchar', 15, '3590'),
('round_to', 'setup.company', 'int', 5, '1'),
('shortname_name_in_list', 'setup.company', 'tinyint', 1, ''),
('show_po_item_codes', 'glsetup.purchase', 'tinyint', 1, ''),
('suppress_tax_rates', 'setup.company', 'tinyint', 1, '1'),
('tax_algorithm', 'glsetup.customer', 'tinyint', 1, '1'),
('tax_last', 'setup.company', 'int', 11, '1'),
('tax_prd', 'setup.company', 'int', 11, '1'),
('time_zone', 'setup.company', 'tinyint', 1, ''),
('use_dimension', 'setup.company', 'tinyint', 1, '1'),
('use_fixed_assets', 'setup.company', 'tinyint', 1, '1'),
('use_manufacturing', 'setup.company', 'tinyint', 1, '1'),
('version_id', 'system', 'varchar', 11, '2.4.1');

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_tags`
--

CREATE TABLE `sma_fin_tags` (
  `id` int(11) NOT NULL,
  `type` smallint(6) NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_tag_associations`
--

CREATE TABLE `sma_fin_tag_associations` (
  `record_id` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_tax_groups`
--

CREATE TABLE `sma_fin_tax_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sma_fin_tax_groups`
--

INSERT INTO `sma_fin_tax_groups` (`id`, `name`, `inactive`) VALUES
(1, 'Tax', 0),
(2, 'Tax Exempt', 0),
(3, 'SRB Tax', 0),
(4, 'With Holding Tax', 0),
(5, 'Loan Adjustment Tax', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_tax_group_items`
--

CREATE TABLE `sma_fin_tax_group_items` (
  `tax_group_id` int(11) NOT NULL DEFAULT '0',
  `tax_type_id` int(11) NOT NULL DEFAULT '0',
  `tax_shipping` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sma_fin_tax_group_items`
--

INSERT INTO `sma_fin_tax_group_items` (`tax_group_id`, `tax_type_id`, `tax_shipping`) VALUES
(1, 1, 0),
(1, 2, 0),
(1, 3, 0),
(1, 4, 0),
(3, 2, 0),
(4, 3, 0),
(5, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_tax_types`
--

CREATE TABLE `sma_fin_tax_types` (
  `id` int(11) NOT NULL,
  `rate` double NOT NULL DEFAULT '0',
  `sales_gl_code` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `purchasing_gl_code` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sma_fin_tax_types`
--

INSERT INTO `sma_fin_tax_types` (`id`, `rate`, `sales_gl_code`, `purchasing_gl_code`, `name`, `inactive`) VALUES
(1, 5, '2150', '2150', 'Tax', 0),
(2, 20, '1060', '1060', 'SRB', 0),
(3, 8, '5560', '5560', 'With Holding', 0),
(4, 15, '2620', '2620', 'Loan Adjustment', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_trans_tax_details`
--

CREATE TABLE `sma_fin_trans_tax_details` (
  `id` int(11) NOT NULL,
  `trans_type` smallint(6) DEFAULT NULL,
  `trans_no` int(11) DEFAULT NULL,
  `tran_date` date NOT NULL,
  `tax_type_id` int(11) NOT NULL DEFAULT '0',
  `rate` double NOT NULL DEFAULT '0',
  `ex_rate` double NOT NULL DEFAULT '1',
  `included_in_price` tinyint(1) NOT NULL DEFAULT '0',
  `net_amount` double NOT NULL DEFAULT '0',
  `amount` double NOT NULL DEFAULT '0',
  `memo` tinytext COLLATE utf8_unicode_ci,
  `reg_type` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_useronline`
--

CREATE TABLE `sma_fin_useronline` (
  `id` int(11) NOT NULL,
  `timestamp` int(15) NOT NULL DEFAULT '0',
  `ip` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `file` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_users`
--

CREATE TABLE `sma_fin_users` (
  `id` smallint(6) NOT NULL,
  `user_id` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `real_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `role_id` int(11) NOT NULL DEFAULT '1',
  `phone` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `language` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_format` tinyint(1) NOT NULL DEFAULT '0',
  `date_sep` tinyint(1) NOT NULL DEFAULT '0',
  `tho_sep` tinyint(1) NOT NULL DEFAULT '0',
  `dec_sep` tinyint(1) NOT NULL DEFAULT '0',
  `theme` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  `page_size` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'A4',
  `prices_dec` smallint(6) NOT NULL DEFAULT '2',
  `qty_dec` smallint(6) NOT NULL DEFAULT '2',
  `rates_dec` smallint(6) NOT NULL DEFAULT '4',
  `percent_dec` smallint(6) NOT NULL DEFAULT '1',
  `show_gl` tinyint(1) NOT NULL DEFAULT '1',
  `show_codes` tinyint(1) NOT NULL DEFAULT '0',
  `show_hints` tinyint(1) NOT NULL DEFAULT '0',
  `last_visit_date` datetime DEFAULT NULL,
  `query_size` tinyint(1) UNSIGNED NOT NULL DEFAULT '10',
  `graphic_links` tinyint(1) DEFAULT '1',
  `pos` smallint(6) DEFAULT '1',
  `print_profile` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rep_popup` tinyint(1) DEFAULT '1',
  `sticky_doc_date` tinyint(1) DEFAULT '0',
  `startup_tab` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `transaction_days` smallint(6) NOT NULL DEFAULT '30',
  `save_report_selections` smallint(6) NOT NULL DEFAULT '0',
  `use_date_picker` tinyint(1) NOT NULL DEFAULT '1',
  `def_print_destination` tinyint(1) NOT NULL DEFAULT '0',
  `def_print_orientation` tinyint(1) NOT NULL DEFAULT '0',
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sma_fin_users`
--

INSERT INTO `sma_fin_users` (`id`, `user_id`, `password`, `real_name`, `role_id`, `phone`, `email`, `language`, `date_format`, `date_sep`, `tho_sep`, `dec_sep`, `theme`, `page_size`, `prices_dec`, `qty_dec`, `rates_dec`, `percent_dec`, `show_gl`, `show_codes`, `show_hints`, `last_visit_date`, `query_size`, `graphic_links`, `pos`, `print_profile`, `rep_popup`, `sticky_doc_date`, `startup_tab`, `transaction_days`, `save_report_selections`, `use_date_picker`, `def_print_destination`, `def_print_orientation`, `inactive`) VALUES
(1, 'admin', '5f4dcc3b5aa765d61d8327deb882cf99', 'Administrator', 2, '', 'adm@example.com', 'C', 0, 0, 0, 0, 'default', 'Letter', 4, 4, 4, 2, 1, 0, 0, '2019-04-30 07:39:22', 10, 1, 1, '', 1, 0, 'orders', 30, 0, 1, 0, 0, 0),
(2, 'user', 'e10adc3949ba59abbe56e057f20f883e', 'User', 9, '', 'user@gmail.com', 'C', 0, 0, 0, 0, 'kv_varadha', 'Letter', 2, 2, 4, 1, 1, 0, 0, '2019-04-02 10:06:08', 10, 1, 1, '', 1, 0, 'orders', 30, 0, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_voided`
--

CREATE TABLE `sma_fin_voided` (
  `type` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL DEFAULT '0',
  `date_` date NOT NULL DEFAULT '0000-00-00',
  `memo_` tinytext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_workcentres`
--

CREATE TABLE `sma_fin_workcentres` (
  `id` int(11) NOT NULL,
  `name` char(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` char(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sma_fin_workcentres`
--

INSERT INTO `sma_fin_workcentres` (`id`, `name`, `description`, `inactive`) VALUES
(1, 'Work Centre', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_workorders`
--

CREATE TABLE `sma_fin_workorders` (
  `id` int(11) NOT NULL,
  `wo_ref` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `loc_code` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `units_reqd` double NOT NULL DEFAULT '1',
  `stock_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `date_` date NOT NULL DEFAULT '0000-00-00',
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `required_by` date NOT NULL DEFAULT '0000-00-00',
  `released_date` date NOT NULL DEFAULT '0000-00-00',
  `units_issued` double NOT NULL DEFAULT '0',
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `released` tinyint(1) NOT NULL DEFAULT '0',
  `additional_costs` double NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_wo_costing`
--

CREATE TABLE `sma_fin_wo_costing` (
  `id` int(11) NOT NULL,
  `workorder_id` int(11) NOT NULL DEFAULT '0',
  `cost_type` tinyint(1) NOT NULL DEFAULT '0',
  `trans_type` int(11) NOT NULL DEFAULT '0',
  `trans_no` int(11) NOT NULL DEFAULT '0',
  `factor` double NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_wo_issues`
--

CREATE TABLE `sma_fin_wo_issues` (
  `issue_no` int(11) NOT NULL,
  `workorder_id` int(11) NOT NULL DEFAULT '0',
  `reference` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `issue_date` date DEFAULT NULL,
  `loc_code` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `workcentre_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_wo_issue_items`
--

CREATE TABLE `sma_fin_wo_issue_items` (
  `id` int(11) NOT NULL,
  `stock_id` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `issue_id` int(11) DEFAULT NULL,
  `qty_issued` double DEFAULT NULL,
  `unit_cost` double NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_wo_manufacture`
--

CREATE TABLE `sma_fin_wo_manufacture` (
  `id` int(11) NOT NULL,
  `reference` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `workorder_id` int(11) NOT NULL DEFAULT '0',
  `quantity` double NOT NULL DEFAULT '0',
  `date_` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_fin_wo_requirements`
--

CREATE TABLE `sma_fin_wo_requirements` (
  `id` int(11) NOT NULL,
  `workorder_id` int(11) NOT NULL DEFAULT '0',
  `stock_id` char(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `workcentre` int(11) NOT NULL DEFAULT '0',
  `units_req` double NOT NULL DEFAULT '1',
  `unit_cost` double NOT NULL DEFAULT '0',
  `loc_code` char(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `units_issued` double NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_gift_cards`
--

CREATE TABLE `sma_gift_cards` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `card_no` varchar(20) NOT NULL,
  `value` decimal(25,4) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `customer` varchar(255) DEFAULT NULL,
  `balance` decimal(25,4) NOT NULL,
  `expiry` date DEFAULT NULL,
  `created_by` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_groups`
--

CREATE TABLE `sma_groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_groups`
--

INSERT INTO `sma_groups` (`id`, `name`, `description`) VALUES
(1, 'owner', 'Owner'),
(2, 'admin', 'Administrator'),
(3, 'customer', 'Customer'),
(4, 'supplier', 'Supplier'),
(5, 'sales', 'Sales Staff'),
(6, 'warehouse', 'sales products'),
(7, 'accounts', 'accounts');

-- --------------------------------------------------------

--
-- Table structure for table `sma_login_attempts`
--

CREATE TABLE `sma_login_attempts` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_migrations`
--

CREATE TABLE `sma_migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_migrations`
--

INSERT INTO `sma_migrations` (`version`) VALUES
(315);

-- --------------------------------------------------------

--
-- Table structure for table `sma_notifications`
--

CREATE TABLE `sma_notifications` (
  `id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `from_date` datetime DEFAULT NULL,
  `till_date` datetime DEFAULT NULL,
  `scope` tinyint(1) NOT NULL DEFAULT '3'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_notifications`
--

INSERT INTO `sma_notifications` (`id`, `comment`, `date`, `from_date`, `till_date`, `scope`) VALUES
(1, 'Welcome to Magma Consulting Corporation Inventory Management Solution Version (3.0.2.13). If you have any assistance\r\n contact at `info@magmacc.com` ', '2014-08-15 06:00:57', '2015-01-01 00:00:00', '2017-01-01 00:00:00', 3),
(2, '<p>hi hi bi</p>', '2018-01-16 09:30:01', '2018-01-16 14:25:00', '2018-01-16 18:25:00', 3);

-- --------------------------------------------------------

--
-- Table structure for table `sma_order_ref`
--

CREATE TABLE `sma_order_ref` (
  `ref_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `so` int(11) NOT NULL DEFAULT '1',
  `qu` int(11) NOT NULL DEFAULT '1',
  `po` int(11) NOT NULL DEFAULT '1',
  `to` int(11) NOT NULL DEFAULT '1',
  `pos` int(11) NOT NULL DEFAULT '1',
  `do` int(11) NOT NULL DEFAULT '1',
  `pay` int(11) NOT NULL DEFAULT '1',
  `re` int(11) NOT NULL DEFAULT '1',
  `rep` int(11) NOT NULL DEFAULT '1',
  `ex` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_order_ref`
--

INSERT INTO `sma_order_ref` (`ref_id`, `date`, `so`, `qu`, `po`, `to`, `pos`, `do`, `pay`, `re`, `rep`, `ex`) VALUES
(1, '2015-03-01', 3, 1, 3, 5, 11, 1, 10, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sma_payments`
--

CREATE TABLE `sma_payments` (
  `id` int(11) NOT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `sale_id` int(11) DEFAULT NULL,
  `return_id` int(11) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `reference_no` varchar(50) NOT NULL,
  `transaction_id` varchar(50) DEFAULT NULL,
  `paid_by` varchar(20) NOT NULL,
  `cheque_no` varchar(20) DEFAULT NULL,
  `cc_no` varchar(20) DEFAULT NULL,
  `cc_holder` varchar(25) DEFAULT NULL,
  `cc_month` varchar(2) DEFAULT NULL,
  `cc_year` varchar(4) DEFAULT NULL,
  `cc_type` varchar(20) DEFAULT NULL,
  `amount` decimal(25,4) NOT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `type` varchar(20) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `pos_paid` decimal(25,4) DEFAULT '0.0000',
  `pos_balance` decimal(25,4) DEFAULT '0.0000',
  `approval_code` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_paypal`
--

CREATE TABLE `sma_paypal` (
  `id` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `account_email` varchar(255) NOT NULL,
  `paypal_currency` varchar(3) NOT NULL DEFAULT 'USD',
  `fixed_charges` decimal(25,4) NOT NULL DEFAULT '2.0000',
  `extra_charges_my` decimal(25,4) NOT NULL DEFAULT '3.9000',
  `extra_charges_other` decimal(25,4) NOT NULL DEFAULT '4.4000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_paypal`
--

INSERT INTO `sma_paypal` (`id`, `active`, `account_email`, `paypal_currency`, `fixed_charges`, `extra_charges_my`, `extra_charges_other`) VALUES
(1, 1, 'mypaypal@paypal.com', 'USD', '0.0000', '0.0000', '0.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_permissions`
--

CREATE TABLE `sma_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `products-index` tinyint(1) DEFAULT '0',
  `products-add` tinyint(1) DEFAULT '0',
  `products-edit` tinyint(1) DEFAULT '0',
  `products-delete` tinyint(1) DEFAULT '0',
  `products-cost` tinyint(1) DEFAULT '0',
  `products-price` tinyint(1) DEFAULT '0',
  `quotes-index` tinyint(1) DEFAULT '0',
  `quotes-add` tinyint(1) DEFAULT '0',
  `quotes-edit` tinyint(1) DEFAULT '0',
  `quotes-pdf` tinyint(1) DEFAULT '0',
  `quotes-email` tinyint(1) DEFAULT '0',
  `quotes-delete` tinyint(1) DEFAULT '0',
  `sales-index` tinyint(1) DEFAULT '0',
  `sales-add` tinyint(1) DEFAULT '0',
  `sales-edit` tinyint(1) DEFAULT '0',
  `sales-pdf` tinyint(1) DEFAULT '0',
  `sales-email` tinyint(1) DEFAULT '0',
  `sales-delete` tinyint(1) DEFAULT '0',
  `purchases-index` tinyint(1) DEFAULT '0',
  `purchases-add` tinyint(1) DEFAULT '0',
  `purchases-edit` tinyint(1) DEFAULT '0',
  `purchases-pdf` tinyint(1) DEFAULT '0',
  `purchases-email` tinyint(1) DEFAULT '0',
  `purchases-delete` tinyint(1) DEFAULT '0',
  `transfers-index` tinyint(1) DEFAULT '0',
  `transfers-add` tinyint(1) DEFAULT '0',
  `transfers-edit` tinyint(1) DEFAULT '0',
  `transfers-pdf` tinyint(1) DEFAULT '0',
  `transfers-email` tinyint(1) DEFAULT '0',
  `transfers-delete` tinyint(1) DEFAULT '0',
  `customers-index` tinyint(1) DEFAULT '0',
  `customers-add` tinyint(1) DEFAULT '0',
  `customers-edit` tinyint(1) DEFAULT '0',
  `customers-delete` tinyint(1) DEFAULT '0',
  `suppliers-index` tinyint(1) DEFAULT '0',
  `suppliers-add` tinyint(1) DEFAULT '0',
  `suppliers-edit` tinyint(1) DEFAULT '0',
  `suppliers-delete` tinyint(1) DEFAULT '0',
  `sales-deliveries` tinyint(1) DEFAULT '0',
  `sales-add_delivery` tinyint(1) DEFAULT '0',
  `sales-edit_delivery` tinyint(1) DEFAULT '0',
  `sales-delete_delivery` tinyint(1) DEFAULT '0',
  `sales-email_delivery` tinyint(1) DEFAULT '0',
  `sales-pdf_delivery` tinyint(1) DEFAULT '0',
  `sales-gift_cards` tinyint(1) DEFAULT '0',
  `sales-add_gift_card` tinyint(1) DEFAULT '0',
  `sales-edit_gift_card` tinyint(1) DEFAULT '0',
  `sales-delete_gift_card` tinyint(1) DEFAULT '0',
  `pos-index` tinyint(1) DEFAULT '0',
  `sales-return_sales` tinyint(1) DEFAULT '0',
  `reports-index` tinyint(1) DEFAULT '0',
  `reports-warehouse_stock` tinyint(1) DEFAULT '0',
  `reports-quantity_alerts` tinyint(1) DEFAULT '0',
  `reports-expiry_alerts` tinyint(1) DEFAULT '0',
  `reports-products` tinyint(1) DEFAULT '0',
  `reports-daily_sales` tinyint(1) DEFAULT '0',
  `reports-monthly_sales` tinyint(1) DEFAULT '0',
  `reports-sales` tinyint(1) DEFAULT '0',
  `reports-payments` tinyint(1) DEFAULT '0',
  `reports-purchases` tinyint(1) DEFAULT '0',
  `reports-profit_loss` tinyint(1) DEFAULT '0',
  `reports-customers` tinyint(1) DEFAULT '0',
  `reports-suppliers` tinyint(1) DEFAULT '0',
  `reports-staff` tinyint(1) DEFAULT '0',
  `reports-register` tinyint(1) DEFAULT '0',
  `sales-payments` tinyint(1) DEFAULT '0',
  `purchases-payments` tinyint(1) DEFAULT '0',
  `purchases-expenses` tinyint(1) DEFAULT '0',
  `products-adjustments` tinyint(1) NOT NULL DEFAULT '0',
  `bulk_actions` tinyint(1) NOT NULL DEFAULT '0',
  `customers-deposits` tinyint(1) NOT NULL DEFAULT '0',
  `customers-delete_deposit` tinyint(1) NOT NULL DEFAULT '0',
  `products-barcode` tinyint(1) NOT NULL DEFAULT '0',
  `purchases-return_purchases` tinyint(1) NOT NULL DEFAULT '0',
  `reports-expenses` tinyint(1) NOT NULL DEFAULT '0',
  `reports-daily_purchases` tinyint(1) DEFAULT '0',
  `reports-monthly_purchases` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_permissions`
--

INSERT INTO `sma_permissions` (`id`, `group_id`, `products-index`, `products-add`, `products-edit`, `products-delete`, `products-cost`, `products-price`, `quotes-index`, `quotes-add`, `quotes-edit`, `quotes-pdf`, `quotes-email`, `quotes-delete`, `sales-index`, `sales-add`, `sales-edit`, `sales-pdf`, `sales-email`, `sales-delete`, `purchases-index`, `purchases-add`, `purchases-edit`, `purchases-pdf`, `purchases-email`, `purchases-delete`, `transfers-index`, `transfers-add`, `transfers-edit`, `transfers-pdf`, `transfers-email`, `transfers-delete`, `customers-index`, `customers-add`, `customers-edit`, `customers-delete`, `suppliers-index`, `suppliers-add`, `suppliers-edit`, `suppliers-delete`, `sales-deliveries`, `sales-add_delivery`, `sales-edit_delivery`, `sales-delete_delivery`, `sales-email_delivery`, `sales-pdf_delivery`, `sales-gift_cards`, `sales-add_gift_card`, `sales-edit_gift_card`, `sales-delete_gift_card`, `pos-index`, `sales-return_sales`, `reports-index`, `reports-warehouse_stock`, `reports-quantity_alerts`, `reports-expiry_alerts`, `reports-products`, `reports-daily_sales`, `reports-monthly_sales`, `reports-sales`, `reports-payments`, `reports-purchases`, `reports-profit_loss`, `reports-customers`, `reports-suppliers`, `reports-staff`, `reports-register`, `sales-payments`, `purchases-payments`, `purchases-expenses`, `products-adjustments`, `bulk_actions`, `customers-deposits`, `customers-delete_deposit`, `products-barcode`, `purchases-return_purchases`, `reports-expenses`, `reports-daily_purchases`, `reports-monthly_purchases`) VALUES
(1, 5, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 6, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, NULL, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, NULL, 1, 1, 0, NULL, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(3, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_pos_register`
--

CREATE TABLE `sma_pos_register` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `cash_in_hand` decimal(25,4) NOT NULL,
  `status` varchar(10) NOT NULL,
  `total_cash` decimal(25,4) DEFAULT NULL,
  `total_cheques` int(11) DEFAULT NULL,
  `total_cc_slips` int(11) DEFAULT NULL,
  `total_cash_submitted` decimal(25,4) DEFAULT NULL,
  `total_cheques_submitted` int(11) DEFAULT NULL,
  `total_cc_slips_submitted` int(11) DEFAULT NULL,
  `note` text,
  `closed_at` timestamp NULL DEFAULT NULL,
  `transfer_opened_bills` varchar(50) DEFAULT NULL,
  `closed_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_pos_register`
--

INSERT INTO `sma_pos_register` (`id`, `date`, `user_id`, `cash_in_hand`, `status`, `total_cash`, `total_cheques`, `total_cc_slips`, `total_cash_submitted`, `total_cheques_submitted`, `total_cc_slips_submitted`, `note`, `closed_at`, `transfer_opened_bills`, `closed_by`) VALUES
(1, '2016-06-30 15:34:21', 1, '2000.0000', 'close', '10812.0000', 0, 0, '10812.0000', 0, 0, '', '2016-07-03 00:15:16', NULL, 1),
(2, '2016-08-07 06:13:17', 1, '2000.0000', 'open', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, '2017-10-20 19:53:23', 2, '1000.0000', 'open', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, '2017-11-08 20:10:00', 6, '9999.0000', 'open', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, '2017-11-09 01:11:27', 7, '10000.0000', 'open', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_pos_settings`
--

CREATE TABLE `sma_pos_settings` (
  `pos_id` int(1) NOT NULL,
  `cat_limit` int(11) NOT NULL,
  `pro_limit` int(11) NOT NULL,
  `default_category` int(11) NOT NULL,
  `default_customer` int(11) NOT NULL,
  `default_biller` int(11) NOT NULL,
  `display_time` varchar(3) NOT NULL DEFAULT 'yes',
  `cf_title1` varchar(255) DEFAULT NULL,
  `cf_title2` varchar(255) DEFAULT NULL,
  `cf_value1` varchar(255) DEFAULT NULL,
  `cf_value2` varchar(255) DEFAULT NULL,
  `receipt_printer` varchar(55) DEFAULT NULL,
  `cash_drawer_codes` varchar(55) DEFAULT NULL,
  `focus_add_item` varchar(55) DEFAULT NULL,
  `add_manual_product` varchar(55) DEFAULT NULL,
  `customer_selection` varchar(55) DEFAULT NULL,
  `add_customer` varchar(55) DEFAULT NULL,
  `toggle_category_slider` varchar(55) DEFAULT NULL,
  `toggle_subcategory_slider` varchar(55) DEFAULT NULL,
  `cancel_sale` varchar(55) DEFAULT NULL,
  `suspend_sale` varchar(55) DEFAULT NULL,
  `print_items_list` varchar(55) DEFAULT NULL,
  `finalize_sale` varchar(55) DEFAULT NULL,
  `today_sale` varchar(55) DEFAULT NULL,
  `open_hold_bills` varchar(55) DEFAULT NULL,
  `close_register` varchar(55) DEFAULT NULL,
  `keyboard` tinyint(1) NOT NULL,
  `pos_printers` varchar(255) DEFAULT NULL,
  `java_applet` tinyint(1) NOT NULL,
  `product_button_color` varchar(20) NOT NULL DEFAULT 'default',
  `tooltips` tinyint(1) DEFAULT '1',
  `paypal_pro` tinyint(1) DEFAULT '0',
  `stripe` tinyint(1) DEFAULT '0',
  `rounding` tinyint(1) DEFAULT '0',
  `char_per_line` tinyint(4) DEFAULT '42',
  `pin_code` varchar(20) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT 'purchase_code',
  `envato_username` varchar(50) DEFAULT 'envato_username',
  `version` varchar(10) DEFAULT '3.0.2.13',
  `after_sale_page` tinyint(1) DEFAULT '0',
  `item_order` tinyint(1) DEFAULT '0',
  `authorize` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_pos_settings`
--

INSERT INTO `sma_pos_settings` (`pos_id`, `cat_limit`, `pro_limit`, `default_category`, `default_customer`, `default_biller`, `display_time`, `cf_title1`, `cf_title2`, `cf_value1`, `cf_value2`, `receipt_printer`, `cash_drawer_codes`, `focus_add_item`, `add_manual_product`, `customer_selection`, `add_customer`, `toggle_category_slider`, `toggle_subcategory_slider`, `cancel_sale`, `suspend_sale`, `print_items_list`, `finalize_sale`, `today_sale`, `open_hold_bills`, `close_register`, `keyboard`, `pos_printers`, `java_applet`, `product_button_color`, `tooltips`, `paypal_pro`, `stripe`, `rounding`, `char_per_line`, `pin_code`, `purchase_code`, `envato_username`, `version`, `after_sale_page`, `item_order`, `authorize`) VALUES
(1, 22, 20, 1, 1, 3, '1', 'GST Reg', 'VAT Reg', '123456789', '987654321', 'BIXOLON SRP-350II', 'x1C', 'Ctrl+F3', 'Ctrl+Shift+M', 'Ctrl+Shift+C', 'Ctrl+Shift+A', 'Ctrl+F11', 'Ctrl+F12', 'F4', 'F7', 'F9', 'F8', 'Ctrl+F1', 'Ctrl+F2', 'Ctrl+F10', 1, 'BIXOLON SRP-350II, BIXOLON SRP-350II', 0, 'primary', 1, 0, 0, 1, 42, NULL, 'a7aadce4-abef-4776-acaa-16dea639ceea', 'mze0007', '3.0.2.13', 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_products`
--

CREATE TABLE `sma_products` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` char(255) NOT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `cost` decimal(25,4) DEFAULT NULL,
  `price` decimal(25,4) NOT NULL,
  `alert_quantity` decimal(15,4) DEFAULT '20.0000',
  `image` varchar(255) DEFAULT 'no_image.png',
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) DEFAULT NULL,
  `cf1` varchar(255) DEFAULT NULL,
  `cf2` varchar(255) DEFAULT NULL,
  `cf3` varchar(255) DEFAULT NULL,
  `cf4` varchar(255) DEFAULT NULL,
  `cf5` varchar(255) DEFAULT NULL,
  `cf6` varchar(255) DEFAULT NULL,
  `quantity` decimal(15,4) DEFAULT '0.0000',
  `tax_rate` int(11) DEFAULT NULL,
  `track_quantity` tinyint(1) DEFAULT '1',
  `details` varchar(1000) DEFAULT NULL,
  `warehouse` int(11) DEFAULT NULL,
  `barcode_symbology` varchar(55) NOT NULL DEFAULT 'code128',
  `file` varchar(100) DEFAULT NULL,
  `product_details` text,
  `tax_method` tinyint(1) DEFAULT '0',
  `type` varchar(55) NOT NULL DEFAULT 'standard',
  `supplier1` int(11) DEFAULT NULL,
  `supplier1price` decimal(25,4) DEFAULT NULL,
  `supplier2` int(11) DEFAULT NULL,
  `supplier2price` decimal(25,4) DEFAULT NULL,
  `supplier3` int(11) DEFAULT NULL,
  `supplier3price` decimal(25,4) DEFAULT NULL,
  `supplier4` int(11) DEFAULT NULL,
  `supplier4price` decimal(25,4) DEFAULT NULL,
  `supplier5` int(11) DEFAULT NULL,
  `supplier5price` decimal(25,4) DEFAULT NULL,
  `promotion` tinyint(1) DEFAULT '0',
  `promo_price` decimal(25,4) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `supplier1_part_no` varchar(50) DEFAULT NULL,
  `supplier2_part_no` varchar(50) DEFAULT NULL,
  `supplier3_part_no` varchar(50) DEFAULT NULL,
  `supplier4_part_no` varchar(50) DEFAULT NULL,
  `supplier5_part_no` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_products`
--

INSERT INTO `sma_products` (`id`, `code`, `name`, `unit`, `cost`, `price`, `alert_quantity`, `image`, `category_id`, `subcategory_id`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `quantity`, `tax_rate`, `track_quantity`, `details`, `warehouse`, `barcode_symbology`, `file`, `product_details`, `tax_method`, `type`, `supplier1`, `supplier1price`, `supplier2`, `supplier2price`, `supplier3`, `supplier3price`, `supplier4`, `supplier4price`, `supplier5`, `supplier5price`, `promotion`, `promo_price`, `start_date`, `end_date`, `supplier1_part_no`, `supplier2_part_no`, `supplier3_part_no`, `supplier4_part_no`, `supplier5_part_no`) VALUES
(1, '2044524', 'Eye drops', 'mg', '0.0000', '0.0000', '10.0000', '4fd1c51334fb10bc37b284867c29b62d.jpg', 7, 1, '', '', '', '', '', '', '500.0000', 1, 1, '', NULL, 'code128', NULL, '<p>Now that the Galaxy S7 has been on the market for a few months now, we’re seeing a number of deals cropping up, giving folks the opportunity to pick up Samsung’s 2016 flagship at a much better price than when it first launched. The majority of these deals have been for unlocked models, but the reality is that there are still folks that stick to the contract model. If you’re a Sprint or Verizon customer that is looking for a new on-contract phone, Best Buy has your back with its new 4th of July sale.</p>', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0001-11-30', '0001-11-30', '', NULL, NULL, NULL, NULL),
(2, '45370706', 'Dermovate', 'box(12tabs)', '2000.0000', '2200.0000', '4.0000', '619841d2b426327157a3b14da897b069.jpg', 3, 5, '', '', '', '', '', '', '3.0000', 3, 1, '', NULL, 'code128', NULL, '', 1, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0001-11-30', '0001-11-30', '', NULL, NULL, NULL, NULL),
(6, '55163412', 'Doxyn 100', 'box(12tabs)', '100.0000', '100.0000', '10000.0000', 'no_image.png', 3, NULL, '', '', '', '', '', '', '995.0000', 1, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0001-11-30', '0001-11-30', '', NULL, NULL, NULL, NULL),
(7, '33074725', 'Panadol', 'MG', '10.0000', '10.0000', '100.0000', 'no_image.png', 3, 7, '', '', '', '', '', '', '897.0000', 1, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00', '0000-00-00', '', NULL, NULL, NULL, NULL),
(11, '70140199', 'Betagan', 'ml', '60.0000', '0.0000', '0.0000', 'no_image.png', 3, 3, '', '', '', '', '', '', '309.0000', 1, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0001-11-30', '0001-11-30', '', NULL, NULL, NULL, NULL),
(12, 'milk-985', 'Milk', 'ml', '80.0000', '80.0000', '100.0000', 'no_image.png', 11, 57, '', '', '', '', '', '', '9.0000', 1, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00', '0000-00-00', '', NULL, NULL, NULL, NULL),
(13, 'sugar-9558', 'Sugar', 'mg', '55.0000', '55.0000', '0.0000', 'no_image.png', 11, 57, '', '', '', '', '', '', '9.0000', 1, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00', '0000-00-00', '', NULL, NULL, NULL, NULL),
(14, 'man-8955', 'mango', 'unit', '10.0000', '10.0000', '0.0000', 'no_image.png', 11, 57, '', '', '', '', '', '', '9.0000', 1, 1, '', NULL, 'code128', NULL, '', 0, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00', '0000-00-00', '', NULL, NULL, NULL, NULL),
(15, 'mg-1g', 'Mango Juice 1 Glass', 'unit', NULL, '145.0000', '0.0000', 'no_image.png', 11, NULL, '', '', '', '', '', '', '0.0000', 1, 0, '', NULL, 'code128', NULL, '', 0, 'combo', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00', '0000-00-00', '', NULL, NULL, NULL, NULL),
(16, '20445244', 'Premium Petrol', 'Litre', '0.0000', '0.0000', '0.0000', 'no_image.png', 7, 1, NULL, NULL, NULL, NULL, NULL, NULL, '500.0000', 1, 1, '<p>sadsadsa</p>', NULL, 'NA', NULL, '<p>asfd</p>', 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, '03024070', 'Petrol', 'NA', '0.0000', '0.0000', '0.0000', 'no_image.png', 12, 58, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', 0, 0, '', NULL, 'NA', NULL, '', 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, '651561', 'Highoctane', 'Ltr', '100.0000', '0.0000', '0.0000', 'no_image.png', 12, 58, NULL, NULL, NULL, NULL, NULL, NULL, '200.0000', 1, 1, '<p>dfgfd</p>', NULL, 'NA', NULL, '<p>dsghhgj</p>', 1, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_product_photos`
--

CREATE TABLE `sma_product_photos` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `photo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_product_photos`
--

INSERT INTO `sma_product_photos` (`id`, `product_id`, `photo`) VALUES
(1, 1, 'a7270207faa727ec28b002c1bb4a4301.jpg'),
(2, 2, 'c0ec167c35e4624b32c9b3fdb1346101.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `sma_product_variants`
--

CREATE TABLE `sma_product_variants` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `cost` decimal(25,4) DEFAULT NULL,
  `price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_product_variants`
--

INSERT INTO `sma_product_variants` (`id`, `product_id`, `name`, `cost`, `price`, `quantity`) VALUES
(1, 8, '100', '0.0000', '0.0000', NULL),
(2, 8, '200', '0.0000', '0.0000', NULL),
(3, 8, '10', '0.0000', '0.0000', '500.0000'),
(4, 8, '20', '0.0000', '0.0000', '500.0000'),
(5, 9, '100', '0.0000', '0.0000', '499.0000'),
(6, 9, '200', '0.0000', '0.0000', '500.0000'),
(7, 10, '10ml', '0.0000', '0.0000', '4.0000'),
(8, 10, '20ml', '0.0000', '0.0000', '5.0000'),
(9, 16, '10', '60.0000', '0.0000', '109.0000'),
(10, 11, '50', '60.0000', '0.0000', '200.0000'),
(11, 11, '20', '0.0000', '0.0000', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_purchases`
--

CREATE TABLE `sma_purchases` (
  `id` int(11) NOT NULL,
  `reference_no` varchar(55) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `supplier_id` int(11) NOT NULL,
  `supplier` varchar(55) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `note` varchar(1000) NOT NULL,
  `total` decimal(25,4) DEFAULT NULL,
  `product_discount` decimal(25,4) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_discount` decimal(25,4) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT NULL,
  `product_tax` decimal(25,4) DEFAULT NULL,
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT '0.0000',
  `shipping` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `paid` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `status` varchar(55) DEFAULT '',
  `payment_status` varchar(20) DEFAULT 'pending',
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `payment_term` tinyint(4) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `return_id` int(11) DEFAULT NULL,
  `surcharge` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `return_purchase_ref` varchar(55) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `return_purchase_total` decimal(25,4) NOT NULL DEFAULT '0.0000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_purchases`
--

INSERT INTO `sma_purchases` (`id`, `reference_no`, `date`, `supplier_id`, `supplier`, `warehouse_id`, `note`, `total`, `product_discount`, `order_discount_id`, `order_discount`, `total_discount`, `product_tax`, `order_tax_id`, `order_tax`, `total_tax`, `shipping`, `grand_total`, `paid`, `status`, `payment_status`, `created_by`, `updated_by`, `updated_at`, `attachment`, `payment_term`, `due_date`, `return_id`, `surcharge`, `return_purchase_ref`, `purchase_id`, `return_purchase_total`) VALUES
(1, '0000001', '2016-07-02 21:55:00', 5, 'Faizan Group Of Services', 1, '', '36000.0000', '0.0000', NULL, '0.0000', '0.0000', '2160.0000', 3, '2289.6000', '4449.6000', '0.0000', '40449.6000', '0.0000', 'received', 'pending', 1, NULL, NULL, NULL, 10, '2016-07-12', NULL, '0.0000', NULL, NULL, '0.0000'),
(2, '0000002', '2016-07-02 22:30:00', 5, 'Faizan Group Of Services', 1, '', '24000.0000', '0.0000', NULL, '0.0000', '0.0000', '1440.0000', 3, '1526.4000', '2966.4000', '0.0000', '26966.4000', '0.0000', 'received', 'pending', 1, NULL, NULL, NULL, 0, NULL, NULL, '0.0000', NULL, NULL, '0.0000'),
(3, 'PO/2017/11/0001', '2017-11-09 01:56:02', 9, 'CSMD01', 3, '', '10000.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '10000.0000', '0.0000', 'ordered', 'pending', 6, NULL, NULL, NULL, 0, NULL, NULL, '0.0000', NULL, NULL, '0.0000'),
(4, '883', '2017-11-09 17:03:00', 5, 'Faizan Group Of Services', 1, '', '210000.0000', '0.0000', NULL, '0.0000', '0.0000', '12000.0000', 1, '0.0000', '12000.0000', '0.0000', '222000.0000', '0.0000', 'ordered', 'pending', 1, NULL, NULL, NULL, 0, NULL, NULL, '0.0000', NULL, NULL, '0.0000'),
(5, 'PO/2017/11/0002', '2017-11-09 17:16:00', 5, 'Faizan Group Of Services', 1, '', '18000.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '18000.0000', '0.0000', 'received', 'pending', 1, 1, '2017-11-09 17:18:34', NULL, 0, NULL, NULL, '0.0000', NULL, NULL, '0.0000'),
(6, '22', '2017-11-09 17:22:52', 9, 'CSMD01', 3, '', '1200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '1200.0000', '0.0000', 'ordered', 'pending', 6, NULL, NULL, NULL, 0, NULL, NULL, '0.0000', NULL, NULL, '0.0000'),
(7, 'asd', '2018-01-13 21:33:00', 5, 'Faizan Group Of Services', 1, '', '200000.0000', '0.0000', NULL, '0.0000', '0.0000', '12000.0000', 1, '0.0000', '12000.0000', '0.0000', '212000.0000', '5000.0000', 'ordered', 'partial', 1, NULL, NULL, NULL, 5, '2018-01-18', NULL, '0.0000', NULL, NULL, '0.0000'),
(8, '12333333333', '2019-04-04 07:10:00', 19, 'ABC COmpany pvt ltd', 1, '', '10000.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '10000.0000', '0.0000', 'received', 'pending', 1, 1, '2019-04-04 08:26:17', NULL, 0, NULL, NULL, '0.0000', NULL, NULL, '0.0000'),
(9, '12333333333', '2019-04-04 07:10:00', 19, 'ABC COmpany pvt ltd', 2, '', '10000.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 2, '1000.0000', '1000.0000', '0.0000', '11000.0000', '0.0000', 'received', 'pending', 1, NULL, NULL, NULL, 0, NULL, NULL, '0.0000', NULL, NULL, '0.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_purchase_items`
--

CREATE TABLE `sma_purchase_items` (
  `id` int(11) NOT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `transfer_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(50) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_cost` decimal(25,4) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(20) DEFAULT NULL,
  `discount` varchar(20) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `expiry` date DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `quantity_balance` decimal(15,4) DEFAULT '0.0000',
  `date` date NOT NULL,
  `status` varchar(50) NOT NULL,
  `unit_cost` decimal(25,4) DEFAULT NULL,
  `real_unit_cost` decimal(25,4) DEFAULT NULL,
  `quantity_received` decimal(15,4) DEFAULT NULL,
  `supplier_part_no` varchar(50) DEFAULT NULL,
  `purchase_item_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_purchase_items`
--

INSERT INTO `sma_purchase_items` (`id`, `purchase_id`, `transfer_id`, `product_id`, `product_code`, `product_name`, `option_id`, `net_unit_cost`, `quantity`, `warehouse_id`, `item_tax`, `tax_rate_id`, `tax`, `discount`, `item_discount`, `expiry`, `subtotal`, `quantity_balance`, `date`, `status`, `unit_cost`, `real_unit_cost`, `quantity_received`, `supplier_part_no`, `purchase_item_id`) VALUES
(1, 1, NULL, 1, '20445244', 'Samsung Mobile S7', NULL, '3000.0000', '12.0000', 1, '2160.0000', 3, '6.0000%', '0', '0.0000', NULL, '38160.0000', '310.0000', '2016-07-02', 'received', '3180.0000', '3000.0000', '12.0000', NULL, NULL),
(2, 2, NULL, 2, '45370706', 'Samsung Watch Gear', NULL, '2000.0000', '12.0000', 1, '1440.0000', 3, '6.0000%', '0', '0.0000', NULL, '25440.0000', '0.0000', '2016-07-02', 'received', '2120.0000', '2000.0000', '12.0000', NULL, NULL),
(3, NULL, NULL, 3, '55555555', 'ccccccc', NULL, '6060.0000', '0.0000', 1, '0.0000', 2, '10.0000%', NULL, NULL, NULL, '0.0000', '0.0000', '2017-08-08', 'received', '6666.0000', '6666.0000', NULL, NULL, NULL),
(4, NULL, NULL, 3, '55555555', 'ccccccc', NULL, '6060.0000', '66.0000', 2, '39996.0000', 2, '10.0000%', NULL, NULL, NULL, '439956.0000', '66.0000', '2017-08-08', 'received', '6666.0000', '6666.0000', NULL, NULL, NULL),
(5, NULL, NULL, 6, '55163412', 'Doxyn 100', NULL, '100.0000', '100000.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '10000000.0000', '900.0000', '2017-11-03', 'received', '100.0000', '100.0000', NULL, NULL, NULL),
(6, NULL, 1, 6, '55163412', 'Doxyn 100', NULL, '100.0000', '100.0000', 3, '0.0000', 1, '0.0000', NULL, NULL, NULL, '10000.0000', '0.0000', '2017-11-03', 'received', '100.0000', '100.0000', NULL, NULL, NULL),
(7, NULL, NULL, 7, '33074725', 'Panadol', NULL, '10.0000', '10000.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '100000.0000', '896.0000', '2017-11-03', 'received', '10.0000', '10.0000', NULL, NULL, NULL),
(8, NULL, NULL, 1, '20445244', 'Samsung Mobile S7', NULL, '0.0000', '0.0000', 3, '0.0000', 0, '', NULL, NULL, NULL, '0.0000', '65.0000', '2017-11-08', 'received', '0.0000', NULL, NULL, NULL, NULL),
(9, NULL, 2, 1, '20445244', 'Samsung Mobile S7', NULL, '3000.0000', '25.0000', 22, '4500.0000', 3, '6.0000%', NULL, NULL, NULL, '79500.0000', '25.0000', '2017-11-08', 'received', '3180.0000', '3000.0000', NULL, NULL, NULL),
(10, NULL, NULL, 8, '55857205', 'oinement', NULL, '0.0000', '1000.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '900.0000', '2017-11-08', 'received', '0.0000', '0.0000', NULL, NULL, NULL),
(11, NULL, 3, 8, '55857205', 'oinement', NULL, '0.0000', '100.0000', 3, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '100.0000', '2017-11-08', 'received', '0.0000', '0.0000', NULL, NULL, NULL),
(12, NULL, NULL, 8, '55857205', 'oinement', 3, '0.0000', '500.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '500.0000', '2017-11-08', 'received', '0.0000', NULL, NULL, NULL, NULL),
(13, NULL, NULL, 8, '55857205', 'oinement', 4, '0.0000', '500.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '500.0000', '2017-11-08', 'received', '0.0000', NULL, NULL, NULL, NULL),
(14, NULL, NULL, 9, '12603955', 'Peracitamol', NULL, '0.0000', '5000.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '5000.0000', '2017-11-08', 'received', '0.0000', '0.0000', NULL, NULL, NULL),
(15, NULL, NULL, 9, '12603955', 'Peracitamol', 5, '0.0000', '500.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '20.0000', '2017-11-08', 'received', '0.0000', NULL, NULL, NULL, NULL),
(16, NULL, NULL, 9, '12603955', 'Peracitamol', 6, '0.0000', '500.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '200.0000', '2017-11-08', 'received', '0.0000', NULL, NULL, NULL, NULL),
(17, NULL, 4, 7, '33074725', 'Panadol', NULL, '10.0000', '1.0000', 3, '0.0000', 1, '0.0000', NULL, NULL, NULL, '10.0000', '1.0000', '2017-11-08', 'received', '10.0000', '10.0000', NULL, NULL, NULL),
(18, NULL, 4, 9, '12603955', 'Peracitamol', 5, '0.0000', '330.0000', 3, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '329.0000', '2017-11-08', 'received', '0.0000', '0.0000', NULL, NULL, NULL),
(19, NULL, 4, 9, '12603955', 'Peracitamol', 6, '0.0000', '300.0000', 3, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '300.0000', '2017-11-08', 'received', '0.0000', '0.0000', NULL, NULL, NULL),
(20, NULL, 5, 9, '12603955', 'Peracitamol', 5, '0.0000', '100.0000', 23, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '100.0000', '2017-11-08', 'received', '0.0000', '0.0000', NULL, NULL, NULL),
(21, NULL, 7, 2, '45370706', 'Dermovate', NULL, '2000.0000', '5.0000', 3, '600.0000', 3, '6.0000%', NULL, NULL, NULL, '10600.0000', '0.0000', '2017-11-08', 'received', '2120.0000', '2000.0000', NULL, NULL, NULL),
(22, NULL, 8, 2, '45370706', 'Dermovate', NULL, '2000.0000', '3.0000', 23, '360.0000', 3, '6.0000%', NULL, NULL, NULL, '6360.0000', '1.0000', '2017-11-08', 'received', '2120.0000', '2000.0000', NULL, NULL, NULL),
(23, NULL, 9, 9, '12603955', 'Peracitamol', 5, '0.0000', '50.0000', 3, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '50.0000', '2017-11-08', 'received', '0.0000', '0.0000', NULL, NULL, NULL),
(24, NULL, 10, 2, '45370706', 'Dermovate', NULL, '2000.0000', '1.0000', 3, '120.0000', 3, '6.0000%', NULL, NULL, NULL, '2120.0000', '0.0000', '2017-11-08', 'received', '2120.0000', '2000.0000', NULL, NULL, NULL),
(25, NULL, 11, 2, '45370706', 'Dermovate', NULL, '2000.0000', '2.0000', 23, '240.0000', 3, '6.0000%', NULL, NULL, NULL, '4240.0000', '2.0000', '2017-11-08', 'received', '2120.0000', '2000.0000', NULL, NULL, NULL),
(26, NULL, NULL, 10, '1q2344', 'Majid Oil', 7, '0.0000', '5.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '2.0000', '2017-11-08', 'received', '0.0000', NULL, NULL, NULL, NULL),
(27, NULL, NULL, 10, '1q2344', 'Majid Oil', 8, '0.0000', '5.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '2.0000', '2017-11-08', 'received', '0.0000', NULL, NULL, NULL, NULL),
(28, NULL, 12, 10, '1q2344', 'Majid Oil', 8, '0.0000', '3.0000', 3, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '2.0000', '2017-11-08', 'received', '0.0000', '0.0000', NULL, NULL, NULL),
(29, NULL, 12, 10, '1q2344', 'Majid Oil', 7, '0.0000', '3.0000', 3, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '2.0000', '2017-11-08', 'received', '0.0000', '0.0000', NULL, NULL, NULL),
(30, NULL, 13, 10, '1q2344', 'Majid Oil', 8, '0.0000', '1.0000', 23, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '1.0000', '2017-11-08', 'received', '0.0000', '0.0000', NULL, NULL, NULL),
(31, NULL, 13, 10, '1q2344', 'Majid Oil', 7, '0.0000', '1.0000', 23, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', '2017-11-08', 'received', '0.0000', '0.0000', NULL, NULL, NULL),
(32, 3, NULL, 5, '448', 'Doxyn 100', NULL, '100.0000', '100.0000', 3, '0.0000', 1, '0.0000', '0', '0.0000', NULL, '10000.0000', '100.0000', '2017-11-08', 'ordered', '100.0000', '100.0000', '100.0000', NULL, NULL),
(33, 4, NULL, 2, '45370706', 'Dermovate', NULL, '2000.0000', '100.0000', 1, '12000.0000', 3, '6.0000%', '0', '0.0000', NULL, '212000.0000', '100.0000', '2017-11-09', 'ordered', '2120.0000', '2000.0000', '100.0000', NULL, NULL),
(34, 4, NULL, 6, '55163412', 'Doxyn 100', NULL, '100.0000', '100.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', NULL, '10000.0000', '95.0000', '2017-11-09', 'ordered', '100.0000', '100.0000', '100.0000', NULL, NULL),
(37, 5, NULL, 11, '70140199', 'Betagan', 10, '60.0000', '200.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', NULL, '12000.0000', '200.0000', '0000-00-00', 'received', '60.0000', '60.0000', '200.0000', NULL, NULL),
(38, 5, NULL, 11, '70140199', 'Betagan', 9, '60.0000', '100.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', NULL, '6000.0000', '80.0000', '0000-00-00', 'received', '60.0000', '60.0000', '100.0000', NULL, NULL),
(39, 6, NULL, 11, '70140199', 'Betagan', 9, '60.0000', '20.0000', 3, '0.0000', 1, '0.0000', '0', '0.0000', NULL, '1200.0000', '0.0000', '2017-11-09', 'ordered', '60.0000', '60.0000', '20.0000', NULL, NULL),
(40, NULL, 14, 11, '70140199', 'Betagan', 9, '60.0000', '20.0000', 3, '0.0000', 1, '0.0000', NULL, NULL, NULL, '1200.0000', '20.0000', '2017-11-09', 'received', '60.0000', '60.0000', NULL, NULL, NULL),
(41, NULL, 16, 11, '70140199', 'Betagan', 9, '60.0000', '10.0000', 23, '0.0000', 1, '0.0000', NULL, NULL, NULL, '600.0000', '9.0000', '2017-11-09', 'received', '60.0000', '60.0000', NULL, NULL, NULL),
(42, 7, NULL, 2, '45370706', 'Dermovate', NULL, '2000.0000', '100.0000', 1, '12000.0000', 3, '6.0000%', '0', '0.0000', NULL, '212000.0000', '100.0000', '2018-01-13', 'ordered', '2120.0000', '2000.0000', '100.0000', NULL, NULL),
(43, NULL, NULL, 12, 'milk-985', 'Milk', NULL, '0.0000', '0.0000', 1, '0.0000', 0, '', NULL, NULL, NULL, '0.0000', '9.0000', '2018-01-22', 'received', '0.0000', NULL, NULL, NULL, NULL),
(44, NULL, NULL, 13, 'sugar-9558', 'Sugar', NULL, '0.0000', '0.0000', 1, '0.0000', 0, '', NULL, NULL, NULL, '0.0000', '-1.0000', '2018-01-22', 'received', '0.0000', NULL, NULL, NULL, NULL),
(45, NULL, NULL, 14, 'man-8955', 'mango', NULL, '0.0000', '0.0000', 1, '0.0000', 0, '', NULL, NULL, NULL, '0.0000', '9.0000', '2018-01-22', 'received', '0.0000', NULL, NULL, NULL, NULL),
(46, NULL, NULL, 13, 'sugar-9558', 'Sugar', NULL, '0.0000', '0.0000', 2, '0.0000', 0, '', NULL, NULL, NULL, '0.0000', '10.0000', '2018-03-12', 'received', '0.0000', NULL, NULL, NULL, NULL),
(47, NULL, 17, 1, '2044524', 'Eye drops', NULL, '0.0000', '100.0000', 2, '0.0000', 1, '0.0000', NULL, NULL, NULL, '0.0000', '100.0000', '2019-04-02', 'received', '0.0000', '0.0000', NULL, NULL, NULL),
(49, 8, NULL, 18, '651561', 'Highoctane', 0, '100.0000', '100.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', NULL, '10000.0000', '100.0000', '0000-00-00', 'received', '100.0000', '100.0000', '100.0000', NULL, NULL),
(50, 9, NULL, 18, '651561', 'Highoctane', 0, '100.0000', '100.0000', 2, '0.0000', 1, '0.0000', '0', '0.0000', NULL, '10000.0000', '100.0000', '2019-04-04', 'received', '100.0000', '100.0000', '100.0000', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_quotes`
--

CREATE TABLE `sma_quotes` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `biller_id` int(11) NOT NULL,
  `biller` varchar(55) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `internal_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount` decimal(25,4) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT '0.0000',
  `product_tax` decimal(25,4) DEFAULT '0.0000',
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT NULL,
  `shipping` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `supplier` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_quote_items`
--

CREATE TABLE `sma_quote_items` (
  `id` int(11) NOT NULL,
  `quote_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_return_items`
--

CREATE TABLE `sma_return_items` (
  `id` int(11) NOT NULL,
  `sale_id` int(11) UNSIGNED NOT NULL,
  `return_id` int(11) UNSIGNED NOT NULL,
  `sale_item_id` int(11) DEFAULT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `quantity` decimal(15,4) DEFAULT '0.0000',
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_return_purchases`
--

CREATE TABLE `sma_return_purchases` (
  `id` int(11) NOT NULL,
  `purchase_id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `supplier` varchar(55) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount` decimal(25,4) DEFAULT '0.0000',
  `product_tax` decimal(25,4) DEFAULT '0.0000',
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT '0.0000',
  `total_tax` decimal(25,4) DEFAULT '0.0000',
  `surcharge` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `attachment` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_return_purchase_items`
--

CREATE TABLE `sma_return_purchase_items` (
  `id` int(11) NOT NULL,
  `purchase_id` int(11) UNSIGNED NOT NULL,
  `return_id` int(11) UNSIGNED NOT NULL,
  `purchase_item_id` int(11) DEFAULT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_cost` decimal(25,4) NOT NULL,
  `quantity` decimal(15,4) DEFAULT '0.0000',
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `real_unit_cost` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_return_sales`
--

CREATE TABLE `sma_return_sales` (
  `id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `biller` varchar(55) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount` decimal(25,4) DEFAULT '0.0000',
  `product_tax` decimal(25,4) DEFAULT '0.0000',
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT '0.0000',
  `total_tax` decimal(25,4) DEFAULT '0.0000',
  `surcharge` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `attachment` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_sales`
--

CREATE TABLE `sma_sales` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `biller` varchar(55) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `staff_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount` decimal(25,4) DEFAULT '0.0000',
  `product_tax` decimal(25,4) DEFAULT '0.0000',
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT '0.0000',
  `total_tax` decimal(25,4) DEFAULT '0.0000',
  `shipping` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `sale_status` varchar(20) DEFAULT NULL,
  `payment_status` varchar(20) DEFAULT NULL,
  `payment_term` tinyint(4) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_items` tinyint(4) DEFAULT NULL,
  `pos` tinyint(1) NOT NULL DEFAULT '0',
  `paid` decimal(25,4) DEFAULT '0.0000',
  `return_id` int(11) DEFAULT NULL,
  `surcharge` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `attachment` varchar(55) DEFAULT NULL,
  `return_sale_ref` varchar(55) DEFAULT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `return_sale_total` decimal(25,4) NOT NULL DEFAULT '0.0000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_sales`
--

INSERT INTO `sma_sales` (`id`, `date`, `reference_no`, `customer_id`, `customer`, `biller_id`, `biller`, `warehouse_id`, `note`, `staff_note`, `total`, `product_discount`, `order_discount_id`, `total_discount`, `order_discount`, `product_tax`, `order_tax_id`, `order_tax`, `total_tax`, `shipping`, `grand_total`, `sale_status`, `payment_status`, `payment_term`, `due_date`, `created_by`, `updated_by`, `updated_at`, `total_items`, `pos`, `paid`, `return_id`, `surcharge`, `attachment`, `return_sale_ref`, `sale_id`, `return_sale_total`) VALUES
(1, '2016-07-02 21:57:40', 'SALE/POS/2016/07/0001', 4, 'CSMD Soft', 3, 'Test Biller', 1, '', '', '3200.0000', '0.0000', '92', '92.0000', '92.0000', '192.0000', 1, '0.0000', '192.0000', '0.0000', '3300.0000', 'completed', 'paid', 0, NULL, 1, NULL, NULL, 1, 1, '3300.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000'),
(2, '2016-07-02 22:38:34', 'SALE/POS/2016/07/0002', 4, 'CSMD Soft', 3, 'Test Biller', 1, '', '', '2200.0000', '0.0000', NULL, '0.0000', '0.0000', '132.0000', 1, '0.0000', '132.0000', '0.0000', '2332.0000', 'completed', 'paid', 0, NULL, 1, NULL, NULL, 1, 1, '2332.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000'),
(3, '2016-07-02 23:27:53', 'SALE/POS/2016/07/0003', 1, 'Walk-in Customer', 3, 'Test Biller', 1, '', '', '3000.0000', '0.0000', NULL, '0.0000', '0.0000', '180.0000', 1, '0.0000', '180.0000', '0.0000', '3180.0000', 'completed', 'paid', 0, NULL, 1, NULL, NULL, 1, 1, '3180.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000'),
(4, '2016-08-07 06:13:45', 'SALE/POS/2016/08/0004', 1, 'Walk-in Customer', 3, 'Test Biller', 1, '', '', '3000.0000', '0.0000', NULL, '0.0000', '0.0000', '180.0000', 1, '0.0000', '180.0000', '0.0000', '3180.0000', 'completed', 'paid', 0, NULL, 1, NULL, NULL, 1, 1, '3180.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000'),
(5, '2016-10-09 11:37:22', 'SALE/POS/2016/10/0005', 1, 'Walk-in Customer', 3, 'Test Biller', 1, '', '', '3000.0000', '0.0000', NULL, '0.0000', '0.0000', '180.0000', 1, '0.0000', '180.0000', '0.0000', '3180.0000', 'completed', 'paid', 0, NULL, 1, NULL, NULL, 1, 1, '3180.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000'),
(6, '2017-11-08 18:39:36', 'SALE/POS/2017/11/0006', 1, 'Walk-in Customer', 3, 'Test Biller', 1, '', '', '3010.0000', '0.0000', NULL, '0.0000', '0.0000', '180.0000', 1, '0.0000', '180.0000', '0.0000', '3190.0000', 'completed', 'due', 0, NULL, 1, NULL, NULL, 2, 1, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000'),
(7, '2017-11-08 18:47:42', 'SALE/2017/11/0001', 7, 'mgma', 3, 'Test Biller', 3, '', '', '40000.0000', '0.0000', NULL, '0.0000', '0.0000', '1800.0000', 1, '0.0000', '1800.0000', '0.0000', '41800.0000', 'completed', 'pending', 0, NULL, 6, NULL, NULL, 110, 0, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000'),
(8, '2017-11-08 20:10:37', 'SALE/POS/2017/11/0007', 1, 'Walk-in Customer', 3, 'Test Biller', 3, '', '', '0.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '0.0000', 'completed', 'due', 0, NULL, 6, NULL, NULL, 1, 1, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000'),
(9, '2017-11-09 01:14:29', 'SALE/POS/2017/11/0008', 1, 'Walk-in Customer', 3, 'Test Biller', 3, '', '', '2200.0000', '0.0000', NULL, '0.0000', '0.0000', '132.0000', 1, '0.0000', '132.0000', '0.0000', '2332.0000', 'completed', 'due', 0, NULL, 6, NULL, NULL, 1, 1, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000'),
(10, '2017-11-09 01:17:37', 'Patient Release', 1, 'Walk-in Customer', 3, 'Test Biller', 23, '', '', '4400.0000', '0.0000', NULL, '0.0000', '0.0000', '264.0000', 1, '0.0000', '264.0000', '0.0000', '4664.0000', 'completed', 'due', 0, NULL, 7, NULL, NULL, 2, 0, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000'),
(11, '2017-11-09 01:32:37', 'Patient Release- Majid Oil', 8, 'None', 3, 'Test Biller', 23, '', '', '100.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '100.0000', 'completed', 'paid', 0, NULL, 7, NULL, NULL, 1, 0, '100.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000'),
(12, '2017-11-09 17:42:46', 'SALE/2017/11/0002', 10, 'None', 3, 'Test Biller', 23, '', '', '0.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '0.0000', 'completed', 'pending', 0, NULL, 7, NULL, NULL, 1, 0, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000'),
(13, '2018-01-13 21:20:20', 'SALE/POS/2018/01/0009', 10, 'None', 3, 'Test Biller', 1, '', '', '510.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '510.0000', 'completed', 'paid', 0, NULL, 1, NULL, NULL, 6, 1, '510.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000'),
(14, '2018-01-22 17:20:09', 'SALE/POS/2018/01/0010', 1, 'Walk-in Customer', 3, 'Test Biller', 1, '', '', '145.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '145.0000', 'completed', 'paid', 0, NULL, 1, NULL, NULL, 1, 1, '145.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000'),
(15, '2018-03-12 06:31:00', '123123', 11, 'Magma', 3, 'Test Biller', 1, '', '', '1000.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '1000.0000', 'completed', 'pending', 0, NULL, 1, NULL, NULL, 127, 0, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_sale_items`
--

CREATE TABLE `sma_sale_items` (
  `id` int(11) NOT NULL,
  `sale_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `sale_item_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_sale_items`
--

INSERT INTO `sma_sale_items` (`id`, `sale_id`, `product_id`, `product_code`, `product_name`, `product_type`, `option_id`, `net_unit_price`, `unit_price`, `quantity`, `warehouse_id`, `item_tax`, `tax_rate_id`, `tax`, `discount`, `item_discount`, `subtotal`, `serial_no`, `real_unit_price`, `sale_item_id`) VALUES
(1, 1, 1, '20445244', 'Samsung Mobile S7', 'standard', 0, '3200.0000', '3392.0000', '1.0000', 1, '192.0000', 3, '6.0000%', '0', '0.0000', '3392.0000', '', '3200.0000', NULL),
(2, 2, 2, '45370706', 'Samsung Watch Gear', 'standard', 0, '2200.0000', '2332.0000', '1.0000', 1, '132.0000', 3, '6.0000%', '0', '0.0000', '2332.0000', '', '2200.0000', NULL),
(3, 3, 1, '20445244', 'Samsung Mobile S7', 'standard', 0, '3000.0000', '3180.0000', '1.0000', 1, '180.0000', 3, '6.0000%', '0', '0.0000', '3180.0000', '', '3000.0000', NULL),
(4, 4, 1, '20445244', 'Samsung Mobile S7', 'standard', 0, '3000.0000', '3180.0000', '1.0000', 1, '180.0000', 3, '6.0000%', '0', '0.0000', '3180.0000', '', '3000.0000', NULL),
(5, 5, 1, '20445244', 'Samsung Mobile S7', 'standard', 0, '3000.0000', '3180.0000', '1.0000', 1, '180.0000', 3, '6.0000%', '0', '0.0000', '3180.0000', '', '3000.0000', NULL),
(6, 6, 7, '33074725', 'Panadol', 'standard', NULL, '10.0000', '10.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '10.0000', '', '10.0000', NULL),
(7, 6, 1, '20445244', 'Samsung Mobile S7', 'standard', NULL, '3000.0000', '3180.0000', '1.0000', 1, '180.0000', 3, '6.0000%', '0', '0.0000', '3180.0000', '', '3000.0000', NULL),
(8, 7, 1, '20445244', 'Samsung Mobile S7', 'standard', NULL, '3000.0000', '3180.0000', '10.0000', 3, '1800.0000', 3, '6.0000%', NULL, '0.0000', '31800.0000', '', '3000.0000', NULL),
(9, 7, 6, '55163412', 'Doxyn 100', 'standard', NULL, '100.0000', '100.0000', '100.0000', 3, '0.0000', 1, '0.0000', NULL, '0.0000', '10000.0000', '', '100.0000', NULL),
(10, 8, 9, '12603955', 'Peracitamol', 'standard', 5, '0.0000', '0.0000', '1.0000', 3, '0.0000', 1, '0.0000', '0', '0.0000', '0.0000', '', '0.0000', NULL),
(11, 9, 2, '45370706', 'Dermovate', 'standard', NULL, '2200.0000', '2332.0000', '1.0000', 3, '132.0000', 3, '6.0000%', '0', '0.0000', '2332.0000', '', '2200.0000', NULL),
(12, 10, 2, '45370706', 'Dermovate', 'standard', NULL, '2200.0000', '2332.0000', '2.0000', 23, '264.0000', 3, '6.0000%', NULL, '0.0000', '4664.0000', '', '2200.0000', NULL),
(13, 11, 10, '1q2344', 'Majid Oil', 'standard', 7, '100.0000', '100.0000', '1.0000', 23, '0.0000', 1, '0.0000', NULL, '0.0000', '100.0000', '1234', '100.0000', NULL),
(14, 12, 11, '70140199', 'Betagan', 'standard', 9, '0.0000', '0.0000', '1.0000', 23, '0.0000', 1, '0.0000', NULL, '0.0000', '0.0000', '21666', '0.0000', NULL),
(15, 13, 6, '55163412', 'Doxyn 100', 'standard', NULL, '100.0000', '100.0000', '5.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '500.0000', '', '100.0000', NULL),
(16, 13, 7, '33074725', 'Panadol', 'standard', NULL, '10.0000', '10.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '10.0000', '', '10.0000', NULL),
(17, 14, 15, 'mg-1g', 'Mango Juice 1 Glass', 'combo', NULL, '145.0000', '145.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '145.0000', '', '145.0000', NULL),
(18, 15, 7, '33074725', 'Panadol', 'standard', NULL, '10.0000', '10.0000', '100.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '1000.0000', '10', '10.0000', NULL),
(19, 15, 1, '20445244', 'Eye drops', 'standard', NULL, '0.0000', '0.0000', '100.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '0.0000', '10', '0.0000', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_sessions`
--

CREATE TABLE `sma_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_sessions`
--

INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('1qbcpfk0vknd0u07r4a0ufj50l', '::1', 1556097196, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363039373139353b6964656e746974797c733a31373a226f776e6572406d61676d6163632e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31373a226f776e6572406d61676d6163632e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536303937313934223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2266323237373839343734656638393064646536383636376635343536323863662e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('2vj5dfulibi2ht1ibduqpi5jd8', '::1', 1556624177, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363632343137363b6964656e746974797c733a31373a226f776e6572406d61676d6163632e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31373a226f776e6572406d61676d6163632e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536363234313734223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2266323237373839343734656638393064646536383636376635343536323863662e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('43ttbdqvo58lfuojv6vgo5cr8p', '::1', 1556544238, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363534343233383b6964656e746974797c733a31373a226f776e6572406d61676d6163632e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31373a226f776e6572406d61676d6163632e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536353434323337223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2266323237373839343734656638393064646536383636376635343536323863662e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('6b6766nprdtoc3gnlleimr745s', '::1', 1556097195, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363039373139343b6964656e746974797c733a31373a226f776e6572406d61676d6163632e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31373a226f776e6572406d61676d6163632e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536303937313933223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2266323237373839343734656638393064646536383636376635343536323863662e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('6g4o6uidtbv2gfgrrijq5um1uf', '::1', 1556624198, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363632343139383b6964656e746974797c733a31373a226f776e6572406d61676d6163632e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31373a226f776e6572406d61676d6163632e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536363234313933223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2266323237373839343734656638393064646536383636376635343536323863662e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('73t7fl7409i04ckkjfd5l3j7kf', '::1', 1556624176, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363632343137333b6964656e746974797c733a31373a226f776e6572406d61676d6163632e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31373a226f776e6572406d61676d6163632e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536353434323338223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2266323237373839343734656638393064646536383636376635343536323863662e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('75qmi8ceoghrm07f7sq19k7e49', '::1', 1556624192, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363632343139323b6964656e746974797c733a31373a226f776e6572406d61676d6163632e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31373a226f776e6572406d61676d6163632e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536363234313932223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2266323237373839343734656638393064646536383636376635343536323863662e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('cohm11f1n992k3ua4hubcfgdrs', '::1', 1556624192, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363632343139323b6964656e746974797c733a31373a226f776e6572406d61676d6163632e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31373a226f776e6572406d61676d6163632e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536363234313736223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2266323237373839343734656638393064646536383636376635343536323863662e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363632343139323b),
('cuun0mkhfcqlb1k81snmujhhch', '::1', 1556097193, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363039373139333b6964656e746974797c733a31373a226f776e6572406d61676d6163632e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31373a226f776e6572406d61676d6163632e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536303937313932223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2266323237373839343734656638393064646536383636376635343536323863662e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6572726f727c4e3b),
('io98im9bt97tlo6tm8rp1ks5kg', '::1', 1556535151, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363533353134393b6964656e746974797c733a31373a226f776e6572406d61676d6163632e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31373a226f776e6572406d61676d6163632e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536303937313935223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2266323237373839343734656638393064646536383636376635343536323863662e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('jqq1anhu01ppah32ujfhu0e69u', '::1', 1556624193, 0x6964656e746974797c733a31373a226f776e6572406d61676d6163632e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31373a226f776e6572406d61676d6163632e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536363234313932223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2266323237373839343734656638393064646536383636376635343536323863662e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313535363632343139333b),
('jvj868bmvl67afrfb7vr249158', '::1', 1556624199, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363632343139383b6964656e746974797c733a31373a226f776e6572406d61676d6163632e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31373a226f776e6572406d61676d6163632e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536363234313938223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2266323237373839343734656638393064646536383636376635343536323863662e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('okvdl1khej8gk5u3lha6s42a8p', '::1', 1556544238, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363534343233373b6964656e746974797c733a31373a226f776e6572406d61676d6163632e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31373a226f776e6572406d61676d6163632e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536353335313533223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2266323237373839343734656638393064646536383636376635343536323863662e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('sjdq7bemsfi9skp0ill3k17vhv', '::1', 1556535155, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535363533353135333b6964656e746974797c733a31373a226f776e6572406d61676d6163632e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31373a226f776e6572406d61676d6163632e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353536353335313439223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2266323237373839343734656638393064646536383636376635343536323863662e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b);

-- --------------------------------------------------------

--
-- Table structure for table `sma_settings`
--

CREATE TABLE `sma_settings` (
  `setting_id` int(1) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `logo2` varchar(255) NOT NULL,
  `site_name` varchar(55) NOT NULL,
  `language` varchar(20) NOT NULL,
  `default_warehouse` int(2) NOT NULL,
  `accounting_method` tinyint(4) NOT NULL DEFAULT '0',
  `default_currency` varchar(3) NOT NULL,
  `default_tax_rate` int(2) NOT NULL,
  `rows_per_page` int(2) NOT NULL,
  `version` varchar(10) NOT NULL DEFAULT '1.0',
  `default_tax_rate2` int(11) NOT NULL DEFAULT '0',
  `dateformat` int(11) NOT NULL,
  `sales_prefix` varchar(20) DEFAULT NULL,
  `quote_prefix` varchar(20) DEFAULT NULL,
  `purchase_prefix` varchar(20) DEFAULT NULL,
  `transfer_prefix` varchar(20) DEFAULT NULL,
  `delivery_prefix` varchar(20) DEFAULT NULL,
  `payment_prefix` varchar(20) DEFAULT NULL,
  `return_prefix` varchar(20) DEFAULT NULL,
  `returnp_prefix` varchar(20) DEFAULT NULL,
  `expense_prefix` varchar(20) DEFAULT NULL,
  `item_addition` tinyint(1) NOT NULL DEFAULT '0',
  `theme` varchar(20) NOT NULL,
  `product_serial` tinyint(4) NOT NULL,
  `default_discount` int(11) NOT NULL,
  `product_discount` tinyint(1) NOT NULL DEFAULT '0',
  `discount_method` tinyint(4) NOT NULL,
  `tax1` tinyint(4) NOT NULL,
  `tax2` tinyint(4) NOT NULL,
  `overselling` tinyint(1) NOT NULL DEFAULT '0',
  `restrict_user` tinyint(4) NOT NULL DEFAULT '0',
  `restrict_calendar` tinyint(4) NOT NULL DEFAULT '0',
  `timezone` varchar(100) DEFAULT NULL,
  `iwidth` int(11) NOT NULL DEFAULT '0',
  `iheight` int(11) NOT NULL,
  `twidth` int(11) NOT NULL,
  `theight` int(11) NOT NULL,
  `watermark` tinyint(1) DEFAULT NULL,
  `reg_ver` tinyint(1) DEFAULT NULL,
  `allow_reg` tinyint(1) DEFAULT NULL,
  `reg_notification` tinyint(1) DEFAULT NULL,
  `auto_reg` tinyint(1) DEFAULT NULL,
  `protocol` varchar(20) NOT NULL DEFAULT 'mail',
  `mailpath` varchar(55) DEFAULT '/usr/sbin/sendmail',
  `smtp_host` varchar(100) DEFAULT NULL,
  `smtp_user` varchar(100) DEFAULT NULL,
  `smtp_pass` varchar(255) DEFAULT NULL,
  `smtp_port` varchar(10) DEFAULT '25',
  `smtp_crypto` varchar(10) DEFAULT NULL,
  `corn` datetime DEFAULT NULL,
  `customer_group` int(11) NOT NULL,
  `default_email` varchar(100) NOT NULL,
  `mmode` tinyint(1) NOT NULL,
  `bc_fix` tinyint(4) NOT NULL DEFAULT '0',
  `auto_detect_barcode` tinyint(1) NOT NULL DEFAULT '0',
  `captcha` tinyint(1) NOT NULL DEFAULT '1',
  `reference_format` tinyint(1) NOT NULL DEFAULT '1',
  `racks` tinyint(1) DEFAULT '0',
  `attributes` tinyint(1) NOT NULL DEFAULT '0',
  `product_expiry` tinyint(1) NOT NULL DEFAULT '0',
  `decimals` tinyint(2) NOT NULL DEFAULT '2',
  `qty_decimals` tinyint(2) NOT NULL DEFAULT '2',
  `decimals_sep` varchar(2) NOT NULL DEFAULT '.',
  `thousands_sep` varchar(2) NOT NULL DEFAULT ',',
  `invoice_view` tinyint(1) DEFAULT '0',
  `default_biller` int(11) DEFAULT NULL,
  `envato_username` varchar(50) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT NULL,
  `rtl` tinyint(1) DEFAULT '0',
  `each_spent` decimal(15,4) DEFAULT NULL,
  `ca_point` tinyint(4) DEFAULT NULL,
  `each_sale` decimal(15,4) DEFAULT NULL,
  `sa_point` tinyint(4) DEFAULT NULL,
  `update` tinyint(1) DEFAULT '0',
  `sac` tinyint(1) DEFAULT '0',
  `display_all_products` tinyint(1) DEFAULT '0',
  `display_symbol` tinyint(1) DEFAULT NULL,
  `symbol` varchar(50) DEFAULT NULL,
  `remove_expired` tinyint(1) DEFAULT '0',
  `barcode_separator` varchar(2) NOT NULL DEFAULT '_',
  `set_focus` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_settings`
--

INSERT INTO `sma_settings` (`setting_id`, `logo`, `logo2`, `site_name`, `language`, `default_warehouse`, `accounting_method`, `default_currency`, `default_tax_rate`, `rows_per_page`, `version`, `default_tax_rate2`, `dateformat`, `sales_prefix`, `quote_prefix`, `purchase_prefix`, `transfer_prefix`, `delivery_prefix`, `payment_prefix`, `return_prefix`, `returnp_prefix`, `expense_prefix`, `item_addition`, `theme`, `product_serial`, `default_discount`, `product_discount`, `discount_method`, `tax1`, `tax2`, `overselling`, `restrict_user`, `restrict_calendar`, `timezone`, `iwidth`, `iheight`, `twidth`, `theight`, `watermark`, `reg_ver`, `allow_reg`, `reg_notification`, `auto_reg`, `protocol`, `mailpath`, `smtp_host`, `smtp_user`, `smtp_pass`, `smtp_port`, `smtp_crypto`, `corn`, `customer_group`, `default_email`, `mmode`, `bc_fix`, `auto_detect_barcode`, `captcha`, `reference_format`, `racks`, `attributes`, `product_expiry`, `decimals`, `qty_decimals`, `decimals_sep`, `thousands_sep`, `invoice_view`, `default_biller`, `envato_username`, `purchase_code`, `rtl`, `each_spent`, `ca_point`, `each_sale`, `sa_point`, `update`, `sac`, `display_all_products`, `display_symbol`, `symbol`, `remove_expired`, `barcode_separator`, `set_focus`) VALUES
(1, 'logo2.png', '300x80.png', 'Magma Consulting Corp.', 'english', 1, 0, 'USD', 1, 10, '3.0.2.13', 1, 5, 'SALE', 'QUOTE', 'PO', 'TR', 'DO', 'IPAY', 'SR', 'PR', '', 0, 'default', 1, 1, 1, 1, 1, 1, 0, 1, 0, 'Asia/Kuala_Lumpur', 800, 800, 60, 60, 0, 0, 0, 1, NULL, 'mail', '/usr/sbin/sendmail', 'pop.gmail.com', 'contact@sma.tecdiary.org', 'jEFTM4T63AiQ9dsidxhPKt9CIg4HQjCN58n/RW9vmdC/UDXCzRLR469ziZ0jjpFlbOg43LyoSmpJLBkcAHh0Yw==', '25', NULL, NULL, 1, 'contact@tecdiary.com', 0, 4, 1, 0, 2, 1, 1, 0, 2, 2, '.', ',', 0, 3, 'mze0007', '521a8016-1f43-4511-9e51-c383ef1253e5', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 1, '', 0, '_', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_skrill`
--

CREATE TABLE `sma_skrill` (
  `id` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `account_email` varchar(255) NOT NULL DEFAULT 'testaccount2@moneybookers.com',
  `secret_word` varchar(20) NOT NULL DEFAULT 'mbtest',
  `skrill_currency` varchar(3) NOT NULL DEFAULT 'USD',
  `fixed_charges` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `extra_charges_my` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `extra_charges_other` decimal(25,4) NOT NULL DEFAULT '0.0000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_skrill`
--

INSERT INTO `sma_skrill` (`id`, `active`, `account_email`, `secret_word`, `skrill_currency`, `fixed_charges`, `extra_charges_my`, `extra_charges_other`) VALUES
(1, 1, 'testaccount2@moneybookers.com', 'mbtest', 'USD', '0.0000', '0.0000', '0.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_subcategories`
--

CREATE TABLE `sma_subcategories` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `code` varchar(55) NOT NULL,
  `name` varchar(55) NOT NULL,
  `image` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_subcategories`
--

INSERT INTO `sma_subcategories` (`id`, `category_id`, `code`, `name`, `image`) VALUES
(1, 1, 'Samsung E7', 'Samsung Latest', '3844d0534c55c4f926cb50fae02acc70.png'),
(2, 3, 'Med-Cap', 'Capsules', NULL),
(3, 3, 'med-eye', 'Eye Drops', NULL),
(4, 3, 'med-Inj', 'Injections', NULL),
(5, 3, 'med-Oin', 'Ointments', NULL),
(6, 3, 'med-Syr', 'Syrups', NULL),
(7, 3, 'med-Tab', 'Tablets', NULL),
(8, 4, 'IOL-Phaco', 'Phaco', NULL),
(9, 4, 'IOL-NonP', 'Non Phaco', NULL),
(10, 4, 'IOL-AC', 'AC', NULL),
(11, 4, 'IOL-Fol', 'Foldable ', NULL),
(12, 4, 'IOL-Scl', 'Scleral Fixation', NULL),
(13, 5, 'Instrument-Pha', 'Phaco Instruments', NULL),
(14, 5, 'Instrument-Acc', 'Accuras Instruments', NULL),
(15, 5, 'Instrument-Vit', 'Vitrectomy / R.D Instruments', NULL),
(16, 5, 'Instrument-Leg', 'Legacy Instruments', NULL),
(17, 5, 'Instrument-Las', 'Laser Probes', NULL),
(18, 5, 'Instruments-For', 'Forceps', NULL),
(19, 5, 'Instruments-Sci', 'Scissors', NULL),
(20, 5, 'Instruments-Mic', 'Micselleneous (Instruments)', NULL),
(21, 6, 'dc-Acc', 'Accurus Accessories', NULL),
(22, 6, 'dc-Bla', 'Blads', NULL),
(23, 6, 'dc-Can', 'Cannula', NULL),
(24, 6, 'dc-ETT', 'ETT Tubes', NULL),
(25, 6, 'dc-Kni', 'Knife', NULL),
(26, 6, 'dc-Las', 'Laser Probes', NULL),
(27, 6, 'dc-Sur', 'Surgical Gloves', NULL),
(28, 6, 'dc-Sut', 'Sutures', NULL),
(29, 6, 'dc-Syr', 'Syringes & Needles', NULL),
(30, 6, 'dc-Ter', 'Terphine', NULL),
(31, 6, 'dc-Mis', 'Miscelleneous (DC) ', NULL),
(32, 6, 'dc-Ant', 'Antibiotic Disc', NULL),
(33, 6, 'dc-Acc.Cata', 'Acc. of Catarhex Phaco Oertli ', NULL),
(34, 6, 'dc-Acc.Iri', 'Acc. of Iridex Laser', NULL),
(35, 6, 'dc-Low', 'Low Vision ', NULL),
(36, 6, 'dc-Pha', 'Phaco', NULL),
(37, 6, 'dc-Plsuar -2', 'Acc. Plsuar -2 ', NULL),
(38, 6, 'dc-Ele', 'Electrodes for ERG/EOG', NULL),
(39, 6, 'dc-Storz', 'Acc. Storz Premiere', NULL),
(40, 6, 'dc-I/A', 'I/A Tubing Set DP4210/A S.P', NULL),
(41, 6, 'dc-Const', 'Acc. Const Vit/Phaco', NULL),
(42, 6, 'dc-Phaco', 'Phaco Pulsar-1', NULL),
(43, 7, 'IC-Staff', 'Staff Uniform', NULL),
(44, 7, 'IC-Clothing', 'Clothing', NULL),
(45, 7, 'IC-Legacy', 'Legacy Instruments', NULL),
(46, 7, 'IC-Miscelleneous', 'Miscelleneous (IC)', NULL),
(47, 7, 'IC-Consumable', 'Store Consumable', NULL),
(48, 7, 'IC-Pulsar-2', 'Pulsar-2', NULL),
(49, 8, 'equi-Bulb', 'Bulb', NULL),
(50, 8, 'equi-Misc', 'Misceleneous (EQA)', NULL),
(51, 8, 'equi-Hand-Piece', 'Phaco Hand Piece', NULL),
(52, 9, 'stati-Cartridge', 'Cartridge', NULL),
(53, 9, 'stati-Other', 'Other Stationery', NULL),
(54, 9, 'stati-Pre', 'Pre Printed Stationery', NULL),
(55, 10, 'Comp-Ass-Cartridge', 'Cartridge / Fax Film', NULL),
(56, 10, 'Comp-Ass-Miscellaneous', 'Miscellaneous', NULL),
(57, 11, 'MJ-585', 'Mango Juice', NULL),
(58, 12, 'Super', 'Super', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_suspended_bills`
--

CREATE TABLE `sma_suspended_bills` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) DEFAULT NULL,
  `count` int(11) NOT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_tax_id` int(11) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `biller_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `suspend_note` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_suspended_items`
--

CREATE TABLE `sma_suspended_items` (
  `id` int(11) NOT NULL,
  `suspend_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) NOT NULL,
  `quantity` decimal(15,4) DEFAULT '0.0000',
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_tax_rates`
--

CREATE TABLE `sma_tax_rates` (
  `id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `code` varchar(10) DEFAULT NULL,
  `rate` decimal(12,4) NOT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_tax_rates`
--

INSERT INTO `sma_tax_rates` (`id`, `name`, `code`, `rate`, `type`) VALUES
(1, 'No Tax', 'NT', '0.0000', '2'),
(2, 'VAT @10%', 'VAT10', '10.0000', '1'),
(3, 'GST @6%', 'GST', '6.0000', '1'),
(4, 'VAT @20%', 'VT20', '20.0000', '1');

-- --------------------------------------------------------

--
-- Table structure for table `sma_transfers`
--

CREATE TABLE `sma_transfers` (
  `id` int(11) NOT NULL,
  `transfer_no` varchar(55) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `from_warehouse_id` int(11) NOT NULL,
  `from_warehouse_code` varchar(55) NOT NULL,
  `from_warehouse_name` varchar(55) NOT NULL,
  `to_warehouse_id` int(11) NOT NULL,
  `to_warehouse_code` varchar(55) NOT NULL,
  `to_warehouse_name` varchar(55) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT NULL,
  `grand_total` decimal(25,4) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `status` varchar(55) NOT NULL DEFAULT 'pending',
  `shipping` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `attachment` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_transfers`
--

INSERT INTO `sma_transfers` (`id`, `transfer_no`, `date`, `from_warehouse_id`, `from_warehouse_code`, `from_warehouse_name`, `to_warehouse_id`, `to_warehouse_code`, `to_warehouse_name`, `note`, `total`, `total_tax`, `grand_total`, `created_by`, `status`, `shipping`, `attachment`) VALUES
(1, 'yg', '2017-11-03 22:32:00', 1, 'WHI', 'CSMD Warehouse 0001', 3, 'LRBT-1', 'Kalakalay', '', '10000.0000', '0.0000', '10556.0000', '1', 'completed', '556.0000', NULL),
(2, '88288', '2017-11-08 17:03:38', 3, 'LRBT-1', 'Kalakalay', 22, 'test', 'test', '&lt;p&gt;sdsds&lt;&sol;p&gt;', '75000.0000', '4500.0000', '2544965.0000', '6', 'completed', '2465465.0000', NULL),
(3, 'TR/2017/11/0001', '2017-11-08 19:10:00', 1, 'WHI', 'CSMD Warehouse 0001', 3, 'LRBT-1', 'Kalakalay', '', '0.0000', '0.0000', '0.0000', '1', 'completed', '0.0000', NULL),
(4, 'TR/2017/11/0002', '2017-11-08 19:57:00', 1, 'WHI', 'CSMD Warehouse 0001', 3, 'LRBT-1', 'Kalakalay', '', '10.0000', '0.0000', '10.0000', '1', 'completed', '0.0000', NULL),
(5, 'jjjj', '2017-11-08 20:09:03', 1, 'WHI', 'CSMD Warehouse 0001', 23, 'GW-123', 'General Ward', '', '0.0000', '0.0000', '0.0000', '6', 'completed', '0.0000', NULL),
(6, 'Test Ali', '2017-11-09 00:45:00', 1, 'WHI', 'CSMD Warehouse 0001', 3, 'LRBT-1', 'Kalakalay', '&lt;p&gt;Request by Kalakalay&lt;&sol;p&gt;', '10000.0000', '600.0000', '10600.0000', '1', 'sent', '0.0000', NULL),
(7, 'Test Ali-2', '2017-11-09 00:50:00', 1, 'WHI', 'CSMD Warehouse 0001', 3, 'LRBT-1', 'Kalakalay', '', '10000.0000', '600.0000', '10600.0000', '1', 'completed', '0.0000', NULL),
(8, 'Ward Transfer-101', '2017-11-09 00:57:16', 3, 'LRBT-1', 'Kalakalay', 23, 'GW-123', 'General Ward', '', '6000.0000', '360.0000', '6360.0000', '6', 'completed', '0.0000', NULL),
(9, 'Test Majid', '2017-11-09 01:03:00', 1, 'WHI', 'CSMD Warehouse 0001', 3, 'LRBT-1', 'Kalakalay', '', '0.0000', '0.0000', '0.0000', '1', 'completed', '0.0000', NULL),
(10, 'Test Majid 2', '2017-11-09 01:07:00', 1, 'WHI', 'CSMD Warehouse 0001', 3, 'LRBT-1', 'Kalakalay', '', '2000.0000', '120.0000', '2120.0000', '1', 'completed', '0.0000', NULL),
(11, 'Ward Transfer Majid', '2017-11-09 01:10:02', 3, 'LRBT-1', 'Kalakalay', 23, 'GW-123', 'General Ward', '', '4000.0000', '240.0000', '4240.0000', '6', 'completed', '0.0000', NULL),
(12, 'Majid Oil Transfer', '2017-11-09 01:25:00', 1, 'WHI', 'CSMD Warehouse 0001', 3, 'LRBT-1', 'Kalakalay', '', '0.0000', '0.0000', '0.0000', '1', 'completed', '0.0000', NULL),
(13, 'Ward Transfer', '2017-11-09 01:28:34', 3, 'LRBT-1', 'Kalakalay', 23, 'GW-123', 'General Ward', '', '0.0000', '0.0000', '0.0000', '6', 'completed', '0.0000', NULL),
(14, 'TR/2017/11/0003', '2017-11-09 17:25:00', 1, 'WHI', 'CSMD Warehouse 0001', 3, 'LRBT-1', 'Kalakalay', '', '1200.0000', '0.0000', '1200.0000', '1', 'completed', '0.0000', NULL),
(15, '6543', '2017-11-09 17:36:35', 3, 'LRBT-1', 'Kalakalay', 23, 'GW-123', 'General Ward', '', '600.0000', '0.0000', '600.0000', '6', 'sent', '0.0000', NULL),
(16, '2213', '2017-11-09 17:38:23', 3, 'LRBT-1', 'Kalakalay', 23, 'GW-123', 'General Ward', '', '600.0000', '0.0000', '600.0000', '6', 'completed', '0.0000', NULL),
(17, 'TR/2019/04/0004', '2019-04-02 07:31:00', 1, 'WHI', 'CSMD Warehouse 0001', 2, 'WHII', 'Warehouse 2', '', '0.0000', '0.0000', '0.0000', '1', 'completed', '0.0000', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_transfer_items`
--

CREATE TABLE `sma_transfer_items` (
  `id` int(11) NOT NULL,
  `transfer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `expiry` date DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `net_unit_cost` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) DEFAULT NULL,
  `quantity_balance` decimal(15,4) NOT NULL,
  `unit_cost` decimal(25,4) DEFAULT NULL,
  `real_unit_cost` decimal(25,4) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_transfer_items`
--

INSERT INTO `sma_transfer_items` (`id`, `transfer_id`, `product_id`, `product_code`, `product_name`, `option_id`, `expiry`, `quantity`, `tax_rate_id`, `tax`, `item_tax`, `net_unit_cost`, `subtotal`, `quantity_balance`, `unit_cost`, `real_unit_cost`, `date`, `warehouse_id`) VALUES
(1, 6, 2, '45370706', 'Dermovate', NULL, NULL, '5.0000', 3, '6.0000%', '600.0000', '2000.0000', '10600.0000', '5.0000', '2120.0000', '2000.0000', '2017-11-08', 3),
(2, 15, 11, '70140199', 'Betagan', 9, NULL, '10.0000', 1, '0.0000', '0.0000', '60.0000', '600.0000', '10.0000', '60.0000', '60.0000', '2017-11-09', 23);

-- --------------------------------------------------------

--
-- Table structure for table `sma_users`
--

CREATE TABLE `sma_users` (
  `id` int(11) UNSIGNED NOT NULL,
  `last_ip_address` varbinary(45) DEFAULT NULL,
  `ip_address` varbinary(45) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(40) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `avatar` varchar(55) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `group_id` int(10) UNSIGNED NOT NULL,
  `warehouse_id` int(10) UNSIGNED DEFAULT NULL,
  `biller_id` int(10) UNSIGNED DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `show_cost` tinyint(1) DEFAULT '0',
  `show_price` tinyint(1) DEFAULT '0',
  `award_points` int(11) DEFAULT '0',
  `view_right` tinyint(1) NOT NULL DEFAULT '0',
  `edit_right` tinyint(1) NOT NULL DEFAULT '0',
  `allow_discount` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_users`
--

INSERT INTO `sma_users` (`id`, `last_ip_address`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `avatar`, `gender`, `group_id`, `warehouse_id`, `biller_id`, `company_id`, `show_cost`, `show_price`, `award_points`, `view_right`, `edit_right`, `allow_discount`) VALUES
(1, 0x3a3a31, 0x0000, 'owner', '19e0eddb552b45f9a40fd1b1200275f0a6bfa003', NULL, 'owner@magmacc.com', 'b9c3a57bb3ec8dcda8493358c1f7148d6675c1bf', NULL, NULL, '23432b7fabfe5abb0ad89a4a385754014b31c12e', 1351661704, 1556624198, 1, 'Muhammad', 'Umer', 'Magma Consulting Corporation', '0129703973', 'f227789474ef890dde68667f545628cf.png', 'male', 1, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0),
(2, 0x3130332e3233362e3133352e3538, 0x3137352e3133392e3137332e3737, 'admin@magmacc.com', '2837691db2c26864f900e6df5c7335870f60bd30', NULL, 'admin@magmacc.com', NULL, NULL, NULL, NULL, 1467263270, 1515562957, 1, 'Baqar', 'Hassan', 'Magma Consulting Corporation', '0129703973', NULL, 'male', 2, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0),
(3, 0x3134312e3130312e39382e323230, 0x3137352e3133392e3137322e313039, 'admin', '45019ef1a2b6ef9133d5ab9e02090f3c6712401f', NULL, 'csmdsoft@gmail.com', 'f711af4cde06ddff80924a9ad12cbea112bdf19b', NULL, NULL, 'f891f78a15e01291f1867c73ec9a37771c53816b', 1480710676, 1509531448, 0, 'CSMD', 'Soft', 'CSMD', '0102334578', NULL, 'male', 1, 0, 0, NULL, 0, 0, 0, 1, 0, 0),
(4, 0x34352e3131362e3233322e3233, 0x3137352e3133392e3137322e3233, 'mze0007@gmail.comadmin@theonemalls.com', 'bdd64cac39ed5cf781dc7e82094cd6d5ca13dbfc', NULL, 'admin@theonemalls.com', '2ddbf3d47b9864f05157f78df9690ad32c49da4a', NULL, NULL, NULL, 1496396503, 1502132325, 0, 'Mubashir', 'Hussain', 'SAWATI GLOBAL TRADERS SDN. BHD', '129703973', NULL, 'male', 1, 0, 0, NULL, 0, 0, 0, 1, 0, 0),
(6, 0x3136322e3135382e39322e313036, 0x3136322e3135382e38392e37, 'wh@gmail.com', 'f90a04dbb55fbb61f7cf9b0bd6e5eb6396145c93', NULL, 'wh@gmail.com', NULL, NULL, NULL, NULL, 1510120714, 1510205339, 1, 'ware', 'house', 'LRBT', '00988778877', NULL, 'male', 6, 3, 3, NULL, 0, 0, 0, 0, 1, 0),
(7, 0x3136322e3135382e39322e313036, 0x3136322e3135382e38392e37, 'kkward', '19ca672fc77f3c443b63d33b88ac918877f8e8df', NULL, 'asd@gmail.com', NULL, NULL, NULL, NULL, 1510149273, 1510205454, 1, 'KK-Ward', 'asdas', 'asda', 'sda', NULL, 'male', 6, 23, NULL, NULL, 0, 0, 0, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_user_logins`
--

CREATE TABLE `sma_user_logins` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_user_logins`
--

INSERT INTO `sma_user_logins` (`id`, `user_id`, `company_id`, `ip_address`, `login`, `time`) VALUES
(1, 1, NULL, 0x3132342e31332e3138352e313936, 'owner@tecdiary.com', '2016-06-30 03:02:53'),
(2, 1, NULL, 0x3137352e3133392e3137332e3737, 'owner@tecdiary.com', '2016-06-30 04:01:53'),
(3, 1, NULL, 0x3137352e3133392e3137332e3737, 'owner@tecdiary.com', '2016-06-30 05:05:46'),
(4, 1, NULL, 0x3137352e3133392e3137332e3737, 'owner@tecdiary.com', '2016-06-30 07:31:10'),
(5, 1, NULL, 0x3137352e3133392e3137332e3737, 'owner@tecdiary.com', '2016-07-01 12:37:53'),
(6, 1, NULL, 0x3137352e3133392e3137332e3737, 'owner@tecdiary.com', '2016-07-02 13:42:34'),
(7, 1, NULL, 0x35302e3131382e3137322e3532, 'owner@tecdiary.com', '2016-07-12 08:17:01'),
(8, 1, NULL, 0x3137352e3133392e3137332e313432, 'owner@tecdiary.com', '2016-07-12 08:18:45'),
(9, 1, NULL, 0x3137352e3133392e3137332e313432, 'owner@tecdiary.com', '2016-07-16 12:39:50'),
(10, 1, NULL, 0x3137352e3133392e3137332e323437, 'owner@tecdiary.com', '2016-08-03 09:33:33'),
(11, 1, NULL, 0x3137352e3133392e3137322e3735, 'owner@tecdiary.com', '2016-08-06 22:12:57'),
(12, 1, NULL, 0x3137352e3133392e3137352e3736, 'owner@tecdiary.com', '2016-09-14 03:45:02'),
(13, 1, NULL, 0x3137352e3133392e3137342e323338, 'owner@tecdiary.com', '2016-10-09 03:26:55'),
(14, 1, NULL, 0x3137352e3133392e3137342e323339, 'owner@tecdiary.com', '2016-10-21 15:04:12'),
(15, 1, NULL, 0x3137352e3133392e3137332e3834, 'owner@tecdiary.com', '2016-11-10 13:51:29'),
(16, 1, NULL, 0x3137352e3133392e3137322e313939, 'owner@tecdiary.com', '2016-11-13 09:42:31'),
(17, 1, NULL, 0x3137352e3133392e3137322e313039, 'owner@tecdiary.com', '2016-12-02 16:54:00'),
(18, 1, NULL, 0x3137352e3133392e3137342e313538, 'owner@tecdiary.com', '2017-02-14 08:24:41'),
(19, 1, NULL, 0x3131392e3135372e31342e323137, 'owner@tecdiary.com', '2017-02-25 11:53:42'),
(20, 1, NULL, 0x39332e33362e3139332e3332, 'owner@tecdiary.com', '2017-02-25 18:24:12'),
(21, 1, NULL, 0x3131392e3135342e3230352e313638, 'owner@tecdiary.com', '2017-02-26 13:00:21'),
(22, 1, NULL, 0x3131392e3135342e3230352e313638, 'owner@tecdiary.com', '2017-02-26 13:02:26'),
(23, 1, NULL, 0x3132382e3233342e3133392e3137, 'owner@tecdiary.com', '2017-02-26 13:12:41'),
(24, 1, NULL, 0x3137382e36322e3132382e3637, 'owner@tecdiary.com', '2017-04-29 09:47:01'),
(25, 1, NULL, 0x3131392e3135342e3231302e3939, 'owner@tecdiary.com', '2017-07-22 12:34:10'),
(26, 1, NULL, 0x3131392e3135342e3137332e313135, 'owner@tecdiary.com', '2017-07-30 06:12:03'),
(27, 2, NULL, 0x3131392e3135342e3137312e313330, 'admin@csmdsoft.com', '2017-07-30 09:18:04'),
(28, 2, NULL, 0x3131392e3135342e3137312e313330, 'admin@csmdsoft.com', '2017-07-30 13:11:46'),
(29, 2, NULL, 0x3137352e3133392e3137352e3436, 'admin@csmdsoft.com', '2017-07-30 13:25:13'),
(30, 2, NULL, 0x3137352e3133392e3137352e3436, 'admin@csmdsoft.com', '2017-07-30 13:34:00'),
(31, 2, NULL, 0x3137352e3133392e3137352e3436, 'admin@csmdsoft.com', '2017-07-30 14:22:44'),
(32, 4, NULL, 0x3137352e3133392e3137352e3436, 'admin@theonemalls.com', '2017-07-30 14:24:18'),
(33, 4, NULL, 0x34352e3131362e3233322e3233, 'admin@theonemalls.com', '2017-08-07 18:58:45'),
(34, 2, NULL, 0x3137352e3133392e3137322e313532, 'admin@csmdsoft.com', '2017-10-20 11:48:50'),
(35, 2, NULL, 0x3130332e3233362e3133352e3538, 'admin@csmdsoft.com', '2017-10-20 12:00:51'),
(36, 2, NULL, 0x3138332e37382e35362e323032, 'admin@csmdsoft.com', '2017-10-23 03:33:19'),
(37, 3, NULL, 0x3138332e37382e35362e323032, 'admin', '2017-10-23 03:46:10'),
(38, 3, NULL, 0x3a3a31, 'admin', '2017-10-31 10:33:04'),
(39, 3, NULL, 0x3a3a31, 'admin', '2017-10-31 12:12:01'),
(40, 3, NULL, 0x3134312e3130312e3130372e3534, 'admin', '2017-11-01 06:26:56'),
(41, 3, NULL, 0x3134312e3130312e3130372e3534, 'admin', '2017-11-01 06:27:01'),
(42, 3, NULL, 0x34352e3234392e31312e313836, 'admin', '2017-11-01 06:39:35'),
(43, 3, NULL, 0x34352e3234392e31312e313836, 'admin', '2017-11-01 06:41:49'),
(44, 3, NULL, 0x34352e3234392e31312e313836, 'admin', '2017-11-01 06:42:08'),
(45, 3, NULL, 0x34352e3234392e31312e313836, 'admin', '2017-11-01 06:45:57'),
(46, 3, NULL, 0x34352e3234392e31312e313836, 'admin', '2017-11-01 06:48:43'),
(47, 3, NULL, 0x3134312e3130312e3130372e3534, 'admin', '2017-11-01 06:51:05'),
(48, 3, NULL, 0x3134312e3130312e3130372e3534, 'admin', '2017-11-01 07:59:08'),
(49, 3, NULL, 0x3136322e3135382e38382e3434, 'admin', '2017-11-01 09:09:30'),
(50, 3, NULL, 0x3134312e3130312e3130372e3534, 'admin', '2017-11-01 09:26:00'),
(51, 3, NULL, 0x3134312e3130312e3130372e3534, 'admin', '2017-11-01 09:26:23'),
(52, 3, NULL, 0x3134312e3130312e39382e323230, 'admin', '2017-11-01 10:17:28'),
(53, 1, NULL, 0x3134312e3130312e39382e323230, 'owner@magmacc.com', '2017-11-01 10:19:10'),
(54, 2, NULL, 0x3134312e3130312e3130372e3534, 'admin@magmacc.com', '2017-11-01 10:40:56'),
(55, 2, NULL, 0x3134312e3130312e39382e323230, 'admin@magmacc.com', '2017-11-01 10:42:32'),
(56, 2, NULL, 0x3134312e3130312e3130372e3534, 'admin@magmacc.com', '2017-11-01 11:02:16'),
(57, 2, NULL, 0x3134312e3130312e3130372e3534, 'admin@magmacc.com', '2017-11-01 11:06:18'),
(58, 2, NULL, 0x3134312e3130312e3130372e3534, 'admin@magmacc.com', '2017-11-01 11:06:37'),
(59, 1, NULL, 0x3134312e3130312e3130372e3534, 'owner@magmacc.com', '2017-11-01 11:07:45'),
(60, 1, NULL, 0x3134312e3130312e3130372e3534, 'owner@magmacc.com', '2017-11-01 11:08:45'),
(61, 2, NULL, 0x3134312e3130312e3130372e3534, 'admin@magmacc.com', '2017-11-02 09:54:06'),
(62, 2, NULL, 0x3134312e3130312e39382e323230, 'admin@magmacc.com', '2017-11-03 06:03:35'),
(63, 1, NULL, 0x3134312e3130312e39382e323230, 'owner@magmacc.com', '2017-11-03 06:04:05'),
(64, 1, NULL, 0x3134312e3130312e3130372e3534, 'owner@magmacc.com', '2017-11-03 12:15:32'),
(65, 5, NULL, 0x3134312e3130312e3130372e3534, 'wh@gmail.com', '2017-11-03 12:26:21'),
(66, 1, NULL, 0x3134312e3130312e3130372e3534, 'owner@magmacc.com', '2017-11-03 12:26:49'),
(67, 5, NULL, 0x3134312e3130312e3130372e3534, 'wh@gmail.com', '2017-11-03 12:35:14'),
(68, 1, NULL, 0x3134312e3130312e3130372e3534, 'owner@magmacc.com', '2017-11-03 12:43:41'),
(69, 1, NULL, 0x3134312e3130312e3130372e3534, 'owner@magmacc.com', '2017-11-06 06:20:31'),
(70, 1, NULL, 0x3134312e3130312e3130372e3534, 'owner@magmacc.com', '2017-11-06 06:24:35'),
(71, 1, NULL, 0x3136322e3135382e38392e37, 'owner@magmacc.com', '2017-11-08 05:51:28'),
(72, 1, NULL, 0x3136322e3135382e38392e37, 'owner@magmacc.com', '2017-11-08 05:58:50'),
(73, 6, NULL, 0x3136322e3135382e38392e37, 'wh@gmail.com', '2017-11-08 05:59:09'),
(74, 1, NULL, 0x3136322e3135382e38392e37, 'owner@magmacc.com', '2017-11-08 06:18:54'),
(75, 1, NULL, 0x3136322e3135382e38392e37, 'owner@magmacc.com', '2017-11-08 07:25:44'),
(76, 1, NULL, 0x3136322e3135382e39312e3539, 'owner@magmacc.com', '2017-11-08 07:35:51'),
(77, 1, NULL, 0x3136322e3135382e38392e37, 'owner@magmacc.com', '2017-11-08 07:40:55'),
(78, 6, NULL, 0x3136322e3135382e39312e3539, 'wh@gmail.com', '2017-11-08 07:43:22'),
(79, 1, NULL, 0x3136322e3135382e39312e3539, 'owner@magmacc.com', '2017-11-08 07:55:07'),
(80, 6, NULL, 0x3136322e3135382e38392e37, 'wh@gmail.com', '2017-11-08 08:34:01'),
(81, 1, NULL, 0x3136322e3135382e38392e37, 'owner@magmacc.com', '2017-11-08 08:50:49'),
(82, 6, NULL, 0x3136322e3135382e39312e3539, 'wh@gmail.com', '2017-11-08 09:03:48'),
(83, 1, NULL, 0x3136322e3135382e39312e3539, 'owner@magmacc.com', '2017-11-08 09:06:40'),
(84, 6, NULL, 0x3136322e3135382e39312e3539, 'wh@gmail.com', '2017-11-08 09:08:04'),
(85, 6, NULL, 0x3136322e3135382e38392e37, 'wh@gmail.com', '2017-11-08 09:24:52'),
(86, 1, NULL, 0x3136322e3135382e38392e37, 'owner@magmacc.com', '2017-11-08 13:34:35'),
(87, 6, NULL, 0x3136322e3135382e38392e37, 'wh@gmail.com', '2017-11-08 13:35:56'),
(88, 7, NULL, 0x3136322e3135382e38392e37, 'kkward', '2017-11-08 13:55:14'),
(89, 6, NULL, 0x3136322e3135382e38392e37, 'wh@gmail.com', '2017-11-08 13:56:09'),
(90, 7, NULL, 0x3136322e3135382e38392e37, 'kkward', '2017-11-08 13:56:31'),
(91, 1, NULL, 0x3136322e3135382e39312e313739, 'owner@magmacc.com', '2017-11-08 17:40:58'),
(92, 7, NULL, 0x3136322e3135382e39312e313739, 'kkward', '2017-11-08 17:50:38'),
(93, 1, NULL, 0x3136322e3135382e39312e313739, 'owner@magmacc.com', '2017-11-08 18:53:26'),
(94, 1, NULL, 0x3136322e3135382e39322e313036, 'owner@magmacc.com', '2017-11-09 05:28:46'),
(95, 6, NULL, 0x3136322e3135382e39322e313036, 'wh@gmail.com', '2017-11-09 05:28:59'),
(96, 7, NULL, 0x3136322e3135382e39322e313036, 'kkward', '2017-11-09 05:30:54'),
(97, 1, NULL, 0x3136322e3135382e38392e323431, 'owner@magmacc.com', '2017-11-09 11:20:40'),
(98, 1, NULL, 0x3136322e3135382e38392e37, 'owner@magmacc.com', '2017-11-13 14:01:30'),
(99, 1, NULL, 0x3136322e3135382e38392e37, 'owner@magmacc.com', '2017-11-13 15:48:14'),
(100, 2, NULL, 0x3136322e3135382e38392e37, 'admin@magmacc.com', '2017-11-15 05:10:35'),
(101, 2, NULL, 0x3136322e3135382e39312e3239, 'admin@magmacc.com', '2017-12-26 09:18:17'),
(102, 1, NULL, 0x3136322e3135382e39312e3239, 'owner@magmacc.com', '2017-12-26 09:22:58'),
(103, 2, NULL, 0x3136322e3135382e39312e3239, 'admin@magmacc.com', '2017-12-26 11:40:11'),
(104, 1, NULL, 0x3136322e3135382e39312e3239, 'owner@magmacc.com', '2017-12-26 11:40:28'),
(105, 2, NULL, 0x3136322e3135382e39312e3239, 'admin@magmacc.com', '2018-01-01 12:41:19'),
(106, 1, NULL, 0x3136322e3135382e39312e3239, 'owner@magmacc.com', '2018-01-02 07:55:18'),
(107, 1, NULL, 0x3136322e3135382e39312e3239, 'owner@magmacc.com', '2018-01-02 11:15:04'),
(108, 2, NULL, 0x3134312e3130312e38382e323236, 'admin@magmacc.com', '2018-01-05 07:15:45'),
(109, 2, NULL, 0x34352e3131362e3233322e3135, 'admin@magmacc.com', '2018-01-09 06:13:29'),
(110, 2, NULL, 0x34352e3234392e31312e313836, 'admin@magmacc.com', '2018-01-09 09:15:34'),
(111, 2, NULL, 0x3130332e3233362e3133352e3538, 'admin@magmacc.com', '2018-01-10 05:42:37'),
(112, 1, NULL, 0x3130332e3233362e3133352e3538, 'owner@magmacc.com', '2018-01-11 07:54:24'),
(113, 1, NULL, 0x34352e3234392e31312e313836, 'owner@magmacc.com', '2018-01-11 08:02:10'),
(114, 1, NULL, 0x3130332e3233362e3133352e3538, 'owner@magmacc.com', '2018-01-11 11:48:52'),
(115, 1, NULL, 0x34352e3131362e3233332e3233, 'owner@magmacc.com', '2018-01-13 09:33:15'),
(116, 1, NULL, 0x3130332e3233362e3133352e3538, 'owner@magmacc.com', '2018-01-16 08:34:19'),
(117, 1, NULL, 0x3130332e3233362e3133352e3538, 'owner@magmacc.com', '2018-01-19 12:11:35'),
(118, 1, NULL, 0x3131302e33372e3232302e313036, 'owner@magmacc.com', '2018-01-19 14:27:33'),
(119, 1, NULL, 0x3130332e3233362e3133352e3538, 'owner@magmacc.com', '2018-01-22 05:46:55'),
(120, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2018-02-02 07:51:20'),
(121, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2018-03-05 11:05:04'),
(122, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2018-03-12 06:28:55'),
(123, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 06:06:39'),
(124, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 06:06:39'),
(125, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 06:06:40'),
(126, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 06:06:42'),
(127, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 06:06:42'),
(128, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 06:07:45'),
(129, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 06:07:46'),
(130, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 06:08:21'),
(131, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 06:08:26'),
(132, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 06:08:36'),
(133, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 06:08:36'),
(134, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 06:08:37'),
(135, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 06:08:37'),
(136, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 06:08:44'),
(137, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 06:08:45'),
(138, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 06:08:46'),
(139, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 06:08:48'),
(140, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 06:08:49'),
(141, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 06:08:50'),
(142, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 06:08:50'),
(143, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 06:09:12'),
(144, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 06:09:17'),
(145, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 06:09:20'),
(146, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 06:09:23'),
(147, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 06:09:26'),
(148, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 06:09:30'),
(149, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 06:09:33'),
(150, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 06:09:36'),
(151, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 06:09:57'),
(152, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 06:10:06'),
(153, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 06:10:07'),
(154, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 06:10:07'),
(155, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 06:10:11'),
(156, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 06:10:12'),
(157, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 06:10:12'),
(158, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 06:10:19'),
(159, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 06:10:19'),
(160, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 06:13:55'),
(161, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 06:13:55'),
(162, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 06:14:10'),
(163, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 06:14:10'),
(164, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 06:14:11'),
(165, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 06:14:14'),
(166, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 06:14:15'),
(167, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 06:14:46'),
(168, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 06:14:46'),
(169, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 06:14:47'),
(170, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 06:14:47'),
(171, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 06:14:54'),
(172, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 06:14:57'),
(173, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 06:14:58'),
(174, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 06:14:58'),
(175, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 06:15:02'),
(176, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 06:15:02'),
(177, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 06:15:17'),
(178, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 06:15:17'),
(179, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 06:15:18'),
(180, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 06:15:18'),
(181, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 06:15:28'),
(182, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 06:15:29'),
(183, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 06:15:39'),
(184, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 06:15:40'),
(185, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 06:15:57'),
(186, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 06:16:03'),
(187, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 06:16:03'),
(188, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 06:16:04'),
(189, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 06:16:04'),
(190, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 06:22:31'),
(191, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 06:22:31'),
(192, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 06:22:31'),
(193, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 07:42:53'),
(194, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 07:42:56'),
(195, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 07:43:19'),
(196, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 07:43:37'),
(197, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 07:43:49'),
(198, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 07:43:51'),
(199, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 07:43:52'),
(200, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 07:43:53'),
(201, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 07:43:53'),
(202, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 07:43:55'),
(203, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 07:43:56'),
(204, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 07:43:59'),
(205, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 07:44:00'),
(206, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 07:44:01'),
(207, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 07:44:06'),
(208, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 07:46:05'),
(209, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 07:46:05'),
(210, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 07:46:24'),
(211, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 07:46:25'),
(212, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 07:46:25'),
(213, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 07:46:27'),
(214, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 07:46:27'),
(215, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 07:47:07'),
(216, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 07:47:16'),
(217, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 07:47:17'),
(218, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 07:47:17'),
(219, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 07:47:17'),
(220, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 07:49:16'),
(221, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 07:49:17'),
(222, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 07:49:28'),
(223, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 07:49:31'),
(224, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 07:49:34'),
(225, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 07:49:34'),
(226, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 07:53:01'),
(227, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 07:53:02'),
(228, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 07:53:04'),
(229, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 07:53:05'),
(230, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 08:14:02'),
(231, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 08:14:04'),
(232, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 08:14:06'),
(233, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 08:14:07'),
(234, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 08:14:33'),
(235, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 08:14:37'),
(236, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 08:14:38'),
(237, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 08:15:18'),
(238, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 08:15:18'),
(239, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 08:16:09'),
(240, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 08:16:28'),
(241, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 08:16:33'),
(242, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 08:42:15'),
(243, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 08:43:22'),
(244, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 08:46:06'),
(245, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 08:49:46'),
(246, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 08:50:04'),
(247, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 08:50:04'),
(248, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 08:50:05'),
(249, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 08:50:07'),
(250, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 08:50:36'),
(251, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 08:51:01'),
(252, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 08:51:48'),
(253, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 08:51:49'),
(254, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 08:51:49'),
(255, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 08:51:58'),
(256, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 08:51:58'),
(257, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 08:51:58'),
(258, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 08:52:18'),
(259, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 08:52:19'),
(260, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 08:52:19'),
(261, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 08:52:21'),
(262, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 08:52:21'),
(263, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 08:52:36'),
(264, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 08:52:39'),
(265, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 08:52:39'),
(266, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 08:52:40'),
(267, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 08:52:40'),
(268, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 08:54:05'),
(269, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 08:54:07'),
(270, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 08:54:07'),
(271, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 08:54:07'),
(272, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 08:54:07'),
(273, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 08:54:07'),
(274, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 08:54:07'),
(275, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 08:54:07'),
(276, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 08:54:21'),
(277, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 08:54:31'),
(278, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 08:54:47'),
(279, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 08:54:47'),
(280, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 08:54:48'),
(281, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 08:55:00'),
(282, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 08:55:00'),
(283, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 08:55:00'),
(284, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 08:55:34'),
(285, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 08:55:34'),
(286, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 08:55:59'),
(287, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 08:55:59'),
(288, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 08:55:59'),
(289, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 08:56:02'),
(290, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 09:40:20'),
(291, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 09:40:22'),
(292, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 09:40:22'),
(293, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 09:40:24'),
(294, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 09:40:25'),
(295, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 09:40:25'),
(296, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 09:41:57'),
(297, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 09:42:01'),
(298, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 09:42:01'),
(299, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 09:42:01'),
(300, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 09:42:05'),
(301, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 09:42:08'),
(302, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 09:42:11'),
(303, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 09:42:11'),
(304, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 09:42:13'),
(305, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 09:42:15'),
(306, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 09:42:17'),
(307, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 09:42:20'),
(308, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 09:42:23'),
(309, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 09:42:32'),
(310, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 09:42:34'),
(311, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 09:42:36'),
(312, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 09:42:38'),
(313, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 09:42:39'),
(314, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 09:42:42'),
(315, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 09:42:50'),
(316, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 09:42:54'),
(317, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 09:42:59'),
(318, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:08:26'),
(319, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:08:27'),
(320, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:08:27'),
(321, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:08:39'),
(322, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:08:46'),
(323, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:08:46'),
(324, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:08:46'),
(325, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:08:48'),
(326, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:09:09'),
(327, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:09:09'),
(328, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:09:09'),
(329, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:09:11'),
(330, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:09:26'),
(331, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:09:26'),
(332, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:09:26'),
(333, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:09:27'),
(334, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:09:28'),
(335, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:09:28'),
(336, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:09:29'),
(337, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:10:21'),
(338, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:10:34'),
(339, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:10:40'),
(340, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:10:55'),
(341, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:10:55'),
(342, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:10:55'),
(343, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:11:05'),
(344, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:11:06'),
(345, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:11:06'),
(346, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:11:08'),
(347, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:13:58'),
(348, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:13:58'),
(349, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:13:58'),
(350, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:14:00'),
(351, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:14:03'),
(352, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:14:06'),
(353, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:14:21'),
(354, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:14:22'),
(355, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:16:29'),
(356, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:16:29'),
(357, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:16:30'),
(358, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:16:33'),
(359, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:17:35'),
(360, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:17:35'),
(361, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:17:35'),
(362, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:17:52'),
(363, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:18:08'),
(364, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:18:08'),
(365, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:18:08'),
(366, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:18:16'),
(367, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:18:25'),
(368, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:18:25'),
(369, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:18:25'),
(370, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:18:28'),
(371, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:18:53'),
(372, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:18:54'),
(373, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:18:54'),
(374, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:19:02'),
(375, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:19:22'),
(376, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:31:03'),
(377, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:53:23'),
(378, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:53:23'),
(379, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:53:24'),
(380, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:53:26'),
(381, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:55:05'),
(382, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:55:48'),
(383, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:55:55'),
(384, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:55:57'),
(385, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:55:58'),
(386, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:55:58'),
(387, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:56:00'),
(388, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:56:01'),
(389, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:56:01'),
(390, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:56:16'),
(391, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 10:57:08'),
(392, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 11:00:29'),
(393, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 11:00:30'),
(394, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 11:00:30'),
(395, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 11:00:31'),
(396, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 11:00:41'),
(397, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 11:00:43'),
(398, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 11:01:56'),
(399, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 11:02:56'),
(400, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 11:02:56'),
(401, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 11:02:56'),
(402, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 11:02:57'),
(403, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 11:07:40'),
(404, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 11:10:08'),
(405, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 11:10:08'),
(406, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 11:10:09'),
(407, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 11:10:10'),
(408, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 11:10:11'),
(409, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 11:10:11'),
(410, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 11:10:14'),
(411, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 11:10:14'),
(412, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 11:10:14'),
(413, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 11:10:16'),
(414, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 11:10:49'),
(415, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 11:12:12'),
(416, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 11:12:43'),
(417, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 11:13:38'),
(418, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 11:14:26'),
(419, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 11:15:09'),
(420, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 11:16:09'),
(421, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 11:16:55'),
(422, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 11:17:23'),
(423, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 11:20:42'),
(424, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 11:21:20'),
(425, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 11:21:57'),
(426, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 11:21:58'),
(427, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 11:21:58'),
(428, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 11:21:59'),
(429, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 11:22:00'),
(430, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 11:22:00'),
(431, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 11:22:02'),
(432, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 11:22:48'),
(433, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 11:22:48'),
(434, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 11:22:49'),
(435, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 11:22:49'),
(436, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 11:24:12'),
(437, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-28 11:24:12'),
(438, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 05:25:27'),
(439, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 05:25:27'),
(440, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 05:25:27'),
(441, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 05:25:29'),
(442, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 05:25:32'),
(443, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 05:25:38'),
(444, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 05:25:39'),
(445, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 05:25:39'),
(446, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 05:25:41'),
(447, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 05:29:16'),
(448, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 05:32:08'),
(449, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 05:33:51'),
(450, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 05:33:51'),
(451, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 05:33:51'),
(452, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 05:33:53'),
(453, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 05:34:33'),
(454, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 05:34:34'),
(455, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 05:34:34'),
(456, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 05:34:36'),
(457, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 05:43:16'),
(458, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 05:43:17'),
(459, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 05:43:17'),
(460, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 05:43:30'),
(461, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 05:45:07'),
(462, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 05:45:08'),
(463, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 05:45:08'),
(464, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 05:45:09'),
(465, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 05:45:18'),
(466, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 05:45:18'),
(467, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 05:45:18'),
(468, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 05:45:20'),
(469, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 05:52:46'),
(470, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 05:52:47'),
(471, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 05:52:47'),
(472, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 05:52:49'),
(473, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 09:20:37'),
(474, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 09:20:38'),
(475, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 09:20:38'),
(476, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 09:20:40'),
(477, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 09:21:38'),
(478, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 09:22:13'),
(479, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 09:22:14'),
(480, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 09:22:14'),
(481, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 09:22:16'),
(482, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 09:24:39'),
(483, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 09:24:39'),
(484, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 09:24:39'),
(485, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 09:25:01'),
(486, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 09:25:02'),
(487, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 09:25:02'),
(488, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 09:25:10'),
(489, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 09:25:10'),
(490, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 09:25:10'),
(491, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 09:25:13'),
(492, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 09:25:14'),
(493, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 09:25:16'),
(494, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 09:25:16'),
(495, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 09:28:06'),
(496, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 09:28:06'),
(497, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 09:28:06'),
(498, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 09:28:17'),
(499, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 09:28:18'),
(500, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 09:28:45'),
(501, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 09:28:45'),
(502, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 09:28:45'),
(503, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 09:28:47'),
(504, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 09:28:47'),
(505, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 09:29:05'),
(506, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 09:29:05'),
(507, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 09:29:05'),
(508, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 09:29:08'),
(509, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 09:29:08'),
(510, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 09:29:08'),
(511, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 09:29:12'),
(512, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 09:29:34'),
(513, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 09:29:34'),
(514, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 09:29:34'),
(515, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 09:29:37'),
(516, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 09:29:38'),
(517, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 09:29:59'),
(518, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 09:30:06'),
(519, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 09:30:15'),
(520, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 09:30:15'),
(521, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 09:30:15'),
(522, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 09:30:15'),
(523, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 10:42:30'),
(524, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 10:42:31'),
(525, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 10:42:33'),
(526, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 10:42:34'),
(527, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 10:42:34'),
(528, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 10:42:38'),
(529, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 10:42:39'),
(530, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 10:42:46'),
(531, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 10:42:57'),
(532, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 10:42:57'),
(533, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 10:43:02'),
(534, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 10:43:02'),
(535, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 10:43:05'),
(536, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 10:43:05'),
(537, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 10:44:23'),
(538, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 10:44:23'),
(539, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 10:44:23'),
(540, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 10:44:35'),
(541, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 10:44:36'),
(542, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 10:44:41'),
(543, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 10:44:41'),
(544, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 10:44:42'),
(545, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 10:44:47'),
(546, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 10:49:44'),
(547, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 10:49:44'),
(548, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 10:49:44'),
(549, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 10:49:54'),
(550, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 10:49:55'),
(551, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 10:49:55'),
(552, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 10:50:39'),
(553, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 10:50:42'),
(554, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 10:52:08'),
(555, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 10:52:08'),
(556, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 10:52:08'),
(557, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 10:52:08'),
(558, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 10:52:13'),
(559, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 10:52:13'),
(560, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 10:52:14'),
(561, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 10:52:19'),
(562, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 10:52:25'),
(563, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 10:52:25'),
(564, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 10:52:26'),
(565, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 10:52:28'),
(566, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 10:57:52'),
(567, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 10:58:11'),
(568, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 10:59:29'),
(569, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 10:59:30'),
(570, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 10:59:30'),
(571, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 10:59:32'),
(572, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 10:59:37'),
(573, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 10:59:43'),
(574, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 11:00:00'),
(575, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 11:00:01'),
(576, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 11:00:03'),
(577, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 11:00:05'),
(578, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 11:00:07'),
(579, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 11:00:08'),
(580, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 11:00:10'),
(581, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 11:00:11'),
(582, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 11:07:02'),
(583, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 11:07:02'),
(584, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 11:07:02'),
(585, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 11:07:16'),
(586, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 11:07:20'),
(587, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 11:07:21'),
(588, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 11:08:00'),
(589, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 11:08:00'),
(590, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 11:08:02'),
(591, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 11:08:03'),
(592, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-29 11:08:24'),
(593, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 05:04:08'),
(594, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 05:04:09'),
(595, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 05:04:10'),
(596, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 05:09:36'),
(597, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 05:09:37'),
(598, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 05:09:38'),
(599, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 05:10:04'),
(600, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 05:10:05'),
(601, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 05:10:05'),
(602, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 05:10:59'),
(603, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 05:11:00'),
(604, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 05:11:00'),
(605, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 05:12:55'),
(606, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 05:12:56'),
(607, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 05:12:56'),
(608, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 05:13:21'),
(609, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 05:13:21'),
(610, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 05:13:28'),
(611, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 05:13:29'),
(612, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 05:13:30'),
(613, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 05:13:31'),
(614, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 05:13:31'),
(615, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 05:13:32'),
(616, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 05:13:32'),
(617, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 05:13:33'),
(618, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 05:13:33'),
(619, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 05:13:35'),
(620, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 05:13:35'),
(621, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 05:14:22'),
(622, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 05:14:23'),
(623, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 05:14:23'),
(624, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 05:21:20'),
(625, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 05:21:42'),
(626, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 05:21:43'),
(627, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 05:21:50'),
(628, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 05:21:51'),
(629, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 05:21:51'),
(630, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 05:21:56'),
(631, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 05:21:56'),
(632, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 05:21:56'),
(633, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 05:22:01'),
(634, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 05:22:01'),
(635, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 05:22:01'),
(636, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 05:22:12'),
(637, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 05:22:12'),
(638, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 05:22:12'),
(639, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 05:22:45'),
(640, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 05:22:46'),
(641, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 05:22:46'),
(642, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 05:22:51'),
(643, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 05:22:52'),
(644, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 05:22:55'),
(645, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 05:22:55'),
(646, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 05:23:03'),
(647, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 05:23:04'),
(648, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 05:23:04'),
(649, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 05:23:08'),
(650, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 05:23:09'),
(651, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 05:23:09'),
(652, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 05:37:01'),
(653, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 05:37:01'),
(654, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 05:37:38'),
(655, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 06:10:21'),
(656, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 06:10:21'),
(657, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 06:10:21'),
(658, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 06:10:24'),
(659, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 06:10:25'),
(660, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 06:10:33'),
(661, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 06:10:33'),
(662, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 06:10:33'),
(663, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 06:10:42'),
(664, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 06:10:44'),
(665, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 06:10:50'),
(666, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 06:11:03'),
(667, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 06:11:03'),
(668, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 06:11:03'),
(669, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 06:11:11'),
(670, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 06:11:12'),
(671, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 06:11:12'),
(672, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 06:11:23'),
(673, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 06:11:23'),
(674, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 06:11:23'),
(675, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 06:11:27'),
(676, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 06:11:27'),
(677, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 06:11:27'),
(678, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 06:11:49'),
(679, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 06:11:49'),
(680, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 06:11:49'),
(681, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 06:12:07'),
(682, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 06:12:07'),
(683, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 06:14:27'),
(684, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 06:14:33'),
(685, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 06:14:39'),
(686, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 06:14:40'),
(687, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 06:14:40'),
(688, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 06:14:40'),
(689, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 06:14:40'),
(690, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 06:24:11'),
(691, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 06:24:11'),
(692, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 06:24:27'),
(693, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 06:26:38'),
(694, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 06:26:38'),
(695, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 06:27:03'),
(696, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 06:27:04'),
(697, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 06:27:04'),
(698, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 06:27:08'),
(699, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 07:00:13'),
(700, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 07:00:14'),
(701, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 07:00:24'),
(702, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 07:00:25');
INSERT INTO `sma_user_logins` (`id`, `user_id`, `company_id`, `ip_address`, `login`, `time`) VALUES
(703, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 07:00:25'),
(704, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 07:00:29'),
(705, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 07:00:30'),
(706, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 07:00:31'),
(707, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 07:00:32'),
(708, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 07:00:44'),
(709, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 07:00:45'),
(710, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-03-30 07:00:45'),
(711, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 04:49:04'),
(712, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 04:49:06'),
(713, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 04:49:12'),
(714, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 04:49:13'),
(715, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 04:49:13'),
(716, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 04:49:21'),
(717, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 04:49:22'),
(718, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 04:49:22'),
(719, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 04:50:05'),
(720, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 04:50:05'),
(721, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 04:50:05'),
(722, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 04:50:10'),
(723, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 04:50:13'),
(724, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 04:50:14'),
(725, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 04:50:59'),
(726, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 04:51:02'),
(727, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 04:51:27'),
(728, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 04:51:28'),
(729, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 04:51:28'),
(730, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 04:51:31'),
(731, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:01:43'),
(732, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:01:44'),
(733, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:01:45'),
(734, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:01:48'),
(735, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:01:51'),
(736, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:01:55'),
(737, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:01:56'),
(738, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:01:57'),
(739, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:01:59'),
(740, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:02:01'),
(741, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:02:02'),
(742, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:02:03'),
(743, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:02:05'),
(744, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:07:01'),
(745, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:07:02'),
(746, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:07:02'),
(747, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:07:08'),
(748, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:07:08'),
(749, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:07:09'),
(750, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:09:11'),
(751, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:09:11'),
(752, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:09:11'),
(753, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:09:22'),
(754, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:09:22'),
(755, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:09:22'),
(756, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:09:24'),
(757, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:09:51'),
(758, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:09:51'),
(759, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:09:51'),
(760, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:09:54'),
(761, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:10:04'),
(762, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:10:20'),
(763, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:10:42'),
(764, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:10:46'),
(765, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:10:46'),
(766, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:11:08'),
(767, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:11:33'),
(768, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:11:37'),
(769, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:11:39'),
(770, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:11:53'),
(771, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:12:32'),
(772, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:12:35'),
(773, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:12:35'),
(774, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:12:36'),
(775, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:12:49'),
(776, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:12:50'),
(777, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:12:51'),
(778, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:13:10'),
(779, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:13:13'),
(780, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:13:14'),
(781, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:13:16'),
(782, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:13:16'),
(783, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:13:18'),
(784, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:13:47'),
(785, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:13:51'),
(786, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:13:56'),
(787, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:13:58'),
(788, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:14:00'),
(789, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:14:00'),
(790, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:14:02'),
(791, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:14:02'),
(792, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:14:38'),
(793, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:14:56'),
(794, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:17:45'),
(795, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:18:36'),
(796, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:18:41'),
(797, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:18:48'),
(798, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:18:48'),
(799, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:18:48'),
(800, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:58:57'),
(801, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:58:59'),
(802, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:59:05'),
(803, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:59:51'),
(804, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:59:51'),
(805, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:59:51'),
(806, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:59:54'),
(807, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:59:55'),
(808, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:59:55'),
(809, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:59:58'),
(810, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:59:59'),
(811, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 05:59:59'),
(812, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:01:34'),
(813, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:02:04'),
(814, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:02:04'),
(815, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:02:05'),
(816, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:02:15'),
(817, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:02:21'),
(818, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:02:32'),
(819, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:02:32'),
(820, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:02:33'),
(821, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:02:40'),
(822, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:02:43'),
(823, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:02:48'),
(824, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:02:53'),
(825, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:03:13'),
(826, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:03:13'),
(827, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:03:13'),
(828, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:03:16'),
(829, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:03:27'),
(830, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:03:27'),
(831, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:03:27'),
(832, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:03:31'),
(833, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:03:31'),
(834, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:03:31'),
(835, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:03:34'),
(836, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:03:34'),
(837, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:03:34'),
(838, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:03:38'),
(839, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:03:38'),
(840, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:03:38'),
(841, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:03:43'),
(842, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:03:44'),
(843, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:03:44'),
(844, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:03:49'),
(845, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:03:50'),
(846, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:03:58'),
(847, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:03:58'),
(848, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:04:04'),
(849, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:04:04'),
(850, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:04:07'),
(851, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:04:07'),
(852, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:04:13'),
(853, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:04:14'),
(854, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:04:15'),
(855, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:04:25'),
(856, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:04:26'),
(857, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:04:27'),
(858, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:04:30'),
(859, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:04:30'),
(860, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:04:33'),
(861, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:04:33'),
(862, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:05:18'),
(863, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:07:59'),
(864, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:07:59'),
(865, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:07:59'),
(866, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:08:00'),
(867, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:09:12'),
(868, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:09:12'),
(869, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:09:17'),
(870, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:09:17'),
(871, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:09:17'),
(872, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:09:21'),
(873, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:09:21'),
(874, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:09:21'),
(875, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:09:23'),
(876, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:09:23'),
(877, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:09:23'),
(878, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:09:25'),
(879, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:10:02'),
(880, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:10:02'),
(881, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:10:02'),
(882, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:10:19'),
(883, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:10:19'),
(884, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:10:19'),
(885, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:10:24'),
(886, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:10:24'),
(887, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 06:10:25'),
(888, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 07:15:39'),
(889, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 07:15:39'),
(890, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 07:15:47'),
(891, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 07:15:47'),
(892, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 07:15:47'),
(893, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 07:15:59'),
(894, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 07:16:00'),
(895, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 07:16:00'),
(896, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 07:16:10'),
(897, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 07:16:10'),
(898, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 07:16:13'),
(899, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 07:16:16'),
(900, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 07:16:16'),
(901, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 07:16:18'),
(902, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 07:16:23'),
(903, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 07:16:23'),
(904, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 07:16:25'),
(905, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 07:16:25'),
(906, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 07:16:32'),
(907, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 07:16:32'),
(908, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 07:16:33'),
(909, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 07:16:38'),
(910, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 07:17:05'),
(911, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 07:17:06'),
(912, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 07:28:15'),
(913, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 07:28:17'),
(914, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 07:28:17'),
(915, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 07:28:27'),
(916, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 07:31:45'),
(917, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 07:31:45'),
(918, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 07:32:41'),
(919, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 07:33:05'),
(920, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 07:33:08'),
(921, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 07:33:13'),
(922, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 07:33:16'),
(923, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 07:33:28'),
(924, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 07:33:31'),
(925, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 07:33:32'),
(926, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 07:33:32'),
(927, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 07:46:48'),
(928, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 07:46:55'),
(929, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 07:46:55'),
(930, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 07:47:03'),
(931, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 07:47:04'),
(932, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 07:47:05'),
(933, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 07:47:05'),
(934, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 07:47:15'),
(935, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 07:47:18'),
(936, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 07:47:21'),
(937, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 07:49:00'),
(938, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 07:49:00'),
(939, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 07:49:16'),
(940, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 07:49:16'),
(941, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 07:49:16'),
(942, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 07:49:23'),
(943, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 07:49:23'),
(944, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 07:49:23'),
(945, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 07:49:45'),
(946, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 07:49:45'),
(947, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 07:50:21'),
(948, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 07:50:23'),
(949, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 07:50:23'),
(950, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 08:14:56'),
(951, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 08:14:57'),
(952, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 08:46:15'),
(953, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 08:46:25'),
(954, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 08:46:26'),
(955, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 08:46:26'),
(956, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 08:50:11'),
(957, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 08:50:12'),
(958, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 08:50:12'),
(959, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 08:50:18'),
(960, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 08:50:40'),
(961, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 08:50:45'),
(962, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 08:51:00'),
(963, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 08:51:01'),
(964, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 08:51:01'),
(965, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 08:51:03'),
(966, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 08:51:03'),
(967, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 08:51:03'),
(968, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 08:51:11'),
(969, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 08:51:14'),
(970, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 11:28:39'),
(971, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 11:28:40'),
(972, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 11:28:51'),
(973, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-02 11:28:51'),
(974, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-04 07:00:08'),
(975, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-04 07:00:10'),
(976, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-04 07:00:16'),
(977, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-04 07:00:16'),
(978, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-04 07:00:37'),
(979, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-04 07:00:37'),
(980, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-04 07:01:15'),
(981, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-04 07:01:20'),
(982, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-04 07:01:20'),
(983, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-04 07:01:20'),
(984, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-04 07:01:21'),
(985, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-04 07:02:16'),
(986, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-04 07:08:49'),
(987, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-04 07:08:49'),
(988, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-04 07:08:49'),
(989, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-04 07:08:49'),
(990, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-04 07:08:56'),
(991, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-04 07:08:57'),
(992, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-04 07:08:57'),
(993, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-04 07:09:03'),
(994, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-04 07:09:04'),
(995, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-04 07:10:02'),
(996, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-04 07:10:02'),
(997, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-04 07:10:02'),
(998, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-04 07:10:06'),
(999, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-04 07:10:06'),
(1000, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-04 07:10:06'),
(1001, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-04 07:10:08'),
(1002, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-04 07:10:08'),
(1003, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-04 07:10:13'),
(1004, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-04 07:10:20'),
(1005, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-04 07:10:24'),
(1006, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-04 07:10:25'),
(1007, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-04 07:10:26'),
(1008, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-04 07:11:12'),
(1009, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-04 07:11:12'),
(1010, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-04 07:11:12'),
(1011, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-04 07:11:12'),
(1012, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-04 07:11:21'),
(1013, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-04 07:11:30'),
(1014, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-04 07:11:30'),
(1015, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-04 07:11:30'),
(1016, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-04 07:11:33'),
(1017, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-04 07:11:33'),
(1018, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-04 07:11:42'),
(1019, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-04 07:11:42'),
(1020, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-04 07:12:24'),
(1021, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-04 07:12:24'),
(1022, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-04 07:12:24'),
(1023, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-04 07:12:28'),
(1024, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-04 07:12:29'),
(1025, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-04 07:12:29'),
(1026, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-04 07:13:56'),
(1027, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-04 07:13:57'),
(1028, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-04 07:13:57'),
(1029, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-04 07:13:59'),
(1030, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-04 08:26:06'),
(1031, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-04 08:26:09'),
(1032, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-04 08:26:09'),
(1033, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-04 08:26:10'),
(1034, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-04 08:26:17'),
(1035, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-04 08:26:17'),
(1036, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-04 08:26:18'),
(1037, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-04 08:26:18'),
(1038, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-04 08:26:23'),
(1039, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-04 08:26:28'),
(1040, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-04 08:27:09'),
(1041, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-04 08:27:09'),
(1042, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-04 08:27:09'),
(1043, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-04 14:15:07'),
(1044, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-04 14:15:11'),
(1045, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-04 14:15:11'),
(1046, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-05 05:14:21'),
(1047, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-05 05:14:24'),
(1048, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-05 05:14:36'),
(1049, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-05 05:14:37'),
(1050, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-05 05:14:37'),
(1051, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-05 05:15:33'),
(1052, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-05 05:15:34'),
(1053, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-05 05:15:34'),
(1054, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-05 05:15:34'),
(1055, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-05 05:15:43'),
(1056, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-05 05:15:53'),
(1057, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-05 05:15:53'),
(1058, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-05 05:15:53'),
(1059, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-05 05:15:57'),
(1060, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-05 05:15:57'),
(1061, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-05 05:16:42'),
(1062, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-05 05:16:42'),
(1063, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-05 05:16:43'),
(1064, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-05 05:17:14'),
(1065, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-05 05:17:37'),
(1066, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-05 05:17:37'),
(1067, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-05 05:18:01'),
(1068, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-05 05:18:01'),
(1069, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-05 05:18:01'),
(1070, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-05 05:18:04'),
(1071, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-05 05:18:05'),
(1072, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-05 05:18:05'),
(1073, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-23 06:14:15'),
(1074, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-23 10:43:31'),
(1075, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-23 10:43:36'),
(1076, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-24 07:03:14'),
(1077, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-24 07:03:16'),
(1078, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-24 07:03:23'),
(1079, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-24 07:03:25'),
(1080, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-24 07:03:26'),
(1081, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-24 07:04:11'),
(1082, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-24 07:04:13'),
(1083, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-24 07:04:13'),
(1084, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-24 07:04:24'),
(1085, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-24 07:04:24'),
(1086, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-24 07:04:31'),
(1087, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-24 07:04:32'),
(1088, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-24 07:04:33'),
(1089, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-24 07:04:35'),
(1090, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-24 07:04:35'),
(1091, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-24 07:04:35'),
(1092, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-24 07:04:40'),
(1093, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-24 07:04:40'),
(1094, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-24 07:04:40'),
(1095, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-24 07:04:43'),
(1096, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-24 07:04:44'),
(1097, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-24 07:04:44'),
(1098, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-24 09:13:12'),
(1099, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-24 09:13:13'),
(1100, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-24 09:13:14'),
(1101, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-24 09:13:15'),
(1102, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-29 10:52:29'),
(1103, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-29 10:52:34'),
(1104, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-29 13:23:57'),
(1105, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-29 13:23:58'),
(1106, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-30 11:36:14'),
(1107, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-30 11:36:16'),
(1108, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-30 11:36:32'),
(1109, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-30 11:36:32'),
(1110, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-30 11:36:33'),
(1111, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-30 11:36:38'),
(1112, 1, NULL, 0x3a3a31, 'owner@magmacc.com', '2019-04-30 11:36:39');

-- --------------------------------------------------------

--
-- Table structure for table `sma_variants`
--

CREATE TABLE `sma_variants` (
  `id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_warehouses`
--

CREATE TABLE `sma_warehouses` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `map` varchar(255) DEFAULT NULL,
  `phone` varchar(55) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `parent_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_warehouses`
--

INSERT INTO `sma_warehouses` (`id`, `code`, `name`, `address`, `map`, `phone`, `email`, `parent_id`) VALUES
(1, 'WHI', 'CSMD Warehouse 0001', '<p>Address, City</p>', NULL, '0129703973', 'admin@csmdsoft.com', 0),
(2, 'WHII', 'Warehouse 2', '<p>Warehouse 2, Jalan Sultan Ismail, 54000, Kuala Lumpur</p>', NULL, '0105292122', 'whii@tecdiary.com', 0),
(3, 'LRBT-1', 'Kalakalay', '<p xss=removed>Kalakalay</p>', NULL, '', '', 0),
(4, 'LRBT-2', 'Akora Khatak ', '<p>Akora Khatak</p>', NULL, '', '', 0),
(5, 'LRBT-3', 'Shahpur Saddar', '<p>Shahpur Saddar</p>', NULL, '', '', 0),
(6, 'LRBT-4', 'Lar Multan', '<p>Lar Multan</p>', NULL, '', '', 0),
(7, 'LRBT-5', 'Quetta  ', '<p>Quetta</p>', NULL, '', '', 0),
(8, 'LRBT-6', 'Sibi', '<p>Sibi</p>', NULL, '', '', 0),
(9, 'LRBT-7', 'Tando Bago', '<p>Tando Bago</p>', NULL, '', '', 0),
(10, 'LRBT-8', 'Gambat', '<p>Gambat</p>', NULL, '', '', 0),
(11, 'LRBT-9', 'Pasrur', '<p>Pasrur</p>', NULL, '', '', 0),
(12, 'LRBT-10', 'Pasrur', '<p>Pasrur</p>', NULL, '', '', 0),
(13, 'LRBT-11', 'Rashidabad', '<p>Rashidabad</p>', NULL, '', '', 0),
(14, 'LRBT-12', 'Arifwala ', '<p>Arifwala</p>', NULL, '', '', 0),
(15, 'LRBT-13', 'Odigram', '<p>Odigram</p>', NULL, '', '', 0),
(16, 'LRBT-14', 'Mandra', '<p>Mandra</p>', NULL, '', '', 0),
(17, 'LRBT-15', 'Mansehra', '<p>Mansehra</p>', NULL, '', '', 0),
(18, 'LRBT-16', 'Khanewal', '<p>Khanewal</p>', NULL, '', '', 0),
(19, 'LRBT-17', 'North Karachi', '<p>North Karachi</p>', NULL, '', '', 0),
(20, 'LRBT-18', 'Chiniot', '<p>Chiniot</p>', NULL, '', '', 0),
(21, 'LRBT-19', 'Lahore (Multan Road)', '<p>Lahore (Multan Road)</p>', NULL, '', '', 0),
(22, 'test', 'test', '<p xss=removed>test</p>', NULL, '123123', 'test@test.com', 1),
(23, 'GW-123', 'General Ward', '<p xss=removed>arachipakistab</p>', NULL, '009090900', 'gward@gmail.com', 3),
(24, 'OT-321', 'Operation Theater', '<p>karachi, pakistan</p>', NULL, '098776726', 'ot@gmail.com', 3);

-- --------------------------------------------------------

--
-- Table structure for table `sma_warehouses_products`
--

CREATE TABLE `sma_warehouses_products` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `rack` varchar(55) DEFAULT NULL,
  `avg_cost` decimal(25,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_warehouses_products`
--

INSERT INTO `sma_warehouses_products` (`id`, `product_id`, `warehouse_id`, `quantity`, `rack`, `avg_cost`) VALUES
(1, 1, 1, '310.0000', NULL, '3000.0000'),
(2, 1, 2, '100.0000', NULL, '0.0000'),
(3, 2, 1, '0.0000', NULL, '0.0000'),
(6, 6, 1, '995.0000', '10', '100.0000'),
(7, 6, 2, '0.0000', NULL, '0.0000'),
(8, 6, 3, '0.0000', NULL, '0.0000'),
(9, 6, 4, '0.0000', NULL, '0.0000'),
(10, 6, 5, '0.0000', NULL, '0.0000'),
(11, 6, 6, '0.0000', NULL, '0.0000'),
(12, 6, 7, '0.0000', NULL, '0.0000'),
(13, 6, 8, '0.0000', NULL, '0.0000'),
(14, 6, 9, '0.0000', NULL, '0.0000'),
(15, 6, 10, '0.0000', NULL, '0.0000'),
(16, 6, 11, '0.0000', NULL, '0.0000'),
(17, 6, 12, '0.0000', NULL, '0.0000'),
(18, 6, 13, '0.0000', NULL, '0.0000'),
(19, 6, 14, '0.0000', NULL, '0.0000'),
(20, 6, 15, '0.0000', NULL, '0.0000'),
(21, 6, 16, '0.0000', NULL, '0.0000'),
(22, 6, 17, '0.0000', NULL, '0.0000'),
(23, 6, 18, '0.0000', NULL, '0.0000'),
(24, 6, 19, '0.0000', NULL, '0.0000'),
(25, 6, 20, '0.0000', NULL, '0.0000'),
(26, 6, 21, '0.0000', NULL, '0.0000'),
(27, 6, 22, '0.0000', NULL, '0.0000'),
(28, 7, 1, '896.0000', '20', '10.0000'),
(29, 1, 3, '65.0000', NULL, '0.0000'),
(30, 1, 4, '0.0000', NULL, '0.0000'),
(31, 1, 5, '0.0000', NULL, '0.0000'),
(32, 1, 6, '0.0000', NULL, '0.0000'),
(33, 1, 7, '0.0000', NULL, '0.0000'),
(34, 1, 8, '0.0000', NULL, '0.0000'),
(35, 1, 9, '0.0000', NULL, '0.0000'),
(36, 1, 10, '0.0000', NULL, '0.0000'),
(37, 1, 11, '0.0000', NULL, '0.0000'),
(38, 1, 12, '0.0000', NULL, '0.0000'),
(39, 1, 13, '0.0000', NULL, '0.0000'),
(40, 1, 14, '0.0000', NULL, '0.0000'),
(41, 1, 15, '0.0000', NULL, '0.0000'),
(42, 1, 16, '0.0000', NULL, '0.0000'),
(43, 1, 17, '0.0000', NULL, '0.0000'),
(44, 1, 18, '0.0000', NULL, '0.0000'),
(45, 1, 19, '0.0000', NULL, '0.0000'),
(46, 1, 20, '0.0000', NULL, '0.0000'),
(47, 1, 21, '0.0000', NULL, '0.0000'),
(48, 1, 22, '25.0000', NULL, '0.0000'),
(49, 1, 23, '0.0000', NULL, '0.0000'),
(96, 7, 2, '0.0000', NULL, '0.0000'),
(97, 7, 3, '1.0000', NULL, '0.0000'),
(98, 7, 4, '0.0000', NULL, '0.0000'),
(99, 7, 5, '0.0000', NULL, '0.0000'),
(100, 7, 6, '0.0000', NULL, '0.0000'),
(101, 7, 7, '0.0000', NULL, '0.0000'),
(102, 7, 8, '0.0000', NULL, '0.0000'),
(103, 7, 9, '0.0000', NULL, '0.0000'),
(104, 7, 10, '0.0000', NULL, '0.0000'),
(105, 7, 11, '0.0000', NULL, '0.0000'),
(106, 7, 12, '0.0000', NULL, '0.0000'),
(107, 7, 13, '0.0000', NULL, '0.0000'),
(108, 7, 14, '0.0000', NULL, '0.0000'),
(109, 7, 15, '0.0000', NULL, '0.0000'),
(110, 7, 16, '0.0000', NULL, '0.0000'),
(111, 7, 17, '0.0000', NULL, '0.0000'),
(112, 7, 18, '0.0000', NULL, '0.0000'),
(113, 7, 19, '0.0000', NULL, '0.0000'),
(114, 7, 20, '0.0000', NULL, '0.0000'),
(115, 7, 21, '0.0000', NULL, '0.0000'),
(116, 7, 22, '0.0000', NULL, '0.0000'),
(117, 7, 23, '0.0000', NULL, '0.0000'),
(118, 2, 2, '0.0000', NULL, '0.0000'),
(119, 2, 3, '0.0000', NULL, '0.0000'),
(120, 2, 4, '0.0000', NULL, '0.0000'),
(121, 2, 5, '0.0000', NULL, '0.0000'),
(122, 2, 6, '0.0000', NULL, '0.0000'),
(123, 2, 7, '0.0000', NULL, '0.0000'),
(124, 2, 8, '0.0000', NULL, '0.0000'),
(125, 2, 9, '0.0000', NULL, '0.0000'),
(126, 2, 10, '0.0000', NULL, '0.0000'),
(127, 2, 11, '0.0000', NULL, '0.0000'),
(128, 2, 12, '0.0000', NULL, '0.0000'),
(129, 2, 13, '0.0000', NULL, '0.0000'),
(130, 2, 14, '0.0000', NULL, '0.0000'),
(131, 2, 15, '0.0000', NULL, '0.0000'),
(132, 2, 16, '0.0000', NULL, '0.0000'),
(133, 2, 17, '0.0000', NULL, '0.0000'),
(134, 2, 18, '0.0000', NULL, '0.0000'),
(135, 2, 19, '0.0000', NULL, '0.0000'),
(136, 2, 20, '0.0000', NULL, '0.0000'),
(137, 2, 21, '0.0000', NULL, '0.0000'),
(138, 2, 22, '0.0000', NULL, '0.0000'),
(139, 2, 23, '3.0000', NULL, '0.0000'),
(163, 6, 23, '0.0000', NULL, '0.0000'),
(164, 11, 1, '280.0000', NULL, '60.0000'),
(165, 11, 2, '0.0000', NULL, '0.0000'),
(166, 11, 3, '20.0000', NULL, '0.0000'),
(167, 11, 4, '0.0000', NULL, '0.0000'),
(168, 11, 5, '0.0000', NULL, '0.0000'),
(169, 11, 6, '0.0000', NULL, '0.0000'),
(170, 11, 7, '0.0000', NULL, '0.0000'),
(171, 11, 8, '0.0000', NULL, '0.0000'),
(172, 11, 9, '0.0000', NULL, '0.0000'),
(173, 11, 10, '0.0000', NULL, '0.0000'),
(174, 11, 11, '0.0000', NULL, '0.0000'),
(175, 11, 12, '0.0000', NULL, '0.0000'),
(176, 11, 13, '0.0000', NULL, '0.0000'),
(177, 11, 14, '0.0000', NULL, '0.0000'),
(178, 11, 15, '0.0000', NULL, '0.0000'),
(179, 11, 16, '0.0000', NULL, '0.0000'),
(180, 11, 17, '0.0000', NULL, '0.0000'),
(181, 11, 18, '0.0000', NULL, '0.0000'),
(182, 11, 19, '0.0000', NULL, '0.0000'),
(183, 11, 20, '0.0000', NULL, '0.0000'),
(184, 11, 21, '0.0000', NULL, '0.0000'),
(185, 11, 22, '0.0000', NULL, '0.0000'),
(186, 11, 23, '9.0000', NULL, '0.0000'),
(187, 11, 24, '0.0000', NULL, '0.0000'),
(188, 15, 1, '0.0000', NULL, '0.0000'),
(189, 15, 2, '0.0000', NULL, '0.0000'),
(190, 15, 3, '0.0000', NULL, '0.0000'),
(191, 15, 4, '0.0000', NULL, '0.0000'),
(192, 15, 5, '0.0000', NULL, '0.0000'),
(193, 15, 6, '0.0000', NULL, '0.0000'),
(194, 15, 7, '0.0000', NULL, '0.0000'),
(195, 15, 8, '0.0000', NULL, '0.0000'),
(196, 15, 9, '0.0000', NULL, '0.0000'),
(197, 15, 10, '0.0000', NULL, '0.0000'),
(198, 15, 11, '0.0000', NULL, '0.0000'),
(199, 15, 12, '0.0000', NULL, '0.0000'),
(200, 15, 13, '0.0000', NULL, '0.0000'),
(201, 15, 14, '0.0000', NULL, '0.0000'),
(202, 15, 15, '0.0000', NULL, '0.0000'),
(203, 15, 16, '0.0000', NULL, '0.0000'),
(204, 15, 17, '0.0000', NULL, '0.0000'),
(205, 15, 18, '0.0000', NULL, '0.0000'),
(206, 15, 19, '0.0000', NULL, '0.0000'),
(207, 15, 20, '0.0000', NULL, '0.0000'),
(208, 15, 21, '0.0000', NULL, '0.0000'),
(209, 15, 22, '0.0000', NULL, '0.0000'),
(210, 15, 23, '0.0000', NULL, '0.0000'),
(211, 15, 24, '0.0000', NULL, '0.0000'),
(212, 12, 1, '9.0000', NULL, '0.0000'),
(213, 13, 1, '-1.0000', NULL, '0.0000'),
(214, 14, 1, '9.0000', NULL, '0.0000'),
(215, 13, 2, '10.0000', NULL, '0.0000'),
(216, 1, 24, '0.0000', NULL, '0.0000'),
(217, 18, 1, '100.0000', NULL, '0.0000'),
(218, 18, 2, '100.0000', NULL, '0.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_warehouses_products_variants`
--

CREATE TABLE `sma_warehouses_products_variants` (
  `id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `rack` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sma_adjustments`
--
ALTER TABLE `sma_adjustments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_calendar`
--
ALTER TABLE `sma_calendar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_captcha`
--
ALTER TABLE `sma_captcha`
  ADD PRIMARY KEY (`captcha_id`),
  ADD KEY `word` (`word`);

--
-- Indexes for table `sma_categories`
--
ALTER TABLE `sma_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_combo_items`
--
ALTER TABLE `sma_combo_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_companies`
--
ALTER TABLE `sma_companies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `group_id_2` (`group_id`);

--
-- Indexes for table `sma_costing`
--
ALTER TABLE `sma_costing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_currencies`
--
ALTER TABLE `sma_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_customer_groups`
--
ALTER TABLE `sma_customer_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_date_format`
--
ALTER TABLE `sma_date_format`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_deliveries`
--
ALTER TABLE `sma_deliveries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_deposits`
--
ALTER TABLE `sma_deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_expenses`
--
ALTER TABLE `sma_expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_expense_categories`
--
ALTER TABLE `sma_expense_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_fin_areas`
--
ALTER TABLE `sma_fin_areas`
  ADD PRIMARY KEY (`area_code`),
  ADD UNIQUE KEY `description` (`description`);

--
-- Indexes for table `sma_fin_attachments`
--
ALTER TABLE `sma_fin_attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type_no` (`type_no`,`trans_no`);

--
-- Indexes for table `sma_fin_audit_trail`
--
ALTER TABLE `sma_fin_audit_trail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Seq` (`fiscal_year`,`gl_date`,`gl_seq`),
  ADD KEY `Type_and_Number` (`type`,`trans_no`);

--
-- Indexes for table `sma_fin_bank_accounts`
--
ALTER TABLE `sma_fin_bank_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bank_account_name` (`bank_account_name`),
  ADD KEY `bank_account_number` (`bank_account_number`),
  ADD KEY `account_code` (`account_code`);

--
-- Indexes for table `sma_fin_bank_trans`
--
ALTER TABLE `sma_fin_bank_trans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bank_act` (`bank_act`,`ref`),
  ADD KEY `type` (`type`,`trans_no`),
  ADD KEY `bank_act_2` (`bank_act`,`reconciled`),
  ADD KEY `bank_act_3` (`bank_act`,`trans_date`);

--
-- Indexes for table `sma_fin_bom`
--
ALTER TABLE `sma_fin_bom`
  ADD PRIMARY KEY (`parent`,`component`,`workcentre_added`,`loc_code`),
  ADD KEY `component` (`component`),
  ADD KEY `id` (`id`),
  ADD KEY `loc_code` (`loc_code`),
  ADD KEY `parent` (`parent`,`loc_code`),
  ADD KEY `workcentre_added` (`workcentre_added`);

--
-- Indexes for table `sma_fin_budget_trans`
--
ALTER TABLE `sma_fin_budget_trans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Account` (`account`,`tran_date`,`dimension_id`,`dimension2_id`);

--
-- Indexes for table `sma_fin_chart_class`
--
ALTER TABLE `sma_fin_chart_class`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `sma_fin_chart_master`
--
ALTER TABLE `sma_fin_chart_master`
  ADD PRIMARY KEY (`account_code`),
  ADD KEY `account_name` (`account_name`),
  ADD KEY `accounts_by_type` (`account_type`,`account_code`);

--
-- Indexes for table `sma_fin_chart_types`
--
ALTER TABLE `sma_fin_chart_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `sma_fin_comments`
--
ALTER TABLE `sma_fin_comments`
  ADD KEY `type_and_id` (`type`,`id`);

--
-- Indexes for table `sma_fin_credit_status`
--
ALTER TABLE `sma_fin_credit_status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `reason_description` (`reason_description`);

--
-- Indexes for table `sma_fin_crm_categories`
--
ALTER TABLE `sma_fin_crm_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `type` (`type`,`action`),
  ADD UNIQUE KEY `type_2` (`type`,`name`);

--
-- Indexes for table `sma_fin_crm_contacts`
--
ALTER TABLE `sma_fin_crm_contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`,`action`);

--
-- Indexes for table `sma_fin_crm_persons`
--
ALTER TABLE `sma_fin_crm_persons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ref` (`ref`);

--
-- Indexes for table `sma_fin_currencies`
--
ALTER TABLE `sma_fin_currencies`
  ADD PRIMARY KEY (`curr_abrev`);

--
-- Indexes for table `sma_fin_cust_allocations`
--
ALTER TABLE `sma_fin_cust_allocations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `trans_type_from` (`person_id`,`trans_type_from`,`trans_no_from`,`trans_type_to`,`trans_no_to`),
  ADD KEY `From` (`trans_type_from`,`trans_no_from`),
  ADD KEY `To` (`trans_type_to`,`trans_no_to`);

--
-- Indexes for table `sma_fin_cust_branch`
--
ALTER TABLE `sma_fin_cust_branch`
  ADD PRIMARY KEY (`branch_code`,`debtor_no`),
  ADD KEY `branch_ref` (`branch_ref`),
  ADD KEY `group_no` (`group_no`);

--
-- Indexes for table `sma_fin_debtors_master`
--
ALTER TABLE `sma_fin_debtors_master`
  ADD PRIMARY KEY (`debtor_no`),
  ADD UNIQUE KEY `debtor_ref` (`debtor_ref`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `sma_fin_debtor_trans`
--
ALTER TABLE `sma_fin_debtor_trans`
  ADD PRIMARY KEY (`type`,`trans_no`,`debtor_no`),
  ADD KEY `debtor_no` (`debtor_no`,`branch_code`),
  ADD KEY `tran_date` (`tran_date`),
  ADD KEY `order_` (`order_`);

--
-- Indexes for table `sma_fin_debtor_trans_details`
--
ALTER TABLE `sma_fin_debtor_trans_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Transaction` (`debtor_trans_type`,`debtor_trans_no`),
  ADD KEY `src_id` (`src_id`);

--
-- Indexes for table `sma_fin_dimensions`
--
ALTER TABLE `sma_fin_dimensions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `reference` (`reference`),
  ADD KEY `date_` (`date_`),
  ADD KEY `due_date` (`due_date`),
  ADD KEY `type_` (`type_`);

--
-- Indexes for table `sma_fin_exchange_rates`
--
ALTER TABLE `sma_fin_exchange_rates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `curr_code` (`curr_code`,`date_`);

--
-- Indexes for table `sma_fin_fiscal_year`
--
ALTER TABLE `sma_fin_fiscal_year`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `begin` (`begin`),
  ADD UNIQUE KEY `end` (`end`);

--
-- Indexes for table `sma_fin_gl_trans`
--
ALTER TABLE `sma_fin_gl_trans`
  ADD PRIMARY KEY (`counter`),
  ADD KEY `Type_and_Number` (`type`,`type_no`),
  ADD KEY `dimension_id` (`dimension_id`),
  ADD KEY `dimension2_id` (`dimension2_id`),
  ADD KEY `tran_date` (`tran_date`),
  ADD KEY `account_and_tran_date` (`account`,`tran_date`);

--
-- Indexes for table `sma_fin_grn_batch`
--
ALTER TABLE `sma_fin_grn_batch`
  ADD PRIMARY KEY (`id`),
  ADD KEY `delivery_date` (`delivery_date`),
  ADD KEY `purch_order_no` (`purch_order_no`);

--
-- Indexes for table `sma_fin_grn_items`
--
ALTER TABLE `sma_fin_grn_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `grn_batch_id` (`grn_batch_id`);

--
-- Indexes for table `sma_fin_groups`
--
ALTER TABLE `sma_fin_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `description` (`description`);

--
-- Indexes for table `sma_fin_item_codes`
--
ALTER TABLE `sma_fin_item_codes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `stock_id` (`stock_id`,`item_code`),
  ADD KEY `item_code` (`item_code`);

--
-- Indexes for table `sma_fin_item_tax_types`
--
ALTER TABLE `sma_fin_item_tax_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `sma_fin_item_tax_type_exemptions`
--
ALTER TABLE `sma_fin_item_tax_type_exemptions`
  ADD PRIMARY KEY (`item_tax_type_id`,`tax_type_id`);

--
-- Indexes for table `sma_fin_item_units`
--
ALTER TABLE `sma_fin_item_units`
  ADD PRIMARY KEY (`abbr`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `sma_fin_journal`
--
ALTER TABLE `sma_fin_journal`
  ADD PRIMARY KEY (`type`,`trans_no`),
  ADD KEY `tran_date` (`tran_date`);

--
-- Indexes for table `sma_fin_locations`
--
ALTER TABLE `sma_fin_locations`
  ADD PRIMARY KEY (`loc_code`);

--
-- Indexes for table `sma_fin_loc_stock`
--
ALTER TABLE `sma_fin_loc_stock`
  ADD PRIMARY KEY (`loc_code`,`stock_id`),
  ADD KEY `stock_id` (`stock_id`);

--
-- Indexes for table `sma_fin_payment_terms`
--
ALTER TABLE `sma_fin_payment_terms`
  ADD PRIMARY KEY (`terms_indicator`),
  ADD UNIQUE KEY `terms` (`terms`);

--
-- Indexes for table `sma_fin_prices`
--
ALTER TABLE `sma_fin_prices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `price` (`stock_id`,`sales_type_id`,`curr_abrev`);

--
-- Indexes for table `sma_fin_printers`
--
ALTER TABLE `sma_fin_printers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `sma_fin_print_profiles`
--
ALTER TABLE `sma_fin_print_profiles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `profile` (`profile`,`report`);

--
-- Indexes for table `sma_fin_purch_data`
--
ALTER TABLE `sma_fin_purch_data`
  ADD PRIMARY KEY (`supplier_id`,`stock_id`);

--
-- Indexes for table `sma_fin_purch_orders`
--
ALTER TABLE `sma_fin_purch_orders`
  ADD PRIMARY KEY (`order_no`),
  ADD KEY `ord_date` (`ord_date`);

--
-- Indexes for table `sma_fin_purch_order_details`
--
ALTER TABLE `sma_fin_purch_order_details`
  ADD PRIMARY KEY (`po_detail_item`),
  ADD KEY `order` (`order_no`,`po_detail_item`),
  ADD KEY `itemcode` (`item_code`);

--
-- Indexes for table `sma_fin_quick_entries`
--
ALTER TABLE `sma_fin_quick_entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `description` (`description`);

--
-- Indexes for table `sma_fin_quick_entry_lines`
--
ALTER TABLE `sma_fin_quick_entry_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `qid` (`qid`);

--
-- Indexes for table `sma_fin_recurrent_invoices`
--
ALTER TABLE `sma_fin_recurrent_invoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `description` (`description`);

--
-- Indexes for table `sma_fin_reflines`
--
ALTER TABLE `sma_fin_reflines`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `prefix` (`trans_type`,`prefix`);

--
-- Indexes for table `sma_fin_refs`
--
ALTER TABLE `sma_fin_refs`
  ADD PRIMARY KEY (`id`,`type`),
  ADD KEY `Type_and_Reference` (`type`,`reference`);

--
-- Indexes for table `sma_fin_salesman`
--
ALTER TABLE `sma_fin_salesman`
  ADD PRIMARY KEY (`salesman_code`),
  ADD UNIQUE KEY `salesman_name` (`salesman_name`);

--
-- Indexes for table `sma_fin_sales_orders`
--
ALTER TABLE `sma_fin_sales_orders`
  ADD PRIMARY KEY (`trans_type`,`order_no`);

--
-- Indexes for table `sma_fin_sales_order_details`
--
ALTER TABLE `sma_fin_sales_order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sorder` (`trans_type`,`order_no`),
  ADD KEY `stkcode` (`stk_code`);

--
-- Indexes for table `sma_fin_sales_pos`
--
ALTER TABLE `sma_fin_sales_pos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pos_name` (`pos_name`);

--
-- Indexes for table `sma_fin_sales_types`
--
ALTER TABLE `sma_fin_sales_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sales_type` (`sales_type`);

--
-- Indexes for table `sma_fin_security_roles`
--
ALTER TABLE `sma_fin_security_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `role` (`role`);

--
-- Indexes for table `sma_fin_shippers`
--
ALTER TABLE `sma_fin_shippers`
  ADD PRIMARY KEY (`shipper_id`),
  ADD UNIQUE KEY `name` (`shipper_name`);

--
-- Indexes for table `sma_fin_sql_trail`
--
ALTER TABLE `sma_fin_sql_trail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_fin_stock_category`
--
ALTER TABLE `sma_fin_stock_category`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `description` (`description`);

--
-- Indexes for table `sma_fin_stock_fa_class`
--
ALTER TABLE `sma_fin_stock_fa_class`
  ADD PRIMARY KEY (`fa_class_id`);

--
-- Indexes for table `sma_fin_stock_master`
--
ALTER TABLE `sma_fin_stock_master`
  ADD PRIMARY KEY (`stock_id`);

--
-- Indexes for table `sma_fin_stock_moves`
--
ALTER TABLE `sma_fin_stock_moves`
  ADD PRIMARY KEY (`trans_id`),
  ADD KEY `type` (`type`,`trans_no`),
  ADD KEY `Move` (`stock_id`,`loc_code`,`tran_date`);

--
-- Indexes for table `sma_fin_suppliers`
--
ALTER TABLE `sma_fin_suppliers`
  ADD PRIMARY KEY (`supplier_id`),
  ADD KEY `supp_ref` (`supp_ref`);

--
-- Indexes for table `sma_fin_supp_allocations`
--
ALTER TABLE `sma_fin_supp_allocations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `trans_type_from` (`person_id`,`trans_type_from`,`trans_no_from`,`trans_type_to`,`trans_no_to`),
  ADD KEY `From` (`trans_type_from`,`trans_no_from`),
  ADD KEY `To` (`trans_type_to`,`trans_no_to`);

--
-- Indexes for table `sma_fin_supp_invoice_items`
--
ALTER TABLE `sma_fin_supp_invoice_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Transaction` (`supp_trans_type`,`supp_trans_no`,`stock_id`);

--
-- Indexes for table `sma_fin_supp_trans`
--
ALTER TABLE `sma_fin_supp_trans`
  ADD PRIMARY KEY (`type`,`trans_no`,`supplier_id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `tran_date` (`tran_date`);

--
-- Indexes for table `sma_fin_sys_prefs`
--
ALTER TABLE `sma_fin_sys_prefs`
  ADD PRIMARY KEY (`name`),
  ADD KEY `category` (`category`);

--
-- Indexes for table `sma_fin_tags`
--
ALTER TABLE `sma_fin_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `type` (`type`,`name`);

--
-- Indexes for table `sma_fin_tag_associations`
--
ALTER TABLE `sma_fin_tag_associations`
  ADD UNIQUE KEY `record_id` (`record_id`,`tag_id`);

--
-- Indexes for table `sma_fin_tax_groups`
--
ALTER TABLE `sma_fin_tax_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `sma_fin_tax_group_items`
--
ALTER TABLE `sma_fin_tax_group_items`
  ADD PRIMARY KEY (`tax_group_id`,`tax_type_id`);

--
-- Indexes for table `sma_fin_tax_types`
--
ALTER TABLE `sma_fin_tax_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_fin_trans_tax_details`
--
ALTER TABLE `sma_fin_trans_tax_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Type_and_Number` (`trans_type`,`trans_no`),
  ADD KEY `tran_date` (`tran_date`);

--
-- Indexes for table `sma_fin_useronline`
--
ALTER TABLE `sma_fin_useronline`
  ADD PRIMARY KEY (`id`),
  ADD KEY `timestamp` (`timestamp`),
  ADD KEY `ip` (`ip`);

--
-- Indexes for table `sma_fin_users`
--
ALTER TABLE `sma_fin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `sma_fin_voided`
--
ALTER TABLE `sma_fin_voided`
  ADD UNIQUE KEY `id` (`type`,`id`);

--
-- Indexes for table `sma_fin_workcentres`
--
ALTER TABLE `sma_fin_workcentres`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `sma_fin_workorders`
--
ALTER TABLE `sma_fin_workorders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `wo_ref` (`wo_ref`);

--
-- Indexes for table `sma_fin_wo_costing`
--
ALTER TABLE `sma_fin_wo_costing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_fin_wo_issues`
--
ALTER TABLE `sma_fin_wo_issues`
  ADD PRIMARY KEY (`issue_no`),
  ADD KEY `workorder_id` (`workorder_id`);

--
-- Indexes for table `sma_fin_wo_issue_items`
--
ALTER TABLE `sma_fin_wo_issue_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_fin_wo_manufacture`
--
ALTER TABLE `sma_fin_wo_manufacture`
  ADD PRIMARY KEY (`id`),
  ADD KEY `workorder_id` (`workorder_id`);

--
-- Indexes for table `sma_fin_wo_requirements`
--
ALTER TABLE `sma_fin_wo_requirements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `workorder_id` (`workorder_id`);

--
-- Indexes for table `sma_gift_cards`
--
ALTER TABLE `sma_gift_cards`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `card_no` (`card_no`);

--
-- Indexes for table `sma_groups`
--
ALTER TABLE `sma_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_login_attempts`
--
ALTER TABLE `sma_login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_notifications`
--
ALTER TABLE `sma_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_order_ref`
--
ALTER TABLE `sma_order_ref`
  ADD PRIMARY KEY (`ref_id`);

--
-- Indexes for table `sma_payments`
--
ALTER TABLE `sma_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_paypal`
--
ALTER TABLE `sma_paypal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_permissions`
--
ALTER TABLE `sma_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_pos_register`
--
ALTER TABLE `sma_pos_register`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_pos_settings`
--
ALTER TABLE `sma_pos_settings`
  ADD PRIMARY KEY (`pos_id`);

--
-- Indexes for table `sma_products`
--
ALTER TABLE `sma_products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `id` (`id`),
  ADD KEY `id_2` (`id`),
  ADD KEY `category_id_2` (`category_id`);

--
-- Indexes for table `sma_product_photos`
--
ALTER TABLE `sma_product_photos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_product_variants`
--
ALTER TABLE `sma_product_variants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_purchases`
--
ALTER TABLE `sma_purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_purchase_items`
--
ALTER TABLE `sma_purchase_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_id` (`purchase_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sma_quotes`
--
ALTER TABLE `sma_quotes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_quote_items`
--
ALTER TABLE `sma_quote_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quote_id` (`quote_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sma_return_items`
--
ALTER TABLE `sma_return_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_id` (`sale_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `product_id_2` (`product_id`,`sale_id`),
  ADD KEY `sale_id_2` (`sale_id`,`product_id`);

--
-- Indexes for table `sma_return_purchases`
--
ALTER TABLE `sma_return_purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_return_purchase_items`
--
ALTER TABLE `sma_return_purchase_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_id` (`purchase_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `product_id_2` (`product_id`,`purchase_id`),
  ADD KEY `purchase_id_2` (`purchase_id`,`product_id`);

--
-- Indexes for table `sma_return_sales`
--
ALTER TABLE `sma_return_sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_sales`
--
ALTER TABLE `sma_sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_sale_items`
--
ALTER TABLE `sma_sale_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_id` (`sale_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `product_id_2` (`product_id`,`sale_id`),
  ADD KEY `sale_id_2` (`sale_id`,`product_id`);

--
-- Indexes for table `sma_sessions`
--
ALTER TABLE `sma_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `sma_settings`
--
ALTER TABLE `sma_settings`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `sma_skrill`
--
ALTER TABLE `sma_skrill`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_subcategories`
--
ALTER TABLE `sma_subcategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_suspended_bills`
--
ALTER TABLE `sma_suspended_bills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_suspended_items`
--
ALTER TABLE `sma_suspended_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_tax_rates`
--
ALTER TABLE `sma_tax_rates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_transfers`
--
ALTER TABLE `sma_transfers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_transfer_items`
--
ALTER TABLE `sma_transfer_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transfer_id` (`transfer_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sma_users`
--
ALTER TABLE `sma_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`,`warehouse_id`,`biller_id`),
  ADD KEY `group_id_2` (`group_id`,`company_id`);

--
-- Indexes for table `sma_user_logins`
--
ALTER TABLE `sma_user_logins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_variants`
--
ALTER TABLE `sma_variants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_warehouses`
--
ALTER TABLE `sma_warehouses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_warehouses_products`
--
ALTER TABLE `sma_warehouses_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- Indexes for table `sma_warehouses_products_variants`
--
ALTER TABLE `sma_warehouses_products_variants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `option_id` (`option_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sma_adjustments`
--
ALTER TABLE `sma_adjustments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `sma_calendar`
--
ALTER TABLE `sma_calendar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_captcha`
--
ALTER TABLE `sma_captcha`
  MODIFY `captcha_id` bigint(13) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_categories`
--
ALTER TABLE `sma_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `sma_combo_items`
--
ALTER TABLE `sma_combo_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sma_companies`
--
ALTER TABLE `sma_companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `sma_costing`
--
ALTER TABLE `sma_costing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `sma_currencies`
--
ALTER TABLE `sma_currencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sma_customer_groups`
--
ALTER TABLE `sma_customer_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sma_date_format`
--
ALTER TABLE `sma_date_format`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sma_deliveries`
--
ALTER TABLE `sma_deliveries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_deposits`
--
ALTER TABLE `sma_deposits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_expenses`
--
ALTER TABLE `sma_expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sma_expense_categories`
--
ALTER TABLE `sma_expense_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `sma_fin_areas`
--
ALTER TABLE `sma_fin_areas`
  MODIFY `area_code` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_fin_attachments`
--
ALTER TABLE `sma_fin_attachments`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_fin_audit_trail`
--
ALTER TABLE `sma_fin_audit_trail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_fin_bank_accounts`
--
ALTER TABLE `sma_fin_bank_accounts`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sma_fin_bank_trans`
--
ALTER TABLE `sma_fin_bank_trans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_fin_bom`
--
ALTER TABLE `sma_fin_bom`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sma_fin_budget_trans`
--
ALTER TABLE `sma_fin_budget_trans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_fin_credit_status`
--
ALTER TABLE `sma_fin_credit_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sma_fin_crm_categories`
--
ALTER TABLE `sma_fin_crm_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'pure technical key', AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `sma_fin_crm_contacts`
--
ALTER TABLE `sma_fin_crm_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `sma_fin_crm_persons`
--
ALTER TABLE `sma_fin_crm_persons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `sma_fin_cust_allocations`
--
ALTER TABLE `sma_fin_cust_allocations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `sma_fin_cust_branch`
--
ALTER TABLE `sma_fin_cust_branch`
  MODIFY `branch_code` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `sma_fin_debtors_master`
--
ALTER TABLE `sma_fin_debtors_master`
  MODIFY `debtor_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `sma_fin_debtor_trans_details`
--
ALTER TABLE `sma_fin_debtor_trans_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_fin_dimensions`
--
ALTER TABLE `sma_fin_dimensions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_fin_exchange_rates`
--
ALTER TABLE `sma_fin_exchange_rates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_fin_fiscal_year`
--
ALTER TABLE `sma_fin_fiscal_year`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sma_fin_gl_trans`
--
ALTER TABLE `sma_fin_gl_trans`
  MODIFY `counter` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=160;

--
-- AUTO_INCREMENT for table `sma_fin_grn_batch`
--
ALTER TABLE `sma_fin_grn_batch`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_fin_grn_items`
--
ALTER TABLE `sma_fin_grn_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_fin_groups`
--
ALTER TABLE `sma_fin_groups`
  MODIFY `id` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sma_fin_item_codes`
--
ALTER TABLE `sma_fin_item_codes`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_fin_item_tax_types`
--
ALTER TABLE `sma_fin_item_tax_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sma_fin_payment_terms`
--
ALTER TABLE `sma_fin_payment_terms`
  MODIFY `terms_indicator` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `sma_fin_prices`
--
ALTER TABLE `sma_fin_prices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `sma_fin_printers`
--
ALTER TABLE `sma_fin_printers`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sma_fin_print_profiles`
--
ALTER TABLE `sma_fin_print_profiles`
  MODIFY `id` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `sma_fin_purch_orders`
--
ALTER TABLE `sma_fin_purch_orders`
  MODIFY `order_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `sma_fin_purch_order_details`
--
ALTER TABLE `sma_fin_purch_order_details`
  MODIFY `po_detail_item` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `sma_fin_quick_entries`
--
ALTER TABLE `sma_fin_quick_entries`
  MODIFY `id` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sma_fin_quick_entry_lines`
--
ALTER TABLE `sma_fin_quick_entry_lines`
  MODIFY `id` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sma_fin_recurrent_invoices`
--
ALTER TABLE `sma_fin_recurrent_invoices`
  MODIFY `id` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_fin_reflines`
--
ALTER TABLE `sma_fin_reflines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `sma_fin_salesman`
--
ALTER TABLE `sma_fin_salesman`
  MODIFY `salesman_code` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_fin_sales_order_details`
--
ALTER TABLE `sma_fin_sales_order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_fin_sales_pos`
--
ALTER TABLE `sma_fin_sales_pos`
  MODIFY `id` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_fin_sales_types`
--
ALTER TABLE `sma_fin_sales_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sma_fin_security_roles`
--
ALTER TABLE `sma_fin_security_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `sma_fin_shippers`
--
ALTER TABLE `sma_fin_shippers`
  MODIFY `shipper_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_fin_sql_trail`
--
ALTER TABLE `sma_fin_sql_trail`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_fin_stock_category`
--
ALTER TABLE `sma_fin_stock_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sma_fin_stock_moves`
--
ALTER TABLE `sma_fin_stock_moves`
  MODIFY `trans_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_fin_suppliers`
--
ALTER TABLE `sma_fin_suppliers`
  MODIFY `supplier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sma_fin_supp_allocations`
--
ALTER TABLE `sma_fin_supp_allocations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_fin_supp_invoice_items`
--
ALTER TABLE `sma_fin_supp_invoice_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_fin_tags`
--
ALTER TABLE `sma_fin_tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_fin_tax_groups`
--
ALTER TABLE `sma_fin_tax_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sma_fin_tax_types`
--
ALTER TABLE `sma_fin_tax_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sma_fin_trans_tax_details`
--
ALTER TABLE `sma_fin_trans_tax_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_fin_useronline`
--
ALTER TABLE `sma_fin_useronline`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_fin_users`
--
ALTER TABLE `sma_fin_users`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sma_fin_workcentres`
--
ALTER TABLE `sma_fin_workcentres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_fin_workorders`
--
ALTER TABLE `sma_fin_workorders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_fin_wo_costing`
--
ALTER TABLE `sma_fin_wo_costing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_fin_wo_issues`
--
ALTER TABLE `sma_fin_wo_issues`
  MODIFY `issue_no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_fin_wo_issue_items`
--
ALTER TABLE `sma_fin_wo_issue_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_fin_wo_manufacture`
--
ALTER TABLE `sma_fin_wo_manufacture`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_fin_wo_requirements`
--
ALTER TABLE `sma_fin_wo_requirements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_gift_cards`
--
ALTER TABLE `sma_gift_cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_groups`
--
ALTER TABLE `sma_groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `sma_login_attempts`
--
ALTER TABLE `sma_login_attempts`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_notifications`
--
ALTER TABLE `sma_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sma_order_ref`
--
ALTER TABLE `sma_order_ref`
  MODIFY `ref_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_payments`
--
ALTER TABLE `sma_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_permissions`
--
ALTER TABLE `sma_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sma_pos_register`
--
ALTER TABLE `sma_pos_register`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sma_products`
--
ALTER TABLE `sma_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `sma_product_photos`
--
ALTER TABLE `sma_product_photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sma_product_variants`
--
ALTER TABLE `sma_product_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `sma_purchases`
--
ALTER TABLE `sma_purchases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `sma_purchase_items`
--
ALTER TABLE `sma_purchase_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `sma_quotes`
--
ALTER TABLE `sma_quotes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_quote_items`
--
ALTER TABLE `sma_quote_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_return_items`
--
ALTER TABLE `sma_return_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_return_purchases`
--
ALTER TABLE `sma_return_purchases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_return_purchase_items`
--
ALTER TABLE `sma_return_purchase_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_return_sales`
--
ALTER TABLE `sma_return_sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_sales`
--
ALTER TABLE `sma_sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `sma_sale_items`
--
ALTER TABLE `sma_sale_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `sma_subcategories`
--
ALTER TABLE `sma_subcategories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `sma_suspended_bills`
--
ALTER TABLE `sma_suspended_bills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_suspended_items`
--
ALTER TABLE `sma_suspended_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_tax_rates`
--
ALTER TABLE `sma_tax_rates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sma_transfers`
--
ALTER TABLE `sma_transfers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `sma_transfer_items`
--
ALTER TABLE `sma_transfer_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sma_users`
--
ALTER TABLE `sma_users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `sma_user_logins`
--
ALTER TABLE `sma_user_logins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1113;

--
-- AUTO_INCREMENT for table `sma_variants`
--
ALTER TABLE `sma_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_warehouses`
--
ALTER TABLE `sma_warehouses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `sma_warehouses_products`
--
ALTER TABLE `sma_warehouses_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=219;

--
-- AUTO_INCREMENT for table `sma_warehouses_products_variants`
--
ALTER TABLE `sma_warehouses_products_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
