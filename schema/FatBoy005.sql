-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 13, 2017 at 04:49 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `FatBoy`
--

-- --------------------------------------------------------

--
-- Table structure for table `AccountStatus`
--

CREATE TABLE `AccountStatus` (
  `id` int(2) NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `AccountStatus`
--

INSERT INTO `AccountStatus` (`id`, `name`) VALUES
(1, 'active'),
(2, 'blocked'),
(3, 'under investigation'),
(4, 'tracked'),
(5, 'inactive');

-- --------------------------------------------------------

--
-- Table structure for table `Ad`
--

CREATE TABLE `Ad` (
  `id` int(12) NOT NULL,
  `producer_user_id` int(12) NOT NULL,
  `ad_name` varchar(150) NOT NULL,
  `description` varchar(3000) NOT NULL,
  `photo_url_address` varchar(500) NOT NULL,
  `num_aired` int(14) NOT NULL,
  `target_num_airings` int(14) NOT NULL,
  `budget` double NOT NULL,
  `air_time` int(3) NOT NULL,
  `status_id` int(2) NOT NULL,
  `produce_date` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Ad`
--

INSERT INTO `Ad` (`id`, `producer_user_id`, `ad_name`, `description`, `photo_url_address`, `num_aired`, `target_num_airings`, `budget`, `air_time`, `status_id`, `produce_date`) VALUES
(1, 8, 'CBO McBurger', 'The present corporation dates its founding to the opening of a franchised restaurant by businessman Ray Kroc in Des Plaines, Illinois on April 15, 1955, the ninth McDonald\'s restaurant overall; this location was demolished in 1984 after many remodels. Kroc later purchased the McDonald brothers\' equity in the company and led its worldwide expansion, and the company became listed on the public stock markets ten years later. Kroc was also noted for aggressive business practices, compelling the McDonald brothers to leave the fast-food industry.', 'https://drive.google.com/file/d/0B10DknwLh12RV3lLcDdmTnY2ZHM/preview', 80, 1000, 100, 5, 1, '2017-05-11 02:22:53'),
(2, 8, 'Kobe Shoes AD', 'Nike produces a wide range of sports equipment. Their first products were track running shoes. They currently also make shoes, jerseys, shorts, cleats,[37] baselayers, etc. for a wide range of sports, including track and field, baseball, ice hockey, tennis, association football (soccer), lacrosse, basketball, and cricket. Nike Air Max is a line of shoes first released by Nike, Inc. in 1987. Additional product lines were introduced later, such as Air Huarache, which debuted in 1992. The most recent additions to their line are the Nike 6.0, Nike NYX, and Nike SB shoes, designed for skateboarding. Nike has recently introduced cricket shoes called Air Zoom Yorker, designed to be 30% lighter than their competitors\'.[38] In 2008, Nike introduced the Air Jordan XX3, a high-performance basketball shoe designed with the environment in mind.', 'https://drive.google.com/file/d/0B10DknwLh12RVHMtd1dOWk14OVk/preview', 476, 500, 10, 3, 1, '2017-05-11 02:22:53'),
(3, 8, 'McDonalds - Fries & Burger', 'McDonalds - Fries & Burger', 'https://www.mcdonalds.com/content/dam/usa/promotions/desktop/evm__750x537.jpg', 47, 100, 10, 5, 1, '2017-05-11 02:22:53'),
(4, 9, 'Deint-O-Care', 'Deint-O-Care Deint-O-CareDeint-O-CareDeint-O-CareDeint-O-CareDeint-O-CareDeint-O-CareDeint-O-Care Deint-O-CareDeint-O-CareDeint-O-CareDeint-O-CareDeint-O-CareDeint-O-CareDeint-O-Care Deint-O-CareDeint-O-CareDeint-O-CareDeint-O-CareDeint-O-CareDeint-O-Care', 'https://drive.google.com/file/d/0B10DknwLh12RODZfUnNxMVpPSTg/preview', 7, 7, 100, 10, 1, '2017-05-11 16:32:39'),
(5, 10, 'Dexter Javier - Remax Ad', 'Remax Remax Remax Remax Remax Remax Remax Remax Remax Remax Remax Remax Remax Remax Remax Remax', 'http://localhost/myPersonalProjects/FatBoy/public/_photos/remax.png', 50, 200, 150, 5, 1, '2017-05-11 16:40:45'),
(6, 8, 'Air Canada - Summer 2017', 'Air Canada - Summer 2017 Air Canada - Summer 2017', 'https://drive.google.com/file/d/0B10DknwLh12RY2tob2RWSi1Ddkk/preview', 37, 37, 1200, 20, 1, '2017-05-12 02:26:45'),
(7, 10, 'Nike - Swoosh 2016', 'Just Do It', 'https://drive.google.com/file/d/0B10DknwLh12RcU9kcmF5bTVJRUk/preview', 123, 200, 150, 20, 1, '2017-05-12 02:47:10'),
(8, 10, 'Nike - Sharapova - Australian 2013 Open', 'Maria', 'https://drive.google.com/file/d/0B10DknwLh12RWndEdWkzVjd4YjA/preview', 500, 500, 5000, 12, 1, '2017-05-12 03:06:24'),
(9, 10, 'Justin Bieber - 2016 World Tour', 'Justin Bieber - 2016 World Tour Justin Bieber - 2016 World Tour', 'https://drive.google.com/file/d/0B10DknwLh12RUDg3dnIwS0dzNVU/preview', 78, 1500, 300, 50, 1, '2017-05-12 03:53:11'),
(10, 8, 'Nike - LeBron James - Witness', 'Nike - LeBron James - Witness', 'https://drive.google.com/file/d/0B10DknwLh12RczB0b1c1bldib2s/preview', 68, 500, 130, 30, 1, '2017-05-12 04:03:13'),
(11, 8, 'Apple - iPhone7 - Tokyo', 'Pictures shot in iPhone7.', 'https://www.youtube.com/embed/4nbhfrQfRRE?rel=0&controls=0&showinfo=0&autoplay=1&loop=1', 80, 35000, 10000, 60, 1, '2017-05-12 04:27:04'),
(12, 9, 'Jordan - AJXXXI: Runway', 'Some run, some make runways. #AJXXXI', 'https://www.youtube.com/embed/9J75J2CYjzs?rel=0&amp;controls=0&amp;showinfo=0&autoplay=1&loop=1', 565, 1000, 100, 90, 1, '2017-05-12 17:31:06');

-- --------------------------------------------------------

--
-- Table structure for table `Address`
--

CREATE TABLE `Address` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address_type_code` int(2) NOT NULL,
  `street1` varchar(500) NOT NULL,
  `street2` varchar(500) DEFAULT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(50) NOT NULL,
  `zip` varchar(10) NOT NULL,
  `country_code` varchar(2) NOT NULL,
  `phone` varchar(20) DEFAULT '(zZz-69-zZz)'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Address`
--

INSERT INTO `Address` (`id`, `user_id`, `address_type_code`, `street1`, `street2`, `city`, `state`, `zip`, `country_code`, `phone`) VALUES
(16, 15, 1, '16 Florence St', 'Merville Park Subd', 'Paranaque', 'Metro Manila', '1709', 'PH', '(zZz-69-zZz)'),
(18, 8, 1, '105-50 Thorncliffe Park Dr', '', 'East York', 'ON', 'M4H 1K4', 'CA', '(zZz-69-zZz)'),
(23, 8, 2, '105-50 Thorncliffe Park Dr', '', 'East York', 'ON', 'M4H 1K4', 'CA', '(zZz-69-zZz)'),
(26, 14, 3, '78 Monkhouse Rd', '', 'Markham', 'ON', 'L6E 1V5', 'CA', '(zZz-69-zZz)'),
(34, 14, 3, '78 Monkhouse Rd', '', 'Markham', 'ON', 'L6E 1V5', 'CA', '(zZz-69-zZz)'),
(35, 14, 3, '78 Monkhouse Rd', '', 'Markham', 'ON', 'L6E 1V5', 'CA', '(zZz-69-zZz)'),
(36, 14, 3, '78 Monkhouse Rd', '', 'Markham', 'ON', 'L6E 1V5', 'CA', '(zZz-69-zZz)'),
(37, 14, 3, '78 Monkhouse Rd', '', 'Markham', 'ON', 'L6E 1V5', 'CA', '(zZz-69-zZz)'),
(38, 14, 3, '78 Monkhouse Rd', '', 'Markham', 'ON', 'L6E 1V5', 'CA', '(zZz-69-zZz)'),
(39, 14, 3, '78 Monkhouse Rd', '', 'Markham', 'ON', 'L6E 1V5', 'CA', '(zZz-69-zZz)'),
(40, 14, 3, '78 Monkhouse Rd', '', 'Markham', 'ON', 'L6E 1V5', 'CA', '(zZz-69-zZz)'),
(41, 14, 3, '78 Monkhouse Rd', '', 'Markham', 'ON', 'L6E 1V5', 'CA', '(zZz-69-zZz)'),
(42, 14, 3, '78 Monkhouse Rd', '', 'Markham', 'ON', 'L6E 1V5', 'CA', '(zZz-69-zZz)'),
(43, 14, 3, '78 Monkhouse Rd', '', 'Markham', 'ON', 'L6E 1V5', 'CA', '(zZz-69-zZz)'),
(44, 14, 3, '78 Monkhouse Rd', '', 'Markham', 'ON', 'L6E 1V5', 'CA', '(zZz-69-zZz)'),
(45, 14, 3, '78 Monkhouse Rd', '', 'Markham', 'ON', 'L6E 1V5', 'CA', '(zZz-69-zZz)'),
(46, 14, 3, '78 Monkhouse Rd', '', 'Markham', 'ON', 'L6E 1V5', 'CA', '(zZz-69-zZz)'),
(47, 14, 3, '78 Monkhouse Rd', '', 'Markham', 'ON', 'L6E 1V5', 'CA', '(zZz-69-zZz)'),
(48, 14, 3, '78 Monkhouse Rd', '', 'Markham', 'ON', 'L6E 1V5', 'CA', '(zZz-69-zZz)'),
(49, 14, 3, '78 Monkhouse Rd', '', 'Markham', 'ON', 'L6E 1V5', 'CA', '(zZz-69-zZz)'),
(50, 14, 3, '78 Monkhouse Rd', '', 'Markham', 'ON', 'L6E 1V5', 'CA', '(zZz-69-zZz)'),
(51, 14, 3, '78 Monkhouse Rd', '', 'Markham', 'ON', 'L6E 1V5', 'CA', '(zZz-69-zZz)'),
(52, 14, 3, '941 Progress Ave', '', 'Toronto', 'ON', 'M1K 5E9', 'CA', '(zZz-69-zZz)'),
(53, 14, 3, '78 Monkhouse Rd', '', 'Markham', 'ON', 'L6E 1V5', 'CA', '(zZz-69-zZz)'),
(54, 14, 3, '78 Monkhouse Rd', '', 'Markham', 'ON', 'L6E 1V5', 'CA', '(zZz-69-zZz)'),
(55, 14, 3, '78 Monkhouse Rd', '', 'Markham', 'ON', 'L6E 1V5', 'CA', '(zZz-69-zZz)'),
(56, 14, 3, '78 Monkhouse Rd', '', 'Markham', 'ON', 'L6E 1V5', 'CA', '(zZz-69-zZz)'),
(57, 14, 3, '78 Monkhouse Rd', '', 'Markham', 'ON', 'L6E 1V5', 'CA', '(zZz-69-zZz)'),
(58, 14, 3, '78 Monkhouse Rd', '', 'Markham', 'ON', 'L6E 1V5', 'CA', '(zZz-69-zZz)'),
(59, 14, 3, '78 Monkhouse Rd', '', 'Markham', 'ON', 'L6E 1V5', 'CA', '(zZz-69-zZz)'),
(60, 14, 3, '78 Monkhouse Rd', '', 'Markham', 'ON', 'L6E 1V5', 'CA', '(zZz-69-zZz)'),
(61, 14, 3, '78 Monkhouse Rd', '', 'Markham', 'ON', 'L6E 1V5', 'CA', '(zZz-69-zZz)'),
(62, 14, 3, '78 Monkhouse Rd', '', 'Markham', 'ON', 'L6E 1V5', 'CA', '(zZz-69-zZz)'),
(63, 14, 3, '78 Monkhouse Rd', '', 'Markham', 'ON', 'L6E 1V5', 'CA', '(zZz-69-zZz)'),
(64, 14, 3, '78 Monkhouse Rd', '', 'Markham', 'ON', 'L6E 1V5', 'CA', '(zZz-69-zZz)'),
(74, 9, 1, 'Blk 14 Lot 22', 'San Lorenzo Luis', 'Sta. Rosa', 'Laguna', '1234', 'CA', ''),
(75, 10, 1, '78 Monkhouse Rd', 'Street2', 'Markham', 'Ontario', 'L6E 1V5', 'CA', ''),
(76, 14, 3, '78 Monkhouse Rd', '', 'Markham', 'ON', 'L6E 1V5', 'CA', ''),
(77, 14, 3, '78 Monkhouse Rd', '', 'Markham', 'ON', 'L6E 1V5', 'CA', ''),
(78, 14, 3, '78 Monkhouse Rd', '', 'Markham', 'ON', 'L6E 1V5', 'CA', ''),
(79, 14, 3, '78 Monkhouse Rd', '', 'Markham', 'ON', 'L6E 1V5', 'CA', ''),
(80, 14, 3, '78 Monkhouse Rd', '', 'Markham', 'ON', 'L6E 1V5', 'CA', ''),
(81, 14, 3, '78 Monkhouse Rd', '', 'Markham', 'ON', 'L6E 1V5', 'CA', ''),
(82, 14, 3, '78 Monkhouse Rd', '', 'Markham', 'ON', 'L6E 1V5', 'CA', ''),
(83, 14, 3, '78 Monkhouse Rd', '', 'Markham', 'ON', 'L6E 1V5', 'CA', ''),
(84, 14, 3, '78 Monkhouse Rd', '', 'Markham', 'ON', 'L6E 1V5', 'CA', ''),
(85, 14, 3, '78 Monkhouse Rd', '', 'Markham', 'ON', 'L6E 1V5', 'CA', ''),
(86, 14, 3, '78 Monkhouse Rd', '', 'Markham', 'ON', 'L6E 1V5', 'CA', ''),
(87, 14, 3, '78 Monkhouse Rd', '', 'Markham', 'ON', 'L6E 1V5', 'CA', ''),
(88, 14, 3, '78 Monkhouse Rd', '', 'Markham', 'ON', 'L6E 1V5', 'CA', ''),
(89, 14, 3, '78 Monkhouse Rd', '', 'Markham', 'ON', 'L6E 1V5', 'CA', ''),
(90, 14, 3, '78 Monkhouse Rd', '', 'Markham', 'ON', 'L6E 1V5', 'CA', ''),
(91, 14, 3, '78 Monkhouse Rd', '', 'Markham', 'ON', 'L6E 1V5', 'CA', '');

-- --------------------------------------------------------

--
-- Table structure for table `AdStatus`
--

CREATE TABLE `AdStatus` (
  `id` int(2) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `AdStatus`
--

INSERT INTO `AdStatus` (`id`, `name`, `description`) VALUES
(1, 'active', NULL),
(2, 'inactive', NULL),
(3, 'completed', NULL),
(4, 'withdrawn', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `CartItems`
--

CREATE TABLE `CartItems` (
  `id` int(11) NOT NULL,
  `cart_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `CartItems`
--

INSERT INTO `CartItems` (`id`, `cart_id`, `item_id`, `quantity`) VALUES
(97, 37, 5, 1),
(98, 37, 4, 0),
(99, 38, 2, 1),
(100, 38, 3, 0),
(101, 39, 3, 0),
(102, 40, 10, 5),
(103, 41, 4, 0),
(104, 42, 10, 5),
(105, 43, 18, 2),
(106, 44, 18, 2),
(107, 38, 9, 0),
(108, 38, 17, 0),
(109, 39, 2, 1),
(110, 39, 9, 0),
(111, 39, 17, 0),
(112, 38, 16, 0),
(113, 45, 9, 0),
(114, 46, 17, 1),
(115, 47, 17, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ChatMessage`
--

CREATE TABLE `ChatMessage` (
  `id` int(12) NOT NULL,
  `chat_thread_id` int(11) NOT NULL,
  `chatter_user_id` int(11) NOT NULL,
  `date_posted` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `message` varchar(1000) NOT NULL,
  `is_new` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ChatMessage`
--

INSERT INTO `ChatMessage` (`id`, `chat_thread_id`, `chatter_user_id`, `date_posted`, `message`, `is_new`) VALUES
(33, 1, 8, '2017-05-30 08:27:03', 'hey c!', b'0'),
(34, 1, 9, '2017-05-30 08:27:51', 'baket?ðŸ˜‚', b'0'),
(35, 1, 8, '2017-05-30 08:28:26', 'wala langðŸ˜ˆ\nSino mananalo?', b'0'),
(36, 1, 9, '2017-05-30 08:28:47', 'cavsðŸ˜Ž', b'0'),
(37, 1, 8, '2017-05-30 08:29:23', 'maniwal ka pala!?l kjlkj lksdfj lkjas dflkj lkj lsadfj lskajd fl\nasdjflkj lwaejljoif avffnaowijer[ock[jqeðŸ˜rg; ;alsdjogiajw gajioigj awcljoiawrjg j;lja wet\najeo;ic jao;iwjgc ', b'0'),
(38, 1, 9, '2017-05-30 08:29:47', 'hoy anong klaseðŸ˜¤ðŸ˜¡', b'0'),
(39, 3, 9, '2017-05-30 08:35:31', 'Si yeye..', b'0'),
(40, 3, 10, '2017-05-30 08:36:27', 'baket?ðŸ˜ˆ', b'0'),
(41, 1, 8, '2017-05-30 08:38:03', 'c..', b'0'),
(42, 1, 8, '2017-05-30 08:49:05', 'ano ba..', b'0'),
(43, 1, 9, '2017-05-30 08:49:22', 'what?ðŸ˜€', b'0'),
(44, 1, 8, '2017-05-30 09:21:58', 'ano ba yan?ðŸ˜', b'0'),
(45, 1, 8, '2017-05-30 09:48:00', 'what date?', b'0'),
(46, 1, 8, '2017-05-30 09:49:20', 'ano na?', b'0'),
(47, 1, 8, '2017-05-31 02:26:08', 'that skinny kidðŸ˜™', b'0'),
(48, 1, 8, '2017-05-31 02:53:13', 'ano?', b'0'),
(49, 1, 8, '2017-05-31 02:53:21', 'ðŸ˜ˆ', b'0'),
(50, 1, 8, '2017-05-31 03:11:27', 'wak ka agnyan\nbakiðŸ˜ˆðŸ˜‡t?', b'0'),
(51, 1, 8, '2017-05-31 03:12:18', 'kobe', b'0'),
(52, 1, 8, '2017-05-31 03:57:09', 'anong klasiðŸ˜ŽðŸ˜ŽðŸ˜', b'0'),
(53, 1, 9, '2017-05-31 03:57:47', 'bat ang gulo mo?ðŸ˜‚', b'0'),
(54, 1, 8, '2017-05-31 03:58:08', 'anong magula? kaw nag eh', b'0'),
(55, 1, 9, '2017-05-31 03:58:29', 'punta ako sa inyo nood nbaðŸ˜€ðŸ˜', b'0'),
(56, 1, 8, '2017-05-31 04:14:56', 'wow\nganda namanðŸ˜ŠðŸ˜‰am', b'0'),
(57, 1, 9, '2017-05-31 04:16:31', 'ngaekðŸ˜‚', b'0'),
(58, 1, 8, '2017-05-31 06:48:21', 'lwaejljoif avffnaowijer[ock[jqeðŸ˜rg; ;alsdjogiajw gajioigj awcljoiawrjg j;lja wet ajeo;ic jao;iwjgc', b'0'),
(59, 1, 8, '2017-05-31 06:53:43', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', b'0'),
(60, 1, 8, '2017-05-31 07:11:44', 'TETATDAGGREGGDTETATDAGGREGGDTETATDAGGREGGDTETATDAGGREGGDTETATDAGGREGGDTETATDAGGREGGDTETATDAGGREGGDTETATDAGGREGGDTETATDAGGREGGD', b'0'),
(61, 1, 8, '2017-05-31 08:31:19', 'hoy c ðŸ˜‚', b'0'),
(62, 1, 8, '2017-05-31 08:32:20', 'hoy agay', b'0'),
(63, 1, 8, '2017-05-31 08:35:56', 'jkbkb ', b'0'),
(64, 1, 8, '2017-05-31 08:38:07', 'what?', b'0'),
(65, 1, 8, '2017-05-31 08:41:31', 'o nagyon?ðŸ˜', b'0'),
(66, 1, 8, '2017-05-31 08:43:33', 'ngayon ano na?ðŸ˜ˆ', b'0'),
(67, 1, 9, '2017-05-31 08:44:20', 'Ang dami mong tinatanong... \ngrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrðŸ˜¡ðŸ˜¡ðŸ˜¡ðŸ˜¡ðŸ˜¡ðŸ˜¡rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr', b'0'),
(68, 1, 8, '2017-05-31 08:47:03', 'na cðŸ˜\nðŸ˜„ðŸ˜…', b'0'),
(69, 1, 9, '2017-05-31 08:47:28', 'ano nanaman?ðŸ˜’', b'0'),
(70, 2, 8, '2017-05-31 08:48:16', 'halla si yeyeðŸ˜‚', b'0'),
(71, 2, 10, '2017-05-31 08:48:51', 'eeetttooðŸ˜¤', b'0'),
(72, 2, 8, '2017-05-31 08:50:34', 'kumusta sila tita tet, tito shi, at kuya kat?ðŸ˜…', b'0'),
(73, 2, 10, '2017-05-31 08:50:50', 'eeettttoo ang gullloooðŸ˜“', b'0'),
(74, 2, 8, '2017-05-31 08:51:54', 'vakkeett vaa?ðŸ˜‰ðŸ˜ˆ', b'0'),
(75, 2, 10, '2017-05-31 08:52:15', 'pano mo ginawa to?', b'0'),
(76, 2, 8, '2017-05-31 08:53:08', 'chamba lang.... chamba..\nchamba talagaðŸ˜»', b'0'),
(77, 2, 8, '2017-05-31 08:53:46', 'ako ay\nmay \nlobo\nlumipad', b'0'),
(79, 2, 8, '2017-06-01 11:14:38', 'ã¦ã«ã—ãŸåœ°å›³ã‚å¤ããªãƒ†ã‚¤ã‚¯ã°ã‹ã‚ŠðŸ˜°', b'0'),
(80, 1, 9, '2017-06-02 14:52:43', 'bago profile pic ko ðŸ˜œðŸ˜›', b'0'),
(81, 1, 8, '2017-06-02 14:53:11', 'wow.. rukawa ðŸ˜€', b'0'),
(82, 1, 8, '2017-06-05 11:03:01', 'kumusuta ka?ðŸ™…', b'0'),
(83, 1, 9, '2017-06-05 11:05:07', 'ok lang sirs..ðŸ˜‚', b'0'),
(84, 1, 8, '2017-06-05 11:05:25', 'maniwala ka pal!ðŸ˜¹ðŸ˜»', b'0'),
(85, 1, 9, '2017-06-05 11:06:16', 'baklierðŸ˜ˆ', b'0'),
(86, 6, 34, '2017-06-07 15:37:07', 'How are u?ðŸ˜ˆ', b'0'),
(89, 3, 9, '2017-06-11 04:26:31', 'ano ba!ðŸ˜‘', b'0'),
(90, 3, 10, '2017-06-11 04:27:57', 'ikaw nauna', b'0'),
(91, 3, 9, '2017-06-11 04:28:52', 'ðŸ˜†ðŸ˜‡ðŸ˜‡ðŸ˜ðŸ˜ŽðŸ˜ðŸ˜ˆðŸ˜»ðŸ˜‡', b'0'),
(92, 3, 10, '2017-06-11 04:29:14', 'ðŸ˜ˆðŸ˜ŽðŸ˜ŽðŸ˜‡ðŸ˜', b'0'),
(93, 3, 9, '2017-06-11 04:29:31', 'glo mo', b'0'),
(94, 2, 10, '2017-06-11 04:33:47', 'ano k\na ba\ndyanðŸ˜Š', b'0'),
(95, 1, 8, '2017-06-27 14:37:01', 'hello', b'0'),
(96, 1, 9, '2017-06-27 14:37:47', 'what?', b'0'),
(97, 1, 8, '2017-06-27 14:38:20', 'æ‰‹ã«ã—ãŸ', b'0'),
(98, 1, 8, '2017-06-27 14:38:47', 'åœ°å›³', b'0'),
(99, 1, 8, '2017-06-27 14:39:11', 'åœ°å›³ã¯ðŸ˜‰', b'0'),
(100, 1, 8, '2017-06-27 14:40:09', 'what is this?', b'0'),
(101, 1, 8, '2017-06-27 22:27:33', 'ðŸ˜‚', b'0'),
(102, 1, 8, '2017-06-27 22:28:09', 'æ‰‹ã«ã—ãŸåœ°å›³ã‚ðŸ˜ˆðŸ˜Š', b'0'),
(103, 1, 8, '2017-06-27 22:28:18', 'ðŸ˜‚ðŸ˜‚ðŸ˜‚', b'0'),
(104, 1, 8, '2017-06-27 22:28:23', 'ðŸ˜ˆ', b'0'),
(105, 1, 8, '2017-06-27 22:28:34', 'what are yuoðŸ˜ˆðŸ˜€', b'0'),
(106, 7, 38, '2017-07-04 22:44:24', 'heyðŸ™…ðŸ˜•ðŸ˜‡ðŸ˜‚ðŸ˜ðŸ˜”ðŸ˜ˆðŸ˜³ðŸ˜´ðŸ˜¶ðŸ˜¹ðŸ˜»ðŸ˜¿', b'1'),
(107, 1, 9, '2017-07-17 19:03:40', 'we?ðŸ˜‚', b'0'),
(108, 1, 8, '2017-08-17 00:30:25', 'ayaw mo nga', b'0'),
(109, 8, 8, '2017-08-18 04:45:17', 'Musta Big Shot John?ðŸ˜ˆ', b'1'),
(110, 9, 8, '2017-09-13 03:20:32', 'æ‰‹ã«ã—ãŸ', b'1'),
(111, 2, 8, '2017-09-13 03:27:13', 'ðŸ˜ˆðŸ˜ðŸ˜ðŸ˜€ðŸ˜€ðŸ˜€', b'1'),
(112, 2, 8, '2017-09-13 03:27:36', 'ã¦ã«ã—ãŸåœ°å›³ã‚', b'1'),
(113, 2, 8, '2017-09-13 03:27:54', 'åœ°å›³ã‚ðŸ˜¡', b'1'),
(114, 2, 8, '2017-09-13 03:28:56', 'Ñ‹Ð´Ñ„Ð²Ð»Ñˆ Ñ‹Ñ‚Ñ‰Ñ†', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `ChatMsgSeenLog`
--

CREATE TABLE `ChatMsgSeenLog` (
  `chat_msg_id` int(12) NOT NULL,
  `seen_by_user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ChatMsgSeenLog`
--

INSERT INTO `ChatMsgSeenLog` (`chat_msg_id`, `seen_by_user_id`) VALUES
(33, 8),
(33, 9),
(34, 8),
(34, 9),
(35, 8),
(35, 9),
(36, 8),
(36, 9),
(37, 8),
(37, 9),
(38, 8),
(38, 9),
(39, 9),
(39, 10),
(40, 9),
(40, 10),
(41, 8),
(41, 9),
(42, 8),
(42, 9),
(43, 8),
(43, 9),
(44, 8),
(44, 9),
(46, 8),
(46, 9),
(47, 8),
(47, 9),
(48, 8),
(48, 9),
(49, 8),
(49, 9),
(50, 8),
(50, 9),
(51, 8),
(51, 9),
(52, 8),
(52, 9),
(53, 8),
(53, 9),
(54, 8),
(54, 9),
(55, 8),
(55, 9),
(56, 8),
(56, 9),
(57, 8),
(57, 9),
(58, 8),
(58, 9),
(59, 8),
(59, 9),
(60, 8),
(60, 9),
(61, 8),
(61, 9),
(62, 8),
(62, 9),
(63, 8),
(63, 9),
(64, 8),
(64, 9),
(65, 8),
(65, 9),
(66, 8),
(66, 9),
(67, 8),
(67, 9),
(68, 8),
(68, 9),
(69, 8),
(69, 9),
(70, 8),
(70, 10),
(71, 8),
(71, 10),
(72, 8),
(72, 10),
(73, 8),
(73, 10),
(74, 8),
(74, 10),
(75, 8),
(75, 10),
(76, 8),
(76, 10),
(77, 8),
(77, 10),
(79, 8),
(79, 10),
(80, 8),
(80, 9),
(81, 8),
(81, 9),
(82, 8),
(82, 9),
(83, 8),
(83, 9),
(84, 8),
(84, 9),
(85, 8),
(85, 9),
(86, 8),
(86, 34),
(89, 9),
(89, 10),
(90, 9),
(90, 10),
(91, 9),
(91, 10),
(92, 9),
(92, 10),
(93, 9),
(93, 10),
(94, 8),
(94, 10),
(95, 8),
(95, 9),
(96, 8),
(96, 9),
(97, 8),
(97, 9),
(98, 8),
(98, 9),
(99, 8),
(99, 9),
(100, 8),
(100, 9),
(101, 8),
(101, 9),
(102, 8),
(102, 9),
(103, 8),
(103, 9),
(104, 8),
(104, 9),
(105, 8),
(105, 9),
(106, 38),
(107, 8),
(107, 9),
(108, 8),
(108, 9),
(109, 8),
(110, 8),
(111, 8),
(112, 8),
(113, 8),
(114, 8);

-- --------------------------------------------------------

--
-- Table structure for table `ChatThread`
--

CREATE TABLE `ChatThread` (
  `id` int(11) NOT NULL,
  `initiator_user_id` int(11) NOT NULL,
  `responder_user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ChatThread`
--

INSERT INTO `ChatThread` (`id`, `initiator_user_id`, `responder_user_id`) VALUES
(1, 8, 9),
(2, 8, 10),
(3, 9, 10),
(4, 9, 15),
(5, 8, 15),
(6, 34, 8),
(7, 8, 38),
(8, 8, 13),
(9, 8, 87);

-- --------------------------------------------------------

--
-- Table structure for table `Country`
--

CREATE TABLE `Country` (
  `id` int(3) NOT NULL,
  `code` varchar(2) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Country`
--

INSERT INTO `Country` (`id`, `code`, `name`) VALUES
(1, 'CA', 'Canada'),
(2, 'UA', 'Ukraine'),
(3, 'US', 'USA'),
(4, 'GB', 'United Kingdom'),
(5, 'CN', 'China'),
(6, 'JP', 'Japan'),
(7, 'PH', 'Philippines');

-- --------------------------------------------------------

--
-- Table structure for table `Friendship`
--

CREATE TABLE `Friendship` (
  `user_id` int(11) NOT NULL,
  `friend_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Friendship`
--

INSERT INTO `Friendship` (`user_id`, `friend_id`) VALUES
(8, 9),
(8, 10),
(8, 13),
(8, 87),
(9, 8),
(10, 9);

-- --------------------------------------------------------

--
-- Table structure for table `FriendshipNotifications`
--

CREATE TABLE `FriendshipNotifications` (
  `notified_user_id` int(11) NOT NULL,
  `notifier_user_id` int(11) NOT NULL,
  `notification_type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Invoice`
--

CREATE TABLE `Invoice` (
  `id` varchar(50) NOT NULL,
  `seller_user_id` int(11) NOT NULL,
  `buyer_user_id` int(11) NOT NULL,
  `ship_from_address_id` int(11) NOT NULL,
  `ship_to_address_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Invoice`
--

INSERT INTO `Invoice` (`id`, `seller_user_id`, `buyer_user_id`, `ship_from_address_id`, `ship_to_address_id`) VALUES
('0b56a686662b254fc800e3a0cbf74017', 8, 10, 23, 61),
('23d2c27b1c8a9f0bf57b459ce9a94c3d', 8, 10, 23, 64),
('42b41e1a94ab2d3680382bc6af08d8e2', 8, 10, 23, 58),
('4e8ccffc4552f618e19d268f8c67bace', 8, 9, 23, 78),
('5952de4233f16', 8, 9, 23, 81),
('5952f14093643', 8, 9, 23, 82),
('5952f4c9c20bd', 8, 9, 23, 83),
('5952f5c7f157f', 8, 9, 23, 84),
('5952f6942b899', 8, 9, 23, 85),
('5952f752e4da2', 8, 9, 23, 86),
('5952f85656679', 8, 9, 23, 87),
('5952f92308cc8', 8, 9, 23, 88),
('5952fafa186f1', 8, 9, 23, 89),
('5952fba1cfc7e', 8, 9, 23, 90),
('5958657b467ae', 8, 9, 23, 91),
('6a3117b00046bc17d068665484532d08', 8, 9, 23, 80),
('6df65bd51d37277ff23aeef2960db361', 8, 10, 23, 50),
('752f8ed824b748c585b7274eec6323c4', 8, 10, 23, 53),
('7df58cb10d787e6c43703ee007bec9be', 8, 9, 23, 79),
('85a13ebd83bc4cd7426ab859c86e64f7', 8, 10, 23, 60),
('89bb6dbf773dbd28deff1b97988c254e', 8, 10, 23, 48),
('8e4a8e85c118872117263ebbe89f206d', 8, 9, 23, 77),
('90032f723a62002fff6893783ead6c25', 8, 10, 23, 57),
('92cf3185f21d98dc25df881ea7df6e9b', 8, 10, 23, 54),
('955c4a6666b9a13d1f37fb2e09a104f0', 8, 9, 23, 76),
('989183c5372c281377b7031f63ecc436', 8, 10, 23, 49),
('d37dd57d34051a0b68891a067fbc5547', 8, 10, 23, 63),
('dc4079d6e70f03118d62841e069bec0d', 8, 10, 23, 51),
('e66ba840a6ff7f16c329ea7fc5fa3499', 8, 10, 23, 56),
('e9a8c6ba61680c834050b8044526e029', 8, 10, 23, 59),
('eea200a5c8e20c2c901b617aa6c7fee0', 8, 9, 23, 52),
('f2df2fc2d8b162e204f365582f300ff5', 8, 10, 23, 55),
('f78b0cbfbadfffa5b0da847e8fbbe559', 8, 10, 23, 62);

-- --------------------------------------------------------

--
-- Table structure for table `InvoiceItem`
--

CREATE TABLE `InvoiceItem` (
  `id` int(12) NOT NULL,
  `invoice_id` varchar(50) NOT NULL,
  `store_item_id` int(11) NOT NULL,
  `price_per_item` float NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `InvoiceItem`
--

INSERT INTO `InvoiceItem` (`id`, `invoice_id`, `store_item_id`, `price_per_item`, `quantity`) VALUES
(34, '89bb6dbf773dbd28deff1b97988c254e', 2, 5.99, 1),
(35, '89bb6dbf773dbd28deff1b97988c254e', 9, 449.95, 1),
(36, '89bb6dbf773dbd28deff1b97988c254e', 17, 249.99, 2),
(37, '989183c5372c281377b7031f63ecc436', 2, 5.99, 1),
(38, '989183c5372c281377b7031f63ecc436', 9, 449.95, 1),
(39, '989183c5372c281377b7031f63ecc436', 17, 249.99, 1),
(40, '6df65bd51d37277ff23aeef2960db361', 2, 5.99, 1),
(41, '6df65bd51d37277ff23aeef2960db361', 9, 449.95, 1),
(42, '6df65bd51d37277ff23aeef2960db361', 17, 249.99, 1),
(43, 'dc4079d6e70f03118d62841e069bec0d', 2, 5.99, 3),
(44, 'dc4079d6e70f03118d62841e069bec0d', 17, 249.99, 1),
(45, 'eea200a5c8e20c2c901b617aa6c7fee0', 2, 5.99, 4),
(46, 'eea200a5c8e20c2c901b617aa6c7fee0', 9, 449.95, 1),
(47, 'eea200a5c8e20c2c901b617aa6c7fee0', 17, 249.99, 1),
(48, '752f8ed824b748c585b7274eec6323c4', 3, 21, 1),
(49, '92cf3185f21d98dc25df881ea7df6e9b', 9, 449.95, 1),
(50, '92cf3185f21d98dc25df881ea7df6e9b', 17, 249.99, 1),
(51, 'f2df2fc2d8b162e204f365582f300ff5', 9, 449.95, 1),
(52, 'f2df2fc2d8b162e204f365582f300ff5', 17, 249.99, 1),
(53, 'e66ba840a6ff7f16c329ea7fc5fa3499', 9, 449.95, 1),
(54, 'e66ba840a6ff7f16c329ea7fc5fa3499', 17, 249.99, 1),
(55, '90032f723a62002fff6893783ead6c25', 9, 449.95, 1),
(56, '90032f723a62002fff6893783ead6c25', 17, 249.99, 1),
(57, '42b41e1a94ab2d3680382bc6af08d8e2', 9, 449.95, 1),
(58, '42b41e1a94ab2d3680382bc6af08d8e2', 17, 249.99, 1),
(59, 'e9a8c6ba61680c834050b8044526e029', 9, 449.95, 1),
(60, 'e9a8c6ba61680c834050b8044526e029', 17, 249.99, 1),
(61, '85a13ebd83bc4cd7426ab859c86e64f7', 9, 449.95, 1),
(62, '85a13ebd83bc4cd7426ab859c86e64f7', 17, 249.99, 1),
(63, '0b56a686662b254fc800e3a0cbf74017', 9, 449.95, 1),
(64, '0b56a686662b254fc800e3a0cbf74017', 17, 249.99, 1),
(65, 'f78b0cbfbadfffa5b0da847e8fbbe559', 9, 449.95, 1),
(66, 'f78b0cbfbadfffa5b0da847e8fbbe559', 17, 249.99, 1),
(67, 'd37dd57d34051a0b68891a067fbc5547', 9, 449.95, 1),
(68, 'd37dd57d34051a0b68891a067fbc5547', 17, 249.99, 1),
(69, '23d2c27b1c8a9f0bf57b459ce9a94c3d', 17, 249.99, 1),
(70, '955c4a6666b9a13d1f37fb2e09a104f0', 9, 449.95, 1),
(71, '8e4a8e85c118872117263ebbe89f206d', 9, 449.95, 1),
(72, '4e8ccffc4552f618e19d268f8c67bace', 17, 249.99, 1),
(73, '7df58cb10d787e6c43703ee007bec9be', 17, 249.99, 1),
(74, '6a3117b00046bc17d068665484532d08', 17, 249.99, 1),
(75, '5952de4233f16', 17, 249.99, 1),
(76, '5952f14093643', 2, 5.99, 1),
(77, '5952f4c9c20bd', 2, 5.99, 1),
(78, '5952f5c7f157f', 2, 5.99, 1),
(79, '5952f6942b899', 2, 5.99, 1),
(80, '5952f752e4da2', 2, 5.99, 1),
(81, '5952f85656679', 2, 5.99, 1),
(82, '5952f92308cc8', 2, 5.99, 1),
(83, '5952fafa186f1', 2, 5.99, 1),
(84, '5952fba1cfc7e', 17, 249.99, 1),
(85, '5958657b467ae', 17, 249.99, 1);

-- --------------------------------------------------------

--
-- Table structure for table `InvoiceItemStatus`
--

CREATE TABLE `InvoiceItemStatus` (
  `id` int(2) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `InvoiceItemStatus`
--

INSERT INTO `InvoiceItemStatus` (`id`, `name`, `description`) VALUES
(1, 'payment being processed', NULL),
(2, 'refunded', NULL),
(3, 'on-hold', NULL),
(4, 'being shipped', NULL),
(5, 'delivered', NULL),
(6, 'being applied for refund', NULL),
(7, 'ok\'d by seller to be refunded', NULL),
(8, 'finalized', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `InvoiceItemStatusRecord`
--

CREATE TABLE `InvoiceItemStatusRecord` (
  `id` int(12) NOT NULL,
  `invoice_item_id` int(12) NOT NULL,
  `invoice_item_status_id` int(2) NOT NULL,
  `status_start_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `InvoiceItemStatusRecord`
--

INSERT INTO `InvoiceItemStatusRecord` (`id`, `invoice_item_id`, `invoice_item_status_id`, `status_start_date`) VALUES
(8, 40, 1, '2017-05-02 07:04:55'),
(9, 41, 1, '2017-05-02 07:04:55'),
(10, 42, 1, '2017-05-02 07:04:55'),
(11, 43, 1, '2017-05-03 04:01:57'),
(12, 44, 1, '2017-05-03 04:01:57'),
(17, 45, 1, '2017-05-04 08:28:46'),
(18, 46, 1, '2017-05-04 08:28:46'),
(19, 47, 1, '2017-05-04 08:28:46'),
(65, 48, 1, '2017-05-08 19:43:21'),
(77, 48, 4, '2017-05-14 02:11:32'),
(78, 44, 5, '2017-05-14 02:11:42'),
(79, 44, 6, '2017-05-14 02:12:17'),
(80, 49, 1, '2017-05-21 04:26:54'),
(81, 50, 1, '2017-05-21 04:26:54'),
(82, 51, 1, '2017-05-21 04:46:39'),
(83, 52, 1, '2017-05-21 04:46:39'),
(84, 53, 1, '2017-05-21 04:46:52'),
(85, 54, 1, '2017-05-21 04:46:52'),
(86, 55, 1, '2017-05-21 04:50:33'),
(87, 56, 1, '2017-05-21 04:50:33'),
(88, 57, 1, '2017-05-21 04:51:40'),
(89, 58, 1, '2017-05-21 04:51:40'),
(90, 59, 1, '2017-05-21 04:51:42'),
(91, 60, 1, '2017-05-21 04:51:42'),
(92, 61, 1, '2017-05-21 04:51:57'),
(93, 62, 1, '2017-05-21 04:51:57'),
(94, 63, 1, '2017-05-21 04:51:59'),
(95, 64, 1, '2017-05-21 04:51:59'),
(96, 65, 1, '2017-05-21 04:52:17'),
(97, 66, 1, '2017-05-21 04:52:17'),
(98, 67, 1, '2017-05-21 04:52:26'),
(99, 68, 1, '2017-05-21 04:52:26'),
(100, 65, 5, '2017-05-21 08:42:55'),
(101, 66, 4, '2017-05-21 08:43:05'),
(102, 66, 5, '2017-05-21 08:50:00'),
(103, 66, 6, '2017-05-21 08:50:40'),
(104, 66, 7, '2017-05-21 08:51:19'),
(105, 69, 1, '2017-05-28 10:23:47'),
(106, 45, 4, '2017-06-12 12:10:02'),
(107, 70, 1, '2017-06-27 15:32:19'),
(108, 71, 1, '2017-06-27 16:48:37'),
(109, 72, 1, '2017-06-27 16:53:22'),
(110, 73, 1, '2017-06-27 16:55:49'),
(111, 74, 1, '2017-06-27 16:57:11'),
(112, 75, 1, '2017-06-27 18:38:17'),
(113, 75, 4, '2017-06-27 18:42:26'),
(114, 76, 1, '2017-06-27 19:59:16'),
(115, 77, 1, '2017-06-27 20:14:40'),
(116, 78, 1, '2017-06-27 20:18:30'),
(117, 79, 1, '2017-06-27 20:21:52'),
(118, 80, 1, '2017-06-27 20:25:05'),
(119, 81, 1, '2017-06-27 20:29:25'),
(120, 82, 1, '2017-06-27 20:32:48'),
(121, 83, 1, '2017-06-27 20:40:40'),
(122, 84, 1, '2017-06-27 20:43:31'),
(123, 84, 4, '2017-06-27 23:43:48'),
(124, 84, 5, '2017-06-27 23:45:12'),
(125, 84, 6, '2017-06-27 23:48:30'),
(126, 84, 7, '2017-06-28 00:14:09'),
(127, 85, 1, '2017-07-01 23:18:18'),
(128, 85, 4, '2017-07-01 23:20:19'),
(129, 75, 5, '2017-07-18 01:29:09'),
(130, 76, 3, '2017-07-18 01:30:59'),
(131, 76, 4, '2017-07-18 01:34:53'),
(132, 76, 5, '2017-07-18 01:36:26'),
(133, 78, 3, '2017-07-18 04:54:24'),
(134, 85, 8, '2017-07-18 05:30:57'),
(135, 79, 4, '2017-07-18 20:02:56'),
(136, 82, 3, '2017-07-18 22:02:11'),
(137, 82, 4, '2017-07-18 22:02:48'),
(138, 82, 5, '2017-07-18 22:04:06'),
(139, 82, 8, '2017-07-18 22:04:44'),
(140, 75, 8, '2017-07-18 22:39:37'),
(141, 77, 3, '2017-07-18 22:48:36'),
(142, 78, 4, '2017-07-18 22:49:07'),
(143, 77, 4, '2017-07-19 00:29:15'),
(144, 77, 5, '2017-07-19 00:29:37'),
(145, 77, 8, '2017-07-19 00:30:10'),
(146, 78, 5, '2017-07-19 00:33:37'),
(147, 79, 5, '2017-07-19 00:39:14'),
(148, 79, 8, '2017-07-19 00:42:00'),
(149, 80, 3, '2017-07-19 00:42:31'),
(150, 80, 4, '2017-07-19 00:43:22'),
(151, 80, 5, '2017-07-19 00:43:35'),
(152, 80, 8, '2017-07-19 00:44:18'),
(153, 81, 3, '2017-07-19 00:57:53'),
(154, 81, 4, '2017-07-19 00:58:32'),
(155, 81, 5, '2017-07-19 01:01:03'),
(156, 81, 8, '2017-07-19 01:01:13'),
(157, 83, 3, '2017-07-19 01:01:59'),
(158, 83, 4, '2017-07-19 01:02:17'),
(159, 76, 8, '2017-07-19 01:03:13'),
(160, 83, 5, '2017-07-19 01:03:27'),
(161, 83, 8, '2017-07-19 01:04:16'),
(162, 72, 3, '2017-07-19 02:55:36'),
(163, 72, 4, '2017-07-19 03:05:19'),
(164, 72, 5, '2017-07-19 03:05:47'),
(165, 72, 8, '2017-07-19 03:05:57'),
(166, 74, 3, '2017-07-19 03:06:25'),
(167, 74, 4, '2017-07-19 03:06:36'),
(168, 78, 8, '2017-09-08 09:44:44'),
(169, 73, 3, '2017-09-11 17:44:40'),
(170, 73, 4, '2017-09-11 17:45:18'),
(171, 73, 5, '2017-09-11 17:46:58'),
(172, 45, 5, '2017-09-11 20:00:43'),
(173, 46, 3, '2017-09-11 20:01:07'),
(174, 46, 4, '2017-09-11 20:01:18');

-- --------------------------------------------------------

--
-- Table structure for table `ItemXTypes`
--

CREATE TABLE `ItemXTypes` (
  `id` int(3) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ItemXTypes`
--

INSERT INTO `ItemXTypes` (`id`, `name`) VALUES
(3, 'photo'),
(1, 'post'),
(2, 'video');

-- --------------------------------------------------------

--
-- Table structure for table `Likes`
--

CREATE TABLE `Likes` (
  `id` int(9) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Likes`
--

INSERT INTO `Likes` (`id`, `name`) VALUES
(1, 'basketball'),
(2, 'pingpong'),
(3, 'computer'),
(4, 'soccer'),
(5, 'volley'),
(6, 'tv'),
(7, 'fb'),
(8, 'twitter'),
(9, 'puta'),
(10, 'cunt'),
(11, 'pussy'),
(12, 'cockY'),
(13, 'Karate'),
(14, 'PS4'),
(15, 'Call of Duty'),
(16, 'Xbox One'),
(17, 'Reading horror books'),
(18, 'munching candies'),
(19, 'Zen budhi zum'),
(20, 'mac'),
(21, 'windows'),
(22, 'v'),
(23, 'nothing'),
(24, 'mangga'),
(25, 'bask'),
(26, 'crazy'),
(27, 'tae'),
(28, 'badminton'),
(29, 'laundry'),
(30, 'putangina'),
(31, 'gae'),
(32, 'fukc'),
(33, 'gh'),
(34, 'facebook'),
(35, 'x'),
(36, 'laundRt'),
(37, 'sepaktakraw'),
(38, 'archery'),
(39, 'tumae'),
(40, 'magputa'),
(41, 'kumain ng popcorn'),
(42, 'magps3');

-- --------------------------------------------------------

--
-- Table structure for table `MyStoreItems`
--

CREATE TABLE `MyStoreItems` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` float NOT NULL,
  `description` varchar(3000) NOT NULL,
  `photo_address` varchar(1000) NOT NULL,
  `quantity` int(11) NOT NULL,
  `mass` float DEFAULT NULL,
  `length` float DEFAULT NULL,
  `width` float DEFAULT NULL,
  `height` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `MyStoreItems`
--

INSERT INTO `MyStoreItems` (`id`, `user_id`, `name`, `price`, `description`, `photo_address`, `quantity`, `mass`, `length`, `width`, `height`) VALUES
(1, 8, 'ASUS Gaming PC', 1099.97, 'CPU: 4.4GHz Quad Core Intel Core i7 Devil\'s Canyon,\r\n\r\nMotherBoard: MSI Gaming 5 Series,\r\n\r\nMemory: 16GB Kingston HyperX,\r\n\r\nSDD: 512GB Samsung 850 Pro\r\n                                                                                                                                                                                                                                ', 'https://cdn2.pcadvisor.co.uk/cmsdata/reviews/3605095/ViBox_Wildfire_gaming_PC.jpg\r\n\r\n                                                                                                                                                    ', 0, 529.09, 24.88, 12, 24.14),
(2, 8, 'Home-Made Cute Shirt', 5.99, 'Anime-like shirt.<br>\r\n2 shirts for only $4.99.<br>\r\nNot only will you get an awesome shirt, but you\'ll also support me..<br>\r\nThank you so much :)                                                                                                                ', 'http://pre13.deviantart.net/8eb1/th/pre/f/2014/171/b/c/gumball_and_darwin_homemade_t_shirts_by_gumball28-d7n6iba.jpg                                                                                                        ', 3, 3.53, 8, 6, 0.5),
(3, 8, 'File Cabinet Drawer', 21, 'Awesome file drawers.<br>\r\nSlightly worn out.<br>\r\nShips in 2 days...                ', 'http://nebula.wsimg.com/obj/N0E0RkZFMTdEMjI2NkY3REM0NDQ6MWRhZTkzZGQ3YTVmOWU1NWEzZmRjZGIzYjQxYjg0MjI6Ojo6OjA=                    ', 2, 1440, 40, 25, 55),
(4, 9, 'Pink HP Laptop', 430, '2-year old HP laptop.<br>\r\nMemory: 4GB<br>\r\nCPU: 2,7GHz Dual Core Intel Core i3<br>\r\nSSD: 512GB Corsair SSD                ', 'http://idg.bg/test/pcw/2014/9/30/23085-HP_Stream-1.jpg                ', 2, 64, 15, 11, 2),
(5, 9, '10 foot Teddy Bear', 99, '10 foot Teddy Bear. Fluffy.<br>\r\nCute<br>\r\nSuper huggable.<br>\r\nWho say\'s we need pillows to sleep?                                                                ', 'http://g02.a.alicdn.com/kf/HTB122WxKFXXXXcmXFXXq6xXFXXX9/stuffed-animal-80cm-cute-font-b-teddy-b-font-bear-stripes-design-a-pair-lovers-bear.jpg                                                               ', 1, 1120, 124, 30, 40),
(9, 8, 'Bose Headphones', 449.95, 'Good quiet comfort headphones.<br>\r\nYou\'ll definitely NOT miss out the world around you.<br>\r\n<a href=\'http://www.nba.com\'>Check it out</a>                                                                                \r\n<h2>The BOSE</h2>', 'http://bpc.h-cdn.co/assets/16/30/980x490/landscape-1469479026-bose-qc35-headphones-promo-2.jpg                                                                         ', 1, 5, 9, 7, 3),
(10, 10, 'Bucad-Javier Dawes Place Dental - Oral-B Toothbrush', 19.49, 'The predecessor of the toothbrush is the chew stick. Chew sticks were twigs with frayed ends used to brush the teeth while the other end was used as a toothpick. The earliest chew sticks were discovered in Babylonia in 3500 BC,[4] an Egyptian tomb dating from 3000 BC,[3] and mentioned in Chinese records dating from 1600 BC. The Greeks and Romans used toothpicks to clean their teeth and toothpick like twigs have been excavated in Qin Dynasty tombs.[4] Chew sticks remain common in Africa[5] the rural Southern United States[3] and in the Islamic world the use of chewing stick Miswak is considered a pious action and has been prescribed to be used before every prayer five times a day.[6] Miswaks have been used by Muslims since 7th century.                                                                ', 'http://thesweethome.com/wp-content/uploads/sites/3/2013/05/02-electric-toothbrushes1.jpg                                                                ', 15, 1, 8, 3, 2),
(16, 8, 'sdaf', 0.01, 'asdf', 'asdf', 1, 0.01, 0.01, 0.01, 0.01),
(17, 8, 'Sony PS4 Slim', 249.99, 'The PlayStation 4 (abbreviated as PS4) is a home video game console developed by Sony Computer Entertainment. Announced as the successor to the PlayStation 3 during a press conference on February 20, 2013, it was launched on November 15 in North America, November 29 in Europe, South America and Australia, and February 22, 2014, in Japan. It competes with Nintendo\'s Wii U and Microsoft\'s Xbox One, as part of the eighth generation of video game consoles.', 'https://cnet4.cbsistatic.com/img/TLqceBxnUV960hnSRwgD0R05vlA=/1170x0/2013/11/11/4b0cb750-6788-11e3-846b-14feb5ca9861/Sony_PS4_35618167_01.jpg        ', 0, 96, 15, 15, 6),
(18, 15, 'Nike Run', 109.49, 'Nike running shoes.', 'http://www.ladyfootlocker.com/ns/as/lflbp110616a-shoes.jpg', 7, 109, 12, 6, 6);

-- --------------------------------------------------------

--
-- Table structure for table `MyVideos`
--

CREATE TABLE `MyVideos` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `embed_code` varchar(1000) NOT NULL,
  `rating` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `MyVideos`
--

INSERT INTO `MyVideos` (`id`, `user_id`, `title`, `embed_code`, `rating`) VALUES
(1, 8, 'Hello - Adele Cover', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/Rn00vAlcnR4\" frameborder=\"0\" allowfullscreen></iframe>', 8),
(2, 8, 'Adele - Hello (Emblem3 Cover)', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/DDGdEp1fWQU\" frameborder=\"0\" allowfullscreen></iframe>', 7),
(3, 8, 'Kailan', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/ZUeLmDsLw5s\" frameborder=\"0\" allowfullscreen></iframe>', 0),
(4, 8, 'Hello by Leroy Sanchez', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/vlZ9kjCrGJw\" frameborder=\"0\" allowfullscreen></iframe>', 0),
(5, 8, 'When We Were Young - Adele Cover', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/ao7Et8ZqXfs\" frameborder=\"0\" allowfullscreen></iframe>', 0),
(6, 8, 'James Arthur - When we were young (Adele cover) live acoustic session', '<div style=\"position:relative;height:0;padding-bottom:56.25%\"><iframe src=\"https://www.youtube.com/embed/SJUPDs5VLsk?ecver=2\" width=\"640\" height=\"360\" frameborder=\"0\" style=\"position:absolute;width:100%;height:100%;left:0\" allowfullscreen></iframe></div>', 0),
(7, 8, 'Celtics vs Bulls - Game 1', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/7qV3tKtqrNk\" frameborder=\"0\" allowfullscreen></iframe>', 7),
(8, 8, 'Bulls vs Jazz 1998 NBA Finals', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/530z-_yjdlU\" frameborder=\"0\" allowfullscreen></iframe>', 7),
(9, 10, 'Cavs vs Pacers - Game 2 - Kyrie the Giant', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/R7Ui_FnOPh8\" frameborder=\"0\" allowfullscreen></iframe>', 7),
(10, 8, 'Apple Pseudo-Values', '<iframe frameborder=\"0\" width=\"480\" height=\"270\" src=\"//www.dailymotion.com/embed/video/x2ajhg2\" allowfullscreen></iframe>', 7),
(11, 10, 'Celtics vs Cavaliers - Game 1 - ECF 2017', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/k33tVinSCJo?rel=0&amp;showinfo=0\" frameborder=\"0\" allowfullscreen></iframe>', 7),
(12, 8, 'Duterte - Hoy, istorya lang yan.. Maniwala ka pala..?', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/agWZR-fo64w?rel=0&amp;showinfo=0\" frameborder=\"0\" allowfullscreen></iframe>', 7),
(14, 8, 'Transformers', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/6Vtf0MszgP8\" frameborder=\"0\" allowfullscreen></iframe>', 7),
(15, 8, 'NBA Finals 2008 - Game 4', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/cmWxB8ASxCQ\" frameborder=\"0\" allowfullscreen></iframe>', 7),
(16, 8, '1993 NBA Final: Chicago Bulls vs Phoenix Suns Game 6', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/Dz16voEsKOo\" frameborder=\"0\" allowfullscreen></iframe>', 7),
(17, 8, 'Lover Yourself - Justin Bieber', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/oyEuk8j8imI?rel=0', 7);

-- --------------------------------------------------------

--
-- Table structure for table `Notifications`
--

CREATE TABLE `Notifications` (
  `id` int(14) NOT NULL,
  `notified_user_id` int(11) NOT NULL,
  `notifier_user_id` int(11) NOT NULL,
  `notification_msg_id` int(3) NOT NULL,
  `initiation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Notifications`
--

INSERT INTO `Notifications` (`id`, `notified_user_id`, `notifier_user_id`, `notification_msg_id`, `initiation_date`, `is_deleted`) VALUES
(73, 9, 8, 1, '2017-07-18 04:54:24', b'1'),
(75, 9, 8, 1, '2017-07-18 05:30:57', b'1'),
(76, 9, 8, 1, '2017-07-18 20:02:56', b'1'),
(77, 9, 8, 1, '2017-07-18 22:02:11', b'1'),
(78, 9, 8, 1, '2017-07-18 22:02:48', b'1'),
(79, 9, 8, 1, '2017-07-18 22:04:06', b'1'),
(80, 9, 8, 1, '2017-07-18 22:04:44', b'1'),
(81, 9, 8, 1, '2017-07-18 22:39:37', b'1'),
(83, 9, 8, 1, '2017-07-18 22:48:36', b'1'),
(84, 9, 8, 1, '2017-07-18 22:49:07', b'1'),
(86, 9, 8, 1, '2017-07-19 00:29:15', b'1'),
(87, 9, 8, 1, '2017-07-19 00:29:37', b'1'),
(88, 9, 8, 1, '2017-07-19 00:30:10', b'1'),
(89, 9, 8, 1, '2017-07-19 00:33:37', b'1'),
(90, 9, 8, 1, '2017-07-19 00:39:14', b'1'),
(91, 9, 8, 1, '2017-07-19 00:42:00', b'1'),
(92, 9, 8, 1, '2017-07-19 00:42:31', b'1'),
(93, 9, 8, 1, '2017-07-19 00:43:22', b'1'),
(94, 9, 8, 1, '2017-07-19 00:43:35', b'1'),
(95, 9, 8, 1, '2017-07-19 00:44:18', b'1'),
(96, 9, 8, 1, '2017-07-19 00:57:53', b'1'),
(97, 9, 8, 1, '2017-07-19 00:58:32', b'1'),
(98, 9, 8, 1, '2017-07-19 01:01:03', b'1'),
(99, 9, 8, 1, '2017-07-19 01:01:13', b'1'),
(100, 9, 8, 1, '2017-07-19 01:01:59', b'1'),
(101, 9, 8, 1, '2017-07-19 01:02:17', b'1'),
(102, 9, 8, 1, '2017-07-19 01:03:13', b'1'),
(103, 9, 8, 1, '2017-07-19 01:03:27', b'1'),
(104, 9, 8, 1, '2017-07-19 01:04:16', b'1'),
(109, 9, 8, 1, '2017-07-19 02:55:36', b'1'),
(113, 9, 8, 1, '2017-07-19 03:05:19', b'1'),
(114, 9, 8, 1, '2017-07-19 03:05:47', b'1'),
(115, 9, 8, 1, '2017-07-19 03:05:57', b'1'),
(116, 9, 8, 1, '2017-07-19 03:06:25', b'1'),
(117, 9, 8, 1, '2017-07-19 03:06:36', b'0'),
(127, 13, 8, 3, '2017-07-30 22:01:41', b'0'),
(133, 87, 8, 3, '2017-08-30 05:04:02', b'0'),
(135, 10, 8, 3, '2017-09-01 01:00:38', b'0'),
(145, 9, 8, 1, '2017-09-08 09:44:44', b'0'),
(159, 8, 8, 4, '2017-09-09 18:39:17', b'0'),
(160, 8, 8, 4, '2017-09-09 18:42:55', b'0'),
(161, 8, 8, 4, '2017-09-09 19:12:51', b'0'),
(162, 8, 8, 4, '2017-09-09 19:14:46', b'0'),
(163, 8, 10, 4, '2017-09-09 19:14:25', b'0'),
(164, 8, 8, 4, '2017-09-09 19:18:50', b'0'),
(165, 8, 10, 4, '2017-09-09 19:19:04', b'0'),
(166, 8, 8, 4, '2017-09-09 19:23:42', b'0'),
(167, 8, 8, 4, '2017-09-09 19:45:58', b'0'),
(168, 8, 10, 4, '2017-09-09 19:24:36', b'0'),
(169, 8, 8, 4, '2017-09-09 19:50:06', b'0'),
(170, 8, 8, 4, '2017-09-10 05:48:00', b'1'),
(171, 8, 10, 4, '2017-09-10 05:14:46', b'1'),
(172, 8, 8, 4, '2017-09-10 06:10:54', b'1'),
(174, 8, 9, 4, '2017-09-11 10:54:45', b'0'),
(175, 8, 10, 4, '2017-09-11 10:43:41', b'0'),
(176, 9, 8, 4, '2017-09-11 17:17:21', b'0'),
(177, 9, 9, 4, '2017-09-10 06:57:48', b'0'),
(182, 9, 9, 4, '2017-09-10 10:11:06', b'0'),
(185, 8, 9, 4, '2017-09-11 10:52:52', b'0'),
(186, 8, 10, 4, '2017-09-11 10:40:46', b'0'),
(192, 9, 8, 1, '2017-09-11 17:44:40', b'1'),
(193, 9, 8, 1, '2017-09-11 17:45:18', b'1'),
(194, 9, 8, 1, '2017-09-11 17:46:58', b'1'),
(196, 9, 8, 1, '2017-09-11 20:00:43', b'1'),
(197, 9, 8, 1, '2017-09-11 20:01:07', b'1'),
(198, 9, 8, 1, '2017-09-11 20:01:18', b'0'),
(219, 9, 8, 3, '2017-09-12 21:57:05', b'0'),
(221, 8, 9, 3, '2017-09-12 21:58:28', b'0'),
(222, 9, 8, 4, '2017-09-12 21:58:57', b'0'),
(223, 9, 8, 4, '2017-09-12 21:59:10', b'0'),
(224, 9, 8, 4, '2017-09-12 22:00:14', b'0'),
(225, 8, 9, 4, '2017-09-13 02:41:29', b'0'),
(226, 9, 8, 4, '2017-09-13 02:46:48', b'0');

-- --------------------------------------------------------

--
-- Table structure for table `NotificationsFriendship`
--

CREATE TABLE `NotificationsFriendship` (
  `notification_id` int(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `NotificationsFriendship`
--

INSERT INTO `NotificationsFriendship` (`notification_id`) VALUES
(127),
(133),
(135),
(219),
(221);

-- --------------------------------------------------------

--
-- Table structure for table `NotificationsMsgs`
--

CREATE TABLE `NotificationsMsgs` (
  `id` int(3) NOT NULL,
  `msg` varchar(200) NOT NULL,
  `description` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `NotificationsMsgs`
--

INSERT INTO `NotificationsMsgs` (`id`, `msg`, `description`) VALUES
(1, '{NotifierUserName}’s Store updated the item {ProductName} you bought to status {StatusName}.', NULL),
(2, '{NotifierUserName} wants to follow you.', NULL),
(3, '{NotifierUserName} accepted your follow request.', NULL),
(4, '{UserName} rated your post {post_snippet} {rate_tag}', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `NotificationsMyShopping`
--

CREATE TABLE `NotificationsMyShopping` (
  `notification_id` int(13) NOT NULL,
  `invoice_item_id` int(12) NOT NULL,
  `invoice_item_status_record_id` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `NotificationsMyShopping`
--

INSERT INTO `NotificationsMyShopping` (`notification_id`, `invoice_item_id`, `invoice_item_status_record_id`) VALUES
(73, 78, 133),
(75, 85, 134),
(76, 79, 135),
(77, 82, 136),
(78, 82, 137),
(79, 82, 138),
(80, 82, 139),
(81, 75, 140),
(83, 77, 141),
(84, 78, 142),
(86, 77, 143),
(87, 77, 144),
(88, 77, 145),
(89, 78, 146),
(90, 79, 147),
(91, 79, 148),
(92, 80, 149),
(93, 80, 150),
(94, 80, 151),
(95, 80, 152),
(96, 81, 153),
(97, 81, 154),
(98, 81, 155),
(99, 81, 156),
(100, 83, 157),
(101, 83, 158),
(102, 76, 159),
(103, 83, 160),
(104, 83, 161),
(109, 72, 162),
(113, 72, 163),
(114, 72, 164),
(115, 72, 165),
(116, 74, 166),
(117, 74, 167),
(145, 78, 168),
(192, 73, 169),
(193, 73, 170),
(194, 73, 171),
(196, 45, 172),
(197, 46, 173),
(198, 46, 174);

-- --------------------------------------------------------

--
-- Table structure for table `NotificationsPost`
--

CREATE TABLE `NotificationsPost` (
  `notification_id` int(14) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `NotificationsRateableItem`
--

CREATE TABLE `NotificationsRateableItem` (
  `notification_id` int(14) NOT NULL,
  `rateable_item_id` int(12) NOT NULL,
  `rate_value` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `NotificationsRateableItem`
--

INSERT INTO `NotificationsRateableItem` (`notification_id`, `rateable_item_id`, `rate_value`) VALUES
(174, 31, 1),
(175, 31, 5),
(176, 35, 4),
(177, 37, 1),
(182, 32, 3),
(185, 39, 4),
(186, 39, -4),
(222, 37, 2),
(223, 32, 0),
(224, 34, -2),
(225, 40, -5),
(226, 41, 3);

-- --------------------------------------------------------

--
-- Table structure for table `NotificationTypes`
--

CREATE TABLE `NotificationTypes` (
  `id` int(2) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `NotificationTypes`
--

INSERT INTO `NotificationTypes` (`id`, `name`) VALUES
(3, 'a post reply'),
(2, 'dub acceptance'),
(1, 'dub request');

-- --------------------------------------------------------

--
-- Table structure for table `Photos`
--

CREATE TABLE `Photos` (
  `id` int(12) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `href` varchar(1024) NOT NULL,
  `src` varchar(1024) NOT NULL,
  `width` int(6) NOT NULL,
  `height` int(6) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Photos`
--

INSERT INTO `Photos` (`id`, `user_id`, `title`, `href`, `src`, `width`, `height`, `created_at`, `updated_at`) VALUES
(54, 8, 'Dirk1', 'https://www.flickr.com/photos/151625521@N05/36496998291/in/dateposted-public/', 'https://farm5.staticflickr.com/4430/36496998291_9b979d7d03_o.jpg', 682, 1024, '2017-08-20 02:29:26', '2017-08-20 02:29:26'),
(55, 8, 'Dirk2', 'https://www.flickr.com/photos/151625521@N05/36496998141/in/dateposted-public/', 'https://farm5.staticflickr.com/4378/36496998141_fa3566347c_o.jpg', 362, 450, '2017-08-20 02:35:52', '2017-08-20 02:35:52'),
(56, 8, 'Dirk3', 'https://www.flickr.com/photos/151625521@N05/36496998091/in/dateposted-public/', 'https://farm5.staticflickr.com/4378/36496998091_fcc166ee89_o.jpg', 590, 428, '2017-08-20 02:36:10', '2017-08-20 02:36:10'),
(57, 8, 'Dirk4', 'https://www.flickr.com/photos/151625521@N05/36496998031/in/dateposted-public/', 'https://farm5.staticflickr.com/4370/36496998031_f661be7366_o.jpg', 403, 594, '2017-08-20 02:36:26', '2017-08-20 02:36:26'),
(58, 8, 'Dirk5', 'https://www.flickr.com/photos/151625521@N05/36496997921/in/dateposted-public/', 'https://farm5.staticflickr.com/4369/36496997921_bbd6935a80_o.jpg', 1024, 400, '2017-08-20 02:36:40', '2017-08-20 02:36:40'),
(59, 8, 'Dirk6', 'https://www.flickr.com/photos/151625521@N05/36496997881/in/dateposted-public/', 'https://farm5.staticflickr.com/4336/36496997881_8915f52135_o.jpg', 590, 354, '2017-08-20 02:36:55', '2017-08-20 02:36:55'),
(60, 8, 'Dirk7', 'https://www.flickr.com/photos/151625521@N05/36496997681/in/dateposted-public/', 'https://farm5.staticflickr.com/4345/36496997681_c14bde6a5a_o.jpg', 431, 610, '2017-08-20 02:37:10', '2017-08-20 02:37:10'),
(61, 8, 'Westbrook1', 'https://www.flickr.com/photos/151625521@N05/36588649796/in/dateposted-public/', 'https://farm5.staticflickr.com/4407/36588649796_da03804d8f_o.jpg', 1576, 3000, '2017-08-20 02:37:36', '2017-08-20 02:37:36'),
(63, 8, 'Westbrook3', 'https://www.flickr.com/photos/151625521@N05/36588649576/in/dateposted-public/', 'https://farm5.staticflickr.com/4409/36588649576_94f16647b7_o.jpg', 610, 614, '2017-08-20 02:39:57', '2017-08-20 02:39:57'),
(64, 8, 'Westbrook4', 'https://www.flickr.com/photos/151625521@N05/35800613144/in/dateposted-public/', 'https://farm5.staticflickr.com/4371/35800613144_de2af0027d_o.jpg', 1200, 776, '2017-08-20 02:40:43', '2017-08-20 02:40:43'),
(65, 8, 'Westbrook5', 'https://www.flickr.com/photos/151625521@N05/36238888160/in/dateposted-public/', 'https://farm5.staticflickr.com/4418/36238888160_150848b4a2_o.jpg', 2000, 3000, '2017-08-20 02:40:56', '2017-08-20 02:40:56'),
(66, 8, 'Westbrook6', 'https://www.flickr.com/photos/151625521@N05/35800612914/in/dateposted-public/', 'https://farm5.staticflickr.com/4416/35800612914_f82fbc7e09_o.jpg', 600, 400, '2017-08-20 02:41:09', '2017-08-20 02:41:09'),
(67, 8, 'Porzingins1', 'https://www.flickr.com/photos/151625521@N05/36635541995/in/dateposted-public/', 'https://farm5.staticflickr.com/4369/36635541995_39529e8dec_o.jpg', 750, 503, '2017-08-20 02:41:33', '2017-08-20 02:41:33'),
(69, 8, 'Porzingis3', 'https://www.flickr.com/photos/151625521@N05/35826753063/in/dateposted-public/', 'https://farm5.staticflickr.com/4439/35826753063_6993f92d3d_o.jpg', 1200, 817, '2017-08-20 03:02:03', '2017-08-20 03:02:03'),
(70, 8, 'Porzingis4', 'https://www.flickr.com/photos/151625521@N05/36635541895/in/dateposted-public/', 'https://farm5.staticflickr.com/4393/36635541895_6f04fa12aa_o.jpg', 850, 602, '2017-08-20 03:02:31', '2017-08-20 03:02:31'),
(71, 8, 'Porzingis5', 'https://www.flickr.com/photos/151625521@N05/36635541795/in/dateposted-public/', 'https://farm5.staticflickr.com/4351/36635541795_b6e165b0de_o.jpg', 800, 533, '2017-08-20 03:02:44', '2017-08-20 03:02:44'),
(72, 8, 'fashion1', 'https://www.flickr.com/photos/151625521@N05/36643007525/in/dateposted-public/', 'https://farm5.staticflickr.com/4421/36643007525_d1d9925f63_o.jpg', 964, 643, '2017-08-20 03:03:10', '2017-08-20 03:03:10'),
(73, 8, 'fashion2', 'https://www.flickr.com/photos/151625521@N05/36247004130/in/dateposted-public/', 'https://farm5.staticflickr.com/4365/36247004130_536e189cce_o.jpg', 736, 1104, '2017-08-20 03:03:23', '2017-08-20 03:03:23'),
(74, 8, 'fashion3', 'https://www.flickr.com/photos/151625521@N05/36247004090/in/dateposted-public/', 'https://farm5.staticflickr.com/4435/36247004090_d1234e4dc8_o.jpg', 736, 736, '2017-08-20 03:03:36', '2017-08-20 03:03:36'),
(75, 8, 'fashion5', 'https://www.flickr.com/photos/151625521@N05/36247004060/in/dateposted-public/', 'https://farm5.staticflickr.com/4368/36247004060_6e604fb80c_o.jpg', 640, 380, '2017-08-20 03:04:01', '2017-08-20 03:04:01'),
(76, 8, 'fashion6', 'https://www.flickr.com/photos/151625521@N05/36247004410/in/dateposted-public/', 'https://farm5.staticflickr.com/4420/36247004410_b46da69379_o.jpg', 1624, 1129, '2017-08-20 03:04:15', '2017-08-20 03:04:15'),
(77, 8, 'fashion777', 'https://www.flickr.com/photos/151625521@N05/36643007415/in/dateposted-public/', 'https://farm5.staticflickr.com/4384/36643007415_cb50358c05_o.jpg', 1024, 514, '2017-08-20 03:04:28', '2017-08-28 03:52:33'),
(78, 8, 'dome1', 'https://www.flickr.com/photos/151625521@N05/35835207593/in/dateposted-public/', 'https://farm5.staticflickr.com/4429/35835207593_a0ac8188d3_o.jpg', 1024, 521, '2017-08-20 03:04:42', '2017-08-20 03:04:42'),
(80, 8, 'dome3', 'https://www.flickr.com/photos/151625521@N05/35835208023/in/dateposted-public/', 'https://farm5.staticflickr.com/4361/35835208023_57b03c8fa0_o.jpg', 1580, 984, '2017-08-20 03:08:05', '2017-08-20 03:08:05'),
(81, 8, 'dome4', 'https://www.flickr.com/photos/151625521@N05/35835207443/in/dateposted-public/', 'https://farm5.staticflickr.com/4364/35835207443_832bcbaf0a_o.jpg', 600, 364, '2017-08-20 03:08:16', '2017-08-28 03:09:21'),
(82, 8, 'space1', 'https://www.flickr.com/photos/151625521@N05/35835207353/in/dateposted-public/', 'https://farm5.staticflickr.com/4404/35835207353_b61e63f25a_o.jpg', 800, 450, '2017-08-20 03:08:33', '2017-08-20 03:08:33'),
(83, 8, 'space2', 'https://www.flickr.com/photos/151625521@N05/36643940365/in/dateposted-public/', 'https://farm5.staticflickr.com/4393/36643940365_74f9974c4d_o.jpg', 1920, 1080, '2017-08-20 04:33:44', '2017-08-20 04:33:44'),
(84, 8, 'space3', 'https://www.flickr.com/photos/151625521@N05/36643940805/in/dateposted-public/', 'https://farm5.staticflickr.com/4421/36643940805_80475d514b_o.jpg', 1680, 1050, '2017-08-20 04:40:03', '2017-08-20 04:40:03'),
(87, 8, 'space6', 'https://www.flickr.com/photos/151625521@N05/36643940325/in/dateposted-public/', 'https://farm5.staticflickr.com/4434/36643940325_78d1484cd1_o.jpg', 610, 310, '2017-08-20 04:49:49', '2017-08-20 04:49:49'),
(88, 8, 'space7', 'https://www.flickr.com/photos/151625521@N05/35835207223/in/dateposted-public/', 'https://farm5.staticflickr.com/4331/35835207223_a5a82d80db_o.jpg', 720, 450, '2017-08-20 04:51:32', '2017-08-20 04:51:32'),
(89, 8, 'space8', 'https://www.flickr.com/photos/151625521@N05/35835207163/in/dateposted-public/', 'https://farm5.staticflickr.com/4357/35835207163_ffb16c13af_o.jpg', 500, 375, '2017-08-20 04:54:35', '2017-08-20 04:54:35'),
(90, 8, 'space9', 'https://www.flickr.com/photos/151625521@N05/36643940165/in/dateposted-public/', 'https://farm5.staticflickr.com/4411/36643940165_dc8b68f3c7_o.jpg', 849, 565, '2017-08-20 04:55:48', '2017-08-20 04:55:48'),
(91, 8, 'space10', 'https://www.flickr.com/photos/151625521@N05/35835207123/in/dateposted-public/', 'https://farm5.staticflickr.com/4440/35835207123_b842457ea6_o.jpg', 800, 450, '2017-08-20 04:56:06', '2017-08-20 04:56:06'),
(92, 8, 'gungun55tuna', 'https://www.flickr.com/photos/151625521@N05/36597937276/in/dateposted-public/', 'https://farm5.staticflickr.com/4403/36597937276_922edb6d5b_o.jpg', 1500, 1500, '2017-08-20 04:56:55', '2017-08-28 03:08:55'),
(93, 8, 'jet engine1', 'https://www.flickr.com/photos/151625521@N05/36248325750/in/dateposted-public/', 'https://farm5.staticflickr.com/4347/36248325750_7dcf83fd75_o.jpg', 1024, 768, '2017-08-20 04:57:54', '2017-08-20 04:57:54'),
(94, 8, 'jet engine2 super', 'https://www.flickr.com/photos/151625521@N05/36597937226/in/dateposted-public/', 'https://farm5.staticflickr.com/4370/36597937226_e64d44568d_o.jpg', 1920, 1080, '2017-08-20 04:58:13', '2017-08-28 04:13:47'),
(95, 8, 'jet engine3', 'https://www.flickr.com/photos/151625521@N05/36248325990/in/dateposted-public/', 'https://farm5.staticflickr.com/4331/36248325990_09a51fdf76_o.jpg', 1920, 1080, '2017-08-20 04:58:27', '2017-08-20 04:58:27'),
(96, 8, 'jet engine4', 'https://www.flickr.com/photos/151625521@N05/36506535541/in/dateposted-public/', 'https://farm5.staticflickr.com/4421/36506535541_acaf688466_o.png', 540, 540, '2017-08-20 04:59:17', '2017-08-20 04:59:17'),
(97, 8, 'jet engine5 awesome', 'https://www.flickr.com/photos/151625521@N05/36506535381/in/dateposted-public/', 'https://farm5.staticflickr.com/4393/36506535381_4982df9f49_o.jpg', 773, 500, '2017-08-20 04:59:33', '2017-08-28 03:53:06'),
(98, 8, 'jet shit 66', 'https://www.flickr.com/photos/151625521@N05/36248325400/in/dateposted-public/', 'https://farm5.staticflickr.com/4352/36248325400_0f035711ef_o.jpg', 870, 588, '2017-08-20 04:59:46', '2017-08-30 12:56:41');

-- --------------------------------------------------------

--
-- Table structure for table `Profile`
--

CREATE TABLE `Profile` (
  `user_id` int(11) NOT NULL,
  `description` varchar(3000) DEFAULT NULL,
  `pic_url` varchar(1000) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Profile`
--

INSERT INTO `Profile` (`user_id`, `description`, `pic_url`) VALUES
(8, '\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Donec pharetra lectus aliquam mauris finibus porta. Quisque eget diam mauris. Duis hendrerit est nisi, quis imperdiet libero blandit quis. Vestibulum ac neque lorem. Duis eu vulputate tellus. Vivamus a tempus mi, eu dignissim lacus. Sed vehicula elementum mattis. Vivamus id justo scelerisque, faucibus erat non, iaculis dui. Nullam ultricies nulla vitae arcu consectetur, et placerat nisi hendrerit. Aliquam erat volutpat. Quisque eget blandit urna.\r\n<br><br>\r\nNam suscipit ut tellus nec fermentum. Aliquam et molestie tellus. Nullam euismod risus magna, quis elementum diam auctor a. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec ut velit lacus. Curabitur non neque sit amet ligula ultricies ullamcorper. Duis gravida massa et diam sollicitudin, sed rhoncus quam cursus. Aenean vitae vehicula sem, et convallis quam. Integer faucibus lacus et gravida ullamcorper. In porta, sem ac elementum lobortis, felis quam feugiat est, et aliquam lorem ex bibendum enim. Etiam pharetra mauris a vulputate laoreet. Morbi a neque non nulla semper finibus. Suspendisse posuere, velit nec suscipit elementum, enim dolor suscipit augue, at consequat lorem tortor quis erat. Praesent gravida odio vel venenatis vulputate. Ut efficitur, mi et rutrum interdum, diam neque consequat dolor, et congue lorem justo ac sem. Duis ligula purus, condimentum interdum posuere nec, sagittis vel dolor.\r\n<br><br>\r\nNam rutrum lectus et metus mollis euismod. Proin semper elementum nunc. Vestibulum vel ex dui. Aliquam eget lectus ante. Quisque varius ultrices arcu, eu blandit eros viverra nec. Nam tempor mauris sed velit placerat aliquet. Aliquam vitae arcu ac massa aliquet ullamcorper. Nulla semper sagittis turpis, in efficitur est porta ut. Praesent felis nibh, aliquet at placerat vestibulum, fermentum sed neque. Sed massa mauris, finibus a venenatis quis, dapibus a sapien. Sed sed suscipit lacus.\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Donec gravida dapibus sollicitudin. Vestibulum velit ipsum, cursus eget tellus id, aliquet posuere sem. Nulla molestie leo nec sapien tristique, vel suscipit diam congue. Nulla dignissim dapibus metus, ac interdum elit cursus porta. Maecenas ligula augue, tincidunt et lacus nec, tincidunt bibendum sapien. Curabitur laoreet eget urna ut cursus. Integer sit amet ligula porta, porttitor lacus sed, rhoncus leo. Proin malesuada, nibh sollicitudin auctor dignissim, mauris quam ultrices elit, in fermentum libero augue sed felis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent suscipit augue a dui finibus condimentum. Nunc viverra mi quis elementum lobortis. Nunc iaculis faucibus risus, sed imperdiet justo. Cras eu venenatis velit.\r\n', 'https://farm5.staticflickr.com/4365/36521302700_b4b4b9f984_o.jpg'),
(9, '\r\nKaede Rukawa (?? ?? Rukawa Kaede) is the small forward of the Shohoku team, and Hanamichi Sakuragi\'s rival. He is the polar opposite to Sakuragi — attractive to girls, skilled at basketball, and very cold and aloof, although he does share some traits with Sakuragi in that they are not academically inclined and are good fighters. Although he regards Sakuragi as an idiot and the two frequently get into conflicts, he seems to realize that Sakuragi can put his talents to better use. Takenori Akagi\'s younger sister, Haruko, has a crush on him,[ch. 2] though she does not confess it and he himself is completely unaware of her feelings. Rukawa\'s chief hobby outside basketball is sleeping, and he is usually seen asleep whenever he\'s not on the court because he spends his nights practicing further. Due to this, he is prone to falling asleep even while riding his bicycle. He has also been in his fair share of off-court fights, but can hold his own. Rukawa\'s goal is to be the best high school player in Japan, and he considers Sendoh of Ryonan to be his greatest rival. He is often referred to as the \"super-rookie\" and the \"ace of Shohoku\".\r\n<br>\r\nKaede Rukawa (?? ?? Rukawa Kaede) is the small forward of the Shohoku team, and Hanamichi Sakuragi\'s rival. He is the polar opposite to Sakuragi — attractive to girls, skilled at basketball, and very cold and aloof, although he does share some traits with Sakuragi in that they are not academically inclined and are good fighters. Although he regards Sakuragi as an idiot and the two frequently get into conflicts, he seems to realize that Sakuragi can put his talents to better use. Takenori Akagi\'s younger sister, Haruko, has a crush on him,[ch. 2] though she does not confess it and he himself is completely unaware of her feelings. Rukawa\'s chief hobby outside basketball is sleeping, and he is usually seen asleep whenever he\'s not on the court because he spends his nights practicing further. Due to this, he is prone to falling asleep even while riding his bicycle. He has also been in his fair share of off-court fights, but can hold his own. Rukawa\'s goal is to be the best high school player in Japan, and he considers Sendoh of Ryonan to be his greatest rival. He is often referred to as the \"super-rookie\" and the \"ace of Shohoku\".\r\n', 'https://farm5.staticflickr.com/4423/36099515574_5b59786231_q.jpg'),
(10, NULL, '0'),
(13, NULL, '0'),
(58, NULL, '0'),
(70, NULL, '0'),
(71, NULL, '0'),
(72, NULL, '0'),
(73, NULL, '0'),
(74, NULL, '0'),
(75, NULL, '0'),
(76, NULL, '0'),
(77, NULL, '0'),
(78, NULL, '0'),
(79, NULL, '0'),
(80, NULL, '0'),
(83, NULL, '0'),
(85, NULL, '0'),
(87, NULL, '0'),
(89, NULL, '0'),
(91, NULL, '0'),
(94, NULL, '0'),
(95, NULL, '0'),
(96, NULL, '0');

-- --------------------------------------------------------

--
-- Table structure for table `RateableItems`
--

CREATE TABLE `RateableItems` (
  `id` int(12) NOT NULL,
  `item_x_id` int(12) NOT NULL,
  `item_x_type_id` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `RateableItems`
--

INSERT INTO `RateableItems` (`id`, `item_x_id`, `item_x_type_id`) VALUES
(31, 105, 1),
(32, 106, 1),
(33, 107, 1),
(34, 108, 1),
(35, 109, 1),
(36, 110, 1),
(37, 111, 1),
(38, 112, 1),
(39, 113, 1),
(40, 114, 1),
(41, 115, 1);

-- --------------------------------------------------------

--
-- Table structure for table `RateableItemsUsers`
--

CREATE TABLE `RateableItemsUsers` (
  `rateable_item_id` int(12) NOT NULL,
  `responder_user_id` int(11) NOT NULL,
  `rate_value` int(2) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `RateableItemsUsers`
--

INSERT INTO `RateableItemsUsers` (`rateable_item_id`, `responder_user_id`, `rate_value`, `date_created`, `date_updated`) VALUES
(31, 8, 5, '2017-09-10 06:12:48', '2017-09-10 06:47:28'),
(31, 9, 1, '2017-09-10 06:14:03', '2017-09-11 10:54:45'),
(31, 10, 5, '2017-09-10 06:47:57', '2017-09-11 10:43:41'),
(32, 8, 0, '2017-09-12 21:59:10', '2017-09-12 21:59:10'),
(32, 9, 3, '2017-09-10 10:11:06', '2017-09-10 10:11:06'),
(33, 10, -3, '2017-09-11 10:38:13', '2017-09-11 10:40:28'),
(34, 8, -2, '2017-09-10 07:33:26', '2017-09-12 22:00:14'),
(35, 8, 4, '2017-09-10 06:56:10', '2017-09-11 17:17:21'),
(36, 8, 2, '2017-09-11 08:17:56', '2017-09-11 08:17:56'),
(36, 9, 4, '2017-09-10 06:59:24', '2017-09-10 06:59:24'),
(36, 10, -2, '2017-09-10 09:42:59', '2017-09-10 10:02:54'),
(37, 8, 2, '2017-09-12 21:58:57', '2017-09-12 21:58:57'),
(37, 9, 1, '2017-09-10 06:57:48', '2017-09-10 06:57:48'),
(38, 8, 5, '2017-09-11 06:27:11', '2017-09-11 06:27:11'),
(38, 9, 2, '2017-09-11 10:44:19', '2017-09-11 10:44:19'),
(38, 10, 0, '2017-09-10 07:42:05', '2017-09-10 07:42:05'),
(39, 8, 5, '2017-09-11 06:28:38', '2017-09-11 06:51:03'),
(39, 9, 4, '2017-09-11 06:29:35', '2017-09-11 10:52:52'),
(39, 10, -4, '2017-09-11 06:30:19', '2017-09-11 10:40:46'),
(40, 9, -5, '2017-09-13 02:41:29', '2017-09-13 02:41:29'),
(41, 8, 3, '2017-09-13 02:46:48', '2017-09-13 02:46:48');

-- --------------------------------------------------------

--
-- Table structure for table `Rates`
--

CREATE TABLE `Rates` (
  `id` int(2) NOT NULL,
  `value` int(2) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Rates`
--

INSERT INTO `Rates` (`id`, `value`, `name`) VALUES
(1, -5, 'MEME'),
(2, -4, 'Bomb'),
(3, -3, 'Crazy'),
(4, -2, 'Nuts'),
(5, -1, 'Sucks'),
(6, 0, 'PokerFace'),
(7, 1, 'Swaggy'),
(8, 2, 'Cookin'),
(9, 3, 'Ballin'),
(10, 4, 'nDzone'),
(11, 5, 'GOAT');

-- --------------------------------------------------------

--
-- Table structure for table `RefundItem`
--

CREATE TABLE `RefundItem` (
  `id` int(12) NOT NULL,
  `invoice_item_id` int(12) NOT NULL,
  `quantity` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `RefundItem`
--

INSERT INTO `RefundItem` (`id`, `invoice_item_id`, `quantity`) VALUES
(25, 44, 1),
(26, 66, 1),
(27, 84, 1);

-- --------------------------------------------------------

--
-- Table structure for table `SalesNotification`
--

CREATE TABLE `SalesNotification` (
  `id` int(12) NOT NULL,
  `notified_user_id` int(11) NOT NULL,
  `notifier_user_id` int(11) NOT NULL,
  `invoice_item_id` int(11) NOT NULL,
  `notification_type` int(2) NOT NULL,
  `is_active` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `SalesNotification`
--

INSERT INTO `SalesNotification` (`id`, `notified_user_id`, `notifier_user_id`, `invoice_item_id`, `notification_type`, `is_active`) VALUES
(18, 10, 8, 65, 4, b'1'),
(19, 10, 8, 66, 4, b'1'),
(20, 10, 8, 66, 4, b'1'),
(22, 10, 8, 66, 4, b'1'),
(27, 8, 9, 84, 4, b'1'),
(28, 9, 8, 84, 4, b'1'),
(29, 9, 8, 85, 4, b'1');

-- --------------------------------------------------------

--
-- Table structure for table `SampleNotifications`
--

CREATE TABLE `SampleNotifications` (
  `id` int(11) NOT NULL,
  `notification_name` varchar(50) NOT NULL,
  `is_new` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `SampleNotifications`
--

INSERT INTO `SampleNotifications` (`id`, `notification_name`, `is_new`) VALUES
(1, 'FirstNotification', b'0'),
(2, 'SecondNotification', b'0'),
(3, 'ThirdNotification', b'0'),
(4, '4th new notification', b'0'),
(5, '5th notification', b'0'),
(6, '6th notifi', b'0'),
(7, '7th', b'0'),
(8, '8th', b'0'),
(9, '9th', b'0'),
(10, '10', b'0'),
(11, '11', b'0'),
(12, '12', b'0'),
(13, '13', b'0'),
(14, '20', b'0'),
(15, '21', b'0'),
(16, '22', b'0'),
(17, '24', b'0'),
(18, '18', b'0'),
(19, '29', b'0'),
(20, '30', b'0'),
(21, '30', b'0');

-- --------------------------------------------------------

--
-- Table structure for table `StoreCart`
--

CREATE TABLE `StoreCart` (
  `cart_id` int(11) NOT NULL,
  `seller_user_id` int(11) NOT NULL,
  `buyer_user_id` int(11) NOT NULL,
  `is_complete` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `StoreCart`
--

INSERT INTO `StoreCart` (`cart_id`, `seller_user_id`, `buyer_user_id`, `is_complete`) VALUES
(37, 9, 10, 0),
(38, 8, 10, 0),
(39, 8, 9, 1),
(40, 10, 9, 0),
(41, 9, 8, 0),
(42, 10, 8, 0),
(43, 15, 8, 0),
(44, 15, 9, 0),
(45, 8, 38, 0),
(46, 8, 9, 1),
(47, 8, 9, 1);

-- --------------------------------------------------------

--
-- Table structure for table `TestHtmlEntities`
--

CREATE TABLE `TestHtmlEntities` (
  `id` int(11) NOT NULL,
  `value` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `TestHtmlEntities`
--

INSERT INTO `TestHtmlEntities` (`id`, `value`) VALUES
(1, 'puta&#12588;'),
(2, 'PUTðŸ˜ˆA'),
(3, '');

-- --------------------------------------------------------

--
-- Table structure for table `TimelinePostReplies`
--

CREATE TABLE `TimelinePostReplies` (
  `id` int(11) NOT NULL,
  `parent_post_id` int(11) NOT NULL,
  `owner_user_id` int(11) NOT NULL,
  `poster_user_id` int(11) NOT NULL,
  `date_posted` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `message` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `TimelinePostReplies`
--

INSERT INTO `TimelinePostReplies` (`id`, `parent_post_id`, `owner_user_id`, `poster_user_id`, `date_posted`, `date_updated`, `message`) VALUES
(1, 111, 9, 9, '2017-09-10 06:57:20', '2017-09-10 06:57:20', 'thanks'),
(2, 112, 8, 8, '2017-09-10 07:37:40', '2017-09-10 07:37:40', 'salamat sa post :)'),
(3, 112, 8, 9, '2017-09-10 07:38:46', '2017-09-10 07:38:46', 'walang anuman :P'),
(4, 112, 8, 10, '2017-09-10 07:39:22', '2017-09-10 07:39:22', 'nagawa mo na yung nba draft?'),
(5, 115, 9, 9, '2017-09-13 02:58:54', '2017-09-13 02:58:54', 'ok lang'),
(6, 115, 9, 8, '2017-09-13 02:59:15', '2017-09-13 02:59:15', 'kelan ka bibili ng ps5?');

-- --------------------------------------------------------

--
-- Table structure for table `TimelinePosts`
--

CREATE TABLE `TimelinePosts` (
  `id` int(11) NOT NULL,
  `owner_user_id` int(6) NOT NULL,
  `poster_user_id` int(6) NOT NULL,
  `date_posted` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `message` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `TimelinePosts`
--

INSERT INTO `TimelinePosts` (`id`, `owner_user_id`, `poster_user_id`, `date_posted`, `date_updated`, `message`) VALUES
(105, 8, 8, '2017-09-09 18:39:07', '2017-09-09 18:39:07', 'shishisodfj osjdf'),
(106, 9, 9, '2017-09-10 06:50:40', '2017-09-10 06:50:40', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
(107, 8, 8, '2017-09-10 06:52:33', '2017-09-10 06:52:33', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
(108, 9, 9, '2017-09-10 06:53:28', '2017-09-10 06:53:28', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.'),
(109, 9, 9, '2017-09-10 06:55:08', '2017-09-10 06:55:08', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).'),
(110, 8, 8, '2017-09-10 06:55:39', '2017-09-10 06:55:39', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).'),
(111, 9, 8, '2017-09-10 06:56:56', '2017-09-10 06:56:56', 'ayos to ah'),
(112, 8, 9, '2017-09-10 07:31:30', '2017-09-10 07:31:30', '\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"'),
(113, 8, 8, '2017-09-11 06:28:33', '2017-09-11 06:28:33', 'sexy boy although it hurts yeah i\'ll be the first to say that i was wrong'),
(114, 8, 8, '2017-09-13 02:38:10', '2017-09-13 02:38:10', 'notifications oh yeah'),
(115, 9, 8, '2017-09-13 02:46:38', '2017-09-13 02:46:38', 'Kumusuta c?');

-- --------------------------------------------------------

--
-- Table structure for table `UserHostedAd`
--

CREATE TABLE `UserHostedAd` (
  `id` int(11) NOT NULL,
  `user_id` int(12) NOT NULL,
  `ad_id` int(14) NOT NULL,
  `num_air_hosted` int(14) NOT NULL,
  `allotment_percentage` float NOT NULL,
  `status_id` int(2) NOT NULL,
  `hosted_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `UserHostedAd`
--

INSERT INTO `UserHostedAd` (`id`, `user_id`, `ad_id`, `num_air_hosted`, `allotment_percentage`, `status_id`, `hosted_date`) VALUES
(1, 8, 3, 47, 0, 1, '2017-05-11 03:07:04'),
(3, 10, 1, 34, 10, 1, '2017-05-11 03:25:17'),
(4, 8, 2, 444, 6.14, 1, '2017-05-11 03:30:37'),
(5, 8, 4, 7, 0, 1, '2017-05-11 16:43:07'),
(6, 9, 2, 32, 6.14, 1, '2017-05-12 00:32:01'),
(7, 9, 1, 46, 10, 1, '2017-05-12 00:35:12'),
(8, 8, 5, 39, 0, 1, '2017-05-12 02:16:09'),
(9, 9, 6, 37, 0, 1, '2017-05-12 02:28:34'),
(10, 8, 7, 123, 0, 1, '2017-05-12 02:48:29'),
(11, 8, 8, 500, 41.23, 1, '2017-05-12 03:08:04'),
(12, 8, 9, 78, 0, 1, '2017-05-12 03:55:23'),
(13, 10, 10, 68, 25.03, 1, '2017-05-12 04:04:19'),
(14, 10, 11, 80, 29.41, 1, '2017-05-12 04:28:57'),
(15, 8, 12, 516, 24.56, 1, '2017-05-12 17:33:04'),
(16, 9, 12, 49, 24.56, 1, '2017-05-14 02:27:27'),
(17, 9, 5, 11, 0, 1, '2017-07-01 23:06:03');

-- --------------------------------------------------------

--
-- Table structure for table `UserPayPalAccount`
--

CREATE TABLE `UserPayPalAccount` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `paypal_client_id` varchar(1000) NOT NULL,
  `paypal_secret_id` varchar(1000) NOT NULL,
  `account_type` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `UserPayPalAccount`
--

INSERT INTO `UserPayPalAccount` (`id`, `user_id`, `paypal_client_id`, `paypal_secret_id`, `account_type`) VALUES
(4, 8, 'AY9lIQxIKr5wKR8d0TrbmZvFJiVBvbt00OhKzDjSx7H8PisS1EvvjWLWl6rbc3o5wnHhUyR_WVzPjVH7', 'EEUY_Z8yup8UQIy6vEnAwntI9UsHC43KXTP3p12j6DUH7PAI-axB-gS552u4XD2-gvvcQOwMR3ArwIHf', 2);

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `email` varchar(200) DEFAULT NULL,
  `hashed_password` varchar(255) NOT NULL,
  `user_type_id` int(2) NOT NULL DEFAULT '1',
  `signup_token` varchar(255) DEFAULT NULL,
  `private` tinyint(1) NOT NULL DEFAULT '1',
  `account_status_id` int(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`user_id`, `user_name`, `email`, `hashed_password`, `user_type_id`, `signup_token`, `private`, `account_status_id`) VALUES
(8, 'bren', '', '$2y$10$NUvesdcKf749dWYzg2Ll/Ok88DKAOoJF2gU5eUo3DHMgg55/CfBaW', 1, NULL, 0, 1),
(9, 'c', '', '$2y$10$K5SpUutbvfrIw2gmi5pDh.SjhfCIah2n.kgmK8W285vwwB/KL0q9.', 1, NULL, 1, 1),
(10, 'ye', '', '$2y$10$YJ4PuMoBFbjECsCouWi1/OXSM4E9adnyT47LcaXvgEvWOG0yO0VXS', 1, NULL, 1, 1),
(11, 'apesapes123', '', '$2y$10$aOgIUHN8sb30x7uKA14QMe5QPoqmnmjeKljmCTITY5.HedkxGYsW6', 1, NULL, 1, 1),
(12, 'kobekobe123', '', '$2y$10$sKJjEP.JlR3zUjs8VxwhiOlCGtiOyGV7S0LKs/WGl3psTHxpwSRkW', 1, NULL, 0, 1),
(13, 'johnjohn123', '', '$2y$10$6ieChkTpeDxadg03ebcrJeOtQaegjldDqYTGTjLGkbPX3xsUyp8Oi', 1, NULL, 1, 1),
(14, 'UserForOneTimeAddresses123', '', '$2y$10$R8nKvfFjh4oj5wMfqoMreePXh1VrgyZvxFMeeUG2ZJ2RgpgwIMD3a', 1, NULL, 1, 1),
(15, 'leilei123', '', '$2y$10$JcHTcbO94oJbaKdIkAf9J.5U9qXmh4lD/2fa7.Or9CXXqMNYWk.fu', 1, NULL, 1, 1),
(34, 'brenbren123', 'brenbren123@random.com', '$2y$10$cBKKHyrTd5oW28BNd/QMEu30Ua0WuEMQ0cOX6kxzFNrdZtUOTWBKC', 1, '', 1, 1),
(38, 'odoxodox123', 'o@a.com', '$2y$10$QxRDNI72URr1uTk5whz1zOpaZB3jaX2TqAA7X2YWnZHA9RkrUPYma', 1, '39c66d966324929b8f7d75bb42b86bee', 1, 1),
(58, 'opsops123', 'odox700@gmail.com', '$2y$10$0ljQR1FSbmKYDAy6TOHg2OHM.obn6KPfRvGWDEGaySNOs74Gd76nu', 1, 'ac2bb09384be96f7b49aafadca3e55a8', 1, 1),
(59, 'potpot123', 'potpot123@a.com', '$2y$10$YDRY10oedKFhr2YdVyU6sOhnUhQ1s7jXp7U/IMgjSpkAYS3BfpIm6', 5, '', 0, 1),
(60, 'bonbon123', '', '$2y$10$LpgNrdmMI5W7tMsF0YUnZ.Ch0p.6QtbONwBc31uaZWfkCVmBo.lQe', 1, '', 1, 4),
(61, 'boyboy123', '', '$2y$10$fgwrQDRKrYpVuY4W1c11oOPEI5pEuhO/PlV0x0fL0t4gdJvewORkC', 1, '', 1, 1),
(62, 'hoyhoy123', '', '$2y$10$Pb1BGnhRxM5JxchYYiNb9uQqmaIrG7zMyBoY3ymTl.GuKykazvzVW', 1, '', 1, 1),
(63, 'noynoy123', '', '$2y$10$YJsTySTsLPkJuINz.JCOc.tENTV7uQxSh3EsUoVi.9cu.Fays2jxG', 1, '', 1, 2),
(66, 'soysoy123', '', '$2y$10$z/h6oJdJX6ngGvWh5U4sEec.rCd1TroXTespCVg0ldgaEN3bp1R.m', 1, '', 1, 1),
(67, 'zoyzoy123', '', '$2y$10$H4xNl7LUcNGw54HI7iBVIubMFzB.855ICmqmEv99HTEvP5kqGqlFq', 1, '', 0, 1),
(68, 'heyhey123', '', '$2y$10$VT4cIXVZ.364Mf8OkW4v3.fbmHva53nXsqOeItXvSQk5yFRLJqvTG', 1, '', 0, 1),
(69, 'zeyzey123', '', '$2y$10$PXG5hc3jM/x1AglEANm87.QwaR0vIsj46HOxTRXWK91yzlYqCKXka', 1, '', 1, 1),
(70, 'meymey123', '', '$2y$10$V5vbhJ8BQJJMQoWVYhrR5uP5/591RlquxTdVkG.VtInS6SrAO/jNq', 1, '', 0, 1),
(71, 'xeyxey123', '', '$2y$10$Ro.kWMSIX/Sx9hBXDRg3duq19PFzmyZp8TlXL/DTifrlZxZMFJQfS', 4, '', 1, 1),
(72, 'yeyyey123', '', '$2y$10$kOhksvxAluuX6zlj8YjYk.LCvDdAxOGMReECeZwGGFgkKFWN1CEW.', 5, '', 0, 3),
(73, 'aayaay123', '', '$2y$10$pJJVLCHvnC2BxAwNFpHy2OQdiRb3t7CI8y18loRKw3g5PNCUKpuCy', 4, '', 0, 4),
(74, 'baybay123', '', '$2y$10$wxlwrOhKXBzkTUgRhZ43kuPFG0oo2k7Q3ik.S1d3.RtRPsn7Gswoq', 1, '', 1, 1),
(75, 'caycay123', '', '$2y$10$Y5Njb9BI2rDtU7uheR47.evdKZMp8FJCPPnPKS80digzks4r7sb/m', 1, '', 1, 1),
(76, 'dayday123', '', '$2y$10$K.hp7J6FH1uJvP1qLP4Rh.RtI8U3iXYvqe2NtyIpCmhOfW6UMSlhq', 4, '', 0, 2),
(77, 'eayeay123', '', '$2y$10$4w.kgQP2AtCAeqOXCxeiQup.xmrrk.su0JOrHaxyxOWMEGw6yLS3q', 1, '', 1, 1),
(78, 'fayfay123', 'fayfay123@a.com', '$2y$10$TnZwC/lFdln3M3YpzfkrwOn3EFu5eB3W8tLop86BH17kNbI4KH2yW', 1, '', 1, 1),
(79, 'gaygay123', '', '$2y$10$Hnlo/0eVYXDsDTjA1qYZHeEfF3Syy7TlgDb9LBoOB5kYy94vETVuy', 1, '', 1, 1),
(80, 'hayhay123', '', '$2y$10$psOoHpIcJaETYNcpgTS8AO.j69vrF0jNfp6X20SFiX4utK4fMiZ/C', 1, '', 1, 1),
(82, 'duranto1', 'duranto@gmail.com', '$2y$10$uG5iFggoGPTKKwcb6KVBNOUNZ0V0N4s7o5PFsnFjj7ilRbKqIp09.', 1, NULL, 1, 1),
(83, 'duranti1', 'duranti1@gmail.com', '$2y$10$7I.VfUhfkxsCkCDjzDJRCeM1Mx4KEscTNZH6yPZ5EbxFfQn9sWrUe', 1, '', 1, 1),
(85, 'duranta1', 'duranta1@gmail.com', '$2y$10$x1sdlcHbfoKT3I5T.YrtpO0pfyJwjY8TO/4KEUUVYGv71a5vHBVXK', 1, '', 0, 1),
(86, 'durante1', 'durante1@shit.co', '$2y$10$O4.GZJVr4BBYghS/7gbAtu2In4DNAS11EF/XerP./vd74gHlaKZLK', 1, '', 1, 1),
(87, 'durantu1', 'b1@gmail.com', '$2y$10$kadloJZCs2IeGC0tOsuGaeGh2nUKxhzbHLEAn8gKoaJqdJ.RzTkL2', 1, '', 1, 1),
(89, 'kobakoba1', 'kobakoba1@gmail.com', '$2y$10$YHZg7Zf8E9YvQY5t0bh41ONtDgbzZEUfMMz8TwERIaVMXAPynx.fC', 1, '', 1, 1),
(91, 'kobekobe1', 'kobekobe1@gmail.com', '$2y$10$XimPxe4RNCGiYPRC2dEFcew4rZVp4vU04Yk2wFe8wMA.VOciOBv8e', 1, '', 1, 1),
(94, 'kobikobi1', 'kobikobi1@gmail.com', '$2y$10$lpr7mAw6CYXPEGT61ANJ3eJTdLFDubu3dSb3/gsfqL6hfBSXC2sge', 1, '', 1, 1),
(95, 'kobokobo1', 'kobokobo1@gmail.com', '$2y$10$2jmB8Z.dnQ9RIBZ/ea8X4edUrTrzOW7UMjSFi9UQ.d09p9YB1gBN.', 1, '', 1, 1),
(96, 'kobukobu1', 'brenallen1.1x10e11@gmail.com', '$2y$10$im18mReVoqTiaLJkWMXn6e9npx84QfisJdfx89rDN7g5VBHCH8IMa', 1, NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `UsersAndLikes`
--

CREATE TABLE `UsersAndLikes` (
  `user_id` int(11) NOT NULL,
  `like_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `UsersAndLikes`
--

INSERT INTO `UsersAndLikes` (`user_id`, `like_id`) VALUES
(8, 1),
(8, 3),
(8, 19),
(8, 28),
(9, 1),
(9, 14),
(9, 15),
(9, 16),
(9, 17),
(9, 18),
(9, 24),
(10, 15),
(11, 34);

-- --------------------------------------------------------

--
-- Table structure for table `UserTypes`
--

CREATE TABLE `UserTypes` (
  `id` int(2) NOT NULL,
  `type_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `UserTypes`
--

INSERT INTO `UserTypes` (`id`, `type_name`) VALUES
(4, 'accountant'),
(2, 'admin'),
(5, 'legal'),
(3, 'owner'),
(1, 'user');

-- --------------------------------------------------------

--
-- Table structure for table `WorkExperience`
--

CREATE TABLE `WorkExperience` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_name` varchar(200) NOT NULL,
  `position` varchar(100) NOT NULL,
  `place` varchar(100) NOT NULL,
  `time_frame` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `WorkExperience`
--

INSERT INTO `WorkExperience` (`id`, `user_id`, `company_name`, `position`, `place`, `time_frame`) VALUES
(18, 8, 'American Eagle', 'Sales Associate', 'Makati, Philippines', 'Jun 2008 - Aug 2012'),
(8, 8, 'CrazyApesMedia', 'Producer', 'Markham, Ontario', '2012 - present'),
(7, 8, 'Petro Canada', 'Merchant', 'Toronto, Ontario', '2010 - 2012'),
(100, 8, 'Roger\'s Centre', 'Floor Supervisor', 'Toronto, Ontario', '2011 - 2012'),
(72, 9, 'Ripley s Aquarium', 'Super Man', 'Toronto, Canada', '2017 - present'),
(101, 9, 'Roger\'s Centre', 'Floor Manager', 'Toronto, Ontario', '2017 - present');

-- --------------------------------------------------------

--
-- Table structure for table `WorkTaskDescription`
--

CREATE TABLE `WorkTaskDescription` (
  `id` int(11) NOT NULL,
  `work_experience_id` int(11) NOT NULL,
  `description` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `WorkTaskDescription`
--

INSERT INTO `WorkTaskDescription` (`id`, `work_experience_id`, `description`) VALUES
(6, 7, 'Collaborated with the store merchandiser creating displays to attract clientele'),
(7, 7, 'Use my trend awareness to assist customers in their shopping experience'),
(8, 7, 'Thoroughly scan every piece of merchandise for inventory control'),
(9, 8, 'Build organizational skills by single handedly running all operating procedures'),
(10, 8, 'Received employee of the month award twice'),
(46, 18, 'Communicate with clients to fulfill their wants and needs'),
(47, 18, 'Process shipment to increase my product knowledge'),
(104, 72, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec pharetra lectus aliquam mauris finibus porta. Quisque eget diam mauris. Duis hendrerit est nisi, quis imperdiet libero blandit quis. Vestibulum ac nLorem ipsum dolor sit amet, consectetur adipiscing elit. Donec pharetra lectus aliquam mauris finibus porta. Quisque eget diam mauris. Duis hendrerit est nisi, quis imperdiet libero blandit quis. Vestibulum ac n'),
(105, 18, 'adipiscing elit. Donec pharetra lectus aliquam mauris finibus porta. Quisque eget dLorem ipsum dolor sit amet, consectetur adipiscing elit. Donec pharetra lectus aliquam mauris finibus porta. Quisque eget dLorem ipsum dolor sit amet, consectetur adipiscing elit. Donec pharetra lectus aliquam mauris finibus porta. Quisque eget d'),
(106, 72, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec pharetra lectus aliquam mauris finibus porta. Quisque eget diam mauris. Duis hendrerit est nisi, quis imperdiet libero blandit quis. Vestibulum ac n'),
(127, 100, 'abcedefdsf'),
(128, 101, 'Experience 1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `AccountStatus`
--
ALTER TABLE `AccountStatus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `Ad`
--
ALTER TABLE `Ad`
  ADD PRIMARY KEY (`id`),
  ADD KEY `producer_user_id` (`producer_user_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Indexes for table `Address`
--
ALTER TABLE `Address`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `id_2` (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `country_code` (`country_code`),
  ADD KEY `country_code_2` (`country_code`);

--
-- Indexes for table `AdStatus`
--
ALTER TABLE `AdStatus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `CartItems`
--
ALTER TABLE `CartItems`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cart_id_2` (`cart_id`,`item_id`),
  ADD KEY `id` (`id`),
  ADD KEY `cart_id` (`cart_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `ChatMessage`
--
ALTER TABLE `ChatMessage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_thread_id` (`chat_thread_id`),
  ADD KEY `chatter_user_id` (`chatter_user_id`);

--
-- Indexes for table `ChatMsgSeenLog`
--
ALTER TABLE `ChatMsgSeenLog`
  ADD PRIMARY KEY (`chat_msg_id`,`seen_by_user_id`),
  ADD UNIQUE KEY `chat_msg_id_2` (`chat_msg_id`,`seen_by_user_id`),
  ADD KEY `chat_msg_id` (`chat_msg_id`),
  ADD KEY `seen_by_user_id` (`seen_by_user_id`);

--
-- Indexes for table `ChatThread`
--
ALTER TABLE `ChatThread`
  ADD PRIMARY KEY (`id`),
  ADD KEY `initiator_user_id` (`initiator_user_id`),
  ADD KEY `responder_user_id` (`responder_user_id`);

--
-- Indexes for table `Country`
--
ALTER TABLE `Country`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `code_2` (`code`),
  ADD KEY `id_2` (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `code_3` (`code`),
  ADD KEY `name_2` (`name`),
  ADD KEY `id_3` (`id`),
  ADD KEY `code_4` (`code`);

--
-- Indexes for table `Friendship`
--
ALTER TABLE `Friendship`
  ADD PRIMARY KEY (`user_id`,`friend_id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`friend_id`),
  ADD KEY `friend_id` (`friend_id`);

--
-- Indexes for table `FriendshipNotifications`
--
ALTER TABLE `FriendshipNotifications`
  ADD PRIMARY KEY (`notified_user_id`,`notifier_user_id`,`notification_type_id`),
  ADD UNIQUE KEY `notified_user_id` (`notified_user_id`,`notifier_user_id`,`notification_type_id`),
  ADD KEY `notifier_user_id` (`notifier_user_id`),
  ADD KEY `notification_type_id` (`notification_type_id`);

--
-- Indexes for table `Invoice`
--
ALTER TABLE `Invoice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `seller_user_id` (`seller_user_id`),
  ADD KEY `buyer_user_id` (`buyer_user_id`),
  ADD KEY `ship_to_address_id` (`ship_to_address_id`),
  ADD KEY `ship_from_address_id` (`ship_from_address_id`);

--
-- Indexes for table `InvoiceItem`
--
ALTER TABLE `InvoiceItem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `id_2` (`id`),
  ADD KEY `invoice_id` (`invoice_id`),
  ADD KEY `store_item_id` (`store_item_id`);

--
-- Indexes for table `InvoiceItemStatus`
--
ALTER TABLE `InvoiceItemStatus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `id` (`id`),
  ADD KEY `id_2` (`id`);

--
-- Indexes for table `InvoiceItemStatusRecord`
--
ALTER TABLE `InvoiceItemStatusRecord`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `invoice_item_id_2` (`invoice_item_id`,`invoice_item_status_id`),
  ADD KEY `id` (`id`),
  ADD KEY `id_2` (`id`),
  ADD KEY `invoice_item_status_id` (`invoice_item_status_id`),
  ADD KEY `invoice_item_id` (`invoice_item_id`);

--
-- Indexes for table `ItemXTypes`
--
ALTER TABLE `ItemXTypes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `Likes`
--
ALTER TABLE `Likes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `MyStoreItems`
--
ALTER TABLE `MyStoreItems`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `id_2` (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `name` (`name`),
  ADD KEY `id_3` (`id`),
  ADD KEY `user_id_2` (`user_id`),
  ADD KEY `name_2` (`name`);

--
-- Indexes for table `MyVideos`
--
ALTER TABLE `MyVideos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `Notifications`
--
ALTER TABLE `Notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notified_user_id` (`notified_user_id`),
  ADD KEY `notification_msg_id` (`notification_msg_id`),
  ADD KEY `notifier_user_id` (`notifier_user_id`),
  ADD KEY `notification_msg_id_2` (`notification_msg_id`);

--
-- Indexes for table `NotificationsFriendship`
--
ALTER TABLE `NotificationsFriendship`
  ADD UNIQUE KEY `notification_id_2` (`notification_id`),
  ADD KEY `notification_id` (`notification_id`);

--
-- Indexes for table `NotificationsMsgs`
--
ALTER TABLE `NotificationsMsgs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `NotificationsMyShopping`
--
ALTER TABLE `NotificationsMyShopping`
  ADD UNIQUE KEY `notification_id_2` (`notification_id`),
  ADD KEY `notification_id` (`notification_id`),
  ADD KEY `invoice_item_id` (`invoice_item_id`),
  ADD KEY `invoice_Item_status_record_id` (`invoice_item_status_record_id`);

--
-- Indexes for table `NotificationsPost`
--
ALTER TABLE `NotificationsPost`
  ADD UNIQUE KEY `notification_id` (`notification_id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `NotificationsRateableItem`
--
ALTER TABLE `NotificationsRateableItem`
  ADD KEY `notification_id` (`notification_id`),
  ADD KEY `rateable_item_id` (`rateable_item_id`),
  ADD KEY `rate_value` (`rate_value`);

--
-- Indexes for table `NotificationTypes`
--
ALTER TABLE `NotificationTypes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `Photos`
--
ALTER TABLE `Photos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Profile`
--
ALTER TABLE `Profile`
  ADD UNIQUE KEY `user_id_2` (`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `RateableItems`
--
ALTER TABLE `RateableItems`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_x_id` (`item_x_id`),
  ADD KEY `item_x_type_id` (`item_x_type_id`);

--
-- Indexes for table `RateableItemsUsers`
--
ALTER TABLE `RateableItemsUsers`
  ADD PRIMARY KEY (`rateable_item_id`,`responder_user_id`),
  ADD KEY `responder_user_id` (`responder_user_id`),
  ADD KEY `rate_value` (`rate_value`);

--
-- Indexes for table `Rates`
--
ALTER TABLE `Rates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `value_2` (`value`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `value` (`value`),
  ADD KEY `value_3` (`value`);

--
-- Indexes for table `RefundItem`
--
ALTER TABLE `RefundItem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_item_id` (`invoice_item_id`);

--
-- Indexes for table `SalesNotification`
--
ALTER TABLE `SalesNotification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notified_user_id` (`notified_user_id`),
  ADD KEY `notifier_user_id` (`notifier_user_id`),
  ADD KEY `invoice_item_id` (`invoice_item_id`);

--
-- Indexes for table `SampleNotifications`
--
ALTER TABLE `SampleNotifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `StoreCart`
--
ALTER TABLE `StoreCart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `cart_id` (`cart_id`),
  ADD KEY `seller_user_id` (`seller_user_id`),
  ADD KEY `buyer_user_id` (`buyer_user_id`);

--
-- Indexes for table `TestHtmlEntities`
--
ALTER TABLE `TestHtmlEntities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `TimelinePostReplies`
--
ALTER TABLE `TimelinePostReplies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `parent_post_id` (`parent_post_id`),
  ADD KEY `owner_user_id` (`owner_user_id`),
  ADD KEY `poster_user_id` (`poster_user_id`);

--
-- Indexes for table `TimelinePosts`
--
ALTER TABLE `TimelinePosts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `owner_user_id` (`owner_user_id`),
  ADD KEY `id` (`id`),
  ADD KEY `poster_user_id` (`poster_user_id`),
  ADD KEY `id_2` (`id`);

--
-- Indexes for table `UserHostedAd`
--
ALTER TABLE `UserHostedAd`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `ad_id` (`ad_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Indexes for table `UserPayPalAccount`
--
ALTER TABLE `UserPayPalAccount`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `id_2` (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_name` (`user_name`),
  ADD KEY `user_type_id` (`user_type_id`),
  ADD KEY `account_status_id` (`account_status_id`);

--
-- Indexes for table `UsersAndLikes`
--
ALTER TABLE `UsersAndLikes`
  ADD PRIMARY KEY (`user_id`,`like_id`),
  ADD KEY `like_id` (`like_id`);

--
-- Indexes for table `UserTypes`
--
ALTER TABLE `UserTypes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `type_name` (`type_name`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `WorkExperience`
--
ALTER TABLE `WorkExperience`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id_2` (`user_id`,`company_name`,`position`,`place`,`time_frame`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `WorkTaskDescription`
--
ALTER TABLE `WorkTaskDescription`
  ADD PRIMARY KEY (`id`),
  ADD KEY `work_experience_id` (`work_experience_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `AccountStatus`
--
ALTER TABLE `AccountStatus`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `Ad`
--
ALTER TABLE `Ad`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `Address`
--
ALTER TABLE `Address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;
--
-- AUTO_INCREMENT for table `AdStatus`
--
ALTER TABLE `AdStatus`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `CartItems`
--
ALTER TABLE `CartItems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;
--
-- AUTO_INCREMENT for table `ChatMessage`
--
ALTER TABLE `ChatMessage`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;
--
-- AUTO_INCREMENT for table `ChatThread`
--
ALTER TABLE `ChatThread`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `Country`
--
ALTER TABLE `Country`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `InvoiceItem`
--
ALTER TABLE `InvoiceItem`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;
--
-- AUTO_INCREMENT for table `InvoiceItemStatus`
--
ALTER TABLE `InvoiceItemStatus`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `InvoiceItemStatusRecord`
--
ALTER TABLE `InvoiceItemStatusRecord`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=175;
--
-- AUTO_INCREMENT for table `ItemXTypes`
--
ALTER TABLE `ItemXTypes`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `Likes`
--
ALTER TABLE `Likes`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT for table `MyStoreItems`
--
ALTER TABLE `MyStoreItems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `MyVideos`
--
ALTER TABLE `MyVideos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `Notifications`
--
ALTER TABLE `Notifications`
  MODIFY `id` int(14) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=227;
--
-- AUTO_INCREMENT for table `NotificationsMsgs`
--
ALTER TABLE `NotificationsMsgs`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `NotificationTypes`
--
ALTER TABLE `NotificationTypes`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `Photos`
--
ALTER TABLE `Photos`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;
--
-- AUTO_INCREMENT for table `RateableItems`
--
ALTER TABLE `RateableItems`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `Rates`
--
ALTER TABLE `Rates`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `RefundItem`
--
ALTER TABLE `RefundItem`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `SalesNotification`
--
ALTER TABLE `SalesNotification`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `SampleNotifications`
--
ALTER TABLE `SampleNotifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `StoreCart`
--
ALTER TABLE `StoreCart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;
--
-- AUTO_INCREMENT for table `TestHtmlEntities`
--
ALTER TABLE `TestHtmlEntities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `TimelinePostReplies`
--
ALTER TABLE `TimelinePostReplies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `TimelinePosts`
--
ALTER TABLE `TimelinePosts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;
--
-- AUTO_INCREMENT for table `UserHostedAd`
--
ALTER TABLE `UserHostedAd`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `UserPayPalAccount`
--
ALTER TABLE `UserPayPalAccount`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;
--
-- AUTO_INCREMENT for table `UserTypes`
--
ALTER TABLE `UserTypes`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `WorkExperience`
--
ALTER TABLE `WorkExperience`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;
--
-- AUTO_INCREMENT for table `WorkTaskDescription`
--
ALTER TABLE `WorkTaskDescription`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `Ad`
--
ALTER TABLE `Ad`
  ADD CONSTRAINT `ad_ibfk_1` FOREIGN KEY (`producer_user_id`) REFERENCES `Users` (`user_id`),
  ADD CONSTRAINT `ad_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `AdStatus` (`id`);

--
-- Constraints for table `Address`
--
ALTER TABLE `Address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`),
  ADD CONSTRAINT `address_ibfk_2` FOREIGN KEY (`country_code`) REFERENCES `Country` (`code`);

--
-- Constraints for table `CartItems`
--
ALTER TABLE `CartItems`
  ADD CONSTRAINT `cartitems_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `StoreCart` (`cart_id`),
  ADD CONSTRAINT `cartitems_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `MyStoreItems` (`id`);

--
-- Constraints for table `ChatMessage`
--
ALTER TABLE `ChatMessage`
  ADD CONSTRAINT `chatmessage_ibfk_1` FOREIGN KEY (`chatter_user_id`) REFERENCES `Users` (`user_id`),
  ADD CONSTRAINT `chatmessage_ibfk_2` FOREIGN KEY (`chat_thread_id`) REFERENCES `ChatThread` (`id`);

--
-- Constraints for table `ChatMsgSeenLog`
--
ALTER TABLE `ChatMsgSeenLog`
  ADD CONSTRAINT `chatmsgseenlog_ibfk_1` FOREIGN KEY (`chat_msg_id`) REFERENCES `ChatMessage` (`id`),
  ADD CONSTRAINT `chatmsgseenlog_ibfk_2` FOREIGN KEY (`seen_by_user_id`) REFERENCES `Users` (`user_id`);

--
-- Constraints for table `ChatThread`
--
ALTER TABLE `ChatThread`
  ADD CONSTRAINT `chatthread_ibfk_1` FOREIGN KEY (`initiator_user_id`) REFERENCES `Users` (`user_id`),
  ADD CONSTRAINT `chatthread_ibfk_2` FOREIGN KEY (`responder_user_id`) REFERENCES `Users` (`user_id`);

--
-- Constraints for table `Friendship`
--
ALTER TABLE `Friendship`
  ADD CONSTRAINT `friendship_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`),
  ADD CONSTRAINT `friendship_ibfk_2` FOREIGN KEY (`friend_id`) REFERENCES `Users` (`user_id`);

--
-- Constraints for table `FriendshipNotifications`
--
ALTER TABLE `FriendshipNotifications`
  ADD CONSTRAINT `friendshipnotifications_ibfk_1` FOREIGN KEY (`notified_user_id`) REFERENCES `Users` (`user_id`),
  ADD CONSTRAINT `friendshipnotifications_ibfk_2` FOREIGN KEY (`notifier_user_id`) REFERENCES `Users` (`user_id`),
  ADD CONSTRAINT `friendshipnotifications_ibfk_3` FOREIGN KEY (`notification_type_id`) REFERENCES `NotificationTypes` (`id`);

--
-- Constraints for table `Invoice`
--
ALTER TABLE `Invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`seller_user_id`) REFERENCES `Users` (`user_id`),
  ADD CONSTRAINT `invoice_ibfk_2` FOREIGN KEY (`buyer_user_id`) REFERENCES `Users` (`user_id`),
  ADD CONSTRAINT `invoice_ibfk_3` FOREIGN KEY (`ship_to_address_id`) REFERENCES `Address` (`id`),
  ADD CONSTRAINT `invoice_ibfk_4` FOREIGN KEY (`ship_from_address_id`) REFERENCES `Address` (`id`);

--
-- Constraints for table `InvoiceItem`
--
ALTER TABLE `InvoiceItem`
  ADD CONSTRAINT `invoiceitem_ibfk_1` FOREIGN KEY (`invoice_id`) REFERENCES `Invoice` (`id`),
  ADD CONSTRAINT `invoiceitem_ibfk_2` FOREIGN KEY (`store_item_id`) REFERENCES `MyStoreItems` (`id`);

--
-- Constraints for table `InvoiceItemStatusRecord`
--
ALTER TABLE `InvoiceItemStatusRecord`
  ADD CONSTRAINT `invoiceitemstatusrecord_ibfk_1` FOREIGN KEY (`invoice_item_status_id`) REFERENCES `InvoiceItemStatus` (`id`),
  ADD CONSTRAINT `invoiceitemstatusrecord_ibfk_2` FOREIGN KEY (`invoice_item_id`) REFERENCES `InvoiceItem` (`id`);

--
-- Constraints for table `MyStoreItems`
--
ALTER TABLE `MyStoreItems`
  ADD CONSTRAINT `mystoreitems_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`);

--
-- Constraints for table `MyVideos`
--
ALTER TABLE `MyVideos`
  ADD CONSTRAINT `myvideos_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`);

--
-- Constraints for table `Notifications`
--
ALTER TABLE `Notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`notified_user_id`) REFERENCES `Users` (`user_id`),
  ADD CONSTRAINT `notifications_ibfk_2` FOREIGN KEY (`notifier_user_id`) REFERENCES `Users` (`user_id`),
  ADD CONSTRAINT `notifications_ibfk_3` FOREIGN KEY (`notification_msg_id`) REFERENCES `NotificationsMsgs` (`id`);

--
-- Constraints for table `NotificationsFriendship`
--
ALTER TABLE `NotificationsFriendship`
  ADD CONSTRAINT `notificationsfriendship_ibfk_1` FOREIGN KEY (`notification_id`) REFERENCES `Notifications` (`id`);

--
-- Constraints for table `NotificationsMyShopping`
--
ALTER TABLE `NotificationsMyShopping`
  ADD CONSTRAINT `notificationsmyshopping_ibfk_1` FOREIGN KEY (`notification_id`) REFERENCES `Notifications` (`id`),
  ADD CONSTRAINT `notificationsmyshopping_ibfk_2` FOREIGN KEY (`invoice_item_id`) REFERENCES `InvoiceItem` (`id`),
  ADD CONSTRAINT `notificationsmyshopping_ibfk_3` FOREIGN KEY (`invoice_Item_status_record_id`) REFERENCES `InvoiceItemStatusRecord` (`id`),
  ADD CONSTRAINT `notificationsmyshopping_ibfk_4` FOREIGN KEY (`invoice_item_status_record_id`) REFERENCES `InvoiceItemStatusRecord` (`id`);

--
-- Constraints for table `NotificationsPost`
--
ALTER TABLE `NotificationsPost`
  ADD CONSTRAINT `notificationspost_ibfk_1` FOREIGN KEY (`notification_id`) REFERENCES `Notifications` (`id`),
  ADD CONSTRAINT `notificationspost_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `TimelinePosts` (`id`);

--
-- Constraints for table `NotificationsRateableItem`
--
ALTER TABLE `NotificationsRateableItem`
  ADD CONSTRAINT `notificationsrateableitem_ibfk_1` FOREIGN KEY (`notification_id`) REFERENCES `Notifications` (`id`),
  ADD CONSTRAINT `notificationsrateableitem_ibfk_2` FOREIGN KEY (`rateable_item_id`) REFERENCES `RateableItems` (`id`),
  ADD CONSTRAINT `notificationsrateableitem_ibfk_3` FOREIGN KEY (`rate_value`) REFERENCES `Rates` (`value`);

--
-- Constraints for table `Profile`
--
ALTER TABLE `Profile`
  ADD CONSTRAINT `profile_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`);

--
-- Constraints for table `RateableItems`
--
ALTER TABLE `RateableItems`
  ADD CONSTRAINT `rateableitems_ibfk_2` FOREIGN KEY (`item_x_type_id`) REFERENCES `ItemXTypes` (`id`);

--
-- Constraints for table `RateableItemsUsers`
--
ALTER TABLE `RateableItemsUsers`
  ADD CONSTRAINT `rateableitemsusers_ibfk_1` FOREIGN KEY (`rateable_item_id`) REFERENCES `RateableItems` (`id`),
  ADD CONSTRAINT `rateableitemsusers_ibfk_2` FOREIGN KEY (`responder_user_id`) REFERENCES `Users` (`user_id`),
  ADD CONSTRAINT `rateableitemsusers_ibfk_3` FOREIGN KEY (`rate_value`) REFERENCES `Rates` (`value`);

--
-- Constraints for table `RefundItem`
--
ALTER TABLE `RefundItem`
  ADD CONSTRAINT `refunditem_ibfk_1` FOREIGN KEY (`invoice_item_id`) REFERENCES `InvoiceItem` (`id`);

--
-- Constraints for table `SalesNotification`
--
ALTER TABLE `SalesNotification`
  ADD CONSTRAINT `salesnotification_ibfk_1` FOREIGN KEY (`notified_user_id`) REFERENCES `Users` (`user_id`),
  ADD CONSTRAINT `salesnotification_ibfk_2` FOREIGN KEY (`notifier_user_id`) REFERENCES `Users` (`user_id`),
  ADD CONSTRAINT `salesnotification_ibfk_3` FOREIGN KEY (`invoice_item_id`) REFERENCES `InvoiceItem` (`id`);

--
-- Constraints for table `StoreCart`
--
ALTER TABLE `StoreCart`
  ADD CONSTRAINT `storecart_ibfk_1` FOREIGN KEY (`seller_user_id`) REFERENCES `Users` (`user_id`),
  ADD CONSTRAINT `storecart_ibfk_2` FOREIGN KEY (`buyer_user_id`) REFERENCES `Users` (`user_id`);

--
-- Constraints for table `TimelinePostReplies`
--
ALTER TABLE `TimelinePostReplies`
  ADD CONSTRAINT `timelinepostreplies_ibfk_1` FOREIGN KEY (`parent_post_id`) REFERENCES `TimelinePosts` (`id`),
  ADD CONSTRAINT `timelinepostreplies_ibfk_2` FOREIGN KEY (`owner_user_id`) REFERENCES `Users` (`user_id`),
  ADD CONSTRAINT `timelinepostreplies_ibfk_3` FOREIGN KEY (`poster_user_id`) REFERENCES `Users` (`user_id`);

--
-- Constraints for table `TimelinePosts`
--
ALTER TABLE `TimelinePosts`
  ADD CONSTRAINT `timelineposts_ibfk_1` FOREIGN KEY (`owner_user_id`) REFERENCES `Users` (`user_id`),
  ADD CONSTRAINT `timelineposts_ibfk_2` FOREIGN KEY (`poster_user_id`) REFERENCES `Users` (`user_id`);

--
-- Constraints for table `UserHostedAd`
--
ALTER TABLE `UserHostedAd`
  ADD CONSTRAINT `userhostedad_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`),
  ADD CONSTRAINT `userhostedad_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `AdStatus` (`id`),
  ADD CONSTRAINT `userhostedad_ibfk_3` FOREIGN KEY (`ad_id`) REFERENCES `Ad` (`id`);

--
-- Constraints for table `UserPayPalAccount`
--
ALTER TABLE `UserPayPalAccount`
  ADD CONSTRAINT `userpaypalaccount_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`);

--
-- Constraints for table `Users`
--
ALTER TABLE `Users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`user_type_id`) REFERENCES `UserTypes` (`id`),
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`account_status_id`) REFERENCES `AccountStatus` (`id`);

--
-- Constraints for table `UsersAndLikes`
--
ALTER TABLE `UsersAndLikes`
  ADD CONSTRAINT `usersandlikes_ibfk_1` FOREIGN KEY (`like_id`) REFERENCES `Likes` (`id`),
  ADD CONSTRAINT `usersandlikes_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`);

--
-- Constraints for table `WorkExperience`
--
ALTER TABLE `WorkExperience`
  ADD CONSTRAINT `workexperience_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`);

--
-- Constraints for table `WorkTaskDescription`
--
ALTER TABLE `WorkTaskDescription`
  ADD CONSTRAINT `worktaskdescription_ibfk_1` FOREIGN KEY (`work_experience_id`) REFERENCES `WorkExperience` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
