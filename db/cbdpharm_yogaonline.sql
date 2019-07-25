-- phpMyAdmin SQL Dump
-- version 4.0.10.17
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 21, 2019 at 01:57 PM
-- Server version: 5.6.43-84.3-log
-- PHP Version: 5.6.37

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cbdpharm_yogaonline`
--

-- --------------------------------------------------------

--
-- Table structure for table `adminnotification_inbox`
--

CREATE TABLE IF NOT EXISTS `adminnotification_inbox` (
  `notification_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Notification id',
  `severity` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Problem type',
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Create date',
  `title` varchar(255) NOT NULL COMMENT 'Title',
  `description` text COMMENT 'Description',
  `url` varchar(255) DEFAULT NULL COMMENT 'Url',
  `is_read` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Flag if notification read',
  `is_remove` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Flag if notification might be removed',
  PRIMARY KEY (`notification_id`),
  KEY `ADMINNOTIFICATION_INBOX_SEVERITY` (`severity`),
  KEY `ADMINNOTIFICATION_INBOX_IS_READ` (`is_read`),
  KEY `ADMINNOTIFICATION_INBOX_IS_REMOVE` (`is_remove`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Adminnotification Inbox' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `adminnotification_inbox`
--

INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES
(1, 4, '2018-12-06 05:00:06', 'Deprecation Notice', 'Catalog Search is currently configured to use the MySQL engine, which has been deprecated. Consider migrating to one of\nthe Elasticsearch engines now to ensure there are no service interruptions during your next upgrade.', '', 0, 0),
(2, 4, '2018-12-12 22:08:04', 'What does 2019 look like for you? Take our Retail Trends survey!', 'Let us know what''s important to you and your business in 2019!\n\nWe invite you to take our retail trends survey which should take no more than a few minutes to complete. As always, any individual information you provide will remain strictly confidential.\n\nYou can take the survey at: \nwww.surveymonkey.com/r/GHNQTJ2\n', 'https://www.surveymonkey.com/r/GHNQTJ2', 0, 0),
(3, 4, '2018-12-18 22:29:42', 'Take our brief product survey.', 'We are evaluating adding a media library into the Magento content management system to enable merchants to access their own saved media without re-uploading it each time. This media library may also potentially include third-party stock media with a selection of free and paid media (images, videos, etc.). \n\nTake our survey here:\nhttps://www.surveymonkey.com/r/MWJJWQP\n\nYour survey answers will help us determine the level of interest in these features.', 'https://www.surveymonkey.com/r/MWJJWQP', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `admin_passwords`
--

CREATE TABLE IF NOT EXISTS `admin_passwords` (
  `password_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Password Id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'User Id',
  `password_hash` varchar(100) DEFAULT NULL COMMENT 'Password Hash',
  `expires` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Deprecated',
  `last_updated` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Last Updated',
  PRIMARY KEY (`password_id`),
  KEY `ADMIN_PASSWORDS_USER_ID` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Admin Passwords' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `admin_passwords`
--

INSERT INTO `admin_passwords` (`password_id`, `user_id`, `password_hash`, `expires`, `last_updated`) VALUES
(1, 1, '0bd3fce654d6c4cba31e6e378bd88c6d9f3dc2956d7de9766a2c7db7bace8e92:63QvDNeFPrnV6H5gVV6GuhGkXTntJu22:1', 0, 1544072410);

-- --------------------------------------------------------

--
-- Table structure for table `admin_system_messages`
--

CREATE TABLE IF NOT EXISTS `admin_system_messages` (
  `identity` varchar(100) NOT NULL COMMENT 'Message id',
  `severity` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Problem type',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Create date',
  PRIMARY KEY (`identity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Admin System Messages';

-- --------------------------------------------------------

--
-- Table structure for table `admin_user`
--

CREATE TABLE IF NOT EXISTS `admin_user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'User ID',
  `firstname` varchar(32) DEFAULT NULL COMMENT 'User First Name',
  `lastname` varchar(32) DEFAULT NULL COMMENT 'User Last Name',
  `email` varchar(128) DEFAULT NULL COMMENT 'User Email',
  `username` varchar(40) DEFAULT NULL COMMENT 'User Login',
  `password` varchar(255) NOT NULL COMMENT 'User Password',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'User Created Time',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'User Modified Time',
  `logdate` timestamp NULL DEFAULT NULL COMMENT 'User Last Login Time',
  `lognum` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'User Login Number',
  `reload_acl_flag` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Reload ACL',
  `is_active` smallint(6) NOT NULL DEFAULT '1' COMMENT 'User Is Active',
  `extra` text COMMENT 'User Extra Data',
  `rp_token` text COMMENT 'Reset Password Link Token',
  `rp_token_created_at` timestamp NULL DEFAULT NULL COMMENT 'Reset Password Link Token Creation Date',
  `interface_locale` varchar(16) NOT NULL DEFAULT 'en_US' COMMENT 'Backend interface locale',
  `failures_num` smallint(6) DEFAULT '0' COMMENT 'Failure Number',
  `first_failure` timestamp NULL DEFAULT NULL COMMENT 'First Failure',
  `lock_expires` timestamp NULL DEFAULT NULL COMMENT 'Expiration Lock Dates',
  `refresh_token` text COMMENT 'Email connector refresh token',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `ADMIN_USER_USERNAME` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Admin User Table' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `admin_user`
--

INSERT INTO `admin_user` (`user_id`, `firstname`, `lastname`, `email`, `username`, `password`, `created`, `modified`, `logdate`, `lognum`, `reload_acl_flag`, `is_active`, `extra`, `rp_token`, `rp_token_created_at`, `interface_locale`, `failures_num`, `first_failure`, `lock_expires`, `refresh_token`) VALUES
(1, 'rajat', 'rajat', 'rajat@internetsearchinc.com', 'rajat', '0bd3fce654d6c4cba31e6e378bd88c6d9f3dc2956d7de9766a2c7db7bace8e92:63QvDNeFPrnV6H5gVV6GuhGkXTntJu22:1', '2018-12-06 05:00:10', '2019-01-02 04:08:49', '2019-01-02 03:39:41', 39, 0, 1, '{"configState":{"admin_security":"1","admin_emails":"0","admin_startup":"0","admin_url":"0","admin_dashboard":"0","admin_captcha":"0","dev_debug":"1","dev_front_end_development_workflow":"0","dev_restrict":"1","dev_template":"1","dev_translate_inline":"1","dev_syslog":"1","dev_js":"1","dev_css":"1","dev_image":"0","dev_static":"1","dev_grid":"0","web_default_layouts":"1","web_default":"1","cms_wysiwyg":"1","catalog_frontend":"1","web_url":"0","web_seo":"0","web_unsecure":"0","web_secure":"0","web_cookie":"0","web_session":"0","web_browser_capabilities":"0"}}', NULL, NULL, 'en_US', 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_user_session`
--

CREATE TABLE IF NOT EXISTS `admin_user_session` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `session_id` varchar(128) NOT NULL COMMENT 'Session id value',
  `user_id` int(10) unsigned DEFAULT NULL COMMENT 'Admin User ID',
  `status` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Current Session status',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created Time',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update Time',
  `ip` varchar(15) NOT NULL COMMENT 'Remote user IP',
  PRIMARY KEY (`id`),
  KEY `ADMIN_USER_SESSION_SESSION_ID` (`session_id`),
  KEY `ADMIN_USER_SESSION_USER_ID` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Admin User sessions table' AUTO_INCREMENT=41 ;

--
-- Dumping data for table `admin_user_session`
--

INSERT INTO `admin_user_session` (`id`, `session_id`, `user_id`, `status`, `created_at`, `updated_at`, `ip`) VALUES
(1, '11228f680681f0a05f0cfe558a9a57f0', 1, 2, '2018-12-06 10:29:51', '2018-12-07 13:27:36', '122.163.210.82'),
(2, 'e74eaea0ffc5feced6b7abf54c22a66d', 1, 2, '2018-12-06 12:05:55', '2018-12-07 13:27:36', '122.163.210.82'),
(3, 'df13c1958dbac874658537d83552ec20', 1, 2, '2018-12-06 12:53:56', '2018-12-07 13:27:36', '122.163.210.82'),
(4, '8d622976f7f661d5f455831f2051c134', 1, 2, '2018-12-06 14:26:48', '2018-12-07 13:27:36', '122.163.210.82'),
(5, '312ea338127b31547fe08509c1ae2cb3', 1, 2, '2018-12-07 13:27:36', '2018-12-08 09:25:58', '122.163.234.71'),
(6, 'f71c02b4a9cb2e6f8dff305f9e0b31b0', 1, 2, '2018-12-08 09:25:58', '2018-12-08 09:27:04', '110.227.126.234'),
(7, '2031b9fa07303004f9beeec8317133fe', 1, 2, '2018-12-08 09:27:04', '2018-12-08 15:24:30', '110.227.126.234'),
(8, 'b6e7086e409966216bb619d4273cec56', 1, 2, '2018-12-08 15:24:30', '2018-12-09 13:53:12', '110.227.126.234'),
(9, 'b985fa92466a03e9db986b335af358bd', 1, 2, '2018-12-09 13:53:12', '2018-12-13 07:48:42', '110.227.126.234'),
(10, '0b71708d42653c80dd8938a3a8778552', 1, 2, '2018-12-13 07:48:41', '2018-12-14 08:35:43', '122.163.163.134'),
(11, '2cfa58540195db2bc111a59bd0ef37f1', 1, 2, '2018-12-14 08:35:43', '2018-12-17 19:19:45', '122.163.166.201'),
(12, '1f889a012bbdef1f360f55f5622605a1', 1, 2, '2018-12-17 19:19:45', '2018-12-18 12:34:38', '171.79.103.86'),
(13, '6af61676c4493e5ff0bf87d2a92bf6e6', 1, 2, '2018-12-18 12:34:38', '2018-12-19 14:43:28', '122.163.166.201'),
(14, '20af636a62db501d7d985d9b5485e129', 1, 2, '2018-12-19 14:43:28', '2018-12-21 14:49:29', '122.163.243.249'),
(15, '1a0ce26de44b19c1916895ab78d2052d', 1, 2, '2018-12-21 14:49:29', '2018-12-21 19:22:50', '69.12.70.105'),
(16, '6a1ebb96ff748807b0007da13905f676', 1, 2, '2018-12-21 19:22:50', '2018-12-22 15:07:42', '209.58.142.218'),
(17, 'c448e7237e3f3018b4113231cf797ebc', 1, 2, '2018-12-22 15:07:42', '2018-12-23 13:40:36', '122.163.243.249'),
(18, 'bf855e0141ab7f3fc946e6c774f65b32', 1, 0, '2018-12-23 13:40:36', '2018-12-25 13:20:21', '122.163.250.59'),
(19, 'eb7461843878308b97d16fbc3258b054', 1, 2, '2018-12-25 13:21:30', '2018-12-25 13:29:24', '112.196.171.84'),
(20, '16ea6e799bb939c099ab6319d304221c', 1, 2, '2018-12-25 13:29:24', '2018-12-26 08:35:48', '96.44.135.122'),
(21, '', NULL, 0, '2018-12-25 17:35:31', '2018-12-25 17:35:31', ''),
(22, 'aac20e5864e980589bd92b7f7edf516b', 1, 2, '2018-12-26 08:35:48', '2018-12-27 12:56:09', '171.79.102.146'),
(23, '632b65699e0637af531721b9328c4c3a', 1, 2, '2018-12-27 12:56:09', '2018-12-27 17:36:54', '171.79.102.146'),
(24, 'b153625efe721c3338e074ceec4e2985', 1, 2, '2018-12-27 17:36:54', '2018-12-27 18:15:16', '112.196.171.145'),
(25, '2b7489f2e7df1c9d99a6436ded2a29fc', 1, 2, '2018-12-27 18:15:16', '2018-12-28 13:22:55', '171.79.102.146'),
(26, '29bfd7faa96da040bd6f331849c70a82', 1, 2, '2018-12-28 13:22:55', '2018-12-28 17:13:55', '171.79.102.146'),
(27, '4620829df77029229b06ac3862d5feb3', 1, 2, '2018-12-28 17:13:55', '2018-12-28 17:31:59', '112.196.171.239'),
(28, '3412516b32b4a115c9ec8621e6b246c5', 1, 2, '2018-12-28 17:31:59', '2018-12-28 17:49:41', '171.79.102.146'),
(29, '775ca3e65f1b5e74cc000ef3fb93c7f9', 1, 2, '2018-12-28 17:49:41', '2018-12-28 17:58:50', '112.196.171.239'),
(30, '8d12c0c60a6347e5019fc0a6b7564cdd', 1, 2, '2018-12-28 17:58:50', '2018-12-29 05:32:58', '171.79.102.146'),
(31, '8a938a6d45baa513fc3a045ef721d144', 1, 2, '2018-12-29 05:32:58', '2018-12-29 14:42:12', '112.196.171.70'),
(32, '0e5e519268cdc8a949a4bba08b9d5284', 1, 2, '2018-12-29 14:42:12', '2018-12-29 17:12:36', '122.163.185.157'),
(33, '72757e6efbee95636958d2ea803c2f82', 1, 2, '2018-12-29 17:12:36', '2018-12-29 17:29:47', '112.196.171.70'),
(34, '26cef8a4a4c1645b67be125e6af09e1b', 1, 2, '2018-12-29 17:29:47', '2018-12-29 17:35:46', '122.163.185.157'),
(35, '78c73beadf412cd96dced44b3accee54', 1, 0, '2018-12-29 17:35:46', '2018-12-29 17:39:16', '112.196.171.70'),
(36, '93ff047dcbdef7d2984a7be7b07a3239', 1, 2, '2018-12-29 17:41:31', '2018-12-31 13:41:49', '122.163.185.157'),
(37, '604599a0b7fa186572336be02de149db', 1, 2, '2018-12-31 13:41:49', '2019-01-01 12:31:08', '23.105.110.216'),
(38, '2b36b0d56618794bbf45b46ae568620a', 1, 2, '2019-01-01 12:31:08', '2019-01-01 16:48:05', '110.227.118.63'),
(39, 'e60592203356dae68476e376618c4ada', 1, 2, '2019-01-01 16:48:05', '2019-01-02 03:39:41', '110.227.118.63'),
(40, '1b61742ac330a2c0e1a1da16cf820248', 1, 1, '2019-01-02 03:39:41', '2019-01-02 04:08:49', '110.227.118.63');

-- --------------------------------------------------------

--
-- Table structure for table `amazon_customer`
--

CREATE TABLE IF NOT EXISTS `amazon_customer` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity_id',
  `customer_id` int(10) unsigned NOT NULL COMMENT 'Customer_id',
  `amazon_id` varchar(255) NOT NULL COMMENT 'Amazon_id',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `AMAZON_CUSTOMER_CUSTOMER_ID_AMAZON_ID` (`customer_id`,`amazon_id`),
  UNIQUE KEY `AMAZON_CUSTOMER_CUSTOMER_ID` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='amazon_customer' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `amazon_pending_authorization`
--

CREATE TABLE IF NOT EXISTS `amazon_pending_authorization` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity_id',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order_id',
  `payment_id` int(10) unsigned NOT NULL COMMENT 'Payment_id',
  `authorization_id` varchar(255) DEFAULT NULL COMMENT 'Authorization_id',
  `created_at` datetime NOT NULL COMMENT 'Created_at',
  `updated_at` datetime DEFAULT NULL COMMENT 'Updated_at',
  `processed` smallint(5) unsigned DEFAULT '0' COMMENT 'Initial authorization processed',
  `capture` smallint(5) unsigned DEFAULT '0' COMMENT 'Initial authorization has capture',
  `capture_id` varchar(255) DEFAULT NULL COMMENT 'Initial authorization capture id',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `UNQ_E6CCA08713FB32BB136A56837009C371` (`order_id`,`payment_id`,`authorization_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='amazon_pending_authorization' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `amazon_pending_capture`
--

CREATE TABLE IF NOT EXISTS `amazon_pending_capture` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity_id',
  `capture_id` varchar(255) NOT NULL COMMENT 'Capture_id',
  `created_at` datetime NOT NULL COMMENT 'Created_at',
  `order_id` int(10) unsigned NOT NULL COMMENT 'order id',
  `payment_id` int(10) unsigned NOT NULL COMMENT 'payment id',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `AMAZON_PENDING_CAPTURE_ORDER_ID_PAYMENT_ID_CAPTURE_ID` (`order_id`,`payment_id`,`capture_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='amazon_pending_capture' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `amazon_pending_refund`
--

CREATE TABLE IF NOT EXISTS `amazon_pending_refund` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity_id',
  `refund_id` varchar(255) NOT NULL COMMENT 'Refund_id',
  `created_at` datetime NOT NULL COMMENT 'Created_at',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order_id',
  `payment_id` int(10) unsigned NOT NULL COMMENT 'Payment_id',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `AMAZON_PENDING_REFUND_ORDER_ID_PAYMENT_ID_REFUND_ID` (`order_id`,`payment_id`,`refund_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='amazon_pending_refund' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `amazon_quote`
--

CREATE TABLE IF NOT EXISTS `amazon_quote` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `quote_id` int(10) unsigned NOT NULL COMMENT 'Quote ID',
  `amazon_order_reference_id` varchar(255) NOT NULL COMMENT 'Amazon Order Reference ID',
  `sandbox_simulation_reference` varchar(255) DEFAULT NULL COMMENT 'Sandbox simulation reference',
  `confirmed` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Quote confirmed with Amazon',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `AMAZON_QUOTE_QUOTE_ID` (`quote_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='amazon_quote' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `amazon_sales_order`
--

CREATE TABLE IF NOT EXISTS `amazon_sales_order` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order ID',
  `amazon_order_reference_id` varchar(255) NOT NULL COMMENT 'Amazon Order Reference ID',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `AMAZON_SALES_ORDER_ORDER_ID` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='amazon_sales_order' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `authorization_role`
--

CREATE TABLE IF NOT EXISTS `authorization_role` (
  `role_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Role ID',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Parent Role ID',
  `tree_level` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Role Tree Level',
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Role Sort Order',
  `role_type` varchar(1) NOT NULL DEFAULT '0' COMMENT 'Role Type',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'User ID',
  `user_type` varchar(16) DEFAULT NULL COMMENT 'User Type',
  `role_name` varchar(50) DEFAULT NULL COMMENT 'Role Name',
  PRIMARY KEY (`role_id`),
  KEY `AUTHORIZATION_ROLE_PARENT_ID_SORT_ORDER` (`parent_id`,`sort_order`),
  KEY `AUTHORIZATION_ROLE_TREE_LEVEL` (`tree_level`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Admin Role Table' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `authorization_role`
--

INSERT INTO `authorization_role` (`role_id`, `parent_id`, `tree_level`, `sort_order`, `role_type`, `user_id`, `user_type`, `role_name`) VALUES
(1, 0, 1, 1, 'G', 0, '2', 'Administrators'),
(2, 1, 2, 0, 'U', 1, '2', 'rajat');

-- --------------------------------------------------------

--
-- Table structure for table `authorization_rule`
--

CREATE TABLE IF NOT EXISTS `authorization_rule` (
  `rule_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule ID',
  `role_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Role ID',
  `resource_id` varchar(255) DEFAULT NULL COMMENT 'Resource ID',
  `privileges` varchar(20) DEFAULT NULL COMMENT 'Privileges',
  `permission` varchar(10) DEFAULT NULL COMMENT 'Permission',
  PRIMARY KEY (`rule_id`),
  KEY `AUTHORIZATION_RULE_RESOURCE_ID_ROLE_ID` (`resource_id`,`role_id`),
  KEY `AUTHORIZATION_RULE_ROLE_ID_RESOURCE_ID` (`role_id`,`resource_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Admin Rule Table' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `authorization_rule`
--

INSERT INTO `authorization_rule` (`rule_id`, `role_id`, `resource_id`, `privileges`, `permission`) VALUES
(1, 1, 'Magento_Backend::all', NULL, 'allow');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE IF NOT EXISTS `cache` (
  `id` varchar(200) NOT NULL COMMENT 'Cache Id',
  `data` mediumblob COMMENT 'Cache Data',
  `create_time` int(11) DEFAULT NULL COMMENT 'Cache Creation Time',
  `update_time` int(11) DEFAULT NULL COMMENT 'Time of Cache Updating',
  `expire_time` int(11) DEFAULT NULL COMMENT 'Cache Expiration Time',
  PRIMARY KEY (`id`),
  KEY `CACHE_EXPIRE_TIME` (`expire_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Caches';

-- --------------------------------------------------------

--
-- Table structure for table `cache_tag`
--

CREATE TABLE IF NOT EXISTS `cache_tag` (
  `tag` varchar(100) NOT NULL COMMENT 'Tag',
  `cache_id` varchar(200) NOT NULL COMMENT 'Cache Id',
  PRIMARY KEY (`tag`,`cache_id`),
  KEY `CACHE_TAG_CACHE_ID` (`cache_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tag Caches';

-- --------------------------------------------------------

--
-- Table structure for table `captcha_log`
--

CREATE TABLE IF NOT EXISTS `captcha_log` (
  `type` varchar(32) NOT NULL COMMENT 'Type',
  `value` varchar(32) NOT NULL COMMENT 'Value',
  `count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Count',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Update Time',
  PRIMARY KEY (`type`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Count Login Attempts';

--
-- Dumping data for table `captcha_log`
--

INSERT INTO `captcha_log` (`type`, `value`, `count`, `updated_at`) VALUES
('1', '112.196.171.86', 1, '2018-12-23 14:00:18'),
('2', 'admin', 2, '2018-12-25 13:18:22'),
('2', 'developer', 1, '2018-12-25 13:16:39');

-- --------------------------------------------------------

--
-- Table structure for table `cataloginventory_stock`
--

CREATE TABLE IF NOT EXISTS `cataloginventory_stock` (
  `stock_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Stock Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `stock_name` varchar(255) DEFAULT NULL COMMENT 'Stock Name',
  PRIMARY KEY (`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `cataloginventory_stock`
--

INSERT INTO `cataloginventory_stock` (`stock_id`, `website_id`, `stock_name`) VALUES
(1, 0, 'Default');

-- --------------------------------------------------------

--
-- Table structure for table `cataloginventory_stock_item`
--

CREATE TABLE IF NOT EXISTS `cataloginventory_stock_item` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Item Id',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product Id',
  `stock_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Stock Id',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `min_qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Min Qty',
  `use_config_min_qty` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Min Qty',
  `is_qty_decimal` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Qty Decimal',
  `backorders` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Backorders',
  `use_config_backorders` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Backorders',
  `min_sale_qty` decimal(12,4) NOT NULL DEFAULT '1.0000' COMMENT 'Min Sale Qty',
  `use_config_min_sale_qty` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Min Sale Qty',
  `max_sale_qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Max Sale Qty',
  `use_config_max_sale_qty` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Max Sale Qty',
  `is_in_stock` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is In Stock',
  `low_stock_date` timestamp NULL DEFAULT NULL COMMENT 'Low Stock Date',
  `notify_stock_qty` decimal(12,4) DEFAULT NULL COMMENT 'Notify Stock Qty',
  `use_config_notify_stock_qty` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Notify Stock Qty',
  `manage_stock` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Manage Stock',
  `use_config_manage_stock` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Manage Stock',
  `stock_status_changed_auto` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Stock Status Changed Automatically',
  `use_config_qty_increments` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Qty Increments',
  `qty_increments` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty Increments',
  `use_config_enable_qty_inc` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Enable Qty Increments',
  `enable_qty_increments` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Enable Qty Increments',
  `is_decimal_divided` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Divided into Multiple Boxes for Shipping',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website ID',
  PRIMARY KEY (`item_id`),
  UNIQUE KEY `CATALOGINVENTORY_STOCK_ITEM_PRODUCT_ID_STOCK_ID` (`product_id`,`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_ITEM_WEBSITE_ID` (`website_id`),
  KEY `CATALOGINVENTORY_STOCK_ITEM_STOCK_ID` (`stock_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock Item' AUTO_INCREMENT=25 ;

--
-- Dumping data for table `cataloginventory_stock_item`
--

INSERT INTO `cataloginventory_stock_item` (`item_id`, `product_id`, `stock_id`, `qty`, `min_qty`, `use_config_min_qty`, `is_qty_decimal`, `backorders`, `use_config_backorders`, `min_sale_qty`, `use_config_min_sale_qty`, `max_sale_qty`, `use_config_max_sale_qty`, `is_in_stock`, `low_stock_date`, `notify_stock_qty`, `use_config_notify_stock_qty`, `manage_stock`, `use_config_manage_stock`, `stock_status_changed_auto`, `use_config_qty_increments`, `qty_increments`, `use_config_enable_qty_inc`, `enable_qty_increments`, `is_decimal_divided`, `website_id`) VALUES
(1, 1, 1, 100.0000, 0.0000, 1, 0, 0, 1, 1.0000, 1, 10000.0000, 1, 1, NULL, 1.0000, 1, 1, 1, 0, 1, 1.0000, 1, 0, 0, 0),
(2, 2, 1, 100.0000, 0.0000, 1, 0, 0, 1, 1.0000, 1, 10000.0000, 1, 1, NULL, 1.0000, 1, 1, 1, 0, 1, 1.0000, 1, 0, 0, 0),
(3, 3, 1, 100.0000, 0.0000, 1, 0, 0, 1, 1.0000, 1, 10000.0000, 1, 1, NULL, 1.0000, 1, 1, 1, 0, 1, 1.0000, 1, 0, 0, 0),
(4, 4, 1, 100.0000, 0.0000, 1, 0, 0, 1, 1.0000, 1, 10000.0000, 1, 1, NULL, 1.0000, 1, 1, 1, 0, 1, 1.0000, 1, 0, 0, 0),
(5, 5, 1, 100.0000, 0.0000, 1, 0, 0, 1, 1.0000, 1, 10000.0000, 1, 1, NULL, 1.0000, 1, 1, 1, 0, 1, 1.0000, 1, 0, 0, 0),
(6, 6, 1, 100.0000, 0.0000, 1, 0, 0, 1, 1.0000, 1, 10000.0000, 1, 1, NULL, 1.0000, 1, 1, 1, 0, 1, 1.0000, 1, 0, 0, 0),
(7, 7, 1, 100.0000, 0.0000, 1, 0, 0, 1, 1.0000, 1, 10000.0000, 1, 1, NULL, 1.0000, 1, 1, 1, 0, 1, 1.0000, 1, 0, 0, 0),
(8, 8, 1, 100.0000, 0.0000, 1, 0, 0, 1, 1.0000, 1, 10000.0000, 1, 1, NULL, 1.0000, 1, 1, 1, 0, 1, 1.0000, 1, 0, 0, 0),
(10, 10, 1, 100.0000, 0.0000, 1, 0, 0, 1, 1.0000, 1, 10000.0000, 1, 1, NULL, 1.0000, 1, 1, 1, 0, 1, 1.0000, 1, 0, 0, 0),
(12, 12, 1, 100.0000, 0.0000, 1, 0, 0, 1, 1.0000, 1, 10000.0000, 1, 1, NULL, 1.0000, 1, 1, 1, 0, 1, 1.0000, 1, 0, 0, 0),
(13, 13, 1, 0.0000, 0.0000, 1, 0, 0, 1, 1.0000, 1, 10000.0000, 1, 0, '2018-12-20 14:47:08', 1.0000, 1, 1, 1, 1, 1, 1.0000, 1, 0, 0, 0),
(15, 15, 1, 0.0000, 0.0000, 1, 0, 0, 1, 1.0000, 1, 10000.0000, 1, 0, '2018-12-25 19:26:31', 1.0000, 1, 1, 1, 1, 1, 1.0000, 1, 0, 0, 0),
(16, 16, 1, 0.0000, 0.0000, 1, 0, 0, 1, 1.0000, 1, 10000.0000, 1, 0, '2018-12-20 14:47:21', 1.0000, 1, 1, 1, 1, 1, 1.0000, 1, 0, 0, 0),
(17, 17, 1, 0.0000, 0.0000, 1, 0, 0, 1, 1.0000, 1, 10000.0000, 1, 0, '2018-12-20 14:55:54', 1.0000, 1, 1, 1, 1, 1, 1.0000, 1, 0, 0, 0),
(19, 19, 1, 0.0000, 0.0000, 1, 0, 0, 1, 1.0000, 1, 10000.0000, 1, 1, NULL, 1.0000, 1, 1, 1, 0, 1, 1.0000, 1, 0, 0, 0),
(20, 20, 1, 100.0000, 0.0000, 1, 0, 0, 1, 1.0000, 1, 10000.0000, 1, 1, NULL, 1.0000, 1, 1, 1, 0, 1, 1.0000, 1, 0, 0, 0),
(21, 21, 1, 100.0000, 0.0000, 1, 0, 0, 1, 1.0000, 1, 10000.0000, 1, 1, NULL, 1.0000, 1, 1, 1, 0, 1, 1.0000, 1, 0, 0, 0),
(22, 22, 1, 100.0000, 0.0000, 1, 0, 0, 1, 1.0000, 1, 10000.0000, 1, 1, NULL, 1.0000, 1, 1, 1, 0, 1, 1.0000, 1, 0, 0, 0),
(23, 23, 1, 100.0000, 0.0000, 1, 0, 0, 1, 1.0000, 1, 10000.0000, 1, 1, NULL, 1.0000, 1, 1, 1, 0, 1, 1.0000, 1, 0, 0, 0),
(24, 24, 1, 100.0000, 0.0000, 1, 0, 0, 1, 1.0000, 1, 10000.0000, 1, 1, NULL, 1.0000, 1, 1, 1, 0, 1, 1.0000, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cataloginventory_stock_status`
--

CREATE TABLE IF NOT EXISTS `cataloginventory_stock_status` (
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `stock_id` smallint(5) unsigned NOT NULL COMMENT 'Stock Id',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `stock_status` smallint(5) unsigned NOT NULL COMMENT 'Stock Status',
  PRIMARY KEY (`product_id`,`website_id`,`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_STOCK_ID` (`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_WEBSITE_ID` (`website_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_STOCK_STATUS` (`stock_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock Status';

--
-- Dumping data for table `cataloginventory_stock_status`
--

INSERT INTO `cataloginventory_stock_status` (`product_id`, `website_id`, `stock_id`, `qty`, `stock_status`) VALUES
(1, 0, 1, 100.0000, 1),
(2, 0, 1, 100.0000, 1),
(3, 0, 1, 100.0000, 1),
(4, 0, 1, 100.0000, 1),
(5, 0, 1, 100.0000, 1),
(6, 0, 1, 100.0000, 1),
(7, 0, 1, 100.0000, 1),
(8, 0, 1, 100.0000, 1),
(10, 0, 1, 100.0000, 1),
(12, 0, 1, 100.0000, 1),
(13, 0, 1, 0.0000, 0),
(15, 0, 1, 0.0000, 0),
(16, 0, 1, 0.0000, 0),
(17, 0, 1, 0.0000, 0),
(19, 0, 1, 0.0000, 1),
(20, 0, 1, 100.0000, 1),
(21, 0, 1, 100.0000, 1),
(22, 0, 1, 100.0000, 1),
(23, 0, 1, 100.0000, 1),
(24, 0, 1, 100.0000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cataloginventory_stock_status_idx`
--

CREATE TABLE IF NOT EXISTS `cataloginventory_stock_status_idx` (
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `stock_id` smallint(5) unsigned NOT NULL COMMENT 'Stock Id',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `stock_status` smallint(5) unsigned NOT NULL COMMENT 'Stock Status',
  PRIMARY KEY (`product_id`,`website_id`,`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_IDX_STOCK_ID` (`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_IDX_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock Status Indexer Idx';

-- --------------------------------------------------------

--
-- Table structure for table `cataloginventory_stock_status_replica`
--

CREATE TABLE IF NOT EXISTS `cataloginventory_stock_status_replica` (
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `stock_id` smallint(5) unsigned NOT NULL COMMENT 'Stock Id',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `stock_status` smallint(5) unsigned NOT NULL COMMENT 'Stock Status',
  PRIMARY KEY (`product_id`,`website_id`,`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_STOCK_ID` (`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_WEBSITE_ID` (`website_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_STOCK_STATUS` (`stock_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock Status';

--
-- Dumping data for table `cataloginventory_stock_status_replica`
--

INSERT INTO `cataloginventory_stock_status_replica` (`product_id`, `website_id`, `stock_id`, `qty`, `stock_status`) VALUES
(1, 0, 1, 100.0000, 1),
(2, 0, 1, 100.0000, 1),
(3, 0, 1, 100.0000, 1),
(4, 0, 1, 100.0000, 1),
(5, 0, 1, 100.0000, 1),
(6, 0, 1, 100.0000, 1),
(7, 0, 1, 100.0000, 1),
(8, 0, 1, 100.0000, 1),
(10, 0, 1, 100.0000, 1),
(12, 0, 1, 100.0000, 1),
(13, 0, 1, 0.0000, 0),
(15, 0, 1, 0.0000, 0),
(16, 0, 1, 0.0000, 0),
(17, 0, 1, 0.0000, 0),
(19, 0, 1, 0.0000, 1),
(20, 0, 1, 100.0000, 1),
(21, 0, 1, 100.0000, 1),
(22, 0, 1, 100.0000, 1),
(23, 0, 1, 100.0000, 1),
(24, 0, 1, 100.0000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cataloginventory_stock_status_tmp`
--

CREATE TABLE IF NOT EXISTS `cataloginventory_stock_status_tmp` (
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `stock_id` smallint(5) unsigned NOT NULL COMMENT 'Stock Id',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `stock_status` smallint(5) unsigned NOT NULL COMMENT 'Stock Status',
  PRIMARY KEY (`product_id`,`website_id`,`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_TMP_STOCK_ID` (`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_TMP_WEBSITE_ID` (`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock Status Indexer Tmp';

-- --------------------------------------------------------

--
-- Table structure for table `catalogrule`
--

CREATE TABLE IF NOT EXISTS `catalogrule` (
  `rule_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `from_date` date DEFAULT NULL COMMENT 'From',
  `to_date` date DEFAULT NULL COMMENT 'To',
  `is_active` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Is Active',
  `conditions_serialized` mediumtext COMMENT 'Conditions Serialized',
  `actions_serialized` mediumtext COMMENT 'Actions Serialized',
  `stop_rules_processing` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Stop Rules Processing',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `simple_action` varchar(32) DEFAULT NULL COMMENT 'Simple Action',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  PRIMARY KEY (`rule_id`),
  KEY `CATALOGRULE_IS_ACTIVE_SORT_ORDER_TO_DATE_FROM_DATE` (`is_active`,`sort_order`,`to_date`,`from_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `catalogrule_customer_group`
--

CREATE TABLE IF NOT EXISTS `catalogrule_customer_group` (
  `rule_id` int(10) unsigned NOT NULL,
  `customer_group_id` int(10) unsigned NOT NULL COMMENT 'Customer Group Id',
  PRIMARY KEY (`rule_id`,`customer_group_id`),
  KEY `CATALOGRULE_CUSTOMER_GROUP_CUSTOMER_GROUP_ID` (`customer_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Rules To Customer Groups Relations';

-- --------------------------------------------------------

--
-- Table structure for table `catalogrule_group_website`
--

CREATE TABLE IF NOT EXISTS `catalogrule_group_website` (
  `rule_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Rule Id',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group Id',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website Id',
  PRIMARY KEY (`rule_id`,`customer_group_id`,`website_id`),
  KEY `CATALOGRULE_GROUP_WEBSITE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOGRULE_GROUP_WEBSITE_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule Group Website';

-- --------------------------------------------------------

--
-- Table structure for table `catalogrule_group_website_replica`
--

CREATE TABLE IF NOT EXISTS `catalogrule_group_website_replica` (
  `rule_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Rule Id',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group Id',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website Id',
  PRIMARY KEY (`rule_id`,`customer_group_id`,`website_id`),
  KEY `CATALOGRULE_GROUP_WEBSITE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOGRULE_GROUP_WEBSITE_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule Group Website';

-- --------------------------------------------------------

--
-- Table structure for table `catalogrule_product`
--

CREATE TABLE IF NOT EXISTS `catalogrule_product` (
  `rule_product_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Product Id',
  `rule_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Rule Id',
  `from_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'From Time',
  `to_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'To time',
  `customer_group_id` int(11) DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product Id',
  `action_operator` varchar(10) DEFAULT 'to_fixed' COMMENT 'Action Operator',
  `action_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Action Amount',
  `action_stop` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Action Stop',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  PRIMARY KEY (`rule_product_id`),
  UNIQUE KEY `UNQ_EAA51B56FF092A0DCB795D1CEF812B7B` (`rule_id`,`from_time`,`to_time`,`website_id`,`customer_group_id`,`product_id`,`sort_order`),
  KEY `CATALOGRULE_PRODUCT_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOGRULE_PRODUCT_WEBSITE_ID` (`website_id`),
  KEY `CATALOGRULE_PRODUCT_FROM_TIME` (`from_time`),
  KEY `CATALOGRULE_PRODUCT_TO_TIME` (`to_time`),
  KEY `CATALOGRULE_PRODUCT_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule Product' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `catalogrule_product_price`
--

CREATE TABLE IF NOT EXISTS `catalogrule_product_price` (
  `rule_product_price_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Product PriceId',
  `rule_date` date NOT NULL COMMENT 'Rule Date',
  `customer_group_id` int(11) DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product Id',
  `rule_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Rule Price',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `latest_start_date` date DEFAULT NULL COMMENT 'Latest StartDate',
  `earliest_end_date` date DEFAULT NULL COMMENT 'Earliest EndDate',
  PRIMARY KEY (`rule_product_price_id`),
  UNIQUE KEY `CATRULE_PRD_PRICE_RULE_DATE_WS_ID_CSTR_GROUP_ID_PRD_ID` (`rule_date`,`website_id`,`customer_group_id`,`product_id`),
  KEY `CATALOGRULE_PRODUCT_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOGRULE_PRODUCT_PRICE_WEBSITE_ID` (`website_id`),
  KEY `CATALOGRULE_PRODUCT_PRICE_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule Product Price' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `catalogrule_product_price_replica`
--

CREATE TABLE IF NOT EXISTS `catalogrule_product_price_replica` (
  `rule_product_price_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Product PriceId',
  `rule_date` date NOT NULL COMMENT 'Rule Date',
  `customer_group_id` int(11) DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product Id',
  `rule_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Rule Price',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `latest_start_date` date DEFAULT NULL COMMENT 'Latest StartDate',
  `earliest_end_date` date DEFAULT NULL COMMENT 'Earliest EndDate',
  PRIMARY KEY (`rule_product_price_id`),
  UNIQUE KEY `CATRULE_PRD_PRICE_RULE_DATE_WS_ID_CSTR_GROUP_ID_PRD_ID` (`rule_date`,`website_id`,`customer_group_id`,`product_id`),
  KEY `CATALOGRULE_PRODUCT_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOGRULE_PRODUCT_PRICE_WEBSITE_ID` (`website_id`),
  KEY `CATALOGRULE_PRODUCT_PRICE_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule Product Price' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `catalogrule_product_replica`
--

CREATE TABLE IF NOT EXISTS `catalogrule_product_replica` (
  `rule_product_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Product Id',
  `rule_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Rule Id',
  `from_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'From Time',
  `to_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'To time',
  `customer_group_id` int(11) DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product Id',
  `action_operator` varchar(10) DEFAULT 'to_fixed' COMMENT 'Action Operator',
  `action_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Action Amount',
  `action_stop` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Action Stop',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  PRIMARY KEY (`rule_product_id`),
  UNIQUE KEY `UNQ_EAA51B56FF092A0DCB795D1CEF812B7B` (`rule_id`,`from_time`,`to_time`,`website_id`,`customer_group_id`,`product_id`,`sort_order`),
  KEY `CATALOGRULE_PRODUCT_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOGRULE_PRODUCT_WEBSITE_ID` (`website_id`),
  KEY `CATALOGRULE_PRODUCT_FROM_TIME` (`from_time`),
  KEY `CATALOGRULE_PRODUCT_TO_TIME` (`to_time`),
  KEY `CATALOGRULE_PRODUCT_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule Product' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `catalogrule_website`
--

CREATE TABLE IF NOT EXISTS `catalogrule_website` (
  `rule_id` int(10) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  PRIMARY KEY (`rule_id`,`website_id`),
  KEY `CATALOGRULE_WEBSITE_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Rules To Websites Relations';

-- --------------------------------------------------------

--
-- Table structure for table `catalogsearch_fulltext_scope1`
--

CREATE TABLE IF NOT EXISTS `catalogsearch_fulltext_scope1` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` int(10) unsigned NOT NULL COMMENT 'Attribute_id',
  `data_index` longtext COMMENT 'Data index',
  PRIMARY KEY (`entity_id`,`attribute_id`),
  FULLTEXT KEY `FTI_FULLTEXT_DATA_INDEX` (`data_index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='catalogsearch_fulltext_scope1';

--
-- Dumping data for table `catalogsearch_fulltext_scope1`
--

INSERT INTO `catalogsearch_fulltext_scope1` (`entity_id`, `attribute_id`, `data_index`) VALUES
(19, 73, 'Grandee ® NXT | Grandee ® NXT-Alpine White-Mocha | Grandee ® NXT-Alpine White-Monterey Gray | Grandee ® NXT-Alpine White-Teak | Grandee ® NXT-Tuscan Sun-Mocha | Grandee ® NXT-Tuscan Sun-Monterey Gray | Grandee ® NXT-Tuscan Sun-Teak | Grandee ® NXT-Ice Gray-Mocha | Grandee ® NXT-Ice Gray-Monterey Gray | Grandee ® NXT-Crème-Mocha | Grandee ® NXT-Crème-Teak | Grandee ® NXT-Desert-Mocha | Grandee ® NXT-Desert-Teak | Grandee ® NXT-Platinum-Mocha | Grandee ® NXT-Platinum-Monterey Gray'),
(19, 74, 'Grandee ® NXT'),
(19, 76, 'The Grandee NXT is the best in spa technology. The Grandee NXT offers contemporary design and innovations like the exclusive wireless remote control. As a part of the Highlife Collection NXT, the Grandee NXT spa features an insulating hinge seal, 100% no-bypass filtration for cleaner water, the BellaFontana® fountain, and much more. It also offers contemporary design language and innovations like the exclusive wireless remote control. In addition to the unparalleled performance you can count on from the Highlife Collection, the NXT models offer value-added and innovative upgrades. | The Grandee NXT is the best in spa technology. The Grandee NXT offers contemporary design and innovations like the exclusive wireless remote control. As a part of the Highlife Collection NXT, the Grandee NXT spa features an insulating hinge seal, 100% no-bypass filtration for cleaner water, the BellaFontana® fountain, and much more. It also offers contemporary design language and innovations like the exclusive wireless remote control. In addition to the unparalleled performance you can count on from the Highlife Collection, the NXT models offer value-added and innovative upgrades. | The Grandee NXT is the best in spa technology. The Grandee NXT offers contemporary design and innovations like the exclusive wireless remote control. As a part of the Highlife Collection NXT, the Grandee NXT spa features an insulating hinge seal, 100% no-bypass filtration for cleaner water, the BellaFontana® fountain, and much more. It also offers contemporary design language and innovations like the exclusive wireless remote control. In addition to the unparalleled performance you can count on from the Highlife Collection, the NXT models offer value-added and innovative upgrades. | The Grandee NXT is the best in spa technology. The Grandee NXT offers contemporary design and innovations like the exclusive wireless remote control. As a part of the Highlife Collection NXT, the Grandee NXT spa features an insulating hinge seal, 100% no-bypass filtration for cleaner water, the BellaFontana® fountain, and much more. It also offers contemporary design language and innovations like the exclusive wireless remote control. In addition to the unparalleled performance you can count on from the Highlife Collection, the NXT models offer value-added and innovative upgrades. | The Grandee NXT is the best in spa technology. The Grandee NXT offers contemporary design and innovations like the exclusive wireless remote control. As a part of the Highlife Collection NXT, the Grandee NXT spa features an insulating hinge seal, 100% no-bypass filtration for cleaner water, the BellaFontana® fountain, and much more. It also offers contemporary design language and innovations like the exclusive wireless remote control. In addition to the unparalleled performance you can count on from the Highlife Collection, the NXT models offer value-added and innovative upgrades. | The Grandee NXT is the best in spa technology. The Grandee NXT offers contemporary design and innovations like the exclusive wireless remote control. As a part of the Highlife Collection NXT, the Grandee NXT spa features an insulating hinge seal, 100% no-bypass filtration for cleaner water, the BellaFontana® fountain, and much more. It also offers contemporary design language and innovations like the exclusive wireless remote control. In addition to the unparalleled performance you can count on from the Highlife Collection, the NXT models offer value-added and innovative upgrades. | The Grandee NXT is the best in spa technology. The Grandee NXT offers contemporary design and innovations like the exclusive wireless remote control. As a part of the Highlife Collection NXT, the Grandee NXT spa features an insulating hinge seal, 100% no-bypass filtration for cleaner water, the BellaFontana® fountain, and much more. It also offers contemporary design language and innovations like the exclusive wireless remote control. In addition to the unparalleled performance you can count on from the Highlife Collection, the NXT models offer value-added and innovative upgrades. | The Grandee NXT is the best in spa technology. The Grandee NXT offers contemporary design and innovations like the exclusive wireless remote control. As a part of the Highlife Collection NXT, the Grandee NXT spa features an insulating hinge seal, 100% no-bypass filtration for cleaner water, the BellaFontana® fountain, and much more. It also offers contemporary design language and innovations like the exclusive wireless remote control. In addition to the unparalleled performance you can count on from the Highlife Collection, the NXT models offer value-added and innovative upgrades. | The Grandee NXT is the best in spa technology. The Grandee NXT offers contemporary design and innovations like the exclusive wireless remote control. As a part of the Highlife Collection NXT, the Grandee NXT spa features an insulating hinge seal, 100% no-bypass filtration for cleaner water, the BellaFontana® fountain, and much more. It also offers contemporary design language and innovations like the exclusive wireless remote control. In addition to the unparalleled performance you can count on from the Highlife Collection, the NXT models offer value-added and innovative upgrades. | The Grandee NXT is the best in spa technology. The Grandee NXT offers contemporary design and innovations like the exclusive wireless remote control. As a part of the Highlife Collection NXT, the Grandee NXT spa features an insulating hinge seal, 100% no-bypass filtration for cleaner water, the BellaFontana® fountain, and much more. It also offers contemporary design language and innovations like the exclusive wireless remote control. In addition to the unparalleled performance you can count on from the Highlife Collection, the NXT models offer value-added and innovative upgrades. | The Grandee NXT is the best in spa technology. The Grandee NXT offers contemporary design and innovations like the exclusive wireless remote control. As a part of the Highlife Collection NXT, the Grandee NXT spa features an insulating hinge seal, 100% no-bypass filtration for cleaner water, the BellaFontana® fountain, and much more. It also offers contemporary design language and innovations like the exclusive wireless remote control. In addition to the unparalleled performance you can count on from the Highlife Collection, the NXT models offer value-added and innovative upgrades. | The Grandee NXT is the best in spa technology. The Grandee NXT offers contemporary design and innovations like the exclusive wireless remote control. As a part of the Highlife Collection NXT, the Grandee NXT spa features an insulating hinge seal, 100% no-bypass filtration for cleaner water, the BellaFontana® fountain, and much more. It also offers contemporary design language and innovations like the exclusive wireless remote control. In addition to the unparalleled performance you can count on from the Highlife Collection, the NXT models offer value-added and innovative upgrades. | The Grandee NXT is the best in spa technology. The Grandee NXT offers contemporary design and innovations like the exclusive wireless remote control. As a part of the Highlife Collection NXT, the Grandee NXT spa features an insulating hinge seal, 100% no-bypass filtration for cleaner water, the BellaFontana® fountain, and much more. It also offers contemporary design language and innovations like the exclusive wireless remote control. In addition to the unparalleled performance you can count on from the Highlife Collection, the NXT models offer value-added and innovative upgrades. | The Grandee NXT is the best in spa technology. The Grandee NXT offers contemporary design and innovations like the exclusive wireless remote control. As a part of the Highlife Collection NXT, the Grandee NXT spa features an insulating hinge seal, 100% no-bypass filtration for cleaner water, the BellaFontana® fountain, and much more. It also offers contemporary design language and innovations like the exclusive wireless remote control. In addition to the unparalleled performance you can count on from the Highlife Collection, the NXT models offer value-added and innovative upgrades. | The Grandee NXT is the best in spa technology. The Grandee NXT offers contemporary design and innovations like the exclusive wireless remote control. As a part of the Highlife Collection NXT, the Grandee NXT spa features an insulating hinge seal, 100% no-bypass filtration for cleaner water, the BellaFontana® fountain, and much more. It also offers contemporary design language and innovations like the exclusive wireless remote control. In addition to the unparalleled performance you can count on from the Highlife Collection, the NXT models offer value-added and innovative upgrades.'),
(20, 73, 'Steps, Covers & Lifters'),
(20, 74, 'coverlifters'),
(21, 73, 'Hot Tub Water Care'),
(21, 74, 'watercare'),
(22, 73, 'Hot Tub Innovation'),
(22, 74, 'hottubinnovation'),
(23, 73, 'Hot Tub Enjoyment'),
(23, 74, 'hottubenjoyment'),
(24, 73, 'Hot Spring® 32" Polymer Spa Steps'),
(24, 74, 'Hot Spring® 32" Polymer Spa Steps'),
(24, 76, 'Making it easy to climb in and out of your spa, Hot Spring spa side steps feature rich colors and a natural wood appearance. They’re designed to match your Everwood spa cabinet.');

-- --------------------------------------------------------

--
-- Table structure for table `catalogsearch_recommendations`
--

CREATE TABLE IF NOT EXISTS `catalogsearch_recommendations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `query_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Query Id',
  `relation_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Relation Id',
  PRIMARY KEY (`id`),
  KEY `CATALOGSEARCH_RECOMMENDATIONS_QUERY_ID_SEARCH_QUERY_QUERY_ID` (`query_id`),
  KEY `CATALOGSEARCH_RECOMMENDATIONS_RELATION_ID_SEARCH_QUERY_QUERY_ID` (`relation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Advanced Search Recommendations' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_entity`
--

CREATE TABLE IF NOT EXISTS `catalog_category_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Set ID',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Parent Category ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Time',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update Time',
  `path` varchar(255) NOT NULL COMMENT 'Tree Path',
  `position` int(11) NOT NULL COMMENT 'Position',
  `level` int(11) NOT NULL DEFAULT '0' COMMENT 'Tree Level',
  `children_count` int(11) NOT NULL COMMENT 'Child Count',
  PRIMARY KEY (`entity_id`),
  KEY `CATALOG_CATEGORY_ENTITY_LEVEL` (`level`),
  KEY `CATALOG_CATEGORY_ENTITY_PATH` (`path`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Catalog Category Table' AUTO_INCREMENT=16 ;

--
-- Dumping data for table `catalog_category_entity`
--

INSERT INTO `catalog_category_entity` (`entity_id`, `attribute_set_id`, `parent_id`, `created_at`, `updated_at`, `path`, `position`, `level`, `children_count`) VALUES
(1, 3, 0, '2018-12-06 05:00:03', '2018-12-22 16:52:41', '1', 0, 0, 14),
(2, 3, 1, '2018-12-06 05:00:04', '2018-12-22 16:52:41', '1/2', 1, 1, 13),
(3, 3, 2, '2018-12-06 12:11:06', '2018-12-25 18:24:17', '1/2/3', 1, 2, 6),
(4, 3, 2, '2018-12-06 12:14:33', '2018-12-06 12:21:05', '1/2/4', 2, 2, 0),
(5, 3, 2, '2018-12-06 12:18:59', '2018-12-06 12:23:37', '1/2/5', 4, 2, 0),
(6, 3, 2, '2018-12-06 12:19:30', '2018-12-06 12:23:37', '1/2/6', 5, 2, 0),
(7, 3, 2, '2018-12-06 12:19:59', '2018-12-06 12:23:37', '1/2/7', 6, 2, 0),
(8, 3, 2, '2018-12-06 12:20:27', '2018-12-06 12:23:37', '1/2/8', 7, 2, 0),
(9, 3, 2, '2018-12-06 12:23:19', '2018-12-06 12:23:37', '1/2/9', 3, 2, 0),
(10, 3, 3, '2018-12-10 16:03:00', '2018-12-22 15:30:54', '1/2/3/10', 1, 3, 1),
(11, 3, 10, '2018-12-22 15:30:54', '2018-12-22 15:30:54', '1/2/3/10/11', 1, 4, 0),
(12, 3, 3, '2018-12-22 15:33:02', '2018-12-22 16:51:43', '1/2/3/12', 2, 3, 0),
(13, 3, 3, '2018-12-22 15:34:32', '2018-12-22 16:52:10', '1/2/3/13', 3, 3, 1),
(14, 3, 13, '2018-12-22 16:45:41', '2018-12-22 16:52:10', '1/2/3/13/14', 1, 4, 0),
(15, 3, 3, '2018-12-22 16:50:04', '2018-12-22 16:52:41', '1/2/3/15', 4, 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_entity_datetime`
--

CREATE TABLE IF NOT EXISTS `catalog_category_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` datetime DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_CATEGORY_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_CATEGORY_ENTITY_DATETIME_ENTITY_ID` (`entity_id`),
  KEY `CATALOG_CATEGORY_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_CATEGORY_ENTITY_DATETIME_STORE_ID` (`store_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Catalog Category Datetime Attribute Backend Table' AUTO_INCREMENT=5 ;

--
-- Dumping data for table `catalog_category_entity_datetime`
--

INSERT INTO `catalog_category_entity_datetime` (`value_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES
(1, 61, 0, 10, NULL),
(2, 62, 0, 10, NULL),
(3, 61, 0, 3, NULL),
(4, 62, 0, 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_entity_decimal`
--

CREATE TABLE IF NOT EXISTS `catalog_category_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` decimal(12,4) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_CATEGORY_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_CATEGORY_ENTITY_DECIMAL_ENTITY_ID` (`entity_id`),
  KEY `CATALOG_CATEGORY_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_CATEGORY_ENTITY_DECIMAL_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Decimal Attribute Backend Table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_entity_int`
--

CREATE TABLE IF NOT EXISTS `catalog_category_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` int(11) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_CATEGORY_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_CATEGORY_ENTITY_INT_ENTITY_ID` (`entity_id`),
  KEY `CATALOG_CATEGORY_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_CATEGORY_ENTITY_INT_STORE_ID` (`store_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Catalog Category Integer Attribute Backend Table' AUTO_INCREMENT=71 ;

--
-- Dumping data for table `catalog_category_entity_int`
--

INSERT INTO `catalog_category_entity_int` (`value_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES
(1, 69, 0, 1, 1),
(2, 46, 0, 2, 1),
(3, 69, 0, 2, 1),
(4, 46, 0, 3, 1),
(5, 54, 0, 3, 1),
(6, 69, 0, 3, 1),
(7, 70, 0, 3, 0),
(8, 71, 0, 3, 0),
(9, 46, 0, 4, 1),
(10, 54, 0, 4, 1),
(11, 69, 0, 4, 1),
(12, 70, 0, 4, 0),
(13, 71, 0, 4, 0),
(14, 46, 0, 5, 1),
(15, 54, 0, 5, 1),
(16, 69, 0, 5, 1),
(17, 70, 0, 5, 0),
(18, 71, 0, 5, 0),
(19, 46, 0, 6, 1),
(20, 54, 0, 6, 1),
(21, 69, 0, 6, 1),
(22, 70, 0, 6, 0),
(23, 71, 0, 6, 0),
(24, 46, 0, 7, 1),
(25, 54, 0, 7, 1),
(26, 69, 0, 7, 1),
(27, 70, 0, 7, 0),
(28, 71, 0, 7, 0),
(29, 46, 0, 8, 1),
(30, 54, 0, 8, 1),
(31, 69, 0, 8, 1),
(32, 70, 0, 8, 0),
(33, 71, 0, 8, 0),
(34, 46, 0, 9, 1),
(35, 54, 0, 9, 1),
(36, 69, 0, 9, 1),
(37, 70, 0, 9, 0),
(38, 71, 0, 9, 0),
(39, 46, 0, 10, 1),
(40, 54, 0, 10, 1),
(41, 69, 0, 10, 1),
(42, 70, 0, 10, 0),
(43, 71, 0, 10, 0),
(44, 53, 0, 10, NULL),
(45, 46, 0, 11, 1),
(46, 54, 0, 11, 1),
(47, 69, 0, 11, 1),
(48, 70, 0, 11, 0),
(49, 71, 0, 11, 0),
(50, 46, 0, 12, 1),
(51, 54, 0, 12, 1),
(52, 69, 0, 12, 1),
(53, 70, 0, 12, 0),
(54, 71, 0, 12, 0),
(55, 46, 0, 13, 1),
(56, 54, 0, 13, 1),
(57, 69, 0, 13, 1),
(58, 70, 0, 13, 0),
(59, 71, 0, 13, 0),
(60, 46, 0, 14, 1),
(61, 54, 0, 14, 1),
(62, 69, 0, 14, 1),
(63, 70, 0, 14, 0),
(64, 71, 0, 14, 0),
(65, 46, 0, 15, 1),
(66, 54, 0, 15, 1),
(67, 69, 0, 15, 1),
(68, 70, 0, 15, 0),
(69, 71, 0, 15, 0),
(70, 53, 0, 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_entity_text`
--

CREATE TABLE IF NOT EXISTS `catalog_category_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` text COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_CATEGORY_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_CATEGORY_ENTITY_TEXT_ENTITY_ID` (`entity_id`),
  KEY `CATALOG_CATEGORY_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_CATEGORY_ENTITY_TEXT_STORE_ID` (`store_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Catalog Category Text Attribute Backend Table' AUTO_INCREMENT=12 ;

--
-- Dumping data for table `catalog_category_entity_text`
--

INSERT INTO `catalog_category_entity_text` (`value_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES
(1, 47, 0, 10, '<p><img src="{{media url="wysiwyg/500x160-hot-spring-spas-logo-full-color.png"}}" width="500" height="160" />Exclusive Massage. Patented Water Care Systems. Innovative Energy-saving Features. Every Day Made Better&lt;sup&gt;®&lt;/sup&gt;.</p>'),
(2, 50, 0, 10, NULL),
(3, 51, 0, 10, NULL),
(4, 64, 0, 10, NULL),
(5, 47, 0, 12, '<p><img src="{{media url="wysiwyg/500x160-Fantasy-Spas-logo-1.png"}}" width="500" height="160" /> The wait is over. Step into your Fantasy.</p>'),
(6, 47, 0, 13, '<p><img src="{{media url="wysiwyg/500x160-caldera-spas-logo-full-color.png"}}" /><br />The Best Hot Tubs Combine Comfort, Design and Performance</p>'),
(7, 47, 0, 15, '<p><img src="{{media url="wysiwyg/500x160-Freeflow-Spas-primary-logo.png"}}" /><br />Plug-In to the Joys of Hot-Tubbing&lt;sup&gt;™&lt;/sup&gt;</p>'),
(8, 47, 0, 3, NULL),
(9, 50, 0, 3, NULL),
(10, 51, 0, 3, NULL),
(11, 64, 0, 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_entity_varchar`
--

CREATE TABLE IF NOT EXISTS `catalog_category_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_CATEGORY_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_CATEGORY_ENTITY_VARCHAR_ENTITY_ID` (`entity_id`),
  KEY `CATALOG_CATEGORY_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_CATEGORY_ENTITY_VARCHAR_STORE_ID` (`store_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Catalog Category Varchar Attribute Backend Table' AUTO_INCREMENT=71 ;

--
-- Dumping data for table `catalog_category_entity_varchar`
--

INSERT INTO `catalog_category_entity_varchar` (`value_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES
(1, 45, 0, 1, 'Root Catalog'),
(2, 45, 0, 2, 'Default Category'),
(3, 52, 0, 2, 'PRODUCTS'),
(4, 45, 0, 3, 'Hot tub'),
(5, 52, 0, 3, 'PRODUCTS'),
(6, 119, 0, 3, 'hot-tub'),
(7, 45, 0, 4, 'Swim spas'),
(8, 52, 0, 4, 'PRODUCTS'),
(9, 119, 0, 4, 'swim-spas'),
(10, 45, 0, 5, 'Pools'),
(11, 52, 0, 5, 'PRODUCTS'),
(12, 119, 0, 5, 'pools'),
(13, 45, 0, 6, 'Water Care'),
(14, 52, 0, 6, 'PRODUCTS'),
(15, 119, 0, 6, 'water-care'),
(16, 45, 0, 7, 'Services'),
(17, 52, 0, 7, 'PRODUCTS'),
(18, 119, 0, 7, 'services'),
(19, 45, 0, 8, 'Other Products'),
(20, 52, 0, 8, 'PRODUCTS'),
(21, 119, 0, 8, 'other-products'),
(22, 120, 0, 3, 'hot-tub'),
(23, 120, 0, 4, 'swim-spas'),
(24, 120, 0, 5, 'pools'),
(25, 120, 0, 6, 'water-care'),
(26, 120, 0, 7, 'services'),
(27, 120, 0, 8, 'other-products'),
(28, 45, 0, 9, 'Spa Accessories'),
(29, 52, 0, 9, 'PRODUCTS'),
(30, 119, 0, 9, 'spa-accessories'),
(31, 120, 0, 9, 'spa-accessories'),
(33, 45, 0, 10, 'Hot Spring <sup>®</sup> Spas'),
(34, 52, 0, 10, 'PRODUCTS'),
(35, 119, 0, 10, 'hot-spring-spas'),
(36, 120, 0, 10, 'hot-tub/hot-spring-spas'),
(38, 48, 0, 10, '850x375-Hot-Spring-Spas-Hot-Tubs.jpg'),
(39, 49, 0, 10, NULL),
(40, 60, 0, 10, NULL),
(41, 63, 0, 10, NULL),
(42, 45, 0, 11, 'Highlife NXT'),
(43, 52, 0, 11, 'PRODUCTS'),
(44, 119, 0, 11, 'highlife-nxt'),
(45, 120, 0, 11, 'hot-tub/hot-spring-spas/highlife-nxt'),
(46, 45, 0, 12, 'Fantasy <sup>®</sup> Spas'),
(47, 48, 0, 12, '850x375-Fantasy-Spas-Hot-Tubs.jpg'),
(48, 52, 0, 12, 'PRODUCTS'),
(49, 119, 0, 12, 'fantasy-sup-r-sup-spas'),
(50, 45, 0, 13, 'Caldera <sup>®</sup> Spas'),
(51, 48, 0, 13, '850x375-Caldera-Spas-Hot-Tubs.jpg'),
(52, 52, 0, 13, 'PRODUCTS'),
(53, 119, 0, 13, 'caldera-sup-r-sup-spas'),
(54, 45, 0, 14, 'Utopia Series'),
(55, 52, 0, 14, 'PRODUCTS'),
(56, 119, 0, 14, 'utopia-series'),
(57, 45, 0, 15, 'Freeflow <sup>®</sup> Spas'),
(58, 48, 0, 15, '850x375-Freeflow-Spas-Hot-Tubs-02.jpg'),
(59, 52, 0, 15, 'PRODUCTS'),
(60, 119, 0, 15, 'freeflow-sup-r-sup-spas'),
(61, 120, 0, 14, 'hot-tub/caldera-sup-r-sup-spas/utopia-series'),
(62, 120, 0, 12, 'hot-tub/fantasy-sup-r-sup-spas'),
(63, 120, 0, 13, 'hot-tub/caldera-sup-r-sup-spas'),
(65, 120, 0, 15, 'hot-tub/freeflow-sup-r-sup-spas'),
(67, 48, 0, 3, NULL),
(68, 49, 0, 3, NULL),
(69, 60, 0, 3, NULL),
(70, 63, 0, 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_product`
--

CREATE TABLE IF NOT EXISTS `catalog_category_product` (
  `entity_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `position` int(11) NOT NULL DEFAULT '0' COMMENT 'Position',
  PRIMARY KEY (`entity_id`,`category_id`,`product_id`),
  UNIQUE KEY `CATALOG_CATEGORY_PRODUCT_CATEGORY_ID_PRODUCT_ID` (`category_id`,`product_id`),
  KEY `CATALOG_CATEGORY_PRODUCT_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Catalog Product To Category Linkage Table' AUTO_INCREMENT=7 ;

--
-- Dumping data for table `catalog_category_product`
--

INSERT INTO `catalog_category_product` (`entity_id`, `category_id`, `product_id`, `position`) VALUES
(1, 2, 19, 0),
(2, 3, 20, 0),
(3, 3, 21, 0),
(4, 3, 22, 0),
(5, 3, 23, 0),
(6, 9, 24, 0);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_product_index`
--

CREATE TABLE IF NOT EXISTS `catalog_category_product_index` (
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `position` int(11) DEFAULT NULL COMMENT 'Position',
  `is_parent` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Parent',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `visibility` smallint(5) unsigned NOT NULL COMMENT 'Visibility',
  PRIMARY KEY (`category_id`,`product_id`,`store_id`),
  KEY `CAT_CTGR_PRD_IDX_PRD_ID_STORE_ID_CTGR_ID_VISIBILITY` (`product_id`,`store_id`,`category_id`,`visibility`),
  KEY `CAT_CTGR_PRD_IDX_STORE_ID_CTGR_ID_VISIBILITY_IS_PARENT_POSITION` (`store_id`,`category_id`,`visibility`,`is_parent`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Product Index';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_product_index_replica`
--

CREATE TABLE IF NOT EXISTS `catalog_category_product_index_replica` (
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `position` int(11) DEFAULT NULL COMMENT 'Position',
  `is_parent` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Parent',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `visibility` smallint(5) unsigned NOT NULL COMMENT 'Visibility',
  PRIMARY KEY (`category_id`,`product_id`,`store_id`),
  KEY `CAT_CTGR_PRD_IDX_PRD_ID_STORE_ID_CTGR_ID_VISIBILITY` (`product_id`,`store_id`,`category_id`,`visibility`),
  KEY `CAT_CTGR_PRD_IDX_STORE_ID_CTGR_ID_VISIBILITY_IS_PARENT_POSITION` (`store_id`,`category_id`,`visibility`,`is_parent`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Product Index';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_product_index_store1`
--

CREATE TABLE IF NOT EXISTS `catalog_category_product_index_store1` (
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Category Id',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product Id',
  `position` int(11) DEFAULT NULL COMMENT 'Position',
  `is_parent` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Parent',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `visibility` smallint(5) unsigned NOT NULL COMMENT 'Visibility',
  PRIMARY KEY (`category_id`,`product_id`,`store_id`),
  KEY `IDX_4B965DC45C352D6E4C9DC0FF50B1FCF5` (`product_id`,`store_id`,`category_id`,`visibility`),
  KEY `IDX_47AB760CD6A893ACEA69A9C2E0112C60` (`store_id`,`category_id`,`visibility`,`is_parent`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Product Index Store1 Replica';

--
-- Dumping data for table `catalog_category_product_index_store1`
--

INSERT INTO `catalog_category_product_index_store1` (`category_id`, `product_id`, `position`, `is_parent`, `store_id`, `visibility`) VALUES
(2, 19, 0, 1, 1, 4),
(2, 20, 0, 1, 1, 4),
(2, 21, 0, 1, 1, 4),
(2, 22, 0, 1, 1, 4),
(2, 23, 0, 1, 1, 4),
(2, 24, 0, 1, 1, 4),
(3, 20, 0, 1, 1, 4),
(3, 21, 0, 1, 1, 4),
(3, 22, 0, 1, 1, 4),
(3, 23, 0, 1, 1, 4),
(9, 24, 0, 1, 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_product_index_store1_replica`
--

CREATE TABLE IF NOT EXISTS `catalog_category_product_index_store1_replica` (
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Category Id',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product Id',
  `position` int(11) DEFAULT NULL COMMENT 'Position',
  `is_parent` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Parent',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `visibility` smallint(5) unsigned NOT NULL COMMENT 'Visibility',
  PRIMARY KEY (`category_id`,`product_id`,`store_id`),
  KEY `CAT_CTGR_PRD_IDX_STORE1_PRD_ID_STORE_ID_CTGR_ID_VISIBILITY` (`product_id`,`store_id`,`category_id`,`visibility`),
  KEY `IDX_216E521C8AD125E066D2B0BAB4A08412` (`store_id`,`category_id`,`visibility`,`is_parent`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Product Index Store1';

--
-- Dumping data for table `catalog_category_product_index_store1_replica`
--

INSERT INTO `catalog_category_product_index_store1_replica` (`category_id`, `product_id`, `position`, `is_parent`, `store_id`, `visibility`) VALUES
(2, 19, 0, 1, 1, 4),
(2, 20, 0, 1, 1, 4),
(2, 21, 0, 1, 1, 4),
(2, 22, 0, 1, 1, 4),
(2, 23, 0, 1, 1, 4),
(2, 24, 0, 1, 1, 4),
(3, 20, 0, 1, 1, 4),
(3, 21, 0, 1, 1, 4),
(3, 22, 0, 1, 1, 4),
(3, 23, 0, 1, 1, 4),
(9, 24, 0, 1, 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_product_index_tmp`
--

CREATE TABLE IF NOT EXISTS `catalog_category_product_index_tmp` (
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `position` int(11) NOT NULL DEFAULT '0' COMMENT 'Position',
  `is_parent` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Parent',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `visibility` smallint(5) unsigned NOT NULL COMMENT 'Visibility',
  PRIMARY KEY (`category_id`,`product_id`,`store_id`),
  KEY `CAT_CTGR_PRD_IDX_TMP_PRD_ID_CTGR_ID_STORE_ID` (`product_id`,`category_id`,`store_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Category Product Indexer temporary table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_compare_item`
--

CREATE TABLE IF NOT EXISTS `catalog_compare_item` (
  `catalog_compare_item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Compare Item ID',
  `visitor_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Visitor ID',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store ID',
  PRIMARY KEY (`catalog_compare_item_id`),
  KEY `CATALOG_COMPARE_ITEM_PRODUCT_ID` (`product_id`),
  KEY `CATALOG_COMPARE_ITEM_VISITOR_ID_PRODUCT_ID` (`visitor_id`,`product_id`),
  KEY `CATALOG_COMPARE_ITEM_CUSTOMER_ID_PRODUCT_ID` (`customer_id`,`product_id`),
  KEY `CATALOG_COMPARE_ITEM_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Compare Table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `catalog_eav_attribute`
--

CREATE TABLE IF NOT EXISTS `catalog_eav_attribute` (
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `frontend_input_renderer` varchar(255) DEFAULT NULL COMMENT 'Frontend Input Renderer',
  `is_global` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Global',
  `is_visible` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Visible',
  `is_searchable` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Searchable',
  `is_filterable` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Filterable',
  `is_comparable` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Comparable',
  `is_visible_on_front` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `is_html_allowed_on_front` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is HTML Allowed On Front',
  `is_used_for_price_rules` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Used For Price Rules',
  `is_filterable_in_search` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Filterable In Search',
  `used_in_product_listing` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Used In Product Listing',
  `used_for_sort_by` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Used For Sorting',
  `apply_to` varchar(255) DEFAULT NULL COMMENT 'Apply To',
  `is_visible_in_advanced_search` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible In Advanced Search',
  `position` int(11) NOT NULL DEFAULT '0' COMMENT 'Position',
  `is_wysiwyg_enabled` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is WYSIWYG Enabled',
  `is_used_for_promo_rules` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Used For Promo Rules',
  `is_required_in_admin_store` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Required In Admin Store',
  `is_used_in_grid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Used in Grid',
  `is_visible_in_grid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible in Grid',
  `is_filterable_in_grid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Filterable in Grid',
  `search_weight` float NOT NULL DEFAULT '1' COMMENT 'Search Weight',
  `additional_data` text COMMENT 'Additional swatch attributes data',
  PRIMARY KEY (`attribute_id`),
  KEY `CATALOG_EAV_ATTRIBUTE_USED_FOR_SORT_BY` (`used_for_sort_by`),
  KEY `CATALOG_EAV_ATTRIBUTE_USED_IN_PRODUCT_LISTING` (`used_in_product_listing`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog EAV Attribute Table';

--
-- Dumping data for table `catalog_eav_attribute`
--

INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`, `is_required_in_admin_store`, `is_used_in_grid`, `is_visible_in_grid`, `is_filterable_in_grid`, `search_weight`, `additional_data`) VALUES
(45, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(46, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(47, NULL, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 1, NULL),
(48, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(49, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(50, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(51, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(52, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(53, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(54, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(55, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(56, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(57, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(58, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(59, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(60, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(61, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(62, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(63, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(64, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(65, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(66, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(67, 'Magento\\Catalog\\Block\\Adminhtml\\Category\\Helper\\Sortby\\Available', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(68, 'Magento\\Catalog\\Block\\Adminhtml\\Category\\Helper\\Sortby\\DefaultSortby', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(69, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(70, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(71, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(72, 'Magento\\Catalog\\Block\\Adminhtml\\Category\\Helper\\Pricestep', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(73, NULL, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 5, NULL),
(74, NULL, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 6, NULL),
(75, NULL, 0, 1, 1, 0, 1, 0, 1, 0, 0, 0, 0, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 1, NULL),
(76, NULL, 0, 1, 1, 0, 1, 0, 1, 0, 0, 1, 0, NULL, 1, 0, 1, 0, 0, 1, 0, 0, 1, NULL),
(77, NULL, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 'simple,virtual,configurable,downloadable,bundle', 1, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(78, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 'simple,virtual,configurable,downloadable,bundle', 0, 0, 0, 0, 0, 1, 0, 1, 1, NULL),
(79, NULL, 2, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 'simple,virtual,configurable,downloadable,bundle', 0, 0, 0, 0, 0, 1, 0, 0, 1, NULL),
(80, NULL, 2, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 'simple,virtual,configurable,downloadable,bundle', 0, 0, 0, 0, 0, 1, 0, 0, 1, NULL),
(81, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'simple,virtual,downloadable', 0, 0, 0, 0, 0, 1, 0, 1, 1, NULL),
(82, 'Magento\\Catalog\\Block\\Adminhtml\\Product\\Helper\\Form\\Weight', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'simple,virtual,configurable,downloadable,bundle', 0, 0, 0, 0, 0, 1, 0, 1, 1, NULL),
(83, NULL, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 'simple,configurable', 1, 0, 0, 0, 0, 1, 0, 1, 1, NULL),
(84, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 1, 1, NULL),
(85, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 1, 1, NULL),
(86, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 1, 1, NULL),
(87, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(88, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(89, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(90, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(91, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(92, NULL, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'simple,virtual,downloadable,bundle', 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(93, NULL, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 'simple,virtual,configurable', 1, 0, 0, 0, 0, 1, 0, 1, 1, NULL),
(94, NULL, 2, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 0, 1, NULL),
(95, NULL, 2, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 0, 1, NULL),
(96, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(97, 'Magento\\Framework\\Data\\Form\\Element\\Hidden', 2, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, 0, 0, 0, 1, 0, 0, 0, 1, NULL),
(98, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'simple,virtual,configurable,downloadable,bundle', 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(99, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 1, 0, 0, 0, 1, NULL),
(100, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 1, 1, NULL),
(101, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 0, 1, NULL),
(102, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 0, 1, NULL),
(103, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(104, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 0, 1, NULL),
(105, 'Magento\\Catalog\\Block\\Adminhtml\\Product\\Helper\\Form\\Category', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(106, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(107, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(108, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(109, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(110, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(111, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(112, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(113, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(114, NULL, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'simple,bundle,configurable,grouped', 0, 0, 0, 0, 0, 1, 0, 1, 1, NULL),
(115, 'Magento\\CatalogInventory\\Block\\Adminhtml\\Form\\Field\\Stock', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(116, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 0, 1, NULL),
(117, 'Magento\\Msrp\\Block\\Adminhtml\\Product\\Helper\\Form\\Type', 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 'simple,virtual,downloadable,bundle,configurable', 0, 0, 0, 0, 0, 1, 0, 1, 1, NULL),
(118, 'Magento\\Msrp\\Block\\Adminhtml\\Product\\Helper\\Form\\Type\\Price', 2, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 'simple,virtual,downloadable,bundle,configurable', 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(119, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(120, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(121, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 1, 1, NULL),
(122, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(123, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 'downloadable', 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(124, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'downloadable', 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(125, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'downloadable', 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(126, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 'downloadable', 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(127, 'Magento\\GiftMessage\\Block\\Adminhtml\\Product\\Helper\\Form\\Config', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 0, 1, NULL),
(128, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(129, NULL, 2, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 'simple,virtual,configurable,downloadable,bundle', 0, 0, 0, 0, 0, 1, 0, 1, 1, NULL),
(130, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 'bundle', 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(131, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'bundle', 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(132, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 'bundle', 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(133, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 'bundle', 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(134, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 'bundle', 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(135, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'simple', 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(136, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'simple', 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(137, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'simple', 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
(138, NULL, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 1, 0, 1, NULL),
(139, NULL, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 1, 0, 1, NULL),
(140, NULL, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 1, 0, 1, NULL),
(141, NULL, 1, 1, 0, 1, 0, 1, 1, 0, 1, 0, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 1, 1, '{"swatch_input_type":"visual","update_product_preview_image":"0","use_product_image_for_swatch":"0"}'),
(142, NULL, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, 1, NULL),
(143, NULL, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 1, 1, '{"swatch_input_type":"visual","update_product_preview_image":"0","use_product_image_for_swatch":"0"}'),
(144, NULL, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, 1, NULL),
(145, NULL, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 1, 0, 1, NULL),
(146, NULL, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 1, 0, 1, NULL),
(147, NULL, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 1, 0, 1, NULL),
(148, NULL, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 1, 0, 1, NULL),
(149, NULL, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 1, 0, 1, NULL),
(150, NULL, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 1, 0, 1, NULL),
(151, NULL, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 1, 0, 1, NULL),
(152, NULL, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 1, 0, 1, NULL),
(153, NULL, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 1, 0, 1, NULL),
(154, NULL, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, NULL, 0, 0, 1, 0, 0, 0, 1, 0, 1, NULL),
(155, NULL, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, NULL, 0, 0, 1, 0, 0, 0, 1, 0, 1, NULL),
(156, NULL, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 1, 0, 1, NULL),
(157, NULL, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, NULL, 0, 0, 1, 0, 0, 0, 1, 0, 1, NULL),
(158, NULL, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 1, 0, 1, NULL),
(159, NULL, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 1, 0, 1, NULL),
(160, NULL, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 1, 0, 1, NULL),
(161, NULL, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, NULL, 0, 0, 1, 0, 0, 0, 1, 0, 1, NULL),
(162, NULL, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 1, 0, 1, NULL),
(163, NULL, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 1, 1, NULL),
(164, NULL, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 1, 0, 1, NULL),
(165, NULL, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 1, 0, 1, NULL),
(166, NULL, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, NULL, 0, 0, 1, 0, 0, 0, 1, 0, 1, NULL),
(167, NULL, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 1, 1, NULL),
(168, NULL, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 1, 0, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_bundle_option`
--

CREATE TABLE IF NOT EXISTS `catalog_product_bundle_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `required` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Required',
  `position` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Position',
  `type` varchar(255) DEFAULT NULL COMMENT 'Type',
  PRIMARY KEY (`option_id`),
  KEY `CATALOG_PRODUCT_BUNDLE_OPTION_PARENT_ID` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Option' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_bundle_option_value`
--

CREATE TABLE IF NOT EXISTS `catalog_product_bundle_option_value` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `option_id` int(10) unsigned NOT NULL COMMENT 'Option Id',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  `parent_product_id` int(10) unsigned NOT NULL COMMENT 'Parent Product Id',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CAT_PRD_BNDL_OPT_VAL_OPT_ID_PARENT_PRD_ID_STORE_ID` (`option_id`,`parent_product_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Option Value' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_bundle_price_index`
--

CREATE TABLE IF NOT EXISTS `catalog_product_bundle_price_index` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `customer_group_id` int(10) unsigned NOT NULL COMMENT 'Customer Group Id',
  `min_price` decimal(12,4) NOT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) NOT NULL COMMENT 'Max Price',
  PRIMARY KEY (`entity_id`,`website_id`,`customer_group_id`),
  KEY `CATALOG_PRODUCT_BUNDLE_PRICE_INDEX_WEBSITE_ID` (`website_id`),
  KEY `CATALOG_PRODUCT_BUNDLE_PRICE_INDEX_CUSTOMER_GROUP_ID` (`customer_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Price Index';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_bundle_selection`
--

CREATE TABLE IF NOT EXISTS `catalog_product_bundle_selection` (
  `selection_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Selection Id',
  `option_id` int(10) unsigned NOT NULL COMMENT 'Option Id',
  `parent_product_id` int(10) unsigned NOT NULL COMMENT 'Parent Product Id',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `position` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Position',
  `is_default` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Default',
  `selection_price_type` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Selection Price Type',
  `selection_price_value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Selection Price Value',
  `selection_qty` decimal(12,4) DEFAULT NULL COMMENT 'Selection Qty',
  `selection_can_change_qty` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Selection Can Change Qty',
  PRIMARY KEY (`selection_id`),
  KEY `CATALOG_PRODUCT_BUNDLE_SELECTION_OPTION_ID` (`option_id`),
  KEY `CATALOG_PRODUCT_BUNDLE_SELECTION_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Selection' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_bundle_selection_price`
--

CREATE TABLE IF NOT EXISTS `catalog_product_bundle_selection_price` (
  `selection_id` int(10) unsigned NOT NULL COMMENT 'Selection Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `selection_price_type` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Selection Price Type',
  `selection_price_value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Selection Price Value',
  `parent_product_id` int(10) unsigned NOT NULL COMMENT 'Parent Product Id',
  PRIMARY KEY (`selection_id`,`parent_product_id`,`website_id`),
  KEY `CATALOG_PRODUCT_BUNDLE_SELECTION_PRICE_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Selection Price';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_bundle_stock_index`
--

CREATE TABLE IF NOT EXISTS `catalog_product_bundle_stock_index` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `stock_id` smallint(5) unsigned NOT NULL COMMENT 'Stock Id',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Id',
  `stock_status` smallint(6) DEFAULT '0' COMMENT 'Stock Status',
  PRIMARY KEY (`entity_id`,`website_id`,`stock_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Stock Index';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_entity`
--

CREATE TABLE IF NOT EXISTS `catalog_product_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Set ID',
  `type_id` varchar(32) NOT NULL DEFAULT 'simple' COMMENT 'Type ID',
  `sku` varchar(64) DEFAULT NULL COMMENT 'SKU',
  `has_options` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Has Options',
  `required_options` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Required Options',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Time',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update Time',
  PRIMARY KEY (`entity_id`),
  KEY `CATALOG_PRODUCT_ENTITY_ATTRIBUTE_SET_ID` (`attribute_set_id`),
  KEY `CATALOG_PRODUCT_ENTITY_SKU` (`sku`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Catalog Product Table' AUTO_INCREMENT=25 ;

--
-- Dumping data for table `catalog_product_entity`
--

INSERT INTO `catalog_product_entity` (`entity_id`, `attribute_set_id`, `type_id`, `sku`, `has_options`, `required_options`, `created_at`, `updated_at`) VALUES
(1, 9, 'simple', 'Grandee ® NXT-Alpine White-Mocha', 0, 0, '2018-12-18 19:11:44', '2018-12-20 13:09:05'),
(2, 9, 'simple', 'Grandee ® NXT-Alpine White-Monterey Gray', 0, 0, '2018-12-18 19:11:47', '2018-12-20 13:09:54'),
(3, 9, 'simple', 'Grandee ® NXT-Alpine White-Teak', 0, 0, '2018-12-18 19:11:47', '2018-12-25 19:14:10'),
(4, 9, 'simple', 'Grandee ® NXT-Tuscan Sun-Mocha', 0, 0, '2018-12-18 19:11:47', '2018-12-20 14:47:34'),
(5, 9, 'simple', 'Grandee ® NXT-Tuscan Sun-Monterey Gray', 0, 0, '2018-12-18 19:11:47', '2018-12-20 14:55:26'),
(6, 9, 'simple', 'Grandee ® NXT-Tuscan Sun-Teak', 0, 0, '2018-12-18 19:11:47', '2018-12-25 19:26:00'),
(7, 9, 'simple', 'Grandee ® NXT-Ice Gray-Mocha', 0, 0, '2018-12-18 19:11:47', '2018-12-20 14:47:49'),
(8, 9, 'simple', 'Grandee ® NXT-Ice Gray-Monterey Gray', 0, 0, '2018-12-18 19:11:48', '2018-12-25 19:26:48'),
(10, 9, 'simple', 'Grandee ® NXT-Crème-Mocha', 0, 0, '2018-12-18 19:11:48', '2018-12-20 14:46:51'),
(12, 9, 'simple', 'Grandee ® NXT-Crème-Teak', 0, 0, '2018-12-18 19:11:48', '2018-12-25 19:26:17'),
(13, 9, 'simple', 'Grandee ® NXT-Desert-Mocha', 0, 0, '2018-12-18 19:11:48', '2018-12-20 14:47:07'),
(15, 9, 'simple', 'Grandee ® NXT-Desert-Teak', 0, 0, '2018-12-18 19:11:48', '2018-12-25 19:26:31'),
(16, 9, 'simple', 'Grandee ® NXT-Platinum-Mocha', 0, 0, '2018-12-18 19:11:48', '2018-12-20 14:47:21'),
(17, 9, 'simple', 'Grandee ® NXT-Platinum-Monterey Gray', 0, 0, '2018-12-18 19:11:49', '2018-12-20 14:55:54'),
(19, 9, 'configurable', 'Grandee ® NXT', 1, 1, '2018-12-18 19:11:49', '2018-12-28 18:22:52'),
(20, 4, 'simple', 'coverlifters', 0, 0, '2018-12-19 02:26:05', '2018-12-23 15:23:00'),
(21, 4, 'simple', 'watercare', 0, 0, '2018-12-19 02:26:43', '2018-12-23 15:09:33'),
(22, 4, 'simple', 'hottubinnovation', 0, 0, '2018-12-19 02:28:47', '2018-12-23 15:09:54'),
(23, 4, 'simple', 'hottubenjoyment', 0, 0, '2018-12-19 02:30:19', '2018-12-28 15:57:12'),
(24, 4, 'simple', 'Hot Spring® 32" Polymer Spa Steps', 0, 0, '2018-12-31 18:35:45', '2018-12-31 18:35:45');

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_entity_datetime`
--

CREATE TABLE IF NOT EXISTS `catalog_product_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` datetime DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_PRODUCT_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_ENTITY_DATETIME_STORE_ID` (`store_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Catalog Product Datetime Attribute Backend Table' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `catalog_product_entity_datetime`
--

INSERT INTO `catalog_product_entity_datetime` (`value_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES
(1, 101, 0, 23, '2018-12-28 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_entity_decimal`
--

CREATE TABLE IF NOT EXISTS `catalog_product_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` decimal(12,4) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_PRODUCT_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_DECIMAL_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Catalog Product Decimal Attribute Backend Table' AUTO_INCREMENT=46 ;

--
-- Dumping data for table `catalog_product_entity_decimal`
--

INSERT INTO `catalog_product_entity_decimal` (`value_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES
(1, 77, 0, 1, 10.0000),
(2, 82, 0, 1, 1.0000),
(3, 77, 0, 2, 10.0000),
(4, 82, 0, 2, 1.0000),
(5, 77, 0, 3, 10.0000),
(6, 82, 0, 3, 1.0000),
(7, 77, 0, 4, 10.0000),
(8, 82, 0, 4, 1.0000),
(9, 77, 0, 5, 10.0000),
(10, 82, 0, 5, 1.0000),
(11, 77, 0, 6, 10.0000),
(12, 82, 0, 6, 1.0000),
(13, 77, 0, 7, 10.0000),
(14, 82, 0, 7, 1.0000),
(15, 77, 0, 8, 10.0000),
(16, 82, 0, 8, 1.0000),
(19, 77, 0, 10, 10.0000),
(20, 82, 0, 10, 1.0000),
(23, 77, 0, 12, 10.0000),
(24, 82, 0, 12, 1.0000),
(25, 77, 0, 13, 10.0000),
(26, 82, 0, 13, 1.0000),
(29, 77, 0, 15, 10.0000),
(30, 82, 0, 15, 1.0000),
(31, 77, 0, 16, 10.0000),
(32, 82, 0, 16, 1.0000),
(33, 77, 0, 17, 10.0000),
(34, 82, 0, 17, 1.0000),
(37, 82, 0, 19, 1.0000),
(38, 77, 0, 20, 10.0000),
(39, 77, 0, 21, 10.0000),
(41, 77, 0, 22, 10.0000),
(43, 77, 0, 23, 10.0000),
(44, 77, 0, 24, 10.0000),
(45, 82, 0, 24, 1.0000);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_entity_gallery`
--

CREATE TABLE IF NOT EXISTS `catalog_product_entity_gallery` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL DEFAULT '0' COMMENT 'Position',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_PRODUCT_ENTITY_GALLERY_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_GALLERY_ENTITY_ID` (`entity_id`),
  KEY `CATALOG_PRODUCT_ENTITY_GALLERY_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_ENTITY_GALLERY_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Gallery Attribute Backend Table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_entity_int`
--

CREATE TABLE IF NOT EXISTS `catalog_product_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` int(11) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_PRODUCT_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_ENTITY_INT_STORE_ID` (`store_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Catalog Product Integer Attribute Backend Table' AUTO_INCREMENT=146 ;

--
-- Dumping data for table `catalog_product_entity_int`
--

INSERT INTO `catalog_product_entity_int` (`value_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES
(1, 97, 0, 1, 1),
(2, 99, 0, 1, 1),
(3, 129, 0, 1, 2),
(4, 141, 0, 1, 4),
(5, 143, 0, 1, 12),
(6, 97, 0, 2, 1),
(7, 99, 0, 2, 1),
(8, 129, 0, 2, 2),
(9, 141, 0, 2, 5),
(10, 143, 0, 2, 12),
(11, 97, 0, 3, 1),
(12, 99, 0, 3, 1),
(13, 129, 0, 3, 2),
(14, 141, 0, 3, 6),
(15, 143, 0, 3, 12),
(16, 97, 0, 4, 1),
(17, 99, 0, 4, 1),
(18, 129, 0, 4, 2),
(19, 141, 0, 4, 4),
(20, 143, 0, 4, 14),
(21, 97, 0, 5, 1),
(22, 99, 0, 5, 1),
(23, 129, 0, 5, 2),
(24, 141, 0, 5, 5),
(25, 143, 0, 5, 14),
(26, 97, 0, 6, 1),
(27, 99, 0, 6, 1),
(28, 129, 0, 6, 2),
(29, 141, 0, 6, 6),
(30, 143, 0, 6, 14),
(31, 97, 0, 7, 1),
(32, 99, 0, 7, 1),
(33, 129, 0, 7, 2),
(34, 141, 0, 7, 4),
(35, 143, 0, 7, 16),
(36, 97, 0, 8, 1),
(37, 99, 0, 8, 1),
(38, 129, 0, 8, 2),
(39, 141, 0, 8, 5),
(40, 143, 0, 8, 16),
(46, 97, 0, 10, 1),
(47, 99, 0, 10, 1),
(48, 129, 0, 10, 2),
(49, 141, 0, 10, 4),
(50, 143, 0, 10, 13),
(56, 97, 0, 12, 1),
(57, 99, 0, 12, 1),
(58, 129, 0, 12, 2),
(59, 141, 0, 12, 6),
(60, 143, 0, 12, 13),
(61, 97, 0, 13, 1),
(62, 99, 0, 13, 1),
(63, 129, 0, 13, 2),
(64, 141, 0, 13, 4),
(65, 143, 0, 13, 15),
(71, 97, 0, 15, 1),
(72, 99, 0, 15, 1),
(73, 129, 0, 15, 2),
(74, 141, 0, 15, 6),
(75, 143, 0, 15, 15),
(76, 97, 0, 16, 1),
(77, 99, 0, 16, 1),
(78, 129, 0, 16, 2),
(79, 141, 0, 16, 4),
(80, 143, 0, 16, 17),
(81, 97, 0, 17, 1),
(82, 99, 0, 17, 1),
(83, 129, 0, 17, 2),
(84, 141, 0, 17, 5),
(85, 143, 0, 17, 17),
(91, 97, 0, 19, 1),
(92, 99, 0, 19, 4),
(93, 129, 0, 19, 2),
(95, 97, 0, 20, 1),
(96, 99, 0, 20, 4),
(97, 129, 0, 20, 2),
(98, 97, 0, 21, 1),
(99, 99, 0, 21, 4),
(100, 115, 0, 21, 1),
(101, 129, 0, 21, 2),
(103, 97, 0, 22, 1),
(104, 99, 0, 22, 4),
(105, 115, 0, 22, 1),
(106, 129, 0, 22, 2),
(108, 97, 0, 23, 1),
(109, 99, 0, 23, 4),
(110, 115, 0, 23, 1),
(111, 129, 0, 23, 2),
(113, 164, 0, 19, 1),
(114, 164, 0, 1, 0),
(115, 164, 0, 2, 0),
(116, 164, 0, 3, 0),
(117, 164, 0, 4, 0),
(118, 164, 0, 5, 0),
(119, 164, 0, 6, 0),
(120, 164, 0, 7, 0),
(121, 164, 0, 8, 0),
(123, 164, 0, 10, 0),
(125, 164, 0, 12, 0),
(126, 164, 0, 13, 0),
(127, 164, 0, 16, 0),
(128, 164, 0, 17, 0),
(129, 167, 0, 21, 1),
(130, 167, 0, 22, 1),
(131, 167, 0, 23, 0),
(132, 167, 0, 20, 1),
(133, 167, 0, 3, 0),
(134, 167, 0, 6, 0),
(135, 167, 0, 12, 0),
(136, 164, 0, 15, 0),
(137, 167, 0, 15, 0),
(138, 167, 0, 8, 0),
(139, 167, 0, 19, 0),
(140, 168, 0, 19, 1),
(141, 97, 0, 24, 1),
(142, 99, 0, 24, 4),
(143, 129, 0, 24, 2),
(144, 167, 0, 24, 0),
(145, 168, 0, 24, 0);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_entity_media_gallery`
--

CREATE TABLE IF NOT EXISTS `catalog_product_entity_media_gallery` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  `media_type` varchar(32) NOT NULL DEFAULT 'image' COMMENT 'Media entry type',
  `disabled` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Visibility status',
  PRIMARY KEY (`value_id`),
  KEY `CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_ATTRIBUTE_ID` (`attribute_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Catalog Product Media Gallery Attribute Backend Table' AUTO_INCREMENT=5 ;

--
-- Dumping data for table `catalog_product_entity_media_gallery`
--

INSERT INTO `catalog_product_entity_media_gallery` (`value_id`, `attribute_id`, `value`, `media_type`, `disabled`) VALUES
(1, 90, '/1/9/1900x550-a-spot-jet-system-grandee-nxt.jpg', 'image', 0),
(2, 90, '/1/2/1200px-steps-polymer-coastalgray-600x600.jpg', 'image', 0),
(3, 90, '/1/2/1200px-steps-polymer-espresso-600x600.jpg', 'image', 0),
(4, 90, '/1/2/1200px-steps-polymer-teak-600x600.jpg', 'image', 0);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_entity_media_gallery_value`
--

CREATE TABLE IF NOT EXISTS `catalog_product_entity_media_gallery_value` (
  `value_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Value ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `label` varchar(255) DEFAULT NULL COMMENT 'Label',
  `position` int(10) unsigned DEFAULT NULL COMMENT 'Position',
  `disabled` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Disabled',
  `record_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Record Id',
  PRIMARY KEY (`record_id`),
  KEY `CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_VALUE_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_VALUE_ENTITY_ID` (`entity_id`),
  KEY `CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_VALUE_VALUE_ID` (`value_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Catalog Product Media Gallery Attribute Value Table' AUTO_INCREMENT=14 ;

--
-- Dumping data for table `catalog_product_entity_media_gallery_value`
--

INSERT INTO `catalog_product_entity_media_gallery_value` (`value_id`, `store_id`, `entity_id`, `label`, `position`, `disabled`, `record_id`) VALUES
(1, 0, 19, NULL, 1, 0, 10),
(2, 0, 24, NULL, 1, 0, 11),
(3, 0, 24, NULL, 2, 0, 12),
(4, 0, 24, NULL, 3, 0, 13);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_entity_media_gallery_value_to_entity`
--

CREATE TABLE IF NOT EXISTS `catalog_product_entity_media_gallery_value_to_entity` (
  `value_id` int(10) unsigned NOT NULL COMMENT 'Value media Entry ID',
  `entity_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `CAT_PRD_ENTT_MDA_GLR_VAL_TO_ENTT_VAL_ID_ENTT_ID` (`value_id`,`entity_id`),
  KEY `CAT_PRD_ENTT_MDA_GLR_VAL_TO_ENTT_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Link Media value to Product entity table';

--
-- Dumping data for table `catalog_product_entity_media_gallery_value_to_entity`
--

INSERT INTO `catalog_product_entity_media_gallery_value_to_entity` (`value_id`, `entity_id`) VALUES
(1, 19),
(2, 24),
(3, 24),
(4, 24);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_entity_media_gallery_value_video`
--

CREATE TABLE IF NOT EXISTS `catalog_product_entity_media_gallery_value_video` (
  `value_id` int(10) unsigned NOT NULL COMMENT 'Media Entity ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `provider` varchar(32) DEFAULT NULL COMMENT 'Video provider ID',
  `url` text COMMENT 'Video URL',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  `description` text COMMENT 'Page Meta Description',
  `metadata` text COMMENT 'Video meta data',
  UNIQUE KEY `CAT_PRD_ENTT_MDA_GLR_VAL_VIDEO_VAL_ID_STORE_ID` (`value_id`,`store_id`),
  KEY `CAT_PRD_ENTT_MDA_GLR_VAL_VIDEO_STORE_ID_STORE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Video Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_entity_text`
--

CREATE TABLE IF NOT EXISTS `catalog_product_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` text COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_PRODUCT_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_ENTITY_TEXT_STORE_ID` (`store_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Catalog Product Text Attribute Backend Table' AUTO_INCREMENT=105 ;

--
-- Dumping data for table `catalog_product_entity_text`
--

INSERT INTO `catalog_product_entity_text` (`value_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES
(1, 76, 0, 1, '<h2>The Grandee NXT is the best in spa technology.</h2>\r\nThe Grandee NXT offers contemporary design and innovations like the exclusive wireless remote control.\r\n\r\nAs a part of the <a href="https://www.hotspring.com/shop-hot-tub-models/nxt" target="_blank" rel="noopener noreferrer">Highlife Collection NXT</a>, the Grandee NXT spa features an insulating hinge seal, 100% no-bypass filtration for cleaner water, the BellaFontana® fountain, and much more. It also offers contemporary design language and innovations like the exclusive wireless remote control.\r\n\r\nIn addition to the unparalleled performance you can count on from the Highlife Collection, the NXT models offer value-added and innovative upgrades.'),
(2, 85, 0, 1, 'Grandee ® NXT'),
(3, 154, 0, 1, '<div class="spec_box">\r\n<div class="spec_label">Seating Capacity</div>\r\n<div class="spec_value">7 Adults</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Dimensions</div>\r\n<div class="spec_value">\r\n<p>8′ 4″ x 7′ 7″ x 38″</p>\r\n<p>2.54m x 2.31m x .97m</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Water Capacity</div>\r\n<div class="spec_value">\r\n<p>450 gallons</p>\r\n<p>1,700 liters</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Weight</div>\r\n<div class="spec_value">\r\n<p>940 lbs / 425 kg (dry)</p>\r\n<p>5,920 lbs / 2,685 kg (filled)</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Jet Count</div>\r\n<div class="spec_value">43</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Hot Tub Jets</div>\r\n<div class="spec_value">\r\n<p>2 Moto-Massage® DX jets (2)</p>\r\n<p>2 SoothingStream jets</p>\r\n<p>3 JetStream jets</p>\r\n<p>2 Rotary Hydromassage jets</p>\r\n<p>2 Directional Hydromassage jets</p>\r\n<p>30 Directional Precision jets</p>\r\n</div>\r\n</div>'),
(4, 155, 0, 1, '<div class="spec_box">\r\n<div class="spec_label">Lighting System</div>\r\n<div class="spec_value">Luminescence® multi-color four-zone</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Water Features</div>\r\n<div class="spec_value">BellaFontana® with 3 illuminated arcs of water</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Control System</div>\r\n<div class="spec_value">\r\n<p>IQ 2020® with wireless remote control</p>\r\n<p>230v/50amp, 60Hz</p>\r\n<p>Includes G.F.C.I. protected sub-panel</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Heater</div>\r\n<div class="spec_value">No-Fault® , 4000w/230v</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Jet Pump 1</div>\r\n<div class="spec_value">\r\n<p>Wavemaster® 9200</p>\r\n<p>Two-Speed</p>\r\n<p>2.5 HP, continuous duty</p>\r\n<p>5.2 HP, breakdown torque</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Jet Pump 2</div>\r\n<div class="spec_value">\r\n<p>Wavemaster® 9200</p>\r\n<p>One-Speed</p>\r\n<p>2.5 HP, continuous duty</p>\r\n<p>5.2 HP, breakdown torque</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Circulation Pump</div>\r\n<div class="spec_value">SilentFlo 5000® for quiet continuous filtration</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Ozone System</div>\r\n<div class="spec_value">FreshWater® III Corona Discharge</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Water Care Options</div>\r\n<div class="spec_value">ACE® salt water sanitizing system or EverFresh® system</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Effective Filtration Area</div>\r\n<div class="spec_value">325 sq. ft., top loading Tri-X® filters; 100% no-bypass flitration</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Vinyl Cover</div>\r\n<div class="spec_value">3.5″ to 2.5″ tapered, 2 lb. density foam core with hinge seal</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Vinyl Cover Colors</div>\r\n<div class="spec_value">Caramel, Chocolate, Slate or Evergreen</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Entertainment Systems (Optional)</div>\r\n<div class="spec_value">Wireless Sound System</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Cover Lifters (Optional)</div>\r\n<div class="spec_value">CoverCradle®, CoverCradle II, Lift n’Glide® or UpRite</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Steps (Optional)</div>\r\n<div class="spec_value">Everwood HD®, NXT or Polymer</div>\r\n</div>'),
(5, 157, 0, 1, '<div class="jquery-sticky-element" id="techSpaPic">\r\n                    <div class="spec-img-wrapper">\r\n                        <img class="specs-img" src="http://watkinsdealer.s3.amazonaws.com/Hot%20Tub%20Images/Hot%20Spring%20Spas/Full%20Top%20Down%20Images/hs-highlife-grandee-nxt-ice-grey-overhead.png" alt="" height="400">\r\n                        <div class="height"><p>7'' 7"</p></div>\r\n                        <div class="width"><p>8'' 4"</p></div>\r\n                    </div>\r\n                </div>'),
(6, 76, 0, 2, '<h2>The Grandee NXT is the best in spa technology.</h2>\r\nThe Grandee NXT offers contemporary design and innovations like the exclusive wireless remote control.\r\n\r\nAs a part of the <a href="https://www.hotspring.com/shop-hot-tub-models/nxt" target="_blank" rel="noopener noreferrer">Highlife Collection NXT</a>, the Grandee NXT spa features an insulating hinge seal, 100% no-bypass filtration for cleaner water, the BellaFontana® fountain, and much more. It also offers contemporary design language and innovations like the exclusive wireless remote control.\r\n\r\nIn addition to the unparalleled performance you can count on from the Highlife Collection, the NXT models offer value-added and innovative upgrades.'),
(7, 85, 0, 2, 'Grandee ® NXT'),
(8, 154, 0, 2, '<div class="spec_box">\r\n<div class="spec_label">Seating Capacity</div>\r\n<div class="spec_value">7 Adults</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Dimensions</div>\r\n<div class="spec_value">\r\n<p>8′ 4″ x 7′ 7″ x 38″</p>\r\n<p>2.54m x 2.31m x .97m</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Water Capacity</div>\r\n<div class="spec_value">\r\n<p>450 gallons</p>\r\n<p>1,700 liters</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Weight</div>\r\n<div class="spec_value">\r\n<p>940 lbs / 425 kg (dry)</p>\r\n<p>5,920 lbs / 2,685 kg (filled)</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Jet Count</div>\r\n<div class="spec_value">43</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Hot Tub Jets</div>\r\n<div class="spec_value">\r\n<p>2 Moto-Massage® DX jets (2)</p>\r\n<p>2 SoothingStream jets</p>\r\n<p>3 JetStream jets</p>\r\n<p>2 Rotary Hydromassage jets</p>\r\n<p>2 Directional Hydromassage jets</p>\r\n<p>30 Directional Precision jets</p>\r\n</div>\r\n</div>'),
(9, 155, 0, 2, '<div class="spec_box">\r\n<div class="spec_label">Lighting System</div>\r\n<div class="spec_value">Luminescence® multi-color four-zone</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Water Features</div>\r\n<div class="spec_value">BellaFontana® with 3 illuminated arcs of water</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Control System</div>\r\n<div class="spec_value">\r\n<p>IQ 2020® with wireless remote control</p>\r\n<p>230v/50amp, 60Hz</p>\r\n<p>Includes G.F.C.I. protected sub-panel</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Heater</div>\r\n<div class="spec_value">No-Fault® , 4000w/230v</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Jet Pump 1</div>\r\n<div class="spec_value">\r\n<p>Wavemaster® 9200</p>\r\n<p>Two-Speed</p>\r\n<p>2.5 HP, continuous duty</p>\r\n<p>5.2 HP, breakdown torque</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Jet Pump 2</div>\r\n<div class="spec_value">\r\n<p>Wavemaster® 9200</p>\r\n<p>One-Speed</p>\r\n<p>2.5 HP, continuous duty</p>\r\n<p>5.2 HP, breakdown torque</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Circulation Pump</div>\r\n<div class="spec_value">SilentFlo 5000® for quiet continuous filtration</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Ozone System</div>\r\n<div class="spec_value">FreshWater® III Corona Discharge</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Water Care Options</div>\r\n<div class="spec_value">ACE® salt water sanitizing system or EverFresh® system</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Effective Filtration Area</div>\r\n<div class="spec_value">325 sq. ft., top loading Tri-X® filters; 100% no-bypass flitration</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Vinyl Cover</div>\r\n<div class="spec_value">3.5″ to 2.5″ tapered, 2 lb. density foam core with hinge seal</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Vinyl Cover Colors</div>\r\n<div class="spec_value">Caramel, Chocolate, Slate or Evergreen</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Entertainment Systems (Optional)</div>\r\n<div class="spec_value">Wireless Sound System</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Cover Lifters (Optional)</div>\r\n<div class="spec_value">CoverCradle®, CoverCradle II, Lift n’Glide® or UpRite</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Steps (Optional)</div>\r\n<div class="spec_value">Everwood HD®, NXT or Polymer</div>\r\n</div>'),
(10, 157, 0, 2, '<div class="jquery-sticky-element" id="techSpaPic">\r\n                    <div class="spec-img-wrapper">\r\n                        <img class="specs-img" src="http://watkinsdealer.s3.amazonaws.com/Hot%20Tub%20Images/Hot%20Spring%20Spas/Full%20Top%20Down%20Images/hs-highlife-grandee-nxt-ice-grey-overhead.png" alt="" height="400">\r\n                        <div class="height"><p>7'' 7"</p></div>\r\n                        <div class="width"><p>8'' 4"</p></div>\r\n                    </div>\r\n                </div>'),
(11, 76, 0, 3, '<h2>The Grandee NXT is the best in spa technology.</h2>\r\nThe Grandee NXT offers contemporary design and innovations like the exclusive wireless remote control.\r\n\r\nAs a part of the <a href="https://www.hotspring.com/shop-hot-tub-models/nxt" target="_blank" rel="noopener noreferrer">Highlife Collection NXT</a>, the Grandee NXT spa features an insulating hinge seal, 100% no-bypass filtration for cleaner water, the BellaFontana® fountain, and much more. It also offers contemporary design language and innovations like the exclusive wireless remote control.\r\n\r\nIn addition to the unparalleled performance you can count on from the Highlife Collection, the NXT models offer value-added and innovative upgrades.'),
(12, 85, 0, 3, 'Grandee ® NXT'),
(13, 154, 0, 3, '<div class="spec_box">\r\n<div class="spec_label">Seating Capacity</div>\r\n<div class="spec_value">7 Adults</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Dimensions</div>\r\n<div class="spec_value">\r\n<p>8′ 4″ x 7′ 7″ x 38″</p>\r\n<p>2.54m x 2.31m x .97m</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Water Capacity</div>\r\n<div class="spec_value">\r\n<p>450 gallons</p>\r\n<p>1,700 liters</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Weight</div>\r\n<div class="spec_value">\r\n<p>940 lbs / 425 kg (dry)</p>\r\n<p>5,920 lbs / 2,685 kg (filled)</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Jet Count</div>\r\n<div class="spec_value">43</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Hot Tub Jets</div>\r\n<div class="spec_value">\r\n<p>2 Moto-Massage® DX jets (2)</p>\r\n<p>2 SoothingStream jets</p>\r\n<p>3 JetStream jets</p>\r\n<p>2 Rotary Hydromassage jets</p>\r\n<p>2 Directional Hydromassage jets</p>\r\n<p>30 Directional Precision jets</p>\r\n</div>\r\n</div>'),
(14, 155, 0, 3, '<div class="spec_box">\r\n<div class="spec_label">Lighting System</div>\r\n<div class="spec_value">Luminescence® multi-color four-zone</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Water Features</div>\r\n<div class="spec_value">BellaFontana® with 3 illuminated arcs of water</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Control System</div>\r\n<div class="spec_value">\r\n<p>IQ 2020® with wireless remote control</p>\r\n<p>230v/50amp, 60Hz</p>\r\n<p>Includes G.F.C.I. protected sub-panel</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Heater</div>\r\n<div class="spec_value">No-Fault® , 4000w/230v</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Jet Pump 1</div>\r\n<div class="spec_value">\r\n<p>Wavemaster® 9200</p>\r\n<p>Two-Speed</p>\r\n<p>2.5 HP, continuous duty</p>\r\n<p>5.2 HP, breakdown torque</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Jet Pump 2</div>\r\n<div class="spec_value">\r\n<p>Wavemaster® 9200</p>\r\n<p>One-Speed</p>\r\n<p>2.5 HP, continuous duty</p>\r\n<p>5.2 HP, breakdown torque</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Circulation Pump</div>\r\n<div class="spec_value">SilentFlo 5000® for quiet continuous filtration</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Ozone System</div>\r\n<div class="spec_value">FreshWater® III Corona Discharge</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Water Care Options</div>\r\n<div class="spec_value">ACE® salt water sanitizing system or EverFresh® system</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Effective Filtration Area</div>\r\n<div class="spec_value">325 sq. ft., top loading Tri-X® filters; 100% no-bypass flitration</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Vinyl Cover</div>\r\n<div class="spec_value">3.5″ to 2.5″ tapered, 2 lb. density foam core with hinge seal</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Vinyl Cover Colors</div>\r\n<div class="spec_value">Caramel, Chocolate, Slate or Evergreen</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Entertainment Systems (Optional)</div>\r\n<div class="spec_value">Wireless Sound System</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Cover Lifters (Optional)</div>\r\n<div class="spec_value">CoverCradle®, CoverCradle II, Lift n’Glide® or UpRite</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Steps (Optional)</div>\r\n<div class="spec_value">Everwood HD®, NXT or Polymer</div>\r\n</div>'),
(15, 157, 0, 3, '<div class="jquery-sticky-element" id="techSpaPic">\r\n                    <div class="spec-img-wrapper">\r\n                        <img class="specs-img" src="http://watkinsdealer.s3.amazonaws.com/Hot%20Tub%20Images/Hot%20Spring%20Spas/Full%20Top%20Down%20Images/hs-highlife-grandee-nxt-ice-grey-overhead.png" alt="" height="400">\r\n                        <div class="height"><p>7'' 7"</p></div>\r\n                        <div class="width"><p>8'' 4"</p></div>\r\n                    </div>\r\n                </div>'),
(16, 76, 0, 4, '<h2>The Grandee NXT is the best in spa technology.</h2>\r\nThe Grandee NXT offers contemporary design and innovations like the exclusive wireless remote control.\r\n\r\nAs a part of the <a href="https://www.hotspring.com/shop-hot-tub-models/nxt" target="_blank" rel="noopener noreferrer">Highlife Collection NXT</a>, the Grandee NXT spa features an insulating hinge seal, 100% no-bypass filtration for cleaner water, the BellaFontana® fountain, and much more. It also offers contemporary design language and innovations like the exclusive wireless remote control.\r\n\r\nIn addition to the unparalleled performance you can count on from the Highlife Collection, the NXT models offer value-added and innovative upgrades.'),
(17, 85, 0, 4, 'Grandee ® NXT'),
(18, 154, 0, 4, '<div class="spec_box">\r\n<div class="spec_label">Seating Capacity</div>\r\n<div class="spec_value">7 Adults</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Dimensions</div>\r\n<div class="spec_value">\r\n<p>8′ 4″ x 7′ 7″ x 38″</p>\r\n<p>2.54m x 2.31m x .97m</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Water Capacity</div>\r\n<div class="spec_value">\r\n<p>450 gallons</p>\r\n<p>1,700 liters</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Weight</div>\r\n<div class="spec_value">\r\n<p>940 lbs / 425 kg (dry)</p>\r\n<p>5,920 lbs / 2,685 kg (filled)</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Jet Count</div>\r\n<div class="spec_value">43</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Hot Tub Jets</div>\r\n<div class="spec_value">\r\n<p>2 Moto-Massage® DX jets (2)</p>\r\n<p>2 SoothingStream jets</p>\r\n<p>3 JetStream jets</p>\r\n<p>2 Rotary Hydromassage jets</p>\r\n<p>2 Directional Hydromassage jets</p>\r\n<p>30 Directional Precision jets</p>\r\n</div>\r\n</div>'),
(19, 155, 0, 4, '<div class="spec_box">\r\n<div class="spec_label">Lighting System</div>\r\n<div class="spec_value">Luminescence® multi-color four-zone</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Water Features</div>\r\n<div class="spec_value">BellaFontana® with 3 illuminated arcs of water</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Control System</div>\r\n<div class="spec_value">\r\n<p>IQ 2020® with wireless remote control</p>\r\n<p>230v/50amp, 60Hz</p>\r\n<p>Includes G.F.C.I. protected sub-panel</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Heater</div>\r\n<div class="spec_value">No-Fault® , 4000w/230v</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Jet Pump 1</div>\r\n<div class="spec_value">\r\n<p>Wavemaster® 9200</p>\r\n<p>Two-Speed</p>\r\n<p>2.5 HP, continuous duty</p>\r\n<p>5.2 HP, breakdown torque</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Jet Pump 2</div>\r\n<div class="spec_value">\r\n<p>Wavemaster® 9200</p>\r\n<p>One-Speed</p>\r\n<p>2.5 HP, continuous duty</p>\r\n<p>5.2 HP, breakdown torque</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Circulation Pump</div>\r\n<div class="spec_value">SilentFlo 5000® for quiet continuous filtration</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Ozone System</div>\r\n<div class="spec_value">FreshWater® III Corona Discharge</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Water Care Options</div>\r\n<div class="spec_value">ACE® salt water sanitizing system or EverFresh® system</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Effective Filtration Area</div>\r\n<div class="spec_value">325 sq. ft., top loading Tri-X® filters; 100% no-bypass flitration</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Vinyl Cover</div>\r\n<div class="spec_value">3.5″ to 2.5″ tapered, 2 lb. density foam core with hinge seal</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Vinyl Cover Colors</div>\r\n<div class="spec_value">Caramel, Chocolate, Slate or Evergreen</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Entertainment Systems (Optional)</div>\r\n<div class="spec_value">Wireless Sound System</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Cover Lifters (Optional)</div>\r\n<div class="spec_value">CoverCradle®, CoverCradle II, Lift n’Glide® or UpRite</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Steps (Optional)</div>\r\n<div class="spec_value">Everwood HD®, NXT or Polymer</div>\r\n</div>'),
(20, 157, 0, 4, '<div class="jquery-sticky-element" id="techSpaPic">\r\n                    <div class="spec-img-wrapper">\r\n                        <img class="specs-img" src="http://watkinsdealer.s3.amazonaws.com/Hot%20Tub%20Images/Hot%20Spring%20Spas/Full%20Top%20Down%20Images/hs-highlife-grandee-nxt-ice-grey-overhead.png" alt="" height="400">\r\n                        <div class="height"><p>7'' 7"</p></div>\r\n                        <div class="width"><p>8'' 4"</p></div>\r\n                    </div>\r\n                </div>'),
(21, 76, 0, 5, '<h2>The Grandee NXT is the best in spa technology.</h2>\r\nThe Grandee NXT offers contemporary design and innovations like the exclusive wireless remote control.\r\n\r\nAs a part of the <a href="https://www.hotspring.com/shop-hot-tub-models/nxt" target="_blank" rel="noopener noreferrer">Highlife Collection NXT</a>, the Grandee NXT spa features an insulating hinge seal, 100% no-bypass filtration for cleaner water, the BellaFontana® fountain, and much more. It also offers contemporary design language and innovations like the exclusive wireless remote control.\r\n\r\nIn addition to the unparalleled performance you can count on from the Highlife Collection, the NXT models offer value-added and innovative upgrades.'),
(22, 85, 0, 5, 'Grandee ® NXT'),
(23, 154, 0, 5, '<div class="spec_box">\r\n<div class="spec_label">Seating Capacity</div>\r\n<div class="spec_value">7 Adults</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Dimensions</div>\r\n<div class="spec_value">\r\n<p>8′ 4″ x 7′ 7″ x 38″</p>\r\n<p>2.54m x 2.31m x .97m</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Water Capacity</div>\r\n<div class="spec_value">\r\n<p>450 gallons</p>\r\n<p>1,700 liters</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Weight</div>\r\n<div class="spec_value">\r\n<p>940 lbs / 425 kg (dry)</p>\r\n<p>5,920 lbs / 2,685 kg (filled)</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Jet Count</div>\r\n<div class="spec_value">43</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Hot Tub Jets</div>\r\n<div class="spec_value">\r\n<p>2 Moto-Massage® DX jets (2)</p>\r\n<p>2 SoothingStream jets</p>\r\n<p>3 JetStream jets</p>\r\n<p>2 Rotary Hydromassage jets</p>\r\n<p>2 Directional Hydromassage jets</p>\r\n<p>30 Directional Precision jets</p>\r\n</div>\r\n</div>'),
(24, 155, 0, 5, '<div class="spec_box">\r\n<div class="spec_label">Lighting System</div>\r\n<div class="spec_value">Luminescence® multi-color four-zone</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Water Features</div>\r\n<div class="spec_value">BellaFontana® with 3 illuminated arcs of water</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Control System</div>\r\n<div class="spec_value">\r\n<p>IQ 2020® with wireless remote control</p>\r\n<p>230v/50amp, 60Hz</p>\r\n<p>Includes G.F.C.I. protected sub-panel</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Heater</div>\r\n<div class="spec_value">No-Fault® , 4000w/230v</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Jet Pump 1</div>\r\n<div class="spec_value">\r\n<p>Wavemaster® 9200</p>\r\n<p>Two-Speed</p>\r\n<p>2.5 HP, continuous duty</p>\r\n<p>5.2 HP, breakdown torque</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Jet Pump 2</div>\r\n<div class="spec_value">\r\n<p>Wavemaster® 9200</p>\r\n<p>One-Speed</p>\r\n<p>2.5 HP, continuous duty</p>\r\n<p>5.2 HP, breakdown torque</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Circulation Pump</div>\r\n<div class="spec_value">SilentFlo 5000® for quiet continuous filtration</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Ozone System</div>\r\n<div class="spec_value">FreshWater® III Corona Discharge</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Water Care Options</div>\r\n<div class="spec_value">ACE® salt water sanitizing system or EverFresh® system</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Effective Filtration Area</div>\r\n<div class="spec_value">325 sq. ft., top loading Tri-X® filters; 100% no-bypass flitration</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Vinyl Cover</div>\r\n<div class="spec_value">3.5″ to 2.5″ tapered, 2 lb. density foam core with hinge seal</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Vinyl Cover Colors</div>\r\n<div class="spec_value">Caramel, Chocolate, Slate or Evergreen</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Entertainment Systems (Optional)</div>\r\n<div class="spec_value">Wireless Sound System</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Cover Lifters (Optional)</div>\r\n<div class="spec_value">CoverCradle®, CoverCradle II, Lift n’Glide® or UpRite</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Steps (Optional)</div>\r\n<div class="spec_value">Everwood HD®, NXT or Polymer</div>\r\n</div>'),
(25, 157, 0, 5, '<div class="jquery-sticky-element" id="techSpaPic">\r\n                    <div class="spec-img-wrapper">\r\n                        <img class="specs-img" src="http://watkinsdealer.s3.amazonaws.com/Hot%20Tub%20Images/Hot%20Spring%20Spas/Full%20Top%20Down%20Images/hs-highlife-grandee-nxt-ice-grey-overhead.png" alt="" height="400">\r\n                        <div class="height"><p>7'' 7"</p></div>\r\n                        <div class="width"><p>8'' 4"</p></div>\r\n                    </div>\r\n                </div>'),
(26, 76, 0, 6, '<h2>The Grandee NXT is the best in spa technology.</h2>\r\nThe Grandee NXT offers contemporary design and innovations like the exclusive wireless remote control.\r\n\r\nAs a part of the <a href="https://www.hotspring.com/shop-hot-tub-models/nxt" target="_blank" rel="noopener noreferrer">Highlife Collection NXT</a>, the Grandee NXT spa features an insulating hinge seal, 100% no-bypass filtration for cleaner water, the BellaFontana® fountain, and much more. It also offers contemporary design language and innovations like the exclusive wireless remote control.\r\n\r\nIn addition to the unparalleled performance you can count on from the Highlife Collection, the NXT models offer value-added and innovative upgrades.'),
(27, 85, 0, 6, 'Grandee ® NXT'),
(28, 154, 0, 6, '<div class="spec_box">\r\n<div class="spec_label">Seating Capacity</div>\r\n<div class="spec_value">7 Adults</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Dimensions</div>\r\n<div class="spec_value">\r\n<p>8′ 4″ x 7′ 7″ x 38″</p>\r\n<p>2.54m x 2.31m x .97m</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Water Capacity</div>\r\n<div class="spec_value">\r\n<p>450 gallons</p>\r\n<p>1,700 liters</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Weight</div>\r\n<div class="spec_value">\r\n<p>940 lbs / 425 kg (dry)</p>\r\n<p>5,920 lbs / 2,685 kg (filled)</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Jet Count</div>\r\n<div class="spec_value">43</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Hot Tub Jets</div>\r\n<div class="spec_value">\r\n<p>2 Moto-Massage® DX jets (2)</p>\r\n<p>2 SoothingStream jets</p>\r\n<p>3 JetStream jets</p>\r\n<p>2 Rotary Hydromassage jets</p>\r\n<p>2 Directional Hydromassage jets</p>\r\n<p>30 Directional Precision jets</p>\r\n</div>\r\n</div>'),
(29, 155, 0, 6, '<div class="spec_box">\r\n<div class="spec_label">Lighting System</div>\r\n<div class="spec_value">Luminescence® multi-color four-zone</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Water Features</div>\r\n<div class="spec_value">BellaFontana® with 3 illuminated arcs of water</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Control System</div>\r\n<div class="spec_value">\r\n<p>IQ 2020® with wireless remote control</p>\r\n<p>230v/50amp, 60Hz</p>\r\n<p>Includes G.F.C.I. protected sub-panel</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Heater</div>\r\n<div class="spec_value">No-Fault® , 4000w/230v</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Jet Pump 1</div>\r\n<div class="spec_value">\r\n<p>Wavemaster® 9200</p>\r\n<p>Two-Speed</p>\r\n<p>2.5 HP, continuous duty</p>\r\n<p>5.2 HP, breakdown torque</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Jet Pump 2</div>\r\n<div class="spec_value">\r\n<p>Wavemaster® 9200</p>\r\n<p>One-Speed</p>\r\n<p>2.5 HP, continuous duty</p>\r\n<p>5.2 HP, breakdown torque</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Circulation Pump</div>\r\n<div class="spec_value">SilentFlo 5000® for quiet continuous filtration</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Ozone System</div>\r\n<div class="spec_value">FreshWater® III Corona Discharge</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Water Care Options</div>\r\n<div class="spec_value">ACE® salt water sanitizing system or EverFresh® system</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Effective Filtration Area</div>\r\n<div class="spec_value">325 sq. ft., top loading Tri-X® filters; 100% no-bypass flitration</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Vinyl Cover</div>\r\n<div class="spec_value">3.5″ to 2.5″ tapered, 2 lb. density foam core with hinge seal</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Vinyl Cover Colors</div>\r\n<div class="spec_value">Caramel, Chocolate, Slate or Evergreen</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Entertainment Systems (Optional)</div>\r\n<div class="spec_value">Wireless Sound System</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Cover Lifters (Optional)</div>\r\n<div class="spec_value">CoverCradle®, CoverCradle II, Lift n’Glide® or UpRite</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Steps (Optional)</div>\r\n<div class="spec_value">Everwood HD®, NXT or Polymer</div>\r\n</div>'),
(30, 157, 0, 6, '<div class="jquery-sticky-element" id="techSpaPic">\r\n                    <div class="spec-img-wrapper">\r\n                        <img class="specs-img" src="http://watkinsdealer.s3.amazonaws.com/Hot%20Tub%20Images/Hot%20Spring%20Spas/Full%20Top%20Down%20Images/hs-highlife-grandee-nxt-ice-grey-overhead.png" alt="" height="400">\r\n                        <div class="height"><p>7'' 7"</p></div>\r\n                        <div class="width"><p>8'' 4"</p></div>\r\n                    </div>\r\n                </div>'),
(31, 76, 0, 7, '<h2>The Grandee NXT is the best in spa technology.</h2>\r\nThe Grandee NXT offers contemporary design and innovations like the exclusive wireless remote control.\r\n\r\nAs a part of the <a href="https://www.hotspring.com/shop-hot-tub-models/nxt" target="_blank" rel="noopener noreferrer">Highlife Collection NXT</a>, the Grandee NXT spa features an insulating hinge seal, 100% no-bypass filtration for cleaner water, the BellaFontana® fountain, and much more. It also offers contemporary design language and innovations like the exclusive wireless remote control.\r\n\r\nIn addition to the unparalleled performance you can count on from the Highlife Collection, the NXT models offer value-added and innovative upgrades.'),
(32, 85, 0, 7, 'Grandee ® NXT'),
(33, 154, 0, 7, '<div class="spec_box">\r\n<div class="spec_label">Seating Capacity</div>\r\n<div class="spec_value">7 Adults</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Dimensions</div>\r\n<div class="spec_value">\r\n<p>8′ 4″ x 7′ 7″ x 38″</p>\r\n<p>2.54m x 2.31m x .97m</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Water Capacity</div>\r\n<div class="spec_value">\r\n<p>450 gallons</p>\r\n<p>1,700 liters</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Weight</div>\r\n<div class="spec_value">\r\n<p>940 lbs / 425 kg (dry)</p>\r\n<p>5,920 lbs / 2,685 kg (filled)</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Jet Count</div>\r\n<div class="spec_value">43</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Hot Tub Jets</div>\r\n<div class="spec_value">\r\n<p>2 Moto-Massage® DX jets (2)</p>\r\n<p>2 SoothingStream jets</p>\r\n<p>3 JetStream jets</p>\r\n<p>2 Rotary Hydromassage jets</p>\r\n<p>2 Directional Hydromassage jets</p>\r\n<p>30 Directional Precision jets</p>\r\n</div>\r\n</div>'),
(34, 155, 0, 7, '<div class="spec_box">\r\n<div class="spec_label">Lighting System</div>\r\n<div class="spec_value">Luminescence® multi-color four-zone</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Water Features</div>\r\n<div class="spec_value">BellaFontana® with 3 illuminated arcs of water</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Control System</div>\r\n<div class="spec_value">\r\n<p>IQ 2020® with wireless remote control</p>\r\n<p>230v/50amp, 60Hz</p>\r\n<p>Includes G.F.C.I. protected sub-panel</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Heater</div>\r\n<div class="spec_value">No-Fault® , 4000w/230v</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Jet Pump 1</div>\r\n<div class="spec_value">\r\n<p>Wavemaster® 9200</p>\r\n<p>Two-Speed</p>\r\n<p>2.5 HP, continuous duty</p>\r\n<p>5.2 HP, breakdown torque</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Jet Pump 2</div>\r\n<div class="spec_value">\r\n<p>Wavemaster® 9200</p>\r\n<p>One-Speed</p>\r\n<p>2.5 HP, continuous duty</p>\r\n<p>5.2 HP, breakdown torque</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Circulation Pump</div>\r\n<div class="spec_value">SilentFlo 5000® for quiet continuous filtration</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Ozone System</div>\r\n<div class="spec_value">FreshWater® III Corona Discharge</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Water Care Options</div>\r\n<div class="spec_value">ACE® salt water sanitizing system or EverFresh® system</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Effective Filtration Area</div>\r\n<div class="spec_value">325 sq. ft., top loading Tri-X® filters; 100% no-bypass flitration</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Vinyl Cover</div>\r\n<div class="spec_value">3.5″ to 2.5″ tapered, 2 lb. density foam core with hinge seal</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Vinyl Cover Colors</div>\r\n<div class="spec_value">Caramel, Chocolate, Slate or Evergreen</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Entertainment Systems (Optional)</div>\r\n<div class="spec_value">Wireless Sound System</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Cover Lifters (Optional)</div>\r\n<div class="spec_value">CoverCradle®, CoverCradle II, Lift n’Glide® or UpRite</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Steps (Optional)</div>\r\n<div class="spec_value">Everwood HD®, NXT or Polymer</div>\r\n</div>'),
(35, 157, 0, 7, '<div class="jquery-sticky-element" id="techSpaPic">\r\n                    <div class="spec-img-wrapper">\r\n                        <img class="specs-img" src="http://watkinsdealer.s3.amazonaws.com/Hot%20Tub%20Images/Hot%20Spring%20Spas/Full%20Top%20Down%20Images/hs-highlife-grandee-nxt-ice-grey-overhead.png" alt="" height="400">\r\n                        <div class="height"><p>7'' 7"</p></div>\r\n                        <div class="width"><p>8'' 4"</p></div>\r\n                    </div>\r\n                </div>'),
(36, 76, 0, 8, '<h2>The Grandee NXT is the best in spa technology.</h2>\r\nThe Grandee NXT offers contemporary design and innovations like the exclusive wireless remote control.\r\n\r\nAs a part of the <a href="https://www.hotspring.com/shop-hot-tub-models/nxt" target="_blank" rel="noopener noreferrer">Highlife Collection NXT</a>, the Grandee NXT spa features an insulating hinge seal, 100% no-bypass filtration for cleaner water, the BellaFontana® fountain, and much more. It also offers contemporary design language and innovations like the exclusive wireless remote control.\r\n\r\nIn addition to the unparalleled performance you can count on from the Highlife Collection, the NXT models offer value-added and innovative upgrades.'),
(37, 85, 0, 8, 'Grandee ® NXT'),
(38, 154, 0, 8, '<div class="spec_box">\r\n<div class="spec_label">Seating Capacity</div>\r\n<div class="spec_value">7 Adults</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Dimensions</div>\r\n<div class="spec_value">\r\n<p>8′ 4″ x 7′ 7″ x 38″</p>\r\n<p>2.54m x 2.31m x .97m</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Water Capacity</div>\r\n<div class="spec_value">\r\n<p>450 gallons</p>\r\n<p>1,700 liters</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Weight</div>\r\n<div class="spec_value">\r\n<p>940 lbs / 425 kg (dry)</p>\r\n<p>5,920 lbs / 2,685 kg (filled)</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Jet Count</div>\r\n<div class="spec_value">43</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Hot Tub Jets</div>\r\n<div class="spec_value">\r\n<p>2 Moto-Massage® DX jets (2)</p>\r\n<p>2 SoothingStream jets</p>\r\n<p>3 JetStream jets</p>\r\n<p>2 Rotary Hydromassage jets</p>\r\n<p>2 Directional Hydromassage jets</p>\r\n<p>30 Directional Precision jets</p>\r\n</div>\r\n</div>'),
(39, 155, 0, 8, '<div class="spec_box">\r\n<div class="spec_label">Lighting System</div>\r\n<div class="spec_value">Luminescence® multi-color four-zone</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Water Features</div>\r\n<div class="spec_value">BellaFontana® with 3 illuminated arcs of water</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Control System</div>\r\n<div class="spec_value">\r\n<p>IQ 2020® with wireless remote control</p>\r\n<p>230v/50amp, 60Hz</p>\r\n<p>Includes G.F.C.I. protected sub-panel</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Heater</div>\r\n<div class="spec_value">No-Fault® , 4000w/230v</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Jet Pump 1</div>\r\n<div class="spec_value">\r\n<p>Wavemaster® 9200</p>\r\n<p>Two-Speed</p>\r\n<p>2.5 HP, continuous duty</p>\r\n<p>5.2 HP, breakdown torque</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Jet Pump 2</div>\r\n<div class="spec_value">\r\n<p>Wavemaster® 9200</p>\r\n<p>One-Speed</p>\r\n<p>2.5 HP, continuous duty</p>\r\n<p>5.2 HP, breakdown torque</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Circulation Pump</div>\r\n<div class="spec_value">SilentFlo 5000® for quiet continuous filtration</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Ozone System</div>\r\n<div class="spec_value">FreshWater® III Corona Discharge</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Water Care Options</div>\r\n<div class="spec_value">ACE® salt water sanitizing system or EverFresh® system</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Effective Filtration Area</div>\r\n<div class="spec_value">325 sq. ft., top loading Tri-X® filters; 100% no-bypass flitration</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Vinyl Cover</div>\r\n<div class="spec_value">3.5″ to 2.5″ tapered, 2 lb. density foam core with hinge seal</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Vinyl Cover Colors</div>\r\n<div class="spec_value">Caramel, Chocolate, Slate or Evergreen</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Entertainment Systems (Optional)</div>\r\n<div class="spec_value">Wireless Sound System</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Cover Lifters (Optional)</div>\r\n<div class="spec_value">CoverCradle®, CoverCradle II, Lift n’Glide® or UpRite</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Steps (Optional)</div>\r\n<div class="spec_value">Everwood HD®, NXT or Polymer</div>\r\n</div>'),
(40, 157, 0, 8, '<div class="jquery-sticky-element" id="techSpaPic">\r\n                    <div class="spec-img-wrapper">\r\n                        <img class="specs-img" src="http://watkinsdealer.s3.amazonaws.com/Hot%20Tub%20Images/Hot%20Spring%20Spas/Full%20Top%20Down%20Images/hs-highlife-grandee-nxt-ice-grey-overhead.png" alt="" height="400">\r\n                        <div class="height"><p>7'' 7"</p></div>\r\n                        <div class="width"><p>8'' 4"</p></div>\r\n                    </div>\r\n                </div>'),
(46, 76, 0, 10, '<h2>The Grandee NXT is the best in spa technology.</h2>\r\nThe Grandee NXT offers contemporary design and innovations like the exclusive wireless remote control.\r\n\r\nAs a part of the <a href="https://www.hotspring.com/shop-hot-tub-models/nxt" target="_blank" rel="noopener noreferrer">Highlife Collection NXT</a>, the Grandee NXT spa features an insulating hinge seal, 100% no-bypass filtration for cleaner water, the BellaFontana® fountain, and much more. It also offers contemporary design language and innovations like the exclusive wireless remote control.\r\n\r\nIn addition to the unparalleled performance you can count on from the Highlife Collection, the NXT models offer value-added and innovative upgrades.'),
(47, 85, 0, 10, 'Grandee ® NXT'),
(48, 154, 0, 10, '<div class="spec_box">\r\n<div class="spec_label">Seating Capacity</div>\r\n<div class="spec_value">7 Adults</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Dimensions</div>\r\n<div class="spec_value">\r\n<p>8′ 4″ x 7′ 7″ x 38″</p>\r\n<p>2.54m x 2.31m x .97m</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Water Capacity</div>\r\n<div class="spec_value">\r\n<p>450 gallons</p>\r\n<p>1,700 liters</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Weight</div>\r\n<div class="spec_value">\r\n<p>940 lbs / 425 kg (dry)</p>\r\n<p>5,920 lbs / 2,685 kg (filled)</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Jet Count</div>\r\n<div class="spec_value">43</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Hot Tub Jets</div>\r\n<div class="spec_value">\r\n<p>2 Moto-Massage® DX jets (2)</p>\r\n<p>2 SoothingStream jets</p>\r\n<p>3 JetStream jets</p>\r\n<p>2 Rotary Hydromassage jets</p>\r\n<p>2 Directional Hydromassage jets</p>\r\n<p>30 Directional Precision jets</p>\r\n</div>\r\n</div>'),
(49, 155, 0, 10, '<div class="spec_box">\r\n<div class="spec_label">Lighting System</div>\r\n<div class="spec_value">Luminescence® multi-color four-zone</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Water Features</div>\r\n<div class="spec_value">BellaFontana® with 3 illuminated arcs of water</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Control System</div>\r\n<div class="spec_value">\r\n<p>IQ 2020® with wireless remote control</p>\r\n<p>230v/50amp, 60Hz</p>\r\n<p>Includes G.F.C.I. protected sub-panel</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Heater</div>\r\n<div class="spec_value">No-Fault® , 4000w/230v</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Jet Pump 1</div>\r\n<div class="spec_value">\r\n<p>Wavemaster® 9200</p>\r\n<p>Two-Speed</p>\r\n<p>2.5 HP, continuous duty</p>\r\n<p>5.2 HP, breakdown torque</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Jet Pump 2</div>\r\n<div class="spec_value">\r\n<p>Wavemaster® 9200</p>\r\n<p>One-Speed</p>\r\n<p>2.5 HP, continuous duty</p>\r\n<p>5.2 HP, breakdown torque</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Circulation Pump</div>\r\n<div class="spec_value">SilentFlo 5000® for quiet continuous filtration</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Ozone System</div>\r\n<div class="spec_value">FreshWater® III Corona Discharge</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Water Care Options</div>\r\n<div class="spec_value">ACE® salt water sanitizing system or EverFresh® system</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Effective Filtration Area</div>\r\n<div class="spec_value">325 sq. ft., top loading Tri-X® filters; 100% no-bypass flitration</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Vinyl Cover</div>\r\n<div class="spec_value">3.5″ to 2.5″ tapered, 2 lb. density foam core with hinge seal</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Vinyl Cover Colors</div>\r\n<div class="spec_value">Caramel, Chocolate, Slate or Evergreen</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Entertainment Systems (Optional)</div>\r\n<div class="spec_value">Wireless Sound System</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Cover Lifters (Optional)</div>\r\n<div class="spec_value">CoverCradle®, CoverCradle II, Lift n’Glide® or UpRite</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Steps (Optional)</div>\r\n<div class="spec_value">Everwood HD®, NXT or Polymer</div>\r\n</div>'),
(50, 157, 0, 10, '<div class="jquery-sticky-element" id="techSpaPic">\r\n                    <div class="spec-img-wrapper">\r\n                        <img class="specs-img" src="http://watkinsdealer.s3.amazonaws.com/Hot%20Tub%20Images/Hot%20Spring%20Spas/Full%20Top%20Down%20Images/hs-highlife-grandee-nxt-ice-grey-overhead.png" alt="" height="400">\r\n                        <div class="height"><p>7'' 7"</p></div>\r\n                        <div class="width"><p>8'' 4"</p></div>\r\n                    </div>\r\n                </div>'),
(56, 76, 0, 12, '<h2>The Grandee NXT is the best in spa technology.</h2>\r\nThe Grandee NXT offers contemporary design and innovations like the exclusive wireless remote control.\r\n\r\nAs a part of the <a href="https://www.hotspring.com/shop-hot-tub-models/nxt" target="_blank" rel="noopener noreferrer">Highlife Collection NXT</a>, the Grandee NXT spa features an insulating hinge seal, 100% no-bypass filtration for cleaner water, the BellaFontana® fountain, and much more. It also offers contemporary design language and innovations like the exclusive wireless remote control.\r\n\r\nIn addition to the unparalleled performance you can count on from the Highlife Collection, the NXT models offer value-added and innovative upgrades.'),
(57, 85, 0, 12, 'Grandee ® NXT'),
(58, 154, 0, 12, '<div class="spec_box">\r\n<div class="spec_label">Seating Capacity</div>\r\n<div class="spec_value">7 Adults</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Dimensions</div>\r\n<div class="spec_value">\r\n<p>8′ 4″ x 7′ 7″ x 38″</p>\r\n<p>2.54m x 2.31m x .97m</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Water Capacity</div>\r\n<div class="spec_value">\r\n<p>450 gallons</p>\r\n<p>1,700 liters</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Weight</div>\r\n<div class="spec_value">\r\n<p>940 lbs / 425 kg (dry)</p>\r\n<p>5,920 lbs / 2,685 kg (filled)</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Jet Count</div>\r\n<div class="spec_value">43</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Hot Tub Jets</div>\r\n<div class="spec_value">\r\n<p>2 Moto-Massage® DX jets (2)</p>\r\n<p>2 SoothingStream jets</p>\r\n<p>3 JetStream jets</p>\r\n<p>2 Rotary Hydromassage jets</p>\r\n<p>2 Directional Hydromassage jets</p>\r\n<p>30 Directional Precision jets</p>\r\n</div>\r\n</div>');
INSERT INTO `catalog_product_entity_text` (`value_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES
(59, 155, 0, 12, '<div class="spec_box">\r\n<div class="spec_label">Lighting System</div>\r\n<div class="spec_value">Luminescence® multi-color four-zone</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Water Features</div>\r\n<div class="spec_value">BellaFontana® with 3 illuminated arcs of water</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Control System</div>\r\n<div class="spec_value">\r\n<p>IQ 2020® with wireless remote control</p>\r\n<p>230v/50amp, 60Hz</p>\r\n<p>Includes G.F.C.I. protected sub-panel</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Heater</div>\r\n<div class="spec_value">No-Fault® , 4000w/230v</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Jet Pump 1</div>\r\n<div class="spec_value">\r\n<p>Wavemaster® 9200</p>\r\n<p>Two-Speed</p>\r\n<p>2.5 HP, continuous duty</p>\r\n<p>5.2 HP, breakdown torque</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Jet Pump 2</div>\r\n<div class="spec_value">\r\n<p>Wavemaster® 9200</p>\r\n<p>One-Speed</p>\r\n<p>2.5 HP, continuous duty</p>\r\n<p>5.2 HP, breakdown torque</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Circulation Pump</div>\r\n<div class="spec_value">SilentFlo 5000® for quiet continuous filtration</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Ozone System</div>\r\n<div class="spec_value">FreshWater® III Corona Discharge</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Water Care Options</div>\r\n<div class="spec_value">ACE® salt water sanitizing system or EverFresh® system</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Effective Filtration Area</div>\r\n<div class="spec_value">325 sq. ft., top loading Tri-X® filters; 100% no-bypass flitration</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Vinyl Cover</div>\r\n<div class="spec_value">3.5″ to 2.5″ tapered, 2 lb. density foam core with hinge seal</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Vinyl Cover Colors</div>\r\n<div class="spec_value">Caramel, Chocolate, Slate or Evergreen</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Entertainment Systems (Optional)</div>\r\n<div class="spec_value">Wireless Sound System</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Cover Lifters (Optional)</div>\r\n<div class="spec_value">CoverCradle®, CoverCradle II, Lift n’Glide® or UpRite</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Steps (Optional)</div>\r\n<div class="spec_value">Everwood HD®, NXT or Polymer</div>\r\n</div>'),
(60, 157, 0, 12, '<div class="jquery-sticky-element" id="techSpaPic">\r\n                    <div class="spec-img-wrapper">\r\n                        <img class="specs-img" src="http://watkinsdealer.s3.amazonaws.com/Hot%20Tub%20Images/Hot%20Spring%20Spas/Full%20Top%20Down%20Images/hs-highlife-grandee-nxt-ice-grey-overhead.png" alt="" height="400">\r\n                        <div class="height"><p>7'' 7"</p></div>\r\n                        <div class="width"><p>8'' 4"</p></div>\r\n                    </div>\r\n                </div>'),
(61, 76, 0, 13, '<h2>The Grandee NXT is the best in spa technology.</h2>\r\nThe Grandee NXT offers contemporary design and innovations like the exclusive wireless remote control.\r\n\r\nAs a part of the <a href="https://www.hotspring.com/shop-hot-tub-models/nxt" target="_blank" rel="noopener noreferrer">Highlife Collection NXT</a>, the Grandee NXT spa features an insulating hinge seal, 100% no-bypass filtration for cleaner water, the BellaFontana® fountain, and much more. It also offers contemporary design language and innovations like the exclusive wireless remote control.\r\n\r\nIn addition to the unparalleled performance you can count on from the Highlife Collection, the NXT models offer value-added and innovative upgrades.'),
(62, 85, 0, 13, 'Grandee ® NXT'),
(63, 154, 0, 13, '<div class="spec_box">\r\n<div class="spec_label">Seating Capacity</div>\r\n<div class="spec_value">7 Adults</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Dimensions</div>\r\n<div class="spec_value">\r\n<p>8′ 4″ x 7′ 7″ x 38″</p>\r\n<p>2.54m x 2.31m x .97m</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Water Capacity</div>\r\n<div class="spec_value">\r\n<p>450 gallons</p>\r\n<p>1,700 liters</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Weight</div>\r\n<div class="spec_value">\r\n<p>940 lbs / 425 kg (dry)</p>\r\n<p>5,920 lbs / 2,685 kg (filled)</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Jet Count</div>\r\n<div class="spec_value">43</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Hot Tub Jets</div>\r\n<div class="spec_value">\r\n<p>2 Moto-Massage® DX jets (2)</p>\r\n<p>2 SoothingStream jets</p>\r\n<p>3 JetStream jets</p>\r\n<p>2 Rotary Hydromassage jets</p>\r\n<p>2 Directional Hydromassage jets</p>\r\n<p>30 Directional Precision jets</p>\r\n</div>\r\n</div>'),
(64, 155, 0, 13, '<div class="spec_box">\r\n<div class="spec_label">Lighting System</div>\r\n<div class="spec_value">Luminescence® multi-color four-zone</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Water Features</div>\r\n<div class="spec_value">BellaFontana® with 3 illuminated arcs of water</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Control System</div>\r\n<div class="spec_value">\r\n<p>IQ 2020® with wireless remote control</p>\r\n<p>230v/50amp, 60Hz</p>\r\n<p>Includes G.F.C.I. protected sub-panel</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Heater</div>\r\n<div class="spec_value">No-Fault® , 4000w/230v</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Jet Pump 1</div>\r\n<div class="spec_value">\r\n<p>Wavemaster® 9200</p>\r\n<p>Two-Speed</p>\r\n<p>2.5 HP, continuous duty</p>\r\n<p>5.2 HP, breakdown torque</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Jet Pump 2</div>\r\n<div class="spec_value">\r\n<p>Wavemaster® 9200</p>\r\n<p>One-Speed</p>\r\n<p>2.5 HP, continuous duty</p>\r\n<p>5.2 HP, breakdown torque</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Circulation Pump</div>\r\n<div class="spec_value">SilentFlo 5000® for quiet continuous filtration</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Ozone System</div>\r\n<div class="spec_value">FreshWater® III Corona Discharge</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Water Care Options</div>\r\n<div class="spec_value">ACE® salt water sanitizing system or EverFresh® system</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Effective Filtration Area</div>\r\n<div class="spec_value">325 sq. ft., top loading Tri-X® filters; 100% no-bypass flitration</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Vinyl Cover</div>\r\n<div class="spec_value">3.5″ to 2.5″ tapered, 2 lb. density foam core with hinge seal</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Vinyl Cover Colors</div>\r\n<div class="spec_value">Caramel, Chocolate, Slate or Evergreen</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Entertainment Systems (Optional)</div>\r\n<div class="spec_value">Wireless Sound System</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Cover Lifters (Optional)</div>\r\n<div class="spec_value">CoverCradle®, CoverCradle II, Lift n’Glide® or UpRite</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Steps (Optional)</div>\r\n<div class="spec_value">Everwood HD®, NXT or Polymer</div>\r\n</div>'),
(65, 157, 0, 13, '<div class="jquery-sticky-element" id="techSpaPic">\r\n                    <div class="spec-img-wrapper">\r\n                        <img class="specs-img" src="http://watkinsdealer.s3.amazonaws.com/Hot%20Tub%20Images/Hot%20Spring%20Spas/Full%20Top%20Down%20Images/hs-highlife-grandee-nxt-ice-grey-overhead.png" alt="" height="400">\r\n                        <div class="height"><p>7'' 7"</p></div>\r\n                        <div class="width"><p>8'' 4"</p></div>\r\n                    </div>\r\n                </div>'),
(71, 76, 0, 15, '<h2>The Grandee NXT is the best in spa technology.</h2>\r\nThe Grandee NXT offers contemporary design and innovations like the exclusive wireless remote control.\r\n\r\nAs a part of the <a href="https://www.hotspring.com/shop-hot-tub-models/nxt" target="_blank" rel="noopener noreferrer">Highlife Collection NXT</a>, the Grandee NXT spa features an insulating hinge seal, 100% no-bypass filtration for cleaner water, the BellaFontana® fountain, and much more. It also offers contemporary design language and innovations like the exclusive wireless remote control.\r\n\r\nIn addition to the unparalleled performance you can count on from the Highlife Collection, the NXT models offer value-added and innovative upgrades.'),
(72, 85, 0, 15, 'Grandee ® NXT'),
(73, 154, 0, 15, '<div class="spec_box">\r\n<div class="spec_label">Seating Capacity</div>\r\n<div class="spec_value">7 Adults</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Dimensions</div>\r\n<div class="spec_value">\r\n<p>8′ 4″ x 7′ 7″ x 38″</p>\r\n<p>2.54m x 2.31m x .97m</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Water Capacity</div>\r\n<div class="spec_value">\r\n<p>450 gallons</p>\r\n<p>1,700 liters</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Weight</div>\r\n<div class="spec_value">\r\n<p>940 lbs / 425 kg (dry)</p>\r\n<p>5,920 lbs / 2,685 kg (filled)</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Jet Count</div>\r\n<div class="spec_value">43</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Hot Tub Jets</div>\r\n<div class="spec_value">\r\n<p>2 Moto-Massage® DX jets (2)</p>\r\n<p>2 SoothingStream jets</p>\r\n<p>3 JetStream jets</p>\r\n<p>2 Rotary Hydromassage jets</p>\r\n<p>2 Directional Hydromassage jets</p>\r\n<p>30 Directional Precision jets</p>\r\n</div>\r\n</div>'),
(74, 155, 0, 15, '<div class="spec_box">\r\n<div class="spec_label">Lighting System</div>\r\n<div class="spec_value">Luminescence® multi-color four-zone</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Water Features</div>\r\n<div class="spec_value">BellaFontana® with 3 illuminated arcs of water</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Control System</div>\r\n<div class="spec_value">\r\n<p>IQ 2020® with wireless remote control</p>\r\n<p>230v/50amp, 60Hz</p>\r\n<p>Includes G.F.C.I. protected sub-panel</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Heater</div>\r\n<div class="spec_value">No-Fault® , 4000w/230v</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Jet Pump 1</div>\r\n<div class="spec_value">\r\n<p>Wavemaster® 9200</p>\r\n<p>Two-Speed</p>\r\n<p>2.5 HP, continuous duty</p>\r\n<p>5.2 HP, breakdown torque</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Jet Pump 2</div>\r\n<div class="spec_value">\r\n<p>Wavemaster® 9200</p>\r\n<p>One-Speed</p>\r\n<p>2.5 HP, continuous duty</p>\r\n<p>5.2 HP, breakdown torque</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Circulation Pump</div>\r\n<div class="spec_value">SilentFlo 5000® for quiet continuous filtration</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Ozone System</div>\r\n<div class="spec_value">FreshWater® III Corona Discharge</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Water Care Options</div>\r\n<div class="spec_value">ACE® salt water sanitizing system or EverFresh® system</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Effective Filtration Area</div>\r\n<div class="spec_value">325 sq. ft., top loading Tri-X® filters; 100% no-bypass flitration</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Vinyl Cover</div>\r\n<div class="spec_value">3.5″ to 2.5″ tapered, 2 lb. density foam core with hinge seal</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Vinyl Cover Colors</div>\r\n<div class="spec_value">Caramel, Chocolate, Slate or Evergreen</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Entertainment Systems (Optional)</div>\r\n<div class="spec_value">Wireless Sound System</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Cover Lifters (Optional)</div>\r\n<div class="spec_value">CoverCradle®, CoverCradle II, Lift n’Glide® or UpRite</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Steps (Optional)</div>\r\n<div class="spec_value">Everwood HD®, NXT or Polymer</div>\r\n</div>'),
(75, 157, 0, 15, '<div class="jquery-sticky-element" id="techSpaPic">\r\n                    <div class="spec-img-wrapper">\r\n                        <img class="specs-img" src="http://watkinsdealer.s3.amazonaws.com/Hot%20Tub%20Images/Hot%20Spring%20Spas/Full%20Top%20Down%20Images/hs-highlife-grandee-nxt-ice-grey-overhead.png" alt="" height="400">\r\n                        <div class="height"><p>7'' 7"</p></div>\r\n                        <div class="width"><p>8'' 4"</p></div>\r\n                    </div>\r\n                </div>'),
(76, 76, 0, 16, '<h2>The Grandee NXT is the best in spa technology.</h2>\r\nThe Grandee NXT offers contemporary design and innovations like the exclusive wireless remote control.\r\n\r\nAs a part of the <a href="https://www.hotspring.com/shop-hot-tub-models/nxt" target="_blank" rel="noopener noreferrer">Highlife Collection NXT</a>, the Grandee NXT spa features an insulating hinge seal, 100% no-bypass filtration for cleaner water, the BellaFontana® fountain, and much more. It also offers contemporary design language and innovations like the exclusive wireless remote control.\r\n\r\nIn addition to the unparalleled performance you can count on from the Highlife Collection, the NXT models offer value-added and innovative upgrades.'),
(77, 85, 0, 16, 'Grandee ® NXT'),
(78, 154, 0, 16, '<div class="spec_box">\r\n<div class="spec_label">Seating Capacity</div>\r\n<div class="spec_value">7 Adults</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Dimensions</div>\r\n<div class="spec_value">\r\n<p>8′ 4″ x 7′ 7″ x 38″</p>\r\n<p>2.54m x 2.31m x .97m</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Water Capacity</div>\r\n<div class="spec_value">\r\n<p>450 gallons</p>\r\n<p>1,700 liters</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Weight</div>\r\n<div class="spec_value">\r\n<p>940 lbs / 425 kg (dry)</p>\r\n<p>5,920 lbs / 2,685 kg (filled)</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Jet Count</div>\r\n<div class="spec_value">43</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Hot Tub Jets</div>\r\n<div class="spec_value">\r\n<p>2 Moto-Massage® DX jets (2)</p>\r\n<p>2 SoothingStream jets</p>\r\n<p>3 JetStream jets</p>\r\n<p>2 Rotary Hydromassage jets</p>\r\n<p>2 Directional Hydromassage jets</p>\r\n<p>30 Directional Precision jets</p>\r\n</div>\r\n</div>'),
(79, 155, 0, 16, '<div class="spec_box">\r\n<div class="spec_label">Lighting System</div>\r\n<div class="spec_value">Luminescence® multi-color four-zone</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Water Features</div>\r\n<div class="spec_value">BellaFontana® with 3 illuminated arcs of water</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Control System</div>\r\n<div class="spec_value">\r\n<p>IQ 2020® with wireless remote control</p>\r\n<p>230v/50amp, 60Hz</p>\r\n<p>Includes G.F.C.I. protected sub-panel</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Heater</div>\r\n<div class="spec_value">No-Fault® , 4000w/230v</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Jet Pump 1</div>\r\n<div class="spec_value">\r\n<p>Wavemaster® 9200</p>\r\n<p>Two-Speed</p>\r\n<p>2.5 HP, continuous duty</p>\r\n<p>5.2 HP, breakdown torque</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Jet Pump 2</div>\r\n<div class="spec_value">\r\n<p>Wavemaster® 9200</p>\r\n<p>One-Speed</p>\r\n<p>2.5 HP, continuous duty</p>\r\n<p>5.2 HP, breakdown torque</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Circulation Pump</div>\r\n<div class="spec_value">SilentFlo 5000® for quiet continuous filtration</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Ozone System</div>\r\n<div class="spec_value">FreshWater® III Corona Discharge</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Water Care Options</div>\r\n<div class="spec_value">ACE® salt water sanitizing system or EverFresh® system</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Effective Filtration Area</div>\r\n<div class="spec_value">325 sq. ft., top loading Tri-X® filters; 100% no-bypass flitration</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Vinyl Cover</div>\r\n<div class="spec_value">3.5″ to 2.5″ tapered, 2 lb. density foam core with hinge seal</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Vinyl Cover Colors</div>\r\n<div class="spec_value">Caramel, Chocolate, Slate or Evergreen</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Entertainment Systems (Optional)</div>\r\n<div class="spec_value">Wireless Sound System</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Cover Lifters (Optional)</div>\r\n<div class="spec_value">CoverCradle®, CoverCradle II, Lift n’Glide® or UpRite</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Steps (Optional)</div>\r\n<div class="spec_value">Everwood HD®, NXT or Polymer</div>\r\n</div>'),
(80, 157, 0, 16, '<div class="jquery-sticky-element" id="techSpaPic">\r\n                    <div class="spec-img-wrapper">\r\n                        <img class="specs-img" src="http://watkinsdealer.s3.amazonaws.com/Hot%20Tub%20Images/Hot%20Spring%20Spas/Full%20Top%20Down%20Images/hs-highlife-grandee-nxt-ice-grey-overhead.png" alt="" height="400">\r\n                        <div class="height"><p>7'' 7"</p></div>\r\n                        <div class="width"><p>8'' 4"</p></div>\r\n                    </div>\r\n                </div>'),
(81, 76, 0, 17, '<h2>The Grandee NXT is the best in spa technology.</h2>\r\nThe Grandee NXT offers contemporary design and innovations like the exclusive wireless remote control.\r\n\r\nAs a part of the <a href="https://www.hotspring.com/shop-hot-tub-models/nxt" target="_blank" rel="noopener noreferrer">Highlife Collection NXT</a>, the Grandee NXT spa features an insulating hinge seal, 100% no-bypass filtration for cleaner water, the BellaFontana® fountain, and much more. It also offers contemporary design language and innovations like the exclusive wireless remote control.\r\n\r\nIn addition to the unparalleled performance you can count on from the Highlife Collection, the NXT models offer value-added and innovative upgrades.'),
(82, 85, 0, 17, 'Grandee ® NXT'),
(83, 154, 0, 17, '<div class="spec_box">\r\n<div class="spec_label">Seating Capacity</div>\r\n<div class="spec_value">7 Adults</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Dimensions</div>\r\n<div class="spec_value">\r\n<p>8′ 4″ x 7′ 7″ x 38″</p>\r\n<p>2.54m x 2.31m x .97m</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Water Capacity</div>\r\n<div class="spec_value">\r\n<p>450 gallons</p>\r\n<p>1,700 liters</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Weight</div>\r\n<div class="spec_value">\r\n<p>940 lbs / 425 kg (dry)</p>\r\n<p>5,920 lbs / 2,685 kg (filled)</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Jet Count</div>\r\n<div class="spec_value">43</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Hot Tub Jets</div>\r\n<div class="spec_value">\r\n<p>2 Moto-Massage® DX jets (2)</p>\r\n<p>2 SoothingStream jets</p>\r\n<p>3 JetStream jets</p>\r\n<p>2 Rotary Hydromassage jets</p>\r\n<p>2 Directional Hydromassage jets</p>\r\n<p>30 Directional Precision jets</p>\r\n</div>\r\n</div>'),
(84, 155, 0, 17, '<div class="spec_box">\r\n<div class="spec_label">Lighting System</div>\r\n<div class="spec_value">Luminescence® multi-color four-zone</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Water Features</div>\r\n<div class="spec_value">BellaFontana® with 3 illuminated arcs of water</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Control System</div>\r\n<div class="spec_value">\r\n<p>IQ 2020® with wireless remote control</p>\r\n<p>230v/50amp, 60Hz</p>\r\n<p>Includes G.F.C.I. protected sub-panel</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Heater</div>\r\n<div class="spec_value">No-Fault® , 4000w/230v</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Jet Pump 1</div>\r\n<div class="spec_value">\r\n<p>Wavemaster® 9200</p>\r\n<p>Two-Speed</p>\r\n<p>2.5 HP, continuous duty</p>\r\n<p>5.2 HP, breakdown torque</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Jet Pump 2</div>\r\n<div class="spec_value">\r\n<p>Wavemaster® 9200</p>\r\n<p>One-Speed</p>\r\n<p>2.5 HP, continuous duty</p>\r\n<p>5.2 HP, breakdown torque</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Circulation Pump</div>\r\n<div class="spec_value">SilentFlo 5000® for quiet continuous filtration</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Ozone System</div>\r\n<div class="spec_value">FreshWater® III Corona Discharge</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Water Care Options</div>\r\n<div class="spec_value">ACE® salt water sanitizing system or EverFresh® system</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Effective Filtration Area</div>\r\n<div class="spec_value">325 sq. ft., top loading Tri-X® filters; 100% no-bypass flitration</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Vinyl Cover</div>\r\n<div class="spec_value">3.5″ to 2.5″ tapered, 2 lb. density foam core with hinge seal</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Vinyl Cover Colors</div>\r\n<div class="spec_value">Caramel, Chocolate, Slate or Evergreen</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Entertainment Systems (Optional)</div>\r\n<div class="spec_value">Wireless Sound System</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Cover Lifters (Optional)</div>\r\n<div class="spec_value">CoverCradle®, CoverCradle II, Lift n’Glide® or UpRite</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Steps (Optional)</div>\r\n<div class="spec_value">Everwood HD®, NXT or Polymer</div>\r\n</div>'),
(85, 157, 0, 17, '<div class="jquery-sticky-element" id="techSpaPic">\r\n                    <div class="spec-img-wrapper">\r\n                        <img class="specs-img" src="http://watkinsdealer.s3.amazonaws.com/Hot%20Tub%20Images/Hot%20Spring%20Spas/Full%20Top%20Down%20Images/hs-highlife-grandee-nxt-ice-grey-overhead.png" alt="" height="400">\r\n                        <div class="height"><p>7'' 7"</p></div>\r\n                        <div class="width"><p>8'' 4"</p></div>\r\n                    </div>\r\n                </div>'),
(91, 76, 0, 19, '<h2>The Grandee NXT is the best in spa technology.</h2>\r\nThe Grandee NXT offers contemporary design and innovations like the exclusive wireless remote control.\r\n\r\nAs a part of the <a href="https://www.hotspring.com/shop-hot-tub-models/nxt" target="_blank" rel="noopener noreferrer">Highlife Collection NXT</a>, the Grandee NXT spa features an insulating hinge seal, 100% no-bypass filtration for cleaner water, the BellaFontana® fountain, and much more. It also offers contemporary design language and innovations like the exclusive wireless remote control.\r\n\r\nIn addition to the unparalleled performance you can count on from the Highlife Collection, the NXT models offer value-added and innovative upgrades.'),
(92, 85, 0, 19, 'Grandee ® NXT'),
(93, 154, 0, 19, '<div class="spec_box">\r\n<div class="spec_label">Seating Capacity</div>\r\n<div class="spec_value">7 Adults</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Dimensions</div>\r\n<div class="spec_value">\r\n<p>8′ 4″ x 7′ 7″ x 38″</p>\r\n<p>2.54m x 2.31m x .97m</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Water Capacity</div>\r\n<div class="spec_value">\r\n<p>450 gallons</p>\r\n<p>1,700 liters</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Weight</div>\r\n<div class="spec_value">\r\n<p>940 lbs / 425 kg (dry)</p>\r\n<p>5,920 lbs / 2,685 kg (filled)</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Jet Count</div>\r\n<div class="spec_value">43</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Hot Tub Jets</div>\r\n<div class="spec_value">\r\n<p>2 Moto-Massage® DX jets (2)</p>\r\n<p>2 SoothingStream jets</p>\r\n<p>3 JetStream jets</p>\r\n<p>2 Rotary Hydromassage jets</p>\r\n<p>2 Directional Hydromassage jets</p>\r\n<p>30 Directional Precision jets</p>\r\n</div>\r\n</div>'),
(94, 155, 0, 19, '<div class="spec_box">\r\n<div class="spec_label">Lighting System</div>\r\n<div class="spec_value">Luminescence® multi-color four-zone</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Water Features</div>\r\n<div class="spec_value">BellaFontana® with 3 illuminated arcs of water</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Control System</div>\r\n<div class="spec_value">\r\n<p>IQ 2020® with wireless remote control</p>\r\n<p>230v/50amp, 60Hz</p>\r\n<p>Includes G.F.C.I. protected sub-panel</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Heater</div>\r\n<div class="spec_value">No-Fault® , 4000w/230v</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Jet Pump 1</div>\r\n<div class="spec_value">\r\n<p>Wavemaster® 9200</p>\r\n<p>Two-Speed</p>\r\n<p>2.5 HP, continuous duty</p>\r\n<p>5.2 HP, breakdown torque</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Jet Pump 2</div>\r\n<div class="spec_value">\r\n<p>Wavemaster® 9200</p>\r\n<p>One-Speed</p>\r\n<p>2.5 HP, continuous duty</p>\r\n<p>5.2 HP, breakdown torque</p>\r\n</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Circulation Pump</div>\r\n<div class="spec_value">SilentFlo 5000® for quiet continuous filtration</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Ozone System</div>\r\n<div class="spec_value">FreshWater® III Corona Discharge</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Water Care Options</div>\r\n<div class="spec_value">ACE® salt water sanitizing system or EverFresh® system</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Effective Filtration Area</div>\r\n<div class="spec_value">325 sq. ft., top loading Tri-X® filters; 100% no-bypass flitration</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Vinyl Cover</div>\r\n<div class="spec_value">3.5″ to 2.5″ tapered, 2 lb. density foam core with hinge seal</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Vinyl Cover Colors</div>\r\n<div class="spec_value">Caramel, Chocolate, Slate or Evergreen</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Entertainment Systems (Optional)</div>\r\n<div class="spec_value">Wireless Sound System</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Cover Lifters (Optional)</div>\r\n<div class="spec_value">CoverCradle®, CoverCradle II, Lift n’Glide® or UpRite</div>\r\n</div>\r\n<div class="spec_box">\r\n<div class="spec_label">Steps (Optional)</div>\r\n<div class="spec_value">Everwood HD®, NXT or Polymer</div>\r\n</div>'),
(95, 157, 0, 19, '<div class="jquery-sticky-element" id="techSpaPic">\r\n                    <div class="spec-img-wrapper">\r\n                        <img class="specs-img" src="http://watkinsdealer.s3.amazonaws.com/Hot%20Tub%20Images/Hot%20Spring%20Spas/Full%20Top%20Down%20Images/hs-highlife-grandee-nxt-ice-grey-overhead.png" alt="" height="400">\r\n                        <div class="height"><p>7'' 7"</p></div>\r\n                        <div class="width"><p>8'' 4"</p></div>\r\n                    </div>\r\n                </div>'),
(96, 161, 0, 19, '<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 product3001">\r\n<p class="product3002 max_width_720">The Grandee NXT Jet System offers an incredible 43 jets that relieve-tension in targeted areas including your back, neck, shoulders and calves.</p>\r\n</div>\r\n<div class="col-xs-12 col-sm-12 col-md-5 col-lg-6">\r\n<div id="jetSpaPic">\r\n<div id="plus-container" class="plus-container"><img id="design-main-img" class="jet-main-img" src="http://watkinsdealer.s3.amazonaws.com/Hot%20Tub%20Images/Hot%20Spring%20Spas/Full%20Top%20Down%20Images/hs-highlife-grandee-nxt-ice-grey-overhead.png" /> <a id="Circle_1" class="plus-icon Circle_1" style="left: 22%; top: 23%;">1</a> <a id="Circle_1" class="plus-icon Circle_1" style="left: 75%; top: 23%;">1</a> <a id="Circle_2" class="plus-icon Circle_2" style="left: 8%; top: 23%;">2</a> <a id="Circle_2" class="plus-icon Circle_2" style="left: 87%; top: 23%;">2</a> <a id="Circle_3" class="plus-icon Circle_3" style="left: 80%; top: 48%;">3</a> <a id="Circle_3" class="plus-icon Circle_3" style="left: 47%; top: 58%;">3</a> <a id="Circle_4" class="plus-icon Circle_4" style="left: 48%; top: 16%;">4</a> <a id="Circle_5" class="plus-icon Circle_5" style="left: 10%; top: 35%;">5</a> <a id="Circle_6" class="plus-icon Circle_6" style="left: 17%; top: 50%;">6</a> <a id="Circle_7" class="plus-icon Circle_7" style="left: 78%; top: 75%;">7</a></div>\r\n</div>\r\n</div>\r\n<div class="col-xs-12 col-sm-12 col-md-7 col-lg-6">\r\n<div id="jet_sys1" class="accordion jet_sys1 collapsibleContainer">\r\n<div class="acc_title active" onclick="accclk(1,7);" data-role="title"><span>1 - Moto-Massage<sup>®</sup> DX Jets</span></div>\r\n<div class="acc_content" style="display: block;" data-role="content"><video width="100%" height="100%" class="jets-video jets-video-1" src="https://watkinsdealer.s3.amazonaws.com/Videos/hot-spring/jets/Highlife-Moto-Massage-DX-jets.mp4" poster="https://watkinsdealer.s3.amazonaws.com/Videos/hot-spring/jets/cover-images/highlife-motomassage-dx-jets.jpg" preload="none" muted="" controls="controls" data-media="(min-width: 992px)"><object width="100%" height="100%" data="https://mpd3dev.magemojo.io/static/adminhtml/Magento/backend/en_US/tiny_mce/plugins/media/moxieplayer.swf" type="application/x-shockwave-flash"><param name="src" value="https://mpd3dev.magemojo.io/static/adminhtml/Magento/backend/en_US/tiny_mce/plugins/media/moxieplayer.swf" /><param name="flashvars" value="url=https%3A//watkinsdealer.s3.amazonaws.com/Videos/hot-spring/jets/Highlife-Moto-Massage-DX-jets.mp4&amp;poster=https%3A//watkinsdealer.s3.amazonaws.com/Videos/hot-spring/jets/cover-images/highlife-motomassage-dx-jets.jpg" /><param name="allowfullscreen" value="true" /><param name="allowscriptaccess" value="true" /></object></video>\r\n<p>Hot Spring Spas revolutionized spa industry with this one-of-a-kind moving jet that cascades up and down your back.</p>\r\n</div>\r\n<div class="acc_title" onclick="accclk(2,7);" data-role="title"><span>2 - Quartet<sup>®</sup> Jets</span></div>\r\n<div class="acc_content" data-role="content"><img class="acc-image w-100" src="https://watkinsdealer.s3.amazonaws.com/Hot%20Tub%20Images/Hot%20Spring%20Spas/Jets/QuartetJets.jpg" />\r\n<p>These four precision jets work in harmony to melt away tension in your neck and shoulders.</p>\r\n</div>\r\n<div class="acc_title" onclick="accclk(3,7);" data-role="title"><span>3 - Jetstream<sup>®</sup> Jets</span></div>\r\n<div class="acc_content" data-role="content"><video width="100%" height="100%" class="jets-video jets-video-3" src="https://watkinsdealer.s3.amazonaws.com/Videos/hot-spring/jets/Highlife-JetStream-jet.mp4" poster="https://watkinsdealer.s3.amazonaws.com/Videos/hot-spring/jets/cover-images/highlife-jet-stream-jet.jpg" preload="none" muted="" controls="controls"><object width="100%" height="100%" data="https://mpd3dev.magemojo.io/static/adminhtml/Magento/backend/en_US/tiny_mce/plugins/media/moxieplayer.swf" type="application/x-shockwave-flash"><param name="src" value="https://mpd3dev.magemojo.io/static/adminhtml/Magento/backend/en_US/tiny_mce/plugins/media/moxieplayer.swf" /><param name="flashvars" value="url=https%3A//watkinsdealer.s3.amazonaws.com/Videos/hot-spring/jets/Highlife-JetStream-jet.mp4&amp;poster=https%3A//watkinsdealer.s3.amazonaws.com/Videos/hot-spring/jets/cover-images/highlife-jet-stream-jet.jpg" /><param name="allowfullscreen" value="true" /><param name="allowscriptaccess" value="true" /></object></video>\r\n<p>Soothe sore and stiff lower backs with the powerful, targeted JetStream jet that’s two times as powerful as a standard hydromassage jet.</p>\r\n</div>\r\n<div class="acc_title" onclick="accclk(4,7);" data-role="title"><span>4 - Rotary HydroMassage Jet</span></div>\r\n<div class="acc_content" data-role="content"><video width="100%" height="100%" class="jets-video jets-video-4" src="https://watkinsdealer.s3.amazonaws.com/Videos/hot-spring/jets/Highlife%20Rotary%20HydroMassage.mp4" poster="https://watkinsdealer.s3.amazonaws.com/Videos/hot-spring/jets/cover-images/highlife-rotary-hydromassage.jpg" preload="none" muted="" controls="controls"><object width="100%" height="100%" data="https://mpd3dev.magemojo.io/static/adminhtml/Magento/backend/en_US/tiny_mce/plugins/media/moxieplayer.swf" type="application/x-shockwave-flash"><param name="src" value="https://mpd3dev.magemojo.io/static/adminhtml/Magento/backend/en_US/tiny_mce/plugins/media/moxieplayer.swf" /><param name="flashvars" value="url=https%3A//watkinsdealer.s3.amazonaws.com/Videos/hot-spring/jets/Highlife%2520Rotary%2520HydroMassage.mp4&amp;poster=https%3A//watkinsdealer.s3.amazonaws.com/Videos/hot-spring/jets/cover-images/highlife-rotary-hydromassage.jpg" /><param name="allowfullscreen" value="true" /><param name="allowscriptaccess" value="true" /></object></video>\r\n<p>These rotating jets create a powerful stream of moving water, providing a soothing massage that relieves tension.</p>\r\n</div>\r\n<div class="acc_title" onclick="accclk(5,7);" data-role="title"><span>5 - SoothingStreama<sup>®</sup> Jet System</span></div>\r\n<div class="acc_content" data-role="content"><video width="100%" height="100%" class="jets-video jets-video-5" src="https://watkinsdealer.s3.amazonaws.com/Videos/hot-spring/jets/Highlife%20SoothingStream.mp4" poster="https://watkinsdealer.s3.amazonaws.com/Videos/hot-spring/jets/cover-images/highlife-soothing-stream.jpg" preload="none" muted="" controls="controls"><object width="100%" height="100%" data="https://mpd3dev.magemojo.io/static/adminhtml/Magento/backend/en_US/tiny_mce/plugins/media/moxieplayer.swf" type="application/x-shockwave-flash"><param name="src" value="https://mpd3dev.magemojo.io/static/adminhtml/Magento/backend/en_US/tiny_mce/plugins/media/moxieplayer.swf" /><param name="flashvars" value="url=https%3A//watkinsdealer.s3.amazonaws.com/Videos/hot-spring/jets/Highlife%2520SoothingStream.mp4&amp;poster=https%3A//watkinsdealer.s3.amazonaws.com/Videos/hot-spring/jets/cover-images/highlife-soothing-stream.jpg" /><param name="allowfullscreen" value="true" /><param name="allowscriptaccess" value="true" /></object></video>\r\n<p>The unique SoothingStream jets have seven openings to create a powerful stream that gently relieves tension in your shoulders and upper back.</p>\r\n</div>\r\n<div class="acc_title" onclick="accclk(6,7);" data-role="title"><span>6 -Directional HydroMassage Jets</span></div>\r\n<div class="acc_content" data-role="content"><video width="100%" height="100%" class="jets-video jets-video-6" src="https://watkinsdealer.s3.amazonaws.com/Videos/hot-spring/jets/Highlife%20Directional%20HydroMassage%20jet.mp4" poster="https://watkinsdealer.s3.amazonaws.com/Videos/hot-spring/jets/cover-images/highlife-directional-hydromassage.jpg" preload="none" muted="" controls="controls"><object width="100%" height="100%" data="https://mpd3dev.magemojo.io/static/adminhtml/Magento/backend/en_US/tiny_mce/plugins/media/moxieplayer.swf" type="application/x-shockwave-flash"><param name="src" value="https://mpd3dev.magemojo.io/static/adminhtml/Magento/backend/en_US/tiny_mce/plugins/media/moxieplayer.swf" /><param name="flashvars" value="url=https%3A//watkinsdealer.s3.amazonaws.com/Videos/hot-spring/jets/Highlife%2520Directional%2520HydroMassage%2520jet.mp4&amp;poster=https%3A//watkinsdealer.s3.amazonaws.com/Videos/hot-spring/jets/cover-images/highlife-directional-hydromassage.jpg" /><param name="allowfullscreen" value="true" /><param name="allowscriptaccess" value="true" /></object></video>\r\n<p>Customize your massage — these unique jets rotate to give you soothing comfort exactly where you need it.</p>\r\n</div>\r\n<div class="acc_title" onclick="accclk(7,7);" data-role="title"><span>7 - Precision<sup>®</sup> Jet Cluster</span></div>\r\n<div class="acc_content" data-role="content"><img src="https://watkinsdealer.s3.amazonaws.com/Hot%20Tub%20Images/Hot%20Spring%20Spas/Jets/hs-precision-jet-cluster.jpg" />\r\n<p>This powerful cluster of Directional Precision® jets work together to relieve tension in your back, neck and calves.</p>\r\n</div>\r\n</div>\r\n</div>'),
(97, 85, 0, 20, 'Steps, Covers & Lifters'),
(98, 85, 0, 21, 'Steps, Covers & Lifters'),
(100, 85, 0, 22, 'Steps, Covers & Lifters'),
(102, 85, 0, 23, 'Steps, Covers & Lifters'),
(103, 76, 0, 24, 'Making it easy to climb in and out of your spa, Hot Spring spa side steps feature rich colors and a natural wood appearance. They’re designed to match your Everwood spa cabinet.'),
(104, 85, 0, 24, 'Hot Spring® 32" Polymer Spa Steps');

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_entity_tier_price`
--

CREATE TABLE IF NOT EXISTS `catalog_product_entity_tier_price` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `all_groups` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Applicable To All Customer Groups',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `qty` decimal(12,4) NOT NULL DEFAULT '1.0000' COMMENT 'QTY',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `percentage_value` decimal(5,2) DEFAULT NULL COMMENT 'Percentage value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_E8AB433B9ACB00343ABB312AD2FAB087` (`entity_id`,`all_groups`,`customer_group_id`,`qty`,`website_id`),
  KEY `CATALOG_PRODUCT_ENTITY_TIER_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOG_PRODUCT_ENTITY_TIER_PRICE_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Tier Price Attribute Backend Table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_entity_varchar`
--

CREATE TABLE IF NOT EXISTS `catalog_product_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_PRODUCT_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_ENTITY_VARCHAR_STORE_ID` (`store_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Catalog Product Varchar Attribute Backend Table' AUTO_INCREMENT=442 ;

--
-- Dumping data for table `catalog_product_entity_varchar`
--

INSERT INTO `catalog_product_entity_varchar` (`value_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES
(1, 73, 0, 1, 'Grandee <sup>®</sup> NXT-Alpine White-Mocha'),
(2, 84, 0, 1, 'Grandee ® NXT'),
(3, 86, 0, 1, 'Grandee ® NXT '),
(4, 106, 0, 1, 'container2'),
(5, 121, 0, 1, 'grandee-sup-r-sup-nxt-alpine-white-mocha'),
(6, 127, 0, 1, '0'),
(7, 145, 0, 1, '7 Person Spa'),
(8, 146, 0, 1, '8’4″ x 7’7″'),
(9, 147, 0, 1, '43 Jets'),
(10, 148, 0, 1, 'https://mpd2.myproductdata.com/download-brochure-hot-spring-spas?hottub=Hot%20Spring%20-%20Grandee%20NXT%20-%207%20Person'),
(11, 149, 0, 1, 'https://mpd2.myproductdata.com/hot-tub-financing/'),
(12, 150, 0, 1, 'https://mpd2.myproductdata.com/request-hot-tub-pricing/request-a-price-quote-hot-spring-spas?hottub=Hot%20Spring%20-%20Grandee%20NXT%20-%207%20Person'),
(13, 151, 0, 1, 'https://mpd2.myproductdata.com/hot-tub-buyers-guide/'),
(14, 152, 0, 1, 'https://mpd2.myproductdata.com/test-soak/'),
(15, 153, 0, 1, 'https://mpd2.myproductdata.com/hot-tub-trade-ins/'),
(16, 158, 0, 1, 'https://watkinsdealer.s3.amazonaws.com/Documents/Hot%20Spring%20Spas/Owner%27s%20Manuals/Past%20Hot%20Spring%20Owner%27s%20Manuals/2016-Highlife-NXT-Owners-Manual.pdf'),
(17, 159, 0, 1, 'https://watkinsdealer.s3.amazonaws.com/Documents/Hot%20Spring%20Spas/Hotspring%20Specs/Hot-Spring-Highlife-Grandee-NXT.pdf'),
(18, 73, 0, 2, 'Grandee <sup>®</sup> NXT-Alpine White-Monterey Gray'),
(19, 84, 0, 2, 'Grandee ® NXT'),
(20, 86, 0, 2, 'Grandee ® NXT '),
(21, 106, 0, 2, 'container2'),
(22, 121, 0, 2, 'grandee-sup-r-sup-nxt-alpine-white-monterey-gray'),
(23, 127, 0, 2, '0'),
(24, 145, 0, 2, '7 Person Spa'),
(25, 146, 0, 2, '8’4″ x 7’7″'),
(26, 147, 0, 2, '43 Jets'),
(27, 148, 0, 2, 'https://mpd2.myproductdata.com/download-brochure-hot-spring-spas?hottub=Hot%20Spring%20-%20Grandee%20NXT%20-%207%20Person'),
(28, 149, 0, 2, 'https://mpd2.myproductdata.com/hot-tub-financing/'),
(29, 150, 0, 2, 'https://mpd2.myproductdata.com/request-hot-tub-pricing/request-a-price-quote-hot-spring-spas?hottub=Hot%20Spring%20-%20Grandee%20NXT%20-%207%20Person'),
(30, 151, 0, 2, 'https://mpd2.myproductdata.com/hot-tub-buyers-guide/'),
(31, 152, 0, 2, 'https://mpd2.myproductdata.com/test-soak/'),
(32, 153, 0, 2, 'https://mpd2.myproductdata.com/hot-tub-trade-ins/'),
(33, 158, 0, 2, 'https://watkinsdealer.s3.amazonaws.com/Documents/Hot%20Spring%20Spas/Owner%27s%20Manuals/Past%20Hot%20Spring%20Owner%27s%20Manuals/2016-Highlife-NXT-Owners-Manual.pdf'),
(34, 159, 0, 2, 'https://watkinsdealer.s3.amazonaws.com/Documents/Hot%20Spring%20Spas/Hotspring%20Specs/Hot-Spring-Highlife-Grandee-NXT.pdf'),
(35, 73, 0, 3, 'Grandee <sup>®</sup> NXT-Alpine White-Teak'),
(36, 84, 0, 3, 'Grandee ® NXT'),
(37, 86, 0, 3, 'Grandee ® NXT '),
(38, 106, 0, 3, 'container2'),
(39, 121, 0, 3, 'grandee-sup-r-sup-nxt-alpine-white-teak'),
(40, 127, 0, 3, '0'),
(41, 145, 0, 3, '7 Person Spa'),
(42, 146, 0, 3, '8’4″ x 7’7″'),
(43, 147, 0, 3, '43 Jets'),
(44, 148, 0, 3, 'https://mpd2.myproductdata.com/download-brochure-hot-spring-spas?hottub=Hot%20Spring%20-%20Grandee%20NXT%20-%207%20Person'),
(45, 149, 0, 3, 'https://mpd2.myproductdata.com/hot-tub-financing/'),
(46, 150, 0, 3, 'https://mpd2.myproductdata.com/request-hot-tub-pricing/request-a-price-quote-hot-spring-spas?hottub=Hot%20Spring%20-%20Grandee%20NXT%20-%207%20Person'),
(47, 151, 0, 3, 'https://mpd2.myproductdata.com/hot-tub-buyers-guide/'),
(48, 152, 0, 3, 'https://mpd2.myproductdata.com/test-soak/'),
(49, 153, 0, 3, 'https://mpd2.myproductdata.com/hot-tub-trade-ins/'),
(50, 158, 0, 3, 'https://watkinsdealer.s3.amazonaws.com/Documents/Hot%20Spring%20Spas/Owner%27s%20Manuals/Past%20Hot%20Spring%20Owner%27s%20Manuals/2016-Highlife-NXT-Owners-Manual.pdf'),
(51, 159, 0, 3, 'https://watkinsdealer.s3.amazonaws.com/Documents/Hot%20Spring%20Spas/Hotspring%20Specs/Hot-Spring-Highlife-Grandee-NXT.pdf'),
(52, 73, 0, 4, 'Grandee <sup>®</sup> NXT-Tuscan Sun-Mocha'),
(53, 84, 0, 4, 'Grandee ® NXT'),
(54, 86, 0, 4, 'Grandee ® NXT '),
(55, 106, 0, 4, 'container2'),
(56, 121, 0, 4, 'grandee-sup-r-sup-nxt-tuscan-sun-mocha'),
(57, 127, 0, 4, '0'),
(58, 145, 0, 4, '7 Person Spa'),
(59, 146, 0, 4, '8’4″ x 7’7″'),
(60, 147, 0, 4, '43 Jets'),
(61, 148, 0, 4, 'https://mpd2.myproductdata.com/download-brochure-hot-spring-spas?hottub=Hot%20Spring%20-%20Grandee%20NXT%20-%207%20Person'),
(62, 149, 0, 4, 'https://mpd2.myproductdata.com/hot-tub-financing/'),
(63, 150, 0, 4, 'https://mpd2.myproductdata.com/request-hot-tub-pricing/request-a-price-quote-hot-spring-spas?hottub=Hot%20Spring%20-%20Grandee%20NXT%20-%207%20Person'),
(64, 151, 0, 4, 'https://mpd2.myproductdata.com/hot-tub-buyers-guide/'),
(65, 152, 0, 4, 'https://mpd2.myproductdata.com/test-soak/'),
(66, 153, 0, 4, 'https://mpd2.myproductdata.com/hot-tub-trade-ins/'),
(67, 158, 0, 4, 'https://watkinsdealer.s3.amazonaws.com/Documents/Hot%20Spring%20Spas/Owner%27s%20Manuals/Past%20Hot%20Spring%20Owner%27s%20Manuals/2016-Highlife-NXT-Owners-Manual.pdf'),
(68, 159, 0, 4, 'https://watkinsdealer.s3.amazonaws.com/Documents/Hot%20Spring%20Spas/Hotspring%20Specs/Hot-Spring-Highlife-Grandee-NXT.pdf'),
(69, 73, 0, 5, 'Grandee <sup>®</sup> NXT-Tuscan Sun-Monterey Gray'),
(70, 84, 0, 5, 'Grandee ® NXT'),
(71, 86, 0, 5, 'Grandee ® NXT '),
(72, 106, 0, 5, 'container2'),
(73, 121, 0, 5, 'grandee-sup-r-sup-nxt-tuscan-sun-monterey-gray'),
(74, 127, 0, 5, '0'),
(75, 145, 0, 5, '7 Person Spa'),
(76, 146, 0, 5, '8’4″ x 7’7″'),
(77, 147, 0, 5, '43 Jets'),
(78, 148, 0, 5, 'https://mpd2.myproductdata.com/download-brochure-hot-spring-spas?hottub=Hot%20Spring%20-%20Grandee%20NXT%20-%207%20Person'),
(79, 149, 0, 5, 'https://mpd2.myproductdata.com/hot-tub-financing/'),
(80, 150, 0, 5, 'https://mpd2.myproductdata.com/request-hot-tub-pricing/request-a-price-quote-hot-spring-spas?hottub=Hot%20Spring%20-%20Grandee%20NXT%20-%207%20Person'),
(81, 151, 0, 5, 'https://mpd2.myproductdata.com/hot-tub-buyers-guide/'),
(82, 152, 0, 5, 'https://mpd2.myproductdata.com/test-soak/'),
(83, 153, 0, 5, 'https://mpd2.myproductdata.com/hot-tub-trade-ins/'),
(84, 158, 0, 5, 'https://watkinsdealer.s3.amazonaws.com/Documents/Hot%20Spring%20Spas/Owner%27s%20Manuals/Past%20Hot%20Spring%20Owner%27s%20Manuals/2016-Highlife-NXT-Owners-Manual.pdf'),
(85, 159, 0, 5, 'https://watkinsdealer.s3.amazonaws.com/Documents/Hot%20Spring%20Spas/Hotspring%20Specs/Hot-Spring-Highlife-Grandee-NXT.pdf'),
(86, 73, 0, 6, 'Grandee <sup>®</sup> NXT-Tuscan Sun-Teak'),
(87, 84, 0, 6, 'Grandee ® NXT'),
(88, 86, 0, 6, 'Grandee ® NXT '),
(89, 106, 0, 6, 'container2'),
(90, 121, 0, 6, 'grandee-sup-r-sup-nxt-tuscan-sun-teak'),
(91, 127, 0, 6, '0'),
(92, 145, 0, 6, '7 Person Spa'),
(93, 146, 0, 6, '8’4″ x 7’7″'),
(94, 147, 0, 6, '43 Jets'),
(95, 148, 0, 6, 'https://mpd2.myproductdata.com/download-brochure-hot-spring-spas?hottub=Hot%20Spring%20-%20Grandee%20NXT%20-%207%20Person'),
(96, 149, 0, 6, 'https://mpd2.myproductdata.com/hot-tub-financing/'),
(97, 150, 0, 6, 'https://mpd2.myproductdata.com/request-hot-tub-pricing/request-a-price-quote-hot-spring-spas?hottub=Hot%20Spring%20-%20Grandee%20NXT%20-%207%20Person'),
(98, 151, 0, 6, 'https://mpd2.myproductdata.com/hot-tub-buyers-guide/'),
(99, 152, 0, 6, 'https://mpd2.myproductdata.com/test-soak/'),
(100, 153, 0, 6, 'https://mpd2.myproductdata.com/hot-tub-trade-ins/'),
(101, 158, 0, 6, 'https://watkinsdealer.s3.amazonaws.com/Documents/Hot%20Spring%20Spas/Owner%27s%20Manuals/Past%20Hot%20Spring%20Owner%27s%20Manuals/2016-Highlife-NXT-Owners-Manual.pdf'),
(102, 159, 0, 6, 'https://watkinsdealer.s3.amazonaws.com/Documents/Hot%20Spring%20Spas/Hotspring%20Specs/Hot-Spring-Highlife-Grandee-NXT.pdf'),
(103, 73, 0, 7, 'Grandee <sup>®</sup> NXT-Ice Gray-Mocha'),
(104, 84, 0, 7, 'Grandee ® NXT'),
(105, 86, 0, 7, 'Grandee ® NXT '),
(106, 106, 0, 7, 'container2'),
(107, 121, 0, 7, 'grandee-sup-r-sup-nxt-ice-gray-mocha'),
(108, 127, 0, 7, '0'),
(109, 145, 0, 7, '7 Person Spa'),
(110, 146, 0, 7, '8’4″ x 7’7″'),
(111, 147, 0, 7, '43 Jets'),
(112, 148, 0, 7, 'https://mpd2.myproductdata.com/download-brochure-hot-spring-spas?hottub=Hot%20Spring%20-%20Grandee%20NXT%20-%207%20Person'),
(113, 149, 0, 7, 'https://mpd2.myproductdata.com/hot-tub-financing/'),
(114, 150, 0, 7, 'https://mpd2.myproductdata.com/request-hot-tub-pricing/request-a-price-quote-hot-spring-spas?hottub=Hot%20Spring%20-%20Grandee%20NXT%20-%207%20Person'),
(115, 151, 0, 7, 'https://mpd2.myproductdata.com/hot-tub-buyers-guide/'),
(116, 152, 0, 7, 'https://mpd2.myproductdata.com/test-soak/'),
(117, 153, 0, 7, 'https://mpd2.myproductdata.com/hot-tub-trade-ins/'),
(118, 158, 0, 7, 'https://watkinsdealer.s3.amazonaws.com/Documents/Hot%20Spring%20Spas/Owner%27s%20Manuals/Past%20Hot%20Spring%20Owner%27s%20Manuals/2016-Highlife-NXT-Owners-Manual.pdf'),
(119, 159, 0, 7, 'https://watkinsdealer.s3.amazonaws.com/Documents/Hot%20Spring%20Spas/Hotspring%20Specs/Hot-Spring-Highlife-Grandee-NXT.pdf'),
(120, 73, 0, 8, 'Grandee <sup>®</sup> NXT-Ice Gray-Monterey Gray'),
(121, 84, 0, 8, 'Grandee ® NXT'),
(122, 86, 0, 8, 'Grandee ® NXT '),
(123, 106, 0, 8, 'container2'),
(124, 121, 0, 8, 'grandee-sup-r-sup-nxt-ice-gray-monterey-gray'),
(125, 127, 0, 8, '0'),
(126, 145, 0, 8, '7 Person Spa'),
(127, 146, 0, 8, '8’4″ x 7’7″'),
(128, 147, 0, 8, '43 Jets'),
(129, 148, 0, 8, 'https://mpd2.myproductdata.com/download-brochure-hot-spring-spas?hottub=Hot%20Spring%20-%20Grandee%20NXT%20-%207%20Person'),
(130, 149, 0, 8, 'https://mpd2.myproductdata.com/hot-tub-financing/'),
(131, 150, 0, 8, 'https://mpd2.myproductdata.com/request-hot-tub-pricing/request-a-price-quote-hot-spring-spas?hottub=Hot%20Spring%20-%20Grandee%20NXT%20-%207%20Person'),
(132, 151, 0, 8, 'https://mpd2.myproductdata.com/hot-tub-buyers-guide/'),
(133, 152, 0, 8, 'https://mpd2.myproductdata.com/test-soak/'),
(134, 153, 0, 8, 'https://mpd2.myproductdata.com/hot-tub-trade-ins/'),
(135, 158, 0, 8, 'https://watkinsdealer.s3.amazonaws.com/Documents/Hot%20Spring%20Spas/Owner%27s%20Manuals/Past%20Hot%20Spring%20Owner%27s%20Manuals/2016-Highlife-NXT-Owners-Manual.pdf'),
(136, 159, 0, 8, 'https://watkinsdealer.s3.amazonaws.com/Documents/Hot%20Spring%20Spas/Hotspring%20Specs/Hot-Spring-Highlife-Grandee-NXT.pdf'),
(154, 73, 0, 10, 'Grandee <sup>®</sup> NXT-Crème-Mocha'),
(155, 84, 0, 10, 'Grandee ® NXT'),
(156, 86, 0, 10, 'Grandee ® NXT '),
(157, 106, 0, 10, 'container2'),
(158, 121, 0, 10, 'grandee-sup-r-sup-nxt-creme-mocha'),
(159, 127, 0, 10, '0'),
(160, 145, 0, 10, '7 Person Spa'),
(161, 146, 0, 10, '8’4″ x 7’7″'),
(162, 147, 0, 10, '43 Jets'),
(163, 148, 0, 10, 'https://mpd2.myproductdata.com/download-brochure-hot-spring-spas?hottub=Hot%20Spring%20-%20Grandee%20NXT%20-%207%20Person'),
(164, 149, 0, 10, 'https://mpd2.myproductdata.com/hot-tub-financing/'),
(165, 150, 0, 10, 'https://mpd2.myproductdata.com/request-hot-tub-pricing/request-a-price-quote-hot-spring-spas?hottub=Hot%20Spring%20-%20Grandee%20NXT%20-%207%20Person'),
(166, 151, 0, 10, 'https://mpd2.myproductdata.com/hot-tub-buyers-guide/'),
(167, 152, 0, 10, 'https://mpd2.myproductdata.com/test-soak/'),
(168, 153, 0, 10, 'https://mpd2.myproductdata.com/hot-tub-trade-ins/'),
(169, 158, 0, 10, 'https://watkinsdealer.s3.amazonaws.com/Documents/Hot%20Spring%20Spas/Owner%27s%20Manuals/Past%20Hot%20Spring%20Owner%27s%20Manuals/2016-Highlife-NXT-Owners-Manual.pdf'),
(170, 159, 0, 10, 'https://watkinsdealer.s3.amazonaws.com/Documents/Hot%20Spring%20Spas/Hotspring%20Specs/Hot-Spring-Highlife-Grandee-NXT.pdf'),
(188, 73, 0, 12, 'Grandee <sup>®</sup> NXT-Crème-Teak'),
(189, 84, 0, 12, 'Grandee ® NXT'),
(190, 86, 0, 12, 'Grandee ® NXT '),
(191, 106, 0, 12, 'container2'),
(192, 121, 0, 12, 'grandee-sup-r-sup-nxt-creme-teak'),
(193, 127, 0, 12, '0'),
(194, 145, 0, 12, '7 Person Spa'),
(195, 146, 0, 12, '8’4″ x 7’7″'),
(196, 147, 0, 12, '43 Jets'),
(197, 148, 0, 12, 'https://mpd2.myproductdata.com/download-brochure-hot-spring-spas?hottub=Hot%20Spring%20-%20Grandee%20NXT%20-%207%20Person'),
(198, 149, 0, 12, 'https://mpd2.myproductdata.com/hot-tub-financing/'),
(199, 150, 0, 12, 'https://mpd2.myproductdata.com/request-hot-tub-pricing/request-a-price-quote-hot-spring-spas?hottub=Hot%20Spring%20-%20Grandee%20NXT%20-%207%20Person'),
(200, 151, 0, 12, 'https://mpd2.myproductdata.com/hot-tub-buyers-guide/'),
(201, 152, 0, 12, 'https://mpd2.myproductdata.com/test-soak/'),
(202, 153, 0, 12, 'https://mpd2.myproductdata.com/hot-tub-trade-ins/'),
(203, 158, 0, 12, 'https://watkinsdealer.s3.amazonaws.com/Documents/Hot%20Spring%20Spas/Owner%27s%20Manuals/Past%20Hot%20Spring%20Owner%27s%20Manuals/2016-Highlife-NXT-Owners-Manual.pdf'),
(204, 159, 0, 12, 'https://watkinsdealer.s3.amazonaws.com/Documents/Hot%20Spring%20Spas/Hotspring%20Specs/Hot-Spring-Highlife-Grandee-NXT.pdf'),
(205, 73, 0, 13, 'Grandee <sup>®</sup> NXT-Desert-Mocha'),
(206, 84, 0, 13, 'Grandee ® NXT'),
(207, 86, 0, 13, 'Grandee ® NXT '),
(208, 106, 0, 13, 'container2'),
(209, 121, 0, 13, 'grandee-sup-r-sup-nxt-desert-mocha'),
(210, 127, 0, 13, '0'),
(211, 145, 0, 13, '7 Person Spa'),
(212, 146, 0, 13, '8’4″ x 7’7″'),
(213, 147, 0, 13, '43 Jets'),
(214, 148, 0, 13, 'https://mpd2.myproductdata.com/download-brochure-hot-spring-spas?hottub=Hot%20Spring%20-%20Grandee%20NXT%20-%207%20Person'),
(215, 149, 0, 13, 'https://mpd2.myproductdata.com/hot-tub-financing/'),
(216, 150, 0, 13, 'https://mpd2.myproductdata.com/request-hot-tub-pricing/request-a-price-quote-hot-spring-spas?hottub=Hot%20Spring%20-%20Grandee%20NXT%20-%207%20Person'),
(217, 151, 0, 13, 'https://mpd2.myproductdata.com/hot-tub-buyers-guide/'),
(218, 152, 0, 13, 'https://mpd2.myproductdata.com/test-soak/'),
(219, 153, 0, 13, 'https://mpd2.myproductdata.com/hot-tub-trade-ins/'),
(220, 158, 0, 13, 'https://watkinsdealer.s3.amazonaws.com/Documents/Hot%20Spring%20Spas/Owner%27s%20Manuals/Past%20Hot%20Spring%20Owner%27s%20Manuals/2016-Highlife-NXT-Owners-Manual.pdf'),
(221, 159, 0, 13, 'https://watkinsdealer.s3.amazonaws.com/Documents/Hot%20Spring%20Spas/Hotspring%20Specs/Hot-Spring-Highlife-Grandee-NXT.pdf'),
(239, 73, 0, 15, 'Grandee <sup>®</sup> NXT-Desert-Teak'),
(240, 84, 0, 15, 'Grandee ® NXT'),
(241, 86, 0, 15, 'Grandee ® NXT '),
(242, 106, 0, 15, 'container2'),
(243, 121, 0, 15, 'grandee-sup-r-sup-nxt-desert-teak'),
(244, 127, 0, 15, '0'),
(245, 145, 0, 15, '7 Person Spa'),
(246, 146, 0, 15, '8’4″ x 7’7″'),
(247, 147, 0, 15, '43 Jets'),
(248, 148, 0, 15, 'https://mpd2.myproductdata.com/download-brochure-hot-spring-spas?hottub=Hot%20Spring%20-%20Grandee%20NXT%20-%207%20Person'),
(249, 149, 0, 15, 'https://mpd2.myproductdata.com/hot-tub-financing/'),
(250, 150, 0, 15, 'https://mpd2.myproductdata.com/request-hot-tub-pricing/request-a-price-quote-hot-spring-spas?hottub=Hot%20Spring%20-%20Grandee%20NXT%20-%207%20Person'),
(251, 151, 0, 15, 'https://mpd2.myproductdata.com/hot-tub-buyers-guide/'),
(252, 152, 0, 15, 'https://mpd2.myproductdata.com/test-soak/'),
(253, 153, 0, 15, 'https://mpd2.myproductdata.com/hot-tub-trade-ins/'),
(254, 158, 0, 15, 'https://watkinsdealer.s3.amazonaws.com/Documents/Hot%20Spring%20Spas/Owner%27s%20Manuals/Past%20Hot%20Spring%20Owner%27s%20Manuals/2016-Highlife-NXT-Owners-Manual.pdf'),
(255, 159, 0, 15, 'https://watkinsdealer.s3.amazonaws.com/Documents/Hot%20Spring%20Spas/Hotspring%20Specs/Hot-Spring-Highlife-Grandee-NXT.pdf'),
(256, 73, 0, 16, 'Grandee <sup>®</sup> NXT-Platinum-Mocha'),
(257, 84, 0, 16, 'Grandee ® NXT'),
(258, 86, 0, 16, 'Grandee ® NXT '),
(259, 106, 0, 16, 'container2'),
(260, 121, 0, 16, 'grandee-sup-r-sup-nxt-platinum-mocha'),
(261, 127, 0, 16, '0'),
(262, 145, 0, 16, '7 Person Spa'),
(263, 146, 0, 16, '8’4″ x 7’7″'),
(264, 147, 0, 16, '43 Jets'),
(265, 148, 0, 16, 'https://mpd2.myproductdata.com/download-brochure-hot-spring-spas?hottub=Hot%20Spring%20-%20Grandee%20NXT%20-%207%20Person'),
(266, 149, 0, 16, 'https://mpd2.myproductdata.com/hot-tub-financing/'),
(267, 150, 0, 16, 'https://mpd2.myproductdata.com/request-hot-tub-pricing/request-a-price-quote-hot-spring-spas?hottub=Hot%20Spring%20-%20Grandee%20NXT%20-%207%20Person'),
(268, 151, 0, 16, 'https://mpd2.myproductdata.com/hot-tub-buyers-guide/'),
(269, 152, 0, 16, 'https://mpd2.myproductdata.com/test-soak/'),
(270, 153, 0, 16, 'https://mpd2.myproductdata.com/hot-tub-trade-ins/'),
(271, 158, 0, 16, 'https://watkinsdealer.s3.amazonaws.com/Documents/Hot%20Spring%20Spas/Owner%27s%20Manuals/Past%20Hot%20Spring%20Owner%27s%20Manuals/2016-Highlife-NXT-Owners-Manual.pdf'),
(272, 159, 0, 16, 'https://watkinsdealer.s3.amazonaws.com/Documents/Hot%20Spring%20Spas/Hotspring%20Specs/Hot-Spring-Highlife-Grandee-NXT.pdf'),
(273, 73, 0, 17, 'Grandee <sup>®</sup> NXT-Platinum-Monterey Gray'),
(274, 84, 0, 17, 'Grandee ® NXT'),
(275, 86, 0, 17, 'Grandee ® NXT '),
(276, 106, 0, 17, 'container2'),
(277, 121, 0, 17, 'grandee-sup-r-sup-nxt-platinum-monterey-gray'),
(278, 127, 0, 17, '0'),
(279, 145, 0, 17, '7 Person Spa'),
(280, 146, 0, 17, '8’4″ x 7’7″'),
(281, 147, 0, 17, '43 Jets'),
(282, 148, 0, 17, 'https://mpd2.myproductdata.com/download-brochure-hot-spring-spas?hottub=Hot%20Spring%20-%20Grandee%20NXT%20-%207%20Person'),
(283, 149, 0, 17, 'https://mpd2.myproductdata.com/hot-tub-financing/'),
(284, 150, 0, 17, 'https://mpd2.myproductdata.com/request-hot-tub-pricing/request-a-price-quote-hot-spring-spas?hottub=Hot%20Spring%20-%20Grandee%20NXT%20-%207%20Person'),
(285, 151, 0, 17, 'https://mpd2.myproductdata.com/hot-tub-buyers-guide/'),
(286, 152, 0, 17, 'https://mpd2.myproductdata.com/test-soak/'),
(287, 153, 0, 17, 'https://mpd2.myproductdata.com/hot-tub-trade-ins/'),
(288, 158, 0, 17, 'https://watkinsdealer.s3.amazonaws.com/Documents/Hot%20Spring%20Spas/Owner%27s%20Manuals/Past%20Hot%20Spring%20Owner%27s%20Manuals/2016-Highlife-NXT-Owners-Manual.pdf'),
(289, 159, 0, 17, 'https://watkinsdealer.s3.amazonaws.com/Documents/Hot%20Spring%20Spas/Hotspring%20Specs/Hot-Spring-Highlife-Grandee-NXT.pdf'),
(307, 73, 0, 19, 'Grandee <sup>®</sup> NXT'),
(308, 84, 0, 19, 'Grandee ® NXT'),
(309, 86, 0, 19, 'Grandee ® NXT '),
(310, 106, 0, 19, 'container2'),
(311, 121, 0, 19, 'grandee-sup-r-sup-nxt'),
(312, 127, 0, 19, '2'),
(313, 145, 0, 19, '7 Person Spa'),
(314, 146, 0, 19, '8’4″ x 7’7″'),
(315, 147, 0, 19, '43 Jets'),
(316, 148, 0, 19, 'https://mpd2.myproductdata.com/download-brochure-hot-spring-spas?hottub=Hot%20Spring%20-%20Grandee%20NXT%20-%207%20Person'),
(317, 149, 0, 19, 'https://mpd2.myproductdata.com/hot-tub-financing/'),
(318, 150, 0, 19, 'https://mpd2.myproductdata.com/request-hot-tub-pricing/request-a-price-quote-hot-spring-spas?hottub=Hot%20Spring%20-%20Grandee%20NXT%20-%207%20Person'),
(319, 151, 0, 19, 'https://mpd2.myproductdata.com/hot-tub-buyers-guide/'),
(320, 152, 0, 19, 'https://mpd2.myproductdata.com/test-soak/'),
(321, 153, 0, 19, 'https://mpd2.myproductdata.com/hot-tub-trade-ins/'),
(322, 158, 0, 19, 'https://watkinsdealer.s3.amazonaws.com/Documents/Hot%20Spring%20Spas/Owner%27s%20Manuals/Past%20Hot%20Spring%20Owner%27s%20Manuals/2016-Highlife-NXT-Owners-Manual.pdf'),
(323, 159, 0, 19, 'https://watkinsdealer.s3.amazonaws.com/Documents/Hot%20Spring%20Spas/Hotspring%20Specs/Hot-Spring-Highlife-Grandee-NXT.pdf'),
(324, 138, 0, 19, 'https://watkinsdealer.s3.amazonaws.com/hot-tubs-360/hot-spring-spas/highlife-nxt/grandee-nxt/img/spa-sprite.jpg'),
(325, 140, 0, 19, 'https://watkinsdealer.s3.amazonaws.com/branding/icons/hot-spring-mark.png'),
(326, 160, 0, 19, 'http://watkinsdealer.s3.amazonaws.com/Hot%20Tub%20Images/Hot%20Spring%20Spas/Full%20Top%20Down%20Images/hs-highlife-grandee-nxt-ice-grey-overhead.png'),
(327, 162, 0, 19, '7 Person Hot Tub'),
(328, 163, 0, 19, 'https://watkinsdealer.s3.amazonaws.com/Documents/Hot%20Spring%20Spas/Warranties/Highlife-NXT-Warranty.pdf'),
(329, 73, 0, 20, 'Steps, Covers & Lifters'),
(330, 84, 0, 20, 'Steps, Covers & Lifters'),
(331, 86, 0, 20, 'Steps, Covers & Lifters '),
(332, 106, 0, 20, 'container2'),
(333, 121, 0, 20, 'steps-covers-lifters'),
(334, 127, 0, 20, '2'),
(335, 73, 0, 21, 'Hot Tub Water Care'),
(336, 84, 0, 21, 'Steps, Covers & Lifters'),
(337, 86, 0, 21, 'Steps, Covers & Lifters '),
(338, 106, 0, 21, 'container2'),
(339, 121, 0, 21, 'steps-covers-lifters-1'),
(340, 127, 0, 21, '2'),
(342, 73, 0, 22, 'Hot Tub Innovation'),
(343, 84, 0, 22, 'Steps, Covers & Lifters'),
(344, 86, 0, 22, 'Steps, Covers & Lifters '),
(345, 106, 0, 22, 'container2'),
(346, 121, 0, 22, 'steps-covers-lifters-2'),
(347, 127, 0, 22, '2'),
(349, 73, 0, 23, 'Hot Tub Enjoyment'),
(350, 84, 0, 23, 'Steps, Covers & Lifters'),
(351, 86, 0, 23, 'Steps, Covers & Lifters '),
(352, 106, 0, 23, 'container2'),
(353, 121, 0, 23, 'steps-covers-lifters-3'),
(354, 127, 0, 23, '2'),
(356, 87, 0, 19, 'no_selection'),
(357, 88, 0, 19, 'no_selection'),
(358, 89, 0, 19, 'no_selection'),
(359, 165, 0, 19, '/1/9/1900x550-a-spot-jet-system-grandee-nxt.jpg'),
(364, 104, 0, 19, NULL),
(369, 142, 0, 1, 'https://csp-hotspringspas.s3.amazonaws.com/products/highlife-nxt/grandee-nxt/highlife-nxt-grandee-nxt-cabinet-mocha.png'),
(370, 144, 0, 1, 'https://csp-hotspringspas.s3.amazonaws.com/products/highlife-nxt/grandee-nxt/highlife-nxt-grandee-nxt-shell-alpine-white.png'),
(371, 142, 0, 2, 'https://csp-hotspringspas.s3.amazonaws.com/products/highlife-nxt/grandee-nxt/highlife-nxt-grandee-nxt-cabinet-monterey-gray.png'),
(372, 144, 0, 2, 'https://csp-hotspringspas.s3.amazonaws.com/products/highlife-nxt/grandee-nxt/highlife-nxt-grandee-nxt-shell-alpine-white.png'),
(373, 142, 0, 10, 'https://csp-hotspringspas.s3.amazonaws.com/products/highlife-nxt/grandee-nxt/highlife-nxt-grandee-nxt-cabinet-mocha.png'),
(374, 144, 0, 10, 'https://csp-hotspringspas.s3.amazonaws.com/products/highlife-nxt/grandee-nxt/highlife-nxt-grandee-nxt-shell-creme.png'),
(375, 142, 0, 13, 'https://csp-hotspringspas.s3.amazonaws.com/products/highlife-nxt/grandee-nxt/highlife-nxt-grandee-nxt-cabinet-mocha.png'),
(376, 144, 0, 13, 'https://csp-hotspringspas.s3.amazonaws.com/products/highlife-nxt/grandee-nxt/highlife-nxt-grandee-nxt-shell-desert.png'),
(377, 142, 0, 16, 'https://csp-hotspringspas.s3.amazonaws.com/products/highlife-nxt/grandee-nxt/highlife-nxt-grandee-nxt-cabinet-mocha.png'),
(378, 144, 0, 16, 'https://csp-hotspringspas.s3.amazonaws.com/products/highlife-nxt/grandee-nxt/highlife-nxt-grandee-nxt-shell-platinum.png'),
(379, 142, 0, 4, 'https://csp-hotspringspas.s3.amazonaws.com/products/highlife-nxt/grandee-nxt/highlife-nxt-grandee-nxt-cabinet-mocha.png'),
(380, 144, 0, 4, 'https://csp-hotspringspas.s3.amazonaws.com/products/highlife-nxt/grandee-nxt/highlife-nxt-grandee-nxt-shell-tuscan-sun.png'),
(381, 142, 0, 7, 'https://csp-hotspringspas.s3.amazonaws.com/products/highlife-nxt/grandee-nxt/highlife-nxt-grandee-nxt-cabinet-mocha.png'),
(382, 144, 0, 7, 'https://csp-hotspringspas.s3.amazonaws.com/products/highlife-nxt/grandee-nxt/highlife-nxt-grandee-nxt-shell-ice-gray.png'),
(383, 142, 0, 8, 'https://csp-hotspringspas.s3.amazonaws.com/products/highlife-nxt/grandee-nxt/highlife-nxt-grandee-nxt-cabinet-monterey-gray.png'),
(384, 144, 0, 8, 'https://csp-hotspringspas.s3.amazonaws.com/products/highlife-nxt/grandee-nxt/highlife-nxt-grandee-nxt-shell-ice-gray.png'),
(385, 142, 0, 5, 'https://csp-hotspringspas.s3.amazonaws.com/products/highlife-nxt/grandee-nxt/highlife-nxt-grandee-nxt-cabinet-monterey-gray.png'),
(386, 144, 0, 5, 'https://csp-hotspringspas.s3.amazonaws.com/products/highlife-nxt/grandee-nxt/highlife-nxt-grandee-nxt-shell-tuscan-sun.png'),
(387, 142, 0, 17, 'https://csp-hotspringspas.s3.amazonaws.com/products/highlife-nxt/grandee-nxt/highlife-nxt-grandee-nxt-cabinet-monterey-gray.png'),
(388, 144, 0, 17, 'https://csp-hotspringspas.s3.amazonaws.com/products/highlife-nxt/grandee-nxt/highlife-nxt-grandee-nxt-shell-platinum.png'),
(389, 139, 0, 21, 'https://csp-hotspringspas.s3.amazonaws.com/products/common-assets/hotspring-water-care.jpg'),
(390, 139, 0, 22, 'https://csp-hotspringspas.s3.amazonaws.com/products/common-assets/hotspring-innov.jpg'),
(391, 139, 0, 23, 'https://csp-hotspringspas.s3.amazonaws.com/products/common-assets/hotspring-enjoy.jpg'),
(392, 139, 0, 20, 'https://csp-hotspringspas.s3.amazonaws.com/products/common-assets/hotspring-coverlifter.jpg'),
(393, 139, 0, 19, 'https://csp-hotspringspas.s3.amazonaws.com/products/highlife-nxt/grandee-nxt/highlift-nxt-grandee-nxt-family.jpg'),
(394, 142, 0, 3, 'https://csp-hotspringspas.s3.amazonaws.com/products/highlife-nxt/grandee-nxt/highlife-nxt-grandee-nxt-cabinet-teak.png'),
(395, 144, 0, 3, 'https://csp-hotspringspas.s3.amazonaws.com/products/highlife-nxt/grandee-nxt/highlife-nxt-grandee-nxt-shell-alpine-white.png'),
(396, 142, 0, 6, 'https://csp-hotspringspas.s3.amazonaws.com/products/highlife-nxt/grandee-nxt/highlife-nxt-grandee-nxt-cabinet-teak.png'),
(397, 144, 0, 6, 'https://csp-hotspringspas.s3.amazonaws.com/products/highlife-nxt/grandee-nxt/highlife-nxt-grandee-nxt-shell-tuscan-sun.png'),
(398, 142, 0, 12, 'https://csp-hotspringspas.s3.amazonaws.com/products/highlife-nxt/grandee-nxt/highlife-nxt-grandee-nxt-cabinet-teak.png'),
(399, 144, 0, 12, 'https://csp-hotspringspas.s3.amazonaws.com/products/highlife-nxt/grandee-nxt/highlife-nxt-grandee-nxt-shell-creme.png'),
(400, 142, 0, 15, 'https://csp-hotspringspas.s3.amazonaws.com/products/highlife-nxt/grandee-nxt/highlife-nxt-grandee-nxt-cabinet-teak.png'),
(401, 144, 0, 15, 'https://csp-hotspringspas.s3.amazonaws.com/products/highlife-nxt/grandee-nxt/highlife-nxt-grandee-nxt-shell-desert.png'),
(402, 100, 0, 23, NULL),
(403, 104, 0, 23, '1column'),
(432, 73, 0, 24, 'Hot Spring® 32" Polymer Spa Steps'),
(433, 84, 0, 24, 'Hot Spring® 32" Polymer Spa Steps'),
(434, 86, 0, 24, 'Hot Spring® 32" Polymer Spa Steps '),
(435, 87, 0, 24, '/1/2/1200px-steps-polymer-coastalgray-600x600.jpg'),
(436, 88, 0, 24, '/1/2/1200px-steps-polymer-coastalgray-600x600.jpg'),
(437, 89, 0, 24, '/1/2/1200px-steps-polymer-coastalgray-600x600.jpg'),
(438, 106, 0, 24, 'container2'),
(439, 121, 0, 24, 'hot-springr-32-polymer-spa-steps'),
(440, 127, 0, 24, '2'),
(441, 128, 0, 24, '/1/2/1200px-steps-polymer-coastalgray-600x600.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_frontend_action`
--

CREATE TABLE IF NOT EXISTS `catalog_product_frontend_action` (
  `action_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Product Action Id',
  `type_id` varchar(64) NOT NULL COMMENT 'Type of product action',
  `visitor_id` int(10) unsigned DEFAULT NULL COMMENT 'Visitor Id',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `added_at` bigint(20) NOT NULL COMMENT 'Added At',
  PRIMARY KEY (`action_id`),
  UNIQUE KEY `CATALOG_PRODUCT_FRONTEND_ACTION_VISITOR_ID_PRODUCT_ID_TYPE_ID` (`visitor_id`,`product_id`,`type_id`),
  UNIQUE KEY `CATALOG_PRODUCT_FRONTEND_ACTION_CUSTOMER_ID_PRODUCT_ID_TYPE_ID` (`customer_id`,`product_id`,`type_id`),
  KEY `CAT_PRD_FRONTEND_ACTION_PRD_ID_CAT_PRD_ENTT_ENTT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Frontend Action Table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_eav`
--

CREATE TABLE IF NOT EXISTS `catalog_product_index_eav` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` int(10) unsigned NOT NULL COMMENT 'Value',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Original entity Id for attribute value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Index Table';

--
-- Dumping data for table `catalog_product_index_eav`
--

INSERT INTO `catalog_product_index_eav` (`entity_id`, `attribute_id`, `store_id`, `value`, `source_id`) VALUES
(19, 99, 1, 1, 1),
(19, 99, 1, 1, 2),
(19, 99, 1, 1, 3),
(19, 99, 1, 1, 4),
(19, 99, 1, 1, 5),
(19, 99, 1, 1, 6),
(19, 99, 1, 1, 7),
(19, 99, 1, 1, 8),
(19, 99, 1, 1, 10),
(19, 99, 1, 1, 12),
(19, 99, 1, 1, 13),
(19, 99, 1, 1, 15),
(19, 99, 1, 1, 16),
(19, 99, 1, 1, 17),
(19, 99, 1, 4, 19),
(20, 99, 1, 4, 20),
(21, 99, 1, 4, 21),
(22, 99, 1, 4, 22),
(23, 99, 1, 4, 23),
(24, 99, 1, 4, 24),
(19, 141, 1, 4, 1),
(19, 141, 1, 4, 4),
(19, 141, 1, 4, 7),
(19, 141, 1, 4, 10),
(19, 141, 1, 4, 13),
(19, 141, 1, 4, 16),
(19, 141, 1, 5, 2),
(19, 141, 1, 5, 5),
(19, 141, 1, 5, 8),
(19, 141, 1, 5, 17),
(19, 141, 1, 6, 3),
(19, 141, 1, 6, 6),
(19, 141, 1, 6, 12),
(19, 141, 1, 6, 15);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_eav_decimal`
--

CREATE TABLE IF NOT EXISTS `catalog_product_index_eav_decimal` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` decimal(12,4) NOT NULL COMMENT 'Value',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Original entity Id for attribute value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Decimal Index Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_eav_decimal_idx`
--

CREATE TABLE IF NOT EXISTS `catalog_product_index_eav_decimal_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` decimal(12,4) NOT NULL COMMENT 'Value',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Original entity Id for attribute value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_IDX_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_IDX_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_IDX_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Decimal Indexer Index Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_eav_decimal_replica`
--

CREATE TABLE IF NOT EXISTS `catalog_product_index_eav_decimal_replica` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` decimal(12,4) NOT NULL COMMENT 'Value',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Original entity Id for attribute value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Decimal Index Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_eav_decimal_tmp`
--

CREATE TABLE IF NOT EXISTS `catalog_product_index_eav_decimal_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` decimal(12,4) NOT NULL COMMENT 'Value',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Original entity Id for attribute value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_TMP_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_TMP_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_TMP_VALUE` (`value`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Decimal Indexer Temp Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_eav_idx`
--

CREATE TABLE IF NOT EXISTS `catalog_product_index_eav_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` int(10) unsigned NOT NULL COMMENT 'Value',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Original entity Id for attribute value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_IDX_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_IDX_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_IDX_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Indexer Index Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_eav_replica`
--

CREATE TABLE IF NOT EXISTS `catalog_product_index_eav_replica` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` int(10) unsigned NOT NULL COMMENT 'Value',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Original entity Id for attribute value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Index Table';

--
-- Dumping data for table `catalog_product_index_eav_replica`
--

INSERT INTO `catalog_product_index_eav_replica` (`entity_id`, `attribute_id`, `store_id`, `value`, `source_id`) VALUES
(19, 99, 1, 1, 1),
(19, 99, 1, 1, 2),
(19, 99, 1, 1, 3),
(19, 99, 1, 1, 4),
(19, 99, 1, 1, 5),
(19, 99, 1, 1, 6),
(19, 99, 1, 1, 7),
(19, 99, 1, 1, 8),
(19, 99, 1, 1, 10),
(19, 99, 1, 1, 12),
(19, 99, 1, 1, 13),
(19, 99, 1, 1, 15),
(19, 99, 1, 1, 16),
(19, 99, 1, 1, 17),
(19, 99, 1, 4, 19),
(20, 99, 1, 4, 20),
(21, 99, 1, 4, 21),
(22, 99, 1, 4, 22),
(23, 99, 1, 4, 23),
(24, 99, 1, 4, 24),
(19, 141, 1, 4, 1),
(19, 141, 1, 4, 4),
(19, 141, 1, 4, 7),
(19, 141, 1, 4, 10),
(19, 141, 1, 4, 13),
(19, 141, 1, 4, 16),
(19, 141, 1, 5, 2),
(19, 141, 1, 5, 5),
(19, 141, 1, 5, 8),
(19, 141, 1, 5, 17),
(19, 141, 1, 6, 3),
(19, 141, 1, 6, 6),
(19, 141, 1, 6, 12),
(19, 141, 1, 6, 15);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_eav_tmp`
--

CREATE TABLE IF NOT EXISTS `catalog_product_index_eav_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` int(10) unsigned NOT NULL COMMENT 'Value',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Original entity Id for attribute value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_TMP_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_TMP_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_TMP_VALUE` (`value`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Indexer Temp Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price`
--

CREATE TABLE IF NOT EXISTS `catalog_product_index_price` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `final_price` decimal(12,4) DEFAULT NULL COMMENT 'Final Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `CATALOG_PRODUCT_INDEX_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOG_PRODUCT_INDEX_PRICE_MIN_PRICE` (`min_price`),
  KEY `CAT_PRD_IDX_PRICE_WS_ID_CSTR_GROUP_ID_MIN_PRICE` (`website_id`,`customer_group_id`,`min_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Index Table';

--
-- Dumping data for table `catalog_product_index_price`
--

INSERT INTO `catalog_product_index_price` (`entity_id`, `customer_group_id`, `website_id`, `tax_class_id`, `price`, `final_price`, `min_price`, `max_price`, `tier_price`) VALUES
(1, 0, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(1, 1, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(1, 2, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(1, 3, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(2, 0, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(2, 1, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(2, 2, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(2, 3, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(3, 0, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(3, 1, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(3, 2, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(3, 3, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(4, 0, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(4, 1, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(4, 2, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(4, 3, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(5, 0, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(5, 1, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(5, 2, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(5, 3, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(6, 0, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(6, 1, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(6, 2, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(6, 3, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(7, 0, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(7, 1, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(7, 2, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(7, 3, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(8, 0, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(8, 1, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(8, 2, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(8, 3, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(10, 0, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(10, 1, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(10, 2, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(10, 3, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(12, 0, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(12, 1, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(12, 2, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(12, 3, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(19, 0, 1, 2, 0.0000, 0.0000, 10.0000, 10.0000, NULL),
(19, 1, 1, 2, 0.0000, 0.0000, 10.0000, 10.0000, NULL),
(19, 2, 1, 2, 0.0000, 0.0000, 10.0000, 10.0000, NULL),
(19, 3, 1, 2, 0.0000, 0.0000, 10.0000, 10.0000, NULL),
(20, 0, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(20, 1, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(20, 2, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(20, 3, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(21, 0, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(21, 1, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(21, 2, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(21, 3, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(22, 0, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(22, 1, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(22, 2, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(22, 3, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(23, 0, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(23, 1, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(23, 2, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(23, 3, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(24, 0, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(24, 1, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(24, 2, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(24, 3, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_bundle_idx`
--

CREATE TABLE IF NOT EXISTS `catalog_product_index_price_bundle_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `customer_group_id` int(11) NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class Id',
  `price_type` smallint(5) unsigned NOT NULL COMMENT 'Price Type',
  `special_price` decimal(12,4) DEFAULT NULL COMMENT 'Special Price',
  `tier_percent` decimal(12,4) DEFAULT NULL COMMENT 'Tier Percent',
  `orig_price` decimal(12,4) DEFAULT NULL COMMENT 'Orig Price',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `base_tier` decimal(12,4) DEFAULT NULL COMMENT 'Base Tier',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Idx';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_bundle_opt_idx`
--

CREATE TABLE IF NOT EXISTS `catalog_product_index_price_bundle_opt_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `customer_group_id` int(11) NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Id',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `alt_price` decimal(12,4) DEFAULT NULL COMMENT 'Alt Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `alt_tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Alt Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Opt Idx';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_bundle_opt_tmp`
--

CREATE TABLE IF NOT EXISTS `catalog_product_index_price_bundle_opt_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `customer_group_id` int(11) NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Id',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `alt_price` decimal(12,4) DEFAULT NULL COMMENT 'Alt Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `alt_tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Alt Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Opt Tmp';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_bundle_sel_idx`
--

CREATE TABLE IF NOT EXISTS `catalog_product_index_price_bundle_sel_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `customer_group_id` int(11) NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Id',
  `selection_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Selection Id',
  `group_type` smallint(5) unsigned DEFAULT '0' COMMENT 'Group Type',
  `is_required` smallint(5) unsigned DEFAULT '0' COMMENT 'Is Required',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`,`selection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Sel Idx';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_bundle_sel_tmp`
--

CREATE TABLE IF NOT EXISTS `catalog_product_index_price_bundle_sel_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `customer_group_id` int(11) NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Id',
  `selection_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Selection Id',
  `group_type` smallint(5) unsigned DEFAULT '0' COMMENT 'Group Type',
  `is_required` smallint(5) unsigned DEFAULT '0' COMMENT 'Is Required',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`,`selection_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Sel Tmp';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_bundle_tmp`
--

CREATE TABLE IF NOT EXISTS `catalog_product_index_price_bundle_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `customer_group_id` int(11) NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class Id',
  `price_type` smallint(5) unsigned NOT NULL COMMENT 'Price Type',
  `special_price` decimal(12,4) DEFAULT NULL COMMENT 'Special Price',
  `tier_percent` decimal(12,4) DEFAULT NULL COMMENT 'Tier Percent',
  `orig_price` decimal(12,4) DEFAULT NULL COMMENT 'Orig Price',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `base_tier` decimal(12,4) DEFAULT NULL COMMENT 'Base Tier',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Tmp';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_cfg_opt_agr_idx`
--

CREATE TABLE IF NOT EXISTS `catalog_product_index_price_cfg_opt_agr_idx` (
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent ID',
  `child_id` int(10) unsigned NOT NULL COMMENT 'Child ID',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`parent_id`,`child_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Config Option Aggregate Index Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_cfg_opt_agr_tmp`
--

CREATE TABLE IF NOT EXISTS `catalog_product_index_price_cfg_opt_agr_tmp` (
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent ID',
  `child_id` int(10) unsigned NOT NULL COMMENT 'Child ID',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`parent_id`,`child_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Config Option Aggregate Temp Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_cfg_opt_idx`
--

CREATE TABLE IF NOT EXISTS `catalog_product_index_price_cfg_opt_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Config Option Index Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_cfg_opt_tmp`
--

CREATE TABLE IF NOT EXISTS `catalog_product_index_price_cfg_opt_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Config Option Temp Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_downlod_idx`
--

CREATE TABLE IF NOT EXISTS `catalog_product_index_price_downlod_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(11) NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Minimum price',
  `max_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Maximum price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Indexer Table for price of downloadable products';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_downlod_tmp`
--

CREATE TABLE IF NOT EXISTS `catalog_product_index_price_downlod_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(11) NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Minimum price',
  `max_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Maximum price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Temporary Indexer Table for price of downloadable products';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_final_idx`
--

CREATE TABLE IF NOT EXISTS `catalog_product_index_price_final_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class ID',
  `orig_price` decimal(12,4) DEFAULT NULL COMMENT 'Original Price',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `base_tier` decimal(12,4) DEFAULT NULL COMMENT 'Base Tier',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Final Index Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_final_tmp`
--

CREATE TABLE IF NOT EXISTS `catalog_product_index_price_final_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class ID',
  `orig_price` decimal(12,4) DEFAULT NULL COMMENT 'Original Price',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `base_tier` decimal(12,4) DEFAULT NULL COMMENT 'Base Tier',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Final Temp Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_idx`
--

CREATE TABLE IF NOT EXISTS `catalog_product_index_price_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `final_price` decimal(12,4) DEFAULT NULL COMMENT 'Final Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `CATALOG_PRODUCT_INDEX_PRICE_IDX_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOG_PRODUCT_INDEX_PRICE_IDX_WEBSITE_ID` (`website_id`),
  KEY `CATALOG_PRODUCT_INDEX_PRICE_IDX_MIN_PRICE` (`min_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Index Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_opt_agr_idx`
--

CREATE TABLE IF NOT EXISTS `catalog_product_index_price_opt_agr_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Option Aggregate Index Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_opt_agr_tmp`
--

CREATE TABLE IF NOT EXISTS `catalog_product_index_price_opt_agr_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Option Aggregate Temp Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_opt_idx`
--

CREATE TABLE IF NOT EXISTS `catalog_product_index_price_opt_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Option Index Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_opt_tmp`
--

CREATE TABLE IF NOT EXISTS `catalog_product_index_price_opt_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Option Temp Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_replica`
--

CREATE TABLE IF NOT EXISTS `catalog_product_index_price_replica` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `final_price` decimal(12,4) DEFAULT NULL COMMENT 'Final Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `CATALOG_PRODUCT_INDEX_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOG_PRODUCT_INDEX_PRICE_MIN_PRICE` (`min_price`),
  KEY `CAT_PRD_IDX_PRICE_WS_ID_CSTR_GROUP_ID_MIN_PRICE` (`website_id`,`customer_group_id`,`min_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Index Table';

--
-- Dumping data for table `catalog_product_index_price_replica`
--

INSERT INTO `catalog_product_index_price_replica` (`entity_id`, `customer_group_id`, `website_id`, `tax_class_id`, `price`, `final_price`, `min_price`, `max_price`, `tier_price`) VALUES
(1, 0, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(1, 1, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(1, 2, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(1, 3, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(2, 0, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(2, 1, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(2, 2, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(2, 3, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(3, 0, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(3, 1, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(3, 2, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(3, 3, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(4, 0, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(4, 1, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(4, 2, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(4, 3, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(5, 0, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(5, 1, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(5, 2, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(5, 3, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(6, 0, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(6, 1, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(6, 2, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(6, 3, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(7, 0, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(7, 1, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(7, 2, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(7, 3, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(8, 0, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(8, 1, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(8, 2, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(8, 3, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(10, 0, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(10, 1, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(10, 2, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(10, 3, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(12, 0, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(12, 1, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(12, 2, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(12, 3, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(19, 0, 1, 2, 0.0000, 0.0000, 10.0000, 10.0000, NULL),
(19, 1, 1, 2, 0.0000, 0.0000, 10.0000, 10.0000, NULL),
(19, 2, 1, 2, 0.0000, 0.0000, 10.0000, 10.0000, NULL),
(19, 3, 1, 2, 0.0000, 0.0000, 10.0000, 10.0000, NULL),
(20, 0, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(20, 1, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(20, 2, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(20, 3, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(21, 0, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(21, 1, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(21, 2, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(21, 3, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(22, 0, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(22, 1, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(22, 2, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(22, 3, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(23, 0, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(23, 1, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(23, 2, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(23, 3, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(24, 0, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(24, 1, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(24, 2, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL),
(24, 3, 1, 2, 10.0000, 10.0000, 10.0000, 10.0000, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_tmp`
--

CREATE TABLE IF NOT EXISTS `catalog_product_index_price_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `final_price` decimal(12,4) DEFAULT NULL COMMENT 'Final Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `CATALOG_PRODUCT_INDEX_PRICE_TMP_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOG_PRODUCT_INDEX_PRICE_TMP_WEBSITE_ID` (`website_id`),
  KEY `CATALOG_PRODUCT_INDEX_PRICE_TMP_MIN_PRICE` (`min_price`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Temp Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_tier_price`
--

CREATE TABLE IF NOT EXISTS `catalog_product_index_tier_price` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int(10) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `CATALOG_PRODUCT_INDEX_TIER_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOG_PRODUCT_INDEX_TIER_PRICE_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Tier Price Index Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_website`
--

CREATE TABLE IF NOT EXISTS `catalog_product_index_website` (
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `default_store_id` smallint(5) unsigned NOT NULL COMMENT 'Default store id for website',
  `website_date` date DEFAULT NULL COMMENT 'Website Date',
  `rate` float DEFAULT '1' COMMENT 'Rate',
  PRIMARY KEY (`website_id`),
  KEY `CATALOG_PRODUCT_INDEX_WEBSITE_WEBSITE_DATE` (`website_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Website Index Table';

--
-- Dumping data for table `catalog_product_index_website`
--

INSERT INTO `catalog_product_index_website` (`website_id`, `default_store_id`, `website_date`, `rate`) VALUES
(1, 1, '2019-01-01', 1);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_link`
--

CREATE TABLE IF NOT EXISTS `catalog_product_link` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Link ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `linked_product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Linked Product ID',
  `link_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Link Type ID',
  PRIMARY KEY (`link_id`),
  UNIQUE KEY `CATALOG_PRODUCT_LINK_LINK_TYPE_ID_PRODUCT_ID_LINKED_PRODUCT_ID` (`link_type_id`,`product_id`,`linked_product_id`),
  KEY `CATALOG_PRODUCT_LINK_PRODUCT_ID` (`product_id`),
  KEY `CATALOG_PRODUCT_LINK_LINKED_PRODUCT_ID` (`linked_product_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Catalog Product To Product Linkage Table' AUTO_INCREMENT=53 ;

--
-- Dumping data for table `catalog_product_link`
--

INSERT INTO `catalog_product_link` (`link_id`, `product_id`, `linked_product_id`, `link_type_id`) VALUES
(52, 19, 20, 1),
(51, 19, 21, 1),
(50, 19, 22, 1),
(49, 19, 23, 1);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_link_attribute`
--

CREATE TABLE IF NOT EXISTS `catalog_product_link_attribute` (
  `product_link_attribute_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Product Link Attribute ID',
  `link_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Link Type ID',
  `product_link_attribute_code` varchar(32) DEFAULT NULL COMMENT 'Product Link Attribute Code',
  `data_type` varchar(32) DEFAULT NULL COMMENT 'Data Type',
  PRIMARY KEY (`product_link_attribute_id`),
  KEY `CATALOG_PRODUCT_LINK_ATTRIBUTE_LINK_TYPE_ID` (`link_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Catalog Product Link Attribute Table' AUTO_INCREMENT=6 ;

--
-- Dumping data for table `catalog_product_link_attribute`
--

INSERT INTO `catalog_product_link_attribute` (`product_link_attribute_id`, `link_type_id`, `product_link_attribute_code`, `data_type`) VALUES
(1, 1, 'position', 'int'),
(2, 4, 'position', 'int'),
(3, 5, 'position', 'int'),
(4, 3, 'position', 'int'),
(5, 3, 'qty', 'decimal');

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_link_attribute_decimal`
--

CREATE TABLE IF NOT EXISTS `catalog_product_link_attribute_decimal` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `product_link_attribute_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Product Link Attribute ID',
  `link_id` int(10) unsigned NOT NULL COMMENT 'Link ID',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CAT_PRD_LNK_ATTR_DEC_PRD_LNK_ATTR_ID_LNK_ID` (`product_link_attribute_id`,`link_id`),
  KEY `CATALOG_PRODUCT_LINK_ATTRIBUTE_DECIMAL_LINK_ID` (`link_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Link Decimal Attribute Table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_link_attribute_int`
--

CREATE TABLE IF NOT EXISTS `catalog_product_link_attribute_int` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `product_link_attribute_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Product Link Attribute ID',
  `link_id` int(10) unsigned NOT NULL COMMENT 'Link ID',
  `value` int(11) NOT NULL DEFAULT '0' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CAT_PRD_LNK_ATTR_INT_PRD_LNK_ATTR_ID_LNK_ID` (`product_link_attribute_id`,`link_id`),
  KEY `CATALOG_PRODUCT_LINK_ATTRIBUTE_INT_LINK_ID` (`link_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Catalog Product Link Integer Attribute Table' AUTO_INCREMENT=53 ;

--
-- Dumping data for table `catalog_product_link_attribute_int`
--

INSERT INTO `catalog_product_link_attribute_int` (`value_id`, `product_link_attribute_id`, `link_id`, `value`) VALUES
(49, 1, 49, 1),
(50, 1, 50, 2),
(51, 1, 51, 3),
(52, 1, 52, 4);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_link_attribute_varchar`
--

CREATE TABLE IF NOT EXISTS `catalog_product_link_attribute_varchar` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `product_link_attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Product Link Attribute ID',
  `link_id` int(10) unsigned NOT NULL COMMENT 'Link ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CAT_PRD_LNK_ATTR_VCHR_PRD_LNK_ATTR_ID_LNK_ID` (`product_link_attribute_id`,`link_id`),
  KEY `CATALOG_PRODUCT_LINK_ATTRIBUTE_VARCHAR_LINK_ID` (`link_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Link Varchar Attribute Table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_link_type`
--

CREATE TABLE IF NOT EXISTS `catalog_product_link_type` (
  `link_type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Link Type ID',
  `code` varchar(32) DEFAULT NULL COMMENT 'Code',
  PRIMARY KEY (`link_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Catalog Product Link Type Table' AUTO_INCREMENT=6 ;

--
-- Dumping data for table `catalog_product_link_type`
--

INSERT INTO `catalog_product_link_type` (`link_type_id`, `code`) VALUES
(1, 'relation'),
(3, 'super'),
(4, 'up_sell'),
(5, 'cross_sell');

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_option`
--

CREATE TABLE IF NOT EXISTS `catalog_product_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `type` varchar(50) DEFAULT NULL COMMENT 'Type',
  `is_require` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Is Required',
  `sku` varchar(64) DEFAULT NULL COMMENT 'SKU',
  `max_characters` int(10) unsigned DEFAULT NULL COMMENT 'Max Characters',
  `file_extension` varchar(50) DEFAULT NULL COMMENT 'File Extension',
  `image_size_x` smallint(5) unsigned DEFAULT NULL COMMENT 'Image Size X',
  `image_size_y` smallint(5) unsigned DEFAULT NULL COMMENT 'Image Size Y',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`option_id`),
  KEY `CATALOG_PRODUCT_OPTION_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_option_price`
--

CREATE TABLE IF NOT EXISTS `catalog_product_option_price` (
  `option_price_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Price ID',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `price_type` varchar(7) NOT NULL DEFAULT 'fixed' COMMENT 'Price Type',
  PRIMARY KEY (`option_price_id`),
  UNIQUE KEY `CATALOG_PRODUCT_OPTION_PRICE_OPTION_ID_STORE_ID` (`option_id`,`store_id`),
  KEY `CATALOG_PRODUCT_OPTION_PRICE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Price Table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_option_title`
--

CREATE TABLE IF NOT EXISTS `catalog_product_option_title` (
  `option_title_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Title ID',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  PRIMARY KEY (`option_title_id`),
  UNIQUE KEY `CATALOG_PRODUCT_OPTION_TITLE_OPTION_ID_STORE_ID` (`option_id`,`store_id`),
  KEY `CATALOG_PRODUCT_OPTION_TITLE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Title Table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_option_type_price`
--

CREATE TABLE IF NOT EXISTS `catalog_product_option_type_price` (
  `option_type_price_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Type Price ID',
  `option_type_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Type ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `price_type` varchar(7) NOT NULL DEFAULT 'fixed' COMMENT 'Price Type',
  PRIMARY KEY (`option_type_price_id`),
  UNIQUE KEY `CATALOG_PRODUCT_OPTION_TYPE_PRICE_OPTION_TYPE_ID_STORE_ID` (`option_type_id`,`store_id`),
  KEY `CATALOG_PRODUCT_OPTION_TYPE_PRICE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Type Price Table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_option_type_title`
--

CREATE TABLE IF NOT EXISTS `catalog_product_option_type_title` (
  `option_type_title_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Type Title ID',
  `option_type_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Type ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  PRIMARY KEY (`option_type_title_id`),
  UNIQUE KEY `CATALOG_PRODUCT_OPTION_TYPE_TITLE_OPTION_TYPE_ID_STORE_ID` (`option_type_id`,`store_id`),
  KEY `CATALOG_PRODUCT_OPTION_TYPE_TITLE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Type Title Table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_option_type_value`
--

CREATE TABLE IF NOT EXISTS `catalog_product_option_type_value` (
  `option_type_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Type ID',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `sku` varchar(64) DEFAULT NULL COMMENT 'SKU',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`option_type_id`),
  KEY `CATALOG_PRODUCT_OPTION_TYPE_VALUE_OPTION_ID` (`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Type Value Table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_relation`
--

CREATE TABLE IF NOT EXISTS `catalog_product_relation` (
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent ID',
  `child_id` int(10) unsigned NOT NULL COMMENT 'Child ID',
  PRIMARY KEY (`parent_id`,`child_id`),
  KEY `CATALOG_PRODUCT_RELATION_CHILD_ID` (`child_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Relation Table';

--
-- Dumping data for table `catalog_product_relation`
--

INSERT INTO `catalog_product_relation` (`parent_id`, `child_id`) VALUES
(19, 1),
(19, 2),
(19, 3),
(19, 4),
(19, 5),
(19, 6),
(19, 7),
(19, 8),
(19, 10),
(19, 12),
(19, 13),
(19, 15),
(19, 16),
(19, 17);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_super_attribute`
--

CREATE TABLE IF NOT EXISTS `catalog_product_super_attribute` (
  `product_super_attribute_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Product Super Attribute ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Position',
  PRIMARY KEY (`product_super_attribute_id`),
  UNIQUE KEY `CATALOG_PRODUCT_SUPER_ATTRIBUTE_PRODUCT_ID_ATTRIBUTE_ID` (`product_id`,`attribute_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Catalog Product Super Attribute Table' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `catalog_product_super_attribute`
--

INSERT INTO `catalog_product_super_attribute` (`product_super_attribute_id`, `product_id`, `attribute_id`, `position`) VALUES
(1, 19, 141, 1),
(2, 19, 143, 0);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_super_attribute_label`
--

CREATE TABLE IF NOT EXISTS `catalog_product_super_attribute_label` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `product_super_attribute_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product Super Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `use_default` smallint(5) unsigned DEFAULT '0' COMMENT 'Use Default Value',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CAT_PRD_SPR_ATTR_LBL_PRD_SPR_ATTR_ID_STORE_ID` (`product_super_attribute_id`,`store_id`),
  KEY `CATALOG_PRODUCT_SUPER_ATTRIBUTE_LABEL_STORE_ID` (`store_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Catalog Product Super Attribute Label Table' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `catalog_product_super_attribute_label`
--

INSERT INTO `catalog_product_super_attribute_label` (`value_id`, `product_super_attribute_id`, `store_id`, `use_default`, `value`) VALUES
(1, 1, 0, 0, 'Cabinets'),
(2, 2, 0, 0, 'Shell');

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_super_link`
--

CREATE TABLE IF NOT EXISTS `catalog_product_super_link` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Link ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Parent ID',
  PRIMARY KEY (`link_id`),
  UNIQUE KEY `CATALOG_PRODUCT_SUPER_LINK_PRODUCT_ID_PARENT_ID` (`product_id`,`parent_id`),
  KEY `CATALOG_PRODUCT_SUPER_LINK_PARENT_ID` (`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Catalog Product Super Link Table' AUTO_INCREMENT=18 ;

--
-- Dumping data for table `catalog_product_super_link`
--

INSERT INTO `catalog_product_super_link` (`link_id`, `product_id`, `parent_id`) VALUES
(1, 1, 19),
(2, 2, 19),
(3, 3, 19),
(4, 4, 19),
(5, 5, 19),
(6, 6, 19),
(7, 7, 19),
(8, 8, 19),
(10, 10, 19),
(12, 12, 19),
(13, 13, 19),
(15, 15, 19),
(16, 16, 19),
(17, 17, 19);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_website`
--

CREATE TABLE IF NOT EXISTS `catalog_product_website` (
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  PRIMARY KEY (`product_id`,`website_id`),
  KEY `CATALOG_PRODUCT_WEBSITE_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product To Website Linkage Table';

--
-- Dumping data for table `catalog_product_website`
--

INSERT INTO `catalog_product_website` (`product_id`, `website_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(10, 1),
(12, 1),
(13, 1),
(15, 1),
(16, 1),
(17, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_url_rewrite_product_category`
--

CREATE TABLE IF NOT EXISTS `catalog_url_rewrite_product_category` (
  `url_rewrite_id` int(10) unsigned NOT NULL COMMENT 'url_rewrite_id',
  `category_id` int(10) unsigned NOT NULL COMMENT 'category_id',
  `product_id` int(10) unsigned NOT NULL COMMENT 'product_id',
  KEY `CAT_URL_REWRITE_PRD_CTGR_PRD_ID_CAT_PRD_ENTT_ENTT_ID` (`product_id`),
  KEY `FK_BB79E64705D7F17FE181F23144528FC8` (`url_rewrite_id`),
  KEY `CATALOG_URL_REWRITE_PRODUCT_CATEGORY_CATEGORY_ID_PRODUCT_ID` (`category_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='url_rewrite_relation';

--
-- Dumping data for table `catalog_url_rewrite_product_category`
--

INSERT INTO `catalog_url_rewrite_product_category` (`url_rewrite_id`, `category_id`, `product_id`) VALUES
(27, 3, 20),
(29, 3, 21),
(31, 3, 22),
(33, 3, 23),
(35, 9, 24);

-- --------------------------------------------------------

--
-- Table structure for table `checkout_agreement`
--

CREATE TABLE IF NOT EXISTS `checkout_agreement` (
  `agreement_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Agreement Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `content` text COMMENT 'Content',
  `content_height` varchar(25) DEFAULT NULL COMMENT 'Content Height',
  `checkbox_text` text COMMENT 'Checkbox Text',
  `is_active` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Is Active',
  `is_html` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Is Html',
  `mode` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Applied mode',
  PRIMARY KEY (`agreement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Checkout Agreement' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `checkout_agreement_store`
--

CREATE TABLE IF NOT EXISTS `checkout_agreement_store` (
  `agreement_id` int(10) unsigned NOT NULL COMMENT 'Agreement Id',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  PRIMARY KEY (`agreement_id`,`store_id`),
  KEY `CHECKOUT_AGREEMENT_STORE_STORE_ID_STORE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Checkout Agreement Store';

-- --------------------------------------------------------

--
-- Table structure for table `cms_block`
--

CREATE TABLE IF NOT EXISTS `cms_block` (
  `block_id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `title` varchar(255) NOT NULL COMMENT 'Block Title',
  `identifier` varchar(255) NOT NULL COMMENT 'Block String Identifier',
  `content` mediumtext COMMENT 'Block Content',
  `creation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Block Creation Time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Block Modification Time',
  `is_active` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Is Block Active',
  PRIMARY KEY (`block_id`),
  FULLTEXT KEY `CMS_BLOCK_TITLE_IDENTIFIER_CONTENT` (`title`,`identifier`,`content`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='CMS Block Table' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `cms_block`
--

INSERT INTO `cms_block` (`block_id`, `title`, `identifier`, `content`, `creation_time`, `update_time`, `is_active`) VALUES
(1, 'Footer Section Block', 'footer-section', '<div class="footer-container">\r\n   <div class="footer1">\r\n        <div class="container">\r\n            <div class="row">\r\n                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">\r\n                    <h2 class="fh2">How can we help?</h2>\r\n                    <div class="footer531 item1">\r\n                        <a class="elementor-animation-bob" href="/download-a-brochure/"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 200 200">\r\n                                <title>Artboard 1 copy 5</title>\r\n                                <circle id="bigCircle" cx="100" cy="100" r="92.52" fill="transparent"></circle>\r\n                                <path d="M100,194.32A94.32,94.32,0,1,1,194.32,100,94.42,94.42,0,0,1,100,194.32ZM100,9.68A90.32,90.32,0,1,0,190.32,100,90.43,90.43,0,0,0,100,9.68Z" fill="#fff"></path>\r\n                                <path d="M135.84,109.4,108.2,98.47a2.6,2.6,0,0,0-1.9,0L78.66,109.4A2.59,2.59,0,0,0,77,111.81v20.38a2.58,2.58,0,0,0,1.64,2.41l27.64,10.93a2.6,2.6,0,0,0,1.9,0l27.64-10.93a2.58,2.58,0,0,0,1.64-2.41V111.81A2.59,2.59,0,0,0,135.84,109.4Zm-3.39,4a1.77,1.77,0,0,1-.31.15l-24,9.49a2.38,2.38,0,0,1-1.78,0l-24-9.49a1.8,1.8,0,0,1-.51-.28,1.88,1.88,0,0,1,0-3,2.09,2.09,0,0,1,.51-.28l24-9.49a2.48,2.48,0,0,1,1.78,0l24,9.49a3,3,0,0,1,.31.15A2,2,0,0,1,132.45,113.44Z" fill="#fff"></path>\r\n                                <path d="M98.93,114.18a.76.76,0,0,1-.75-.75,2.64,2.64,0,0,0-5.28,0,.75.75,0,0,1-1.5,0,4.14,4.14,0,0,1,8.27,0A.75.75,0,0,1,98.93,114.18Z" fill="#fff"></path>\r\n                                <path d="M115.56,107.44a.76.76,0,0,1-.75-.75,2.16,2.16,0,0,0-4.32,0,.75.75,0,1,1-1.49,0,3.66,3.66,0,0,1,7.31,0A.76.76,0,0,1,115.56,107.44Z" fill="#fff"></path>\r\n                                <path d="M113.9,118a.76.76,0,0,1-.75-.75,3.57,3.57,0,1,0-7.13,0,.75.75,0,1,1-1.49,0,5.06,5.06,0,0,1,10.12,0A.76.76,0,0,1,113.9,118Z" fill="#fff"></path>\r\n                                <path d="M109.75,112.86a.74.74,0,0,1-.75-.75,2.65,2.65,0,0,0-5.29,0,.74.74,0,0,1-.74.75.75.75,0,0,1-.75-.75,4.14,4.14,0,0,1,8.27,0A.74.74,0,0,1,109.75,112.86Z" fill="#fff"></path>\r\n                                <path d="M120.56,114.18a.75.75,0,0,1-.74-.75,3.21,3.21,0,1,0-6.42,0,.76.76,0,0,1-.75.75.75.75,0,0,1-.74-.75,4.7,4.7,0,0,1,9.4,0A.75.75,0,0,1,120.56,114.18Z" fill="#fff"></path>\r\n                                <path d="M102.88,108.66a.74.74,0,0,1-.75-.75,1.86,1.86,0,1,0-3.72,0,.75.75,0,0,1-1.5,0,3.36,3.36,0,0,1,6.71,0A.74.74,0,0,1,102.88,108.66Z" fill="#fff"></path>\r\n                                <g>\r\n                                    <circle cx="96.49" cy="95.04" r="2.75" fill="#fff"></circle>\r\n                                    <circle cx="88.14" cy="79.57" r="2.75" fill="#fff"></circle>\r\n                                    <circle cx="89.79" cy="85.73" r="2.35" fill="#fff"></circle>\r\n                                    <circle cx="89.73" cy="91.15" r="2" fill="#fff"></circle>\r\n                                    <circle cx="93.74" cy="81.58" r="2" fill="#fff"></circle>\r\n                                    <circle cx="82.27" cy="81.87" r="1.71" fill="#fff"></circle>\r\n                                    <circle cx="94.62" cy="89.41" r="1.45" fill="#fff"></circle>\r\n                                </g>\r\n                                <path d="M136.05,53.26V41.52H52V146.74H64v11.74h84V53.26ZM53.91,144.84V43.42h69.48L64,53.11v91.73Zm92.18,11.74H65.82V55.16h80.27Z" fill="#fff"></path>\r\n                                <path d="M137.48,94.54H120.56a2,2,0,0,1,0-4h16.92a2,2,0,0,1,0,4Z" fill="#fff"></path>\r\n                                <path d="M137.48,86H113.9a2,2,0,0,1,0-4h23.58a2,2,0,0,1,0,4Z" fill="#fff"></path>\r\n                                <path d="M137.48,76.62H100.27a2,2,0,1,1,0-4h37.21a2,2,0,0,1,0,4Z" fill="#fff"></path>\r\n                                <g>\r\n                                    <path d="M112,103.88l-4.43-1.76a.75.75,0,0,0-.55,0L80,112.74a.75.75,0,0,0,.27,1.44.92.92,0,0,0,.28-.05l17.22-6.77a2.59,2.59,0,0,1,4-1.58l5.49-2.16,3.16,1.25A2.82,2.82,0,0,1,112,103.88Z" fill="#fff"></path>\r\n                                    <path d="M133.63,112.45l-18.54-7.34a3,3,0,0,1,.47,1.58H115l18.07,7.15a.75.75,0,0,0,.54-1.39Z" fill="#fff"></path>\r\n                                </g>\r\n                            </svg>\r\n                        </a>\r\n                        <span class="footer532"><a href="/download-a-brochure">Download Brochure</a></span>\r\n                    </div>\r\n                    <div class="footer531 item2">\r\n                        <a class="elementor-animation-bob" href="/hot-tub-buyers-guide/"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 200 200">\r\n                                <title>Artboard 1 copy 7</title>\r\n                                <circle id="bigCircle" cx="100" cy="100" r="92.52" fill="transparent"></circle>\r\n                                <g>\r\n                                    <g>\r\n                                        <path d="M67.78,76S51.46,95.81,51.46,109.14a16.33,16.33,0,1,0,32.65,0C84.11,95.22,67.78,76,67.78,76Zm-14,33.87c-1-8.57,5.66-15.08,5.66-15.08S55,109.15,63,121.39C63,121.39,54.61,120.09,53.77,109.84Z" fill="#fff"></path>\r\n                                        <path d="M159.61,64.31l-7.86,0,.34,4.62h3.61s4,65.14,3.21,65.13l-44.75-.25c17.37-6.63,41.25-3,41.25-3l-5.13-70.88c-35.75-3.37-48.37,5.25-48.37,5.25l-61-.12-4.13,73.12H93.33s1.08,2.75,6.83,2.75c5.06,0,6.75-2.75,6.75-2.75.21,0,50,.51,56.31.06Zm-61.7,70H41L44.41,69h53.5Zm4.25-1.13V69c12.62-8.13,44.12-5.63,44.12-5.63l4.75,63C117.53,122.27,102.16,133.14,102.16,133.14Z" fill="#fff"></path>\r\n                                        <path d="M142.53,72.17c-19-1.1-30.54,3.53-35.29,6v4.92l0,0c.11-.09,11.69-8.13,35.27-6.7Z" fill="#fff"></path>\r\n                                        <path d="M143.16,84.79c-19.29-1.1-31.09,3.54-35.92,6v4.92l0,0c.12-.08,11.9-8.13,35.9-6.7Z" fill="#fff"></path>\r\n                                        <path d="M144.41,97.42c-20-1.1-32.17,3.53-37.17,6v4.92l0,0c.12-.09,12.31-8.13,37.15-6.7Z" fill="#fff"></path>\r\n                                        <path d="M144.86,110c-20.2-1.1-32.56,3.54-37.62,6V121l0,0c.12-.08,12.47-8.13,37.6-6.7Z" fill="#fff"></path>\r\n                                    </g>\r\n                                    <path d="M100,194.32A94.32,94.32,0,1,1,194.32,100,94.42,94.42,0,0,1,100,194.32ZM100,9.68A90.32,90.32,0,1,0,190.32,100,90.43,90.43,0,0,0,100,9.68Z" fill="#fff"></path>\r\n                                </g>\r\n                            </svg>\r\n\r\n                        </a>\r\n                        <span class="footer532"><a href="/hot-tub-buyers-guide">Buyers Guide</a></span></div>\r\n\r\n                    <div class="footer531 item3">\r\n                        <a class="elementor-animation-bob" href="/request-financing/"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 200 200">\r\n                                <title>Artboard 1 copy 10</title>\r\n                                <circle id="bigCircle" cx="100" cy="100" r="92.52" fill="transparent"></circle>\r\n                                <path d="M100,194.32A94.32,94.32,0,1,1,194.32,100,94.42,94.42,0,0,1,100,194.32ZM100,9.68A90.32,90.32,0,1,0,190.32,100,90.43,90.43,0,0,0,100,9.68Z" fill="#fff"></path>\r\n                                <g>\r\n                                    <g>\r\n                                        <path d="M40.79,105l12.57-5a46.64,46.64,0,0,1,80.41-32.22l12.56-5-.15-1.16-5.76-1.86L138.57,54l-6-.8-2.85-5.34-6,.29-3.76-4.74L114,44.73l-4.54-4-5.56,2.39L98.72,40l-5,3.35L88,41.2l-4.36,4.19-6-1.1L74.16,49.2l-6,0-2.62,5.46-6,1.06-1.59,5.84-5.68,2.11-.53,6-5.2,3.08.55,6-4.57,4,1.63,5.83-3.79,4.72L43,98.76l-2.89,5.32Z" fill="#fff"></path>\r\n                                        <path d="M157.24,95.67l-10.6,4.24a46.64,46.64,0,0,1-80.41,32.22l-10.6,4.24.59.25,1.33,5.9,5.9,1.34,2.36,5.57,6,.26,3.32,5.06,6-.83,4.17,4.39,5.75-1.88L96,160l5.32-2.88,5.44,2.64,4.73-3.78,5.83,1.63,4-4.57,6,.56,3.09-5.2,6-.52,2.11-5.68,5.84-1.59,1.07-6,5.46-2.61V126l4.9-3.54-1.09-6,4.19-4.36-2.13-5.66,3.35-5L157,96.25Z" fill="#fff"></path>\r\n                                    </g>\r\n                                    <g>\r\n                                        <g>\r\n                                            <polygon points="34.61 113.76 43.16 135.11 32.39 139.43 33.03 126.78 23.83 118.08 34.61 113.76" fill="#fff"></polygon>\r\n                                            <polygon points="156.84 64.79 165.39 86.14 176.17 81.82 166.97 73.12 167.61 60.47 156.84 64.79" fill="#fff"></polygon>\r\n                                        </g>\r\n                                        <g>\r\n                                            <path d="M66.66,108.05l-2.32.93L66,113.14l2.29-.91a2.31,2.31,0,0,0,1.33-1.12,2,2,0,0,0,0-1.64,2.44,2.44,0,0,0-1.19-1.4A2,2,0,0,0,66.66,108.05Z" fill="#fff"></path>\r\n                                            <path d="M106.39,92q-2.62,1-1.2,5l.42,1.07a6.64,6.64,0,0,0,2,3,2.49,2.49,0,0,0,2.55.3,2.45,2.45,0,0,0,1.58-1.93,6.5,6.5,0,0,0-.57-3.52l-.26-.66a6.52,6.52,0,0,0-2-3A2.48,2.48,0,0,0,106.39,92Z" fill="#fff"></path>\r\n                                            <path d="M79.87,102.75l-2.32.93,1.67,4.17,2.28-.92a2.3,2.3,0,0,0,1.34-1.12,2,2,0,0,0,0-1.64,2.54,2.54,0,0,0-1.19-1.4A2.1,2.1,0,0,0,79.87,102.75Z" fill="#fff"></path>\r\n                                            <path d="M93,97.5l-2.2.88,1.59,4,2.2-.88a2.1,2.1,0,0,0,1.28-1.12,2.13,2.13,0,0,0-.08-1.65,2.19,2.19,0,0,0-1.09-1.27A2.08,2.08,0,0,0,93,97.5Z" fill="#fff"></path>\r\n                                            <path d="M36.19,109.64l11,27.35L163.81,90.26l-11-27.35ZM60.77,124l-1.92-2.36-4.77,1.91.25,3-3.72,1.49-.49-16.56,3.27-1.31,11.12,12.3ZM73,112a6.74,6.74,0,0,1-3.65,2.93l-2.22.89,2,4.9-3.48,1.39-5.78-14.43,5.76-2.31a7.36,7.36,0,0,1,3.18-.57,4.89,4.89,0,0,1,2.66,1A5.14,5.14,0,0,1,73.11,108,4.51,4.51,0,0,1,73,112Zm13.21-5.29a6.7,6.7,0,0,1-3.64,2.92l-2.22.89,2,4.9-3.48,1.4L73,102.39l5.76-2.31a7.18,7.18,0,0,1,3.17-.56,4.92,4.92,0,0,1,2.67.94,5.08,5.08,0,0,1,1.72,2.28A4.48,4.48,0,0,1,86.16,106.72Zm17.48.15-3.73,1.49-4.59-4.08-1.89.75,2,5.11L92,111.53,86.21,97.09l5.69-2.27a6.82,6.82,0,0,1,4.47-.47A4.16,4.16,0,0,1,99.11,97a5.09,5.09,0,0,1,.39,2.74,4.78,4.78,0,0,1-1.27,2.37l5.35,4.62ZM114.7,94.41a9.15,9.15,0,0,1,.71,4,6.14,6.14,0,0,1-1.22,3.39,6.72,6.72,0,0,1-2.93,2.2,6.86,6.86,0,0,1-3.62.46,6.17,6.17,0,0,1-3.19-1.53,8.78,8.78,0,0,1-2.29-3.29l-.33-.81a9.36,9.36,0,0,1-.72-4,6.29,6.29,0,0,1,1.23-3.4,7.1,7.1,0,0,1,6.57-2.65,6.39,6.39,0,0,1,3.24,1.59,9,9,0,0,1,2.28,3.37Zm11.86,3.28-3.81,1.52-10.6-12.5L116,85.16l7.08,9.36-1.34-11.66,3.89-1.56Zm11.16-18.11-6.48,2.6,1.22,3L137.93,83l1,2.58-5.48,2.19,1.38,3.45,6.47-2.59,1.07,2.68-9.94,4-5.79-14.44,10-4Zm14.68-.27A8,8,0,0,1,153,83.2a6.7,6.7,0,0,1-1.37,3.41,7.22,7.22,0,0,1-3,2.26l-4.75,1.9-5.78-14.44,4.65-1.86a7.35,7.35,0,0,1,3.78-.51,6.6,6.6,0,0,1,3.37,1.49,8,8,0,0,1,2.29,3.2Z" fill="#fff"></path>\r\n                                            <polygon points="53.84 120.57 56.94 119.33 53.38 114.94 53.84 120.57" fill="#fff"></polygon>\r\n                                            <path d="M143.77,77.15l-1.17.47,3.64,9.08,1.21-.49a2.92,2.92,0,0,0,1.87-2,5.59,5.59,0,0,0-.47-3.49l-.25-.62a5.54,5.54,0,0,0-2.06-2.83A3,3,0,0,0,143.77,77.15Z" fill="#fff"></path>\r\n                                        </g>\r\n                                    </g>\r\n                                </g>\r\n                            </svg>\r\n\r\n\r\n                        </a>\r\n                        <span class="footer532"><a href="/request-financing/">Request Financing</a></span></div>\r\n\r\n                    <div class="footer531 item4">\r\n                        <a class="elementor-animation-bob" href="/request-hot-tub-pricing/"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 200 200">\r\n                                <title>Artboard 1 copy 8</title>\r\n                                <circle id="bigCircle" cx="100" cy="100" r="92.52" fill="transparent"></circle>\r\n                                <g>\r\n                                    <path d="M113.68,123.62a12.23,12.23,0,0,0-3-8.73q-3-3.24-10.34-6a124.54,124.54,0,0,1-12.58-5.45,40.08,40.08,0,0,1-9.06-6.23A24.73,24.73,0,0,1,72.77,89a27.68,27.68,0,0,1-2.11-11.31q0-11.31,7.23-18.53t19.2-8.43V36.37h10.7V50.89q11.85,1.66,18.54,9.87T133,82H113.68q0-8-3.31-12a11,11,0,0,0-8.87-4c-3.65,0-6.49,1-8.49,3.11s-3,4.94-3,8.6a11.32,11.32,0,0,0,2.94,8.16q2.94,3.08,10.94,6.29A121,121,0,0,1,117,98.23a37.91,37.91,0,0,1,8.7,6.42,25,25,0,0,1,5.42,8.16A28.1,28.1,0,0,1,133,123.49q0,11.37-7.09,18.46t-19.54,8.37v13.31H95.75V150.38Q82,148.91,74.51,140.65t-7.53-22H86.32q0,8,3.78,12.21T101,135.13c3.92,0,7-1,9.3-3.11A10.8,10.8,0,0,0,113.68,123.62Z" fill="#fff"></path>\r\n                                    <path d="M100,194.32A94.32,94.32,0,1,1,194.32,100,94.42,94.42,0,0,1,100,194.32ZM100,9.68A90.32,90.32,0,1,0,190.32,100,90.43,90.43,0,0,0,100,9.68Z" fill="#fff"></path>\r\n                                </g>\r\n                            </svg>\r\n\r\n                        </a>\r\n                        <span class="footer532"><a href="/request-hot-tub-pricing/">Get Pricing</a></span></div>\r\n\r\n                    <div class="footer531 item5">\r\n                        <a class="elementor-animation-bob" href="/service/"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 200 200">\r\n                                <title>Artboard 1 copy 9</title>\r\n                                <circle id="bigCircle" cx="100" cy="100" r="92.52" fill="transparent"></circle>\r\n                                <g>\r\n                                    <path d="M100,194.32A94.32,94.32,0,1,1,194.32,100,94.42,94.42,0,0,1,100,194.32ZM100,9.68A90.32,90.32,0,1,0,190.32,100,90.43,90.43,0,0,0,100,9.68Z" fill="#fff"></path>\r\n                                    <g>\r\n                                        <path d="M102.67,109.76l-2.75,2.81H95.05l-.11,5.57L71.68,141.41A8.92,8.92,0,1,1,59.07,128.8l19.17-19.16,4.09-4.1,5.58-.1v-4.88l2.81-2.75Z" fill="#fff"></path>\r\n                                        <polygon points="141.15 55.98 129.41 64.75 128.3 68.83 96.89 100.24 99.98 103.33 131.39 71.92 135.47 70.81 144.24 59.08 141.15 55.98" fill="#fff"></polygon>\r\n                                        <path d="M93.85,81.46a19.47,19.47,0,0,0-32-19.59l11.29,4.42A8.92,8.92,0,0,1,66.69,82.9L55.76,78.62a19.43,19.43,0,0,0,25.93,15.9l4,4,4.91-4.91,4.22,4L102.38,90Z" fill="#fff"></path>\r\n                                        <path d="M140.81,128.8l-31.1-31.09-7.61,7.54,4,4.22-4.91,4.91,27,27a8.92,8.92,0,1,0,12.61-12.61Zm-7.43,11a5.49,5.49,0,1,1,5.49-5.49A5.49,5.49,0,0,1,133.38,139.81Z" fill="#fff"></path>\r\n                                    </g>\r\n                                </g>\r\n                            </svg>\r\n\r\n\r\n                        </a>\r\n                        <span class="footer532"><a href="/service/">Service</a></span></div>\r\n\r\n                    <div class="footer531 item6">\r\n                        <a class="elementor-animation-bob" href="/trade-in/"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 200 200">\r\n                                <title>Artboard 1 copy 6</title>\r\n                                <circle id="bigCircle" cx="100" cy="100" r="92.52" fill="transparent"></circle>\r\n                                <g>\r\n                                    <path d="M100,194.32A94.32,94.32,0,1,1,194.32,100,94.42,94.42,0,0,1,100,194.32ZM100,9.68A90.32,90.32,0,1,0,190.32,100,90.43,90.43,0,0,0,100,9.68Z" fill="#fff"></path>\r\n                                    <g>\r\n                                        <path d="M103.17,58.19a2.46,2.46,0,0,0-.62-1.78,5.54,5.54,0,0,0-2.1-1.22,24.08,24.08,0,0,1-2.56-1.11,8.16,8.16,0,0,1-1.84-1.26,5.27,5.27,0,0,1-1.2-1.68,5.76,5.76,0,0,1-.43-2.3,5.09,5.09,0,0,1,1.47-3.77,6.24,6.24,0,0,1,3.91-1.72V40.44H102v3a5.73,5.73,0,0,1,3.77,2,6.65,6.65,0,0,1,1.36,4.32h-3.94a3.74,3.74,0,0,0-.67-2.44,2.22,2.22,0,0,0-1.8-.81A2.3,2.3,0,0,0,99,47.1a2.41,2.41,0,0,0-.61,1.75,2.3,2.3,0,0,0,.6,1.66,6.44,6.44,0,0,0,2.22,1.28A26.28,26.28,0,0,1,103.85,53a7.68,7.68,0,0,1,1.77,1.31A5.15,5.15,0,0,1,106.73,56a5.76,5.76,0,0,1,.38,2.17,5,5,0,0,1-1.45,3.75,6.31,6.31,0,0,1-4,1.71v2.7H99.53V63.63a6.52,6.52,0,0,1-4.32-2,6.39,6.39,0,0,1-1.54-4.47h3.94a3.56,3.56,0,0,0,.77,2.48,2.79,2.79,0,0,0,2.21.87,2.66,2.66,0,0,0,1.89-.64A2.19,2.19,0,0,0,103.17,58.19Z" fill="#fff"></path>\r\n                                        <path d="M100.39,74.16a20.78,20.78,0,1,1,20.78-20.78A20.8,20.8,0,0,1,100.39,74.16Zm0-37.56a16.78,16.78,0,1,0,16.78,16.78A16.8,16.8,0,0,0,100.39,36.6Z" fill="#fff"></path>\r\n                                        <g>\r\n                                            <g>\r\n                                                <circle cx="88.36" cy="114.72" r="2.75" fill="#fff"></circle>\r\n                                                <circle cx="80.01" cy="99.26" r="2.75" fill="#fff"></circle>\r\n                                                <circle cx="81.66" cy="105.42" r="2.35" fill="#fff"></circle>\r\n                                                <circle cx="81.6" cy="110.83" r="2" fill="#fff"></circle>\r\n                                                <circle cx="85.61" cy="101.26" r="2" fill="#fff"></circle>\r\n                                                <circle cx="74.14" cy="101.55" r="1.71" fill="#fff"></circle>\r\n                                                <circle cx="86.48" cy="109.09" r="1.45" fill="#fff"></circle>\r\n                                            </g>\r\n                                            <g>\r\n                                                <path d="M127.71,129.09l-27.64-10.93a2.62,2.62,0,0,0-1.91,0L70.53,129.09a2.58,2.58,0,0,0-1.64,2.41v20.38a2.6,2.6,0,0,0,1.64,2.41l27.63,10.92a2.53,2.53,0,0,0,1.91,0l27.64-10.92a2.6,2.6,0,0,0,1.64-2.41V131.5A2.58,2.58,0,0,0,127.71,129.09Zm-54,.86a2.12,2.12,0,0,1,.51-.28l24-9.49a2.38,2.38,0,0,1,1.78,0l24,9.49a1.77,1.77,0,0,1,.31.15,1.94,1.94,0,0,1,.83,2.18L108,125.2a3.59,3.59,0,0,0-5.14-2l-3.43-1.35a.72.72,0,0,0-.54,0l-6.31,2.47c-.14,0-.27,0-.41,0a3.38,3.38,0,0,0-2.55,1.2L73,132A1.87,1.87,0,0,1,73.72,130ZM100,142.77a2.48,2.48,0,0,1-1.78,0l-24-9.49-.21-.12,14.78-5.81c0,.09,0,.16,0,.25a.75.75,0,0,0,1.49,0,1.87,1.87,0,0,1,3.73,0,.74.74,0,0,0,.74.74.75.75,0,0,0,.75-.74,3.33,3.33,0,0,0-1.08-2.45l4.71-1.85,2.43,1a3.62,3.62,0,0,0-.68,2.12.74.74,0,0,0,.74.74.75.75,0,0,0,.75-.74,2.16,2.16,0,1,1,4.32,0,.74.74,0,0,0,.75.74.73.73,0,0,0,.58-.3l16.14,6.39-.14.07Z" fill="#fff"></path>\r\n                                                <path d="M87.4,129a4.15,4.15,0,0,0-4.13,4.14.75.75,0,0,0,1.49,0,2.65,2.65,0,1,1,5.29,0,.75.75,0,0,0,1.49,0A4.15,4.15,0,0,0,87.4,129Z" fill="#fff"></path>\r\n                                                <path d="M108.47,128.41a4.7,4.7,0,0,0-4.63,4.08,5.23,5.23,0,0,0-1.51-.54.8.8,0,0,0,0-.15,4.14,4.14,0,1,0-8.27,0,.75.75,0,0,0,1.49,0,2.65,2.65,0,0,1,5.29,0,.5.5,0,0,0,0,.12,5.06,5.06,0,0,0-4.5,5,.75.75,0,0,0,1.5,0,3.57,3.57,0,0,1,7.13,0,.75.75,0,1,0,1.49,0,5,5,0,0,0-1.36-3.43.76.76,0,0,0,.11-.37,3.21,3.21,0,0,1,6.42,0,.75.75,0,0,0,1.5,0A4.71,4.71,0,0,0,108.47,128.41Z" fill="#fff"></path>\r\n                                            </g>\r\n                                        </g>\r\n                                        <g>\r\n                                            <path d="M59.7,63.61a56.62,56.62,0,0,0-10.13,65.9l-6.48,4.77,18.28,8-2.22-19.82-6.32,4.66a52.65,52.65,0,0,1,9.71-60.69,2,2,0,0,0-2.84-2.81Z" fill="#fff"></path>\r\n                                            <path d="M156.91,73.12,138.69,65l2.08,19.83,6.36-4.62A52.67,52.67,0,0,1,137,140.85a2,2,0,0,0,0,2.83,2,2,0,0,0,1.42.59,2,2,0,0,0,1.41-.59,56.66,56.66,0,0,0,10.57-65.83Z" fill="#fff"></path>\r\n                                        </g>\r\n                                    </g>\r\n                                </g>\r\n                            </svg>\r\n\r\n                        </a>\r\n                        <span class="footer532"><a href="/trade-in/">Trade In</a></span></div>\r\n                    <hr class="f_sep">\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </div>\r\n<div class="footer2">\r\n<div class="container">\r\n<div class="row">\r\n<div class="col-sm-4 col-xs-12">\r\n<div class="footer211">\r\n<h2 class="foote_head">Downtown Showroom</h2>\r\n<p>701 N. Beach Ave.<br>Salinas, CA 91212</p>\r\n<p><a href="#">See Showroom</a>&nbsp; |&nbsp;&nbsp;<a href="#" target="_blank" rel="noopener">Get Directions</a></p>\r\n<div class="row">\r\n<div class="col-sm-6">Phone:</div>\r\n<div class="col-sm-6"><a href="tel:(516) 732-2345">(516) 732-2345</a></div>\r\n</div>\r\n<div class="row">\r\n<div class="col-sm-6">Fax:</div>\r\n<div class="col-sm-6">(561) 736-6068</div>\r\n</div>\r\n<div class="footer221">\r\n<p><strong>OUR STORE HOURS</strong></p>\r\n<div class="row">\r\n<div class="col-sm-6">Mon-Fri:</div>\r\n<div class="col-sm-6">10am – 6:00pm</div>\r\n</div>\r\n<div class="row">\r\n<div class="col-sm-6">Saturday:</div>\r\n<div class="col-sm-6">11am – 4:00pm</div>\r\n</div>\r\n<div class="row">\r\n<div class="col-sm-6">Sunday:</div>\r\n<div class="col-sm-6">11am – 2:00pm</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class="col-sm-4 col-xs-12">\r\n<div class="footer211">\r\n<h2 class="foote_head">Happyville Showroom</h2>\r\n<p>123 Warm Water Drive<br>Happyville, CA 55555</p>\r\n<p><a href="#">See Showroom</a>&nbsp; |&nbsp;&nbsp;<a href="#" target="_blank" rel="noopener">Get Directions</a></p>\r\n<div class="row">\r\n<div class="col-sm-6">Phone:</div>\r\n<div class="col-sm-6"><a href="tel:(516) 732-2345">(516) 732-2345</a></div>\r\n</div>\r\n<div class="row">\r\n<div class="col-sm-6">Fax:</div>\r\n<div class="col-sm-6">(561) 736-6068</div>\r\n</div>\r\n<div class="footer221">\r\n<p><strong>OUR STORE HOURS</strong></p>\r\n<div class="row">\r\n<div class="col-sm-6">Mon-Fri:</div>\r\n<div class="col-sm-6">10am – 6:00pm</div>\r\n</div>\r\n<div class="row">\r\n<div class="col-sm-6">Saturday:</div>\r\n<div class="col-sm-6">11am – 4:00pm</div>\r\n</div>\r\n<div class="row">\r\n<div class="col-sm-6">Sunday:</div>\r\n<div class="col-sm-6">11am – 2:00pm</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class="col-sm-4 col-xs-12">\r\n<div class="footer211">\r\n<h2 class="foote_head">Suburbicon Showroom</h2>\r\n<p>123 Laurel Drive<br>Suburbicon, CA 55555</p>\r\n<p><a href="#">See Showroom</a>&nbsp; |&nbsp;&nbsp;<a href="#" target="_blank" rel="noopener">Get Directions</a></p>\r\n<div class="row">\r\n<div class="col-sm-6">Phone:</div>\r\n<div class="col-sm-6"><a href="tel:(516) 732-2345">(516) 732-2345</a></div>\r\n</div>\r\n<div class="row">\r\n<div class="col-sm-6">Fax:</div>\r\n<div class="col-sm-6">(561) 736-6068</div>\r\n</div>\r\n<div class="footer221">\r\n<p><strong>OUR STORE HOURS</strong></p>\r\n<div class="row">\r\n<div class="col-sm-6">Mon-Fri:</div>\r\n<div class="col-sm-6">10am – 6:00pm</div>\r\n</div>\r\n<div class="row">\r\n<div class="col-sm-6">Saturday:</div>\r\n<div class="col-sm-6">11am – 4:00pm</div>\r\n</div>\r\n<div class="row">\r\n<div class="col-sm-6">Sunday:</div>\r\n<div class="col-sm-6">11am – 2:00pm</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class="footer3">\r\n        <div class="container">\r\n            <div class="row a-center">\r\n                <ul class="f_social_icons">\r\n                    <li class="fb"><i class="fa fa-facebook" aria-hidden="true"></i></li>\r\n                    <li class="twit"><i class="fa fa-twitter" aria-hidden="true"></i></li>\r\n                    <li class="gplus"><i class="fa fa-google-plus" aria-hidden="true"></i></li>\r\n                    <li class="houzz"><i class="fa fa-houzz" aria-hidden="true"></i></li>\r\n                    <li class="pint"><i class="fa fa-pinterest" aria-hidden="true"></i></li>\r\n                    <li class="linke"><i class="fa fa-linkedin" aria-hidden="true"></i></li>\r\n                    <li class="insta"><i class="fa fa-instagram" aria-hidden="true"></i></li>\r\n                </ul>\r\n            </div>\r\n        </div>\r\n    </div>\r\n<div class="footer4">\r\n<div class="container">\r\n<div class="row a-center">\r\n<div class="col-sm-12">\r\n<div class="copyright12">© 2018 Persuader | Site Maintained by <a href="#"><img src="{{media url=&quot;wysiwyg/design-studio.png&quot;}}" alt="">Design Studio</a></div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>', '2018-12-06 14:27:51', '2019-01-01 15:49:04', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cms_block_store`
--

CREATE TABLE IF NOT EXISTS `cms_block_store` (
  `block_id` smallint(6) NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  PRIMARY KEY (`block_id`,`store_id`),
  KEY `CMS_BLOCK_STORE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS Block To Store Linkage Table';

--
-- Dumping data for table `cms_block_store`
--

INSERT INTO `cms_block_store` (`block_id`, `store_id`) VALUES
(1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cms_page`
--

CREATE TABLE IF NOT EXISTS `cms_page` (
  `page_id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `title` varchar(255) DEFAULT NULL COMMENT 'Page Title',
  `page_layout` varchar(255) DEFAULT NULL COMMENT 'Page Layout',
  `meta_keywords` text COMMENT 'Page Meta Keywords',
  `meta_description` text COMMENT 'Page Meta Description',
  `identifier` varchar(100) DEFAULT NULL COMMENT 'Page String Identifier',
  `content_heading` varchar(255) DEFAULT NULL COMMENT 'Page Content Heading',
  `content` mediumtext COMMENT 'Page Content',
  `creation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Page Creation Time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Page Modification Time',
  `is_active` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Is Page Active',
  `sort_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Page Sort Order',
  `layout_update_xml` text COMMENT 'Page Layout Update Content',
  `custom_theme` varchar(100) DEFAULT NULL COMMENT 'Page Custom Theme',
  `custom_root_template` varchar(255) DEFAULT NULL COMMENT 'Page Custom Template',
  `custom_layout_update_xml` text COMMENT 'Page Custom Layout Update Content',
  `custom_theme_from` date DEFAULT NULL COMMENT 'Page Custom Theme Active From Date',
  `custom_theme_to` date DEFAULT NULL COMMENT 'Page Custom Theme Active To Date',
  `meta_title` varchar(255) DEFAULT NULL COMMENT 'Page Meta Title',
  PRIMARY KEY (`page_id`),
  KEY `CMS_PAGE_IDENTIFIER` (`identifier`),
  FULLTEXT KEY `CMS_PAGE_TITLE_META_KEYWORDS_META_DESCRIPTION_IDENTIFIER_CONTENT` (`title`,`meta_keywords`,`meta_description`,`identifier`,`content`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='CMS Page Table' AUTO_INCREMENT=6 ;

--
-- Dumping data for table `cms_page`
--

INSERT INTO `cms_page` (`page_id`, `title`, `page_layout`, `meta_keywords`, `meta_description`, `identifier`, `content_heading`, `content`, `creation_time`, `update_time`, `is_active`, `sort_order`, `layout_update_xml`, `custom_theme`, `custom_root_template`, `custom_layout_update_xml`, `custom_theme_from`, `custom_theme_to`, `meta_title`) VALUES
(1, '404 Not Found', '2columns-right', 'Page keywords', 'Page description', 'no-route', 'Whoops, our bad...', '<dl>\r\n<dt>The page you requested was not found, and we have a fine guess why.</dt>\r\n<dd>\r\n<ul class="disc">\r\n<li>If you typed the URL directly, please make sure the spelling is correct.</li>\r\n<li>If you clicked on a link to get here, the link is outdated.</li>\r\n</ul></dd>\r\n</dl>\r\n<dl>\r\n<dt>What can you do?</dt>\r\n<dd>Have no fear, help is near! There are many ways you can get back on track with Magento Store.</dd>\r\n<dd>\r\n<ul class="disc">\r\n<li><a href="#" onclick="history.go(-1); return false;">Go back</a> to the previous page.</li>\r\n<li>Use the search bar at the top of the page to search for your products.</li>\r\n<li>Follow these links to get you back on track!<br /><a href="{{store url=""}}">Store Home</a> <span class="separator">|</span> <a href="{{store url="customer/account"}}">My Account</a></li></ul></dd></dl>\r\n', '2018-12-06 05:00:02', '2018-12-06 05:00:02', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'Home page', 'full-width', '', '', 'home', 'Home Page', '<div class="elementor-html5-video"><video autoplay="autoplay" loop="loop" muted="muted" width="100%" height="720"><source src="https://v2.myproductdata.com/wp-content/uploads/hotspring-caldera-endless-fitness-aspot-video-01.mp4" type="video/mp4">\r\n    Your browser does not support the video tag.</video>\r\n<div class="promotion-video-text">\r\n<h1>Your Dream Backyard Starts Here&nbsp;</h1>\r\n</div>\r\n</div>\r\n\r\n<div class="featured_pro">\r\n<div class="container">\r\n<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mar_b30 acces">\r\n<h3 class="section_title">Featured Hot Tubs</h3>\r\n</div>\r\n{{block class="Magento\\Catalog\\Block\\Product\\ListProduct" template="Magento_Catalog::product/featuredlist.phtml"}}</div>\r\n</div>\r\n<div class="h_accessories">\r\n<div class="container">\r\n<div class="row">\r\n<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mar_b30 acces">\r\n<h3 class="section_title">Featured Accessories</h3>\r\n</div>\r\n<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 mar_b30 acces"><img src="{{media url=''wysiwyg/service/1000x1000-everwood-hd-steps-mocha.jpg''}}" alt=""><br>Hot spring 32" Everwood Spa Steps</div>\r\n<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 mar_b30 acces"><img src="{{media url=''wysiwyg/service/1000x1000-vanishing-act-calcium-remover.jpg''}}" alt=""><br>Vaniishing Act Calcium Remover</div>\r\n<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 mar_b30 acces"><img src="{{media url=''wysiwyg/service/1000x1000-clean-screen-prefilter.jpg''}}" alt=""><br>Hot Spring Clean Screen Pre-Filter</div>\r\n<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 mar_b30 acces"><img src="{{media url=''wysiwyg/service/1000x1000-silver-ion-sanitizer.jpg''}}" alt=""><br>Continuous Silver Ion (AG+) Purifier</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class="h_complementary">\r\n<div class="container">\r\n<div class="row">\r\n<div class="col-sm-12 col-lg-12">\r\n<div id="h_complement" class="h_complement owl-carousel owl-theme">\r\n<div class="items d-flex align-items-center justify-content-center">\r\n<div class="col-md-6 col-sm-12 h_complement_content a-right">\r\n<h2>Explore Our Virtual <span style="display: inline-block;">Hot Tub Showroom</span></h2>\r\n<p>We are Relaxing the world, one backyard at a time with an energy efficient Hot Spring Portable Spa or Caldera hot Tub- the world’s leading hot tub brands.</p>\r\n<a class="btn btn-primary" tabindex="-1" href="/hot-tubs/">Explore Hot Tubs</a></div>\r\n<div class="col-md-6 col-sm-12 pt-2"><img src="{{media url=''wysiwyg/service/virtual-showroom-circles.png''}}" alt="Explore Hot Tubs" width="600" height="471"></div>\r\n</div>\r\n<div class="items d-flex align-items-center justify-content-center">\r\n<div class="col-md-6 col-sm-12 pt-2"><img src="{{media url=''wysiwyg/service/accessories-circles.png''}}" alt="Outdoor Accessories" width="558" height="428"></div>\r\n<div class="col-md-6 col-sm-12 pt-2 h_complement_content">\r\n<h2>Add Complementary Accessories</h2>\r\n<p>Enhance your backyard with outdoor accessories such as Patio Furniture and Spa Bars, The Covana Gazebo, Bluetooth music systems and more!</p>\r\n<a class="btn btn-primary" tabindex="-1" href="/spa-accessories/">Outdoor Accessories</a></div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n\r\n', '2018-12-06 05:00:02', '2019-01-01 16:52:22', 1, 0, '<!--\r\n    <referenceContainer name="right">\r\n        <referenceBlock name="catalog.compare.sidebar" remove="true" />\r\n    </referenceContainer>-->', '', '', NULL, NULL, NULL, ''),
(3, 'Enable Cookies', '1column', NULL, NULL, 'enable-cookies', 'What are Cookies?', '<div class="enable-cookies cms-content">\r\n<p>"Cookies" are little pieces of data we send when you visit our store. Cookies help us get to know you better and personalize your experience. Plus they help protect you and other shoppers from fraud.</p>\r\n<p style="margin-bottom: 20px;">Set your browser to accept cookies so you can buy items, save items, and receive customized recommendations. Here’s how:</p>\r\n<ul>\r\n<li><a href="https://support.google.com/accounts/answer/61416?hl=en" target="_blank">Google Chrome</a></li>\r\n<li><a href="http://windows.microsoft.com/en-us/internet-explorer/delete-manage-cookies" target="_blank">Internet Explorer</a></li>\r\n<li><a href="http://support.apple.com/kb/PH19214" target="_blank">Safari</a></li>\r\n<li><a href="https://support.mozilla.org/en-US/kb/enable-and-disable-cookies-website-preferences" target="_blank">Mozilla/Firefox</a></li>\r\n</ul>\r\n</div>', '2018-12-06 05:00:02', '2018-12-06 05:00:02', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'Privacy and Cookie Policy', '1column', NULL, NULL, 'privacy-policy-cookie-restriction-mode', 'Privacy and Cookie Policy', '<div class="privacy-policy cms-content">\n    <div class="message info">\n        <span>\n            Please replace this text with you Privacy Policy.\n            Please add any additional cookies your website uses below (e.g. Google Analytics).\n        </span>\n    </div>\n    <p>\n        This privacy policy sets out how this website (hereafter "the Store") uses and protects any information that\n        you give the Store while using this website. The Store is committed to ensuring that your privacy is protected.\n        Should we ask you to provide certain information by which you can be identified when using this website, then\n        you can be assured that it will only be used in accordance with this privacy statement. The Store may change\n        this policy from time to time by updating this page. You should check this page from time to time to ensure\n        that you are happy with any changes.\n    </p>\n    <h2>What we collect</h2>\n    <p>We may collect the following information:</p>\n    <ul>\n        <li>name</li>\n        <li>contact information including email address</li>\n        <li>demographic information such as postcode, preferences and interests</li>\n        <li>other information relevant to customer surveys and/or offers</li>\n    </ul>\n    <p>\n        For the exhaustive list of cookies we collect see the <a href="#list">List of cookies we collect</a> section.\n    </p>\n    <h2>What we do with the information we gather</h2>\n    <p>\n        We require this information to understand your needs and provide you with a better service,\n        and in particular for the following reasons:\n    </p>\n    <ul>\n        <li>Internal record keeping.</li>\n        <li>We may use the information to improve our products and services.</li>\n        <li>\n            We may periodically send promotional emails about new products, special offers or other information which we\n            think you may find interesting using the email address which you have provided.\n        </li>\n        <li>\n            From time to time, we may also use your information to contact you for market research purposes.\n            We may contact you by email, phone, fax or mail. We may use the information to customise the website\n            according to your interests.\n        </li>\n    </ul>\n    <h2>Security</h2>\n    <p>\n        We are committed to ensuring that your information is secure. In order to prevent unauthorised access or\n        disclosure, we have put in place suitable physical, electronic and managerial procedures to safeguard and\n        secure the information we collect online.\n    </p>\n    <h2>How we use cookies</h2>\n    <p>\n        A cookie is a small file which asks permission to be placed on your computer''s hard drive.\n        Once you agree, the file is added and the cookie helps analyse web traffic or lets you know when you visit\n        a particular site. Cookies allow web applications to respond to you as an individual. The web application\n        can tailor its operations to your needs, likes and dislikes by gathering and remembering information about\n        your preferences.\n    </p>\n    <p>\n        We use traffic log cookies to identify which pages are being used. This helps us analyse data about web page\n        traffic and improve our website in order to tailor it to customer needs. We only use this information for\n        statistical analysis purposes and then the data is removed from the system.\n    </p>\n    <p>\n        Overall, cookies help us provide you with a better website, by enabling us to monitor which pages you find\n        useful and which you do not. A cookie in no way gives us access to your computer or any information about you,\n        other than the data you choose to share with us. You can choose to accept or decline cookies.\n        Most web browsers automatically accept cookies, but you can usually modify your browser setting\n        to decline cookies if you prefer. This may prevent you from taking full advantage of the website.\n    </p>\n    <h2>Links to other websites</h2>\n    <p>\n        Our website may contain links to other websites of interest. However, once you have used these links\n        to leave our site, you should note that we do not have any control over that other website.\n        Therefore, we cannot be responsible for the protection and privacy of any information which you provide whilst\n        visiting such sites and such sites are not governed by this privacy statement.\n        You should exercise caution and look at the privacy statement applicable to the website in question.\n    </p>\n    <h2>Controlling your personal information</h2>\n    <p>You may choose to restrict the collection or use of your personal information in the following ways:</p>\n    <ul>\n        <li>\n            whenever you are asked to fill in a form on the website, look for the box that you can click to indicate\n            that you do not want the information to be used by anybody for direct marketing purposes\n        </li>\n        <li>\n            if you have previously agreed to us using your personal information for direct marketing purposes,\n            you may change your mind at any time by letting us know using our Contact Us information\n        </li>\n    </ul>\n    <p>\n        We will not sell, distribute or lease your personal information to third parties unless we have your permission\n        or are required by law to do so. We may use your personal information to send you promotional information\n        about third parties which we think you may find interesting if you tell us that you wish this to happen.\n    </p>\n    <p>\n        You may request details of personal information which we hold about you under the Data Protection Act 1998.\n        A small fee will be payable. If you would like a copy of the information held on you please email us this\n        request using our Contact Us information.\n    </p>\n    <p>\n        If you believe that any information we are holding on you is incorrect or incomplete,\n        please write to or email us as soon as possible, at the above address.\n        We will promptly correct any information found to be incorrect.\n    </p>\n    <h2><a name="list"></a>List of cookies we collect</h2>\n    <p>The table below lists the cookies we collect and what information they store.</p>\n    <table class="data-table data-table-definition-list">\n        <thead>\n        <tr>\n            <th>Cookie Name</th>\n            <th>Cookie Description</th>\n        </tr>\n        </thead>\n        <tbody>\n            <tr>\n                <th>FORM_KEY</th>\n                <td>Stores randomly generated key used to prevent forged requests.</td>\n            </tr>\n            <tr>\n                <th>PHPSESSID</th>\n                <td>Your session ID on the server.</td>\n            </tr>\n            <tr>\n                <th>GUEST-VIEW</th>\n                <td>Allows guests to view and edit their orders.</td>\n            </tr>\n            <tr>\n                <th>PERSISTENT_SHOPPING_CART</th>\n                <td>A link to information about your cart and viewing history, if you have asked for this.</td>\n            </tr>\n            <tr>\n                <th>STF</th>\n                <td>Information on products you have emailed to friends.</td>\n            </tr>\n            <tr>\n                <th>STORE</th>\n                <td>The store view or language you have selected.</td>\n            </tr>\n            <tr>\n                <th>USER_ALLOWED_SAVE_COOKIE</th>\n                <td>Indicates whether a customer allowed to use cookies.</td>\n            </tr>\n            <tr>\n                <th>MAGE-CACHE-SESSID</th>\n                <td>Facilitates caching of content on the browser to make pages load faster.</td>\n            </tr>\n            <tr>\n                <th>MAGE-CACHE-STORAGE</th>\n                <td>Facilitates caching of content on the browser to make pages load faster.</td>\n            </tr>\n            <tr>\n                <th>MAGE-CACHE-STORAGE-SECTION-INVALIDATION</th>\n                <td>Facilitates caching of content on the browser to make pages load faster.</td>\n            </tr>\n            <tr>\n                <th>MAGE-CACHE-TIMEOUT</th>\n                <td>Facilitates caching of content on the browser to make pages load faster.</td>\n            </tr>\n            <tr>\n                <th>SECTION-DATA-IDS</th>\n                <td>Facilitates caching of content on the browser to make pages load faster.</td>\n            </tr>\n            <tr>\n                <th>PRIVATE_CONTENT_VERSION</th>\n                <td>Facilitates caching of content on the browser to make pages load faster.</td>\n            </tr>\n            <tr>\n                <th>X-MAGENTO-VARY</th>\n                <td>Facilitates caching of content on the server to make pages load faster.</td>\n            </tr>\n            <tr>\n                <th>MAGE-TRANSLATION-FILE-VERSION</th>\n                <td>Facilitates translation of content to other languages.</td>\n            </tr>\n            <tr>\n                <th>MAGE-TRANSLATION-STORAGE</th>\n                <td>Facilitates translation of content to other languages.</td>\n            </tr>\n        </tbody>\n    </table>\n</div>', '2018-12-06 05:00:02', '2018-12-06 05:00:02', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'New Home', '1column', '', '', 'new-home', '', '', '2019-01-02 04:03:54', '2019-01-02 04:03:54', 1, 0, '', '', '', NULL, NULL, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `cms_page_store`
--

CREATE TABLE IF NOT EXISTS `cms_page_store` (
  `page_id` smallint(6) NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  PRIMARY KEY (`page_id`,`store_id`),
  KEY `CMS_PAGE_STORE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS Page To Store Linkage Table';

--
-- Dumping data for table `cms_page_store`
--

INSERT INTO `cms_page_store` (`page_id`, `store_id`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(5, 0);

-- --------------------------------------------------------

--
-- Table structure for table `core_config_data`
--

CREATE TABLE IF NOT EXISTS `core_config_data` (
  `config_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Config Id',
  `scope` varchar(8) NOT NULL DEFAULT 'default' COMMENT 'Config Scope',
  `scope_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Config Scope Id',
  `path` varchar(255) NOT NULL DEFAULT 'general' COMMENT 'Config Path',
  `value` text COMMENT 'Config Value',
  PRIMARY KEY (`config_id`),
  UNIQUE KEY `CORE_CONFIG_DATA_SCOPE_SCOPE_ID_PATH` (`scope`,`scope_id`,`path`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Config Data' AUTO_INCREMENT=84 ;

--
-- Dumping data for table `core_config_data`
--

INSERT INTO `core_config_data` (`config_id`, `scope`, `scope_id`, `path`, `value`) VALUES
(1, 'default', 0, 'web/seo/use_rewrites', '1'),
(2, 'default', 0, 'web/unsecure/base_url', 'http://yogalifeonline.com/'),
(3, 'default', 0, 'web/secure/base_url', 'http://yogalifeonline.com/'),
(4, 'default', 0, 'general/locale/code', 'en_US'),
(5, 'default', 0, 'web/secure/use_in_frontend', '0'),
(6, 'default', 0, 'web/secure/use_in_adminhtml', '0'),
(7, 'default', 0, 'general/locale/timezone', 'UTC'),
(8, 'default', 0, 'currency/options/base', 'USD'),
(9, 'default', 0, 'currency/options/default', 'USD'),
(10, 'default', 0, 'currency/options/allow', 'USD'),
(11, 'default', 0, 'general/region/display_all', '1'),
(12, 'default', 0, 'general/region/state_required', 'BR,CA,CH,EE,ES,HR,IN,LT,LV,RO,US'),
(13, 'default', 0, 'catalog/category/root_id', '2'),
(14, 'default', 0, 'msp_securitysuite_twofactorauth/duo/application_key', 'KVlCq3VX2GT46ejW3d6tmW4FghkrMzwkno9k2fyk1D7V6T9zlPenUQEAN4llU3DC'),
(15, 'default', 0, 'analytics/subscription/enabled', '1'),
(16, 'default', 0, 'crontab/default/jobs/analytics_subscribe/schedule/cron_expr', '0 * * * *'),
(17, 'website', 0, 'connector_configuration/transactional_data/order_statuses', 'canceled,closed,complete,fraud,holded,payment_review,paypal_canceled_reversal,paypal_reversed,pending,pending_payment,pending_paypal,processing'),
(18, 'website', 0, 'connector_configuration/catalog_sync/catalog_type', 'simple,virtual,configurable,downloadable,grouped,bundle'),
(19, 'website', 0, 'connector_configuration/catalog_sync/catalog_visibility', '1,2,3,4'),
(20, 'default', 0, 'connector_dynamic_content/external_dynamic_content_urls/passcode', 'HSiyeMut66BVmAL4clYgQZFt0gfmDhAv'),
(21, 'default', 0, 'connector_automation/review_settings/allow_non_subscribers', '1'),
(22, 'default', 0, 'connector_configuration/abandoned_carts/allow_non_subscribers', '1'),
(23, 'default', 0, 'sync_settings/addressbook/allow_non_subscribers', '1'),
(24, 'stores', 1, 'design/theme/theme_id', '2'),
(25, 'stores', 1, 'design/pagination/pagination_frame_skip', NULL),
(26, 'stores', 1, 'design/pagination/anchor_text_for_previous', NULL),
(27, 'stores', 1, 'design/pagination/anchor_text_for_next', NULL),
(28, 'stores', 1, 'design/head/title_prefix', NULL),
(29, 'stores', 1, 'design/head/title_suffix', NULL),
(30, 'stores', 1, 'design/head/default_description', NULL),
(31, 'stores', 1, 'design/head/default_keywords', NULL),
(32, 'stores', 1, 'design/head/includes', NULL),
(33, 'stores', 1, 'design/header/logo_width', NULL),
(34, 'stores', 1, 'design/header/logo_height', NULL),
(35, 'stores', 1, 'design/header/logo_alt', NULL),
(36, 'stores', 1, 'design/footer/absolute_footer', NULL),
(37, 'stores', 1, 'design/search_engine_robots/custom_instructions', NULL),
(38, 'stores', 1, 'design/watermark/image_size', NULL),
(39, 'stores', 1, 'design/watermark/image_imageOpacity', NULL),
(40, 'stores', 1, 'design/watermark/small_image_size', NULL),
(41, 'stores', 1, 'design/watermark/small_image_imageOpacity', NULL),
(42, 'stores', 1, 'design/watermark/thumbnail_size', NULL),
(43, 'stores', 1, 'design/watermark/thumbnail_imageOpacity', NULL),
(44, 'stores', 1, 'design/email/logo_alt', NULL),
(45, 'stores', 1, 'design/email/logo_width', NULL),
(46, 'stores', 1, 'design/email/logo_height', NULL),
(47, 'stores', 1, 'design/watermark/swatch_image_size', NULL),
(48, 'stores', 1, 'design/watermark/swatch_image_imageOpacity', NULL),
(49, 'default', 0, 'admin/security/use_case_sensitive_login', '0'),
(50, 'default', 0, 'admin/security/session_lifetime', '365500'),
(51, 'default', 0, 'dev/restrict/allow_ips', NULL),
(52, 'default', 0, 'dev/template/allow_symlink', '0'),
(53, 'default', 0, 'dev/debug/template_hints_storefront', '1'),
(54, 'default', 0, 'dev/debug/template_hints_storefront_show_with_parameter', '0'),
(55, 'default', 0, 'dev/debug/template_hints_admin', '0'),
(56, 'default', 0, 'dev/debug/template_hints_blocks', '0'),
(57, 'default', 0, 'dev/debug/debug_logging', '0'),
(58, 'default', 0, 'dev/translate_inline/active', '0'),
(59, 'default', 0, 'dev/translate_inline/active_admin', '0'),
(60, 'default', 0, 'dev/syslog/syslog_logging', '0'),
(61, 'default', 0, 'dev/js/merge_files', '0'),
(62, 'default', 0, 'dev/js/enable_js_bundling', '0'),
(63, 'default', 0, 'dev/js/minify_files', '0'),
(64, 'default', 0, 'dev/css/merge_css_files', '0'),
(65, 'default', 0, 'dev/css/minify_files', '0'),
(66, 'default', 0, 'dev/static/sign', '0'),
(67, 'stores', 1, 'dev/debug/template_hints_storefront', '0'),
(68, 'stores', 1, 'design/head/default_title', 'Home page'),
(69, 'stores', 1, 'dev/debug/template_hints_blocks', '1'),
(70, 'default', 0, 'cms/wysiwyg/enabled', 'hidden'),
(71, 'default', 0, 'cms/wysiwyg/editor', 'mage/adminhtml/wysiwyg/tiny_mce/tinymce4Adapter'),
(72, 'default', 0, 'cms/wysiwyg/use_static_urls_in_catalog', '0'),
(73, 'default', 0, 'web/unsecure/base_static_url', NULL),
(74, 'default', 0, 'web/unsecure/base_media_url', NULL),
(75, 'default', 0, 'web/secure/base_static_url', NULL),
(76, 'default', 0, 'web/secure/base_media_url', NULL),
(77, 'default', 0, 'web/default/cms_home_page', 'new-home'),
(78, 'default', 0, 'web/default_layouts/default_product_layout', NULL),
(79, 'default', 0, 'web/default_layouts/default_category_layout', NULL),
(80, 'default', 0, 'web/default_layouts/default_cms_layout', '1column'),
(81, 'default', 0, 'web/cookie/cookie_path', NULL),
(82, 'default', 0, 'web/cookie/cookie_domain', NULL),
(83, 'default', 0, 'web/cookie/cookie_httponly', '1');

-- --------------------------------------------------------

--
-- Table structure for table `cron_schedule`
--

CREATE TABLE IF NOT EXISTS `cron_schedule` (
  `schedule_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Schedule Id',
  `job_code` varchar(255) NOT NULL DEFAULT '0' COMMENT 'Job Code',
  `status` varchar(7) NOT NULL DEFAULT 'pending' COMMENT 'Status',
  `messages` text COMMENT 'Messages',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `scheduled_at` timestamp NULL DEFAULT NULL COMMENT 'Scheduled At',
  `executed_at` timestamp NULL DEFAULT NULL COMMENT 'Executed At',
  `finished_at` timestamp NULL DEFAULT NULL COMMENT 'Finished At',
  PRIMARY KEY (`schedule_id`),
  KEY `CRON_SCHEDULE_JOB_CODE` (`job_code`),
  KEY `CRON_SCHEDULE_SCHEDULED_AT_STATUS` (`scheduled_at`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cron Schedule' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `customer_address_entity`
--

CREATE TABLE IF NOT EXISTS `customer_address_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `parent_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `is_active` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Active',
  `city` varchar(255) NOT NULL COMMENT 'City',
  `company` varchar(255) DEFAULT NULL COMMENT 'Company',
  `country_id` varchar(255) NOT NULL COMMENT 'Country',
  `fax` varchar(255) DEFAULT NULL COMMENT 'Fax',
  `firstname` varchar(255) NOT NULL COMMENT 'First Name',
  `lastname` varchar(255) NOT NULL COMMENT 'Last Name',
  `middlename` varchar(255) DEFAULT NULL COMMENT 'Middle Name',
  `postcode` varchar(255) DEFAULT NULL COMMENT 'Zip/Postal Code',
  `prefix` varchar(40) DEFAULT NULL COMMENT 'Name Prefix',
  `region` varchar(255) DEFAULT NULL COMMENT 'State/Province',
  `region_id` int(10) unsigned DEFAULT NULL COMMENT 'State/Province',
  `street` text NOT NULL COMMENT 'Street Address',
  `suffix` varchar(40) DEFAULT NULL COMMENT 'Name Suffix',
  `telephone` varchar(255) NOT NULL COMMENT 'Phone Number',
  `vat_id` varchar(255) DEFAULT NULL COMMENT 'VAT number',
  `vat_is_valid` int(10) unsigned DEFAULT NULL COMMENT 'VAT number validity',
  `vat_request_date` varchar(255) DEFAULT NULL COMMENT 'VAT number validation request date',
  `vat_request_id` varchar(255) DEFAULT NULL COMMENT 'VAT number validation request ID',
  `vat_request_success` int(10) unsigned DEFAULT NULL COMMENT 'VAT number validation request success',
  PRIMARY KEY (`entity_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_PARENT_ID` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `customer_address_entity_datetime`
--

CREATE TABLE IF NOT EXISTS `customer_address_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` datetime DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ADDRESS_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity Datetime' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `customer_address_entity_decimal`
--

CREATE TABLE IF NOT EXISTS `customer_address_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ADDRESS_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity Decimal' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `customer_address_entity_int`
--

CREATE TABLE IF NOT EXISTS `customer_address_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` int(11) NOT NULL DEFAULT '0' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ADDRESS_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity Int' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `customer_address_entity_text`
--

CREATE TABLE IF NOT EXISTS `customer_address_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` text NOT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ADDRESS_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity Text' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `customer_address_entity_varchar`
--

CREATE TABLE IF NOT EXISTS `customer_address_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ADDRESS_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity Varchar' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `customer_eav_attribute`
--

CREATE TABLE IF NOT EXISTS `customer_eav_attribute` (
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute Id',
  `is_visible` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Visible',
  `input_filter` varchar(255) DEFAULT NULL COMMENT 'Input Filter',
  `multiline_count` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Multiline Count',
  `validate_rules` text COMMENT 'Validate Rules',
  `is_system` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is System',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `data_model` varchar(255) DEFAULT NULL COMMENT 'Data Model',
  `is_used_in_grid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Used in Grid',
  `is_visible_in_grid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible in Grid',
  `is_filterable_in_grid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Filterable in Grid',
  `is_searchable_in_grid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Searchable in Grid',
  PRIMARY KEY (`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Eav Attribute';

--
-- Dumping data for table `customer_eav_attribute`
--

INSERT INTO `customer_eav_attribute` (`attribute_id`, `is_visible`, `input_filter`, `multiline_count`, `validate_rules`, `is_system`, `sort_order`, `data_model`, `is_used_in_grid`, `is_visible_in_grid`, `is_filterable_in_grid`, `is_searchable_in_grid`) VALUES
(1, 1, NULL, 0, NULL, 1, 10, NULL, 1, 1, 1, 0),
(2, 0, NULL, 0, NULL, 1, 0, NULL, 0, 0, 0, 0),
(3, 1, NULL, 0, NULL, 1, 20, NULL, 1, 1, 0, 1),
(4, 0, NULL, 0, NULL, 0, 30, NULL, 0, 0, 0, 0),
(5, 1, 'trim', 0, '{"max_text_length":255,"min_text_length":1}', 1, 40, NULL, 0, 0, 0, 0),
(6, 0, 'trim', 0, NULL, 0, 50, NULL, 0, 0, 0, 0),
(7, 1, 'trim', 0, '{"max_text_length":255,"min_text_length":1}', 1, 60, NULL, 0, 0, 0, 0),
(8, 0, NULL, 0, NULL, 0, 70, NULL, 0, 0, 0, 0),
(9, 1, NULL, 0, '{"input_validation":"email"}', 1, 80, NULL, 1, 1, 1, 1),
(10, 1, NULL, 0, NULL, 1, 25, NULL, 1, 1, 1, 0),
(11, 0, 'date', 0, '{"input_validation":"date"}', 0, 90, NULL, 1, 1, 1, 0),
(12, 0, NULL, 0, NULL, 1, 0, NULL, 0, 0, 0, 0),
(13, 0, NULL, 0, NULL, 1, 0, NULL, 0, 0, 0, 0),
(14, 0, NULL, 0, '{"input_validation":"date"}', 1, 0, NULL, 0, 0, 0, 0),
(15, 0, NULL, 0, NULL, 1, 0, NULL, 0, 0, 0, 0),
(16, 0, NULL, 0, NULL, 1, 0, NULL, 0, 0, 0, 0),
(17, 0, NULL, 0, '{"max_text_length":255}', 0, 100, NULL, 1, 1, 0, 1),
(18, 0, NULL, 0, NULL, 1, 0, NULL, 1, 1, 1, 0),
(19, 0, NULL, 0, NULL, 0, 0, NULL, 1, 1, 1, 0),
(20, 0, NULL, 0, '[]', 0, 110, NULL, 1, 1, 1, 0),
(21, 1, NULL, 0, NULL, 1, 28, NULL, 0, 0, 0, 0),
(22, 0, NULL, 0, NULL, 0, 10, NULL, 0, 0, 0, 0),
(23, 1, 'trim', 0, '{"max_text_length":255,"min_text_length":1}', 1, 20, NULL, 1, 0, 0, 1),
(24, 0, 'trim', 0, NULL, 0, 30, NULL, 0, 0, 0, 0),
(25, 1, 'trim', 0, '{"max_text_length":255,"min_text_length":1}', 1, 40, NULL, 1, 0, 0, 1),
(26, 0, NULL, 0, NULL, 0, 50, NULL, 0, 0, 0, 0),
(27, 1, NULL, 0, '{"max_text_length":255,"min_text_length":1}', 1, 60, NULL, 1, 0, 0, 1),
(28, 1, NULL, 3, '{"max_text_length":255,"min_text_length":1}', 1, 70, NULL, 1, 0, 0, 1),
(29, 1, NULL, 0, '{"max_text_length":255,"min_text_length":1}', 1, 80, NULL, 1, 0, 0, 1),
(30, 1, NULL, 0, NULL, 1, 90, NULL, 1, 1, 1, 0),
(31, 1, NULL, 0, NULL, 1, 100, NULL, 1, 1, 0, 1),
(32, 1, NULL, 0, NULL, 1, 100, NULL, 0, 0, 0, 0),
(33, 1, NULL, 0, '[]', 1, 110, 'Magento\\Customer\\Model\\Attribute\\Data\\Postcode', 1, 1, 1, 1),
(34, 1, NULL, 0, '{"max_text_length":255,"min_text_length":1}', 1, 120, NULL, 1, 1, 1, 1),
(35, 0, NULL, 0, '{"max_text_length":255,"min_text_length":1}', 0, 130, NULL, 1, 0, 0, 1),
(36, 1, NULL, 0, NULL, 1, 140, NULL, 0, 0, 0, 0),
(37, 0, NULL, 0, NULL, 1, 0, NULL, 0, 0, 0, 0),
(38, 0, NULL, 0, NULL, 1, 0, NULL, 0, 0, 0, 0),
(39, 0, NULL, 0, NULL, 1, 0, NULL, 0, 0, 0, 0),
(40, 0, NULL, 0, NULL, 1, 0, NULL, 0, 0, 0, 0),
(41, 0, NULL, 0, NULL, 0, 0, NULL, 0, 0, 0, 0),
(42, 0, NULL, 0, NULL, 1, 0, NULL, 0, 0, 0, 0),
(43, 0, NULL, 0, NULL, 1, 0, NULL, 0, 0, 0, 0),
(44, 0, NULL, 0, NULL, 1, 0, NULL, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `customer_eav_attribute_website`
--

CREATE TABLE IF NOT EXISTS `customer_eav_attribute_website` (
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `is_visible` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Visible',
  `is_required` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Required',
  `default_value` text COMMENT 'Default Value',
  `multiline_count` smallint(5) unsigned DEFAULT NULL COMMENT 'Multiline Count',
  PRIMARY KEY (`attribute_id`,`website_id`),
  KEY `CUSTOMER_EAV_ATTRIBUTE_WEBSITE_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Eav Attribute Website';

--
-- Dumping data for table `customer_eav_attribute_website`
--

INSERT INTO `customer_eav_attribute_website` (`attribute_id`, `website_id`, `is_visible`, `is_required`, `default_value`, `multiline_count`) VALUES
(1, 1, NULL, NULL, NULL, NULL),
(3, 1, NULL, NULL, NULL, NULL),
(5, 1, NULL, NULL, NULL, NULL),
(6, 1, NULL, NULL, NULL, NULL),
(7, 1, NULL, NULL, NULL, NULL),
(9, 1, NULL, NULL, NULL, NULL),
(10, 1, NULL, NULL, NULL, NULL),
(11, 1, NULL, NULL, NULL, NULL),
(17, 1, NULL, NULL, NULL, NULL),
(18, 1, NULL, NULL, NULL, NULL),
(19, 1, NULL, NULL, NULL, NULL),
(20, 1, NULL, NULL, NULL, NULL),
(21, 1, NULL, NULL, NULL, NULL),
(23, 1, NULL, NULL, NULL, NULL),
(24, 1, NULL, NULL, NULL, NULL),
(25, 1, NULL, NULL, NULL, NULL),
(27, 1, NULL, NULL, NULL, NULL),
(28, 1, NULL, NULL, NULL, NULL),
(29, 1, NULL, NULL, NULL, NULL),
(30, 1, NULL, NULL, NULL, NULL),
(31, 1, NULL, NULL, NULL, NULL),
(32, 1, NULL, NULL, NULL, NULL),
(33, 1, NULL, NULL, NULL, NULL),
(34, 1, NULL, NULL, NULL, NULL),
(35, 1, NULL, NULL, NULL, NULL),
(36, 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_entity`
--

CREATE TABLE IF NOT EXISTS `customer_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `website_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Website Id',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `group_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Group Id',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `store_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Store Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `is_active` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Active',
  `disable_auto_group_change` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Disable automatic group change based on VAT ID',
  `created_in` varchar(255) DEFAULT NULL COMMENT 'Created From',
  `prefix` varchar(40) DEFAULT NULL COMMENT 'Name Prefix',
  `firstname` varchar(255) DEFAULT NULL COMMENT 'First Name',
  `middlename` varchar(255) DEFAULT NULL COMMENT 'Middle Name/Initial',
  `lastname` varchar(255) DEFAULT NULL COMMENT 'Last Name',
  `suffix` varchar(40) DEFAULT NULL COMMENT 'Name Suffix',
  `dob` date DEFAULT NULL COMMENT 'Date of Birth',
  `password_hash` varchar(128) DEFAULT NULL COMMENT 'Password_hash',
  `rp_token` varchar(128) DEFAULT NULL COMMENT 'Reset password token',
  `rp_token_created_at` datetime DEFAULT NULL COMMENT 'Reset password token creation time',
  `default_billing` int(10) unsigned DEFAULT NULL COMMENT 'Default Billing Address',
  `default_shipping` int(10) unsigned DEFAULT NULL COMMENT 'Default Shipping Address',
  `taxvat` varchar(50) DEFAULT NULL COMMENT 'Tax/VAT Number',
  `confirmation` varchar(64) DEFAULT NULL COMMENT 'Is Confirmed',
  `gender` smallint(5) unsigned DEFAULT NULL COMMENT 'Gender',
  `failures_num` smallint(6) DEFAULT '0' COMMENT 'Failure Number',
  `first_failure` timestamp NULL DEFAULT NULL COMMENT 'First Failure',
  `lock_expires` timestamp NULL DEFAULT NULL COMMENT 'Lock Expiration Date',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `CUSTOMER_ENTITY_EMAIL_WEBSITE_ID` (`email`,`website_id`),
  KEY `CUSTOMER_ENTITY_STORE_ID` (`store_id`),
  KEY `CUSTOMER_ENTITY_WEBSITE_ID` (`website_id`),
  KEY `CUSTOMER_ENTITY_FIRSTNAME` (`firstname`),
  KEY `CUSTOMER_ENTITY_LASTNAME` (`lastname`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Customer Entity' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `customer_entity`
--

INSERT INTO `customer_entity` (`entity_id`, `website_id`, `email`, `group_id`, `increment_id`, `store_id`, `created_at`, `updated_at`, `is_active`, `disable_auto_group_change`, `created_in`, `prefix`, `firstname`, `middlename`, `lastname`, `suffix`, `dob`, `password_hash`, `rp_token`, `rp_token_created_at`, `default_billing`, `default_shipping`, `taxvat`, `confirmation`, `gender`, `failures_num`, `first_failure`, `lock_expires`) VALUES
(1, 1, 'rajat61982@gmail.com', 1, NULL, 1, '2019-01-01 15:50:39', '2019-01-01 15:50:39', 1, 0, 'Default Store View', NULL, 'Rajat', NULL, 'Kapoor', NULL, NULL, 'a69bea45cf04bcfff8d261843144541db7cd9ae263b2fe9a3ed2b7ed98ce37ed:G4mnvoGy1aFHeqaO1yKk3DskYOKV3IAI:1', 'yAf1ZOg8f3UZZP9WkThrfvlIKn8xlwcj', '2019-01-01 15:50:39', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_entity_datetime`
--

CREATE TABLE IF NOT EXISTS `customer_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` datetime DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CUSTOMER_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity Datetime' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `customer_entity_decimal`
--

CREATE TABLE IF NOT EXISTS `customer_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CUSTOMER_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity Decimal' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `customer_entity_int`
--

CREATE TABLE IF NOT EXISTS `customer_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` int(11) NOT NULL DEFAULT '0' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CUSTOMER_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity Int' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `customer_entity_text`
--

CREATE TABLE IF NOT EXISTS `customer_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` text NOT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity Text' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `customer_entity_varchar`
--

CREATE TABLE IF NOT EXISTS `customer_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CUSTOMER_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity Varchar' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `customer_form_attribute`
--

CREATE TABLE IF NOT EXISTS `customer_form_attribute` (
  `form_code` varchar(32) NOT NULL COMMENT 'Form Code',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute Id',
  PRIMARY KEY (`form_code`,`attribute_id`),
  KEY `CUSTOMER_FORM_ATTRIBUTE_ATTRIBUTE_ID` (`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Form Attribute';

--
-- Dumping data for table `customer_form_attribute`
--

INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES
('adminhtml_customer', 1),
('adminhtml_customer', 3),
('adminhtml_customer', 4),
('customer_account_create', 4),
('customer_account_edit', 4),
('adminhtml_customer', 5),
('customer_account_create', 5),
('customer_account_edit', 5),
('adminhtml_customer', 6),
('customer_account_create', 6),
('customer_account_edit', 6),
('adminhtml_customer', 7),
('customer_account_create', 7),
('customer_account_edit', 7),
('adminhtml_customer', 8),
('customer_account_create', 8),
('customer_account_edit', 8),
('adminhtml_checkout', 9),
('adminhtml_customer', 9),
('customer_account_create', 9),
('customer_account_edit', 9),
('adminhtml_checkout', 10),
('adminhtml_customer', 10),
('adminhtml_checkout', 11),
('adminhtml_customer', 11),
('customer_account_create', 11),
('customer_account_edit', 11),
('adminhtml_checkout', 17),
('adminhtml_customer', 17),
('customer_account_create', 17),
('customer_account_edit', 17),
('adminhtml_customer', 19),
('customer_account_create', 19),
('customer_account_edit', 19),
('adminhtml_checkout', 20),
('adminhtml_customer', 20),
('customer_account_create', 20),
('customer_account_edit', 20),
('adminhtml_customer', 21),
('adminhtml_customer_address', 22),
('customer_address_edit', 22),
('customer_register_address', 22),
('adminhtml_customer_address', 23),
('customer_address_edit', 23),
('customer_register_address', 23),
('adminhtml_customer_address', 24),
('customer_address_edit', 24),
('customer_register_address', 24),
('adminhtml_customer_address', 25),
('customer_address_edit', 25),
('customer_register_address', 25),
('adminhtml_customer_address', 26),
('customer_address_edit', 26),
('customer_register_address', 26),
('adminhtml_customer_address', 27),
('customer_address_edit', 27),
('customer_register_address', 27),
('adminhtml_customer_address', 28),
('customer_address_edit', 28),
('customer_register_address', 28),
('adminhtml_customer_address', 29),
('customer_address_edit', 29),
('customer_register_address', 29),
('adminhtml_customer_address', 30),
('customer_address_edit', 30),
('customer_register_address', 30),
('adminhtml_customer_address', 31),
('customer_address_edit', 31),
('customer_register_address', 31),
('adminhtml_customer_address', 32),
('customer_address_edit', 32),
('customer_register_address', 32),
('adminhtml_customer_address', 33),
('customer_address_edit', 33),
('customer_register_address', 33),
('adminhtml_customer_address', 34),
('customer_address_edit', 34),
('customer_register_address', 34),
('adminhtml_customer_address', 35),
('customer_address_edit', 35),
('customer_register_address', 35),
('adminhtml_customer_address', 36),
('customer_address_edit', 36),
('customer_register_address', 36);

-- --------------------------------------------------------

--
-- Table structure for table `customer_grid_flat`
--

CREATE TABLE IF NOT EXISTS `customer_grid_flat` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `name` text COMMENT 'Name',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `group_id` int(11) DEFAULT NULL COMMENT 'Group_id',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created_at',
  `website_id` int(11) DEFAULT NULL COMMENT 'Website_id',
  `confirmation` varchar(255) DEFAULT NULL COMMENT 'Confirmation',
  `created_in` text COMMENT 'Created_in',
  `dob` date DEFAULT NULL COMMENT 'Dob',
  `gender` int(11) DEFAULT NULL COMMENT 'Gender',
  `taxvat` varchar(255) DEFAULT NULL COMMENT 'Taxvat',
  `lock_expires` timestamp NULL DEFAULT NULL COMMENT 'Lock_expires',
  `shipping_full` text COMMENT 'Shipping_full',
  `billing_full` text COMMENT 'Billing_full',
  `billing_firstname` varchar(255) DEFAULT NULL COMMENT 'Billing_firstname',
  `billing_lastname` varchar(255) DEFAULT NULL COMMENT 'Billing_lastname',
  `billing_telephone` varchar(255) DEFAULT NULL COMMENT 'Billing_telephone',
  `billing_postcode` varchar(255) DEFAULT NULL COMMENT 'Billing_postcode',
  `billing_country_id` varchar(255) DEFAULT NULL COMMENT 'Billing_country_id',
  `billing_region` varchar(255) DEFAULT NULL COMMENT 'Billing_region',
  `billing_street` varchar(255) DEFAULT NULL COMMENT 'Billing_street',
  `billing_city` varchar(255) DEFAULT NULL COMMENT 'Billing_city',
  `billing_fax` varchar(255) DEFAULT NULL COMMENT 'Billing_fax',
  `billing_vat_id` varchar(255) DEFAULT NULL COMMENT 'Billing_vat_id',
  `billing_company` varchar(255) DEFAULT NULL COMMENT 'Billing_company',
  PRIMARY KEY (`entity_id`),
  KEY `CUSTOMER_GRID_FLAT_GROUP_ID` (`group_id`),
  KEY `CUSTOMER_GRID_FLAT_CREATED_AT` (`created_at`),
  KEY `CUSTOMER_GRID_FLAT_WEBSITE_ID` (`website_id`),
  KEY `CUSTOMER_GRID_FLAT_CONFIRMATION` (`confirmation`),
  KEY `CUSTOMER_GRID_FLAT_DOB` (`dob`),
  KEY `CUSTOMER_GRID_FLAT_GENDER` (`gender`),
  KEY `CUSTOMER_GRID_FLAT_BILLING_COUNTRY_ID` (`billing_country_id`),
  FULLTEXT KEY `FTI_8746F705702DD5F6D45B8C7CE7FE9F2F` (`name`,`email`,`created_in`,`taxvat`,`shipping_full`,`billing_full`,`billing_firstname`,`billing_lastname`,`billing_telephone`,`billing_postcode`,`billing_region`,`billing_city`,`billing_fax`,`billing_company`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='customer_grid_flat';

--
-- Dumping data for table `customer_grid_flat`
--

INSERT INTO `customer_grid_flat` (`entity_id`, `name`, `email`, `group_id`, `created_at`, `website_id`, `confirmation`, `created_in`, `dob`, `gender`, `taxvat`, `lock_expires`, `shipping_full`, `billing_full`, `billing_firstname`, `billing_lastname`, `billing_telephone`, `billing_postcode`, `billing_country_id`, `billing_region`, `billing_street`, `billing_city`, `billing_fax`, `billing_vat_id`, `billing_company`) VALUES
(1, 'Rajat Kapoor', 'rajat61982@gmail.com', 1, '2019-01-01 15:50:39', 1, NULL, 'Default Store View', NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_group`
--

CREATE TABLE IF NOT EXISTS `customer_group` (
  `customer_group_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_group_code` varchar(32) NOT NULL COMMENT 'Customer Group Code',
  `tax_class_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Tax Class Id',
  PRIMARY KEY (`customer_group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Customer Group' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `customer_group`
--

INSERT INTO `customer_group` (`customer_group_id`, `customer_group_code`, `tax_class_id`) VALUES
(0, 'NOT LOGGED IN', 3),
(1, 'General', 3),
(2, 'Wholesale', 3),
(3, 'Retailer', 3);

-- --------------------------------------------------------

--
-- Table structure for table `customer_log`
--

CREATE TABLE IF NOT EXISTS `customer_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Log ID',
  `customer_id` int(11) NOT NULL COMMENT 'Customer ID',
  `last_login_at` timestamp NULL DEFAULT NULL COMMENT 'Last Login Time',
  `last_logout_at` timestamp NULL DEFAULT NULL COMMENT 'Last Logout Time',
  PRIMARY KEY (`log_id`),
  UNIQUE KEY `CUSTOMER_LOG_CUSTOMER_ID` (`customer_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Customer Log Table' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `customer_log`
--

INSERT INTO `customer_log` (`log_id`, `customer_id`, `last_login_at`, `last_logout_at`) VALUES
(1, 1, '2019-01-01 15:50:40', '2019-01-01 15:51:24');

-- --------------------------------------------------------

--
-- Table structure for table `customer_visitor`
--

CREATE TABLE IF NOT EXISTS `customer_visitor` (
  `visitor_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Visitor ID',
  `customer_id` int(11) DEFAULT NULL COMMENT 'Customer Id',
  `session_id` varchar(64) DEFAULT NULL COMMENT 'Session ID',
  `last_visit_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last Visit Time',
  PRIMARY KEY (`visitor_id`),
  KEY `CUSTOMER_VISITOR_CUSTOMER_ID` (`customer_id`),
  KEY `CUSTOMER_VISITOR_LAST_VISIT_AT` (`last_visit_at`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Visitor Table' AUTO_INCREMENT=8 ;

--
-- Dumping data for table `customer_visitor`
--

INSERT INTO `customer_visitor` (`visitor_id`, `customer_id`, `session_id`, `last_visit_at`) VALUES
(1, NULL, '4f26012bd62501eb9696f111c913764b', '2018-12-18 16:43:54'),
(2, NULL, '236f2c81d8f0a0bd5d4d14abe92b820a', '2018-12-21 15:23:17'),
(3, NULL, '3113df117b0e1c1c156c9897843173de', '2018-12-21 19:49:16'),
(4, NULL, '3b3f5a45ea056066e346990c4da86907', '2018-12-22 01:40:44'),
(5, NULL, '68053abb7b5ca36e7c0d0c9d5d15e0f7', '2018-12-25 04:27:58'),
(6, NULL, 'b972dd5b1c584d0592d37e4c8bbeacd3', '2018-12-25 19:04:21'),
(7, 1, '35581e85afc31ea9243d818bb5a95883', '2019-01-01 15:51:24');

-- --------------------------------------------------------

--
-- Table structure for table `design_change`
--

CREATE TABLE IF NOT EXISTS `design_change` (
  `design_change_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Design Change Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `design` varchar(255) DEFAULT NULL COMMENT 'Design',
  `date_from` date DEFAULT NULL COMMENT 'First Date of Design Activity',
  `date_to` date DEFAULT NULL COMMENT 'Last Date of Design Activity',
  PRIMARY KEY (`design_change_id`),
  KEY `DESIGN_CHANGE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Design Changes' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `design_config_grid_flat`
--

CREATE TABLE IF NOT EXISTS `design_config_grid_flat` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `store_website_id` int(11) DEFAULT NULL COMMENT 'Store_website_id',
  `store_group_id` int(11) DEFAULT NULL COMMENT 'Store_group_id',
  `store_id` int(11) DEFAULT NULL COMMENT 'Store_id',
  `theme_theme_id` varchar(255) DEFAULT NULL COMMENT 'Theme_theme_id',
  PRIMARY KEY (`entity_id`),
  KEY `DESIGN_CONFIG_GRID_FLAT_STORE_WEBSITE_ID` (`store_website_id`),
  KEY `DESIGN_CONFIG_GRID_FLAT_STORE_GROUP_ID` (`store_group_id`),
  KEY `DESIGN_CONFIG_GRID_FLAT_STORE_ID` (`store_id`),
  FULLTEXT KEY `DESIGN_CONFIG_GRID_FLAT_THEME_THEME_ID` (`theme_theme_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='design_config_grid_flat';

--
-- Dumping data for table `design_config_grid_flat`
--

INSERT INTO `design_config_grid_flat` (`entity_id`, `store_website_id`, `store_group_id`, `store_id`, `theme_theme_id`) VALUES
(0, NULL, NULL, NULL, ''),
(1, 1, NULL, NULL, ''),
(2, 1, 1, 1, '2');

-- --------------------------------------------------------

--
-- Table structure for table `directory_country`
--

CREATE TABLE IF NOT EXISTS `directory_country` (
  `country_id` varchar(2) NOT NULL COMMENT 'Country Id in ISO-2',
  `iso2_code` varchar(2) DEFAULT NULL COMMENT 'Country ISO-2 format',
  `iso3_code` varchar(3) DEFAULT NULL COMMENT 'Country ISO-3',
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Directory Country';

--
-- Dumping data for table `directory_country`
--

INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES
('AD', 'AD', 'AND'),
('AE', 'AE', 'ARE'),
('AF', 'AF', 'AFG'),
('AG', 'AG', 'ATG'),
('AI', 'AI', 'AIA'),
('AL', 'AL', 'ALB'),
('AM', 'AM', 'ARM'),
('AN', 'AN', 'ANT'),
('AO', 'AO', 'AGO'),
('AQ', 'AQ', 'ATA'),
('AR', 'AR', 'ARG'),
('AS', 'AS', 'ASM'),
('AT', 'AT', 'AUT'),
('AU', 'AU', 'AUS'),
('AW', 'AW', 'ABW'),
('AX', 'AX', 'ALA'),
('AZ', 'AZ', 'AZE'),
('BA', 'BA', 'BIH'),
('BB', 'BB', 'BRB'),
('BD', 'BD', 'BGD'),
('BE', 'BE', 'BEL'),
('BF', 'BF', 'BFA'),
('BG', 'BG', 'BGR'),
('BH', 'BH', 'BHR'),
('BI', 'BI', 'BDI'),
('BJ', 'BJ', 'BEN'),
('BL', 'BL', 'BLM'),
('BM', 'BM', 'BMU'),
('BN', 'BN', 'BRN'),
('BO', 'BO', 'BOL'),
('BR', 'BR', 'BRA'),
('BS', 'BS', 'BHS'),
('BT', 'BT', 'BTN'),
('BV', 'BV', 'BVT'),
('BW', 'BW', 'BWA'),
('BY', 'BY', 'BLR'),
('BZ', 'BZ', 'BLZ'),
('CA', 'CA', 'CAN'),
('CC', 'CC', 'CCK'),
('CD', 'CD', 'COD'),
('CF', 'CF', 'CAF'),
('CG', 'CG', 'COG'),
('CH', 'CH', 'CHE'),
('CI', 'CI', 'CIV'),
('CK', 'CK', 'COK'),
('CL', 'CL', 'CHL'),
('CM', 'CM', 'CMR'),
('CN', 'CN', 'CHN'),
('CO', 'CO', 'COL'),
('CR', 'CR', 'CRI'),
('CU', 'CU', 'CUB'),
('CV', 'CV', 'CPV'),
('CX', 'CX', 'CXR'),
('CY', 'CY', 'CYP'),
('CZ', 'CZ', 'CZE'),
('DE', 'DE', 'DEU'),
('DJ', 'DJ', 'DJI'),
('DK', 'DK', 'DNK'),
('DM', 'DM', 'DMA'),
('DO', 'DO', 'DOM'),
('DZ', 'DZ', 'DZA'),
('EC', 'EC', 'ECU'),
('EE', 'EE', 'EST'),
('EG', 'EG', 'EGY'),
('EH', 'EH', 'ESH'),
('ER', 'ER', 'ERI'),
('ES', 'ES', 'ESP'),
('ET', 'ET', 'ETH'),
('FI', 'FI', 'FIN'),
('FJ', 'FJ', 'FJI'),
('FK', 'FK', 'FLK'),
('FM', 'FM', 'FSM'),
('FO', 'FO', 'FRO'),
('FR', 'FR', 'FRA'),
('GA', 'GA', 'GAB'),
('GB', 'GB', 'GBR'),
('GD', 'GD', 'GRD'),
('GE', 'GE', 'GEO'),
('GF', 'GF', 'GUF'),
('GG', 'GG', 'GGY'),
('GH', 'GH', 'GHA'),
('GI', 'GI', 'GIB'),
('GL', 'GL', 'GRL'),
('GM', 'GM', 'GMB'),
('GN', 'GN', 'GIN'),
('GP', 'GP', 'GLP'),
('GQ', 'GQ', 'GNQ'),
('GR', 'GR', 'GRC'),
('GS', 'GS', 'SGS'),
('GT', 'GT', 'GTM'),
('GU', 'GU', 'GUM'),
('GW', 'GW', 'GNB'),
('GY', 'GY', 'GUY'),
('HK', 'HK', 'HKG'),
('HM', 'HM', 'HMD'),
('HN', 'HN', 'HND'),
('HR', 'HR', 'HRV'),
('HT', 'HT', 'HTI'),
('HU', 'HU', 'HUN'),
('ID', 'ID', 'IDN'),
('IE', 'IE', 'IRL'),
('IL', 'IL', 'ISR'),
('IM', 'IM', 'IMN'),
('IN', 'IN', 'IND'),
('IO', 'IO', 'IOT'),
('IQ', 'IQ', 'IRQ'),
('IR', 'IR', 'IRN'),
('IS', 'IS', 'ISL'),
('IT', 'IT', 'ITA'),
('JE', 'JE', 'JEY'),
('JM', 'JM', 'JAM'),
('JO', 'JO', 'JOR'),
('JP', 'JP', 'JPN'),
('KE', 'KE', 'KEN'),
('KG', 'KG', 'KGZ'),
('KH', 'KH', 'KHM'),
('KI', 'KI', 'KIR'),
('KM', 'KM', 'COM'),
('KN', 'KN', 'KNA'),
('KP', 'KP', 'PRK'),
('KR', 'KR', 'KOR'),
('KW', 'KW', 'KWT'),
('KY', 'KY', 'CYM'),
('KZ', 'KZ', 'KAZ'),
('LA', 'LA', 'LAO'),
('LB', 'LB', 'LBN'),
('LC', 'LC', 'LCA'),
('LI', 'LI', 'LIE'),
('LK', 'LK', 'LKA'),
('LR', 'LR', 'LBR'),
('LS', 'LS', 'LSO'),
('LT', 'LT', 'LTU'),
('LU', 'LU', 'LUX'),
('LV', 'LV', 'LVA'),
('LY', 'LY', 'LBY'),
('MA', 'MA', 'MAR'),
('MC', 'MC', 'MCO'),
('MD', 'MD', 'MDA'),
('ME', 'ME', 'MNE'),
('MF', 'MF', 'MAF'),
('MG', 'MG', 'MDG'),
('MH', 'MH', 'MHL'),
('MK', 'MK', 'MKD'),
('ML', 'ML', 'MLI'),
('MM', 'MM', 'MMR'),
('MN', 'MN', 'MNG'),
('MO', 'MO', 'MAC'),
('MP', 'MP', 'MNP'),
('MQ', 'MQ', 'MTQ'),
('MR', 'MR', 'MRT'),
('MS', 'MS', 'MSR'),
('MT', 'MT', 'MLT'),
('MU', 'MU', 'MUS'),
('MV', 'MV', 'MDV'),
('MW', 'MW', 'MWI'),
('MX', 'MX', 'MEX'),
('MY', 'MY', 'MYS'),
('MZ', 'MZ', 'MOZ'),
('NA', 'NA', 'NAM'),
('NC', 'NC', 'NCL'),
('NE', 'NE', 'NER'),
('NF', 'NF', 'NFK'),
('NG', 'NG', 'NGA'),
('NI', 'NI', 'NIC'),
('NL', 'NL', 'NLD'),
('NO', 'NO', 'NOR'),
('NP', 'NP', 'NPL'),
('NR', 'NR', 'NRU'),
('NU', 'NU', 'NIU'),
('NZ', 'NZ', 'NZL'),
('OM', 'OM', 'OMN'),
('PA', 'PA', 'PAN'),
('PE', 'PE', 'PER'),
('PF', 'PF', 'PYF'),
('PG', 'PG', 'PNG'),
('PH', 'PH', 'PHL'),
('PK', 'PK', 'PAK'),
('PL', 'PL', 'POL'),
('PM', 'PM', 'SPM'),
('PN', 'PN', 'PCN'),
('PS', 'PS', 'PSE'),
('PT', 'PT', 'PRT'),
('PW', 'PW', 'PLW'),
('PY', 'PY', 'PRY'),
('QA', 'QA', 'QAT'),
('RE', 'RE', 'REU'),
('RO', 'RO', 'ROU'),
('RS', 'RS', 'SRB'),
('RU', 'RU', 'RUS'),
('RW', 'RW', 'RWA'),
('SA', 'SA', 'SAU'),
('SB', 'SB', 'SLB'),
('SC', 'SC', 'SYC'),
('SD', 'SD', 'SDN'),
('SE', 'SE', 'SWE'),
('SG', 'SG', 'SGP'),
('SH', 'SH', 'SHN'),
('SI', 'SI', 'SVN'),
('SJ', 'SJ', 'SJM'),
('SK', 'SK', 'SVK'),
('SL', 'SL', 'SLE'),
('SM', 'SM', 'SMR'),
('SN', 'SN', 'SEN'),
('SO', 'SO', 'SOM'),
('SR', 'SR', 'SUR'),
('ST', 'ST', 'STP'),
('SV', 'SV', 'SLV'),
('SY', 'SY', 'SYR'),
('SZ', 'SZ', 'SWZ'),
('TC', 'TC', 'TCA'),
('TD', 'TD', 'TCD'),
('TF', 'TF', 'ATF'),
('TG', 'TG', 'TGO'),
('TH', 'TH', 'THA'),
('TJ', 'TJ', 'TJK'),
('TK', 'TK', 'TKL'),
('TL', 'TL', 'TLS'),
('TM', 'TM', 'TKM'),
('TN', 'TN', 'TUN'),
('TO', 'TO', 'TON'),
('TR', 'TR', 'TUR'),
('TT', 'TT', 'TTO'),
('TV', 'TV', 'TUV'),
('TW', 'TW', 'TWN'),
('TZ', 'TZ', 'TZA'),
('UA', 'UA', 'UKR'),
('UG', 'UG', 'UGA'),
('UM', 'UM', 'UMI'),
('US', 'US', 'USA'),
('UY', 'UY', 'URY'),
('UZ', 'UZ', 'UZB'),
('VA', 'VA', 'VAT'),
('VC', 'VC', 'VCT'),
('VE', 'VE', 'VEN'),
('VG', 'VG', 'VGB'),
('VI', 'VI', 'VIR'),
('VN', 'VN', 'VNM'),
('VU', 'VU', 'VUT'),
('WF', 'WF', 'WLF'),
('WS', 'WS', 'WSM'),
('YE', 'YE', 'YEM'),
('YT', 'YT', 'MYT'),
('ZA', 'ZA', 'ZAF'),
('ZM', 'ZM', 'ZMB'),
('ZW', 'ZW', 'ZWE');

-- --------------------------------------------------------

--
-- Table structure for table `directory_country_format`
--

CREATE TABLE IF NOT EXISTS `directory_country_format` (
  `country_format_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Country Format Id',
  `country_id` varchar(2) DEFAULT NULL COMMENT 'Country Id in ISO-2',
  `type` varchar(30) DEFAULT NULL COMMENT 'Country Format Type',
  `format` text NOT NULL COMMENT 'Country Format',
  PRIMARY KEY (`country_format_id`),
  UNIQUE KEY `DIRECTORY_COUNTRY_FORMAT_COUNTRY_ID_TYPE` (`country_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Directory Country Format' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `directory_country_region`
--

CREATE TABLE IF NOT EXISTS `directory_country_region` (
  `region_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Region Id',
  `country_id` varchar(4) NOT NULL DEFAULT '0' COMMENT 'Country Id in ISO-2',
  `code` varchar(32) DEFAULT NULL COMMENT 'Region code',
  `default_name` varchar(255) DEFAULT NULL COMMENT 'Region Name',
  PRIMARY KEY (`region_id`),
  KEY `DIRECTORY_COUNTRY_REGION_COUNTRY_ID` (`country_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Directory Country Region' AUTO_INCREMENT=569 ;

--
-- Dumping data for table `directory_country_region`
--

INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES
(1, 'US', 'AL', 'Alabama'),
(2, 'US', 'AK', 'Alaska'),
(3, 'US', 'AS', 'American Samoa'),
(4, 'US', 'AZ', 'Arizona'),
(5, 'US', 'AR', 'Arkansas'),
(6, 'US', 'AE', 'Armed Forces Africa'),
(7, 'US', 'AA', 'Armed Forces Americas'),
(8, 'US', 'AE', 'Armed Forces Canada'),
(9, 'US', 'AE', 'Armed Forces Europe'),
(10, 'US', 'AE', 'Armed Forces Middle East'),
(11, 'US', 'AP', 'Armed Forces Pacific'),
(12, 'US', 'CA', 'California'),
(13, 'US', 'CO', 'Colorado'),
(14, 'US', 'CT', 'Connecticut'),
(15, 'US', 'DE', 'Delaware'),
(16, 'US', 'DC', 'District of Columbia'),
(17, 'US', 'FM', 'Federated States Of Micronesia'),
(18, 'US', 'FL', 'Florida'),
(19, 'US', 'GA', 'Georgia'),
(20, 'US', 'GU', 'Guam'),
(21, 'US', 'HI', 'Hawaii'),
(22, 'US', 'ID', 'Idaho'),
(23, 'US', 'IL', 'Illinois'),
(24, 'US', 'IN', 'Indiana'),
(25, 'US', 'IA', 'Iowa'),
(26, 'US', 'KS', 'Kansas'),
(27, 'US', 'KY', 'Kentucky'),
(28, 'US', 'LA', 'Louisiana'),
(29, 'US', 'ME', 'Maine'),
(30, 'US', 'MH', 'Marshall Islands'),
(31, 'US', 'MD', 'Maryland'),
(32, 'US', 'MA', 'Massachusetts'),
(33, 'US', 'MI', 'Michigan'),
(34, 'US', 'MN', 'Minnesota'),
(35, 'US', 'MS', 'Mississippi'),
(36, 'US', 'MO', 'Missouri'),
(37, 'US', 'MT', 'Montana'),
(38, 'US', 'NE', 'Nebraska'),
(39, 'US', 'NV', 'Nevada'),
(40, 'US', 'NH', 'New Hampshire'),
(41, 'US', 'NJ', 'New Jersey'),
(42, 'US', 'NM', 'New Mexico'),
(43, 'US', 'NY', 'New York'),
(44, 'US', 'NC', 'North Carolina'),
(45, 'US', 'ND', 'North Dakota'),
(46, 'US', 'MP', 'Northern Mariana Islands'),
(47, 'US', 'OH', 'Ohio'),
(48, 'US', 'OK', 'Oklahoma'),
(49, 'US', 'OR', 'Oregon'),
(50, 'US', 'PW', 'Palau'),
(51, 'US', 'PA', 'Pennsylvania'),
(52, 'US', 'PR', 'Puerto Rico'),
(53, 'US', 'RI', 'Rhode Island'),
(54, 'US', 'SC', 'South Carolina'),
(55, 'US', 'SD', 'South Dakota'),
(56, 'US', 'TN', 'Tennessee'),
(57, 'US', 'TX', 'Texas'),
(58, 'US', 'UT', 'Utah'),
(59, 'US', 'VT', 'Vermont'),
(60, 'US', 'VI', 'Virgin Islands'),
(61, 'US', 'VA', 'Virginia'),
(62, 'US', 'WA', 'Washington'),
(63, 'US', 'WV', 'West Virginia'),
(64, 'US', 'WI', 'Wisconsin'),
(65, 'US', 'WY', 'Wyoming'),
(66, 'CA', 'AB', 'Alberta'),
(67, 'CA', 'BC', 'British Columbia'),
(68, 'CA', 'MB', 'Manitoba'),
(69, 'CA', 'NL', 'Newfoundland and Labrador'),
(70, 'CA', 'NB', 'New Brunswick'),
(71, 'CA', 'NS', 'Nova Scotia'),
(72, 'CA', 'NT', 'Northwest Territories'),
(73, 'CA', 'NU', 'Nunavut'),
(74, 'CA', 'ON', 'Ontario'),
(75, 'CA', 'PE', 'Prince Edward Island'),
(76, 'CA', 'QC', 'Quebec'),
(77, 'CA', 'SK', 'Saskatchewan'),
(78, 'CA', 'YT', 'Yukon Territory'),
(79, 'DE', 'NDS', 'Niedersachsen'),
(80, 'DE', 'BAW', 'Baden-Württemberg'),
(81, 'DE', 'BAY', 'Bayern'),
(82, 'DE', 'BER', 'Berlin'),
(83, 'DE', 'BRG', 'Brandenburg'),
(84, 'DE', 'BRE', 'Bremen'),
(85, 'DE', 'HAM', 'Hamburg'),
(86, 'DE', 'HES', 'Hessen'),
(87, 'DE', 'MEC', 'Mecklenburg-Vorpommern'),
(88, 'DE', 'NRW', 'Nordrhein-Westfalen'),
(89, 'DE', 'RHE', 'Rheinland-Pfalz'),
(90, 'DE', 'SAR', 'Saarland'),
(91, 'DE', 'SAS', 'Sachsen'),
(92, 'DE', 'SAC', 'Sachsen-Anhalt'),
(93, 'DE', 'SCN', 'Schleswig-Holstein'),
(94, 'DE', 'THE', 'Thüringen'),
(95, 'AT', 'WI', 'Wien'),
(96, 'AT', 'NO', 'Niederösterreich'),
(97, 'AT', 'OO', 'Oberösterreich'),
(98, 'AT', 'SB', 'Salzburg'),
(99, 'AT', 'KN', 'Kärnten'),
(100, 'AT', 'ST', 'Steiermark'),
(101, 'AT', 'TI', 'Tirol'),
(102, 'AT', 'BL', 'Burgenland'),
(103, 'AT', 'VB', 'Vorarlberg'),
(104, 'CH', 'AG', 'Aargau'),
(105, 'CH', 'AI', 'Appenzell Innerrhoden'),
(106, 'CH', 'AR', 'Appenzell Ausserrhoden'),
(107, 'CH', 'BE', 'Bern'),
(108, 'CH', 'BL', 'Basel-Landschaft'),
(109, 'CH', 'BS', 'Basel-Stadt'),
(110, 'CH', 'FR', 'Freiburg'),
(111, 'CH', 'GE', 'Genf'),
(112, 'CH', 'GL', 'Glarus'),
(113, 'CH', 'GR', 'Graubünden'),
(114, 'CH', 'JU', 'Jura'),
(115, 'CH', 'LU', 'Luzern'),
(116, 'CH', 'NE', 'Neuenburg'),
(117, 'CH', 'NW', 'Nidwalden'),
(118, 'CH', 'OW', 'Obwalden'),
(119, 'CH', 'SG', 'St. Gallen'),
(120, 'CH', 'SH', 'Schaffhausen'),
(121, 'CH', 'SO', 'Solothurn'),
(122, 'CH', 'SZ', 'Schwyz'),
(123, 'CH', 'TG', 'Thurgau'),
(124, 'CH', 'TI', 'Tessin'),
(125, 'CH', 'UR', 'Uri'),
(126, 'CH', 'VD', 'Waadt'),
(127, 'CH', 'VS', 'Wallis'),
(128, 'CH', 'ZG', 'Zug'),
(129, 'CH', 'ZH', 'Zürich'),
(130, 'ES', 'A Coruсa', 'A Coruña'),
(131, 'ES', 'Alava', 'Alava'),
(132, 'ES', 'Albacete', 'Albacete'),
(133, 'ES', 'Alicante', 'Alicante'),
(134, 'ES', 'Almeria', 'Almeria'),
(135, 'ES', 'Asturias', 'Asturias'),
(136, 'ES', 'Avila', 'Avila'),
(137, 'ES', 'Badajoz', 'Badajoz'),
(138, 'ES', 'Baleares', 'Baleares'),
(139, 'ES', 'Barcelona', 'Barcelona'),
(140, 'ES', 'Burgos', 'Burgos'),
(141, 'ES', 'Caceres', 'Caceres'),
(142, 'ES', 'Cadiz', 'Cadiz'),
(143, 'ES', 'Cantabria', 'Cantabria'),
(144, 'ES', 'Castellon', 'Castellon'),
(145, 'ES', 'Ceuta', 'Ceuta'),
(146, 'ES', 'Ciudad Real', 'Ciudad Real'),
(147, 'ES', 'Cordoba', 'Cordoba'),
(148, 'ES', 'Cuenca', 'Cuenca'),
(149, 'ES', 'Girona', 'Girona'),
(150, 'ES', 'Granada', 'Granada'),
(151, 'ES', 'Guadalajara', 'Guadalajara'),
(152, 'ES', 'Guipuzcoa', 'Guipuzcoa'),
(153, 'ES', 'Huelva', 'Huelva'),
(154, 'ES', 'Huesca', 'Huesca'),
(155, 'ES', 'Jaen', 'Jaen'),
(156, 'ES', 'La Rioja', 'La Rioja'),
(157, 'ES', 'Las Palmas', 'Las Palmas'),
(158, 'ES', 'Leon', 'Leon'),
(159, 'ES', 'Lleida', 'Lleida'),
(160, 'ES', 'Lugo', 'Lugo'),
(161, 'ES', 'Madrid', 'Madrid'),
(162, 'ES', 'Malaga', 'Malaga'),
(163, 'ES', 'Melilla', 'Melilla'),
(164, 'ES', 'Murcia', 'Murcia'),
(165, 'ES', 'Navarra', 'Navarra'),
(166, 'ES', 'Ourense', 'Ourense'),
(167, 'ES', 'Palencia', 'Palencia'),
(168, 'ES', 'Pontevedra', 'Pontevedra'),
(169, 'ES', 'Salamanca', 'Salamanca'),
(170, 'ES', 'Santa Cruz de Tenerife', 'Santa Cruz de Tenerife'),
(171, 'ES', 'Segovia', 'Segovia'),
(172, 'ES', 'Sevilla', 'Sevilla'),
(173, 'ES', 'Soria', 'Soria'),
(174, 'ES', 'Tarragona', 'Tarragona'),
(175, 'ES', 'Teruel', 'Teruel'),
(176, 'ES', 'Toledo', 'Toledo'),
(177, 'ES', 'Valencia', 'Valencia'),
(178, 'ES', 'Valladolid', 'Valladolid'),
(179, 'ES', 'Vizcaya', 'Vizcaya'),
(180, 'ES', 'Zamora', 'Zamora'),
(181, 'ES', 'Zaragoza', 'Zaragoza'),
(182, 'FR', '1', 'Ain'),
(183, 'FR', '2', 'Aisne'),
(184, 'FR', '3', 'Allier'),
(185, 'FR', '4', 'Alpes-de-Haute-Provence'),
(186, 'FR', '5', 'Hautes-Alpes'),
(187, 'FR', '6', 'Alpes-Maritimes'),
(188, 'FR', '7', 'Ardèche'),
(189, 'FR', '8', 'Ardennes'),
(190, 'FR', '9', 'Ariège'),
(191, 'FR', '10', 'Aube'),
(192, 'FR', '11', 'Aude'),
(193, 'FR', '12', 'Aveyron'),
(194, 'FR', '13', 'Bouches-du-Rhône'),
(195, 'FR', '14', 'Calvados'),
(196, 'FR', '15', 'Cantal'),
(197, 'FR', '16', 'Charente'),
(198, 'FR', '17', 'Charente-Maritime'),
(199, 'FR', '18', 'Cher'),
(200, 'FR', '19', 'Corrèze'),
(201, 'FR', '2A', 'Corse-du-Sud'),
(202, 'FR', '2B', 'Haute-Corse'),
(203, 'FR', '21', 'Côte-d''Or'),
(204, 'FR', '22', 'Côtes-d''Armor'),
(205, 'FR', '23', 'Creuse'),
(206, 'FR', '24', 'Dordogne'),
(207, 'FR', '25', 'Doubs'),
(208, 'FR', '26', 'Drôme'),
(209, 'FR', '27', 'Eure'),
(210, 'FR', '28', 'Eure-et-Loir'),
(211, 'FR', '29', 'Finistère'),
(212, 'FR', '30', 'Gard'),
(213, 'FR', '31', 'Haute-Garonne'),
(214, 'FR', '32', 'Gers'),
(215, 'FR', '33', 'Gironde'),
(216, 'FR', '34', 'Hérault'),
(217, 'FR', '35', 'Ille-et-Vilaine'),
(218, 'FR', '36', 'Indre'),
(219, 'FR', '37', 'Indre-et-Loire'),
(220, 'FR', '38', 'Isère'),
(221, 'FR', '39', 'Jura'),
(222, 'FR', '40', 'Landes'),
(223, 'FR', '41', 'Loir-et-Cher'),
(224, 'FR', '42', 'Loire'),
(225, 'FR', '43', 'Haute-Loire'),
(226, 'FR', '44', 'Loire-Atlantique'),
(227, 'FR', '45', 'Loiret'),
(228, 'FR', '46', 'Lot'),
(229, 'FR', '47', 'Lot-et-Garonne'),
(230, 'FR', '48', 'Lozère'),
(231, 'FR', '49', 'Maine-et-Loire'),
(232, 'FR', '50', 'Manche'),
(233, 'FR', '51', 'Marne'),
(234, 'FR', '52', 'Haute-Marne'),
(235, 'FR', '53', 'Mayenne'),
(236, 'FR', '54', 'Meurthe-et-Moselle'),
(237, 'FR', '55', 'Meuse'),
(238, 'FR', '56', 'Morbihan'),
(239, 'FR', '57', 'Moselle'),
(240, 'FR', '58', 'Nièvre'),
(241, 'FR', '59', 'Nord'),
(242, 'FR', '60', 'Oise'),
(243, 'FR', '61', 'Orne'),
(244, 'FR', '62', 'Pas-de-Calais'),
(245, 'FR', '63', 'Puy-de-Dôme'),
(246, 'FR', '64', 'Pyrénées-Atlantiques'),
(247, 'FR', '65', 'Hautes-Pyrénées'),
(248, 'FR', '66', 'Pyrénées-Orientales'),
(249, 'FR', '67', 'Bas-Rhin'),
(250, 'FR', '68', 'Haut-Rhin'),
(251, 'FR', '69', 'Rhône'),
(252, 'FR', '70', 'Haute-Saône'),
(253, 'FR', '71', 'Saône-et-Loire'),
(254, 'FR', '72', 'Sarthe'),
(255, 'FR', '73', 'Savoie'),
(256, 'FR', '74', 'Haute-Savoie'),
(257, 'FR', '75', 'Paris'),
(258, 'FR', '76', 'Seine-Maritime'),
(259, 'FR', '77', 'Seine-et-Marne'),
(260, 'FR', '78', 'Yvelines'),
(261, 'FR', '79', 'Deux-Sèvres'),
(262, 'FR', '80', 'Somme'),
(263, 'FR', '81', 'Tarn'),
(264, 'FR', '82', 'Tarn-et-Garonne'),
(265, 'FR', '83', 'Var'),
(266, 'FR', '84', 'Vaucluse'),
(267, 'FR', '85', 'Vendée'),
(268, 'FR', '86', 'Vienne'),
(269, 'FR', '87', 'Haute-Vienne'),
(270, 'FR', '88', 'Vosges'),
(271, 'FR', '89', 'Yonne'),
(272, 'FR', '90', 'Territoire-de-Belfort'),
(273, 'FR', '91', 'Essonne'),
(274, 'FR', '92', 'Hauts-de-Seine'),
(275, 'FR', '93', 'Seine-Saint-Denis'),
(276, 'FR', '94', 'Val-de-Marne'),
(277, 'FR', '95', 'Val-d''Oise'),
(278, 'RO', 'AB', 'Alba'),
(279, 'RO', 'AR', 'Arad'),
(280, 'RO', 'AG', 'Argeş'),
(281, 'RO', 'BC', 'Bacău'),
(282, 'RO', 'BH', 'Bihor'),
(283, 'RO', 'BN', 'Bistriţa-Năsăud'),
(284, 'RO', 'BT', 'Botoşani'),
(285, 'RO', 'BV', 'Braşov'),
(286, 'RO', 'BR', 'Brăila'),
(287, 'RO', 'B', 'Bucureşti'),
(288, 'RO', 'BZ', 'Buzău'),
(289, 'RO', 'CS', 'Caraş-Severin'),
(290, 'RO', 'CL', 'Călăraşi'),
(291, 'RO', 'CJ', 'Cluj'),
(292, 'RO', 'CT', 'Constanţa'),
(293, 'RO', 'CV', 'Covasna'),
(294, 'RO', 'DB', 'Dâmboviţa'),
(295, 'RO', 'DJ', 'Dolj'),
(296, 'RO', 'GL', 'Galaţi'),
(297, 'RO', 'GR', 'Giurgiu'),
(298, 'RO', 'GJ', 'Gorj'),
(299, 'RO', 'HR', 'Harghita'),
(300, 'RO', 'HD', 'Hunedoara'),
(301, 'RO', 'IL', 'Ialomiţa'),
(302, 'RO', 'IS', 'Iaşi'),
(303, 'RO', 'IF', 'Ilfov'),
(304, 'RO', 'MM', 'Maramureş'),
(305, 'RO', 'MH', 'Mehedinţi'),
(306, 'RO', 'MS', 'Mureş'),
(307, 'RO', 'NT', 'Neamţ'),
(308, 'RO', 'OT', 'Olt'),
(309, 'RO', 'PH', 'Prahova'),
(310, 'RO', 'SM', 'Satu-Mare'),
(311, 'RO', 'SJ', 'Sălaj'),
(312, 'RO', 'SB', 'Sibiu'),
(313, 'RO', 'SV', 'Suceava'),
(314, 'RO', 'TR', 'Teleorman'),
(315, 'RO', 'TM', 'Timiş'),
(316, 'RO', 'TL', 'Tulcea'),
(317, 'RO', 'VS', 'Vaslui'),
(318, 'RO', 'VL', 'Vâlcea'),
(319, 'RO', 'VN', 'Vrancea'),
(320, 'FI', 'Lappi', 'Lappi'),
(321, 'FI', 'Pohjois-Pohjanmaa', 'Pohjois-Pohjanmaa'),
(322, 'FI', 'Kainuu', 'Kainuu'),
(323, 'FI', 'Pohjois-Karjala', 'Pohjois-Karjala'),
(324, 'FI', 'Pohjois-Savo', 'Pohjois-Savo'),
(325, 'FI', 'Etelä-Savo', 'Etelä-Savo'),
(326, 'FI', 'Etelä-Pohjanmaa', 'Etelä-Pohjanmaa'),
(327, 'FI', 'Pohjanmaa', 'Pohjanmaa'),
(328, 'FI', 'Pirkanmaa', 'Pirkanmaa'),
(329, 'FI', 'Satakunta', 'Satakunta'),
(330, 'FI', 'Keski-Pohjanmaa', 'Keski-Pohjanmaa'),
(331, 'FI', 'Keski-Suomi', 'Keski-Suomi'),
(332, 'FI', 'Varsinais-Suomi', 'Varsinais-Suomi'),
(333, 'FI', 'Etelä-Karjala', 'Etelä-Karjala'),
(334, 'FI', 'Päijät-Häme', 'Päijät-Häme'),
(335, 'FI', 'Kanta-Häme', 'Kanta-Häme'),
(336, 'FI', 'Uusimaa', 'Uusimaa'),
(337, 'FI', 'Itä-Uusimaa', 'Itä-Uusimaa'),
(338, 'FI', 'Kymenlaakso', 'Kymenlaakso'),
(339, 'FI', 'Ahvenanmaa', 'Ahvenanmaa'),
(340, 'EE', 'EE-37', 'Harjumaa'),
(341, 'EE', 'EE-39', 'Hiiumaa'),
(342, 'EE', 'EE-44', 'Ida-Virumaa'),
(343, 'EE', 'EE-49', 'Jõgevamaa'),
(344, 'EE', 'EE-51', 'Järvamaa'),
(345, 'EE', 'EE-57', 'Läänemaa'),
(346, 'EE', 'EE-59', 'Lääne-Virumaa'),
(347, 'EE', 'EE-65', 'Põlvamaa'),
(348, 'EE', 'EE-67', 'Pärnumaa'),
(349, 'EE', 'EE-70', 'Raplamaa'),
(350, 'EE', 'EE-74', 'Saaremaa'),
(351, 'EE', 'EE-78', 'Tartumaa'),
(352, 'EE', 'EE-82', 'Valgamaa'),
(353, 'EE', 'EE-84', 'Viljandimaa'),
(354, 'EE', 'EE-86', 'Võrumaa'),
(355, 'LV', 'LV-DGV', 'Daugavpils'),
(356, 'LV', 'LV-JEL', 'Jelgava'),
(357, 'LV', 'Jēkabpils', 'Jēkabpils'),
(358, 'LV', 'LV-JUR', 'Jūrmala'),
(359, 'LV', 'LV-LPX', 'Liepāja'),
(360, 'LV', 'LV-LE', 'Liepājas novads'),
(361, 'LV', 'LV-REZ', 'Rēzekne'),
(362, 'LV', 'LV-RIX', 'Rīga'),
(363, 'LV', 'LV-RI', 'Rīgas novads'),
(364, 'LV', 'Valmiera', 'Valmiera'),
(365, 'LV', 'LV-VEN', 'Ventspils'),
(366, 'LV', 'Aglonas novads', 'Aglonas novads'),
(367, 'LV', 'LV-AI', 'Aizkraukles novads'),
(368, 'LV', 'Aizputes novads', 'Aizputes novads'),
(369, 'LV', 'Aknīstes novads', 'Aknīstes novads'),
(370, 'LV', 'Alojas novads', 'Alojas novads'),
(371, 'LV', 'Alsungas novads', 'Alsungas novads'),
(372, 'LV', 'LV-AL', 'Alūksnes novads'),
(373, 'LV', 'Amatas novads', 'Amatas novads'),
(374, 'LV', 'Apes novads', 'Apes novads'),
(375, 'LV', 'Auces novads', 'Auces novads'),
(376, 'LV', 'Babītes novads', 'Babītes novads'),
(377, 'LV', 'Baldones novads', 'Baldones novads'),
(378, 'LV', 'Baltinavas novads', 'Baltinavas novads'),
(379, 'LV', 'LV-BL', 'Balvu novads'),
(380, 'LV', 'LV-BU', 'Bauskas novads'),
(381, 'LV', 'Beverīnas novads', 'Beverīnas novads'),
(382, 'LV', 'Brocēnu novads', 'Brocēnu novads'),
(383, 'LV', 'Burtnieku novads', 'Burtnieku novads'),
(384, 'LV', 'Carnikavas novads', 'Carnikavas novads'),
(385, 'LV', 'Cesvaines novads', 'Cesvaines novads'),
(386, 'LV', 'Ciblas novads', 'Ciblas novads'),
(387, 'LV', 'LV-CE', 'Cēsu novads'),
(388, 'LV', 'Dagdas novads', 'Dagdas novads'),
(389, 'LV', 'LV-DA', 'Daugavpils novads'),
(390, 'LV', 'LV-DO', 'Dobeles novads'),
(391, 'LV', 'Dundagas novads', 'Dundagas novads'),
(392, 'LV', 'Durbes novads', 'Durbes novads'),
(393, 'LV', 'Engures novads', 'Engures novads'),
(394, 'LV', 'Garkalnes novads', 'Garkalnes novads'),
(395, 'LV', 'Grobiņas novads', 'Grobiņas novads'),
(396, 'LV', 'LV-GU', 'Gulbenes novads'),
(397, 'LV', 'Iecavas novads', 'Iecavas novads'),
(398, 'LV', 'Ikšķiles novads', 'Ikšķiles novads'),
(399, 'LV', 'Ilūkstes novads', 'Ilūkstes novads'),
(400, 'LV', 'Inčukalna novads', 'Inčukalna novads'),
(401, 'LV', 'Jaunjelgavas novads', 'Jaunjelgavas novads'),
(402, 'LV', 'Jaunpiebalgas novads', 'Jaunpiebalgas novads'),
(403, 'LV', 'Jaunpils novads', 'Jaunpils novads'),
(404, 'LV', 'LV-JL', 'Jelgavas novads'),
(405, 'LV', 'LV-JK', 'Jēkabpils novads'),
(406, 'LV', 'Kandavas novads', 'Kandavas novads'),
(407, 'LV', 'Kokneses novads', 'Kokneses novads'),
(408, 'LV', 'Krimuldas novads', 'Krimuldas novads'),
(409, 'LV', 'Krustpils novads', 'Krustpils novads'),
(410, 'LV', 'LV-KR', 'Krāslavas novads'),
(411, 'LV', 'LV-KU', 'Kuldīgas novads'),
(412, 'LV', 'Kārsavas novads', 'Kārsavas novads'),
(413, 'LV', 'Lielvārdes novads', 'Lielvārdes novads'),
(414, 'LV', 'LV-LM', 'Limbažu novads'),
(415, 'LV', 'Lubānas novads', 'Lubānas novads'),
(416, 'LV', 'LV-LU', 'Ludzas novads'),
(417, 'LV', 'Līgatnes novads', 'Līgatnes novads'),
(418, 'LV', 'Līvānu novads', 'Līvānu novads'),
(419, 'LV', 'LV-MA', 'Madonas novads'),
(420, 'LV', 'Mazsalacas novads', 'Mazsalacas novads'),
(421, 'LV', 'Mālpils novads', 'Mālpils novads'),
(422, 'LV', 'Mārupes novads', 'Mārupes novads'),
(423, 'LV', 'Naukšēnu novads', 'Naukšēnu novads'),
(424, 'LV', 'Neretas novads', 'Neretas novads'),
(425, 'LV', 'Nīcas novads', 'Nīcas novads'),
(426, 'LV', 'LV-OG', 'Ogres novads'),
(427, 'LV', 'Olaines novads', 'Olaines novads'),
(428, 'LV', 'Ozolnieku novads', 'Ozolnieku novads'),
(429, 'LV', 'LV-PR', 'Preiļu novads'),
(430, 'LV', 'Priekules novads', 'Priekules novads'),
(431, 'LV', 'Priekuļu novads', 'Priekuļu novads'),
(432, 'LV', 'Pārgaujas novads', 'Pārgaujas novads'),
(433, 'LV', 'Pāvilostas novads', 'Pāvilostas novads'),
(434, 'LV', 'Pļaviņu novads', 'Pļaviņu novads'),
(435, 'LV', 'Raunas novads', 'Raunas novads'),
(436, 'LV', 'Riebiņu novads', 'Riebiņu novads'),
(437, 'LV', 'Rojas novads', 'Rojas novads'),
(438, 'LV', 'Ropažu novads', 'Ropažu novads'),
(439, 'LV', 'Rucavas novads', 'Rucavas novads'),
(440, 'LV', 'Rugāju novads', 'Rugāju novads'),
(441, 'LV', 'Rundāles novads', 'Rundāles novads'),
(442, 'LV', 'LV-RE', 'Rēzeknes novads'),
(443, 'LV', 'Rūjienas novads', 'Rūjienas novads'),
(444, 'LV', 'Salacgrīvas novads', 'Salacgrīvas novads'),
(445, 'LV', 'Salas novads', 'Salas novads'),
(446, 'LV', 'Salaspils novads', 'Salaspils novads'),
(447, 'LV', 'LV-SA', 'Saldus novads'),
(448, 'LV', 'Saulkrastu novads', 'Saulkrastu novads'),
(449, 'LV', 'Siguldas novads', 'Siguldas novads'),
(450, 'LV', 'Skrundas novads', 'Skrundas novads'),
(451, 'LV', 'Skrīveru novads', 'Skrīveru novads'),
(452, 'LV', 'Smiltenes novads', 'Smiltenes novads'),
(453, 'LV', 'Stopiņu novads', 'Stopiņu novads'),
(454, 'LV', 'Strenču novads', 'Strenču novads'),
(455, 'LV', 'Sējas novads', 'Sējas novads'),
(456, 'LV', 'LV-TA', 'Talsu novads'),
(457, 'LV', 'LV-TU', 'Tukuma novads'),
(458, 'LV', 'Tērvetes novads', 'Tērvetes novads'),
(459, 'LV', 'Vaiņodes novads', 'Vaiņodes novads'),
(460, 'LV', 'LV-VK', 'Valkas novads'),
(461, 'LV', 'LV-VM', 'Valmieras novads'),
(462, 'LV', 'Varakļānu novads', 'Varakļānu novads'),
(463, 'LV', 'Vecpiebalgas novads', 'Vecpiebalgas novads'),
(464, 'LV', 'Vecumnieku novads', 'Vecumnieku novads'),
(465, 'LV', 'LV-VE', 'Ventspils novads'),
(466, 'LV', 'Viesītes novads', 'Viesītes novads'),
(467, 'LV', 'Viļakas novads', 'Viļakas novads'),
(468, 'LV', 'Viļānu novads', 'Viļānu novads'),
(469, 'LV', 'Vārkavas novads', 'Vārkavas novads'),
(470, 'LV', 'Zilupes novads', 'Zilupes novads'),
(471, 'LV', 'Ādažu novads', 'Ādažu novads'),
(472, 'LV', 'Ērgļu novads', 'Ērgļu novads'),
(473, 'LV', 'Ķeguma novads', 'Ķeguma novads'),
(474, 'LV', 'Ķekavas novads', 'Ķekavas novads'),
(475, 'LT', 'LT-AL', 'Alytaus Apskritis'),
(476, 'LT', 'LT-KU', 'Kauno Apskritis'),
(477, 'LT', 'LT-KL', 'Klaipėdos Apskritis'),
(478, 'LT', 'LT-MR', 'Marijampolės Apskritis'),
(479, 'LT', 'LT-PN', 'Panevėžio Apskritis'),
(480, 'LT', 'LT-SA', 'Šiaulių Apskritis'),
(481, 'LT', 'LT-TA', 'Tauragės Apskritis'),
(482, 'LT', 'LT-TE', 'Telšių Apskritis'),
(483, 'LT', 'LT-UT', 'Utenos Apskritis'),
(484, 'LT', 'LT-VL', 'Vilniaus Apskritis'),
(485, 'BR', 'AC', 'Acre'),
(486, 'BR', 'AL', 'Alagoas'),
(487, 'BR', 'AP', 'Amapá'),
(488, 'BR', 'AM', 'Amazonas'),
(489, 'BR', 'BA', 'Bahia'),
(490, 'BR', 'CE', 'Ceará'),
(491, 'BR', 'ES', 'Espírito Santo'),
(492, 'BR', 'GO', 'Goiás'),
(493, 'BR', 'MA', 'Maranhão'),
(494, 'BR', 'MT', 'Mato Grosso'),
(495, 'BR', 'MS', 'Mato Grosso do Sul'),
(496, 'BR', 'MG', 'Minas Gerais'),
(497, 'BR', 'PA', 'Pará'),
(498, 'BR', 'PB', 'Paraíba'),
(499, 'BR', 'PR', 'Paraná'),
(500, 'BR', 'PE', 'Pernambuco'),
(501, 'BR', 'PI', 'Piauí'),
(502, 'BR', 'RJ', 'Rio de Janeiro'),
(503, 'BR', 'RN', 'Rio Grande do Norte'),
(504, 'BR', 'RS', 'Rio Grande do Sul'),
(505, 'BR', 'RO', 'Rondônia'),
(506, 'BR', 'RR', 'Roraima'),
(507, 'BR', 'SC', 'Santa Catarina'),
(508, 'BR', 'SP', 'São Paulo'),
(509, 'BR', 'SE', 'Sergipe'),
(510, 'BR', 'TO', 'Tocantins'),
(511, 'BR', 'DF', 'Distrito Federal'),
(512, 'HR', 'HR-01', 'Zagrebačka županija'),
(513, 'HR', 'HR-02', 'Krapinsko-zagorska županija'),
(514, 'HR', 'HR-03', 'Sisačko-moslavačka županija'),
(515, 'HR', 'HR-04', 'Karlovačka županija'),
(516, 'HR', 'HR-05', 'Varaždinska županija'),
(517, 'HR', 'HR-06', 'Koprivničko-križevačka županija'),
(518, 'HR', 'HR-07', 'Bjelovarsko-bilogorska županija'),
(519, 'HR', 'HR-08', 'Primorsko-goranska županija'),
(520, 'HR', 'HR-09', 'Ličko-senjska županija'),
(521, 'HR', 'HR-10', 'Virovitičko-podravska županija'),
(522, 'HR', 'HR-11', 'Požeško-slavonska županija'),
(523, 'HR', 'HR-12', 'Brodsko-posavska županija'),
(524, 'HR', 'HR-13', 'Zadarska županija'),
(525, 'HR', 'HR-14', 'Osječko-baranjska županija'),
(526, 'HR', 'HR-15', 'Šibensko-kninska županija'),
(527, 'HR', 'HR-16', 'Vukovarsko-srijemska županija'),
(528, 'HR', 'HR-17', 'Splitsko-dalmatinska županija'),
(529, 'HR', 'HR-18', 'Istarska županija'),
(530, 'HR', 'HR-19', 'Dubrovačko-neretvanska županija'),
(531, 'HR', 'HR-20', 'Međimurska županija'),
(532, 'HR', 'HR-21', 'Grad Zagreb'),
(533, 'IN', 'AN', 'Andaman and Nicobar Islands'),
(534, 'IN', 'AP', 'Andhra Pradesh'),
(535, 'IN', 'AR', 'Arunachal Pradesh'),
(536, 'IN', 'AS', 'Assam'),
(537, 'IN', 'BR', 'Bihar'),
(538, 'IN', 'CH', 'Chandigarh'),
(539, 'IN', 'CT', 'Chhattisgarh'),
(540, 'IN', 'DN', 'Dadra and Nagar Haveli'),
(541, 'IN', 'DD', 'Daman and Diu'),
(542, 'IN', 'DL', 'Delhi'),
(543, 'IN', 'GA', 'Goa'),
(544, 'IN', 'GJ', 'Gujarat'),
(545, 'IN', 'HR', 'Haryana'),
(546, 'IN', 'HP', 'Himachal Pradesh'),
(547, 'IN', 'JK', 'Jammu and Kashmir'),
(548, 'IN', 'JH', 'Jharkhand'),
(549, 'IN', 'KA', 'Karnataka'),
(550, 'IN', 'KL', 'Kerala'),
(551, 'IN', 'LD', 'Lakshadweep'),
(552, 'IN', 'MP', 'Madhya Pradesh'),
(553, 'IN', 'MH', 'Maharashtra'),
(554, 'IN', 'MN', 'Manipur'),
(555, 'IN', 'ML', 'Meghalaya'),
(556, 'IN', 'MZ', 'Mizoram'),
(557, 'IN', 'NL', 'Nagaland'),
(558, 'IN', 'OR', 'Odisha'),
(559, 'IN', 'PY', 'Puducherry'),
(560, 'IN', 'PB', 'Punjab'),
(561, 'IN', 'RJ', 'Rajasthan'),
(562, 'IN', 'SK', 'Sikkim'),
(563, 'IN', 'TN', 'Tamil Nadu'),
(564, 'IN', 'TG', 'Telangana'),
(565, 'IN', 'TR', 'Tripura'),
(566, 'IN', 'UP', 'Uttar Pradesh'),
(567, 'IN', 'UT', 'Uttarakhand'),
(568, 'IN', 'WB', 'West Bengal');

-- --------------------------------------------------------

--
-- Table structure for table `directory_country_region_name`
--

CREATE TABLE IF NOT EXISTS `directory_country_region_name` (
  `locale` varchar(8) NOT NULL COMMENT 'Locale',
  `region_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Region Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Region Name',
  PRIMARY KEY (`locale`,`region_id`),
  KEY `DIRECTORY_COUNTRY_REGION_NAME_REGION_ID` (`region_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Directory Country Region Name';

--
-- Dumping data for table `directory_country_region_name`
--

INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES
('en_US', 1, 'Alabama'),
('en_US', 2, 'Alaska'),
('en_US', 3, 'American Samoa'),
('en_US', 4, 'Arizona'),
('en_US', 5, 'Arkansas'),
('en_US', 6, 'Armed Forces Africa'),
('en_US', 7, 'Armed Forces Americas'),
('en_US', 8, 'Armed Forces Canada'),
('en_US', 9, 'Armed Forces Europe'),
('en_US', 10, 'Armed Forces Middle East'),
('en_US', 11, 'Armed Forces Pacific'),
('en_US', 12, 'California'),
('en_US', 13, 'Colorado'),
('en_US', 14, 'Connecticut'),
('en_US', 15, 'Delaware'),
('en_US', 16, 'District of Columbia'),
('en_US', 17, 'Federated States Of Micronesia'),
('en_US', 18, 'Florida'),
('en_US', 19, 'Georgia'),
('en_US', 20, 'Guam'),
('en_US', 21, 'Hawaii'),
('en_US', 22, 'Idaho'),
('en_US', 23, 'Illinois'),
('en_US', 24, 'Indiana'),
('en_US', 25, 'Iowa'),
('en_US', 26, 'Kansas'),
('en_US', 27, 'Kentucky'),
('en_US', 28, 'Louisiana'),
('en_US', 29, 'Maine'),
('en_US', 30, 'Marshall Islands'),
('en_US', 31, 'Maryland'),
('en_US', 32, 'Massachusetts'),
('en_US', 33, 'Michigan'),
('en_US', 34, 'Minnesota'),
('en_US', 35, 'Mississippi'),
('en_US', 36, 'Missouri'),
('en_US', 37, 'Montana'),
('en_US', 38, 'Nebraska'),
('en_US', 39, 'Nevada'),
('en_US', 40, 'New Hampshire'),
('en_US', 41, 'New Jersey'),
('en_US', 42, 'New Mexico'),
('en_US', 43, 'New York'),
('en_US', 44, 'North Carolina'),
('en_US', 45, 'North Dakota'),
('en_US', 46, 'Northern Mariana Islands'),
('en_US', 47, 'Ohio'),
('en_US', 48, 'Oklahoma'),
('en_US', 49, 'Oregon'),
('en_US', 50, 'Palau'),
('en_US', 51, 'Pennsylvania'),
('en_US', 52, 'Puerto Rico'),
('en_US', 53, 'Rhode Island'),
('en_US', 54, 'South Carolina'),
('en_US', 55, 'South Dakota'),
('en_US', 56, 'Tennessee'),
('en_US', 57, 'Texas'),
('en_US', 58, 'Utah'),
('en_US', 59, 'Vermont'),
('en_US', 60, 'Virgin Islands'),
('en_US', 61, 'Virginia'),
('en_US', 62, 'Washington'),
('en_US', 63, 'West Virginia'),
('en_US', 64, 'Wisconsin'),
('en_US', 65, 'Wyoming'),
('en_US', 66, 'Alberta'),
('en_US', 67, 'British Columbia'),
('en_US', 68, 'Manitoba'),
('en_US', 69, 'Newfoundland and Labrador'),
('en_US', 70, 'New Brunswick'),
('en_US', 71, 'Nova Scotia'),
('en_US', 72, 'Northwest Territories'),
('en_US', 73, 'Nunavut'),
('en_US', 74, 'Ontario'),
('en_US', 75, 'Prince Edward Island'),
('en_US', 76, 'Quebec'),
('en_US', 77, 'Saskatchewan'),
('en_US', 78, 'Yukon Territory'),
('en_US', 79, 'Niedersachsen'),
('en_US', 80, 'Baden-Württemberg'),
('en_US', 81, 'Bayern'),
('en_US', 82, 'Berlin'),
('en_US', 83, 'Brandenburg'),
('en_US', 84, 'Bremen'),
('en_US', 85, 'Hamburg'),
('en_US', 86, 'Hessen'),
('en_US', 87, 'Mecklenburg-Vorpommern'),
('en_US', 88, 'Nordrhein-Westfalen'),
('en_US', 89, 'Rheinland-Pfalz'),
('en_US', 90, 'Saarland'),
('en_US', 91, 'Sachsen'),
('en_US', 92, 'Sachsen-Anhalt'),
('en_US', 93, 'Schleswig-Holstein'),
('en_US', 94, 'Thüringen'),
('en_US', 95, 'Wien'),
('en_US', 96, 'Niederösterreich'),
('en_US', 97, 'Oberösterreich'),
('en_US', 98, 'Salzburg'),
('en_US', 99, 'Kärnten'),
('en_US', 100, 'Steiermark'),
('en_US', 101, 'Tirol'),
('en_US', 102, 'Burgenland'),
('en_US', 103, 'Vorarlberg'),
('en_US', 104, 'Aargau'),
('en_US', 105, 'Appenzell Innerrhoden'),
('en_US', 106, 'Appenzell Ausserrhoden'),
('en_US', 107, 'Bern'),
('en_US', 108, 'Basel-Landschaft'),
('en_US', 109, 'Basel-Stadt'),
('en_US', 110, 'Freiburg'),
('en_US', 111, 'Genf'),
('en_US', 112, 'Glarus'),
('en_US', 113, 'Graubünden'),
('en_US', 114, 'Jura'),
('en_US', 115, 'Luzern'),
('en_US', 116, 'Neuenburg'),
('en_US', 117, 'Nidwalden'),
('en_US', 118, 'Obwalden'),
('en_US', 119, 'St. Gallen'),
('en_US', 120, 'Schaffhausen'),
('en_US', 121, 'Solothurn'),
('en_US', 122, 'Schwyz'),
('en_US', 123, 'Thurgau'),
('en_US', 124, 'Tessin'),
('en_US', 125, 'Uri'),
('en_US', 126, 'Waadt'),
('en_US', 127, 'Wallis'),
('en_US', 128, 'Zug'),
('en_US', 129, 'Zürich'),
('en_US', 130, 'A Coruña'),
('en_US', 131, 'Alava'),
('en_US', 132, 'Albacete'),
('en_US', 133, 'Alicante'),
('en_US', 134, 'Almeria'),
('en_US', 135, 'Asturias'),
('en_US', 136, 'Avila'),
('en_US', 137, 'Badajoz'),
('en_US', 138, 'Baleares'),
('en_US', 139, 'Barcelona'),
('en_US', 140, 'Burgos'),
('en_US', 141, 'Caceres'),
('en_US', 142, 'Cadiz'),
('en_US', 143, 'Cantabria'),
('en_US', 144, 'Castellon'),
('en_US', 145, 'Ceuta'),
('en_US', 146, 'Ciudad Real'),
('en_US', 147, 'Cordoba'),
('en_US', 148, 'Cuenca'),
('en_US', 149, 'Girona'),
('en_US', 150, 'Granada'),
('en_US', 151, 'Guadalajara'),
('en_US', 152, 'Guipuzcoa'),
('en_US', 153, 'Huelva'),
('en_US', 154, 'Huesca'),
('en_US', 155, 'Jaen'),
('en_US', 156, 'La Rioja'),
('en_US', 157, 'Las Palmas'),
('en_US', 158, 'Leon'),
('en_US', 159, 'Lleida'),
('en_US', 160, 'Lugo'),
('en_US', 161, 'Madrid'),
('en_US', 162, 'Malaga'),
('en_US', 163, 'Melilla'),
('en_US', 164, 'Murcia'),
('en_US', 165, 'Navarra'),
('en_US', 166, 'Ourense'),
('en_US', 167, 'Palencia'),
('en_US', 168, 'Pontevedra'),
('en_US', 169, 'Salamanca'),
('en_US', 170, 'Santa Cruz de Tenerife'),
('en_US', 171, 'Segovia'),
('en_US', 172, 'Sevilla'),
('en_US', 173, 'Soria'),
('en_US', 174, 'Tarragona'),
('en_US', 175, 'Teruel'),
('en_US', 176, 'Toledo'),
('en_US', 177, 'Valencia'),
('en_US', 178, 'Valladolid'),
('en_US', 179, 'Vizcaya'),
('en_US', 180, 'Zamora'),
('en_US', 181, 'Zaragoza'),
('en_US', 182, 'Ain'),
('en_US', 183, 'Aisne'),
('en_US', 184, 'Allier'),
('en_US', 185, 'Alpes-de-Haute-Provence'),
('en_US', 186, 'Hautes-Alpes'),
('en_US', 187, 'Alpes-Maritimes'),
('en_US', 188, 'Ardèche'),
('en_US', 189, 'Ardennes'),
('en_US', 190, 'Ariège'),
('en_US', 191, 'Aube'),
('en_US', 192, 'Aude'),
('en_US', 193, 'Aveyron'),
('en_US', 194, 'Bouches-du-Rhône'),
('en_US', 195, 'Calvados'),
('en_US', 196, 'Cantal'),
('en_US', 197, 'Charente'),
('en_US', 198, 'Charente-Maritime'),
('en_US', 199, 'Cher'),
('en_US', 200, 'Corrèze'),
('en_US', 201, 'Corse-du-Sud'),
('en_US', 202, 'Haute-Corse'),
('en_US', 203, 'Côte-d''Or'),
('en_US', 204, 'Côtes-d''Armor'),
('en_US', 205, 'Creuse'),
('en_US', 206, 'Dordogne'),
('en_US', 207, 'Doubs'),
('en_US', 208, 'Drôme'),
('en_US', 209, 'Eure'),
('en_US', 210, 'Eure-et-Loir'),
('en_US', 211, 'Finistère'),
('en_US', 212, 'Gard'),
('en_US', 213, 'Haute-Garonne'),
('en_US', 214, 'Gers'),
('en_US', 215, 'Gironde'),
('en_US', 216, 'Hérault'),
('en_US', 217, 'Ille-et-Vilaine'),
('en_US', 218, 'Indre'),
('en_US', 219, 'Indre-et-Loire'),
('en_US', 220, 'Isère'),
('en_US', 221, 'Jura'),
('en_US', 222, 'Landes'),
('en_US', 223, 'Loir-et-Cher'),
('en_US', 224, 'Loire'),
('en_US', 225, 'Haute-Loire'),
('en_US', 226, 'Loire-Atlantique'),
('en_US', 227, 'Loiret'),
('en_US', 228, 'Lot'),
('en_US', 229, 'Lot-et-Garonne'),
('en_US', 230, 'Lozère'),
('en_US', 231, 'Maine-et-Loire'),
('en_US', 232, 'Manche'),
('en_US', 233, 'Marne'),
('en_US', 234, 'Haute-Marne'),
('en_US', 235, 'Mayenne'),
('en_US', 236, 'Meurthe-et-Moselle'),
('en_US', 237, 'Meuse'),
('en_US', 238, 'Morbihan'),
('en_US', 239, 'Moselle'),
('en_US', 240, 'Nièvre'),
('en_US', 241, 'Nord'),
('en_US', 242, 'Oise'),
('en_US', 243, 'Orne'),
('en_US', 244, 'Pas-de-Calais'),
('en_US', 245, 'Puy-de-Dôme'),
('en_US', 246, 'Pyrénées-Atlantiques'),
('en_US', 247, 'Hautes-Pyrénées'),
('en_US', 248, 'Pyrénées-Orientales'),
('en_US', 249, 'Bas-Rhin'),
('en_US', 250, 'Haut-Rhin'),
('en_US', 251, 'Rhône'),
('en_US', 252, 'Haute-Saône'),
('en_US', 253, 'Saône-et-Loire'),
('en_US', 254, 'Sarthe'),
('en_US', 255, 'Savoie'),
('en_US', 256, 'Haute-Savoie'),
('en_US', 257, 'Paris'),
('en_US', 258, 'Seine-Maritime'),
('en_US', 259, 'Seine-et-Marne'),
('en_US', 260, 'Yvelines'),
('en_US', 261, 'Deux-Sèvres'),
('en_US', 262, 'Somme'),
('en_US', 263, 'Tarn'),
('en_US', 264, 'Tarn-et-Garonne'),
('en_US', 265, 'Var'),
('en_US', 266, 'Vaucluse'),
('en_US', 267, 'Vendée'),
('en_US', 268, 'Vienne'),
('en_US', 269, 'Haute-Vienne'),
('en_US', 270, 'Vosges'),
('en_US', 271, 'Yonne'),
('en_US', 272, 'Territoire-de-Belfort'),
('en_US', 273, 'Essonne'),
('en_US', 274, 'Hauts-de-Seine'),
('en_US', 275, 'Seine-Saint-Denis'),
('en_US', 276, 'Val-de-Marne'),
('en_US', 277, 'Val-d''Oise'),
('en_US', 278, 'Alba'),
('en_US', 279, 'Arad'),
('en_US', 280, 'Argeş'),
('en_US', 281, 'Bacău'),
('en_US', 282, 'Bihor'),
('en_US', 283, 'Bistriţa-Năsăud'),
('en_US', 284, 'Botoşani'),
('en_US', 285, 'Braşov'),
('en_US', 286, 'Brăila'),
('en_US', 287, 'Bucureşti'),
('en_US', 288, 'Buzău'),
('en_US', 289, 'Caraş-Severin'),
('en_US', 290, 'Călăraşi'),
('en_US', 291, 'Cluj'),
('en_US', 292, 'Constanţa'),
('en_US', 293, 'Covasna'),
('en_US', 294, 'Dâmboviţa'),
('en_US', 295, 'Dolj'),
('en_US', 296, 'Galaţi'),
('en_US', 297, 'Giurgiu'),
('en_US', 298, 'Gorj'),
('en_US', 299, 'Harghita'),
('en_US', 300, 'Hunedoara'),
('en_US', 301, 'Ialomiţa'),
('en_US', 302, 'Iaşi'),
('en_US', 303, 'Ilfov'),
('en_US', 304, 'Maramureş'),
('en_US', 305, 'Mehedinţi'),
('en_US', 306, 'Mureş'),
('en_US', 307, 'Neamţ'),
('en_US', 308, 'Olt'),
('en_US', 309, 'Prahova'),
('en_US', 310, 'Satu-Mare'),
('en_US', 311, 'Sălaj'),
('en_US', 312, 'Sibiu'),
('en_US', 313, 'Suceava'),
('en_US', 314, 'Teleorman'),
('en_US', 315, 'Timiş'),
('en_US', 316, 'Tulcea'),
('en_US', 317, 'Vaslui'),
('en_US', 318, 'Vâlcea'),
('en_US', 319, 'Vrancea'),
('en_US', 320, 'Lappi'),
('en_US', 321, 'Pohjois-Pohjanmaa'),
('en_US', 322, 'Kainuu'),
('en_US', 323, 'Pohjois-Karjala'),
('en_US', 324, 'Pohjois-Savo'),
('en_US', 325, 'Etelä-Savo'),
('en_US', 326, 'Etelä-Pohjanmaa'),
('en_US', 327, 'Pohjanmaa'),
('en_US', 328, 'Pirkanmaa'),
('en_US', 329, 'Satakunta'),
('en_US', 330, 'Keski-Pohjanmaa'),
('en_US', 331, 'Keski-Suomi'),
('en_US', 332, 'Varsinais-Suomi'),
('en_US', 333, 'Etelä-Karjala'),
('en_US', 334, 'Päijät-Häme'),
('en_US', 335, 'Kanta-Häme'),
('en_US', 336, 'Uusimaa'),
('en_US', 337, 'Itä-Uusimaa'),
('en_US', 338, 'Kymenlaakso'),
('en_US', 339, 'Ahvenanmaa'),
('en_US', 340, 'Harjumaa'),
('en_US', 341, 'Hiiumaa'),
('en_US', 342, 'Ida-Virumaa'),
('en_US', 343, 'Jõgevamaa'),
('en_US', 344, 'Järvamaa'),
('en_US', 345, 'Läänemaa'),
('en_US', 346, 'Lääne-Virumaa'),
('en_US', 347, 'Põlvamaa'),
('en_US', 348, 'Pärnumaa'),
('en_US', 349, 'Raplamaa'),
('en_US', 350, 'Saaremaa'),
('en_US', 351, 'Tartumaa'),
('en_US', 352, 'Valgamaa'),
('en_US', 353, 'Viljandimaa'),
('en_US', 354, 'Võrumaa'),
('en_US', 355, 'Daugavpils'),
('en_US', 356, 'Jelgava'),
('en_US', 357, 'Jēkabpils'),
('en_US', 358, 'Jūrmala'),
('en_US', 359, 'Liepāja'),
('en_US', 360, 'Liepājas novads'),
('en_US', 361, 'Rēzekne'),
('en_US', 362, 'Rīga'),
('en_US', 363, 'Rīgas novads'),
('en_US', 364, 'Valmiera'),
('en_US', 365, 'Ventspils'),
('en_US', 366, 'Aglonas novads'),
('en_US', 367, 'Aizkraukles novads'),
('en_US', 368, 'Aizputes novads'),
('en_US', 369, 'Aknīstes novads'),
('en_US', 370, 'Alojas novads'),
('en_US', 371, 'Alsungas novads'),
('en_US', 372, 'Alūksnes novads'),
('en_US', 373, 'Amatas novads'),
('en_US', 374, 'Apes novads'),
('en_US', 375, 'Auces novads'),
('en_US', 376, 'Babītes novads'),
('en_US', 377, 'Baldones novads'),
('en_US', 378, 'Baltinavas novads'),
('en_US', 379, 'Balvu novads'),
('en_US', 380, 'Bauskas novads'),
('en_US', 381, 'Beverīnas novads'),
('en_US', 382, 'Brocēnu novads'),
('en_US', 383, 'Burtnieku novads'),
('en_US', 384, 'Carnikavas novads'),
('en_US', 385, 'Cesvaines novads'),
('en_US', 386, 'Ciblas novads'),
('en_US', 387, 'Cēsu novads'),
('en_US', 388, 'Dagdas novads'),
('en_US', 389, 'Daugavpils novads'),
('en_US', 390, 'Dobeles novads'),
('en_US', 391, 'Dundagas novads'),
('en_US', 392, 'Durbes novads'),
('en_US', 393, 'Engures novads'),
('en_US', 394, 'Garkalnes novads'),
('en_US', 395, 'Grobiņas novads'),
('en_US', 396, 'Gulbenes novads'),
('en_US', 397, 'Iecavas novads'),
('en_US', 398, 'Ikšķiles novads'),
('en_US', 399, 'Ilūkstes novads'),
('en_US', 400, 'Inčukalna novads'),
('en_US', 401, 'Jaunjelgavas novads'),
('en_US', 402, 'Jaunpiebalgas novads'),
('en_US', 403, 'Jaunpils novads'),
('en_US', 404, 'Jelgavas novads'),
('en_US', 405, 'Jēkabpils novads'),
('en_US', 406, 'Kandavas novads'),
('en_US', 407, 'Kokneses novads'),
('en_US', 408, 'Krimuldas novads'),
('en_US', 409, 'Krustpils novads'),
('en_US', 410, 'Krāslavas novads'),
('en_US', 411, 'Kuldīgas novads'),
('en_US', 412, 'Kārsavas novads'),
('en_US', 413, 'Lielvārdes novads'),
('en_US', 414, 'Limbažu novads'),
('en_US', 415, 'Lubānas novads'),
('en_US', 416, 'Ludzas novads'),
('en_US', 417, 'Līgatnes novads'),
('en_US', 418, 'Līvānu novads'),
('en_US', 419, 'Madonas novads'),
('en_US', 420, 'Mazsalacas novads'),
('en_US', 421, 'Mālpils novads'),
('en_US', 422, 'Mārupes novads'),
('en_US', 423, 'Naukšēnu novads'),
('en_US', 424, 'Neretas novads'),
('en_US', 425, 'Nīcas novads'),
('en_US', 426, 'Ogres novads'),
('en_US', 427, 'Olaines novads'),
('en_US', 428, 'Ozolnieku novads'),
('en_US', 429, 'Preiļu novads'),
('en_US', 430, 'Priekules novads'),
('en_US', 431, 'Priekuļu novads'),
('en_US', 432, 'Pārgaujas novads'),
('en_US', 433, 'Pāvilostas novads'),
('en_US', 434, 'Pļaviņu novads'),
('en_US', 435, 'Raunas novads'),
('en_US', 436, 'Riebiņu novads'),
('en_US', 437, 'Rojas novads'),
('en_US', 438, 'Ropažu novads'),
('en_US', 439, 'Rucavas novads'),
('en_US', 440, 'Rugāju novads'),
('en_US', 441, 'Rundāles novads'),
('en_US', 442, 'Rēzeknes novads'),
('en_US', 443, 'Rūjienas novads'),
('en_US', 444, 'Salacgrīvas novads'),
('en_US', 445, 'Salas novads'),
('en_US', 446, 'Salaspils novads'),
('en_US', 447, 'Saldus novads'),
('en_US', 448, 'Saulkrastu novads'),
('en_US', 449, 'Siguldas novads'),
('en_US', 450, 'Skrundas novads'),
('en_US', 451, 'Skrīveru novads'),
('en_US', 452, 'Smiltenes novads'),
('en_US', 453, 'Stopiņu novads'),
('en_US', 454, 'Strenču novads'),
('en_US', 455, 'Sējas novads'),
('en_US', 456, 'Talsu novads'),
('en_US', 457, 'Tukuma novads'),
('en_US', 458, 'Tērvetes novads'),
('en_US', 459, 'Vaiņodes novads'),
('en_US', 460, 'Valkas novads'),
('en_US', 461, 'Valmieras novads'),
('en_US', 462, 'Varakļānu novads'),
('en_US', 463, 'Vecpiebalgas novads'),
('en_US', 464, 'Vecumnieku novads'),
('en_US', 465, 'Ventspils novads'),
('en_US', 466, 'Viesītes novads'),
('en_US', 467, 'Viļakas novads'),
('en_US', 468, 'Viļānu novads'),
('en_US', 469, 'Vārkavas novads'),
('en_US', 470, 'Zilupes novads'),
('en_US', 471, 'Ādažu novads'),
('en_US', 472, 'Ērgļu novads'),
('en_US', 473, 'Ķeguma novads'),
('en_US', 474, 'Ķekavas novads'),
('en_US', 475, 'Alytaus Apskritis'),
('en_US', 476, 'Kauno Apskritis'),
('en_US', 477, 'Klaipėdos Apskritis'),
('en_US', 478, 'Marijampolės Apskritis'),
('en_US', 479, 'Panevėžio Apskritis'),
('en_US', 480, 'Šiaulių Apskritis'),
('en_US', 481, 'Tauragės Apskritis'),
('en_US', 482, 'Telšių Apskritis'),
('en_US', 483, 'Utenos Apskritis'),
('en_US', 484, 'Vilniaus Apskritis'),
('en_US', 485, 'Acre'),
('en_US', 486, 'Alagoas'),
('en_US', 487, 'Amapá'),
('en_US', 488, 'Amazonas'),
('en_US', 489, 'Bahia'),
('en_US', 490, 'Ceará'),
('en_US', 491, 'Espírito Santo'),
('en_US', 492, 'Goiás'),
('en_US', 493, 'Maranhão'),
('en_US', 494, 'Mato Grosso'),
('en_US', 495, 'Mato Grosso do Sul'),
('en_US', 496, 'Minas Gerais'),
('en_US', 497, 'Pará'),
('en_US', 498, 'Paraíba'),
('en_US', 499, 'Paraná'),
('en_US', 500, 'Pernambuco'),
('en_US', 501, 'Piauí'),
('en_US', 502, 'Rio de Janeiro'),
('en_US', 503, 'Rio Grande do Norte'),
('en_US', 504, 'Rio Grande do Sul'),
('en_US', 505, 'Rondônia'),
('en_US', 506, 'Roraima'),
('en_US', 507, 'Santa Catarina'),
('en_US', 508, 'São Paulo'),
('en_US', 509, 'Sergipe'),
('en_US', 510, 'Tocantins'),
('en_US', 511, 'Distrito Federal'),
('en_US', 512, 'Zagrebačka županija'),
('en_US', 513, 'Krapinsko-zagorska županija'),
('en_US', 514, 'Sisačko-moslavačka županija'),
('en_US', 515, 'Karlovačka županija'),
('en_US', 516, 'Varaždinska županija'),
('en_US', 517, 'Koprivničko-križevačka županija'),
('en_US', 518, 'Bjelovarsko-bilogorska županija'),
('en_US', 519, 'Primorsko-goranska županija'),
('en_US', 520, 'Ličko-senjska županija'),
('en_US', 521, 'Virovitičko-podravska županija'),
('en_US', 522, 'Požeško-slavonska županija'),
('en_US', 523, 'Brodsko-posavska županija'),
('en_US', 524, 'Zadarska županija'),
('en_US', 525, 'Osječko-baranjska županija'),
('en_US', 526, 'Šibensko-kninska županija'),
('en_US', 527, 'Vukovarsko-srijemska županija'),
('en_US', 528, 'Splitsko-dalmatinska županija'),
('en_US', 529, 'Istarska županija'),
('en_US', 530, 'Dubrovačko-neretvanska županija'),
('en_US', 531, 'Međimurska županija'),
('en_US', 532, 'Grad Zagreb'),
('en_US', 533, 'Andaman and Nicobar Islands'),
('en_US', 534, 'Andhra Pradesh'),
('en_US', 535, 'Arunachal Pradesh'),
('en_US', 536, 'Assam'),
('en_US', 537, 'Bihar'),
('en_US', 538, 'Chandigarh'),
('en_US', 539, 'Chhattisgarh'),
('en_US', 540, 'Dadra and Nagar Haveli'),
('en_US', 541, 'Daman and Diu'),
('en_US', 542, 'Delhi'),
('en_US', 543, 'Goa'),
('en_US', 544, 'Gujarat'),
('en_US', 545, 'Haryana'),
('en_US', 546, 'Himachal Pradesh'),
('en_US', 547, 'Jammu and Kashmir'),
('en_US', 548, 'Jharkhand'),
('en_US', 549, 'Karnataka'),
('en_US', 550, 'Kerala'),
('en_US', 551, 'Lakshadweep'),
('en_US', 552, 'Madhya Pradesh'),
('en_US', 553, 'Maharashtra'),
('en_US', 554, 'Manipur'),
('en_US', 555, 'Meghalaya'),
('en_US', 556, 'Mizoram'),
('en_US', 557, 'Nagaland'),
('en_US', 558, 'Odisha'),
('en_US', 559, 'Puducherry'),
('en_US', 560, 'Punjab'),
('en_US', 561, 'Rajasthan'),
('en_US', 562, 'Sikkim'),
('en_US', 563, 'Tamil Nadu'),
('en_US', 564, 'Telangana'),
('en_US', 565, 'Tripura'),
('en_US', 566, 'Uttar Pradesh'),
('en_US', 567, 'Uttarakhand'),
('en_US', 568, 'West Bengal');

-- --------------------------------------------------------

--
-- Table structure for table `directory_currency_rate`
--

CREATE TABLE IF NOT EXISTS `directory_currency_rate` (
  `currency_from` varchar(3) NOT NULL COMMENT 'Currency Code Convert From',
  `currency_to` varchar(3) NOT NULL COMMENT 'Currency Code Convert To',
  `rate` decimal(24,12) NOT NULL DEFAULT '0.000000000000' COMMENT 'Currency Conversion Rate',
  PRIMARY KEY (`currency_from`,`currency_to`),
  KEY `DIRECTORY_CURRENCY_RATE_CURRENCY_TO` (`currency_to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Directory Currency Rate';

--
-- Dumping data for table `directory_currency_rate`
--

INSERT INTO `directory_currency_rate` (`currency_from`, `currency_to`, `rate`) VALUES
('EUR', 'EUR', 1.000000000000),
('EUR', 'USD', 1.415000000000),
('USD', 'EUR', 0.706700000000),
('USD', 'USD', 1.000000000000);

-- --------------------------------------------------------

--
-- Table structure for table `downloadable_link`
--

CREATE TABLE IF NOT EXISTS `downloadable_link` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Link ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort order',
  `number_of_downloads` int(11) DEFAULT NULL COMMENT 'Number of downloads',
  `is_shareable` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Shareable flag',
  `link_url` varchar(255) DEFAULT NULL COMMENT 'Link Url',
  `link_file` varchar(255) DEFAULT NULL COMMENT 'Link File',
  `link_type` varchar(20) DEFAULT NULL COMMENT 'Link Type',
  `sample_url` varchar(255) DEFAULT NULL COMMENT 'Sample Url',
  `sample_file` varchar(255) DEFAULT NULL COMMENT 'Sample File',
  `sample_type` varchar(20) DEFAULT NULL COMMENT 'Sample Type',
  PRIMARY KEY (`link_id`),
  KEY `DOWNLOADABLE_LINK_PRODUCT_ID_SORT_ORDER` (`product_id`,`sort_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Link Table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `downloadable_link_price`
--

CREATE TABLE IF NOT EXISTS `downloadable_link_price` (
  `price_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Price ID',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Link ID',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website ID',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  PRIMARY KEY (`price_id`),
  KEY `DOWNLOADABLE_LINK_PRICE_LINK_ID` (`link_id`),
  KEY `DOWNLOADABLE_LINK_PRICE_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Link Price Table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `downloadable_link_purchased`
--

CREATE TABLE IF NOT EXISTS `downloadable_link_purchased` (
  `purchased_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Purchased ID',
  `order_id` int(10) unsigned DEFAULT '0' COMMENT 'Order ID',
  `order_increment_id` varchar(50) DEFAULT NULL COMMENT 'Order Increment ID',
  `order_item_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Order Item ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date of creation',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date of modification',
  `customer_id` int(10) unsigned DEFAULT '0' COMMENT 'Customer ID',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product name',
  `product_sku` varchar(255) DEFAULT NULL COMMENT 'Product sku',
  `link_section_title` varchar(255) DEFAULT NULL COMMENT 'Link_section_title',
  PRIMARY KEY (`purchased_id`),
  KEY `DOWNLOADABLE_LINK_PURCHASED_ORDER_ID` (`order_id`),
  KEY `DOWNLOADABLE_LINK_PURCHASED_ORDER_ITEM_ID` (`order_item_id`),
  KEY `DOWNLOADABLE_LINK_PURCHASED_CUSTOMER_ID` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Link Purchased Table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `downloadable_link_purchased_item`
--

CREATE TABLE IF NOT EXISTS `downloadable_link_purchased_item` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Item ID',
  `purchased_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Purchased ID',
  `order_item_id` int(10) unsigned DEFAULT '0' COMMENT 'Order Item ID',
  `product_id` int(10) unsigned DEFAULT '0' COMMENT 'Product ID',
  `link_hash` varchar(255) DEFAULT NULL COMMENT 'Link hash',
  `number_of_downloads_bought` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Number of downloads bought',
  `number_of_downloads_used` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Number of downloads used',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Link ID',
  `link_title` varchar(255) DEFAULT NULL COMMENT 'Link Title',
  `is_shareable` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Shareable Flag',
  `link_url` varchar(255) DEFAULT NULL COMMENT 'Link Url',
  `link_file` varchar(255) DEFAULT NULL COMMENT 'Link File',
  `link_type` varchar(255) DEFAULT NULL COMMENT 'Link Type',
  `status` varchar(50) DEFAULT NULL COMMENT 'Status',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Time',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update Time',
  PRIMARY KEY (`item_id`),
  KEY `DOWNLOADABLE_LINK_PURCHASED_ITEM_LINK_HASH` (`link_hash`),
  KEY `DOWNLOADABLE_LINK_PURCHASED_ITEM_ORDER_ITEM_ID` (`order_item_id`),
  KEY `DOWNLOADABLE_LINK_PURCHASED_ITEM_PURCHASED_ID` (`purchased_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Link Purchased Item Table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `downloadable_link_title`
--

CREATE TABLE IF NOT EXISTS `downloadable_link_title` (
  `title_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Title ID',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Link ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  PRIMARY KEY (`title_id`),
  UNIQUE KEY `DOWNLOADABLE_LINK_TITLE_LINK_ID_STORE_ID` (`link_id`,`store_id`),
  KEY `DOWNLOADABLE_LINK_TITLE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Link Title Table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `downloadable_sample`
--

CREATE TABLE IF NOT EXISTS `downloadable_sample` (
  `sample_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Sample ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `sample_url` varchar(255) DEFAULT NULL COMMENT 'Sample URL',
  `sample_file` varchar(255) DEFAULT NULL COMMENT 'Sample file',
  `sample_type` varchar(20) DEFAULT NULL COMMENT 'Sample Type',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`sample_id`),
  KEY `DOWNLOADABLE_SAMPLE_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Sample Table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `downloadable_sample_title`
--

CREATE TABLE IF NOT EXISTS `downloadable_sample_title` (
  `title_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Title ID',
  `sample_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sample ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  PRIMARY KEY (`title_id`),
  UNIQUE KEY `DOWNLOADABLE_SAMPLE_TITLE_SAMPLE_ID_STORE_ID` (`sample_id`,`store_id`),
  KEY `DOWNLOADABLE_SAMPLE_TITLE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Sample Title Table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `eav_attribute`
--

CREATE TABLE IF NOT EXISTS `eav_attribute` (
  `attribute_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Attribute Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_code` varchar(255) NOT NULL COMMENT 'Attribute Code',
  `attribute_model` varchar(255) DEFAULT NULL COMMENT 'Attribute Model',
  `backend_model` varchar(255) DEFAULT NULL COMMENT 'Backend Model',
  `backend_type` varchar(8) NOT NULL DEFAULT 'static' COMMENT 'Backend Type',
  `backend_table` varchar(255) DEFAULT NULL COMMENT 'Backend Table',
  `frontend_model` varchar(255) DEFAULT NULL COMMENT 'Frontend Model',
  `frontend_input` varchar(50) DEFAULT NULL COMMENT 'Frontend Input',
  `frontend_label` varchar(255) DEFAULT NULL COMMENT 'Frontend Label',
  `frontend_class` varchar(255) DEFAULT NULL COMMENT 'Frontend Class',
  `source_model` varchar(255) DEFAULT NULL COMMENT 'Source Model',
  `is_required` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Defines Is Required',
  `is_user_defined` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Defines Is User Defined',
  `default_value` text COMMENT 'Default Value',
  `is_unique` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Defines Is Unique',
  `note` varchar(255) DEFAULT NULL COMMENT 'Note',
  PRIMARY KEY (`attribute_id`),
  UNIQUE KEY `EAV_ATTRIBUTE_ENTITY_TYPE_ID_ATTRIBUTE_CODE` (`entity_type_id`,`attribute_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Eav Attribute' AUTO_INCREMENT=169 ;

--
-- Dumping data for table `eav_attribute`
--

INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES
(1, 1, 'website_id', NULL, 'Magento\\Customer\\Model\\Customer\\Attribute\\Backend\\Website', 'static', NULL, NULL, 'select', 'Associate to Website', NULL, 'Magento\\Customer\\Model\\Customer\\Attribute\\Source\\Website', 1, 0, NULL, 0, NULL),
(2, 1, 'store_id', NULL, 'Magento\\Customer\\Model\\Customer\\Attribute\\Backend\\Store', 'static', NULL, NULL, 'select', 'Create In', NULL, 'Magento\\Customer\\Model\\Customer\\Attribute\\Source\\Store', 1, 0, NULL, 0, NULL),
(3, 1, 'created_in', NULL, NULL, 'static', NULL, NULL, 'text', 'Created From', NULL, NULL, 0, 0, NULL, 0, NULL),
(4, 1, 'prefix', NULL, NULL, 'static', NULL, NULL, 'text', 'Name Prefix', NULL, NULL, 0, 0, NULL, 0, NULL),
(5, 1, 'firstname', NULL, NULL, 'static', NULL, NULL, 'text', 'First Name', NULL, NULL, 1, 0, NULL, 0, NULL),
(6, 1, 'middlename', NULL, NULL, 'static', NULL, NULL, 'text', 'Middle Name/Initial', NULL, NULL, 0, 0, NULL, 0, NULL),
(7, 1, 'lastname', NULL, NULL, 'static', NULL, NULL, 'text', 'Last Name', NULL, NULL, 1, 0, NULL, 0, NULL),
(8, 1, 'suffix', NULL, NULL, 'static', NULL, NULL, 'text', 'Name Suffix', NULL, NULL, 0, 0, NULL, 0, NULL),
(9, 1, 'email', NULL, NULL, 'static', NULL, NULL, 'text', 'Email', NULL, NULL, 1, 0, NULL, 0, NULL),
(10, 1, 'group_id', NULL, NULL, 'static', NULL, NULL, 'select', 'Group', NULL, 'Magento\\Customer\\Model\\Customer\\Attribute\\Source\\Group', 1, 0, NULL, 0, NULL),
(11, 1, 'dob', NULL, 'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\Datetime', 'static', NULL, 'Magento\\Eav\\Model\\Entity\\Attribute\\Frontend\\Datetime', 'date', 'Date of Birth', NULL, NULL, 0, 0, NULL, 0, NULL),
(12, 1, 'password_hash', NULL, 'Magento\\Customer\\Model\\Customer\\Attribute\\Backend\\Password', 'static', NULL, NULL, 'hidden', NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(13, 1, 'rp_token', NULL, NULL, 'static', NULL, NULL, 'hidden', NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(14, 1, 'rp_token_created_at', NULL, NULL, 'static', NULL, NULL, 'date', NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(15, 1, 'default_billing', NULL, 'Magento\\Customer\\Model\\Customer\\Attribute\\Backend\\Billing', 'static', NULL, NULL, 'text', 'Default Billing Address', NULL, NULL, 0, 0, NULL, 0, NULL),
(16, 1, 'default_shipping', NULL, 'Magento\\Customer\\Model\\Customer\\Attribute\\Backend\\Shipping', 'static', NULL, NULL, 'text', 'Default Shipping Address', NULL, NULL, 0, 0, NULL, 0, NULL),
(17, 1, 'taxvat', NULL, NULL, 'static', NULL, NULL, 'text', 'Tax/VAT Number', NULL, NULL, 0, 0, NULL, 0, NULL),
(18, 1, 'confirmation', NULL, NULL, 'static', NULL, NULL, 'text', 'Is Confirmed', NULL, NULL, 0, 0, NULL, 0, NULL),
(19, 1, 'created_at', NULL, NULL, 'static', NULL, NULL, 'date', 'Created At', NULL, NULL, 0, 0, NULL, 0, NULL),
(20, 1, 'gender', NULL, NULL, 'static', NULL, NULL, 'select', 'Gender', NULL, 'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Table', 0, 0, NULL, 0, NULL),
(21, 1, 'disable_auto_group_change', NULL, 'Magento\\Customer\\Model\\Attribute\\Backend\\Data\\Boolean', 'static', NULL, NULL, 'boolean', 'Disable Automatic Group Change Based on VAT ID', NULL, NULL, 0, 0, NULL, 0, NULL),
(22, 2, 'prefix', NULL, NULL, 'static', NULL, NULL, 'text', 'Name Prefix', NULL, NULL, 0, 0, NULL, 0, NULL),
(23, 2, 'firstname', NULL, NULL, 'static', NULL, NULL, 'text', 'First Name', NULL, NULL, 1, 0, NULL, 0, NULL),
(24, 2, 'middlename', NULL, NULL, 'static', NULL, NULL, 'text', 'Middle Name/Initial', NULL, NULL, 0, 0, NULL, 0, NULL),
(25, 2, 'lastname', NULL, NULL, 'static', NULL, NULL, 'text', 'Last Name', NULL, NULL, 1, 0, NULL, 0, NULL),
(26, 2, 'suffix', NULL, NULL, 'static', NULL, NULL, 'text', 'Name Suffix', NULL, NULL, 0, 0, NULL, 0, NULL),
(27, 2, 'company', NULL, NULL, 'static', NULL, NULL, 'text', 'Company', NULL, NULL, 0, 0, NULL, 0, NULL),
(28, 2, 'street', NULL, 'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\DefaultBackend', 'static', NULL, NULL, 'multiline', 'Street Address', NULL, NULL, 1, 0, NULL, 0, NULL),
(29, 2, 'city', NULL, NULL, 'static', NULL, NULL, 'text', 'City', NULL, NULL, 1, 0, NULL, 0, NULL),
(30, 2, 'country_id', NULL, NULL, 'static', NULL, NULL, 'select', 'Country', NULL, 'Magento\\Customer\\Model\\ResourceModel\\Address\\Attribute\\Source\\Country', 1, 0, NULL, 0, NULL),
(31, 2, 'region', NULL, 'Magento\\Customer\\Model\\ResourceModel\\Address\\Attribute\\Backend\\Region', 'static', NULL, NULL, 'text', 'State/Province', NULL, NULL, 0, 0, NULL, 0, NULL),
(32, 2, 'region_id', NULL, NULL, 'static', NULL, NULL, 'hidden', 'State/Province', NULL, 'Magento\\Customer\\Model\\ResourceModel\\Address\\Attribute\\Source\\Region', 0, 0, NULL, 0, NULL),
(33, 2, 'postcode', NULL, NULL, 'static', NULL, NULL, 'text', 'Zip/Postal Code', NULL, NULL, 0, 0, NULL, 0, NULL),
(34, 2, 'telephone', NULL, NULL, 'static', NULL, NULL, 'text', 'Phone Number', NULL, NULL, 1, 0, NULL, 0, NULL),
(35, 2, 'fax', NULL, NULL, 'static', NULL, NULL, 'text', 'Fax', NULL, NULL, 0, 0, NULL, 0, NULL),
(36, 2, 'vat_id', NULL, NULL, 'static', NULL, NULL, 'text', 'VAT Number', NULL, NULL, 0, 0, NULL, 0, NULL),
(37, 2, 'vat_is_valid', NULL, NULL, 'static', NULL, NULL, 'text', 'VAT number validity', NULL, NULL, 0, 0, NULL, 0, NULL),
(38, 2, 'vat_request_id', NULL, NULL, 'static', NULL, NULL, 'text', 'VAT number validation request ID', NULL, NULL, 0, 0, NULL, 0, NULL),
(39, 2, 'vat_request_date', NULL, NULL, 'static', NULL, NULL, 'text', 'VAT number validation request date', NULL, NULL, 0, 0, NULL, 0, NULL),
(40, 2, 'vat_request_success', NULL, NULL, 'static', NULL, NULL, 'text', 'VAT number validation request success', NULL, NULL, 0, 0, NULL, 0, NULL),
(41, 1, 'updated_at', NULL, NULL, 'static', NULL, NULL, 'date', 'Updated At', NULL, NULL, 0, 0, NULL, 0, NULL),
(42, 1, 'failures_num', NULL, NULL, 'static', NULL, NULL, 'hidden', 'Failures Number', NULL, NULL, 0, 0, NULL, 0, NULL),
(43, 1, 'first_failure', NULL, NULL, 'static', NULL, NULL, 'date', 'First Failure Date', NULL, NULL, 0, 0, NULL, 0, NULL),
(44, 1, 'lock_expires', NULL, NULL, 'static', NULL, NULL, 'date', 'Failures Number', NULL, NULL, 0, 0, NULL, 0, NULL),
(45, 3, 'name', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Name', NULL, NULL, 1, 0, NULL, 0, NULL),
(46, 3, 'is_active', NULL, NULL, 'int', NULL, NULL, 'select', 'Is Active', NULL, 'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Boolean', 1, 0, NULL, 0, NULL),
(47, 3, 'description', NULL, NULL, 'text', NULL, NULL, 'textarea', 'Description', NULL, NULL, 0, 0, NULL, 0, NULL),
(48, 3, 'image', NULL, 'Magento\\Catalog\\Model\\Category\\Attribute\\Backend\\Image', 'varchar', NULL, NULL, 'image', 'Image', NULL, NULL, 0, 0, NULL, 0, NULL),
(49, 3, 'meta_title', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Page Title', NULL, NULL, 0, 0, NULL, 0, NULL),
(50, 3, 'meta_keywords', NULL, NULL, 'text', NULL, NULL, 'textarea', 'Meta Keywords', NULL, NULL, 0, 0, NULL, 0, NULL),
(51, 3, 'meta_description', NULL, NULL, 'text', NULL, NULL, 'textarea', 'Meta Description', NULL, NULL, 0, 0, NULL, 0, NULL),
(52, 3, 'display_mode', NULL, NULL, 'varchar', NULL, NULL, 'select', 'Display Mode', NULL, 'Magento\\Catalog\\Model\\Category\\Attribute\\Source\\Mode', 0, 0, NULL, 0, NULL),
(53, 3, 'landing_page', NULL, NULL, 'int', NULL, NULL, 'select', 'CMS Block', NULL, 'Magento\\Catalog\\Model\\Category\\Attribute\\Source\\Page', 0, 0, NULL, 0, NULL),
(54, 3, 'is_anchor', NULL, NULL, 'int', NULL, NULL, 'select', 'Is Anchor', NULL, 'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Boolean', 0, 0, '1', 0, NULL),
(55, 3, 'path', NULL, NULL, 'static', NULL, NULL, 'text', 'Path', NULL, NULL, 0, 0, NULL, 0, NULL),
(56, 3, 'position', NULL, NULL, 'static', NULL, NULL, 'text', 'Position', NULL, NULL, 0, 0, NULL, 0, NULL),
(57, 3, 'all_children', NULL, NULL, 'text', NULL, NULL, 'text', NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(58, 3, 'path_in_store', NULL, NULL, 'text', NULL, NULL, 'text', NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(59, 3, 'children', NULL, NULL, 'text', NULL, NULL, 'text', NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(60, 3, 'custom_design', NULL, NULL, 'varchar', NULL, NULL, 'select', 'Custom Design', NULL, 'Magento\\Theme\\Model\\Theme\\Source\\Theme', 0, 0, NULL, 0, NULL),
(61, 3, 'custom_design_from', 'Magento\\Catalog\\Model\\ResourceModel\\Eav\\Attribute', 'Magento\\Catalog\\Model\\Attribute\\Backend\\Startdate', 'datetime', NULL, 'Magento\\Eav\\Model\\Entity\\Attribute\\Frontend\\Datetime', 'date', 'Active From', NULL, NULL, 0, 0, NULL, 0, NULL),
(62, 3, 'custom_design_to', NULL, 'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\Datetime', 'datetime', NULL, NULL, 'date', 'Active To', NULL, NULL, 0, 0, NULL, 0, NULL),
(63, 3, 'page_layout', NULL, NULL, 'varchar', NULL, NULL, 'select', 'Page Layout', NULL, 'Magento\\Catalog\\Model\\Category\\Attribute\\Source\\Layout', 0, 0, NULL, 0, NULL),
(64, 3, 'custom_layout_update', NULL, 'Magento\\Catalog\\Model\\Attribute\\Backend\\Customlayoutupdate', 'text', NULL, NULL, 'textarea', 'Custom Layout Update', NULL, NULL, 0, 0, NULL, 0, NULL),
(65, 3, 'level', NULL, NULL, 'static', NULL, NULL, 'text', 'Level', NULL, NULL, 0, 0, NULL, 0, NULL),
(66, 3, 'children_count', NULL, NULL, 'static', NULL, NULL, 'text', 'Children Count', NULL, NULL, 0, 0, NULL, 0, NULL),
(67, 3, 'available_sort_by', NULL, 'Magento\\Catalog\\Model\\Category\\Attribute\\Backend\\Sortby', 'text', NULL, NULL, 'multiselect', 'Available Product Listing Sort By', NULL, 'Magento\\Catalog\\Model\\Category\\Attribute\\Source\\Sortby', 1, 0, NULL, 0, NULL),
(68, 3, 'default_sort_by', NULL, 'Magento\\Catalog\\Model\\Category\\Attribute\\Backend\\Sortby', 'varchar', NULL, NULL, 'select', 'Default Product Listing Sort By', NULL, 'Magento\\Catalog\\Model\\Category\\Attribute\\Source\\Sortby', 1, 0, NULL, 0, NULL),
(69, 3, 'include_in_menu', NULL, NULL, 'int', NULL, NULL, 'select', 'Include in Navigation Menu', NULL, 'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Boolean', 1, 0, '1', 0, NULL),
(70, 3, 'custom_use_parent_settings', NULL, NULL, 'int', NULL, NULL, 'select', 'Use Parent Category Settings', NULL, 'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Boolean', 0, 0, NULL, 0, NULL),
(71, 3, 'custom_apply_to_products', NULL, NULL, 'int', NULL, NULL, 'select', 'Apply To Products', NULL, 'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Boolean', 0, 0, NULL, 0, NULL),
(72, 3, 'filter_price_range', NULL, NULL, 'decimal', NULL, NULL, 'text', 'Layered Navigation Price Step', NULL, NULL, 0, 0, NULL, 0, NULL),
(73, 4, 'name', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Product Name', 'validate-length maximum-length-255', NULL, 1, 0, NULL, 0, NULL),
(74, 4, 'sku', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Sku', 'static', NULL, NULL, 'text', 'SKU', 'validate-length maximum-length-64', NULL, 1, 0, NULL, 1, NULL),
(75, 4, 'description', NULL, NULL, 'text', NULL, NULL, 'textarea', 'Description', NULL, NULL, 0, 0, NULL, 0, NULL),
(76, 4, 'short_description', NULL, NULL, 'text', NULL, NULL, 'textarea', 'Short Description', NULL, NULL, 0, 0, NULL, 0, NULL),
(77, 4, 'price', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Price', 'decimal', NULL, NULL, 'price', 'Price', NULL, NULL, 1, 0, NULL, 0, NULL),
(78, 4, 'special_price', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Price', 'decimal', NULL, NULL, 'price', 'Special Price', NULL, NULL, 0, 0, NULL, 0, NULL),
(79, 4, 'special_from_date', NULL, 'Magento\\Catalog\\Model\\Attribute\\Backend\\Startdate', 'datetime', NULL, NULL, 'date', 'Special Price From Date', NULL, NULL, 0, 0, NULL, 0, NULL),
(80, 4, 'special_to_date', NULL, 'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\Datetime', 'datetime', NULL, NULL, 'date', 'Special Price To Date', NULL, NULL, 0, 0, NULL, 0, NULL),
(81, 4, 'cost', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Price', 'decimal', NULL, NULL, 'price', 'Cost', NULL, NULL, 0, 1, NULL, 0, NULL),
(82, 4, 'weight', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Weight', 'decimal', NULL, NULL, 'weight', 'Weight', NULL, NULL, 0, 0, NULL, 0, NULL),
(83, 4, 'manufacturer', NULL, NULL, 'int', NULL, NULL, 'select', 'Manufacturer', NULL, NULL, 0, 1, NULL, 0, NULL),
(84, 4, 'meta_title', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Meta Title', NULL, NULL, 0, 0, NULL, 0, NULL),
(85, 4, 'meta_keyword', NULL, NULL, 'text', NULL, NULL, 'textarea', 'Meta Keywords', NULL, NULL, 0, 0, NULL, 0, NULL),
(86, 4, 'meta_description', NULL, NULL, 'varchar', NULL, NULL, 'textarea', 'Meta Description', NULL, NULL, 0, 0, NULL, 0, 'Maximum 255 chars. Meta Description should optimally be between 150-160 characters'),
(87, 4, 'image', NULL, NULL, 'varchar', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Frontend\\Image', 'media_image', 'Base', NULL, NULL, 0, 0, NULL, 0, NULL),
(88, 4, 'small_image', NULL, NULL, 'varchar', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Frontend\\Image', 'media_image', 'Small', NULL, NULL, 0, 0, NULL, 0, NULL),
(89, 4, 'thumbnail', NULL, NULL, 'varchar', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Frontend\\Image', 'media_image', 'Thumbnail', NULL, NULL, 0, 0, NULL, 0, NULL),
(90, 4, 'media_gallery', NULL, NULL, 'static', NULL, NULL, 'gallery', 'Media Gallery', NULL, NULL, 0, 0, NULL, 0, NULL),
(91, 4, 'old_id', NULL, NULL, 'int', NULL, NULL, 'text', NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(92, 4, 'tier_price', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Tierprice', 'decimal', NULL, NULL, 'text', 'Tier Price', NULL, NULL, 0, 0, NULL, 0, NULL),
(93, 4, 'color', NULL, NULL, 'int', NULL, NULL, 'select', 'Color', NULL, NULL, 0, 1, NULL, 0, NULL),
(94, 4, 'news_from_date', NULL, 'Magento\\Catalog\\Model\\Attribute\\Backend\\Startdate', 'datetime', NULL, NULL, 'date', 'Set Product as New from Date', NULL, NULL, 0, 0, NULL, 0, NULL),
(95, 4, 'news_to_date', NULL, 'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\Datetime', 'datetime', NULL, NULL, 'date', 'Set Product as New to Date', NULL, NULL, 0, 0, NULL, 0, NULL),
(96, 4, 'gallery', NULL, NULL, 'varchar', NULL, NULL, 'gallery', 'Image Gallery', NULL, NULL, 0, 0, NULL, 0, NULL),
(97, 4, 'status', NULL, NULL, 'int', NULL, NULL, 'select', 'Enable Product', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Source\\Status', 0, 0, '1', 0, NULL),
(98, 4, 'minimal_price', NULL, NULL, 'decimal', NULL, NULL, 'price', 'Minimal Price', NULL, NULL, 0, 0, NULL, 0, NULL),
(99, 4, 'visibility', NULL, NULL, 'int', NULL, NULL, 'select', 'Visibility', NULL, 'Magento\\Catalog\\Model\\Product\\Visibility', 0, 0, '4', 0, NULL),
(100, 4, 'custom_design', NULL, NULL, 'varchar', NULL, NULL, 'select', 'New Theme', NULL, 'Magento\\Theme\\Model\\Theme\\Source\\Theme', 0, 0, NULL, 0, NULL),
(101, 4, 'custom_design_from', NULL, 'Magento\\Catalog\\Model\\Attribute\\Backend\\Startdate', 'datetime', NULL, NULL, 'date', 'Active From', NULL, NULL, 0, 0, NULL, 0, NULL),
(102, 4, 'custom_design_to', NULL, 'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\Datetime', 'datetime', NULL, NULL, 'date', 'Active To', NULL, NULL, 0, 0, NULL, 0, NULL),
(103, 4, 'custom_layout_update', NULL, 'Magento\\Catalog\\Model\\Attribute\\Backend\\Customlayoutupdate', 'text', NULL, NULL, 'textarea', 'Layout Update XML', NULL, NULL, 0, 0, NULL, 0, NULL),
(104, 4, 'page_layout', NULL, NULL, 'varchar', NULL, NULL, 'select', 'Layout', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Source\\Layout', 0, 0, NULL, 0, NULL),
(105, 4, 'category_ids', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Category', 'static', NULL, NULL, 'text', 'Categories', NULL, NULL, 0, 0, NULL, 0, NULL),
(106, 4, 'options_container', NULL, NULL, 'varchar', NULL, NULL, 'select', 'Display Product Options In', NULL, 'Magento\\Catalog\\Model\\Entity\\Product\\Attribute\\Design\\Options\\Container', 0, 0, 'container2', 0, NULL),
(107, 4, 'required_options', NULL, NULL, 'static', NULL, NULL, 'text', NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(108, 4, 'has_options', NULL, NULL, 'static', NULL, NULL, 'text', NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(109, 4, 'image_label', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Image Label', NULL, NULL, 0, 0, NULL, 0, NULL),
(110, 4, 'small_image_label', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Small Image Label', NULL, NULL, 0, 0, NULL, 0, NULL),
(111, 4, 'thumbnail_label', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Thumbnail Label', NULL, NULL, 0, 0, NULL, 0, NULL),
(112, 4, 'created_at', NULL, NULL, 'static', NULL, NULL, 'date', NULL, NULL, NULL, 1, 0, NULL, 0, NULL),
(113, 4, 'updated_at', NULL, NULL, 'static', NULL, NULL, 'date', NULL, NULL, NULL, 1, 0, NULL, 0, NULL),
(114, 4, 'country_of_manufacture', NULL, NULL, 'varchar', NULL, NULL, 'select', 'Country of Manufacture', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Source\\Countryofmanufacture', 0, 0, NULL, 0, NULL),
(115, 4, 'quantity_and_stock_status', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Stock', 'int', NULL, NULL, 'select', 'Quantity', NULL, 'Magento\\CatalogInventory\\Model\\Source\\Stock', 0, 0, '1', 0, NULL),
(116, 4, 'custom_layout', NULL, NULL, 'varchar', NULL, NULL, 'select', 'New Layout', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Source\\Layout', 0, 0, NULL, 0, NULL),
(117, 4, 'msrp', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Price', 'decimal', NULL, NULL, 'price', 'Manufacturer''s Suggested Retail Price', NULL, NULL, 0, 0, NULL, 0, NULL),
(118, 4, 'msrp_display_actual_price_type', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Boolean', 'varchar', NULL, NULL, 'select', 'Display Actual Price', NULL, 'Magento\\Msrp\\Model\\Product\\Attribute\\Source\\Type\\Price', 0, 0, '0', 0, NULL),
(119, 3, 'url_key', NULL, NULL, 'varchar', NULL, NULL, 'text', 'URL Key', NULL, NULL, 0, 0, NULL, 0, NULL),
(120, 3, 'url_path', NULL, NULL, 'varchar', NULL, NULL, 'text', NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(121, 4, 'url_key', NULL, NULL, 'varchar', NULL, NULL, 'text', 'URL Key', NULL, NULL, 0, 0, NULL, 0, NULL),
(122, 4, 'url_path', NULL, NULL, 'varchar', NULL, NULL, 'text', NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(123, 4, 'links_purchased_separately', NULL, NULL, 'int', NULL, NULL, NULL, 'Links can be purchased separately', NULL, NULL, 1, 0, NULL, 0, NULL),
(124, 4, 'samples_title', NULL, NULL, 'varchar', NULL, NULL, NULL, 'Samples title', NULL, NULL, 1, 0, NULL, 0, NULL),
(125, 4, 'links_title', NULL, NULL, 'varchar', NULL, NULL, NULL, 'Links title', NULL, NULL, 1, 0, NULL, 0, NULL),
(126, 4, 'links_exist', NULL, NULL, 'int', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '0', 0, NULL),
(127, 4, 'gift_message_available', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Boolean', 'varchar', NULL, NULL, 'select', 'Allow Gift Message', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Source\\Boolean', 0, 0, NULL, 0, NULL),
(128, 4, 'swatch_image', NULL, NULL, 'varchar', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Frontend\\Image', 'media_image', 'Swatch', NULL, NULL, 0, 0, NULL, 0, NULL),
(129, 4, 'tax_class_id', NULL, NULL, 'int', NULL, NULL, 'select', 'Tax Class', NULL, 'Magento\\Tax\\Model\\TaxClass\\Source\\Product', 0, 0, '2', 0, NULL),
(130, 4, 'price_type', NULL, NULL, 'int', NULL, NULL, 'boolean', 'Dynamic Price', NULL, NULL, 1, 0, '0', 0, NULL),
(131, 4, 'sku_type', NULL, NULL, 'int', NULL, NULL, 'boolean', 'Dynamic SKU', NULL, NULL, 1, 0, '0', 0, NULL),
(132, 4, 'weight_type', NULL, NULL, 'int', NULL, NULL, 'boolean', 'Dynamic Weight', NULL, NULL, 1, 0, '0', 0, NULL),
(133, 4, 'price_view', NULL, NULL, 'int', NULL, NULL, 'select', 'Price View', NULL, 'Magento\\Bundle\\Model\\Product\\Attribute\\Source\\Price\\View', 1, 0, NULL, 0, NULL),
(134, 4, 'shipment_type', NULL, NULL, 'int', NULL, NULL, 'select', 'Ship Bundle Items', NULL, 'Magento\\Bundle\\Model\\Product\\Attribute\\Source\\Shipment\\Type', 1, 0, '0', 0, NULL),
(135, 4, 'ts_dimensions_length', NULL, NULL, 'decimal', NULL, NULL, 'text', 'Length', NULL, NULL, 0, 0, NULL, 0, NULL),
(136, 4, 'ts_dimensions_width', NULL, NULL, 'decimal', NULL, NULL, 'text', 'Width', NULL, NULL, 0, 0, NULL, 0, NULL),
(137, 4, 'ts_dimensions_height', NULL, NULL, 'decimal', NULL, NULL, 'text', 'Height', NULL, NULL, 0, 0, NULL, 0, NULL),
(138, 4, 'attr_360_model', NULL, NULL, 'varchar', NULL, NULL, 'text', '360 Model', NULL, NULL, 0, 1, NULL, 0, NULL),
(139, 4, 'awsimageurl', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Aws Image Url', NULL, NULL, 0, 1, NULL, 0, NULL),
(140, 4, 'brand_logo', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Brand Logo', NULL, NULL, 0, 1, NULL, 0, NULL),
(141, 4, 'cabinets', NULL, NULL, 'int', NULL, NULL, 'select', 'Cabinets', NULL, 'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Table', 1, 1, '', 0, NULL),
(142, 4, 'cabinet_color_image', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Cabinet Color Image ', NULL, NULL, 0, 1, NULL, 0, NULL),
(143, 4, 'shell', NULL, NULL, 'int', NULL, NULL, 'select', 'Shell', NULL, 'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Table', 0, 1, '', 0, NULL),
(144, 4, 'shell_color_image', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Shell Color Image ', NULL, NULL, 0, 1, NULL, 0, NULL),
(145, 4, 'capacity', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Capacity', NULL, NULL, 0, 1, NULL, 0, NULL),
(146, 4, 'dimensions', NULL, NULL, 'varchar', NULL, NULL, 'text', ' Dimensions', NULL, NULL, 0, 1, NULL, 0, NULL),
(147, 4, 'jet_count', NULL, NULL, 'varchar', NULL, NULL, 'text', ' Jet Count', NULL, NULL, 0, 1, NULL, 0, NULL),
(148, 4, 'get_brochure', NULL, NULL, 'varchar', NULL, NULL, 'text', ' Get Brochure', NULL, NULL, 0, 1, NULL, 0, NULL),
(149, 4, 'financing', NULL, NULL, 'varchar', NULL, NULL, 'text', ' Financing', NULL, NULL, 0, 1, NULL, 0, NULL),
(150, 4, 'get_pricing', NULL, NULL, 'varchar', NULL, NULL, 'text', ' Get Pricing', NULL, NULL, 0, 1, NULL, 0, NULL),
(151, 4, 'hot_tub_buyers_guide', NULL, NULL, 'varchar', NULL, NULL, 'text', ' Hot Tub Buyers Guide', NULL, NULL, 0, 1, NULL, 0, NULL),
(152, 4, 'schedule_a_test_soak', NULL, NULL, 'varchar', NULL, NULL, 'text', ' Schedule a Test Soak', NULL, NULL, 0, 1, NULL, 0, NULL),
(153, 4, 'trade_ins', NULL, NULL, 'varchar', NULL, NULL, 'text', ' Trade Ins', NULL, NULL, 0, 1, NULL, 0, NULL),
(154, 4, 'primary_specification', NULL, NULL, 'text', NULL, NULL, 'textarea', 'Primary Specification', NULL, NULL, 0, 1, NULL, 0, NULL),
(155, 4, 'secondary_specification', NULL, NULL, 'text', NULL, NULL, 'textarea', ' Secondary Specification', NULL, NULL, 0, 1, NULL, 0, NULL),
(156, 4, 'notes', NULL, NULL, 'text', NULL, NULL, 'textarea', 'Notes', NULL, NULL, 0, 1, NULL, 0, NULL),
(157, 4, 'specification_image', NULL, NULL, 'text', NULL, NULL, 'textarea', 'Specification Image', NULL, NULL, 0, 1, NULL, 0, NULL),
(158, 4, 'owner_manual', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Owner Manual', NULL, NULL, 0, 1, NULL, 0, NULL),
(159, 4, 'spec_sheet', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Spec sheet', NULL, NULL, 0, 1, NULL, 0, NULL),
(160, 4, 'aws_image_url', NULL, NULL, 'varchar', NULL, NULL, 'text', ' Aws Image Url', NULL, NULL, 0, 1, NULL, 0, NULL),
(161, 4, 'jet_system', NULL, NULL, 'text', NULL, NULL, 'textarea', ' Jet System', NULL, NULL, 0, 1, NULL, 0, NULL),
(162, 4, 'subtitle', NULL, NULL, 'varchar', NULL, NULL, 'text', ' Subtitle', NULL, NULL, 0, 1, NULL, 0, NULL),
(163, 4, 'warranty', NULL, NULL, 'varchar', NULL, NULL, 'text', ' Warranty', NULL, NULL, 0, 1, NULL, 0, NULL),
(164, 4, 'ecommerce_yes_no', NULL, NULL, 'int', NULL, NULL, 'boolean', 'Ecommerce(Yes/No) ', NULL, 'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Boolean', 0, 1, '0', 0, NULL),
(165, 4, 'hot_tub_banner_image', NULL, NULL, 'varchar', NULL, NULL, 'media_image', 'hot_tub_banner_image', NULL, NULL, 0, 1, NULL, 0, NULL),
(166, 4, 'features', NULL, NULL, 'text', NULL, NULL, 'textarea', 'features', NULL, NULL, 0, 1, NULL, 0, NULL),
(167, 4, 'featured', NULL, NULL, 'int', NULL, NULL, 'boolean', 'Is Featured', NULL, 'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Boolean', 0, 1, '0', 0, NULL),
(168, 4, 'customproductlayout', NULL, NULL, 'int', NULL, NULL, 'boolean', 'Custom Layout', NULL, 'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Boolean', 0, 1, '0', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `eav_attribute_group`
--

CREATE TABLE IF NOT EXISTS `eav_attribute_group` (
  `attribute_group_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Attribute Group Id',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Set Id',
  `attribute_group_name` varchar(255) DEFAULT NULL COMMENT 'Attribute Group Name',
  `sort_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `default_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Default Id',
  `attribute_group_code` varchar(255) NOT NULL COMMENT 'Attribute Group Code',
  `tab_group_code` varchar(255) DEFAULT NULL COMMENT 'Tab Group Code',
  PRIMARY KEY (`attribute_group_id`),
  UNIQUE KEY `EAV_ATTRIBUTE_GROUP_ATTRIBUTE_SET_ID_ATTRIBUTE_GROUP_CODE` (`attribute_set_id`,`attribute_group_code`),
  UNIQUE KEY `EAV_ATTRIBUTE_GROUP_ATTRIBUTE_SET_ID_ATTRIBUTE_GROUP_NAME` (`attribute_set_id`,`attribute_group_name`),
  KEY `EAV_ATTRIBUTE_GROUP_ATTRIBUTE_SET_ID_SORT_ORDER` (`attribute_set_id`,`sort_order`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Group' AUTO_INCREMENT=36 ;

--
-- Dumping data for table `eav_attribute_group`
--

INSERT INTO `eav_attribute_group` (`attribute_group_id`, `attribute_set_id`, `attribute_group_name`, `sort_order`, `default_id`, `attribute_group_code`, `tab_group_code`) VALUES
(1, 1, 'General', 1, 1, 'general', NULL),
(2, 2, 'General', 1, 1, 'general', NULL),
(3, 3, 'General', 10, 1, 'general', NULL),
(4, 3, 'General Information', 2, 0, 'general-information', NULL),
(5, 3, 'Display Settings', 20, 0, 'display-settings', NULL),
(6, 3, 'Custom Design', 30, 0, 'custom-design', NULL),
(7, 4, 'Product Details', 1, 1, 'product-details', 'basic'),
(8, 4, 'Advanced Pricing', 6, 0, 'advanced-pricing', 'advanced'),
(9, 4, 'Search Engine Optimization', 5, 0, 'search-engine-optimization', 'basic'),
(10, 4, 'Images', 4, 0, 'image-management', 'basic'),
(11, 4, 'Design', 7, 0, 'design', 'advanced'),
(12, 4, 'Autosettings', 9, 0, 'autosettings', 'advanced'),
(13, 4, 'Content', 2, 0, 'content', 'basic'),
(14, 4, 'Schedule Design Update', 8, 0, 'schedule-design-update', 'advanced'),
(15, 5, 'General', 1, 1, 'general', NULL),
(16, 6, 'General', 1, 1, 'general', NULL),
(17, 7, 'General', 1, 1, 'general', NULL),
(18, 8, 'General', 1, 1, 'general', NULL),
(19, 4, 'Gift Options', 10, 0, 'gift-options', NULL),
(20, 4, 'Bundle Items', 3, 0, 'bundle-items', NULL),
(21, 9, 'Gift Options', 11, 0, 'gift-options', NULL),
(22, 9, 'Autosettings', 10, 0, 'autosettings', 'advanced'),
(23, 9, 'Schedule Design Update', 9, 0, 'schedule-design-update', 'advanced'),
(24, 9, 'Design', 8, 0, 'design', 'advanced'),
(25, 9, 'Advanced Pricing', 7, 0, 'advanced-pricing', 'advanced'),
(26, 9, 'Search Engine Optimization', 6, 0, 'search-engine-optimization', 'basic'),
(27, 9, 'Images', 4, 0, 'image-management', 'basic'),
(28, 9, 'Bundle Items', 3, 0, 'bundle-items', NULL),
(29, 9, 'Content', 2, 0, 'content', 'basic'),
(30, 9, 'Product Details', 1, 1, 'product-details', 'basic'),
(31, 9, 'Custom fields', 5, 0, 'custom-fields', NULL),
(32, 9, 'Specifications', 12, 0, 'specifications', NULL),
(33, 9, 'Call to action', 13, 0, 'call-to-action', NULL),
(34, 9, 'Hot tub sorting fields', 14, 0, 'hot-tub-sorting-fields', NULL),
(35, 9, 'Hot tub design', 15, 0, 'hot-tub-design', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `eav_attribute_label`
--

CREATE TABLE IF NOT EXISTS `eav_attribute_label` (
  `attribute_label_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Attribute Label Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`attribute_label_id`),
  KEY `EAV_ATTRIBUTE_LABEL_STORE_ID` (`store_id`),
  KEY `EAV_ATTRIBUTE_LABEL_ATTRIBUTE_ID_STORE_ID` (`attribute_id`,`store_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Label' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `eav_attribute_label`
--

INSERT INTO `eav_attribute_label` (`attribute_label_id`, `attribute_id`, `store_id`, `value`) VALUES
(1, 138, 1, '360 Model'),
(2, 139, 1, 'Aws Image Url');

-- --------------------------------------------------------

--
-- Table structure for table `eav_attribute_option`
--

CREATE TABLE IF NOT EXISTS `eav_attribute_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`option_id`),
  KEY `EAV_ATTRIBUTE_OPTION_ATTRIBUTE_ID` (`attribute_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Option' AUTO_INCREMENT=20 ;

--
-- Dumping data for table `eav_attribute_option`
--

INSERT INTO `eav_attribute_option` (`option_id`, `attribute_id`, `sort_order`) VALUES
(1, 20, 0),
(2, 20, 1),
(3, 20, 3),
(4, 141, 1),
(5, 141, 2),
(6, 141, 3),
(7, 141, 4),
(8, 141, 5),
(9, 141, 6),
(10, 141, 7),
(11, 141, 8),
(12, 143, 1),
(13, 143, 2),
(14, 143, 3),
(15, 143, 4),
(16, 143, 5),
(17, 143, 6),
(18, 143, 7),
(19, 143, 8);

-- --------------------------------------------------------

--
-- Table structure for table `eav_attribute_option_swatch`
--

CREATE TABLE IF NOT EXISTS `eav_attribute_option_swatch` (
  `swatch_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Swatch ID',
  `option_id` int(10) unsigned NOT NULL COMMENT 'Option ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `type` smallint(5) unsigned NOT NULL COMMENT 'Swatch type: 0 - text, 1 - visual color, 2 - visual image',
  `value` varchar(255) DEFAULT NULL COMMENT 'Swatch Value',
  PRIMARY KEY (`swatch_id`),
  UNIQUE KEY `EAV_ATTRIBUTE_OPTION_SWATCH_STORE_ID_OPTION_ID` (`store_id`,`option_id`),
  KEY `EAV_ATTR_OPT_SWATCH_OPT_ID_EAV_ATTR_OPT_OPT_ID` (`option_id`),
  KEY `EAV_ATTRIBUTE_OPTION_SWATCH_SWATCH_ID` (`swatch_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Magento Swatches table' AUTO_INCREMENT=17 ;

--
-- Dumping data for table `eav_attribute_option_swatch`
--

INSERT INTO `eav_attribute_option_swatch` (`swatch_id`, `option_id`, `store_id`, `type`, `value`) VALUES
(1, 4, 0, 2, '/s/w/swatch-cabinet-mocha.jpg'),
(2, 5, 0, 2, '/s/w/swatch-cabinet-monterey-gray.jpg'),
(3, 6, 0, 2, '/s/w/swatch-cabinet-teak.jpg'),
(4, 7, 0, 2, '/c/o/color-sand2-40x40.png'),
(5, 8, 0, 2, '/c/o/color-taupe-40x40_1.png'),
(6, 9, 0, 2, '/c/o/color-espresso-40x40.png'),
(7, 10, 0, 2, '/s/l/slate.jpg'),
(8, 11, 0, 2, '/b/r/brownstone.jpg'),
(9, 12, 0, 2, '/s/w/swatch-shell-alpine-white_1.jpg'),
(10, 13, 0, 2, '/s/w/swatch-shell-creme.jpg'),
(11, 14, 0, 2, '/s/w/swatch-shell-tuscan-sun.jpg'),
(12, 15, 0, 2, '/s/w/swatch-shell-desert.jpg'),
(13, 16, 0, 2, '/s/w/swatch-shell-ice-gray_1.jpg'),
(14, 17, 0, 2, '/s/w/swatch-shell-platinum.jpg'),
(15, 18, 0, 2, '/c/a/canyon.jpg'),
(16, 19, 0, 2, '/a/r/arctic-white.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `eav_attribute_option_value`
--

CREATE TABLE IF NOT EXISTS `eav_attribute_option_value` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  KEY `EAV_ATTRIBUTE_OPTION_VALUE_OPTION_ID` (`option_id`),
  KEY `EAV_ATTRIBUTE_OPTION_VALUE_STORE_ID` (`store_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Option Value' AUTO_INCREMENT=180 ;

--
-- Dumping data for table `eav_attribute_option_value`
--

INSERT INTO `eav_attribute_option_value` (`value_id`, `option_id`, `store_id`, `value`) VALUES
(1, 1, 0, 'Male'),
(2, 2, 0, 'Female'),
(3, 3, 0, 'Not Specified'),
(132, 4, 1, 'Mocha'),
(133, 4, 0, 'Mocha'),
(134, 5, 1, 'Monterey Gray'),
(135, 5, 0, 'Monterey Gray'),
(136, 6, 1, 'Teak'),
(137, 6, 0, 'Teak'),
(138, 7, 1, 'Sand'),
(139, 7, 0, 'Sand'),
(140, 8, 1, 'Taupe'),
(141, 8, 0, 'Taupe'),
(142, 9, 1, 'Espresso'),
(143, 9, 0, 'Espresso'),
(144, 10, 1, 'Slate'),
(145, 10, 0, 'Slate'),
(146, 11, 1, 'Brownstone'),
(147, 11, 0, 'Brownstone'),
(164, 12, 1, 'Alpine White'),
(165, 12, 0, 'Alpine White'),
(166, 13, 1, 'Crème'),
(167, 13, 0, 'Crème'),
(168, 14, 1, 'Tuscan Sun'),
(169, 14, 0, 'Tuscan Sun'),
(170, 15, 1, 'Desert'),
(171, 15, 0, 'Desert'),
(172, 16, 1, 'Ice Gray'),
(173, 16, 0, 'Ice Gray'),
(174, 17, 1, 'Platinum'),
(175, 17, 0, 'Platinum'),
(176, 18, 1, 'Midnight Canyon'),
(177, 18, 0, 'Midnight Canyon'),
(178, 19, 1, 'Arctic White'),
(179, 19, 0, 'Arctic White');

-- --------------------------------------------------------

--
-- Table structure for table `eav_attribute_set`
--

CREATE TABLE IF NOT EXISTS `eav_attribute_set` (
  `attribute_set_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Attribute Set Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_set_name` varchar(255) DEFAULT NULL COMMENT 'Attribute Set Name',
  `sort_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`attribute_set_id`),
  UNIQUE KEY `EAV_ATTRIBUTE_SET_ENTITY_TYPE_ID_ATTRIBUTE_SET_NAME` (`entity_type_id`,`attribute_set_name`),
  KEY `EAV_ATTRIBUTE_SET_ENTITY_TYPE_ID_SORT_ORDER` (`entity_type_id`,`sort_order`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Set' AUTO_INCREMENT=10 ;

--
-- Dumping data for table `eav_attribute_set`
--

INSERT INTO `eav_attribute_set` (`attribute_set_id`, `entity_type_id`, `attribute_set_name`, `sort_order`) VALUES
(1, 1, 'Default', 2),
(2, 2, 'Default', 2),
(3, 3, 'Default', 1),
(4, 4, 'Default', 1),
(5, 5, 'Default', 1),
(6, 6, 'Default', 1),
(7, 7, 'Default', 1),
(8, 8, 'Default', 1),
(9, 4, 'Hot Tub', 0);

-- --------------------------------------------------------

--
-- Table structure for table `eav_entity`
--

CREATE TABLE IF NOT EXISTS `eav_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Set Id',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Parent Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `is_active` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Defines Is Entity Active',
  PRIMARY KEY (`entity_id`),
  KEY `EAV_ENTITY_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `EAV_ENTITY_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `eav_entity_attribute`
--

CREATE TABLE IF NOT EXISTS `eav_entity_attribute` (
  `entity_attribute_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Attribute Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Set Id',
  `attribute_group_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Group Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `sort_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`entity_attribute_id`),
  UNIQUE KEY `EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_SET_ID_ATTRIBUTE_ID` (`attribute_set_id`,`attribute_id`),
  UNIQUE KEY `EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_GROUP_ID_ATTRIBUTE_ID` (`attribute_group_id`,`attribute_id`),
  KEY `EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_SET_ID_SORT_ORDER` (`attribute_set_id`,`sort_order`),
  KEY `EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_ID` (`attribute_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Eav Entity Attributes' AUTO_INCREMENT=871 ;

--
-- Dumping data for table `eav_entity_attribute`
--

INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES
(1, 1, 1, 1, 1, 10),
(2, 1, 1, 1, 2, 20),
(3, 1, 1, 1, 3, 20),
(4, 1, 1, 1, 4, 30),
(5, 1, 1, 1, 5, 40),
(6, 1, 1, 1, 6, 50),
(7, 1, 1, 1, 7, 60),
(8, 1, 1, 1, 8, 70),
(9, 1, 1, 1, 9, 80),
(10, 1, 1, 1, 10, 25),
(11, 1, 1, 1, 11, 90),
(12, 1, 1, 1, 12, 81),
(13, 1, 1, 1, 13, 115),
(14, 1, 1, 1, 14, 120),
(15, 1, 1, 1, 15, 82),
(16, 1, 1, 1, 16, 83),
(17, 1, 1, 1, 17, 100),
(18, 1, 1, 1, 18, 0),
(19, 1, 1, 1, 19, 0),
(20, 1, 1, 1, 20, 110),
(21, 1, 1, 1, 21, 28),
(22, 2, 2, 2, 22, 10),
(23, 2, 2, 2, 23, 20),
(24, 2, 2, 2, 24, 30),
(25, 2, 2, 2, 25, 40),
(26, 2, 2, 2, 26, 50),
(27, 2, 2, 2, 27, 60),
(28, 2, 2, 2, 28, 70),
(29, 2, 2, 2, 29, 80),
(30, 2, 2, 2, 30, 90),
(31, 2, 2, 2, 31, 100),
(32, 2, 2, 2, 32, 100),
(33, 2, 2, 2, 33, 110),
(34, 2, 2, 2, 34, 120),
(35, 2, 2, 2, 35, 130),
(36, 2, 2, 2, 36, 140),
(37, 2, 2, 2, 37, 132),
(38, 2, 2, 2, 38, 133),
(39, 2, 2, 2, 39, 134),
(40, 2, 2, 2, 40, 135),
(41, 1, 1, 1, 41, 87),
(42, 1, 1, 1, 42, 100),
(43, 1, 1, 1, 43, 110),
(44, 1, 1, 1, 44, 120),
(45, 3, 3, 4, 45, 1),
(46, 3, 3, 4, 46, 2),
(47, 3, 3, 4, 47, 4),
(48, 3, 3, 4, 48, 5),
(49, 3, 3, 4, 49, 6),
(50, 3, 3, 4, 50, 7),
(51, 3, 3, 4, 51, 8),
(52, 3, 3, 5, 52, 10),
(53, 3, 3, 5, 53, 20),
(54, 3, 3, 5, 54, 30),
(55, 3, 3, 4, 55, 12),
(56, 3, 3, 4, 56, 13),
(57, 3, 3, 4, 57, 14),
(58, 3, 3, 4, 58, 15),
(59, 3, 3, 4, 59, 16),
(60, 3, 3, 6, 60, 10),
(61, 3, 3, 6, 61, 30),
(62, 3, 3, 6, 62, 40),
(63, 3, 3, 6, 63, 50),
(64, 3, 3, 6, 64, 60),
(65, 3, 3, 4, 65, 24),
(66, 3, 3, 4, 66, 25),
(67, 3, 3, 5, 67, 40),
(68, 3, 3, 5, 68, 50),
(69, 3, 3, 4, 69, 10),
(70, 3, 3, 6, 70, 5),
(71, 3, 3, 6, 71, 6),
(72, 3, 3, 5, 72, 51),
(90, 4, 4, 7, 91, 6),
(96, 4, 4, 8, 98, 8),
(105, 4, 4, 7, 107, 14),
(106, 4, 4, 7, 108, 15),
(107, 4, 4, 7, 109, 16),
(108, 4, 4, 7, 110, 17),
(109, 4, 4, 7, 111, 18),
(110, 4, 4, 7, 112, 19),
(111, 4, 4, 7, 113, 20),
(117, 3, 3, 4, 119, 3),
(118, 3, 3, 4, 120, 17),
(120, 4, 4, 7, 122, 11),
(121, 4, 4, 7, 123, 111),
(122, 4, 4, 7, 124, 112),
(123, 4, 4, 7, 125, 113),
(124, 4, 4, 7, 126, 114),
(149, 4, 9, 25, 98, 8),
(167, 4, 9, 30, 91, 6),
(169, 4, 9, 30, 122, 11),
(170, 4, 9, 30, 107, 14),
(171, 4, 9, 30, 108, 15),
(172, 4, 9, 30, 109, 16),
(173, 4, 9, 30, 110, 17),
(174, 4, 9, 30, 111, 18),
(175, 4, 9, 30, 112, 19),
(176, 4, 9, 30, 113, 20),
(193, 4, 9, 30, 123, 111),
(194, 4, 9, 30, 124, 112),
(195, 4, 9, 30, 125, 113),
(196, 4, 9, 30, 126, 114),
(743, 4, 4, 7, 73, 3),
(744, 4, 4, 7, 74, 4),
(745, 4, 4, 7, 77, 8),
(746, 4, 4, 7, 82, 15),
(747, 4, 4, 7, 94, 19),
(748, 4, 4, 7, 95, 20),
(749, 4, 4, 7, 97, 1),
(750, 4, 4, 7, 99, 18),
(751, 4, 4, 7, 105, 17),
(752, 4, 4, 7, 114, 21),
(753, 4, 4, 7, 115, 11),
(754, 4, 4, 7, 129, 10),
(755, 4, 4, 7, 130, 9),
(756, 4, 4, 7, 131, 6),
(757, 4, 4, 7, 132, 16),
(758, 4, 4, 7, 135, 12),
(759, 4, 4, 7, 136, 13),
(760, 4, 4, 7, 137, 14),
(761, 4, 4, 7, 139, 5),
(762, 4, 4, 7, 167, 7),
(763, 4, 4, 7, 168, 2),
(764, 4, 4, 13, 75, 1),
(765, 4, 4, 13, 76, 2),
(766, 4, 4, 20, 134, 1),
(767, 4, 4, 10, 87, 1),
(768, 4, 4, 10, 88, 2),
(769, 4, 4, 10, 89, 3),
(770, 4, 4, 10, 90, 5),
(771, 4, 4, 10, 96, 6),
(772, 4, 4, 10, 128, 4),
(773, 4, 4, 9, 84, 2),
(774, 4, 4, 9, 85, 3),
(775, 4, 4, 9, 86, 4),
(776, 4, 4, 9, 121, 1),
(777, 4, 4, 8, 78, 1),
(778, 4, 4, 8, 79, 2),
(779, 4, 4, 8, 80, 3),
(780, 4, 4, 8, 81, 4),
(781, 4, 4, 8, 92, 5),
(782, 4, 4, 8, 117, 6),
(783, 4, 4, 8, 118, 7),
(784, 4, 4, 8, 133, 8),
(785, 4, 4, 11, 103, 3),
(786, 4, 4, 11, 104, 1),
(787, 4, 4, 11, 106, 2),
(788, 4, 4, 14, 100, 3),
(789, 4, 4, 14, 101, 1),
(790, 4, 4, 14, 102, 2),
(791, 4, 4, 14, 116, 4),
(792, 4, 4, 19, 127, 1),
(793, 4, 9, 30, 73, 3),
(794, 4, 9, 30, 74, 4),
(795, 4, 9, 30, 77, 7),
(796, 4, 9, 30, 82, 15),
(797, 4, 9, 30, 94, 19),
(798, 4, 9, 30, 95, 20),
(799, 4, 9, 30, 97, 1),
(800, 4, 9, 30, 99, 18),
(801, 4, 9, 30, 105, 17),
(802, 4, 9, 30, 114, 21),
(803, 4, 9, 30, 115, 11),
(804, 4, 9, 30, 129, 10),
(805, 4, 9, 30, 130, 9),
(806, 4, 9, 30, 131, 6),
(807, 4, 9, 30, 132, 16),
(808, 4, 9, 30, 135, 12),
(809, 4, 9, 30, 136, 13),
(810, 4, 9, 30, 137, 14),
(811, 4, 9, 30, 139, 5),
(812, 4, 9, 30, 167, 8),
(813, 4, 9, 30, 168, 2),
(814, 4, 9, 29, 75, 1),
(815, 4, 9, 29, 76, 2),
(816, 4, 9, 28, 134, 1),
(817, 4, 9, 27, 87, 1),
(818, 4, 9, 27, 88, 2),
(819, 4, 9, 27, 89, 3),
(820, 4, 9, 27, 90, 5),
(821, 4, 9, 27, 96, 6),
(822, 4, 9, 27, 128, 4),
(823, 4, 9, 27, 165, 7),
(824, 4, 9, 31, 138, 1),
(825, 4, 9, 31, 140, 4),
(826, 4, 9, 31, 160, 3),
(827, 4, 9, 31, 161, 5),
(828, 4, 9, 31, 162, 7),
(829, 4, 9, 31, 164, 6),
(830, 4, 9, 31, 166, 2),
(831, 4, 9, 26, 84, 2),
(832, 4, 9, 26, 85, 3),
(833, 4, 9, 26, 86, 4),
(834, 4, 9, 26, 121, 1),
(835, 4, 9, 25, 78, 1),
(836, 4, 9, 25, 79, 2),
(837, 4, 9, 25, 80, 3),
(838, 4, 9, 25, 81, 4),
(839, 4, 9, 25, 92, 5),
(840, 4, 9, 25, 117, 6),
(841, 4, 9, 25, 118, 7),
(842, 4, 9, 25, 133, 8),
(843, 4, 9, 24, 103, 3),
(844, 4, 9, 24, 104, 1),
(845, 4, 9, 24, 106, 2),
(846, 4, 9, 23, 100, 3),
(847, 4, 9, 23, 101, 1),
(848, 4, 9, 23, 102, 2),
(849, 4, 9, 23, 116, 4),
(850, 4, 9, 21, 127, 1),
(851, 4, 9, 32, 154, 1),
(852, 4, 9, 32, 155, 2),
(853, 4, 9, 32, 156, 4),
(854, 4, 9, 32, 157, 3),
(855, 4, 9, 32, 158, 5),
(856, 4, 9, 32, 159, 6),
(857, 4, 9, 32, 163, 7),
(858, 4, 9, 33, 148, 1),
(859, 4, 9, 33, 149, 3),
(860, 4, 9, 33, 150, 2),
(861, 4, 9, 33, 151, 4),
(862, 4, 9, 33, 152, 5),
(863, 4, 9, 33, 153, 6),
(864, 4, 9, 34, 145, 3),
(865, 4, 9, 34, 146, 2),
(866, 4, 9, 34, 147, 1),
(867, 4, 9, 35, 141, 1),
(868, 4, 9, 35, 142, 2),
(869, 4, 9, 35, 143, 3),
(870, 4, 9, 35, 144, 4);

-- --------------------------------------------------------

--
-- Table structure for table `eav_entity_datetime`
--

CREATE TABLE IF NOT EXISTS `eav_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` datetime DEFAULT NULL COMMENT 'Attribute Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `EAV_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `EAV_ENTITY_DATETIME_STORE_ID` (`store_id`),
  KEY `EAV_ENTITY_DATETIME_ATTRIBUTE_ID_VALUE` (`attribute_id`,`value`),
  KEY `EAV_ENTITY_DATETIME_ENTITY_TYPE_ID_VALUE` (`entity_type_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Value Prefix' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `eav_entity_decimal`
--

CREATE TABLE IF NOT EXISTS `eav_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Attribute Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `EAV_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `EAV_ENTITY_DECIMAL_STORE_ID` (`store_id`),
  KEY `EAV_ENTITY_DECIMAL_ATTRIBUTE_ID_VALUE` (`attribute_id`,`value`),
  KEY `EAV_ENTITY_DECIMAL_ENTITY_TYPE_ID_VALUE` (`entity_type_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Value Prefix' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `eav_entity_int`
--

CREATE TABLE IF NOT EXISTS `eav_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` int(11) NOT NULL DEFAULT '0' COMMENT 'Attribute Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `EAV_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `EAV_ENTITY_INT_STORE_ID` (`store_id`),
  KEY `EAV_ENTITY_INT_ATTRIBUTE_ID_VALUE` (`attribute_id`,`value`),
  KEY `EAV_ENTITY_INT_ENTITY_TYPE_ID_VALUE` (`entity_type_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Value Prefix' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `eav_entity_store`
--

CREATE TABLE IF NOT EXISTS `eav_entity_store` (
  `entity_store_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Store Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `increment_prefix` varchar(20) DEFAULT NULL COMMENT 'Increment Prefix',
  `increment_last_id` varchar(50) DEFAULT NULL COMMENT 'Last Incremented Id',
  PRIMARY KEY (`entity_store_id`),
  KEY `EAV_ENTITY_STORE_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `EAV_ENTITY_STORE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Store' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `eav_entity_text`
--

CREATE TABLE IF NOT EXISTS `eav_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` text NOT NULL COMMENT 'Attribute Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `EAV_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `EAV_ENTITY_TEXT_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `EAV_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `EAV_ENTITY_TEXT_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Value Prefix' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `eav_entity_type`
--

CREATE TABLE IF NOT EXISTS `eav_entity_type` (
  `entity_type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Type Id',
  `entity_type_code` varchar(50) NOT NULL COMMENT 'Entity Type Code',
  `entity_model` varchar(255) NOT NULL COMMENT 'Entity Model',
  `attribute_model` varchar(255) DEFAULT NULL COMMENT 'Attribute Model',
  `entity_table` varchar(255) DEFAULT NULL COMMENT 'Entity Table',
  `value_table_prefix` varchar(255) DEFAULT NULL COMMENT 'Value Table Prefix',
  `entity_id_field` varchar(255) DEFAULT NULL COMMENT 'Entity Id Field',
  `is_data_sharing` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Defines Is Data Sharing',
  `data_sharing_key` varchar(100) DEFAULT 'default' COMMENT 'Data Sharing Key',
  `default_attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Default Attribute Set Id',
  `increment_model` varchar(255) DEFAULT NULL COMMENT 'Increment Model',
  `increment_per_store` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Increment Per Store',
  `increment_pad_length` smallint(5) unsigned NOT NULL DEFAULT '8' COMMENT 'Increment Pad Length',
  `increment_pad_char` varchar(1) NOT NULL DEFAULT '0' COMMENT 'Increment Pad Char',
  `additional_attribute_table` varchar(255) DEFAULT NULL COMMENT 'Additional Attribute Table',
  `entity_attribute_collection` varchar(255) DEFAULT NULL COMMENT 'Entity Attribute Collection',
  PRIMARY KEY (`entity_type_id`),
  KEY `EAV_ENTITY_TYPE_ENTITY_TYPE_CODE` (`entity_type_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Eav Entity Type' AUTO_INCREMENT=9 ;

--
-- Dumping data for table `eav_entity_type`
--

INSERT INTO `eav_entity_type` (`entity_type_id`, `entity_type_code`, `entity_model`, `attribute_model`, `entity_table`, `value_table_prefix`, `entity_id_field`, `is_data_sharing`, `data_sharing_key`, `default_attribute_set_id`, `increment_model`, `increment_per_store`, `increment_pad_length`, `increment_pad_char`, `additional_attribute_table`, `entity_attribute_collection`) VALUES
(1, 'customer', 'Magento\\Customer\\Model\\ResourceModel\\Customer', 'Magento\\Customer\\Model\\Attribute', 'customer_entity', NULL, NULL, 1, 'default', 1, 'Magento\\Eav\\Model\\Entity\\Increment\\NumericValue', 0, 8, '0', 'customer_eav_attribute', 'Magento\\Customer\\Model\\ResourceModel\\Attribute\\Collection'),
(2, 'customer_address', 'Magento\\Customer\\Model\\ResourceModel\\Address', 'Magento\\Customer\\Model\\Attribute', 'customer_address_entity', NULL, NULL, 1, 'default', 2, NULL, 0, 8, '0', 'customer_eav_attribute', 'Magento\\Customer\\Model\\ResourceModel\\Address\\Attribute\\Collection'),
(3, 'catalog_category', 'Magento\\Catalog\\Model\\ResourceModel\\Category', 'Magento\\Catalog\\Model\\ResourceModel\\Eav\\Attribute', 'catalog_category_entity', NULL, NULL, 1, 'default', 3, NULL, 0, 8, '0', 'catalog_eav_attribute', 'Magento\\Catalog\\Model\\ResourceModel\\Category\\Attribute\\Collection'),
(4, 'catalog_product', 'Magento\\Catalog\\Model\\ResourceModel\\Product', 'Magento\\Catalog\\Model\\ResourceModel\\Eav\\Attribute', 'catalog_product_entity', NULL, NULL, 1, 'default', 4, NULL, 0, 8, '0', 'catalog_eav_attribute', 'Magento\\Catalog\\Model\\ResourceModel\\Product\\Attribute\\Collection'),
(5, 'order', 'Magento\\Sales\\Model\\ResourceModel\\Order', NULL, 'sales_order', NULL, NULL, 1, 'default', 5, 'Magento\\Eav\\Model\\Entity\\Increment\\NumericValue', 1, 8, '0', NULL, NULL),
(6, 'invoice', 'Magento\\Sales\\Model\\ResourceModel\\Order\\Invoice', NULL, 'sales_invoice', NULL, NULL, 1, 'default', 6, 'Magento\\Eav\\Model\\Entity\\Increment\\NumericValue', 1, 8, '0', NULL, NULL),
(7, 'creditmemo', 'Magento\\Sales\\Model\\ResourceModel\\Order\\Creditmemo', NULL, 'sales_creditmemo', NULL, NULL, 1, 'default', 7, 'Magento\\Eav\\Model\\Entity\\Increment\\NumericValue', 1, 8, '0', NULL, NULL),
(8, 'shipment', 'Magento\\Sales\\Model\\ResourceModel\\Order\\Shipment', NULL, 'sales_shipment', NULL, NULL, 1, 'default', 8, 'Magento\\Eav\\Model\\Entity\\Increment\\NumericValue', 1, 8, '0', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `eav_entity_varchar`
--

CREATE TABLE IF NOT EXISTS `eav_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` varchar(255) DEFAULT NULL COMMENT 'Attribute Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `EAV_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `EAV_ENTITY_VARCHAR_STORE_ID` (`store_id`),
  KEY `EAV_ENTITY_VARCHAR_ATTRIBUTE_ID_VALUE` (`attribute_id`,`value`),
  KEY `EAV_ENTITY_VARCHAR_ENTITY_TYPE_ID_VALUE` (`entity_type_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Value Prefix' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `eav_form_element`
--

CREATE TABLE IF NOT EXISTS `eav_form_element` (
  `element_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Element Id',
  `type_id` smallint(5) unsigned NOT NULL COMMENT 'Type Id',
  `fieldset_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Fieldset Id',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute Id',
  `sort_order` int(11) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`element_id`),
  UNIQUE KEY `EAV_FORM_ELEMENT_TYPE_ID_ATTRIBUTE_ID` (`type_id`,`attribute_id`),
  KEY `EAV_FORM_ELEMENT_FIELDSET_ID` (`fieldset_id`),
  KEY `EAV_FORM_ELEMENT_ATTRIBUTE_ID` (`attribute_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Eav Form Element' AUTO_INCREMENT=43 ;

--
-- Dumping data for table `eav_form_element`
--

INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES
(1, 1, NULL, 23, 0),
(2, 1, NULL, 25, 1),
(3, 1, NULL, 27, 2),
(4, 1, NULL, 9, 3),
(5, 1, NULL, 28, 4),
(6, 1, NULL, 29, 5),
(7, 1, NULL, 31, 6),
(8, 1, NULL, 33, 7),
(9, 1, NULL, 30, 8),
(10, 1, NULL, 34, 9),
(11, 1, NULL, 35, 10),
(12, 2, NULL, 23, 0),
(13, 2, NULL, 25, 1),
(14, 2, NULL, 27, 2),
(15, 2, NULL, 9, 3),
(16, 2, NULL, 28, 4),
(17, 2, NULL, 29, 5),
(18, 2, NULL, 31, 6),
(19, 2, NULL, 33, 7),
(20, 2, NULL, 30, 8),
(21, 2, NULL, 34, 9),
(22, 2, NULL, 35, 10),
(23, 3, NULL, 23, 0),
(24, 3, NULL, 25, 1),
(25, 3, NULL, 27, 2),
(26, 3, NULL, 28, 3),
(27, 3, NULL, 29, 4),
(28, 3, NULL, 31, 5),
(29, 3, NULL, 33, 6),
(30, 3, NULL, 30, 7),
(31, 3, NULL, 34, 8),
(32, 3, NULL, 35, 9),
(33, 4, NULL, 23, 0),
(34, 4, NULL, 25, 1),
(35, 4, NULL, 27, 2),
(36, 4, NULL, 28, 3),
(37, 4, NULL, 29, 4),
(38, 4, NULL, 31, 5),
(39, 4, NULL, 33, 6),
(40, 4, NULL, 30, 7),
(41, 4, NULL, 34, 8),
(42, 4, NULL, 35, 9);

-- --------------------------------------------------------

--
-- Table structure for table `eav_form_fieldset`
--

CREATE TABLE IF NOT EXISTS `eav_form_fieldset` (
  `fieldset_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Fieldset Id',
  `type_id` smallint(5) unsigned NOT NULL COMMENT 'Type Id',
  `code` varchar(64) NOT NULL COMMENT 'Code',
  `sort_order` int(11) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`fieldset_id`),
  UNIQUE KEY `EAV_FORM_FIELDSET_TYPE_ID_CODE` (`type_id`,`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Form Fieldset' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `eav_form_fieldset_label`
--

CREATE TABLE IF NOT EXISTS `eav_form_fieldset_label` (
  `fieldset_id` smallint(5) unsigned NOT NULL COMMENT 'Fieldset Id',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `label` varchar(255) NOT NULL COMMENT 'Label',
  PRIMARY KEY (`fieldset_id`,`store_id`),
  KEY `EAV_FORM_FIELDSET_LABEL_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Form Fieldset Label';

-- --------------------------------------------------------

--
-- Table structure for table `eav_form_type`
--

CREATE TABLE IF NOT EXISTS `eav_form_type` (
  `type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Type Id',
  `code` varchar(64) NOT NULL COMMENT 'Code',
  `label` varchar(255) NOT NULL COMMENT 'Label',
  `is_system` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is System',
  `theme` varchar(64) DEFAULT NULL COMMENT 'Theme',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  PRIMARY KEY (`type_id`),
  UNIQUE KEY `EAV_FORM_TYPE_CODE_THEME_STORE_ID` (`code`,`theme`,`store_id`),
  KEY `EAV_FORM_TYPE_STORE_ID` (`store_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Eav Form Type' AUTO_INCREMENT=5 ;

--
-- Dumping data for table `eav_form_type`
--

INSERT INTO `eav_form_type` (`type_id`, `code`, `label`, `is_system`, `theme`, `store_id`) VALUES
(1, 'checkout_onepage_register', 'checkout_onepage_register', 1, '', 0),
(2, 'checkout_onepage_register_guest', 'checkout_onepage_register_guest', 1, '', 0),
(3, 'checkout_onepage_billing_address', 'checkout_onepage_billing_address', 1, '', 0),
(4, 'checkout_onepage_shipping_address', 'checkout_onepage_shipping_address', 1, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `eav_form_type_entity`
--

CREATE TABLE IF NOT EXISTS `eav_form_type_entity` (
  `type_id` smallint(5) unsigned NOT NULL COMMENT 'Type Id',
  `entity_type_id` smallint(5) unsigned NOT NULL COMMENT 'Entity Type Id',
  PRIMARY KEY (`type_id`,`entity_type_id`),
  KEY `EAV_FORM_TYPE_ENTITY_ENTITY_TYPE_ID` (`entity_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Form Type Entity';

--
-- Dumping data for table `eav_form_type_entity`
--

INSERT INTO `eav_form_type_entity` (`type_id`, `entity_type_id`) VALUES
(1, 1),
(2, 1),
(1, 2),
(2, 2),
(3, 2),
(4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `email_abandoned_cart`
--

CREATE TABLE IF NOT EXISTS `email_abandoned_cart` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `quote_id` int(10) unsigned DEFAULT NULL COMMENT 'Quote Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer ID',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT 'Email',
  `is_active` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Quote Active',
  `quote_updated_at` timestamp NULL DEFAULT NULL COMMENT 'Quote updated at',
  `abandoned_cart_number` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Abandoned Cart number',
  `items_count` smallint(5) unsigned DEFAULT '0' COMMENT 'Quote items count',
  `items_ids` varchar(255) DEFAULT NULL COMMENT 'Quote item ids',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated at',
  PRIMARY KEY (`id`),
  KEY `EMAIL_ABANDONED_CART_QUOTE_ID` (`quote_id`),
  KEY `EMAIL_ABANDONED_CART_STORE_ID` (`store_id`),
  KEY `EMAIL_ABANDONED_CART_CUSTOMER_ID` (`customer_id`),
  KEY `EMAIL_ABANDONED_CART_EMAIL` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Abandoned Carts Table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `email_automation`
--

CREATE TABLE IF NOT EXISTS `email_automation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `automation_type` varchar(255) DEFAULT NULL COMMENT 'Automation Type',
  `store_name` varchar(255) DEFAULT NULL COMMENT 'Automation Type',
  `enrolment_status` varchar(255) NOT NULL COMMENT 'Entrolment Status',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `type_id` varchar(255) DEFAULT NULL COMMENT 'Type ID',
  `program_id` varchar(255) DEFAULT NULL COMMENT 'Program ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `message` varchar(255) NOT NULL COMMENT 'Message',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Creation Time',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Update Time',
  PRIMARY KEY (`id`),
  KEY `EMAIL_AUTOMATION_AUTOMATION_TYPE` (`automation_type`),
  KEY `EMAIL_AUTOMATION_ENROLMENT_STATUS` (`enrolment_status`),
  KEY `EMAIL_AUTOMATION_TYPE_ID` (`type_id`),
  KEY `EMAIL_AUTOMATION_EMAIL` (`email`),
  KEY `EMAIL_AUTOMATION_PROGRAM_ID` (`program_id`),
  KEY `EMAIL_AUTOMATION_CREATED_AT` (`created_at`),
  KEY `EMAIL_AUTOMATION_UPDATED_AT` (`updated_at`),
  KEY `EMAIL_AUTOMATION_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Automation Status' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `email_campaign`
--

CREATE TABLE IF NOT EXISTS `email_campaign` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `campaign_id` int(10) unsigned NOT NULL COMMENT 'Campaign ID',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT 'Contact Email',
  `customer_id` int(10) unsigned NOT NULL COMMENT 'Customer ID',
  `sent_at` timestamp NULL DEFAULT NULL COMMENT 'Send Date',
  `order_increment_id` varchar(50) NOT NULL COMMENT 'Order Increment ID',
  `quote_id` int(10) unsigned NOT NULL COMMENT 'Sales Quote ID',
  `message` varchar(255) NOT NULL DEFAULT '' COMMENT 'Error Message',
  `checkout_method` varchar(255) NOT NULL DEFAULT '' COMMENT 'Checkout Method Used',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `event_name` varchar(255) NOT NULL DEFAULT '' COMMENT 'Event Name',
  `send_id` varchar(255) NOT NULL DEFAULT '' COMMENT 'Send Id',
  `send_status` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Campaign send status',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Creation Time',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Update Time',
  PRIMARY KEY (`id`),
  KEY `EMAIL_CAMPAIGN_STORE_ID` (`store_id`),
  KEY `EMAIL_CAMPAIGN_CAMPAIGN_ID` (`campaign_id`),
  KEY `EMAIL_CAMPAIGN_EMAIL` (`email`),
  KEY `EMAIL_CAMPAIGN_SEND_ID` (`send_id`),
  KEY `EMAIL_CAMPAIGN_SEND_STATUS` (`send_status`),
  KEY `EMAIL_CAMPAIGN_CREATED_AT` (`created_at`),
  KEY `EMAIL_CAMPAIGN_UPDATED_AT` (`updated_at`),
  KEY `EMAIL_CAMPAIGN_SENT_AT` (`sent_at`),
  KEY `EMAIL_CAMPAIGN_EVENT_NAME` (`event_name`),
  KEY `EMAIL_CAMPAIGN_MESSAGE` (`message`),
  KEY `EMAIL_CAMPAIGN_QUOTE_ID` (`quote_id`),
  KEY `EMAIL_CAMPAIGN_CUSTOMER_ID` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Connector Campaigns' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `email_catalog`
--

CREATE TABLE IF NOT EXISTS `email_catalog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `imported` smallint(5) unsigned DEFAULT NULL COMMENT 'Product Imported',
  `modified` smallint(5) unsigned DEFAULT NULL COMMENT 'Product Modified',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Creation Time',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Update Time',
  PRIMARY KEY (`id`),
  KEY `EMAIL_CATALOG_PRODUCT_ID` (`product_id`),
  KEY `EMAIL_CATALOG_IMPORTED` (`imported`),
  KEY `EMAIL_CATALOG_MODIFIED` (`modified`),
  KEY `EMAIL_CATALOG_CREATED_AT` (`created_at`),
  KEY `EMAIL_CATALOG_UPDATED_AT` (`updated_at`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Connector Catalog' AUTO_INCREMENT=25 ;

--
-- Dumping data for table `email_catalog`
--

INSERT INTO `email_catalog` (`id`, `product_id`, `imported`, `modified`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL, '2018-12-18 19:11:45', '2018-12-18 19:11:45'),
(2, 2, NULL, NULL, '2018-12-18 19:11:47', '2018-12-18 19:11:47'),
(3, 3, NULL, NULL, '2018-12-18 19:11:47', '2018-12-18 19:11:47'),
(4, 4, NULL, NULL, '2018-12-18 19:11:47', '2018-12-18 19:11:47'),
(5, 5, NULL, NULL, '2018-12-18 19:11:47', '2018-12-18 19:11:47'),
(6, 6, NULL, NULL, '2018-12-18 19:11:47', '2018-12-18 19:11:47'),
(7, 7, NULL, NULL, '2018-12-18 19:11:48', '2018-12-18 19:11:48'),
(8, 8, NULL, NULL, '2018-12-18 19:11:48', '2018-12-18 19:11:48'),
(10, 10, NULL, NULL, '2018-12-18 19:11:48', '2018-12-18 19:11:48'),
(12, 12, NULL, NULL, '2018-12-18 19:11:48', '2018-12-18 19:11:48'),
(13, 13, NULL, NULL, '2018-12-18 19:11:48', '2018-12-18 19:11:48'),
(15, 15, NULL, NULL, '2018-12-18 19:11:48', '2018-12-18 19:11:48'),
(16, 16, NULL, NULL, '2018-12-18 19:11:49', '2018-12-18 19:11:49'),
(17, 17, NULL, NULL, '2018-12-18 19:11:49', '2018-12-18 19:11:49'),
(19, 19, NULL, NULL, '2018-12-18 19:11:49', '2018-12-18 19:11:49'),
(20, 20, NULL, NULL, '2018-12-19 02:26:06', '2018-12-19 02:26:06'),
(21, 21, NULL, NULL, '2018-12-19 02:26:43', '2018-12-19 02:26:43'),
(22, 22, NULL, NULL, '2018-12-19 02:28:47', '2018-12-19 02:28:47'),
(23, 23, NULL, NULL, '2018-12-19 02:30:19', '2018-12-19 02:30:19'),
(24, 24, NULL, NULL, '2018-12-31 18:35:46', '2018-12-31 18:35:46');

-- --------------------------------------------------------

--
-- Table structure for table `email_contact`
--

CREATE TABLE IF NOT EXISTS `email_contact` (
  `email_contact_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `is_guest` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Guest',
  `contact_id` varchar(15) DEFAULT NULL COMMENT 'Connector Contact ID',
  `customer_id` int(10) unsigned NOT NULL COMMENT 'Customer ID',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT 'Customer Email',
  `is_subscriber` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Subscriber',
  `subscriber_status` smallint(5) unsigned DEFAULT NULL COMMENT 'Subscriber status',
  `email_imported` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Imported',
  `subscriber_imported` smallint(5) unsigned DEFAULT NULL COMMENT 'Subscriber Imported',
  `suppressed` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Suppressed',
  PRIMARY KEY (`email_contact_id`),
  KEY `EMAIL_CONTACT_EMAIL_CONTACT_ID` (`email_contact_id`),
  KEY `EMAIL_CONTACT_IS_GUEST` (`is_guest`),
  KEY `EMAIL_CONTACT_CUSTOMER_ID` (`customer_id`),
  KEY `EMAIL_CONTACT_WEBSITE_ID` (`website_id`),
  KEY `EMAIL_CONTACT_IS_SUBSCRIBER` (`is_subscriber`),
  KEY `EMAIL_CONTACT_SUBSCRIBER_STATUS` (`subscriber_status`),
  KEY `EMAIL_CONTACT_EMAIL_IMPORTED` (`email_imported`),
  KEY `EMAIL_CONTACT_SUBSCRIBER_IMPORTED` (`subscriber_imported`),
  KEY `EMAIL_CONTACT_SUPPRESSED` (`suppressed`),
  KEY `EMAIL_CONTACT_EMAIL` (`email`),
  KEY `EMAIL_CONTACT_CONTACT_ID` (`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Connector Contacts' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `email_contact_consent`
--

CREATE TABLE IF NOT EXISTS `email_contact_consent` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `email_contact_id` int(10) unsigned DEFAULT NULL COMMENT 'Email Contact Id',
  `consent_url` varchar(255) DEFAULT NULL COMMENT 'Contact consent url',
  `consent_datetime` datetime DEFAULT NULL COMMENT 'Contact consent datetime',
  `consent_ip` varchar(255) DEFAULT NULL COMMENT 'Contact consent ip',
  `consent_user_agent` varchar(255) DEFAULT NULL COMMENT 'Contact consent user agent',
  PRIMARY KEY (`id`),
  KEY `EMAIL_CONTACT_CONSENT_EMAIL_CONTACT_ID` (`email_contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Email contact consent table.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `email_failed_auth`
--

CREATE TABLE IF NOT EXISTS `email_failed_auth` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `failures_num` int(10) unsigned DEFAULT NULL COMMENT 'Number of fails',
  `first_attempt_date` datetime DEFAULT NULL COMMENT 'First attempt date',
  `last_attempt_date` datetime DEFAULT NULL COMMENT 'Last attempt date',
  `url` varchar(255) DEFAULT NULL COMMENT 'URL',
  `store_id` int(10) unsigned DEFAULT NULL COMMENT 'Store Id',
  PRIMARY KEY (`id`),
  KEY `EMAIL_AUTH_EDC_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Email Failed Auth Table.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `email_importer`
--

CREATE TABLE IF NOT EXISTS `email_importer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `import_type` varchar(255) NOT NULL DEFAULT '' COMMENT 'Import Type',
  `website_id` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Website Id',
  `import_status` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Import Status',
  `import_id` varchar(255) NOT NULL DEFAULT '' COMMENT 'Import Id',
  `import_data` mediumblob NOT NULL COMMENT 'Import Data',
  `import_mode` varchar(255) NOT NULL DEFAULT '' COMMENT 'Import Mode',
  `import_file` text NOT NULL COMMENT 'Import File',
  `message` varchar(255) NOT NULL DEFAULT '' COMMENT 'Error Message',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Creation Time',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Update Time',
  `import_started` timestamp NULL DEFAULT NULL COMMENT 'Import Started',
  `import_finished` timestamp NULL DEFAULT NULL COMMENT 'Import Finished',
  PRIMARY KEY (`id`),
  KEY `EMAIL_IMPORTER_IMPORT_TYPE` (`import_type`),
  KEY `EMAIL_IMPORTER_WEBSITE_ID` (`website_id`),
  KEY `EMAIL_IMPORTER_IMPORT_STATUS` (`import_status`),
  KEY `EMAIL_IMPORTER_IMPORT_MODE` (`import_mode`),
  KEY `EMAIL_IMPORTER_CREATED_AT` (`created_at`),
  KEY `EMAIL_IMPORTER_UPDATED_AT` (`updated_at`),
  KEY `EMAIL_IMPORTER_IMPORT_ID` (`import_id`),
  KEY `EMAIL_IMPORTER_IMPORT_STARTED` (`import_started`),
  KEY `EMAIL_IMPORTER_IMPORT_FINISHED` (`import_finished`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Email Importer' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `email_order`
--

CREATE TABLE IF NOT EXISTS `email_order` (
  `email_order_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order ID',
  `order_status` varchar(255) NOT NULL COMMENT 'Order Status',
  `quote_id` int(10) unsigned NOT NULL COMMENT 'Sales Quote ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `email_imported` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Order Imported',
  `modified` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Order Modified',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Creation Time',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Update Time',
  PRIMARY KEY (`email_order_id`),
  KEY `EMAIL_ORDER_STORE_ID` (`store_id`),
  KEY `EMAIL_ORDER_QUOTE_ID` (`quote_id`),
  KEY `EMAIL_ORDER_EMAIL_IMPORTED` (`email_imported`),
  KEY `EMAIL_ORDER_ORDER_STATUS` (`order_status`),
  KEY `EMAIL_ORDER_MODIFIED` (`modified`),
  KEY `EMAIL_ORDER_UPDATED_AT` (`updated_at`),
  KEY `EMAIL_ORDER_CREATED_AT` (`created_at`),
  KEY `EMAIL_ORDER_ORDER_ID_SALES_ORDER_ENTITY_ID` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Transactional Order Data' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `email_review`
--

CREATE TABLE IF NOT EXISTS `email_review` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `review_id` int(10) unsigned NOT NULL COMMENT 'Review Id',
  `customer_id` int(10) unsigned NOT NULL COMMENT 'Customer ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `review_imported` smallint(5) unsigned DEFAULT NULL COMMENT 'Review Imported',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Creation Time',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Update Time',
  PRIMARY KEY (`id`),
  KEY `EMAIL_REVIEW_REVIEW_ID` (`review_id`),
  KEY `EMAIL_REVIEW_CUSTOMER_ID` (`customer_id`),
  KEY `EMAIL_REVIEW_STORE_ID` (`store_id`),
  KEY `EMAIL_REVIEW_REVIEW_IMPORTED` (`review_imported`),
  KEY `EMAIL_REVIEW_CREATED_AT` (`created_at`),
  KEY `EMAIL_REVIEW_UPDATED_AT` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Connector Reviews' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `email_rules`
--

CREATE TABLE IF NOT EXISTS `email_rules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'Rule Name',
  `website_ids` varchar(255) NOT NULL DEFAULT '0' COMMENT 'Website Id',
  `type` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Rule Type',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Status',
  `combination` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Rule Condition',
  `conditions` blob NOT NULL COMMENT 'Rule Conditions',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Creation Time',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Update Time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Connector Rules' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `email_template`
--

CREATE TABLE IF NOT EXISTS `email_template` (
  `template_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Template ID',
  `template_code` varchar(150) NOT NULL COMMENT 'Template Name',
  `template_text` text NOT NULL COMMENT 'Template Content',
  `template_styles` text COMMENT 'Templste Styles',
  `template_type` int(10) unsigned DEFAULT NULL COMMENT 'Template Type',
  `template_subject` varchar(200) NOT NULL COMMENT 'Template Subject',
  `template_sender_name` varchar(200) DEFAULT NULL COMMENT 'Template Sender Name',
  `template_sender_email` varchar(200) DEFAULT NULL COMMENT 'Template Sender Email',
  `added_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date of Template Creation',
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date of Template Modification',
  `orig_template_code` varchar(200) DEFAULT NULL COMMENT 'Original Template Code',
  `orig_template_variables` text COMMENT 'Original Template Variables',
  PRIMARY KEY (`template_id`),
  UNIQUE KEY `EMAIL_TEMPLATE_TEMPLATE_CODE` (`template_code`),
  KEY `EMAIL_TEMPLATE_ADDED_AT` (`added_at`),
  KEY `EMAIL_TEMPLATE_MODIFIED_AT` (`modified_at`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Email Templates' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `email_template`
--

INSERT INTO `email_template` (`template_id`, `template_code`, `template_text`, `template_styles`, `template_type`, `template_subject`, `template_sender_name`, `template_sender_email`, `added_at`, `modified_at`, `orig_template_code`, `orig_template_variables`) VALUES
(1, 'New Pickup Order', '<!--@subject {{trans "Your %store_name order confirmation" store_name=$store.getFrontendName()}} @-->\n<!--@vars {\n"var order.getCustomerName()":"Customer Name",\n"var store.getFrontendName()":"Customer Name",\n"var is_pickup_order":"Check if order is a pickup order",\n"var $this.getUrl($store,''customer/account/'',[_nosid:1]) |raw":"Gets the link to the Customer Account",\n"var store_email |raw":"Defined Email Address for this type of mails",\n"var store_phone |raw":"Defined Phone Number in the Store Information",\n"var store_hours |raw":"Defined Opening Hours Phone Number in the Store Information",\n"var order.increment_id |raw":"Order Id",\n"var order.getCreatedAtFormatted(2) |raw":"Get the date of order creation",\n"var order.getEmailCustomerNote()":"Email Order Note",\n"var formattedBillingAddress|raw":"Billing Address",\n"var order.getIsNotVirtual()":"Check if shipment exists",\n"var pickupAddress|raw":"Pickup Location Address",\n"var formattedShippingAddress|raw":"Customer Shipping Address",\n"var payment_html|raw":"Payment Details",\n"var order.getShippingDescription()":"Shipping Description",\n"var shipping_msg":"Shipping message",\n"layout handle=\\"sales_email_order_items\\" order=$order area=\\"frontend\\"":"Order Items Grid"\n} @-->\n\n{{template config_path="design/email/header_template"}}\n\n<table>\n    <tr class="email-intro">\n        <td>\n            <p class="greeting">{{trans "%customer_name," customer_name=$order.getCustomerName()}}</p>\n            <p>\n                {{trans "Thank you for your order from %store_name." store_name=$store.getFrontendName()}}\n                {{if is_pickup_order}}\n                    {{trans "We will send you a notification once your items are ready for pickup."}}\n                {{else}}\n                    {{trans "Once your package ships we will send you a tracking number."}}\n                {{/if}}\n                {{trans ''You can check the status of your order by <a href="%account_url">logging into your account</a>.'' account_url=$this.getUrl($store,''customer/account/'',[_nosid:1]) |raw}}\n            </p>\n            <p>\n                {{trans ''If you have questions about your order, you can email us at <a href="mailto:%store_email">%store_email</a>'' store_email=$store_email |raw}}{{depend store_phone}} {{trans '' or call us at <a href="tel:%store_phone">%store_phone</a>'' store_phone=$store_phone |raw}}{{/depend}}.\n                {{depend store_hours}}\n                {{trans ''Our hours are <span class="no-link">%store_hours</span>.'' store_hours=$store_hours |raw}}\n                {{/depend}}\n            </p>\n        </td>\n    </tr>\n    <tr class="email-summary">\n        <td>\n            <h1>{{trans ''Your Order <span class="no-link">#%increment_id</span>'' increment_id=$order.increment_id |raw}}</h1>\n            <p>{{trans ''Placed on <span class="no-link">%created_at</span>'' created_at=$order.getCreatedAtFormatted(2) |raw}}</p>\n        </td>\n    </tr>\n    <tr class="email-information">\n        <td>\n            {{depend order.getEmailCustomerNote()}}\n            <table class="message-info">\n                <tr>\n                    <td>\n                        {{var order.getEmailCustomerNote()|escape|nl2br}}\n                    </td>\n                </tr>\n            </table>\n            {{/depend}}\n            <table class="order-details">\n                <tr>\n                    <td class="address-details">\n                        <h3>{{trans "Billing Info"}}</h3>\n                        <p>{{var formattedBillingAddress|raw}}</p>\n                    </td>\n                    {{depend order.getIsNotVirtual()}}\n                    <td class="address-details">\n                        <h3>{{trans "Shipping Info"}}</h3>\n                        {{if is_pickup_order}}\n                            <h4>{{trans "Pickup Location"}}</h4>\n                            <p>{{var pickupAddress|raw}}</p>\n                            <h4>{{trans "Recipient Address"}}</h4>\n                        {{/if}}\n                        <p>{{var formattedShippingAddress|raw}}</p>\n                    </td>\n                    {{/depend}}\n                </tr>\n                <tr>\n                    <td class="method-info">\n                        <h3>{{trans "Payment Method"}}</h3>\n                        {{var payment_html|raw}}\n                    </td>\n                    {{depend order.getIsNotVirtual()}}\n                    <td class="method-info">\n                        <h3>{{trans "Shipping Method"}}</h3>\n                        <p>{{var order.getShippingDescription()}}</p>\n                        {{if shipping_msg}}\n                        <p>{{var shipping_msg}}</p>\n                        {{/if}}\n                    </td>\n                    {{/depend}}\n                </tr>\n            </table>\n            {{layout handle="sales_email_order_items" order=$order area="frontend"}}\n        </td>\n    </tr>\n</table>\n\n{{template config_path="design/email/footer_template"}}\n', NULL, 2, '{{trans "Your %store_name order confirmation" store_name=$store.getFrontendName()}}', NULL, NULL, '2018-12-06 05:00:09', '2018-12-06 05:00:09', 'sales_email_order_template', '{"var formattedBillingAddress|raw":"Billing Address","var order.getEmailCustomerNote()":"Email Order Note","var order.increment_id":"Order Id","layout handle=\\"sales_email_order_items\\" order=$order area=\\"frontend\\"":"Order Items Grid","var payment_html|raw":"Payment Details","var formattedShippingAddress|raw":"Shipping Address","var order.getShippingDescription()":"Shipping Description","var shipping_msg":"Shipping message"}'),
(2, 'New Pickup Order For Guest', '<!--@subject {{trans "Your %store_name order confirmation" store_name=$store.getFrontendName()}} @-->\n<!--@vars {\n"var order.getBillingAddress().getName()":"Guest Customer Name",\n"var store.getFrontendName()":"Customer Name",\n"var is_pickup_order":"Check if order is a pickup order",\n"var store_email |raw":"Defined Email Address for this type of mails",\n"var store_phone |raw":"Defined Phone Number in the Store Information",\n"var store_hours |raw":"Defined Opening Hours Phone Number in the Store Information",\n"var order.increment_id |raw":"Order Id",\n"var order.getCreatedAtFormatted(2) |raw":"Get the date of order creation",\n"var order.getEmailCustomerNote()":"Email Order Note",\n"var formattedBillingAddress|raw":"Billing Address",\n"var order.getIsNotVirtual()":"Check if shipment exists",\n"var pickupAddress|raw":"Pickup Location Address",\n"var formattedShippingAddress|raw":"Customer Shipping Address",\n"var payment_html|raw":"Payment Details",\n"var order.getShippingDescription()":"Shipping Description",\n"var shipping_msg":"Shipping message",\n"layout handle=\\"sales_email_order_items\\" order=$order area=\\"frontend\\"":"Order Items Grid"\n} @-->\n\n{{template config_path="design/email/header_template"}}\n\n<table>\n    <tr class="email-intro">\n        <td>\n            <p class="greeting">{{trans "%name," name=$order.getBillingAddress().getName()}}</p>\n            <p>\n                {{trans "Thank you for your order from %store_name." store_name=$store.getFrontendName()}}\n                {{if is_pickup_order}}\n                    {{trans "We will send you a notification once your items are ready for pickup."}}\n                {{else}}\n                    {{trans "Once your package ships we will send an email with a link to track your order."}}\n                {{/if}}\n                {{trans ''If you have questions about your order, you can email us at <a href="mailto:%store_email">%store_email</a>'' store_email=$store_email |raw}}{{depend store_phone}} {{trans '' or call us at <a href="tel:%store_phone">%store_phone</a>'' store_phone=$store_phone |raw}}{{/depend}}.\n                {{depend store_hours}}\n                    {{trans ''Our hours are <span class="no-link">%store_hours</span>.'' store_hours=$store_hours |raw}}\n                {{/depend}}\n            </p>\n        </td>\n    </tr>\n    <tr class="email-summary">\n        <td>\n            <h1>{{trans ''Your Order <span class="no-link">#%increment_id</span>'' increment_id=$order.increment_id |raw}}</h1>\n            <p>{{trans ''Placed on <span class="no-link">%created_at</span>'' created_at=$order.getCreatedAtFormatted(2) |raw}}</p>\n        </td>\n    </tr>\n    <tr class="email-information">\n        <td>\n            {{depend order.getEmailCustomerNote()}}\n            <table class="message-info">\n                <tr>\n                    <td>\n                        {{var order.getEmailCustomerNote()|escape|nl2br}}\n                    </td>\n                </tr>\n            </table>\n            {{/depend}}\n            <table class="order-details">\n                <tr>\n                    <td class="address-details">\n                        <h3>{{trans "Billing Info"}}</h3>\n                        <p>{{var formattedBillingAddress|raw}}</p>\n                    </td>\n                    {{depend order.getIsNotVirtual()}}\n                    <td class="address-details">\n                        <h3>{{trans "Shipping Info"}}</h3>\n                        {{if is_pickup_order}}\n                            <h4>{{trans "Pickup Location"}}</h4>\n                            <p>{{var pickupAddress|raw}}</p>\n                            <h4>{{trans "Recipient Address"}}</h4>\n                        {{/if}}\n                        <p>{{var formattedShippingAddress|raw}}</p>\n                    </td>\n                    {{/depend}}\n                </tr>\n                <tr>\n                    <td class="method-info">\n                        <h3>{{trans "Payment Method"}}</h3>\n                        {{var payment_html|raw}}\n                    </td>\n                    {{depend order.getIsNotVirtual()}}\n                    <td class="method-info">\n                        <h3>{{trans "Shipping Method"}}</h3>\n                        <p>{{var order.getShippingDescription()}}</p>\n                        {{if shipping_msg}}\n                        <p>{{var shipping_msg}}</p>\n                        {{/if}}\n                    </td>\n                    {{/depend}}\n                </tr>\n            </table>\n            {{layout handle="sales_email_order_items" order=$order}}\n        </td>\n    </tr>\n</table>\n\n{{template config_path="design/email/footer_template"}}\n', NULL, 2, '{{trans "Your %store_name order confirmation" store_name=$store.getFrontendName()}}', NULL, NULL, '2018-12-06 05:00:10', '2018-12-06 05:00:10', 'sales_email_order_guest_template', '{"var formattedBillingAddress|raw":"Billing Address","var order.getEmailCustomerNote()":"Email Order Note","var order.getBillingAddress().getName()":"Guest Customer Name","var order.getCreatedAtFormatted(2)":"Order Created At (datetime)","var order.increment_id":"Order Id","layout handle=\\"sales_email_order_items\\" order=$order":"Order Items Grid","var payment_html|raw":"Payment Details","var formattedShippingAddress|raw":"Shipping Address","var order.getShippingDescription()":"Shipping Description","var shipping_msg":"Shipping message"}');

-- --------------------------------------------------------

--
-- Table structure for table `email_wishlist`
--

CREATE TABLE IF NOT EXISTS `email_wishlist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `wishlist_id` int(10) unsigned NOT NULL COMMENT 'Wishlist Id',
  `item_count` int(10) unsigned NOT NULL COMMENT 'Item Count',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `wishlist_imported` smallint(5) unsigned DEFAULT NULL COMMENT 'Wishlist Imported',
  `wishlist_modified` smallint(5) unsigned DEFAULT NULL COMMENT 'Wishlist Modified',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Creation Time',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Update Time',
  PRIMARY KEY (`id`),
  KEY `EMAIL_WISHLIST_WISHLIST_ID` (`wishlist_id`),
  KEY `EMAIL_WISHLIST_ITEM_COUNT` (`item_count`),
  KEY `EMAIL_WISHLIST_CUSTOMER_ID` (`customer_id`),
  KEY `EMAIL_WISHLIST_WISHLIST_MODIFIED` (`wishlist_modified`),
  KEY `EMAIL_WISHLIST_WISHLIST_IMPORTED` (`wishlist_imported`),
  KEY `EMAIL_WISHLIST_CREATED_AT` (`created_at`),
  KEY `EMAIL_WISHLIST_UPDATED_AT` (`updated_at`),
  KEY `EMAIL_WISHLIST_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Connector Wishlist' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `flag`
--

CREATE TABLE IF NOT EXISTS `flag` (
  `flag_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Flag Id',
  `flag_code` varchar(255) NOT NULL COMMENT 'Flag Code',
  `state` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Flag State',
  `flag_data` text COMMENT 'Flag Data',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date of Last Flag Update',
  PRIMARY KEY (`flag_id`),
  KEY `FLAG_LAST_UPDATE` (`last_update`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Flag' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `flag`
--

INSERT INTO `flag` (`flag_id`, `flag_code`, `state`, `flag_data`, `last_update`) VALUES
(1, 'analytics_link_attempts_reverse_counter', 0, '24', '2018-12-06 05:00:06'),
(2, 'config_hash', 0, '{"system":"9a18ecbd6d057d5ae015414825760241bfafd115"}', '2019-01-01 16:13:18');

-- --------------------------------------------------------

--
-- Table structure for table `gift_message`
--

CREATE TABLE IF NOT EXISTS `gift_message` (
  `gift_message_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'GiftMessage Id',
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer id',
  `sender` varchar(255) DEFAULT NULL COMMENT 'Sender',
  `recipient` varchar(255) DEFAULT NULL COMMENT 'Registrant',
  `message` text COMMENT 'Message',
  PRIMARY KEY (`gift_message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Gift Message' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `googleoptimizer_code`
--

CREATE TABLE IF NOT EXISTS `googleoptimizer_code` (
  `code_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Google experiment code id',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Optimized entity id product id or catalog id',
  `entity_type` varchar(50) DEFAULT NULL COMMENT 'Optimized entity type',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store id',
  `experiment_script` text COMMENT 'Google experiment script',
  PRIMARY KEY (`code_id`),
  UNIQUE KEY `GOOGLEOPTIMIZER_CODE_STORE_ID_ENTITY_ID_ENTITY_TYPE` (`store_id`,`entity_id`,`entity_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Google Experiment code' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `importexport_importdata`
--

CREATE TABLE IF NOT EXISTS `importexport_importdata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `entity` varchar(50) NOT NULL COMMENT 'Entity',
  `behavior` varchar(10) NOT NULL DEFAULT 'append' COMMENT 'Behavior',
  `data` longtext COMMENT 'Data',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Import Data Table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `import_history`
--

CREATE TABLE IF NOT EXISTS `import_history` (
  `history_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'History record Id',
  `started_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Started at',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'User ID',
  `imported_file` varchar(255) DEFAULT NULL COMMENT 'Imported file',
  `execution_time` varchar(255) DEFAULT NULL COMMENT 'Execution time',
  `summary` varchar(255) DEFAULT NULL COMMENT 'Summary',
  `error_file` varchar(255) NOT NULL COMMENT 'Imported file with errors',
  PRIMARY KEY (`history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Import history table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `indexer_state`
--

CREATE TABLE IF NOT EXISTS `indexer_state` (
  `state_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Indexer State Id',
  `indexer_id` varchar(255) DEFAULT NULL COMMENT 'Indexer Id',
  `status` varchar(16) DEFAULT 'invalid' COMMENT 'Indexer Status',
  `updated` datetime DEFAULT NULL COMMENT 'Indexer Status',
  `hash_config` varchar(32) NOT NULL COMMENT 'Hash of indexer config',
  PRIMARY KEY (`state_id`),
  KEY `INDEXER_STATE_INDEXER_ID` (`indexer_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Indexer State' AUTO_INCREMENT=12 ;

--
-- Dumping data for table `indexer_state`
--

INSERT INTO `indexer_state` (`state_id`, `indexer_id`, `status`, `updated`, `hash_config`) VALUES
(1, 'design_config_grid', 'valid', '2019-01-02 03:52:17', '34ec592bfa6c952bed4d0a1d58c98770'),
(2, 'customer_grid', 'valid', '2019-01-01 19:11:41', 'b9632e06cf957d6e8103eb236ca38cc1'),
(3, 'catalog_category_product', 'valid', '2019-01-01 19:11:41', '2124d5bfcd83b609c67eee94a0e4708c'),
(4, 'catalog_product_category', 'valid', '2018-12-06 14:35:13', '77b6356629f3259568a68ea64c773238'),
(5, 'catalogrule_rule', 'valid', '2019-01-01 19:11:41', 'c4f8344a2e6a7d8ebc065631454a4724'),
(6, 'catalog_product_attribute', 'valid', '2019-01-01 19:11:42', 'f73cae77ec4dee3b587a60a2f38dd26a'),
(7, 'cataloginventory_stock', 'valid', '2019-01-01 19:11:42', '1bf66e64558a5171e523b32f25cb99ca'),
(8, 'inventory', 'valid', '2019-01-01 19:11:42', 'ff158179c0d7dcaeb1be1da0011eae73'),
(9, 'catalogrule_product', 'valid', '2018-12-06 14:35:14', '667205576ee3764b1ee81c4a076d10ae'),
(10, 'catalog_product_price', 'valid', '2019-01-01 19:11:42', '0e6c8cd322db03524968ab671629718f'),
(11, 'catalogsearch_fulltext', 'valid', '2019-01-01 19:11:42', 'f7969233b1a7e0a88687f63b60edb602');

-- --------------------------------------------------------

--
-- Table structure for table `integration`
--

CREATE TABLE IF NOT EXISTS `integration` (
  `integration_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Integration ID',
  `name` varchar(255) NOT NULL COMMENT 'Integration name is displayed in the admin interface',
  `email` varchar(255) NOT NULL COMMENT 'Email address of the contact person',
  `endpoint` varchar(255) DEFAULT NULL COMMENT 'Endpoint for posting consumer credentials',
  `status` smallint(5) unsigned NOT NULL COMMENT 'Integration status',
  `consumer_id` int(10) unsigned DEFAULT NULL COMMENT 'Oauth consumer',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Time',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update Time',
  `setup_type` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Integration type - manual or config file',
  `identity_link_url` varchar(255) DEFAULT NULL COMMENT 'Identity linking Url',
  PRIMARY KEY (`integration_id`),
  UNIQUE KEY `INTEGRATION_NAME` (`name`),
  UNIQUE KEY `INTEGRATION_CONSUMER_ID` (`consumer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='integration' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `inventory_low_stock_notification_configuration`
--

CREATE TABLE IF NOT EXISTS `inventory_low_stock_notification_configuration` (
  `source_code` varchar(255) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `notify_stock_qty` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`source_code`,`sku`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `inventory_low_stock_notification_configuration`
--

INSERT INTO `inventory_low_stock_notification_configuration` (`source_code`, `sku`, `notify_stock_qty`) VALUES
('default', 'coverlifters', NULL),
('default', 'Grandee ® NXT-Alpine White-Mocha', NULL),
('default', 'Grandee ® NXT-Alpine White-Monterey Gray', NULL),
('default', 'Grandee ® NXT-Alpine White-Teak', NULL),
('default', 'Grandee ® NXT-Crème-Mocha', NULL),
('default', 'Grandee ® NXT-Crème-Monterey Gray', NULL),
('default', 'Grandee ® NXT-Crème-Teak', NULL),
('default', 'Grandee ® NXT-Desert-Mocha', NULL),
('default', 'Grandee ® NXT-Desert-Teak', NULL),
('default', 'Grandee ® NXT-Ice Gray-Mocha', NULL),
('default', 'Grandee ® NXT-Ice Gray-Monterey Gray', NULL),
('default', 'Grandee ® NXT-Ice Gray-Teak', NULL),
('default', 'Grandee ® NXT-Platinum-Mocha', NULL),
('default', 'Grandee ® NXT-Platinum-Monterey Gray', NULL),
('default', 'Grandee ® NXT-Tuscan Sun-Mocha', NULL),
('default', 'Grandee ® NXT-Tuscan Sun-Monterey Gray', NULL),
('default', 'Grandee ® NXT-Tuscan Sun-Teak', NULL),
('default', 'Hot Spring® 32" Polymer Spa Steps', NULL),
('default', 'hottubenjoyment', NULL),
('default', 'hottubinnovation', NULL),
('default', 'watercare', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `inventory_reservation`
--

CREATE TABLE IF NOT EXISTS `inventory_reservation` (
  `reservation_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `stock_id` int(10) unsigned NOT NULL,
  `sku` varchar(64) NOT NULL,
  `quantity` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `metadata` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`reservation_id`),
  KEY `INVENTORY_RESERVATION_STOCK_ID_SKU_QUANTITY` (`stock_id`,`sku`,`quantity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `inventory_shipment_source`
--

CREATE TABLE IF NOT EXISTS `inventory_shipment_source` (
  `shipment_id` int(10) unsigned NOT NULL,
  `source_code` varchar(255) NOT NULL,
  PRIMARY KEY (`shipment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `inventory_source`
--

CREATE TABLE IF NOT EXISTS `inventory_source` (
  `source_code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `enabled` smallint(5) unsigned NOT NULL DEFAULT '1',
  `description` text,
  `latitude` decimal(8,6) DEFAULT NULL,
  `longitude` decimal(9,6) DEFAULT NULL,
  `country_id` varchar(2) NOT NULL,
  `region_id` int(10) unsigned DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `postcode` varchar(255) NOT NULL,
  `contact_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `use_default_carrier_config` smallint(5) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`source_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `inventory_source`
--

INSERT INTO `inventory_source` (`source_code`, `name`, `enabled`, `description`, `latitude`, `longitude`, `country_id`, `region_id`, `region`, `city`, `street`, `postcode`, `contact_name`, `email`, `phone`, `fax`, `use_default_carrier_config`) VALUES
('default', 'Default Source', 1, 'Default Source', 0.000000, 0.000000, 'US', NULL, NULL, NULL, NULL, '00000', NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `inventory_source_carrier_link`
--

CREATE TABLE IF NOT EXISTS `inventory_source_carrier_link` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `source_code` varchar(255) NOT NULL,
  `carrier_code` varchar(255) NOT NULL,
  `position` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`link_id`),
  KEY `INV_SOURCE_CARRIER_LNK_SOURCE_CODE_INV_SOURCE_SOURCE_CODE` (`source_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `inventory_source_item`
--

CREATE TABLE IF NOT EXISTS `inventory_source_item` (
  `source_item_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `source_code` varchar(255) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `quantity` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `status` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`source_item_id`),
  UNIQUE KEY `INVENTORY_SOURCE_ITEM_SOURCE_CODE_SKU` (`source_code`,`sku`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=63 ;

--
-- Dumping data for table `inventory_source_item`
--

INSERT INTO `inventory_source_item` (`source_item_id`, `source_code`, `sku`, `quantity`, `status`) VALUES
(1, 'default', 'coverlifters', 100.0000, 1),
(5, 'default', 'coverlifters-1', 100.0000, 1),
(7, 'default', 'watercare', 100.0000, 1),
(9, 'default', 'watercare-1', 100.0000, 1),
(11, 'default', 'hottubinnovation', 100.0000, 1),
(13, 'default', 'hottubinnovation-1', 100.0000, 1),
(15, 'default', 'hottubenjoyment', 100.0000, 1),
(17, 'default', 'Grandee ® NXT-Alpine White-Mocha', 100.0000, 1),
(19, 'default', 'Grandee ® NXT-Alpine White-Monterey Gray', 100.0000, 1),
(21, 'default', 'Grandee ® NXT-Alpine White-Teak', 100.0000, 1),
(23, 'default', 'Grandee ® NXT-Tuscan Sun-Mocha', 100.0000, 1),
(25, 'default', 'Grandee ® NXT-Tuscan Sun-Monterey Gray', 100.0000, 1),
(27, 'default', 'Grandee ® NXT-Tuscan Sun-Teak', 100.0000, 1),
(29, 'default', 'Grandee ® NXT-Ice Gray-Mocha', 100.0000, 1),
(31, 'default', 'Grandee ® NXT-Ice Gray-Monterey Gray', 100.0000, 1),
(33, 'default', 'Grandee ® NXT-Ice Gray-Teak', 100.0000, 1),
(35, 'default', 'Grandee ® NXT-Crème-Mocha', 100.0000, 1),
(37, 'default', 'Grandee ® NXT-Crème-Monterey Gray', 100.0000, 1),
(39, 'default', 'Grandee ® NXT-Crème-Teak', 100.0000, 1),
(62, 'default', 'Hot Spring® 32" Polymer Spa Steps', 100.0000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `inventory_source_stock_link`
--

CREATE TABLE IF NOT EXISTS `inventory_source_stock_link` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `stock_id` int(10) unsigned NOT NULL,
  `source_code` varchar(255) NOT NULL,
  `priority` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`link_id`),
  UNIQUE KEY `INVENTORY_SOURCE_STOCK_LINK_STOCK_ID_SOURCE_CODE` (`stock_id`,`source_code`),
  KEY `INV_SOURCE_STOCK_LNK_SOURCE_CODE_INV_SOURCE_SOURCE_CODE` (`source_code`),
  KEY `INVENTORY_SOURCE_STOCK_LINK_STOCK_ID_PRIORITY` (`stock_id`,`priority`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `inventory_source_stock_link`
--

INSERT INTO `inventory_source_stock_link` (`link_id`, `stock_id`, `source_code`, `priority`) VALUES
(1, 1, 'default', 1);

-- --------------------------------------------------------

--
-- Table structure for table `inventory_stock`
--

CREATE TABLE IF NOT EXISTS `inventory_stock` (
  `stock_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`stock_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `inventory_stock`
--

INSERT INTO `inventory_stock` (`stock_id`, `name`) VALUES
(1, 'Default Stock');

-- --------------------------------------------------------

--
-- Table structure for table `inventory_stock_sales_channel`
--

CREATE TABLE IF NOT EXISTS `inventory_stock_sales_channel` (
  `type` varchar(64) NOT NULL,
  `code` varchar(64) NOT NULL,
  `stock_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`type`,`code`),
  KEY `INVENTORY_STOCK_SALES_CHANNEL_STOCK_ID_INVENTORY_STOCK_STOCK_ID` (`stock_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `inventory_stock_sales_channel`
--

INSERT INTO `inventory_stock_sales_channel` (`type`, `code`, `stock_id`) VALUES
('website', 'base', 1);

-- --------------------------------------------------------

--
-- Table structure for table `klarna_core_order`
--

CREATE TABLE IF NOT EXISTS `klarna_core_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `klarna_order_id` varchar(255) DEFAULT NULL COMMENT 'Klarna Order Id',
  `session_id` varchar(255) DEFAULT NULL COMMENT 'Session Id',
  `reservation_id` varchar(255) DEFAULT NULL COMMENT 'Reservation Id',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `is_acknowledged` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Is Acknowledged',
  PRIMARY KEY (`id`),
  KEY `KLARNA_CORE_ORDER_ORDER_ID_SALES_ORDER_ENTITY_ID` (`order_id`),
  KEY `KLARNA_CORE_ORDER_IS_ACKNOWLEDGED` (`is_acknowledged`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Klarna Order' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `klarna_payments_quote`
--

CREATE TABLE IF NOT EXISTS `klarna_payments_quote` (
  `payments_quote_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Payments Id',
  `session_id` varchar(255) DEFAULT NULL COMMENT 'Klarna Session Id',
  `client_token` text COMMENT 'Klarna Client Token',
  `authorization_token` varchar(255) DEFAULT NULL COMMENT 'Authorization Token',
  `is_active` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Is Active',
  `quote_id` int(10) unsigned NOT NULL COMMENT 'Quote Id',
  `payment_methods` varchar(255) DEFAULT NULL COMMENT 'Payment Method Categories',
  `payment_method_info` text COMMENT 'Payment Method Category Info',
  PRIMARY KEY (`payments_quote_id`),
  KEY `KLARNA_PAYMENTS_QUOTE_QUOTE_ID_QUOTE_ENTITY_ID` (`quote_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Klarna Payments Quote' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `layout_link`
--

CREATE TABLE IF NOT EXISTS `layout_link` (
  `layout_link_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Link Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `theme_id` int(10) unsigned NOT NULL COMMENT 'Theme id',
  `layout_update_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Layout Update Id',
  `is_temporary` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Defines whether Layout Update is Temporary',
  PRIMARY KEY (`layout_link_id`),
  KEY `LAYOUT_LINK_THEME_ID_THEME_THEME_ID` (`theme_id`),
  KEY `LAYOUT_LINK_LAYOUT_UPDATE_ID` (`layout_update_id`),
  KEY `LAYOUT_LINK_STORE_ID_THEME_ID_LAYOUT_UPDATE_ID_IS_TEMPORARY` (`store_id`,`theme_id`,`layout_update_id`,`is_temporary`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Layout Link' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `layout_update`
--

CREATE TABLE IF NOT EXISTS `layout_update` (
  `layout_update_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Layout Update Id',
  `handle` varchar(255) DEFAULT NULL COMMENT 'Handle',
  `xml` text COMMENT 'Xml',
  `sort_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `updated_at` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last Update Timestamp',
  PRIMARY KEY (`layout_update_id`),
  KEY `LAYOUT_UPDATE_HANDLE` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Layout Updates' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `magento_acknowledged_bulk`
--

CREATE TABLE IF NOT EXISTS `magento_acknowledged_bulk` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Internal ID',
  `bulk_uuid` varbinary(39) DEFAULT NULL COMMENT 'Related Bulk UUID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `MAGENTO_ACKNOWLEDGED_BULK_BULK_UUID` (`bulk_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Bulk that was viewed by user from notification area' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `magento_bulk`
--

CREATE TABLE IF NOT EXISTS `magento_bulk` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Bulk Internal ID (must not be exposed)',
  `uuid` varbinary(39) DEFAULT NULL COMMENT 'Bulk UUID (can be exposed to reference bulk entity)',
  `user_id` int(10) unsigned DEFAULT NULL COMMENT 'ID of the WebAPI user that performed an action',
  `user_type` int(11) DEFAULT NULL COMMENT 'Which type of user',
  `description` varchar(255) DEFAULT NULL COMMENT 'Bulk Description',
  `operation_count` int(10) unsigned NOT NULL COMMENT 'Total number of operations scheduled within this bulk',
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Bulk start time',
  PRIMARY KEY (`id`),
  UNIQUE KEY `MAGENTO_BULK_UUID` (`uuid`),
  KEY `MAGENTO_BULK_USER_ID` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Bulk entity that represents set of related asynchronous operations' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `magento_operation`
--

CREATE TABLE IF NOT EXISTS `magento_operation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Operation ID',
  `bulk_uuid` varbinary(39) DEFAULT NULL COMMENT 'Related Bulk UUID',
  `topic_name` varchar(255) DEFAULT NULL COMMENT 'Name of the related message queue topic',
  `serialized_data` blob COMMENT 'Data (serialized) required to perform an operation',
  `result_serialized_data` blob COMMENT 'Result data (serialized) after perform an operation',
  `status` smallint(6) DEFAULT '0' COMMENT 'Operation status (OPEN | COMPLETE | RETRIABLY_FAILED | NOT_RETRIABLY_FAILED)',
  `error_code` smallint(6) DEFAULT NULL COMMENT 'Code of the error that appeared during operation execution (used to aggregate related failed operations)',
  `result_message` varchar(255) DEFAULT NULL COMMENT 'Operation result message',
  PRIMARY KEY (`id`),
  KEY `MAGENTO_OPERATION_BULK_UUID_ERROR_CODE` (`bulk_uuid`,`error_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Operation entity' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `msp_tfa_country_codes`
--

CREATE TABLE IF NOT EXISTS `msp_tfa_country_codes` (
  `msp_tfa_country_codes_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'TFA admin user ID',
  `code` text NOT NULL COMMENT 'Country code',
  `name` text NOT NULL COMMENT 'Country name',
  `dial_code` text NOT NULL COMMENT 'Prefix',
  PRIMARY KEY (`msp_tfa_country_codes_id`),
  KEY `MSP_TFA_COUNTRY_CODES_CODE` (`code`(128))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='msp_tfa_country_codes' AUTO_INCREMENT=242 ;

--
-- Dumping data for table `msp_tfa_country_codes`
--

INSERT INTO `msp_tfa_country_codes` (`msp_tfa_country_codes_id`, `code`, `name`, `dial_code`) VALUES
(1, 'IL', 'Israel', '+972'),
(2, 'AF', 'Afghanistan', '+93'),
(3, 'AL', 'Albania', '+355'),
(4, 'DZ', 'Algeria', '+213'),
(5, 'AS', 'AmericanSamoa', '+1 684'),
(6, 'AD', 'Andorra', '+376'),
(7, 'AO', 'Angola', '+244'),
(8, 'AI', 'Anguilla', '+1 264'),
(9, 'AG', 'Antigua and Barbuda', '+1268'),
(10, 'AR', 'Argentina', '+54'),
(11, 'AM', 'Armenia', '+374'),
(12, 'AW', 'Aruba', '+297'),
(13, 'AU', 'Australia', '+61'),
(14, 'AT', 'Austria', '+43'),
(15, 'AZ', 'Azerbaijan', '+994'),
(16, 'BS', 'Bahamas', '+1 242'),
(17, 'BH', 'Bahrain', '+973'),
(18, 'BD', 'Bangladesh', '+880'),
(19, 'BB', 'Barbados', '+1 246'),
(20, 'BY', 'Belarus', '+375'),
(21, 'BE', 'Belgium', '+32'),
(22, 'BZ', 'Belize', '+501'),
(23, 'BJ', 'Benin', '+229'),
(24, 'BM', 'Bermuda', '+1 441'),
(25, 'BT', 'Bhutan', '+975'),
(26, 'BA', 'Bosnia and Herzegovina', '+387'),
(27, 'BW', 'Botswana', '+267'),
(28, 'BR', 'Brazil', '+55'),
(29, 'IO', 'British Indian Ocean Territory', '+246'),
(30, 'BG', 'Bulgaria', '+359'),
(31, 'BF', 'Burkina Faso', '+226'),
(32, 'BI', 'Burundi', '+257'),
(33, 'KH', 'Cambodia', '+855'),
(34, 'CM', 'Cameroon', '+237'),
(35, 'CA', 'Canada', '+1'),
(36, 'CV', 'Cape Verde', '+238'),
(37, 'KY', 'Cayman Islands', '+ 345'),
(38, 'CF', 'Central African Republic', '+236'),
(39, 'TD', 'Chad', '+235'),
(40, 'CL', 'Chile', '+56'),
(41, 'CN', 'China', '+86'),
(42, 'CX', 'Christmas Island', '+61'),
(43, 'CO', 'Colombia', '+57'),
(44, 'KM', 'Comoros', '+269'),
(45, 'CG', 'Congo', '+242'),
(46, 'CK', 'Cook Islands', '+682'),
(47, 'CR', 'Costa Rica', '+506'),
(48, 'HR', 'Croatia', '+385'),
(49, 'CU', 'Cuba', '+53'),
(50, 'CY', 'Cyprus', '+537'),
(51, 'CZ', 'Czech Republic', '+420'),
(52, 'DK', 'Denmark', '+45'),
(53, 'DJ', 'Djibouti', '+253'),
(54, 'DM', 'Dominica', '+1 767'),
(55, 'DO', 'Dominican Republic', '+1 849'),
(56, 'EC', 'Ecuador', '+593'),
(57, 'EG', 'Egypt', '+20'),
(58, 'SV', 'El Salvador', '+503'),
(59, 'GQ', 'Equatorial Guinea', '+240'),
(60, 'ER', 'Eritrea', '+291'),
(61, 'EE', 'Estonia', '+372'),
(62, 'ET', 'Ethiopia', '+251'),
(63, 'FO', 'Faroe Islands', '+298'),
(64, 'FJ', 'Fiji', '+679'),
(65, 'FI', 'Finland', '+358'),
(66, 'FR', 'France', '+33'),
(67, 'GF', 'French Guiana', '+594'),
(68, 'PF', 'French Polynesia', '+689'),
(69, 'GA', 'Gabon', '+241'),
(70, 'GM', 'Gambia', '+220'),
(71, 'GE', 'Georgia', '+995'),
(72, 'DE', 'Germany', '+49'),
(73, 'GH', 'Ghana', '+233'),
(74, 'GI', 'Gibraltar', '+350'),
(75, 'GR', 'Greece', '+30'),
(76, 'GL', 'Greenland', '+299'),
(77, 'GD', 'Grenada', '+1 473'),
(78, 'GP', 'Guadeloupe', '+590'),
(79, 'GU', 'Guam', '+1 671'),
(80, 'GT', 'Guatemala', '+502'),
(81, 'GN', 'Guinea', '+224'),
(82, 'GW', 'Guinea-Bissau', '+245'),
(83, 'GY', 'Guyana', '+595'),
(84, 'HT', 'Haiti', '+509'),
(85, 'HN', 'Honduras', '+504'),
(86, 'HU', 'Hungary', '+36'),
(87, 'IS', 'Iceland', '+354'),
(88, 'IN', 'India', '+91'),
(89, 'ID', 'Indonesia', '+62'),
(90, 'IQ', 'Iraq', '+964'),
(91, 'IE', 'Ireland', '+353'),
(92, 'IL', 'Israel', '+972'),
(93, 'IT', 'Italy', '+39'),
(94, 'JM', 'Jamaica', '+1 876'),
(95, 'JP', 'Japan', '+81'),
(96, 'JO', 'Jordan', '+962'),
(97, 'KZ', 'Kazakhstan', '+7 7'),
(98, 'KE', 'Kenya', '+254'),
(99, 'KI', 'Kiribati', '+686'),
(100, 'KW', 'Kuwait', '+965'),
(101, 'KG', 'Kyrgyzstan', '+996'),
(102, 'LV', 'Latvia', '+371'),
(103, 'LB', 'Lebanon', '+961'),
(104, 'LS', 'Lesotho', '+266'),
(105, 'LR', 'Liberia', '+231'),
(106, 'LI', 'Liechtenstein', '+423'),
(107, 'LT', 'Lithuania', '+370'),
(108, 'LU', 'Luxembourg', '+352'),
(109, 'MG', 'Madagascar', '+261'),
(110, 'MW', 'Malawi', '+265'),
(111, 'MY', 'Malaysia', '+60'),
(112, 'MV', 'Maldives', '+960'),
(113, 'ML', 'Mali', '+223'),
(114, 'MT', 'Malta', '+356'),
(115, 'MH', 'Marshall Islands', '+692'),
(116, 'MQ', 'Martinique', '+596'),
(117, 'MR', 'Mauritania', '+222'),
(118, 'MU', 'Mauritius', '+230'),
(119, 'YT', 'Mayotte', '+262'),
(120, 'MX', 'Mexico', '+52'),
(121, 'MC', 'Monaco', '+377'),
(122, 'MN', 'Mongolia', '+976'),
(123, 'ME', 'Montenegro', '+382'),
(124, 'MS', 'Montserrat', '+1664'),
(125, 'MA', 'Morocco', '+212'),
(126, 'MM', 'Myanmar', '+95'),
(127, 'NA', 'Namibia', '+264'),
(128, 'NR', 'Nauru', '+674'),
(129, 'NP', 'Nepal', '+977'),
(130, 'NL', 'Netherlands', '+31'),
(131, 'AN', 'Netherlands Antilles', '+599'),
(132, 'NC', 'New Caledonia', '+687'),
(133, 'NZ', 'New Zealand', '+64'),
(134, 'NI', 'Nicaragua', '+505'),
(135, 'NE', 'Niger', '+227'),
(136, 'NG', 'Nigeria', '+234'),
(137, 'NU', 'Niue', '+683'),
(138, 'NF', 'Norfolk Island', '+672'),
(139, 'MP', 'Northern Mariana Islands', '+1 670'),
(140, 'NO', 'Norway', '+47'),
(141, 'OM', 'Oman', '+968'),
(142, 'PK', 'Pakistan', '+92'),
(143, 'PW', 'Palau', '+680'),
(144, 'PA', 'Panama', '+507'),
(145, 'PG', 'Papua New Guinea', '+675'),
(146, 'PY', 'Paraguay', '+595'),
(147, 'PE', 'Peru', '+51'),
(148, 'PH', 'Philippines', '+63'),
(149, 'PL', 'Poland', '+48'),
(150, 'PT', 'Portugal', '+351'),
(151, 'PR', 'Puerto Rico', '+1 939'),
(152, 'QA', 'Qatar', '+974'),
(153, 'RO', 'Romania', '+40'),
(154, 'RW', 'Rwanda', '+250'),
(155, 'WS', 'Samoa', '+685'),
(156, 'SM', 'San Marino', '+378'),
(157, 'SA', 'Saudi Arabia', '+966'),
(158, 'SN', 'Senegal', '+221'),
(159, 'RS', 'Serbia', '+381'),
(160, 'SC', 'Seychelles', '+248'),
(161, 'SL', 'Sierra Leone', '+232'),
(162, 'SG', 'Singapore', '+65'),
(163, 'SK', 'Slovakia', '+421'),
(164, 'SI', 'Slovenia', '+386'),
(165, 'SB', 'Solomon Islands', '+677'),
(166, 'ZA', 'South Africa', '+27'),
(167, 'GS', 'South Georgia and the South Sandwich Islands', '+500'),
(168, 'ES', 'Spain', '+34'),
(169, 'LK', 'Sri Lanka', '+94'),
(170, 'SD', 'Sudan', '+249'),
(171, 'SR', 'Suriname', '+597'),
(172, 'SZ', 'Swaziland', '+268'),
(173, 'SE', 'Sweden', '+46'),
(174, 'CH', 'Switzerland', '+41'),
(175, 'TJ', 'Tajikistan', '+992'),
(176, 'TH', 'Thailand', '+66'),
(177, 'TG', 'Togo', '+228'),
(178, 'TK', 'Tokelau', '+690'),
(179, 'TO', 'Tonga', '+676'),
(180, 'TT', 'Trinidad and Tobago', '+1 868'),
(181, 'TN', 'Tunisia', '+216'),
(182, 'TR', 'Turkey', '+90'),
(183, 'TM', 'Turkmenistan', '+993'),
(184, 'TC', 'Turks and Caicos Islands', '+1 649'),
(185, 'TV', 'Tuvalu', '+688'),
(186, 'UG', 'Uganda', '+256'),
(187, 'UA', 'Ukraine', '+380'),
(188, 'AE', 'United Arab Emirates', '+971'),
(189, 'GB', 'United Kingdom', '+44'),
(190, 'US', 'United States', '+1'),
(191, 'UY', 'Uruguay', '+598'),
(192, 'UZ', 'Uzbekistan', '+998'),
(193, 'VU', 'Vanuatu', '+678'),
(194, 'WF', 'Wallis and Futuna', '+681'),
(195, 'YE', 'Yemen', '+967'),
(196, 'ZM', 'Zambia', '+260'),
(197, 'ZW', 'Zimbabwe', '+263'),
(198, 'AX', 'land Islands', ''),
(199, 'BO', 'Bolivia, Plurinational State of', '+591'),
(200, 'BN', 'Brunei Darussalam', '+673'),
(201, 'CC', 'Cocos (Keeling) Islands', '+61'),
(202, 'CD', 'Congo, The Democratic Republic of the', '+243'),
(203, 'CI', 'Cote d''Ivoire', '+225'),
(204, 'FK', 'Falkland Islands (Malvinas)', '+500'),
(205, 'GG', 'Guernsey', '+44'),
(206, 'VA', 'Holy See (Vatican City State)', '+379'),
(207, 'HK', 'Hong Kong', '+852'),
(208, 'IR', 'Iran, Islamic Republic of', '+98'),
(209, 'IM', 'Isle of Man', '+44'),
(210, 'JE', 'Jersey', '+44'),
(211, 'KP', 'Korea, Democratic People''s Republic of', '+850'),
(212, 'KR', 'Korea, Republic of', '+82'),
(213, 'LA', 'Lao People''s Democratic Republic', '+856'),
(214, 'LY', 'Libyan Arab Jamahiriya', '+218'),
(215, 'MO', 'Macao', '+853'),
(216, 'MK', 'Macedonia, The Former Yugoslav Republic of', '+389'),
(217, 'FM', 'Micronesia, Federated States of', '+691'),
(218, 'MD', 'Moldova, Republic of', '+373'),
(219, 'MZ', 'Mozambique', '+258'),
(220, 'PS', 'Palestinian Territory, Occupied', '+970'),
(221, 'PN', 'Pitcairn', '+872'),
(222, 'RE', 'Réunion', '+262'),
(223, 'RU', 'Russia', '+7'),
(224, 'BL', 'Saint Barthélemy', '+590'),
(225, 'SH', 'Saint Helena, Ascension and Tristan Da Cunha', '+290'),
(226, 'KN', 'Saint Kitts and Nevis', '+1 869'),
(227, 'LC', 'Saint Lucia', '+1 758'),
(228, 'MF', 'Saint Martin', '+590'),
(229, 'PM', 'Saint Pierre and Miquelon', '+508'),
(230, 'VC', 'Saint Vincent and the Grenadines', '+1 784'),
(231, 'ST', 'Sao Tome and Principe', '+239'),
(232, 'SO', 'Somalia', '+252'),
(233, 'SJ', 'Svalbard and Jan Mayen', '+47'),
(234, 'SY', 'Syrian Arab Republic', '+963'),
(235, 'TW', 'Taiwan, Province of China', '+886'),
(236, 'TZ', 'Tanzania, United Republic of', '+255'),
(237, 'TL', 'Timor-Leste', '+670'),
(238, 'VE', 'Venezuela, Bolivarian Republic of', '+58'),
(239, 'VN', 'Viet Nam', '+84'),
(240, 'VG', 'Virgin Islands, British', '+1 284'),
(241, 'VI', 'Virgin Islands, U.S.', '+1 340');

-- --------------------------------------------------------

--
-- Table structure for table `msp_tfa_trusted`
--

CREATE TABLE IF NOT EXISTS `msp_tfa_trusted` (
  `msp_tfa_trusted_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Trusted device ID',
  `date_time` datetime NOT NULL COMMENT 'Date and time',
  `user_id` int(10) unsigned NOT NULL COMMENT 'User ID',
  `device_name` text NOT NULL COMMENT 'Device name',
  `token` text NOT NULL COMMENT 'Token',
  `last_ip` text NOT NULL COMMENT 'Last IP',
  PRIMARY KEY (`msp_tfa_trusted_id`),
  KEY `MSP_TFA_TRUSTED_USER_ID_ADMIN_USER_USER_ID` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='msp_tfa_trusted' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `msp_tfa_user_config`
--

CREATE TABLE IF NOT EXISTS `msp_tfa_user_config` (
  `msp_tfa_user_config_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'TFA admin user ID',
  `user_id` int(10) unsigned NOT NULL COMMENT 'User ID',
  `encoded_providers` text COMMENT 'Encoded providers list',
  `encoded_config` text COMMENT 'Encoded providers configuration',
  `default_provider` text COMMENT 'Default provider',
  PRIMARY KEY (`msp_tfa_user_config_id`),
  KEY `MSP_TFA_USER_CONFIG_USER_ID_ADMIN_USER_USER_ID` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='msp_tfa_user_config' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mview_state`
--

CREATE TABLE IF NOT EXISTS `mview_state` (
  `state_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'View State Id',
  `view_id` varchar(255) DEFAULT NULL COMMENT 'View Id',
  `mode` varchar(16) DEFAULT 'disabled' COMMENT 'View Mode',
  `status` varchar(16) DEFAULT 'idle' COMMENT 'View Status',
  `updated` datetime DEFAULT NULL COMMENT 'View updated time',
  `version_id` int(10) unsigned DEFAULT NULL COMMENT 'View Version Id',
  PRIMARY KEY (`state_id`),
  KEY `MVIEW_STATE_VIEW_ID` (`view_id`),
  KEY `MVIEW_STATE_MODE` (`mode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='View State' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `newsletter_problem`
--

CREATE TABLE IF NOT EXISTS `newsletter_problem` (
  `problem_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Problem Id',
  `subscriber_id` int(10) unsigned DEFAULT NULL COMMENT 'Subscriber Id',
  `queue_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Queue Id',
  `problem_error_code` int(10) unsigned DEFAULT '0' COMMENT 'Problem Error Code',
  `problem_error_text` varchar(200) DEFAULT NULL COMMENT 'Problem Error Text',
  PRIMARY KEY (`problem_id`),
  KEY `NEWSLETTER_PROBLEM_SUBSCRIBER_ID` (`subscriber_id`),
  KEY `NEWSLETTER_PROBLEM_QUEUE_ID` (`queue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Problems' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `newsletter_queue`
--

CREATE TABLE IF NOT EXISTS `newsletter_queue` (
  `queue_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Queue Id',
  `template_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Template ID',
  `newsletter_type` int(11) DEFAULT NULL COMMENT 'Newsletter Type',
  `newsletter_text` text COMMENT 'Newsletter Text',
  `newsletter_styles` text COMMENT 'Newsletter Styles',
  `newsletter_subject` varchar(200) DEFAULT NULL COMMENT 'Newsletter Subject',
  `newsletter_sender_name` varchar(200) DEFAULT NULL COMMENT 'Newsletter Sender Name',
  `newsletter_sender_email` varchar(200) DEFAULT NULL COMMENT 'Newsletter Sender Email',
  `queue_status` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Queue Status',
  `queue_start_at` timestamp NULL DEFAULT NULL COMMENT 'Queue Start At',
  `queue_finish_at` timestamp NULL DEFAULT NULL COMMENT 'Queue Finish At',
  PRIMARY KEY (`queue_id`),
  KEY `NEWSLETTER_QUEUE_TEMPLATE_ID` (`template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Queue' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `newsletter_queue_link`
--

CREATE TABLE IF NOT EXISTS `newsletter_queue_link` (
  `queue_link_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Queue Link Id',
  `queue_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Queue Id',
  `subscriber_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Subscriber Id',
  `letter_sent_at` timestamp NULL DEFAULT NULL COMMENT 'Letter Sent At',
  PRIMARY KEY (`queue_link_id`),
  KEY `NEWSLETTER_QUEUE_LINK_SUBSCRIBER_ID` (`subscriber_id`),
  KEY `NEWSLETTER_QUEUE_LINK_QUEUE_ID_LETTER_SENT_AT` (`queue_id`,`letter_sent_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Queue Link' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `newsletter_queue_store_link`
--

CREATE TABLE IF NOT EXISTS `newsletter_queue_store_link` (
  `queue_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Queue Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  PRIMARY KEY (`queue_id`,`store_id`),
  KEY `NEWSLETTER_QUEUE_STORE_LINK_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Queue Store Link';

-- --------------------------------------------------------

--
-- Table structure for table `newsletter_subscriber`
--

CREATE TABLE IF NOT EXISTS `newsletter_subscriber` (
  `subscriber_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Subscriber Id',
  `store_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Store Id',
  `change_status_at` timestamp NULL DEFAULT NULL COMMENT 'Change Status At',
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Id',
  `subscriber_email` varchar(150) DEFAULT NULL COMMENT 'Subscriber Email',
  `subscriber_status` int(11) NOT NULL DEFAULT '0' COMMENT 'Subscriber Status',
  `subscriber_confirm_code` varchar(32) DEFAULT 'NULL' COMMENT 'Subscriber Confirm Code',
  PRIMARY KEY (`subscriber_id`),
  KEY `NEWSLETTER_SUBSCRIBER_CUSTOMER_ID` (`customer_id`),
  KEY `NEWSLETTER_SUBSCRIBER_STORE_ID` (`store_id`),
  KEY `NEWSLETTER_SUBSCRIBER_SUBSCRIBER_EMAIL` (`subscriber_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Subscriber' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `newsletter_template`
--

CREATE TABLE IF NOT EXISTS `newsletter_template` (
  `template_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Template ID',
  `template_code` varchar(150) DEFAULT NULL COMMENT 'Template Code',
  `template_text` text COMMENT 'Template Text',
  `template_styles` text COMMENT 'Template Styles',
  `template_type` int(10) unsigned DEFAULT NULL COMMENT 'Template Type',
  `template_subject` varchar(200) DEFAULT NULL COMMENT 'Template Subject',
  `template_sender_name` varchar(200) DEFAULT NULL COMMENT 'Template Sender Name',
  `template_sender_email` varchar(200) DEFAULT NULL COMMENT 'Template Sender Email',
  `template_actual` smallint(5) unsigned DEFAULT '1' COMMENT 'Template Actual',
  `added_at` timestamp NULL DEFAULT NULL COMMENT 'Added At',
  `modified_at` timestamp NULL DEFAULT NULL COMMENT 'Modified At',
  PRIMARY KEY (`template_id`),
  KEY `NEWSLETTER_TEMPLATE_TEMPLATE_ACTUAL` (`template_actual`),
  KEY `NEWSLETTER_TEMPLATE_ADDED_AT` (`added_at`),
  KEY `NEWSLETTER_TEMPLATE_MODIFIED_AT` (`modified_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Template' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_consumer`
--

CREATE TABLE IF NOT EXISTS `oauth_consumer` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `name` varchar(255) NOT NULL COMMENT 'Name of consumer',
  `key` varchar(32) NOT NULL COMMENT 'Key code',
  `secret` varchar(32) NOT NULL COMMENT 'Secret code',
  `callback_url` text COMMENT 'Callback URL',
  `rejected_callback_url` text NOT NULL COMMENT 'Rejected callback URL',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `OAUTH_CONSUMER_KEY` (`key`),
  UNIQUE KEY `OAUTH_CONSUMER_SECRET` (`secret`),
  KEY `OAUTH_CONSUMER_CREATED_AT` (`created_at`),
  KEY `OAUTH_CONSUMER_UPDATED_AT` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='OAuth Consumers' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_nonce`
--

CREATE TABLE IF NOT EXISTS `oauth_nonce` (
  `nonce` varchar(32) NOT NULL COMMENT 'Nonce String',
  `timestamp` int(10) unsigned NOT NULL COMMENT 'Nonce Timestamp',
  `consumer_id` int(10) unsigned NOT NULL COMMENT 'Consumer ID',
  UNIQUE KEY `OAUTH_NONCE_NONCE_CONSUMER_ID` (`nonce`,`consumer_id`),
  KEY `OAUTH_NONCE_CONSUMER_ID_OAUTH_CONSUMER_ENTITY_ID` (`consumer_id`),
  KEY `OAUTH_NONCE_TIMESTAMP` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='OAuth Nonce';

-- --------------------------------------------------------

--
-- Table structure for table `oauth_token`
--

CREATE TABLE IF NOT EXISTS `oauth_token` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `consumer_id` int(10) unsigned DEFAULT NULL COMMENT 'Oauth Consumer ID',
  `admin_id` int(10) unsigned DEFAULT NULL COMMENT 'Admin user ID',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer user ID',
  `type` varchar(16) NOT NULL COMMENT 'Token Type',
  `token` varchar(32) NOT NULL COMMENT 'Token',
  `secret` varchar(32) NOT NULL COMMENT 'Token Secret',
  `verifier` varchar(32) DEFAULT NULL COMMENT 'Token Verifier',
  `callback_url` text NOT NULL COMMENT 'Token Callback URL',
  `revoked` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Token revoked',
  `authorized` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Token authorized',
  `user_type` int(11) DEFAULT NULL COMMENT 'User type',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Token creation timestamp',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `OAUTH_TOKEN_TOKEN` (`token`),
  KEY `OAUTH_TOKEN_ADMIN_ID_ADMIN_USER_USER_ID` (`admin_id`),
  KEY `OAUTH_TOKEN_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` (`customer_id`),
  KEY `OAUTH_TOKEN_CONSUMER_ID` (`consumer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='OAuth Tokens' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_token_request_log`
--

CREATE TABLE IF NOT EXISTS `oauth_token_request_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Log Id',
  `user_name` varchar(255) NOT NULL COMMENT 'Customer email or admin login',
  `user_type` smallint(5) unsigned NOT NULL COMMENT 'User type (admin or customer)',
  `failures_count` smallint(5) unsigned DEFAULT '0' COMMENT 'Number of failed authentication attempts in a row',
  `lock_expires_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Lock expiration time',
  PRIMARY KEY (`log_id`),
  UNIQUE KEY `OAUTH_TOKEN_REQUEST_LOG_USER_NAME_USER_TYPE` (`user_name`,`user_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Log of token request authentication failures.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_request_event`
--

CREATE TABLE IF NOT EXISTS `password_reset_request_event` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `request_type` smallint(5) unsigned NOT NULL COMMENT 'Type of the event under a security control',
  `account_reference` varchar(255) DEFAULT NULL COMMENT 'An identifier for existing account or another target',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Timestamp when the event occurs',
  `ip` varchar(15) NOT NULL COMMENT 'Remote user IP',
  PRIMARY KEY (`id`),
  KEY `PASSWORD_RESET_REQUEST_EVENT_ACCOUNT_REFERENCE` (`account_reference`),
  KEY `PASSWORD_RESET_REQUEST_EVENT_CREATED_AT` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Password Reset Request Event under a security control' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `patch_list`
--

CREATE TABLE IF NOT EXISTS `patch_list` (
  `patch_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Patch Auto Increment',
  `patch_name` varchar(1024) NOT NULL COMMENT 'Patch Class Name',
  PRIMARY KEY (`patch_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='List of data/schema patches' AUTO_INCREMENT=109 ;

--
-- Dumping data for table `patch_list`
--

INSERT INTO `patch_list` (`patch_id`, `patch_name`) VALUES
(1, 'Magento\\Store\\Setup\\Patch\\Schema\\InitializeStoresAndWebsites'),
(2, 'Magento\\Catalog\\Setup\\Patch\\Schema\\EnableSegmentation'),
(3, 'Magento\\InventoryCatalog\\Setup\\Patch\\Schema\\CreateLegacyStockStatusView'),
(4, 'Magento\\InventoryCatalog\\Setup\\Patch\\Schema\\InitializeDefaultStock'),
(5, 'Magento\\InventoryCatalog\\Setup\\Patch\\Schema\\UpdateInventorySourceItem'),
(6, 'Magento\\InventoryCatalog\\Setup\\Patch\\Schema\\ReindexDefaultSource'),
(7, 'Magento\\Store\\Setup\\Patch\\Schema\\InitializeStoresAndWebsites'),
(8, 'Magento\\InventorySales\\Setup\\Patch\\Schema\\InitializeWebsiteDefaultSock'),
(9, 'Magento\\Bundle\\Setup\\Patch\\Schema\\UpdateBundleRelatedSchema'),
(10, 'Magento\\Store\\Setup\\Patch\\Data\\UpdateStoreGroupCodes'),
(11, 'Magento\\Directory\\Setup\\Patch\\Data\\InitializeDirectoryData'),
(12, 'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForCroatia'),
(13, 'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForIndia'),
(14, 'Magento\\Theme\\Setup\\Patch\\Data\\RegisterThemes'),
(15, 'Magento\\Theme\\Setup\\Patch\\Data\\ConvertSerializedData'),
(16, 'Magento\\Eav\\Setup\\Patch\\Data\\InitializeAttributeModels'),
(17, 'Magento\\Config\\Setup\\Patch\\Data\\UpdateClassAliases'),
(18, 'Magento\\Indexer\\Setup\\Patch\\Data\\InitializeIndexerState'),
(19, 'Magento\\User\\Setup\\Patch\\Data\\UpgradePasswordHashes'),
(20, 'Magento\\User\\Setup\\Patch\\Data\\UpgradeSerializedFields'),
(21, 'Magento\\Authorization\\Setup\\Patch\\Data\\InitializeAuthRoles'),
(22, 'Magento\\Customer\\Setup\\Patch\\Data\\DefaultCustomerGroupsAndAttributes'),
(23, 'Magento\\Customer\\Setup\\Patch\\Data\\UpdateCustomerAttributesMetadata'),
(24, 'Magento\\Customer\\Setup\\Patch\\Data\\AddNonSpecifiedGenderAttributeOption'),
(25, 'Magento\\Customer\\Setup\\Patch\\Data\\UpdateIdentifierCustomerAttributesVisibility'),
(26, 'Magento\\Customer\\Setup\\Patch\\Data\\AddCustomerUpdatedAtAttribute'),
(27, 'Magento\\Customer\\Setup\\Patch\\Data\\UpgradePasswordHashAndAddress'),
(28, 'Magento\\Customer\\Setup\\Patch\\Data\\RemoveCheckoutRegisterAndUpdateAttributes'),
(29, 'Magento\\Customer\\Setup\\Patch\\Data\\AddSecurityTrackingAttributes'),
(30, 'Magento\\Customer\\Setup\\Patch\\Data\\UpdateAutocompleteOnStorefrontConfigPath'),
(31, 'Magento\\Customer\\Setup\\Patch\\Data\\MigrateStoresAllowedCountriesToWebsite'),
(32, 'Magento\\Customer\\Setup\\Patch\\Data\\ConvertValidationRulesFromSerializedToJson'),
(33, 'Magento\\Customer\\Setup\\Patch\\Data\\UpdateVATNumber'),
(34, 'Magento\\Customer\\Setup\\Patch\\Data\\UpdateCustomerAttributeInputFilters'),
(35, 'Magento\\Cms\\Setup\\Patch\\Data\\CreateDefaultPages'),
(36, 'Magento\\Cms\\Setup\\Patch\\Data\\UpdatePrivacyPolicyPage'),
(37, 'Magento\\Cms\\Setup\\Patch\\Data\\ConvertWidgetConditionsToJson'),
(38, 'Magento\\Catalog\\Setup\\Patch\\Data\\InstallDefaultCategories'),
(39, 'Magento\\Catalog\\Setup\\Patch\\Data\\SetNewResourceModelsPaths'),
(40, 'Magento\\Catalog\\Setup\\Patch\\Data\\UpdateDefaultAttributeValue'),
(41, 'Magento\\Catalog\\Setup\\Patch\\Data\\UpdateMediaAttributesBackendTypes'),
(42, 'Magento\\Catalog\\Setup\\Patch\\Data\\UpdateProductAttributes'),
(43, 'Magento\\Catalog\\Setup\\Patch\\Data\\UpdateProductMetaDescription'),
(44, 'Magento\\Catalog\\Setup\\Patch\\Data\\ChangePriceAttributeDefaultScope'),
(45, 'Magento\\Catalog\\Setup\\Patch\\Data\\DisallowUsingHtmlForProductName'),
(46, 'Magento\\Catalog\\Setup\\Patch\\Data\\EnableDirectiveParsing'),
(47, 'Magento\\Catalog\\Setup\\Patch\\Data\\EnableSegmentation'),
(48, 'Magento\\Catalog\\Setup\\Patch\\Data\\UpgradeWidgetData'),
(49, 'Magento\\Catalog\\Setup\\Patch\\Data\\UpgradeWebsiteAttributes'),
(50, 'Magento\\Quote\\Setup\\Patch\\Data\\InstallEntityTypes'),
(51, 'Magento\\Quote\\Setup\\Patch\\Data\\ConvertSerializedDataToJson'),
(52, 'Magento\\Integration\\Setup\\Patch\\Data\\RemoveInactiveTokens'),
(53, 'Magento\\CatalogInventory\\Setup\\Patch\\Data\\CreateDefaultStock'),
(54, 'Magento\\CatalogInventory\\Setup\\Patch\\Data\\UpdateStockItemsWebsite'),
(55, 'Magento\\CatalogInventory\\Setup\\Patch\\Data\\ConvertSerializedDataToJson'),
(56, 'Magento\\Msrp\\Setup\\Patch\\Data\\InitializeMsrpAttributes'),
(57, 'Magento\\Msrp\\Setup\\Patch\\Data\\ChangePriceAttributeDefaultScope'),
(58, 'Magento\\CatalogRule\\Setup\\Patch\\Data\\UpdateClassAliasesForCatalogRules'),
(59, 'Magento\\CatalogRule\\Setup\\Patch\\Data\\ConvertSerializedDataToJson'),
(60, 'Magento\\CatalogUrlRewrite\\Setup\\Patch\\Data\\CreateUrlAttributes'),
(61, 'Magento\\Widget\\Setup\\Patch\\Data\\UpgradeModelInstanceClassAliases'),
(62, 'Magento\\Widget\\Setup\\Patch\\Data\\ConvertSerializedData'),
(63, 'Magento\\Sales\\Setup\\Patch\\Data\\InstallOrderStatusesAndInitialSalesConfig'),
(64, 'Magento\\Sales\\Setup\\Patch\\Data\\UpdateEntityTypes'),
(65, 'Magento\\Sales\\Setup\\Patch\\Data\\ConvertSerializedDataToJson'),
(66, 'Magento\\Sales\\Setup\\Patch\\Data\\FillQuoteAddressIdInSalesOrderAddress'),
(67, 'Magento\\Sales\\Setup\\Patch\\Data\\UpdateEntityTypeModelForInvoice'),
(68, 'Magento\\Checkout\\Setup\\Patch\\Data\\PrepareInitialCheckoutConfiguration'),
(69, 'Magento\\Vault\\Setup\\Patch\\Data\\SetCreditCardAsDefaultTokenType'),
(70, 'Magento\\ConfigurableProduct\\Setup\\Patch\\Data\\InstallInitialConfigurableAttributes'),
(71, 'Magento\\ConfigurableProduct\\Setup\\Patch\\Data\\UpdateManufacturerAttribute'),
(72, 'Magento\\ConfigurableProduct\\Setup\\Patch\\Data\\UpdateTierPriceAttribute'),
(73, 'Magento\\CurrencySymbol\\Setup\\Patch\\Data\\ConvertSerializedCustomCurrencySymbolToJson'),
(74, 'Magento\\Paypal\\Setup\\Patch\\Data\\AddPaypalOrderStatuses'),
(75, 'Magento\\Analytics\\Setup\\Patch\\Data\\PrepareInitialConfig'),
(76, 'Magento\\Dhl\\Setup\\Patch\\Data\\PrepareShipmentDays'),
(77, 'Magento\\Downloadable\\Setup\\Patch\\Data\\InstallDownloadableAttributes'),
(78, 'Magento\\CatalogSearch\\Setup\\Patch\\Data\\MySQLSearchDeprecationNotification'),
(79, 'Magento\\CatalogSearch\\Setup\\Patch\\Data\\SetInitialSearchWeightForAttributes'),
(80, 'Magento\\EncryptionKey\\Setup\\Patch\\Data\\SodiumChachaPatch'),
(81, 'Magento\\Fedex\\Setup\\Patch\\Data\\ConfigureFedexDefaults'),
(82, 'Magento\\GiftMessage\\Setup\\Patch\\Data\\AddGiftMessageAttributes'),
(83, 'Magento\\GiftMessage\\Setup\\Patch\\Data\\MoveGiftMessageToGiftOptionsGroup'),
(84, 'Magento\\GiftMessage\\Setup\\Patch\\Data\\UpdateGiftMessageAttribute'),
(85, 'Magento\\GroupedProduct\\Setup\\Patch\\Data\\InitializeGroupedProductLinks'),
(86, 'Magento\\GroupedProduct\\Setup\\Patch\\Data\\UpdateProductRelations'),
(87, 'Magento\\Braintree\\Setup\\Patch\\Data\\ConvertSerializedDataToJson'),
(88, 'Magento\\InventoryLowQuantityNotification\\Setup\\Patch\\Data\\MigrateCatalogInventoryNotifyStockQuantityData'),
(89, 'Magento\\SalesRule\\Setup\\Patch\\Data\\PrepareRuleModelSerializedData'),
(90, 'Magento\\SalesRule\\Setup\\Patch\\Data\\ConvertSerializedDataToJson'),
(91, 'Magento\\SalesRule\\Setup\\Patch\\Data\\FillSalesRuleProductAttributeTable'),
(92, 'Magento\\Reports\\Setup\\Patch\\Data\\InitializeReportEntityTypesAndPages'),
(93, 'Magento\\Review\\Setup\\Patch\\Data\\InitReviewStatusesAndData'),
(94, 'Magento\\OfflineShipping\\Setup\\Patch\\Data\\UpdateQuoteShippingAddresses'),
(95, 'Magento\\UrlRewrite\\Setup\\Patch\\Data\\ConvertSerializedDataToJson'),
(96, 'Magento\\Wishlist\\Setup\\Patch\\Data\\ConvertSerializedData'),
(97, 'Magento\\Swatches\\Setup\\Patch\\Data\\AddSwatchImageAttribute'),
(98, 'Magento\\Swatches\\Setup\\Patch\\Data\\AddSwatchImageToDefaultAttribtueSet'),
(99, 'Magento\\Swatches\\Setup\\Patch\\Data\\UpdateAdminTextSwatchValues'),
(100, 'Magento\\Swatches\\Setup\\Patch\\Data\\ConvertAdditionalDataToJson'),
(101, 'Magento\\Tax\\Setup\\Patch\\Data\\AddTaxAttributeAndTaxClasses'),
(102, 'Magento\\Tax\\Setup\\Patch\\Data\\UpdateTaxClassAttributeVisibility'),
(103, 'Magento\\Tax\\Setup\\Patch\\Data\\UpdateTaxRegionId'),
(104, 'Magento\\SampleData\\Setup\\Patch\\Data\\ClearSampleDataState'),
(105, 'Magento\\Usps\\Setup\\Patch\\Data\\UpdateAllowedMethods'),
(106, 'Magento\\Bundle\\Setup\\Patch\\Data\\ApplyAttributesUpdate'),
(107, 'Magento\\Bundle\\Setup\\Patch\\Data\\UpdateBundleRelatedEntityTytpes'),
(108, 'Magento\\Weee\\Setup\\Patch\\Data\\InitQuoteAndOrderAttributes');

-- --------------------------------------------------------

--
-- Table structure for table `paypal_billing_agreement`
--

CREATE TABLE IF NOT EXISTS `paypal_billing_agreement` (
  `agreement_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Agreement Id',
  `customer_id` int(10) unsigned NOT NULL COMMENT 'Customer Id',
  `method_code` varchar(32) NOT NULL COMMENT 'Method Code',
  `reference_id` varchar(32) NOT NULL COMMENT 'Reference Id',
  `status` varchar(20) NOT NULL COMMENT 'Status',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `agreement_label` varchar(255) DEFAULT NULL COMMENT 'Agreement Label',
  PRIMARY KEY (`agreement_id`),
  KEY `PAYPAL_BILLING_AGREEMENT_CUSTOMER_ID` (`customer_id`),
  KEY `PAYPAL_BILLING_AGREEMENT_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Billing Agreement' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `paypal_billing_agreement_order`
--

CREATE TABLE IF NOT EXISTS `paypal_billing_agreement_order` (
  `agreement_id` int(10) unsigned NOT NULL COMMENT 'Agreement Id',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  PRIMARY KEY (`agreement_id`,`order_id`),
  KEY `PAYPAL_BILLING_AGREEMENT_ORDER_ORDER_ID` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Billing Agreement Order';

-- --------------------------------------------------------

--
-- Table structure for table `paypal_cert`
--

CREATE TABLE IF NOT EXISTS `paypal_cert` (
  `cert_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Cert Id',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website Id',
  `content` text COMMENT 'Content',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  PRIMARY KEY (`cert_id`),
  KEY `PAYPAL_CERT_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Paypal Certificate Table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `paypal_payment_transaction`
--

CREATE TABLE IF NOT EXISTS `paypal_payment_transaction` (
  `transaction_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `txn_id` varchar(100) DEFAULT NULL COMMENT 'Txn Id',
  `additional_information` blob COMMENT 'Additional Information',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  PRIMARY KEY (`transaction_id`),
  UNIQUE KEY `PAYPAL_PAYMENT_TRANSACTION_TXN_ID` (`txn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='PayPal Payflow Link Payment Transaction' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `paypal_settlement_report`
--

CREATE TABLE IF NOT EXISTS `paypal_settlement_report` (
  `report_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Report Id',
  `report_date` date DEFAULT NULL COMMENT 'Report Date',
  `account_id` varchar(64) DEFAULT NULL COMMENT 'Account Id',
  `filename` varchar(24) DEFAULT NULL COMMENT 'Filename',
  `last_modified` timestamp NULL DEFAULT NULL COMMENT 'Last Modified',
  PRIMARY KEY (`report_id`),
  UNIQUE KEY `PAYPAL_SETTLEMENT_REPORT_REPORT_DATE_ACCOUNT_ID` (`report_date`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Paypal Settlement Report Table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `paypal_settlement_report_row`
--

CREATE TABLE IF NOT EXISTS `paypal_settlement_report_row` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Row Id',
  `report_id` int(10) unsigned NOT NULL COMMENT 'Report Id',
  `transaction_id` varchar(19) DEFAULT NULL COMMENT 'Transaction Id',
  `invoice_id` varchar(127) DEFAULT NULL COMMENT 'Invoice Id',
  `paypal_reference_id` varchar(19) DEFAULT NULL COMMENT 'Paypal Reference Id',
  `paypal_reference_id_type` varchar(3) DEFAULT NULL COMMENT 'Paypal Reference Id Type',
  `transaction_event_code` varchar(5) DEFAULT NULL COMMENT 'Transaction Event Code',
  `transaction_initiation_date` timestamp NULL DEFAULT NULL COMMENT 'Transaction Initiation Date',
  `transaction_completion_date` timestamp NULL DEFAULT NULL COMMENT 'Transaction Completion Date',
  `transaction_debit_or_credit` varchar(2) NOT NULL DEFAULT 'CR' COMMENT 'Transaction Debit Or Credit',
  `gross_transaction_amount` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Gross Transaction Amount',
  `gross_transaction_currency` varchar(3) DEFAULT NULL COMMENT 'Gross Transaction Currency',
  `fee_debit_or_credit` varchar(2) DEFAULT NULL COMMENT 'Fee Debit Or Credit',
  `fee_amount` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Fee Amount',
  `fee_currency` varchar(3) DEFAULT NULL COMMENT 'Fee Currency',
  `custom_field` varchar(255) DEFAULT NULL COMMENT 'Custom Field',
  `consumer_id` varchar(127) DEFAULT NULL COMMENT 'Consumer Id',
  `payment_tracking_id` varchar(255) DEFAULT NULL COMMENT 'Payment Tracking ID',
  `store_id` varchar(50) DEFAULT NULL COMMENT 'Store ID',
  PRIMARY KEY (`row_id`),
  KEY `PAYPAL_SETTLEMENT_REPORT_ROW_REPORT_ID` (`report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Paypal Settlement Report Row Table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `persistent_session`
--

CREATE TABLE IF NOT EXISTS `persistent_session` (
  `persistent_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Session id',
  `key` varchar(50) NOT NULL COMMENT 'Unique cookie key',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer id',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website ID',
  `info` text COMMENT 'Session Data',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  PRIMARY KEY (`persistent_id`),
  UNIQUE KEY `PERSISTENT_SESSION_KEY` (`key`),
  UNIQUE KEY `PERSISTENT_SESSION_CUSTOMER_ID` (`customer_id`),
  KEY `PERSISTENT_SESSION_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` (`website_id`),
  KEY `PERSISTENT_SESSION_UPDATED_AT` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Persistent Session' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `product_alert_price`
--

CREATE TABLE IF NOT EXISTS `product_alert_price` (
  `alert_price_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Product alert price id',
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer id',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product id',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price amount',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website id',
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Product alert add date',
  `last_send_date` timestamp NULL DEFAULT NULL COMMENT 'Product alert last send date',
  `send_count` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Product alert send count',
  `status` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Product alert status',
  PRIMARY KEY (`alert_price_id`),
  KEY `PRODUCT_ALERT_PRICE_CUSTOMER_ID` (`customer_id`),
  KEY `PRODUCT_ALERT_PRICE_PRODUCT_ID` (`product_id`),
  KEY `PRODUCT_ALERT_PRICE_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Product Alert Price' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `product_alert_stock`
--

CREATE TABLE IF NOT EXISTS `product_alert_stock` (
  `alert_stock_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Product alert stock id',
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer id',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product id',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website id',
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Product alert add date',
  `send_date` timestamp NULL DEFAULT NULL COMMENT 'Product alert send date',
  `send_count` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Send Count',
  `status` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Product alert status',
  PRIMARY KEY (`alert_stock_id`),
  KEY `PRODUCT_ALERT_STOCK_CUSTOMER_ID` (`customer_id`),
  KEY `PRODUCT_ALERT_STOCK_PRODUCT_ID` (`product_id`),
  KEY `PRODUCT_ALERT_STOCK_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Product Alert Stock' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `queue`
--

CREATE TABLE IF NOT EXISTS `queue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Queue ID',
  `name` varchar(255) DEFAULT NULL COMMENT 'Queue name',
  PRIMARY KEY (`id`),
  UNIQUE KEY `QUEUE_NAME` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table storing unique queues' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `queue_lock`
--

CREATE TABLE IF NOT EXISTS `queue_lock` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Message ID',
  `message_code` varchar(255) NOT NULL DEFAULT '' COMMENT 'Message Code',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Created At',
  PRIMARY KEY (`id`),
  UNIQUE KEY `QUEUE_LOCK_MESSAGE_CODE` (`message_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Messages that were processed are inserted here to be locked.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `queue_message`
--

CREATE TABLE IF NOT EXISTS `queue_message` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Message ID',
  `topic_name` varchar(255) DEFAULT NULL COMMENT 'Message topic',
  `body` longtext COMMENT 'Message body',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Queue messages' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `queue_message_status`
--

CREATE TABLE IF NOT EXISTS `queue_message_status` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Relation ID',
  `queue_id` int(10) unsigned NOT NULL COMMENT 'Queue ID',
  `message_id` bigint(20) unsigned NOT NULL COMMENT 'Message ID',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `status` smallint(5) unsigned NOT NULL COMMENT 'Message status in particular queue',
  `number_of_trials` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Number of trials to processed failed message processing',
  PRIMARY KEY (`id`),
  UNIQUE KEY `QUEUE_MESSAGE_STATUS_QUEUE_ID_MESSAGE_ID` (`queue_id`,`message_id`),
  KEY `QUEUE_MESSAGE_STATUS_MESSAGE_ID_QUEUE_MESSAGE_ID` (`message_id`),
  KEY `QUEUE_MESSAGE_STATUS_STATUS_UPDATED_AT` (`status`,`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Relation table to keep associations between queues and messages' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `quote`
--

CREATE TABLE IF NOT EXISTS `quote` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `converted_at` timestamp NULL DEFAULT NULL COMMENT 'Converted At',
  `is_active` smallint(5) unsigned DEFAULT '1' COMMENT 'Is Active',
  `is_virtual` smallint(5) unsigned DEFAULT '0' COMMENT 'Is Virtual',
  `is_multi_shipping` smallint(5) unsigned DEFAULT '0' COMMENT 'Is Multi Shipping',
  `items_count` int(10) unsigned DEFAULT '0' COMMENT 'Items Count',
  `items_qty` decimal(12,4) DEFAULT '0.0000' COMMENT 'Items Qty',
  `orig_order_id` int(10) unsigned DEFAULT '0' COMMENT 'Orig Order Id',
  `store_to_base_rate` decimal(12,4) DEFAULT '0.0000' COMMENT 'Store To Base Rate',
  `store_to_quote_rate` decimal(12,4) DEFAULT '0.0000' COMMENT 'Store To Quote Rate',
  `base_currency_code` varchar(255) DEFAULT NULL COMMENT 'Base Currency Code',
  `store_currency_code` varchar(255) DEFAULT NULL COMMENT 'Store Currency Code',
  `quote_currency_code` varchar(255) DEFAULT NULL COMMENT 'Quote Currency Code',
  `grand_total` decimal(12,4) DEFAULT '0.0000' COMMENT 'Grand Total',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Grand Total',
  `checkout_method` varchar(255) DEFAULT NULL COMMENT 'Checkout Method',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `customer_tax_class_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Tax Class Id',
  `customer_group_id` int(10) unsigned DEFAULT '0' COMMENT 'Customer Group Id',
  `customer_email` varchar(255) DEFAULT NULL COMMENT 'Customer Email',
  `customer_prefix` varchar(40) DEFAULT NULL COMMENT 'Customer Prefix',
  `customer_firstname` varchar(255) DEFAULT NULL COMMENT 'Customer Firstname',
  `customer_middlename` varchar(40) DEFAULT NULL COMMENT 'Customer Middlename',
  `customer_lastname` varchar(255) DEFAULT NULL COMMENT 'Customer Lastname',
  `customer_suffix` varchar(40) DEFAULT NULL COMMENT 'Customer Suffix',
  `customer_dob` datetime DEFAULT NULL COMMENT 'Customer Dob',
  `customer_note` varchar(255) DEFAULT NULL COMMENT 'Customer Note',
  `customer_note_notify` smallint(5) unsigned DEFAULT '1' COMMENT 'Customer Note Notify',
  `customer_is_guest` smallint(5) unsigned DEFAULT '0' COMMENT 'Customer Is Guest',
  `remote_ip` varchar(45) DEFAULT NULL COMMENT 'Remote Ip',
  `applied_rule_ids` varchar(255) DEFAULT NULL COMMENT 'Applied Rule Ids',
  `reserved_order_id` varchar(64) DEFAULT NULL COMMENT 'Reserved Order Id',
  `password_hash` varchar(255) DEFAULT NULL COMMENT 'Password Hash',
  `coupon_code` varchar(255) DEFAULT NULL COMMENT 'Coupon Code',
  `global_currency_code` varchar(255) DEFAULT NULL COMMENT 'Global Currency Code',
  `base_to_global_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `base_to_quote_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Quote Rate',
  `customer_taxvat` varchar(255) DEFAULT NULL COMMENT 'Customer Taxvat',
  `customer_gender` varchar(255) DEFAULT NULL COMMENT 'Customer Gender',
  `subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal',
  `base_subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal',
  `subtotal_with_discount` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal With Discount',
  `base_subtotal_with_discount` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal With Discount',
  `is_changed` int(10) unsigned DEFAULT NULL COMMENT 'Is Changed',
  `trigger_recollect` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Trigger Recollect',
  `ext_shipping_info` text COMMENT 'Ext Shipping Info',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  `is_persistent` smallint(5) unsigned DEFAULT '0' COMMENT 'Is Quote Persistent',
  PRIMARY KEY (`entity_id`),
  KEY `QUOTE_CUSTOMER_ID_STORE_ID_IS_ACTIVE` (`customer_id`,`store_id`,`is_active`),
  KEY `QUOTE_STORE_ID` (`store_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `quote`
--

INSERT INTO `quote` (`entity_id`, `store_id`, `created_at`, `updated_at`, `converted_at`, `is_active`, `is_virtual`, `is_multi_shipping`, `items_count`, `items_qty`, `orig_order_id`, `store_to_base_rate`, `store_to_quote_rate`, `base_currency_code`, `store_currency_code`, `quote_currency_code`, `grand_total`, `base_grand_total`, `checkout_method`, `customer_id`, `customer_tax_class_id`, `customer_group_id`, `customer_email`, `customer_prefix`, `customer_firstname`, `customer_middlename`, `customer_lastname`, `customer_suffix`, `customer_dob`, `customer_note`, `customer_note_notify`, `customer_is_guest`, `remote_ip`, `applied_rule_ids`, `reserved_order_id`, `password_hash`, `coupon_code`, `global_currency_code`, `base_to_global_rate`, `base_to_quote_rate`, `customer_taxvat`, `customer_gender`, `subtotal`, `base_subtotal`, `subtotal_with_discount`, `base_subtotal_with_discount`, `is_changed`, `trigger_recollect`, `ext_shipping_info`, `gift_message_id`, `is_persistent`) VALUES
(1, 1, '2018-12-25 18:53:59', '2018-12-25 19:04:22', NULL, 1, 0, 0, 2, 2.0000, 0, 0.0000, 0.0000, 'USD', 'USD', 'USD', 20.0000, 20.0000, NULL, NULL, 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '204.152.203.157', NULL, NULL, NULL, NULL, 'USD', 1.0000, 1.0000, NULL, NULL, 20.0000, 20.0000, 20.0000, 20.0000, 1, 0, NULL, NULL, 0),
(2, 1, '2019-01-01 15:50:41', '2019-01-01 15:50:41', NULL, 1, 0, 0, 0, 0.0000, 0, 0.0000, 0.0000, 'USD', 'USD', 'USD', 0.0000, 0.0000, NULL, 1, NULL, 1, 'rajat61982@gmail.com', NULL, 'Rajat', NULL, 'Kapoor', NULL, NULL, NULL, 1, 0, '110.227.118.63', NULL, NULL, NULL, NULL, 'USD', 1.0000, 1.0000, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 1, 0, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `quote_address`
--

CREATE TABLE IF NOT EXISTS `quote_address` (
  `address_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Address Id',
  `quote_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Quote Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `save_in_address_book` smallint(6) DEFAULT '0' COMMENT 'Save In Address Book',
  `customer_address_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Address Id',
  `address_type` varchar(10) DEFAULT NULL COMMENT 'Address Type',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `prefix` varchar(40) DEFAULT NULL COMMENT 'Prefix',
  `firstname` varchar(255) DEFAULT NULL,
  `middlename` varchar(40) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `suffix` varchar(40) DEFAULT NULL COMMENT 'Suffix',
  `company` varchar(255) DEFAULT NULL COMMENT 'Company',
  `street` varchar(255) DEFAULT NULL COMMENT 'Street',
  `city` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `region_id` int(10) unsigned DEFAULT NULL COMMENT 'Region Id',
  `postcode` varchar(20) DEFAULT NULL COMMENT 'Postcode',
  `country_id` varchar(30) DEFAULT NULL COMMENT 'Country Id',
  `telephone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `same_as_billing` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Same As Billing',
  `collect_shipping_rates` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Collect Shipping Rates',
  `shipping_method` varchar(120) DEFAULT NULL,
  `shipping_description` varchar(255) DEFAULT NULL COMMENT 'Shipping Description',
  `weight` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Weight',
  `subtotal` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal',
  `base_subtotal` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Subtotal',
  `subtotal_with_discount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal With Discount',
  `base_subtotal_with_discount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Subtotal With Discount',
  `tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Tax Amount',
  `base_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Tax Amount',
  `shipping_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Shipping Amount',
  `base_shipping_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Shipping Amount',
  `shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Tax Amount',
  `base_shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Tax Amount',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `base_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Discount Amount',
  `grand_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Grand Total',
  `base_grand_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Grand Total',
  `customer_notes` text COMMENT 'Customer Notes',
  `applied_taxes` text COMMENT 'Applied Taxes',
  `discount_description` varchar(255) DEFAULT NULL COMMENT 'Discount Description',
  `shipping_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Discount Amount',
  `base_shipping_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Discount Amount',
  `subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Incl Tax',
  `base_subtotal_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Total Incl Tax',
  `discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `shipping_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Discount Tax Compensation Amount',
  `base_shipping_discount_tax_compensation_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Discount Tax Compensation Amount',
  `shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Incl Tax',
  `base_shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Incl Tax',
  `vat_id` text COMMENT 'Vat Id',
  `vat_is_valid` smallint(6) DEFAULT NULL COMMENT 'Vat Is Valid',
  `vat_request_id` text COMMENT 'Vat Request Id',
  `vat_request_date` text COMMENT 'Vat Request Date',
  `vat_request_success` smallint(6) DEFAULT NULL COMMENT 'Vat Request Success',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  `free_shipping` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Free Shipping',
  PRIMARY KEY (`address_id`),
  KEY `QUOTE_ADDRESS_QUOTE_ID` (`quote_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Address' AUTO_INCREMENT=5 ;

--
-- Dumping data for table `quote_address`
--

INSERT INTO `quote_address` (`address_id`, `quote_id`, `created_at`, `updated_at`, `customer_id`, `save_in_address_book`, `customer_address_id`, `address_type`, `email`, `prefix`, `firstname`, `middlename`, `lastname`, `suffix`, `company`, `street`, `city`, `region`, `region_id`, `postcode`, `country_id`, `telephone`, `fax`, `same_as_billing`, `collect_shipping_rates`, `shipping_method`, `shipping_description`, `weight`, `subtotal`, `base_subtotal`, `subtotal_with_discount`, `base_subtotal_with_discount`, `tax_amount`, `base_tax_amount`, `shipping_amount`, `base_shipping_amount`, `shipping_tax_amount`, `base_shipping_tax_amount`, `discount_amount`, `base_discount_amount`, `grand_total`, `base_grand_total`, `customer_notes`, `applied_taxes`, `discount_description`, `shipping_discount_amount`, `base_shipping_discount_amount`, `subtotal_incl_tax`, `base_subtotal_total_incl_tax`, `discount_tax_compensation_amount`, `base_discount_tax_compensation_amount`, `shipping_discount_tax_compensation_amount`, `base_shipping_discount_tax_compensation_amnt`, `shipping_incl_tax`, `base_shipping_incl_tax`, `vat_id`, `vat_is_valid`, `vat_request_id`, `vat_request_date`, `vat_request_success`, `gift_message_id`, `free_shipping`) VALUES
(1, 1, '2018-12-25 18:53:59', '0000-00-00 00:00:00', NULL, 0, NULL, 'billing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 'null', NULL, NULL, NULL, 0.0000, NULL, 0.0000, 0.0000, 0.0000, NULL, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(2, 1, '2018-12-25 18:53:59', '0000-00-00 00:00:00', NULL, 0, NULL, 'shipping', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 2.0000, 20.0000, 20.0000, 20.0000, 20.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 20.0000, 20.0000, NULL, '[]', NULL, 0.0000, 0.0000, 20.0000, 20.0000, 0.0000, 0.0000, 0.0000, NULL, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(3, 2, '2019-01-01 15:50:41', '0000-00-00 00:00:00', 1, 0, NULL, 'billing', 'rajat61982@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 'null', NULL, NULL, NULL, 0.0000, NULL, 0.0000, 0.0000, 0.0000, NULL, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(4, 2, '2019-01-01 15:50:41', '0000-00-00 00:00:00', 1, 0, NULL, 'shipping', 'rajat61982@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 'null', NULL, NULL, NULL, 0.0000, NULL, 0.0000, 0.0000, 0.0000, NULL, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `quote_address_item`
--

CREATE TABLE IF NOT EXISTS `quote_address_item` (
  `address_item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Address Item Id',
  `parent_item_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Item Id',
  `quote_address_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Quote Address Id',
  `quote_item_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Quote Item Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `applied_rule_ids` text COMMENT 'Applied Rule Ids',
  `additional_data` text COMMENT 'Additional Data',
  `weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Weight',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `discount_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Amount',
  `tax_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Amount',
  `row_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Row Total',
  `base_row_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Row Total',
  `row_total_with_discount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Row Total With Discount',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Discount Amount',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Tax Amount',
  `row_weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Row Weight',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `super_product_id` int(10) unsigned DEFAULT NULL COMMENT 'Super Product Id',
  `parent_product_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Product Id',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `image` varchar(255) DEFAULT NULL COMMENT 'Image',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `is_qty_decimal` int(10) unsigned DEFAULT NULL COMMENT 'Is Qty Decimal',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `discount_percent` decimal(12,4) DEFAULT NULL COMMENT 'Discount Percent',
  `no_discount` int(10) unsigned DEFAULT NULL COMMENT 'No Discount',
  `tax_percent` decimal(12,4) DEFAULT NULL COMMENT 'Tax Percent',
  `base_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Price',
  `base_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Cost',
  `price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  `free_shipping` int(10) unsigned DEFAULT NULL COMMENT 'Free Shipping',
  PRIMARY KEY (`address_item_id`),
  KEY `QUOTE_ADDRESS_ITEM_QUOTE_ADDRESS_ID` (`quote_address_id`),
  KEY `QUOTE_ADDRESS_ITEM_PARENT_ITEM_ID` (`parent_item_id`),
  KEY `QUOTE_ADDRESS_ITEM_QUOTE_ITEM_ID` (`quote_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Address Item' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `quote_id_mask`
--

CREATE TABLE IF NOT EXISTS `quote_id_mask` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `quote_id` int(10) unsigned NOT NULL COMMENT 'Quote ID',
  `masked_id` varchar(32) DEFAULT NULL COMMENT 'Masked ID',
  PRIMARY KEY (`entity_id`,`quote_id`),
  KEY `QUOTE_ID_MASK_QUOTE_ID` (`quote_id`),
  KEY `QUOTE_ID_MASK_MASKED_ID` (`masked_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Quote ID and masked ID mapping' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `quote_id_mask`
--

INSERT INTO `quote_id_mask` (`entity_id`, `quote_id`, `masked_id`) VALUES
(1, 1, 'BIhHmGa86z8lwkUkH6nbOiVuZuXa1jjf');

-- --------------------------------------------------------

--
-- Table structure for table `quote_item`
--

CREATE TABLE IF NOT EXISTS `quote_item` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Item Id',
  `quote_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Quote Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `parent_item_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Item Id',
  `is_virtual` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Virtual',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `applied_rule_ids` text COMMENT 'Applied Rule Ids',
  `additional_data` text COMMENT 'Additional Data',
  `is_qty_decimal` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Qty Decimal',
  `no_discount` smallint(5) unsigned DEFAULT '0' COMMENT 'No Discount',
  `weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Weight',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Price',
  `custom_price` decimal(12,4) DEFAULT NULL COMMENT 'Custom Price',
  `discount_percent` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Percent',
  `discount_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Amount',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Discount Amount',
  `tax_percent` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Percent',
  `tax_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Amount',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Tax Amount',
  `row_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Row Total',
  `base_row_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Row Total',
  `row_total_with_discount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Row Total With Discount',
  `row_weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Row Weight',
  `product_type` varchar(255) DEFAULT NULL COMMENT 'Product Type',
  `base_tax_before_discount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Before Discount',
  `tax_before_discount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Before Discount',
  `original_custom_price` decimal(12,4) DEFAULT NULL COMMENT 'Original Custom Price',
  `redirect_url` varchar(255) DEFAULT NULL COMMENT 'Redirect Url',
  `base_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Cost',
  `price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  `free_shipping` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Free Shipping',
  `weee_tax_applied` text COMMENT 'Weee Tax Applied',
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Amount',
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Row Amount',
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Disposition',
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Row Disposition',
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Amount',
  `base_weee_tax_applied_row_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Row Amnt',
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Disposition',
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Row Disposition',
  PRIMARY KEY (`item_id`),
  KEY `QUOTE_ITEM_PARENT_ITEM_ID` (`parent_item_id`),
  KEY `QUOTE_ITEM_PRODUCT_ID` (`product_id`),
  KEY `QUOTE_ITEM_QUOTE_ID` (`quote_id`),
  KEY `QUOTE_ITEM_STORE_ID` (`store_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Item' AUTO_INCREMENT=5 ;

--
-- Dumping data for table `quote_item`
--

INSERT INTO `quote_item` (`item_id`, `quote_id`, `created_at`, `updated_at`, `product_id`, `store_id`, `parent_item_id`, `is_virtual`, `sku`, `name`, `description`, `applied_rule_ids`, `additional_data`, `is_qty_decimal`, `no_discount`, `weight`, `qty`, `price`, `base_price`, `custom_price`, `discount_percent`, `discount_amount`, `base_discount_amount`, `tax_percent`, `tax_amount`, `base_tax_amount`, `row_total`, `base_row_total`, `row_total_with_discount`, `row_weight`, `product_type`, `base_tax_before_discount`, `tax_before_discount`, `original_custom_price`, `redirect_url`, `base_cost`, `price_incl_tax`, `base_price_incl_tax`, `row_total_incl_tax`, `base_row_total_incl_tax`, `discount_tax_compensation_amount`, `base_discount_tax_compensation_amount`, `gift_message_id`, `free_shipping`, `weee_tax_applied`, `weee_tax_applied_amount`, `weee_tax_applied_row_amount`, `weee_tax_disposition`, `weee_tax_row_disposition`, `base_weee_tax_applied_amount`, `base_weee_tax_applied_row_amnt`, `base_weee_tax_disposition`, `base_weee_tax_row_disposition`) VALUES
(1, 1, '2018-12-25 18:53:59', '0000-00-00 00:00:00', 19, 1, NULL, 0, 'Grandee ® NXT-Ice Gray-Monterey Gray', 'Grandee <sup>®</sup> NXT', NULL, NULL, NULL, 0, 0, 1.0000, 1.0000, 10.0000, 10.0000, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 10.0000, 10.0000, 0.0000, 1.0000, 'configurable', NULL, NULL, NULL, NULL, NULL, 10.0000, 10.0000, 10.0000, 10.0000, 0.0000, 0.0000, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 1, '2018-12-25 18:53:59', '0000-00-00 00:00:00', 8, 1, 1, 0, 'Grandee ® NXT-Ice Gray-Monterey Gray', 'Grandee <sup>®</sup> NXT-Ice Gray-Monterey Gray', NULL, NULL, NULL, 0, 0, 1.0000, 1.0000, 0.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'simple', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 1, '2018-12-25 19:04:22', '0000-00-00 00:00:00', 19, 1, NULL, 0, 'Grandee ® NXT-Crème-Mocha', 'Grandee <sup>®</sup> NXT', NULL, NULL, NULL, 0, 0, 1.0000, 1.0000, 10.0000, 10.0000, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 10.0000, 10.0000, 0.0000, 1.0000, 'configurable', NULL, NULL, NULL, NULL, NULL, 10.0000, 10.0000, 10.0000, 10.0000, 0.0000, 0.0000, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 1, '2018-12-25 19:04:22', '0000-00-00 00:00:00', 10, 1, 3, 0, 'Grandee ® NXT-Crème-Mocha', 'Grandee <sup>®</sup> NXT-Crème-Mocha', NULL, NULL, NULL, 0, 0, 1.0000, 1.0000, 0.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'simple', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `quote_item_option`
--

CREATE TABLE IF NOT EXISTS `quote_item_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Id',
  `item_id` int(10) unsigned NOT NULL COMMENT 'Item Id',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `value` text COMMENT 'Value',
  PRIMARY KEY (`option_id`),
  KEY `QUOTE_ITEM_OPTION_ITEM_ID` (`item_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Item Option' AUTO_INCREMENT=13 ;

--
-- Dumping data for table `quote_item_option`
--

INSERT INTO `quote_item_option` (`option_id`, `item_id`, `product_id`, `code`, `value`) VALUES
(1, 1, 19, 'info_buyRequest', '{"uenc":"aHR0cDovL3lvZ2FsaWZlb25saW5lLmNvbS9ncmFuZGVlLXN1cC1yLXN1cC1ueHQuaHRtbA,,","product":"19","selected_configurable_option":"","related_product":"","item":"19","super_attribute":{"143":"16","141":"5"},"qty":"1"}'),
(2, 1, 19, 'attributes', '{"143":"16","141":"5"}'),
(3, 1, 8, 'product_qty_8', '1'),
(4, 1, 8, 'simple_product', '8'),
(5, 2, 8, 'info_buyRequest', '{"uenc":"aHR0cDovL3lvZ2FsaWZlb25saW5lLmNvbS9ncmFuZGVlLXN1cC1yLXN1cC1ueHQuaHRtbA,,","product":"19","selected_configurable_option":"","related_product":"","item":"19","super_attribute":{"143":"16","141":"5"},"qty":"1"}'),
(6, 2, 8, 'parent_product_id', '19'),
(7, 3, 19, 'info_buyRequest', '{"uenc":"aHR0cDovL3lvZ2FsaWZlb25saW5lLmNvbS9ncmFuZGVlLXN1cC1yLXN1cC1ueHQuaHRtbA,,","product":"19","selected_configurable_option":"","related_product":"","item":"19","super_attribute":{"143":"13","141":"4"},"qty":"1"}'),
(8, 3, 19, 'attributes', '{"143":"13","141":"4"}'),
(9, 3, 10, 'product_qty_10', '1'),
(10, 3, 10, 'simple_product', '10'),
(11, 4, 10, 'info_buyRequest', '{"uenc":"aHR0cDovL3lvZ2FsaWZlb25saW5lLmNvbS9ncmFuZGVlLXN1cC1yLXN1cC1ueHQuaHRtbA,,","product":"19","selected_configurable_option":"","related_product":"","item":"19","super_attribute":{"143":"13","141":"4"},"qty":"1"}'),
(12, 4, 10, 'parent_product_id', '19');

-- --------------------------------------------------------

--
-- Table structure for table `quote_payment`
--

CREATE TABLE IF NOT EXISTS `quote_payment` (
  `payment_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Payment Id',
  `quote_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Quote Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `method` varchar(255) DEFAULT NULL COMMENT 'Method',
  `cc_type` varchar(255) DEFAULT NULL COMMENT 'Cc Type',
  `cc_number_enc` varchar(255) DEFAULT NULL COMMENT 'Cc Number Enc',
  `cc_last_4` varchar(255) DEFAULT NULL COMMENT 'Cc Last 4',
  `cc_cid_enc` varchar(255) DEFAULT NULL COMMENT 'Cc Cid Enc',
  `cc_owner` varchar(255) DEFAULT NULL COMMENT 'Cc Owner',
  `cc_exp_month` varchar(255) DEFAULT NULL COMMENT 'Cc Exp Month',
  `cc_exp_year` smallint(5) unsigned DEFAULT '0' COMMENT 'Cc Exp Year',
  `cc_ss_owner` varchar(255) DEFAULT NULL COMMENT 'Cc Ss Owner',
  `cc_ss_start_month` smallint(5) unsigned DEFAULT '0' COMMENT 'Cc Ss Start Month',
  `cc_ss_start_year` smallint(5) unsigned DEFAULT '0' COMMENT 'Cc Ss Start Year',
  `po_number` varchar(255) DEFAULT NULL COMMENT 'Po Number',
  `additional_data` text COMMENT 'Additional Data',
  `cc_ss_issue` varchar(255) DEFAULT NULL COMMENT 'Cc Ss Issue',
  `additional_information` text COMMENT 'Additional Information',
  `paypal_payer_id` varchar(255) DEFAULT NULL COMMENT 'Paypal Payer Id',
  `paypal_payer_status` varchar(255) DEFAULT NULL COMMENT 'Paypal Payer Status',
  `paypal_correlation_id` varchar(255) DEFAULT NULL COMMENT 'Paypal Correlation Id',
  PRIMARY KEY (`payment_id`),
  KEY `QUOTE_PAYMENT_QUOTE_ID` (`quote_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Payment' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `quote_shipping_rate`
--

CREATE TABLE IF NOT EXISTS `quote_shipping_rate` (
  `rate_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rate Id',
  `address_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Address Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `carrier` varchar(255) DEFAULT NULL COMMENT 'Carrier',
  `carrier_title` varchar(255) DEFAULT NULL COMMENT 'Carrier Title',
  `code` varchar(255) DEFAULT NULL COMMENT 'Code',
  `method` varchar(255) DEFAULT NULL COMMENT 'Method',
  `method_description` text COMMENT 'Method Description',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `error_message` text COMMENT 'Error Message',
  `method_title` text COMMENT 'Method Title',
  PRIMARY KEY (`rate_id`),
  KEY `QUOTE_SHIPPING_RATE_ADDRESS_ID` (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Shipping Rate' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE IF NOT EXISTS `rating` (
  `rating_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rating Id',
  `entity_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `rating_code` varchar(64) NOT NULL COMMENT 'Rating Code',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Position On Storefront',
  `is_active` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Rating is active.',
  PRIMARY KEY (`rating_id`),
  UNIQUE KEY `RATING_RATING_CODE` (`rating_code`),
  KEY `RATING_ENTITY_ID` (`entity_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Ratings' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`rating_id`, `entity_id`, `rating_code`, `position`, `is_active`) VALUES
(1, 1, 'Quality', 0, 1),
(2, 1, 'Value', 0, 1),
(3, 1, 'Price', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `rating_entity`
--

CREATE TABLE IF NOT EXISTS `rating_entity` (
  `entity_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `entity_code` varchar(64) NOT NULL COMMENT 'Entity Code',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `RATING_ENTITY_ENTITY_CODE` (`entity_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Rating entities' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `rating_entity`
--

INSERT INTO `rating_entity` (`entity_id`, `entity_code`) VALUES
(1, 'product'),
(2, 'product_review'),
(3, 'review');

-- --------------------------------------------------------

--
-- Table structure for table `rating_option`
--

CREATE TABLE IF NOT EXISTS `rating_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rating Option Id',
  `rating_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Id',
  `code` varchar(32) NOT NULL COMMENT 'Rating Option Code',
  `value` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Option Value',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Ration option position on Storefront',
  PRIMARY KEY (`option_id`),
  KEY `RATING_OPTION_RATING_ID` (`rating_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Rating options' AUTO_INCREMENT=16 ;

--
-- Dumping data for table `rating_option`
--

INSERT INTO `rating_option` (`option_id`, `rating_id`, `code`, `value`, `position`) VALUES
(1, 1, '1', 1, 1),
(2, 1, '2', 2, 2),
(3, 1, '3', 3, 3),
(4, 1, '4', 4, 4),
(5, 1, '5', 5, 5),
(6, 2, '1', 1, 1),
(7, 2, '2', 2, 2),
(8, 2, '3', 3, 3),
(9, 2, '4', 4, 4),
(10, 2, '5', 5, 5),
(11, 3, '1', 1, 1),
(12, 3, '2', 2, 2),
(13, 3, '3', 3, 3),
(14, 3, '4', 4, 4),
(15, 3, '5', 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `rating_option_vote`
--

CREATE TABLE IF NOT EXISTS `rating_option_vote` (
  `vote_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Vote id',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Vote option id',
  `remote_ip` varchar(16) NOT NULL COMMENT 'Customer IP',
  `remote_ip_long` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Customer IP converted to long integer format',
  `customer_id` int(10) unsigned DEFAULT '0' COMMENT 'Customer Id',
  `entity_pk_value` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Product id',
  `rating_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating id',
  `review_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Review id',
  `percent` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Percent amount',
  `value` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Vote option value',
  PRIMARY KEY (`vote_id`),
  KEY `RATING_OPTION_VOTE_REVIEW_ID_REVIEW_REVIEW_ID` (`review_id`),
  KEY `RATING_OPTION_VOTE_OPTION_ID` (`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rating option values' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rating_option_vote_aggregated`
--

CREATE TABLE IF NOT EXISTS `rating_option_vote_aggregated` (
  `primary_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Vote aggregation id',
  `rating_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating id',
  `entity_pk_value` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Product id',
  `vote_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Vote dty',
  `vote_value_sum` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'General vote sum',
  `percent` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Vote percent',
  `percent_approved` smallint(6) DEFAULT '0' COMMENT 'Vote percent approved by admin',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  PRIMARY KEY (`primary_id`),
  KEY `RATING_OPTION_VOTE_AGGREGATED_RATING_ID` (`rating_id`),
  KEY `RATING_OPTION_VOTE_AGGREGATED_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rating vote aggregated' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rating_store`
--

CREATE TABLE IF NOT EXISTS `rating_store` (
  `rating_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store id',
  PRIMARY KEY (`rating_id`,`store_id`),
  KEY `RATING_STORE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rating Store';

-- --------------------------------------------------------

--
-- Table structure for table `rating_title`
--

CREATE TABLE IF NOT EXISTS `rating_title` (
  `rating_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `value` varchar(255) NOT NULL COMMENT 'Rating Label',
  PRIMARY KEY (`rating_id`,`store_id`),
  KEY `RATING_TITLE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rating Title';

-- --------------------------------------------------------

--
-- Table structure for table `release_notification_viewer_log`
--

CREATE TABLE IF NOT EXISTS `release_notification_viewer_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Log ID',
  `viewer_id` int(10) unsigned NOT NULL COMMENT 'Viewer admin user ID',
  `last_view_version` varchar(16) NOT NULL COMMENT 'Viewer last view on product version',
  PRIMARY KEY (`id`),
  UNIQUE KEY `RELEASE_NOTIFICATION_VIEWER_LOG_VIEWER_ID` (`viewer_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Release Notification Viewer Log Table' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `release_notification_viewer_log`
--

INSERT INTO `release_notification_viewer_log` (`id`, `viewer_id`, `last_view_version`) VALUES
(1, 1, '2.3.0');

-- --------------------------------------------------------

--
-- Table structure for table `reporting_counts`
--

CREATE TABLE IF NOT EXISTS `reporting_counts` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `type` varchar(255) DEFAULT NULL COMMENT 'Item Reported',
  `count` int(10) unsigned DEFAULT NULL COMMENT 'Count Value',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Reporting for all count related events generated via the cron job' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `reporting_module_status`
--

CREATE TABLE IF NOT EXISTS `reporting_module_status` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Module Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Module Name',
  `active` varchar(255) DEFAULT NULL COMMENT 'Module Active Status',
  `setup_version` varchar(255) DEFAULT NULL COMMENT 'Module Version',
  `state` varchar(255) DEFAULT NULL COMMENT 'Module State',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Module Status Table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `reporting_orders`
--

CREATE TABLE IF NOT EXISTS `reporting_orders` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `total` decimal(10,0) unsigned DEFAULT NULL,
  `total_base` decimal(10,0) unsigned DEFAULT NULL,
  `item_count` int(10) unsigned NOT NULL COMMENT 'Line Item Count',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Reporting for all orders' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `reporting_system_updates`
--

CREATE TABLE IF NOT EXISTS `reporting_system_updates` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `type` varchar(255) DEFAULT NULL COMMENT 'Update Type',
  `action` varchar(255) DEFAULT NULL COMMENT 'Action Performed',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Reporting for system updates' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `reporting_users`
--

CREATE TABLE IF NOT EXISTS `reporting_users` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `type` varchar(255) DEFAULT NULL COMMENT 'User Type',
  `action` varchar(255) DEFAULT NULL COMMENT 'Action Performed',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Reporting for user actions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `report_compared_product_index`
--

CREATE TABLE IF NOT EXISTS `report_compared_product_index` (
  `index_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Index Id',
  `visitor_id` int(10) unsigned DEFAULT NULL COMMENT 'Visitor Id',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `added_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Added At',
  PRIMARY KEY (`index_id`),
  UNIQUE KEY `REPORT_COMPARED_PRODUCT_INDEX_VISITOR_ID_PRODUCT_ID` (`visitor_id`,`product_id`),
  UNIQUE KEY `REPORT_COMPARED_PRODUCT_INDEX_CUSTOMER_ID_PRODUCT_ID` (`customer_id`,`product_id`),
  KEY `REPORT_COMPARED_PRODUCT_INDEX_STORE_ID` (`store_id`),
  KEY `REPORT_COMPARED_PRODUCT_INDEX_ADDED_AT` (`added_at`),
  KEY `REPORT_COMPARED_PRODUCT_INDEX_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Reports Compared Product Index Table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `report_event`
--

CREATE TABLE IF NOT EXISTS `report_event` (
  `event_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Event Id',
  `logged_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Logged At',
  `event_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Event Type Id',
  `object_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Object Id',
  `subject_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Subject Id',
  `subtype` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Subtype',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  PRIMARY KEY (`event_id`),
  KEY `REPORT_EVENT_EVENT_TYPE_ID` (`event_type_id`),
  KEY `REPORT_EVENT_SUBJECT_ID` (`subject_id`),
  KEY `REPORT_EVENT_OBJECT_ID` (`object_id`),
  KEY `REPORT_EVENT_SUBTYPE` (`subtype`),
  KEY `REPORT_EVENT_STORE_ID` (`store_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Reports Event Table' AUTO_INCREMENT=769 ;

--
-- Dumping data for table `report_event`
--

INSERT INTO `report_event` (`event_id`, `logged_at`, `event_type_id`, `object_id`, `subject_id`, `subtype`, `store_id`) VALUES
(1, '2018-12-19 14:47:28', 1, 19, 0, 1, 1),
(2, '2018-12-19 14:49:55', 1, 19, 0, 1, 1),
(3, '2018-12-19 15:24:21', 1, 19, 0, 1, 1),
(4, '2018-12-19 15:27:28', 1, 19, 0, 1, 1),
(5, '2018-12-19 15:29:54', 1, 19, 0, 1, 1),
(6, '2018-12-19 15:34:08', 1, 19, 0, 1, 1),
(7, '2018-12-19 15:34:09', 1, 19, 0, 1, 1),
(8, '2018-12-19 15:35:34', 1, 19, 0, 1, 1),
(9, '2018-12-19 15:36:25', 1, 19, 0, 1, 1),
(10, '2018-12-19 15:36:27', 1, 19, 0, 1, 1),
(11, '2018-12-19 15:43:09', 1, 19, 0, 1, 1),
(12, '2018-12-19 15:43:11', 1, 19, 0, 1, 1),
(13, '2018-12-19 15:46:16', 1, 19, 0, 1, 1),
(14, '2018-12-19 15:50:30', 1, 19, 0, 1, 1),
(15, '2018-12-19 15:50:31', 1, 19, 0, 1, 1),
(16, '2018-12-19 15:51:32', 1, 19, 0, 1, 1),
(17, '2018-12-19 15:56:01', 1, 19, 0, 1, 1),
(18, '2018-12-19 15:57:25', 1, 19, 0, 1, 1),
(19, '2018-12-19 16:00:17', 1, 19, 0, 1, 1),
(20, '2018-12-19 16:02:31', 1, 19, 0, 1, 1),
(21, '2018-12-19 16:06:07', 1, 19, 0, 1, 1),
(22, '2018-12-19 16:09:30', 1, 19, 0, 1, 1),
(23, '2018-12-19 16:10:39', 1, 19, 0, 1, 1),
(24, '2018-12-19 16:11:58', 1, 19, 0, 1, 1),
(25, '2018-12-19 16:12:00', 1, 19, 0, 1, 1),
(26, '2018-12-19 16:13:10', 1, 19, 0, 1, 1),
(27, '2018-12-19 16:18:38', 1, 19, 0, 1, 1),
(28, '2018-12-19 16:32:07', 1, 19, 0, 1, 1),
(29, '2018-12-19 16:34:02', 1, 19, 0, 1, 1),
(30, '2018-12-19 16:34:48', 1, 19, 0, 1, 1),
(31, '2018-12-19 16:35:14', 1, 19, 0, 1, 1),
(32, '2018-12-19 17:11:46', 1, 19, 0, 1, 1),
(33, '2018-12-19 17:15:51', 1, 19, 0, 1, 1),
(34, '2018-12-19 17:19:04', 1, 19, 0, 1, 1),
(35, '2018-12-19 17:23:50', 1, 19, 0, 1, 1),
(36, '2018-12-19 17:24:49', 1, 19, 0, 1, 1),
(37, '2018-12-19 17:26:12', 1, 19, 0, 1, 1),
(38, '2018-12-19 17:26:51', 1, 19, 0, 1, 1),
(39, '2018-12-19 17:28:09', 1, 19, 0, 1, 1),
(40, '2018-12-19 17:28:16', 1, 19, 0, 1, 1),
(41, '2018-12-19 17:43:17', 1, 19, 0, 1, 1),
(42, '2018-12-19 17:43:18', 1, 19, 0, 1, 1),
(43, '2018-12-19 17:45:00', 1, 19, 0, 1, 1),
(44, '2018-12-19 17:48:39', 1, 19, 0, 1, 1),
(45, '2018-12-19 17:48:40', 1, 19, 0, 1, 1),
(46, '2018-12-19 17:49:20', 1, 19, 0, 1, 1),
(47, '2018-12-19 17:49:21', 1, 19, 0, 1, 1),
(48, '2018-12-19 17:50:29', 1, 19, 0, 1, 1),
(49, '2018-12-19 17:51:23', 1, 19, 0, 1, 1),
(50, '2018-12-19 17:54:53', 1, 19, 0, 1, 1),
(51, '2018-12-19 17:55:22', 1, 19, 0, 1, 1),
(52, '2018-12-19 17:55:25', 1, 19, 0, 1, 1),
(53, '2018-12-19 17:58:35', 1, 19, 0, 1, 1),
(54, '2018-12-19 18:00:11', 1, 19, 0, 1, 1),
(55, '2018-12-19 18:10:35', 1, 19, 0, 1, 1),
(56, '2018-12-19 18:19:22', 1, 19, 0, 1, 1),
(57, '2018-12-19 18:29:52', 1, 19, 0, 1, 1),
(58, '2018-12-19 19:20:21', 1, 19, 0, 1, 1),
(59, '2018-12-19 19:21:25', 1, 19, 0, 1, 1),
(60, '2018-12-19 19:22:42', 1, 19, 0, 1, 1),
(61, '2018-12-19 19:22:44', 1, 19, 0, 1, 1),
(62, '2018-12-19 19:26:29', 1, 19, 0, 1, 1),
(63, '2018-12-19 19:27:05', 1, 19, 0, 1, 1),
(64, '2018-12-19 19:27:07', 1, 19, 0, 1, 1),
(65, '2018-12-19 19:29:15', 1, 19, 0, 1, 1),
(66, '2018-12-19 19:32:29', 1, 19, 0, 1, 1),
(67, '2018-12-20 07:38:29', 1, 19, 0, 1, 1),
(68, '2018-12-20 09:00:55', 1, 19, 0, 1, 1),
(69, '2018-12-20 15:05:23', 1, 19, 0, 1, 1),
(70, '2018-12-20 15:05:23', 1, 19, 0, 1, 1),
(71, '2018-12-20 15:08:46', 1, 19, 0, 1, 1),
(72, '2018-12-20 15:08:49', 1, 19, 0, 1, 1),
(73, '2018-12-20 16:27:32', 1, 19, 0, 1, 1),
(74, '2018-12-20 16:27:32', 1, 19, 0, 1, 1),
(75, '2018-12-20 16:29:51', 1, 19, 0, 1, 1),
(76, '2018-12-20 16:29:55', 1, 19, 0, 1, 1),
(77, '2018-12-20 16:31:55', 1, 19, 0, 1, 1),
(78, '2018-12-20 16:31:59', 1, 19, 0, 1, 1),
(79, '2018-12-20 16:38:53', 1, 19, 0, 1, 1),
(80, '2018-12-20 16:42:13', 1, 19, 0, 1, 1),
(81, '2018-12-20 16:42:17', 1, 19, 0, 1, 1),
(82, '2018-12-20 16:44:21', 1, 19, 0, 1, 1),
(83, '2018-12-20 16:44:25', 1, 19, 0, 1, 1),
(84, '2018-12-20 16:46:45', 1, 19, 0, 1, 1),
(85, '2018-12-20 16:46:49', 1, 19, 0, 1, 1),
(86, '2018-12-20 17:16:53', 1, 19, 0, 1, 1),
(87, '2018-12-20 17:17:09', 1, 19, 0, 1, 1),
(88, '2018-12-20 17:19:25', 1, 19, 0, 1, 1),
(89, '2018-12-20 17:20:16', 1, 19, 0, 1, 1),
(90, '2018-12-20 17:21:50', 1, 19, 0, 1, 1),
(91, '2018-12-20 17:23:26', 1, 19, 0, 1, 1),
(92, '2018-12-20 17:53:13', 1, 19, 0, 1, 1),
(93, '2018-12-20 17:54:11', 1, 19, 0, 1, 1),
(94, '2018-12-20 17:54:14', 1, 19, 0, 1, 1),
(95, '2018-12-20 17:55:32', 1, 19, 0, 1, 1),
(96, '2018-12-20 17:55:38', 1, 19, 0, 1, 1),
(97, '2018-12-20 17:55:58', 1, 19, 0, 1, 1),
(98, '2018-12-20 17:56:38', 1, 19, 0, 1, 1),
(99, '2018-12-20 17:56:42', 1, 19, 0, 1, 1),
(100, '2018-12-20 17:57:12', 1, 19, 0, 1, 1),
(101, '2018-12-20 17:58:00', 1, 19, 0, 1, 1),
(102, '2018-12-20 18:05:34', 1, 19, 0, 1, 1),
(103, '2018-12-20 18:08:23', 1, 19, 0, 1, 1),
(104, '2018-12-21 08:12:48', 1, 19, 0, 1, 1),
(105, '2018-12-21 10:31:50', 1, 19, 0, 1, 1),
(106, '2018-12-21 10:31:50', 1, 19, 0, 1, 1),
(107, '2018-12-21 14:27:46', 1, 19, 0, 1, 1),
(108, '2018-12-21 14:27:46', 1, 19, 0, 1, 1),
(109, '2018-12-21 14:30:59', 1, 19, 0, 1, 1),
(110, '2018-12-21 14:31:03', 1, 19, 0, 1, 1),
(111, '2018-12-21 14:36:12', 1, 19, 0, 1, 1),
(112, '2018-12-21 14:36:15', 1, 19, 0, 1, 1),
(113, '2018-12-21 15:16:46', 1, 19, 2, 1, 1),
(114, '2018-12-21 15:16:50', 1, 19, 2, 1, 1),
(115, '2018-12-21 15:19:44', 1, 19, 2, 1, 1),
(116, '2018-12-21 15:19:47', 1, 19, 2, 1, 1),
(117, '2018-12-21 15:22:51', 1, 19, 2, 1, 1),
(118, '2018-12-21 15:22:55', 1, 19, 2, 1, 1),
(119, '2018-12-21 15:42:25', 1, 19, 2, 1, 1),
(120, '2018-12-21 15:43:57', 1, 19, 2, 1, 1),
(121, '2018-12-21 15:44:01', 1, 19, 2, 1, 1),
(122, '2018-12-21 15:54:04', 1, 19, 2, 1, 1),
(123, '2018-12-21 15:56:03', 1, 19, 2, 1, 1),
(124, '2018-12-21 16:00:47', 1, 19, 2, 1, 1),
(125, '2018-12-21 16:00:51', 1, 19, 2, 1, 1),
(126, '2018-12-21 16:07:45', 1, 19, 2, 1, 1),
(127, '2018-12-21 16:07:49', 1, 19, 2, 1, 1),
(128, '2018-12-21 16:20:09', 1, 19, 2, 1, 1),
(129, '2018-12-21 16:28:10', 1, 19, 2, 1, 1),
(130, '2018-12-21 16:28:13', 1, 19, 2, 1, 1),
(131, '2018-12-21 16:31:39', 1, 19, 2, 1, 1),
(132, '2018-12-21 16:32:48', 1, 19, 2, 1, 1),
(133, '2018-12-21 16:40:48', 1, 19, 2, 1, 1),
(134, '2018-12-21 16:40:49', 1, 19, 2, 1, 1),
(135, '2018-12-21 16:41:10', 1, 19, 2, 1, 1),
(136, '2018-12-21 16:42:04', 1, 19, 2, 1, 1),
(137, '2018-12-21 16:43:25', 1, 19, 2, 1, 1),
(138, '2018-12-21 16:48:16', 1, 19, 2, 1, 1),
(139, '2018-12-21 17:00:49', 1, 19, 0, 1, 1),
(140, '2018-12-21 17:28:55', 1, 19, 2, 1, 1),
(141, '2018-12-21 17:29:00', 1, 19, 2, 1, 1),
(142, '2018-12-21 17:35:29', 1, 19, 2, 1, 1),
(143, '2018-12-21 17:35:37', 1, 19, 2, 1, 1),
(144, '2018-12-21 17:38:51', 1, 19, 2, 1, 1),
(145, '2018-12-21 17:38:55', 1, 19, 2, 1, 1),
(146, '2018-12-21 17:41:38', 1, 19, 2, 1, 1),
(147, '2018-12-21 17:42:52', 1, 19, 0, 1, 1),
(148, '2018-12-21 17:43:32', 1, 19, 0, 1, 1),
(149, '2018-12-21 17:46:10', 1, 19, 0, 1, 1),
(150, '2018-12-21 17:56:29', 1, 19, 0, 1, 1),
(151, '2018-12-21 17:56:34', 1, 19, 0, 1, 1),
(152, '2018-12-21 18:01:46', 1, 19, 0, 1, 1),
(153, '2018-12-21 18:01:50', 1, 19, 0, 1, 1),
(154, '2018-12-21 18:01:51', 1, 19, 0, 1, 1),
(155, '2018-12-21 18:01:55', 1, 19, 0, 1, 1),
(156, '2018-12-21 18:01:59', 1, 19, 0, 1, 1),
(157, '2018-12-21 18:04:07', 1, 19, 0, 1, 1),
(158, '2018-12-21 18:25:10', 1, 19, 0, 1, 1),
(159, '2018-12-21 18:35:09', 1, 19, 0, 1, 1),
(160, '2018-12-21 18:38:45', 1, 19, 0, 1, 1),
(161, '2018-12-21 18:41:15', 1, 19, 0, 1, 1),
(162, '2018-12-21 18:56:37', 1, 19, 0, 1, 1),
(163, '2018-12-21 19:00:46', 1, 19, 0, 1, 1),
(164, '2018-12-21 19:17:45', 1, 19, 0, 1, 1),
(165, '2018-12-21 19:20:31', 1, 19, 0, 1, 1),
(166, '2018-12-21 19:20:32', 1, 19, 0, 1, 1),
(167, '2018-12-21 19:20:35', 1, 19, 0, 1, 1),
(168, '2018-12-21 19:25:05', 1, 19, 0, 1, 1),
(169, '2018-12-21 19:34:31', 1, 19, 0, 1, 1),
(170, '2018-12-21 19:36:34', 1, 19, 0, 1, 1),
(171, '2018-12-21 19:43:31', 1, 19, 0, 1, 1),
(172, '2018-12-21 19:48:24', 1, 19, 0, 1, 1),
(173, '2018-12-21 19:49:23', 1, 19, 3, 1, 1),
(174, '2018-12-21 19:51:12', 1, 19, 3, 1, 1),
(175, '2018-12-21 19:51:16', 1, 19, 3, 1, 1),
(176, '2018-12-21 19:52:11', 1, 19, 0, 1, 1),
(177, '2018-12-21 19:52:14', 1, 19, 0, 1, 1),
(178, '2018-12-21 19:53:44', 1, 19, 0, 1, 1),
(179, '2018-12-21 19:53:48', 1, 19, 0, 1, 1),
(180, '2018-12-21 19:55:20', 1, 19, 0, 1, 1),
(181, '2018-12-21 19:55:23', 1, 19, 0, 1, 1),
(182, '2018-12-21 19:57:49', 1, 19, 0, 1, 1),
(183, '2018-12-21 19:58:14', 1, 19, 3, 1, 1),
(184, '2018-12-21 20:00:09', 1, 19, 3, 1, 1),
(185, '2018-12-21 20:00:15', 1, 19, 0, 1, 1),
(186, '2018-12-22 01:39:20', 1, 19, 0, 1, 1),
(187, '2018-12-22 01:40:51', 1, 19, 4, 1, 1),
(188, '2018-12-22 01:41:30', 1, 19, 4, 1, 1),
(189, '2018-12-22 01:50:18', 1, 19, 4, 1, 1),
(190, '2018-12-23 06:59:55', 1, 19, 0, 1, 1),
(191, '2018-12-23 07:02:59', 1, 19, 0, 1, 1),
(192, '2018-12-23 14:17:07', 1, 19, 0, 1, 1),
(193, '2018-12-23 14:21:10', 1, 19, 0, 1, 1),
(194, '2018-12-24 17:04:00', 1, 19, 0, 1, 1),
(195, '2018-12-24 17:06:23', 1, 19, 0, 1, 1),
(196, '2018-12-24 17:15:34', 1, 19, 0, 1, 1),
(197, '2018-12-24 17:16:58', 1, 19, 0, 1, 1),
(198, '2018-12-24 17:18:26', 1, 19, 0, 1, 1),
(199, '2018-12-24 17:31:20', 1, 19, 0, 1, 1),
(200, '2018-12-24 17:32:17', 1, 19, 0, 1, 1),
(201, '2018-12-24 17:32:49', 1, 19, 0, 1, 1),
(202, '2018-12-24 17:33:08', 1, 19, 0, 1, 1),
(203, '2018-12-24 17:33:19', 1, 19, 0, 1, 1),
(204, '2018-12-24 17:34:36', 1, 19, 0, 1, 1),
(205, '2018-12-24 17:44:14', 1, 19, 0, 1, 1),
(206, '2018-12-24 17:45:21', 1, 19, 0, 1, 1),
(207, '2018-12-24 17:48:39', 1, 19, 0, 1, 1),
(208, '2018-12-24 17:49:27', 1, 19, 0, 1, 1),
(209, '2018-12-24 17:51:22', 1, 19, 0, 1, 1),
(210, '2018-12-24 17:51:23', 1, 19, 0, 1, 1),
(211, '2018-12-24 18:06:12', 1, 19, 0, 1, 1),
(212, '2018-12-24 18:12:52', 1, 19, 0, 1, 1),
(213, '2018-12-24 18:13:25', 1, 19, 0, 1, 1),
(214, '2018-12-24 18:15:10', 1, 19, 0, 1, 1),
(215, '2018-12-24 18:16:49', 1, 19, 0, 1, 1),
(216, '2018-12-24 18:58:25', 1, 19, 0, 1, 1),
(217, '2018-12-25 04:15:19', 1, 19, 0, 1, 1),
(218, '2018-12-25 04:18:42', 1, 19, 0, 1, 1),
(219, '2018-12-25 04:23:52', 1, 19, 0, 1, 1),
(220, '2018-12-25 04:26:17', 1, 19, 5, 1, 1),
(221, '2018-12-25 04:28:08', 1, 19, 5, 1, 1),
(222, '2018-12-25 11:11:27', 1, 20, 0, 1, 1),
(223, '2018-12-25 11:12:34', 1, 22, 0, 1, 1),
(224, '2018-12-25 11:13:30', 1, 21, 0, 1, 1),
(225, '2018-12-25 15:46:48', 1, 19, 0, 1, 1),
(226, '2018-12-25 16:42:18', 1, 19, 0, 1, 1),
(227, '2018-12-25 16:45:36', 1, 19, 0, 1, 1),
(228, '2018-12-25 16:46:14', 1, 19, 0, 1, 1),
(229, '2018-12-25 16:47:57', 1, 19, 0, 1, 1),
(230, '2018-12-25 16:49:38', 1, 19, 0, 1, 1),
(231, '2018-12-25 16:56:56', 1, 19, 0, 1, 1),
(232, '2018-12-25 16:58:30', 1, 19, 0, 1, 1),
(233, '2018-12-25 17:10:55', 1, 19, 0, 1, 1),
(234, '2018-12-25 17:13:41', 1, 19, 0, 1, 1),
(235, '2018-12-25 17:16:12', 1, 19, 0, 1, 1),
(236, '2018-12-25 17:18:45', 1, 19, 0, 1, 1),
(237, '2018-12-25 17:20:07', 1, 19, 0, 1, 1),
(238, '2018-12-25 17:24:44', 1, 19, 0, 1, 1),
(239, '2018-12-25 18:53:13', 1, 19, 0, 1, 1),
(240, '2018-12-25 18:53:59', 4, 19, 6, 1, 1),
(241, '2018-12-25 18:55:47', 1, 19, 6, 1, 1),
(242, '2018-12-25 19:03:00', 1, 19, 6, 1, 1),
(243, '2018-12-25 19:04:22', 4, 19, 6, 1, 1),
(244, '2018-12-26 06:37:43', 1, 19, 0, 1, 1),
(245, '2018-12-26 07:50:30', 1, 21, 0, 1, 1),
(246, '2018-12-26 07:50:39', 1, 22, 0, 1, 1),
(247, '2018-12-26 07:50:48', 1, 20, 0, 1, 1),
(248, '2018-12-26 17:06:15', 1, 19, 0, 1, 1),
(249, '2018-12-26 17:06:54', 1, 19, 0, 1, 1),
(250, '2018-12-27 15:40:09', 1, 20, 0, 1, 1),
(251, '2018-12-27 15:42:59', 1, 19, 0, 1, 1),
(252, '2018-12-27 15:43:06', 1, 19, 0, 1, 1),
(253, '2018-12-27 15:45:39', 1, 22, 0, 1, 1),
(254, '2018-12-27 15:45:45', 1, 22, 0, 1, 1),
(255, '2018-12-27 15:45:53', 1, 22, 0, 1, 1),
(256, '2018-12-27 15:48:01', 1, 23, 0, 1, 1),
(257, '2018-12-27 15:50:50', 1, 19, 0, 1, 1),
(258, '2018-12-27 15:53:37', 1, 19, 0, 1, 1),
(259, '2018-12-27 16:05:53', 1, 19, 0, 1, 1),
(260, '2018-12-27 16:09:29', 1, 19, 0, 1, 1),
(261, '2018-12-27 16:09:41', 1, 19, 0, 1, 1),
(262, '2018-12-27 16:09:54', 1, 19, 0, 1, 1),
(263, '2018-12-27 16:10:13', 1, 19, 0, 1, 1),
(264, '2018-12-27 16:10:17', 1, 19, 0, 1, 1),
(265, '2018-12-27 16:10:28', 1, 19, 0, 1, 1),
(266, '2018-12-27 16:10:35', 1, 19, 0, 1, 1),
(267, '2018-12-27 16:10:37', 1, 19, 0, 1, 1),
(268, '2018-12-27 16:11:38', 1, 19, 0, 1, 1),
(269, '2018-12-27 16:19:01', 1, 19, 0, 1, 1),
(270, '2018-12-27 18:39:45', 1, 19, 0, 1, 1),
(271, '2018-12-27 18:40:28', 1, 19, 0, 1, 1),
(272, '2018-12-27 18:41:31', 1, 19, 0, 1, 1),
(273, '2018-12-27 18:42:37', 1, 19, 0, 1, 1),
(274, '2018-12-27 18:43:43', 1, 19, 0, 1, 1),
(275, '2018-12-27 18:44:28', 1, 23, 0, 1, 1),
(276, '2018-12-27 18:44:39', 1, 19, 0, 1, 1),
(277, '2018-12-27 18:44:47', 1, 19, 0, 1, 1),
(278, '2018-12-27 18:45:50', 1, 19, 0, 1, 1),
(279, '2018-12-27 18:46:54', 1, 19, 0, 1, 1),
(280, '2018-12-27 18:47:57', 1, 19, 0, 1, 1),
(281, '2018-12-27 18:49:01', 1, 19, 0, 1, 1),
(282, '2018-12-27 18:50:05', 1, 19, 0, 1, 1),
(283, '2018-12-27 18:50:12', 1, 19, 0, 1, 1),
(284, '2018-12-27 18:51:15', 1, 19, 0, 1, 1),
(285, '2018-12-27 18:52:18', 1, 19, 0, 1, 1),
(286, '2018-12-27 18:53:20', 1, 19, 0, 1, 1),
(287, '2018-12-27 19:10:57', 1, 19, 0, 1, 1),
(288, '2018-12-27 19:11:01', 1, 19, 0, 1, 1),
(289, '2018-12-27 19:11:05', 1, 19, 0, 1, 1),
(290, '2018-12-27 19:24:07', 1, 19, 0, 1, 1),
(291, '2018-12-27 19:25:14', 1, 19, 0, 1, 1),
(292, '2018-12-27 19:25:18', 1, 19, 0, 1, 1),
(293, '2018-12-27 19:25:22', 1, 19, 0, 1, 1),
(294, '2018-12-27 19:25:26', 1, 19, 0, 1, 1),
(295, '2018-12-27 19:26:15', 1, 19, 0, 1, 1),
(296, '2018-12-27 19:26:19', 1, 19, 0, 1, 1),
(297, '2018-12-27 19:26:22', 1, 19, 0, 1, 1),
(298, '2018-12-27 19:26:25', 1, 19, 0, 1, 1),
(299, '2018-12-27 19:26:28', 1, 19, 0, 1, 1),
(300, '2018-12-27 19:26:31', 1, 19, 0, 1, 1),
(301, '2018-12-27 19:26:35', 1, 19, 0, 1, 1),
(302, '2018-12-27 19:26:39', 1, 19, 0, 1, 1),
(303, '2018-12-27 19:26:42', 1, 19, 0, 1, 1),
(304, '2018-12-27 19:26:46', 1, 19, 0, 1, 1),
(305, '2018-12-27 19:26:50', 1, 19, 0, 1, 1),
(306, '2018-12-27 19:34:13', 1, 19, 0, 1, 1),
(307, '2018-12-27 19:36:29', 1, 19, 0, 1, 1),
(308, '2018-12-27 19:39:25', 1, 19, 0, 1, 1),
(309, '2018-12-27 19:44:10', 1, 19, 0, 1, 1),
(310, '2018-12-27 19:44:10', 1, 19, 0, 1, 1),
(311, '2018-12-27 19:46:57', 1, 20, 0, 1, 1),
(312, '2018-12-27 19:47:21', 1, 19, 0, 1, 1),
(313, '2018-12-27 19:47:47', 1, 19, 0, 1, 1),
(314, '2018-12-27 19:47:56', 1, 19, 0, 1, 1),
(315, '2018-12-27 22:06:14', 1, 19, 0, 1, 1),
(316, '2018-12-27 22:06:23', 1, 19, 0, 1, 1),
(317, '2018-12-27 22:10:02', 1, 19, 0, 1, 1),
(318, '2018-12-28 00:51:18', 1, 19, 0, 1, 1),
(319, '2018-12-28 08:24:10', 1, 19, 0, 1, 1),
(320, '2018-12-28 08:25:08', 1, 19, 0, 1, 1),
(321, '2018-12-28 08:25:12', 1, 19, 0, 1, 1),
(322, '2018-12-28 09:40:05', 1, 23, 0, 1, 1),
(323, '2018-12-28 13:04:13', 1, 23, 0, 1, 1),
(324, '2018-12-28 13:04:13', 1, 23, 0, 1, 1),
(325, '2018-12-28 13:17:43', 1, 23, 0, 1, 1),
(326, '2018-12-28 13:21:41', 1, 23, 0, 1, 1),
(327, '2018-12-28 13:32:10', 1, 23, 0, 1, 1),
(328, '2018-12-28 13:51:56', 1, 23, 0, 1, 1),
(329, '2018-12-28 14:12:02', 1, 23, 0, 1, 1),
(330, '2018-12-28 14:15:35', 1, 23, 0, 1, 1),
(331, '2018-12-28 15:32:05', 1, 20, 0, 1, 1),
(332, '2018-12-28 15:32:12', 1, 21, 0, 1, 1),
(333, '2018-12-28 15:35:37', 1, 22, 0, 1, 1),
(334, '2018-12-28 15:58:58', 1, 23, 0, 1, 1),
(335, '2018-12-28 15:58:59', 1, 23, 0, 1, 1),
(336, '2018-12-28 16:05:50', 1, 23, 0, 1, 1),
(337, '2018-12-28 16:07:14', 1, 23, 0, 1, 1),
(338, '2018-12-28 16:16:24', 1, 19, 0, 1, 1),
(339, '2018-12-28 16:23:29', 1, 19, 0, 1, 1),
(340, '2018-12-28 16:23:30', 1, 19, 0, 1, 1),
(341, '2018-12-28 16:24:30', 1, 19, 0, 1, 1),
(342, '2018-12-28 16:27:46', 1, 19, 0, 1, 1),
(343, '2018-12-28 16:28:18', 1, 19, 0, 1, 1),
(344, '2018-12-28 16:28:35', 1, 19, 0, 1, 1),
(345, '2018-12-28 16:32:19', 1, 19, 0, 1, 1),
(346, '2018-12-28 16:32:22', 1, 19, 0, 1, 1),
(347, '2018-12-28 16:32:26', 1, 19, 0, 1, 1),
(348, '2018-12-28 16:32:30', 1, 19, 0, 1, 1),
(349, '2018-12-28 16:32:34', 1, 19, 0, 1, 1),
(350, '2018-12-28 16:32:38', 1, 19, 0, 1, 1),
(351, '2018-12-28 16:32:42', 1, 19, 0, 1, 1),
(352, '2018-12-28 16:33:21', 1, 19, 0, 1, 1),
(353, '2018-12-28 16:33:32', 1, 19, 0, 1, 1),
(354, '2018-12-28 16:37:00', 1, 19, 0, 1, 1),
(355, '2018-12-28 16:37:03', 1, 19, 0, 1, 1),
(356, '2018-12-28 16:37:04', 1, 19, 0, 1, 1),
(357, '2018-12-28 16:37:06', 1, 19, 0, 1, 1),
(358, '2018-12-28 16:39:44', 1, 19, 0, 1, 1),
(359, '2018-12-28 16:40:13', 1, 19, 0, 1, 1),
(360, '2018-12-28 16:40:17', 1, 19, 0, 1, 1),
(361, '2018-12-28 16:43:24', 1, 19, 0, 1, 1),
(362, '2018-12-28 16:44:36', 1, 19, 0, 1, 1),
(363, '2018-12-28 16:44:46', 1, 19, 0, 1, 1),
(364, '2018-12-28 16:44:48', 1, 19, 0, 1, 1),
(365, '2018-12-28 16:44:49', 1, 19, 0, 1, 1),
(366, '2018-12-28 16:50:33', 1, 19, 0, 1, 1),
(367, '2018-12-28 16:59:37', 1, 19, 0, 1, 1),
(368, '2018-12-28 17:00:24', 1, 19, 0, 1, 1),
(369, '2018-12-28 17:04:47', 1, 19, 0, 1, 1),
(370, '2018-12-28 17:06:31', 1, 19, 0, 1, 1),
(371, '2018-12-28 17:07:00', 1, 19, 0, 1, 1),
(372, '2018-12-28 17:07:44', 1, 19, 0, 1, 1),
(373, '2018-12-28 17:10:22', 1, 19, 0, 1, 1),
(374, '2018-12-28 17:11:45', 1, 19, 0, 1, 1),
(375, '2018-12-28 17:14:21', 1, 19, 0, 1, 1),
(376, '2018-12-28 17:14:53', 1, 19, 0, 1, 1),
(377, '2018-12-28 17:16:09', 1, 19, 0, 1, 1),
(378, '2018-12-28 17:16:10', 1, 19, 0, 1, 1),
(379, '2018-12-28 17:16:11', 1, 19, 0, 1, 1),
(380, '2018-12-28 17:18:40', 1, 23, 0, 1, 1),
(381, '2018-12-28 17:18:42', 1, 23, 0, 1, 1),
(382, '2018-12-28 17:22:59', 1, 19, 0, 1, 1),
(383, '2018-12-28 17:24:14', 1, 19, 0, 1, 1),
(384, '2018-12-28 17:24:31', 1, 19, 0, 1, 1),
(385, '2018-12-28 17:24:36', 1, 19, 0, 1, 1),
(386, '2018-12-28 17:25:07', 1, 19, 0, 1, 1),
(387, '2018-12-28 17:26:33', 1, 19, 0, 1, 1),
(388, '2018-12-28 17:26:35', 1, 19, 0, 1, 1),
(389, '2018-12-28 17:26:36', 1, 19, 0, 1, 1),
(390, '2018-12-28 17:26:38', 1, 19, 0, 1, 1),
(391, '2018-12-28 17:27:20', 1, 19, 0, 1, 1),
(392, '2018-12-28 17:28:07', 1, 19, 0, 1, 1),
(393, '2018-12-28 17:29:23', 1, 19, 0, 1, 1),
(394, '2018-12-28 17:31:02', 1, 19, 0, 1, 1),
(395, '2018-12-28 17:31:49', 1, 19, 0, 1, 1),
(396, '2018-12-28 17:33:23', 1, 19, 0, 1, 1),
(397, '2018-12-28 17:36:42', 1, 19, 0, 1, 1),
(398, '2018-12-28 17:36:44', 1, 19, 0, 1, 1),
(399, '2018-12-28 17:36:45', 1, 19, 0, 1, 1),
(400, '2018-12-28 17:36:47', 1, 19, 0, 1, 1),
(401, '2018-12-28 17:36:48', 1, 19, 0, 1, 1),
(402, '2018-12-28 17:36:50', 1, 19, 0, 1, 1),
(403, '2018-12-28 17:44:12', 1, 19, 0, 1, 1),
(404, '2018-12-28 17:44:28', 1, 19, 0, 1, 1),
(405, '2018-12-28 17:44:43', 1, 19, 0, 1, 1),
(406, '2018-12-28 17:45:03', 1, 19, 0, 1, 1),
(407, '2018-12-28 17:45:47', 1, 19, 0, 1, 1),
(408, '2018-12-28 17:46:32', 1, 19, 0, 1, 1),
(409, '2018-12-28 17:46:33', 1, 19, 0, 1, 1),
(410, '2018-12-28 17:48:34', 1, 19, 0, 1, 1),
(411, '2018-12-28 17:48:49', 1, 19, 0, 1, 1),
(412, '2018-12-28 17:49:36', 1, 19, 0, 1, 1),
(413, '2018-12-28 17:50:36', 1, 19, 0, 1, 1),
(414, '2018-12-28 17:52:20', 1, 19, 0, 1, 1),
(415, '2018-12-28 17:52:23', 1, 19, 0, 1, 1),
(416, '2018-12-28 18:21:49', 1, 19, 0, 1, 1),
(417, '2018-12-28 18:30:17', 1, 19, 0, 1, 1),
(418, '2018-12-28 18:35:26', 1, 19, 0, 1, 1),
(419, '2018-12-28 18:38:24', 1, 19, 0, 1, 1),
(420, '2018-12-28 18:40:47', 1, 19, 0, 1, 1),
(421, '2018-12-28 18:53:03', 1, 19, 0, 1, 1),
(422, '2018-12-28 18:56:10', 1, 19, 0, 1, 1),
(423, '2018-12-28 18:56:11', 1, 19, 0, 1, 1),
(424, '2018-12-28 18:56:13', 1, 19, 0, 1, 1),
(425, '2018-12-28 18:56:13', 1, 19, 0, 1, 1),
(426, '2018-12-28 19:00:18', 1, 19, 0, 1, 1),
(427, '2018-12-28 19:00:57', 1, 19, 0, 1, 1),
(428, '2018-12-28 19:02:47', 1, 19, 0, 1, 1),
(429, '2018-12-28 19:04:47', 1, 19, 0, 1, 1),
(430, '2018-12-28 19:08:12', 1, 19, 0, 1, 1),
(431, '2018-12-28 19:11:37', 1, 19, 0, 1, 1),
(432, '2018-12-28 19:13:14', 1, 19, 0, 1, 1),
(433, '2018-12-28 19:15:11', 1, 19, 0, 1, 1),
(434, '2018-12-28 19:20:14', 1, 19, 0, 1, 1),
(435, '2018-12-28 19:23:15', 1, 19, 0, 1, 1),
(436, '2018-12-28 19:24:16', 1, 19, 0, 1, 1),
(437, '2018-12-28 19:25:34', 1, 19, 0, 1, 1),
(438, '2018-12-28 19:26:36', 1, 19, 0, 1, 1),
(439, '2018-12-29 05:40:59', 1, 19, 0, 1, 1),
(440, '2018-12-29 05:53:44', 1, 19, 0, 1, 1),
(441, '2018-12-29 05:54:38', 1, 19, 0, 1, 1),
(442, '2018-12-29 06:05:20', 1, 19, 0, 1, 1),
(443, '2018-12-29 06:09:12', 1, 19, 0, 1, 1),
(444, '2018-12-29 06:10:26', 1, 19, 0, 1, 1),
(445, '2018-12-29 06:11:15', 1, 19, 0, 1, 1),
(446, '2018-12-29 06:14:17', 1, 22, 0, 1, 1),
(447, '2018-12-29 06:14:45', 1, 19, 0, 1, 1),
(448, '2018-12-29 14:21:30', 1, 19, 0, 1, 1),
(449, '2018-12-29 14:22:49', 1, 19, 0, 1, 1),
(450, '2018-12-29 14:57:45', 1, 19, 0, 1, 1),
(451, '2018-12-29 15:08:39', 1, 19, 0, 1, 1),
(452, '2018-12-29 15:49:14', 1, 19, 0, 1, 1),
(453, '2018-12-29 15:51:29', 1, 19, 0, 1, 1),
(454, '2018-12-29 15:52:29', 1, 19, 0, 1, 1),
(455, '2018-12-29 15:53:46', 1, 19, 0, 1, 1),
(456, '2018-12-29 15:55:38', 1, 19, 0, 1, 1),
(457, '2018-12-29 15:55:50', 1, 19, 0, 1, 1),
(458, '2018-12-29 15:55:55', 1, 19, 0, 1, 1),
(459, '2018-12-29 15:55:59', 1, 19, 0, 1, 1),
(460, '2018-12-29 15:56:04', 1, 19, 0, 1, 1),
(461, '2018-12-29 15:56:08', 1, 19, 0, 1, 1),
(462, '2018-12-29 15:56:11', 1, 19, 0, 1, 1),
(463, '2018-12-29 15:56:15', 1, 19, 0, 1, 1),
(464, '2018-12-29 15:57:15', 1, 19, 0, 1, 1),
(465, '2018-12-29 16:09:25', 1, 19, 0, 1, 1),
(466, '2018-12-29 16:10:11', 1, 19, 0, 1, 1),
(467, '2018-12-29 16:10:16', 1, 19, 0, 1, 1),
(468, '2018-12-29 16:10:16', 1, 19, 0, 1, 1),
(469, '2018-12-29 16:10:20', 1, 19, 0, 1, 1),
(470, '2018-12-29 16:10:23', 1, 19, 0, 1, 1),
(471, '2018-12-29 16:10:27', 1, 19, 0, 1, 1),
(472, '2018-12-29 16:13:36', 1, 19, 0, 1, 1),
(473, '2018-12-29 16:15:00', 1, 19, 0, 1, 1),
(474, '2018-12-29 16:18:39', 1, 19, 0, 1, 1),
(475, '2018-12-29 16:22:20', 1, 19, 0, 1, 1),
(476, '2018-12-29 16:23:21', 1, 19, 0, 1, 1),
(477, '2018-12-29 16:24:55', 1, 19, 0, 1, 1),
(478, '2018-12-29 16:26:11', 1, 19, 0, 1, 1),
(479, '2018-12-29 16:27:53', 1, 19, 0, 1, 1),
(480, '2018-12-29 16:28:44', 1, 19, 0, 1, 1),
(481, '2018-12-29 16:33:13', 1, 19, 0, 1, 1),
(482, '2018-12-29 16:34:10', 1, 19, 0, 1, 1),
(483, '2018-12-29 16:36:55', 1, 19, 0, 1, 1),
(484, '2018-12-29 16:38:55', 1, 19, 0, 1, 1),
(485, '2018-12-29 16:40:17', 1, 19, 0, 1, 1),
(486, '2018-12-29 16:41:42', 1, 19, 0, 1, 1),
(487, '2018-12-29 16:42:03', 1, 19, 0, 1, 1),
(488, '2018-12-29 16:46:55', 1, 19, 0, 1, 1),
(489, '2018-12-29 16:48:40', 1, 19, 0, 1, 1),
(490, '2018-12-29 16:49:16', 1, 19, 0, 1, 1),
(491, '2018-12-29 16:50:26', 1, 19, 0, 1, 1),
(492, '2018-12-29 16:51:18', 1, 19, 0, 1, 1),
(493, '2018-12-29 16:52:51', 1, 19, 0, 1, 1),
(494, '2018-12-29 16:55:28', 1, 19, 0, 1, 1),
(495, '2018-12-29 16:55:33', 1, 19, 0, 1, 1),
(496, '2018-12-29 17:00:12', 1, 19, 0, 1, 1),
(497, '2018-12-29 17:02:50', 1, 19, 0, 1, 1),
(498, '2018-12-29 17:04:56', 1, 19, 0, 1, 1),
(499, '2018-12-29 17:06:49', 1, 19, 0, 1, 1),
(500, '2018-12-29 17:23:55', 1, 19, 0, 1, 1),
(501, '2018-12-29 17:26:50', 1, 19, 0, 1, 1),
(502, '2018-12-29 17:32:16', 1, 19, 0, 1, 1),
(503, '2018-12-29 17:32:22', 1, 19, 0, 1, 1),
(504, '2018-12-29 17:33:10', 1, 19, 0, 1, 1),
(505, '2018-12-29 17:59:10', 1, 19, 0, 1, 1),
(506, '2018-12-29 18:06:05', 1, 19, 0, 1, 1),
(507, '2018-12-29 18:07:15', 1, 19, 0, 1, 1),
(508, '2018-12-29 18:07:19', 1, 19, 0, 1, 1),
(509, '2018-12-29 18:10:56', 1, 19, 0, 1, 1),
(510, '2018-12-29 18:18:45', 1, 19, 0, 1, 1),
(511, '2018-12-29 18:18:49', 1, 19, 0, 1, 1),
(512, '2018-12-29 18:21:41', 1, 20, 0, 1, 1),
(513, '2018-12-30 05:13:34', 1, 19, 0, 1, 1),
(514, '2018-12-30 05:17:53', 1, 19, 0, 1, 1),
(515, '2018-12-30 05:22:31', 1, 20, 0, 1, 1),
(516, '2018-12-30 05:31:04', 1, 20, 0, 1, 1),
(517, '2018-12-30 05:33:52', 1, 19, 0, 1, 1),
(518, '2018-12-30 05:35:34', 1, 19, 0, 1, 1),
(519, '2018-12-30 06:01:17', 1, 20, 0, 1, 1),
(520, '2018-12-30 06:01:30', 1, 19, 0, 1, 1),
(521, '2018-12-30 06:01:37', 1, 20, 0, 1, 1),
(522, '2018-12-30 06:01:40', 1, 20, 0, 1, 1),
(523, '2018-12-30 06:01:44', 1, 19, 0, 1, 1),
(524, '2018-12-30 06:05:14', 1, 19, 0, 1, 1),
(525, '2018-12-30 06:05:14', 1, 20, 0, 1, 1),
(526, '2018-12-30 06:12:16', 1, 19, 0, 1, 1),
(527, '2018-12-30 06:58:00', 1, 19, 0, 1, 1),
(528, '2018-12-30 07:00:36', 1, 19, 0, 1, 1),
(529, '2018-12-30 07:02:05', 1, 19, 0, 1, 1),
(530, '2018-12-30 07:04:31', 1, 19, 0, 1, 1),
(531, '2018-12-30 07:05:50', 1, 19, 0, 1, 1),
(532, '2018-12-30 07:06:54', 1, 22, 0, 1, 1),
(533, '2018-12-30 07:11:10', 1, 19, 0, 1, 1),
(534, '2018-12-30 07:17:36', 1, 19, 0, 1, 1),
(535, '2018-12-30 09:37:51', 1, 19, 0, 1, 1),
(536, '2018-12-30 09:37:51', 1, 19, 0, 1, 1),
(537, '2018-12-30 09:39:58', 1, 20, 0, 1, 1),
(538, '2018-12-30 09:42:48', 1, 19, 0, 1, 1),
(539, '2018-12-30 10:10:17', 1, 19, 0, 1, 1),
(540, '2018-12-30 10:14:50', 1, 19, 0, 1, 1),
(541, '2018-12-30 10:14:53', 1, 19, 0, 1, 1),
(542, '2018-12-30 10:14:57', 1, 19, 0, 1, 1),
(543, '2018-12-30 10:15:01', 1, 19, 0, 1, 1),
(544, '2018-12-30 10:19:51', 1, 19, 0, 1, 1),
(545, '2018-12-30 10:19:54', 1, 19, 0, 1, 1),
(546, '2018-12-30 10:19:59', 1, 19, 0, 1, 1),
(547, '2018-12-30 10:20:02', 1, 19, 0, 1, 1),
(548, '2018-12-30 10:20:07', 1, 19, 0, 1, 1),
(549, '2018-12-30 10:20:12', 1, 19, 0, 1, 1),
(550, '2018-12-30 10:20:15', 1, 19, 0, 1, 1),
(551, '2018-12-30 10:20:18', 1, 19, 0, 1, 1),
(552, '2018-12-30 10:20:22', 1, 19, 0, 1, 1),
(553, '2018-12-30 10:20:25', 1, 19, 0, 1, 1),
(554, '2018-12-30 10:20:28', 1, 19, 0, 1, 1),
(555, '2018-12-30 10:20:32', 1, 19, 0, 1, 1),
(556, '2018-12-30 10:20:35', 1, 19, 0, 1, 1),
(557, '2018-12-30 10:20:38', 1, 19, 0, 1, 1),
(558, '2018-12-30 10:24:15', 1, 19, 0, 1, 1),
(559, '2018-12-30 10:28:37', 1, 19, 0, 1, 1),
(560, '2018-12-30 10:28:41', 1, 19, 0, 1, 1),
(561, '2018-12-30 10:28:44', 1, 19, 0, 1, 1),
(562, '2018-12-30 10:28:49', 1, 19, 0, 1, 1),
(563, '2018-12-30 10:28:52', 1, 19, 0, 1, 1),
(564, '2018-12-30 10:28:58', 1, 19, 0, 1, 1),
(565, '2018-12-30 10:32:06', 1, 19, 0, 1, 1),
(566, '2018-12-30 10:32:09', 1, 19, 0, 1, 1),
(567, '2018-12-30 10:32:13', 1, 19, 0, 1, 1),
(568, '2018-12-30 10:39:55', 1, 19, 0, 1, 1),
(569, '2018-12-30 10:39:57', 1, 19, 0, 1, 1),
(570, '2018-12-30 10:39:58', 1, 19, 0, 1, 1),
(571, '2018-12-30 10:42:09', 1, 19, 0, 1, 1),
(572, '2018-12-30 10:44:55', 1, 19, 0, 1, 1),
(573, '2018-12-30 10:45:25', 1, 19, 0, 1, 1),
(574, '2018-12-31 03:08:14', 1, 19, 0, 1, 1),
(575, '2018-12-31 08:12:19', 1, 19, 0, 1, 1),
(576, '2018-12-31 08:14:00', 1, 19, 0, 1, 1),
(577, '2018-12-31 08:20:29', 1, 19, 0, 1, 1),
(578, '2018-12-31 08:20:32', 1, 19, 0, 1, 1),
(579, '2018-12-31 08:20:37', 1, 19, 0, 1, 1),
(580, '2018-12-31 08:20:40', 1, 19, 0, 1, 1),
(581, '2018-12-31 08:20:44', 1, 19, 0, 1, 1),
(582, '2018-12-31 08:38:11', 1, 19, 0, 1, 1),
(583, '2018-12-31 08:39:15', 1, 20, 0, 1, 1),
(584, '2018-12-31 08:46:14', 1, 19, 0, 1, 1),
(585, '2018-12-31 08:47:28', 1, 19, 0, 1, 1),
(586, '2018-12-31 08:47:33', 1, 19, 0, 1, 1),
(587, '2018-12-31 08:50:52', 1, 19, 0, 1, 1),
(588, '2018-12-31 08:57:08', 1, 19, 0, 1, 1),
(589, '2018-12-31 08:59:20', 1, 19, 0, 1, 1),
(590, '2018-12-31 08:59:24', 1, 19, 0, 1, 1),
(591, '2018-12-31 09:01:20', 1, 19, 0, 1, 1),
(592, '2018-12-31 09:03:43', 1, 19, 0, 1, 1),
(593, '2018-12-31 09:05:19', 1, 19, 0, 1, 1),
(594, '2018-12-31 09:07:02', 1, 19, 0, 1, 1),
(595, '2018-12-31 09:07:06', 1, 19, 0, 1, 1),
(596, '2018-12-31 09:07:09', 1, 19, 0, 1, 1),
(597, '2018-12-31 09:07:13', 1, 19, 0, 1, 1),
(598, '2018-12-31 09:07:16', 1, 19, 0, 1, 1),
(599, '2018-12-31 09:07:19', 1, 19, 0, 1, 1),
(600, '2018-12-31 09:07:24', 1, 19, 0, 1, 1),
(601, '2018-12-31 09:07:27', 1, 19, 0, 1, 1),
(602, '2018-12-31 09:07:31', 1, 19, 0, 1, 1),
(603, '2018-12-31 09:07:35', 1, 19, 0, 1, 1),
(604, '2018-12-31 13:15:57', 1, 19, 0, 1, 1),
(605, '2018-12-31 13:16:01', 1, 19, 0, 1, 1),
(606, '2018-12-31 13:17:28', 1, 19, 0, 1, 1),
(607, '2018-12-31 13:19:21', 1, 19, 0, 1, 1),
(608, '2018-12-31 13:21:00', 1, 19, 0, 1, 1),
(609, '2018-12-31 13:21:04', 1, 19, 0, 1, 1),
(610, '2018-12-31 13:21:07', 1, 19, 0, 1, 1),
(611, '2018-12-31 13:21:11', 1, 19, 0, 1, 1),
(612, '2018-12-31 13:21:15', 1, 19, 0, 1, 1),
(613, '2018-12-31 13:21:18', 1, 19, 0, 1, 1),
(614, '2018-12-31 13:24:00', 1, 19, 0, 1, 1),
(615, '2018-12-31 13:24:05', 1, 19, 0, 1, 1),
(616, '2018-12-31 13:24:09', 1, 19, 0, 1, 1),
(617, '2018-12-31 13:24:12', 1, 19, 0, 1, 1),
(618, '2018-12-31 13:24:16', 1, 19, 0, 1, 1),
(619, '2018-12-31 13:24:19', 1, 19, 0, 1, 1),
(620, '2018-12-31 13:24:23', 1, 19, 0, 1, 1),
(621, '2018-12-31 13:24:26', 1, 19, 0, 1, 1),
(622, '2018-12-31 13:24:30', 1, 19, 0, 1, 1),
(623, '2018-12-31 13:24:35', 1, 19, 0, 1, 1),
(624, '2018-12-31 13:24:38', 1, 19, 0, 1, 1),
(625, '2018-12-31 13:24:41', 1, 19, 0, 1, 1),
(626, '2018-12-31 13:24:47', 1, 19, 0, 1, 1),
(627, '2018-12-31 13:26:48', 1, 19, 0, 1, 1),
(628, '2018-12-31 13:26:51', 1, 19, 0, 1, 1),
(629, '2018-12-31 13:26:55', 1, 19, 0, 1, 1),
(630, '2018-12-31 13:26:59', 1, 19, 0, 1, 1),
(631, '2018-12-31 13:27:03', 1, 19, 0, 1, 1),
(632, '2018-12-31 13:27:07', 1, 19, 0, 1, 1),
(633, '2018-12-31 13:27:10', 1, 19, 0, 1, 1),
(634, '2018-12-31 13:27:14', 1, 19, 0, 1, 1),
(635, '2018-12-31 13:27:17', 1, 19, 0, 1, 1),
(636, '2018-12-31 13:27:20', 1, 19, 0, 1, 1),
(637, '2018-12-31 13:27:23', 1, 19, 0, 1, 1),
(638, '2018-12-31 13:27:26', 1, 19, 0, 1, 1),
(639, '2018-12-31 13:27:29', 1, 19, 0, 1, 1),
(640, '2018-12-31 13:27:35', 1, 19, 0, 1, 1),
(641, '2018-12-31 13:27:38', 1, 19, 0, 1, 1),
(642, '2018-12-31 13:37:53', 1, 19, 0, 1, 1),
(643, '2018-12-31 13:48:09', 1, 19, 0, 1, 1),
(644, '2018-12-31 14:04:18', 1, 19, 0, 1, 1),
(645, '2018-12-31 14:13:59', 1, 19, 0, 1, 1),
(646, '2018-12-31 14:14:03', 1, 19, 0, 1, 1),
(647, '2018-12-31 14:14:07', 1, 19, 0, 1, 1),
(648, '2018-12-31 14:14:11', 1, 19, 0, 1, 1),
(649, '2018-12-31 14:14:14', 1, 19, 0, 1, 1),
(650, '2018-12-31 14:28:45', 1, 19, 0, 1, 1),
(651, '2018-12-31 14:28:48', 1, 19, 0, 1, 1),
(652, '2018-12-31 14:28:52', 1, 19, 0, 1, 1),
(653, '2018-12-31 14:30:06', 1, 19, 0, 1, 1),
(654, '2018-12-31 14:31:43', 1, 19, 0, 1, 1),
(655, '2018-12-31 14:31:47', 1, 19, 0, 1, 1),
(656, '2018-12-31 14:37:07', 1, 20, 0, 1, 1),
(657, '2018-12-31 14:41:40', 1, 20, 0, 1, 1),
(658, '2018-12-31 14:41:42', 1, 20, 0, 1, 1),
(659, '2018-12-31 14:41:43', 1, 20, 0, 1, 1),
(660, '2018-12-31 14:41:45', 1, 20, 0, 1, 1),
(661, '2018-12-31 14:41:46', 1, 20, 0, 1, 1),
(662, '2018-12-31 14:41:48', 1, 20, 0, 1, 1),
(663, '2018-12-31 14:41:49', 1, 20, 0, 1, 1),
(664, '2018-12-31 14:41:50', 1, 20, 0, 1, 1),
(665, '2018-12-31 14:43:14', 1, 20, 0, 1, 1),
(666, '2018-12-31 14:43:17', 1, 20, 0, 1, 1),
(667, '2018-12-31 14:43:19', 1, 20, 0, 1, 1),
(668, '2018-12-31 14:43:21', 1, 20, 0, 1, 1),
(669, '2018-12-31 14:43:22', 1, 20, 0, 1, 1),
(670, '2018-12-31 14:43:24', 1, 20, 0, 1, 1),
(671, '2018-12-31 14:43:25', 1, 20, 0, 1, 1),
(672, '2018-12-31 14:43:26', 1, 20, 0, 1, 1),
(673, '2018-12-31 14:43:28', 1, 20, 0, 1, 1),
(674, '2018-12-31 14:43:29', 1, 20, 0, 1, 1),
(675, '2018-12-31 14:43:30', 1, 20, 0, 1, 1),
(676, '2018-12-31 14:43:32', 1, 20, 0, 1, 1),
(677, '2018-12-31 14:43:33', 1, 20, 0, 1, 1),
(678, '2018-12-31 14:43:34', 1, 20, 0, 1, 1),
(679, '2018-12-31 14:43:35', 1, 20, 0, 1, 1),
(680, '2018-12-31 14:43:37', 1, 20, 0, 1, 1),
(681, '2018-12-31 14:43:38', 1, 20, 0, 1, 1),
(682, '2018-12-31 14:43:39', 1, 20, 0, 1, 1),
(683, '2018-12-31 14:43:41', 1, 20, 0, 1, 1),
(684, '2018-12-31 14:43:42', 1, 20, 0, 1, 1),
(685, '2018-12-31 14:43:43', 1, 20, 0, 1, 1),
(686, '2018-12-31 14:43:45', 1, 20, 0, 1, 1),
(687, '2018-12-31 14:43:46', 1, 20, 0, 1, 1),
(688, '2018-12-31 14:43:48', 1, 20, 0, 1, 1),
(689, '2018-12-31 14:43:50', 1, 20, 0, 1, 1),
(690, '2018-12-31 14:47:14', 1, 20, 0, 1, 1),
(691, '2018-12-31 14:47:14', 1, 20, 0, 1, 1),
(692, '2018-12-31 14:47:14', 1, 20, 0, 1, 1),
(693, '2018-12-31 14:47:15', 1, 20, 0, 1, 1),
(694, '2018-12-31 14:50:16', 1, 20, 0, 1, 1),
(695, '2018-12-31 15:29:37', 1, 20, 0, 1, 1),
(696, '2018-12-31 15:29:40', 1, 20, 0, 1, 1),
(697, '2018-12-31 16:53:07', 1, 20, 0, 1, 1),
(698, '2018-12-31 18:13:34', 1, 20, 0, 1, 1),
(699, '2018-12-31 18:15:12', 1, 20, 0, 1, 1),
(700, '2018-12-31 18:17:34', 1, 20, 0, 1, 1),
(701, '2018-12-31 18:17:36', 1, 20, 0, 1, 1),
(702, '2018-12-31 18:20:29', 1, 20, 0, 1, 1),
(703, '2018-12-31 18:37:11', 1, 24, 0, 1, 1),
(704, '2018-12-31 18:38:35', 1, 24, 0, 1, 1),
(705, '2019-01-01 00:01:41', 1, 19, 0, 1, 1),
(706, '2019-01-01 00:02:54', 1, 23, 0, 1, 1),
(707, '2019-01-01 00:03:02', 1, 24, 0, 1, 1),
(708, '2019-01-01 05:12:32', 1, 24, 0, 1, 1),
(709, '2019-01-01 05:33:13', 1, 24, 0, 1, 1),
(710, '2019-01-01 05:42:38', 1, 24, 0, 1, 1),
(711, '2019-01-01 05:45:52', 1, 19, 0, 1, 1),
(712, '2019-01-01 05:50:39', 1, 24, 0, 1, 1),
(713, '2019-01-01 05:51:47', 1, 24, 0, 1, 1),
(714, '2019-01-01 05:53:29', 1, 24, 0, 1, 1),
(715, '2019-01-01 05:54:53', 1, 24, 0, 1, 1),
(716, '2019-01-01 05:59:09', 1, 24, 0, 1, 1),
(717, '2019-01-01 06:01:21', 1, 24, 0, 1, 1),
(718, '2019-01-01 06:01:54', 1, 24, 0, 1, 1),
(719, '2019-01-01 06:04:04', 1, 24, 0, 1, 1),
(720, '2019-01-01 06:06:52', 1, 24, 0, 1, 1),
(721, '2019-01-01 06:07:16', 1, 19, 0, 1, 1),
(722, '2019-01-01 06:23:47', 1, 19, 0, 1, 1),
(723, '2019-01-01 06:25:12', 1, 24, 0, 1, 1),
(724, '2019-01-01 06:29:42', 1, 24, 0, 1, 1),
(725, '2019-01-01 06:32:18', 1, 19, 0, 1, 1),
(726, '2019-01-01 06:56:14', 1, 19, 0, 1, 1),
(727, '2019-01-01 06:56:19', 1, 24, 0, 1, 1),
(728, '2019-01-01 07:01:33', 1, 24, 0, 1, 1),
(729, '2019-01-01 07:03:45', 1, 24, 0, 1, 1),
(730, '2019-01-01 07:04:27', 1, 24, 0, 1, 1),
(731, '2019-01-01 07:05:01', 1, 24, 0, 1, 1),
(732, '2019-01-01 07:06:01', 1, 24, 0, 1, 1),
(733, '2019-01-01 07:06:14', 1, 19, 0, 1, 1),
(734, '2019-01-01 07:07:56', 1, 19, 0, 1, 1),
(735, '2019-01-01 07:21:46', 1, 24, 0, 1, 1),
(736, '2019-01-01 12:21:45', 1, 24, 0, 1, 1),
(737, '2019-01-01 12:27:57', 1, 24, 0, 1, 1),
(738, '2019-01-01 12:29:27', 1, 24, 0, 1, 1),
(739, '2019-01-01 12:30:02', 1, 24, 0, 1, 1),
(740, '2019-01-01 12:40:41', 1, 24, 0, 1, 1),
(741, '2019-01-01 12:44:09', 1, 24, 0, 1, 1),
(742, '2019-01-01 12:45:28', 1, 24, 0, 1, 1),
(743, '2019-01-01 12:47:34', 1, 24, 0, 1, 1),
(744, '2019-01-01 12:51:57', 1, 24, 0, 1, 1),
(745, '2019-01-01 12:52:00', 1, 24, 0, 1, 1),
(746, '2019-01-01 12:57:39', 1, 19, 0, 1, 1),
(747, '2019-01-01 14:42:13', 1, 19, 0, 1, 1),
(748, '2019-01-01 14:42:41', 1, 19, 0, 1, 1),
(749, '2019-01-01 14:54:12', 1, 19, 0, 1, 1),
(750, '2019-01-01 14:56:38', 1, 19, 0, 1, 1),
(751, '2019-01-01 15:02:23', 1, 19, 0, 1, 1),
(752, '2019-01-01 15:05:10', 1, 19, 0, 1, 1),
(753, '2019-01-01 15:11:08', 1, 20, 0, 1, 1),
(754, '2019-01-01 15:11:26', 1, 24, 0, 1, 1),
(755, '2019-01-01 15:14:22', 1, 24, 0, 1, 1),
(756, '2019-01-01 15:16:47', 1, 24, 0, 1, 1),
(757, '2019-01-01 15:17:44', 1, 19, 0, 1, 1),
(758, '2019-01-01 15:41:20', 1, 24, 0, 1, 1),
(759, '2019-01-01 15:41:27', 1, 24, 0, 1, 1),
(760, '2019-01-01 15:41:29', 1, 24, 0, 1, 1),
(761, '2019-01-01 15:43:17', 1, 24, 0, 1, 1),
(762, '2019-01-01 15:44:00', 1, 24, 0, 1, 1),
(763, '2019-01-01 15:44:02', 1, 24, 0, 1, 1),
(764, '2019-01-01 15:45:29', 1, 19, 0, 1, 1),
(765, '2019-01-01 15:52:13', 1, 19, 0, 1, 1),
(766, '2019-01-01 16:42:49', 1, 19, 0, 1, 1),
(767, '2019-01-01 19:37:28', 1, 24, 0, 1, 1),
(768, '2019-01-01 19:38:09', 1, 24, 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `report_event_types`
--

CREATE TABLE IF NOT EXISTS `report_event_types` (
  `event_type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Event Type Id',
  `event_name` varchar(64) NOT NULL COMMENT 'Event Name',
  `customer_login` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Login',
  PRIMARY KEY (`event_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Reports Event Type Table' AUTO_INCREMENT=7 ;

--
-- Dumping data for table `report_event_types`
--

INSERT INTO `report_event_types` (`event_type_id`, `event_name`, `customer_login`) VALUES
(1, 'catalog_product_view', 0),
(2, 'sendfriend_product', 0),
(3, 'catalog_product_compare_add_product', 0),
(4, 'checkout_cart_add_product', 0),
(5, 'wishlist_add_product', 0),
(6, 'wishlist_share', 0);

-- --------------------------------------------------------

--
-- Table structure for table `report_viewed_product_aggregated_daily`
--

CREATE TABLE IF NOT EXISTS `report_viewed_product_aggregated_daily` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `views_num` int(11) NOT NULL DEFAULT '0' COMMENT 'Number of Views',
  `rating_pos` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `REPORT_VIEWED_PRD_AGGRED_DAILY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  KEY `REPORT_VIEWED_PRODUCT_AGGREGATED_DAILY_STORE_ID` (`store_id`),
  KEY `REPORT_VIEWED_PRODUCT_AGGREGATED_DAILY_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Most Viewed Products Aggregated Daily' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `report_viewed_product_aggregated_monthly`
--

CREATE TABLE IF NOT EXISTS `report_viewed_product_aggregated_monthly` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `views_num` int(11) NOT NULL DEFAULT '0' COMMENT 'Number of Views',
  `rating_pos` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `REPORT_VIEWED_PRD_AGGRED_MONTHLY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  KEY `REPORT_VIEWED_PRODUCT_AGGREGATED_MONTHLY_STORE_ID` (`store_id`),
  KEY `REPORT_VIEWED_PRODUCT_AGGREGATED_MONTHLY_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Most Viewed Products Aggregated Monthly' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `report_viewed_product_aggregated_yearly`
--

CREATE TABLE IF NOT EXISTS `report_viewed_product_aggregated_yearly` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `views_num` int(11) NOT NULL DEFAULT '0' COMMENT 'Number of Views',
  `rating_pos` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `REPORT_VIEWED_PRD_AGGRED_YEARLY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  KEY `REPORT_VIEWED_PRODUCT_AGGREGATED_YEARLY_STORE_ID` (`store_id`),
  KEY `REPORT_VIEWED_PRODUCT_AGGREGATED_YEARLY_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Most Viewed Products Aggregated Yearly' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `report_viewed_product_index`
--

CREATE TABLE IF NOT EXISTS `report_viewed_product_index` (
  `index_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Index Id',
  `visitor_id` int(10) unsigned DEFAULT NULL COMMENT 'Visitor Id',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `added_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Added At',
  PRIMARY KEY (`index_id`),
  UNIQUE KEY `REPORT_VIEWED_PRODUCT_INDEX_VISITOR_ID_PRODUCT_ID` (`visitor_id`,`product_id`),
  UNIQUE KEY `REPORT_VIEWED_PRODUCT_INDEX_CUSTOMER_ID_PRODUCT_ID` (`customer_id`,`product_id`),
  KEY `REPORT_VIEWED_PRODUCT_INDEX_STORE_ID` (`store_id`),
  KEY `REPORT_VIEWED_PRODUCT_INDEX_ADDED_AT` (`added_at`),
  KEY `REPORT_VIEWED_PRODUCT_INDEX_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Reports Viewed Product Index Table' AUTO_INCREMENT=765 ;

--
-- Dumping data for table `report_viewed_product_index`
--

INSERT INTO `report_viewed_product_index` (`index_id`, `visitor_id`, `customer_id`, `product_id`, `store_id`, `added_at`) VALUES
(1, NULL, NULL, 19, 1, '2018-12-19 14:47:28'),
(2, NULL, NULL, 19, 1, '2018-12-19 14:49:55'),
(3, NULL, NULL, 19, 1, '2018-12-19 15:24:21'),
(4, NULL, NULL, 19, 1, '2018-12-19 15:27:28'),
(5, NULL, NULL, 19, 1, '2018-12-19 15:29:54'),
(6, NULL, NULL, 19, 1, '2018-12-19 15:34:08'),
(7, NULL, NULL, 19, 1, '2018-12-19 15:34:09'),
(8, NULL, NULL, 19, 1, '2018-12-19 15:35:34'),
(9, NULL, NULL, 19, 1, '2018-12-19 15:36:25'),
(10, NULL, NULL, 19, 1, '2018-12-19 15:36:27'),
(11, NULL, NULL, 19, 1, '2018-12-19 15:43:09'),
(12, NULL, NULL, 19, 1, '2018-12-19 15:43:11'),
(13, NULL, NULL, 19, 1, '2018-12-19 15:46:16'),
(14, NULL, NULL, 19, 1, '2018-12-19 15:50:30'),
(15, NULL, NULL, 19, 1, '2018-12-19 15:50:31'),
(16, NULL, NULL, 19, 1, '2018-12-19 15:51:32'),
(17, NULL, NULL, 19, 1, '2018-12-19 15:56:01'),
(18, NULL, NULL, 19, 1, '2018-12-19 15:57:25'),
(19, NULL, NULL, 19, 1, '2018-12-19 16:00:17'),
(20, NULL, NULL, 19, 1, '2018-12-19 16:02:31'),
(21, NULL, NULL, 19, 1, '2018-12-19 16:06:07'),
(22, NULL, NULL, 19, 1, '2018-12-19 16:09:30'),
(23, NULL, NULL, 19, 1, '2018-12-19 16:10:39'),
(24, NULL, NULL, 19, 1, '2018-12-19 16:11:58'),
(25, NULL, NULL, 19, 1, '2018-12-19 16:12:00'),
(26, NULL, NULL, 19, 1, '2018-12-19 16:13:10'),
(27, NULL, NULL, 19, 1, '2018-12-19 16:18:38'),
(28, NULL, NULL, 19, 1, '2018-12-19 16:32:07'),
(29, NULL, NULL, 19, 1, '2018-12-19 16:34:02'),
(30, NULL, NULL, 19, 1, '2018-12-19 16:34:48'),
(31, NULL, NULL, 19, 1, '2018-12-19 16:35:14'),
(32, NULL, NULL, 19, 1, '2018-12-19 17:11:46'),
(33, NULL, NULL, 19, 1, '2018-12-19 17:15:51'),
(34, NULL, NULL, 19, 1, '2018-12-19 17:19:04'),
(35, NULL, NULL, 19, 1, '2018-12-19 17:23:50'),
(36, NULL, NULL, 19, 1, '2018-12-19 17:24:49'),
(37, NULL, NULL, 19, 1, '2018-12-19 17:26:12'),
(38, NULL, NULL, 19, 1, '2018-12-19 17:26:51'),
(39, NULL, NULL, 19, 1, '2018-12-19 17:28:09'),
(40, NULL, NULL, 19, 1, '2018-12-19 17:28:16'),
(41, NULL, NULL, 19, 1, '2018-12-19 17:43:17'),
(42, NULL, NULL, 19, 1, '2018-12-19 17:43:18'),
(43, NULL, NULL, 19, 1, '2018-12-19 17:45:00'),
(44, NULL, NULL, 19, 1, '2018-12-19 17:48:39'),
(45, NULL, NULL, 19, 1, '2018-12-19 17:48:40'),
(46, NULL, NULL, 19, 1, '2018-12-19 17:49:20'),
(47, NULL, NULL, 19, 1, '2018-12-19 17:49:21'),
(48, NULL, NULL, 19, 1, '2018-12-19 17:50:29'),
(49, NULL, NULL, 19, 1, '2018-12-19 17:51:23'),
(50, NULL, NULL, 19, 1, '2018-12-19 17:54:53'),
(51, NULL, NULL, 19, 1, '2018-12-19 17:55:22'),
(52, NULL, NULL, 19, 1, '2018-12-19 17:55:25'),
(53, NULL, NULL, 19, 1, '2018-12-19 17:58:35'),
(54, NULL, NULL, 19, 1, '2018-12-19 18:00:11'),
(55, NULL, NULL, 19, 1, '2018-12-19 18:10:35'),
(56, NULL, NULL, 19, 1, '2018-12-19 18:19:22'),
(57, NULL, NULL, 19, 1, '2018-12-19 18:29:52'),
(58, NULL, NULL, 19, 1, '2018-12-19 19:20:21'),
(59, NULL, NULL, 19, 1, '2018-12-19 19:21:25'),
(60, NULL, NULL, 19, 1, '2018-12-19 19:22:42'),
(61, NULL, NULL, 19, 1, '2018-12-19 19:22:44'),
(62, NULL, NULL, 19, 1, '2018-12-19 19:26:29'),
(63, NULL, NULL, 19, 1, '2018-12-19 19:27:05'),
(64, NULL, NULL, 19, 1, '2018-12-19 19:27:07'),
(65, NULL, NULL, 19, 1, '2018-12-19 19:29:15'),
(66, NULL, NULL, 19, 1, '2018-12-19 19:32:29'),
(67, NULL, NULL, 19, 1, '2018-12-20 07:38:29'),
(68, NULL, NULL, 19, 1, '2018-12-20 09:00:54'),
(69, NULL, NULL, 19, 1, '2018-12-20 15:05:23'),
(70, NULL, NULL, 19, 1, '2018-12-20 15:05:23'),
(71, NULL, NULL, 19, 1, '2018-12-20 15:08:46'),
(72, NULL, NULL, 19, 1, '2018-12-20 15:08:49'),
(73, NULL, NULL, 19, 1, '2018-12-20 16:27:32'),
(74, NULL, NULL, 19, 1, '2018-12-20 16:27:32'),
(75, NULL, NULL, 19, 1, '2018-12-20 16:29:51'),
(76, NULL, NULL, 19, 1, '2018-12-20 16:29:55'),
(77, NULL, NULL, 19, 1, '2018-12-20 16:31:55'),
(78, NULL, NULL, 19, 1, '2018-12-20 16:31:59'),
(79, NULL, NULL, 19, 1, '2018-12-20 16:38:53'),
(80, NULL, NULL, 19, 1, '2018-12-20 16:42:13'),
(81, NULL, NULL, 19, 1, '2018-12-20 16:42:17'),
(82, NULL, NULL, 19, 1, '2018-12-20 16:44:21'),
(83, NULL, NULL, 19, 1, '2018-12-20 16:44:25'),
(84, NULL, NULL, 19, 1, '2018-12-20 16:46:45'),
(85, NULL, NULL, 19, 1, '2018-12-20 16:46:49'),
(86, NULL, NULL, 19, 1, '2018-12-20 17:16:53'),
(87, NULL, NULL, 19, 1, '2018-12-20 17:17:09'),
(88, NULL, NULL, 19, 1, '2018-12-20 17:19:25'),
(89, NULL, NULL, 19, 1, '2018-12-20 17:20:16'),
(90, NULL, NULL, 19, 1, '2018-12-20 17:21:50'),
(91, NULL, NULL, 19, 1, '2018-12-20 17:23:26'),
(92, NULL, NULL, 19, 1, '2018-12-20 17:53:13'),
(93, NULL, NULL, 19, 1, '2018-12-20 17:54:11'),
(94, NULL, NULL, 19, 1, '2018-12-20 17:54:13'),
(95, NULL, NULL, 19, 1, '2018-12-20 17:55:32'),
(96, NULL, NULL, 19, 1, '2018-12-20 17:55:38'),
(97, NULL, NULL, 19, 1, '2018-12-20 17:55:58'),
(98, NULL, NULL, 19, 1, '2018-12-20 17:56:38'),
(99, NULL, NULL, 19, 1, '2018-12-20 17:56:42'),
(100, NULL, NULL, 19, 1, '2018-12-20 17:57:12'),
(101, NULL, NULL, 19, 1, '2018-12-20 17:58:00'),
(102, NULL, NULL, 19, 1, '2018-12-20 18:05:34'),
(103, NULL, NULL, 19, 1, '2018-12-20 18:08:23'),
(104, NULL, NULL, 19, 1, '2018-12-21 08:12:48'),
(105, NULL, NULL, 19, 1, '2018-12-21 10:31:50'),
(106, NULL, NULL, 19, 1, '2018-12-21 10:31:50'),
(107, NULL, NULL, 19, 1, '2018-12-21 14:27:46'),
(108, NULL, NULL, 19, 1, '2018-12-21 14:27:46'),
(109, NULL, NULL, 19, 1, '2018-12-21 14:30:59'),
(110, NULL, NULL, 19, 1, '2018-12-21 14:31:03'),
(111, NULL, NULL, 19, 1, '2018-12-21 14:36:12'),
(112, NULL, NULL, 19, 1, '2018-12-21 14:36:15'),
(113, 2, NULL, 19, 1, '2018-12-21 15:16:46'),
(139, NULL, NULL, 19, 1, '2018-12-21 17:00:49'),
(147, NULL, NULL, 19, 1, '2018-12-21 17:42:52'),
(148, NULL, NULL, 19, 1, '2018-12-21 17:43:32'),
(149, NULL, NULL, 19, 1, '2018-12-21 17:46:10'),
(150, NULL, NULL, 19, 1, '2018-12-21 17:56:29'),
(151, NULL, NULL, 19, 1, '2018-12-21 17:56:34'),
(152, NULL, NULL, 19, 1, '2018-12-21 18:01:46'),
(153, NULL, NULL, 19, 1, '2018-12-21 18:01:50'),
(154, NULL, NULL, 19, 1, '2018-12-21 18:01:51'),
(155, NULL, NULL, 19, 1, '2018-12-21 18:01:55'),
(156, NULL, NULL, 19, 1, '2018-12-21 18:01:59'),
(157, NULL, NULL, 19, 1, '2018-12-21 18:04:07'),
(158, NULL, NULL, 19, 1, '2018-12-21 18:25:10'),
(159, NULL, NULL, 19, 1, '2018-12-21 18:35:09'),
(160, NULL, NULL, 19, 1, '2018-12-21 18:38:45'),
(161, NULL, NULL, 19, 1, '2018-12-21 18:41:15'),
(162, NULL, NULL, 19, 1, '2018-12-21 18:56:37'),
(163, NULL, NULL, 19, 1, '2018-12-21 19:00:46'),
(164, NULL, NULL, 19, 1, '2018-12-21 19:17:45'),
(165, NULL, NULL, 19, 1, '2018-12-21 19:20:31'),
(166, NULL, NULL, 19, 1, '2018-12-21 19:20:32'),
(167, NULL, NULL, 19, 1, '2018-12-21 19:20:35'),
(168, NULL, NULL, 19, 1, '2018-12-21 19:25:05'),
(169, NULL, NULL, 19, 1, '2018-12-21 19:34:31'),
(170, NULL, NULL, 19, 1, '2018-12-21 19:36:34'),
(171, NULL, NULL, 19, 1, '2018-12-21 19:43:31'),
(172, NULL, NULL, 19, 1, '2018-12-21 19:48:24'),
(173, 3, NULL, 19, 1, '2018-12-21 19:49:23'),
(176, NULL, NULL, 19, 1, '2018-12-21 19:52:11'),
(177, NULL, NULL, 19, 1, '2018-12-21 19:52:14'),
(178, NULL, NULL, 19, 1, '2018-12-21 19:53:44'),
(179, NULL, NULL, 19, 1, '2018-12-21 19:53:48'),
(180, NULL, NULL, 19, 1, '2018-12-21 19:55:20'),
(181, NULL, NULL, 19, 1, '2018-12-21 19:55:23'),
(182, NULL, NULL, 19, 1, '2018-12-21 19:57:49'),
(185, NULL, NULL, 19, 1, '2018-12-21 20:00:15'),
(186, NULL, NULL, 19, 1, '2018-12-22 01:39:20'),
(187, 4, NULL, 19, 1, '2018-12-22 01:40:51'),
(188, NULL, NULL, 19, 1, '2018-12-23 06:59:55'),
(189, NULL, NULL, 19, 1, '2018-12-23 07:02:59'),
(190, NULL, NULL, 19, 1, '2018-12-23 14:17:06'),
(191, NULL, NULL, 19, 1, '2018-12-23 14:21:10'),
(192, NULL, NULL, 19, 1, '2018-12-24 17:04:00'),
(193, NULL, NULL, 19, 1, '2018-12-24 17:06:23'),
(194, NULL, NULL, 19, 1, '2018-12-24 17:15:34'),
(195, NULL, NULL, 19, 1, '2018-12-24 17:16:58'),
(196, NULL, NULL, 19, 1, '2018-12-24 17:18:26'),
(197, NULL, NULL, 19, 1, '2018-12-24 17:31:20'),
(198, NULL, NULL, 19, 1, '2018-12-24 17:32:17'),
(199, NULL, NULL, 19, 1, '2018-12-24 17:32:49'),
(200, NULL, NULL, 19, 1, '2018-12-24 17:33:08'),
(201, NULL, NULL, 19, 1, '2018-12-24 17:33:19'),
(202, NULL, NULL, 19, 1, '2018-12-24 17:34:36'),
(203, NULL, NULL, 19, 1, '2018-12-24 17:44:14'),
(204, NULL, NULL, 19, 1, '2018-12-24 17:45:21'),
(205, NULL, NULL, 19, 1, '2018-12-24 17:48:39'),
(206, NULL, NULL, 19, 1, '2018-12-24 17:49:27'),
(207, NULL, NULL, 19, 1, '2018-12-24 17:51:22'),
(208, NULL, NULL, 19, 1, '2018-12-24 17:51:23'),
(209, NULL, NULL, 19, 1, '2018-12-24 18:06:12'),
(210, NULL, NULL, 19, 1, '2018-12-24 18:12:52'),
(211, NULL, NULL, 19, 1, '2018-12-24 18:13:25'),
(212, NULL, NULL, 19, 1, '2018-12-24 18:15:10'),
(213, NULL, NULL, 19, 1, '2018-12-24 18:16:49'),
(214, NULL, NULL, 19, 1, '2018-12-24 18:58:25'),
(215, NULL, NULL, 19, 1, '2018-12-25 04:15:19'),
(216, NULL, NULL, 19, 1, '2018-12-25 04:18:42'),
(217, NULL, NULL, 19, 1, '2018-12-25 04:23:52'),
(218, 5, NULL, 19, 1, '2018-12-25 04:26:17'),
(220, NULL, NULL, 20, 1, '2018-12-25 11:11:27'),
(221, NULL, NULL, 22, 1, '2018-12-25 11:12:34'),
(222, NULL, NULL, 21, 1, '2018-12-25 11:13:30'),
(223, NULL, NULL, 19, 1, '2018-12-25 15:46:48'),
(224, NULL, NULL, 19, 1, '2018-12-25 16:42:18'),
(225, NULL, NULL, 19, 1, '2018-12-25 16:45:36'),
(226, NULL, NULL, 19, 1, '2018-12-25 16:46:14'),
(227, NULL, NULL, 19, 1, '2018-12-25 16:47:57'),
(228, NULL, NULL, 19, 1, '2018-12-25 16:49:38'),
(229, NULL, NULL, 19, 1, '2018-12-25 16:56:56'),
(230, NULL, NULL, 19, 1, '2018-12-25 16:58:30'),
(231, NULL, NULL, 19, 1, '2018-12-25 17:10:55'),
(232, NULL, NULL, 19, 1, '2018-12-25 17:13:41'),
(233, NULL, NULL, 19, 1, '2018-12-25 17:16:12'),
(234, NULL, NULL, 19, 1, '2018-12-25 17:18:45'),
(235, NULL, NULL, 19, 1, '2018-12-25 17:20:07'),
(236, NULL, NULL, 19, 1, '2018-12-25 17:24:44'),
(237, NULL, NULL, 19, 1, '2018-12-25 18:53:13'),
(238, 6, NULL, 19, 1, '2018-12-25 18:55:47'),
(240, NULL, NULL, 19, 1, '2018-12-26 06:37:43'),
(241, NULL, NULL, 21, 1, '2018-12-26 07:50:30'),
(242, NULL, NULL, 22, 1, '2018-12-26 07:50:39'),
(243, NULL, NULL, 20, 1, '2018-12-26 07:50:48'),
(244, NULL, NULL, 19, 1, '2018-12-26 17:06:15'),
(245, NULL, NULL, 19, 1, '2018-12-26 17:06:54'),
(246, NULL, NULL, 20, 1, '2018-12-27 15:40:09'),
(247, NULL, NULL, 19, 1, '2018-12-27 15:42:59'),
(248, NULL, NULL, 19, 1, '2018-12-27 15:43:06'),
(249, NULL, NULL, 22, 1, '2018-12-27 15:45:39'),
(250, NULL, NULL, 22, 1, '2018-12-27 15:45:45'),
(251, NULL, NULL, 22, 1, '2018-12-27 15:45:53'),
(252, NULL, NULL, 23, 1, '2018-12-27 15:48:01'),
(253, NULL, NULL, 19, 1, '2018-12-27 15:50:50'),
(254, NULL, NULL, 19, 1, '2018-12-27 15:53:37'),
(255, NULL, NULL, 19, 1, '2018-12-27 16:05:53'),
(256, NULL, NULL, 19, 1, '2018-12-27 16:09:29'),
(257, NULL, NULL, 19, 1, '2018-12-27 16:09:41'),
(258, NULL, NULL, 19, 1, '2018-12-27 16:09:54'),
(259, NULL, NULL, 19, 1, '2018-12-27 16:10:13'),
(260, NULL, NULL, 19, 1, '2018-12-27 16:10:17'),
(261, NULL, NULL, 19, 1, '2018-12-27 16:10:28'),
(262, NULL, NULL, 19, 1, '2018-12-27 16:10:35'),
(263, NULL, NULL, 19, 1, '2018-12-27 16:10:37'),
(264, NULL, NULL, 19, 1, '2018-12-27 16:11:38'),
(265, NULL, NULL, 19, 1, '2018-12-27 16:19:01'),
(266, NULL, NULL, 19, 1, '2018-12-27 18:39:45'),
(267, NULL, NULL, 19, 1, '2018-12-27 18:40:28'),
(268, NULL, NULL, 19, 1, '2018-12-27 18:41:31'),
(269, NULL, NULL, 19, 1, '2018-12-27 18:42:37'),
(270, NULL, NULL, 19, 1, '2018-12-27 18:43:43'),
(271, NULL, NULL, 23, 1, '2018-12-27 18:44:28'),
(272, NULL, NULL, 19, 1, '2018-12-27 18:44:39'),
(273, NULL, NULL, 19, 1, '2018-12-27 18:44:47'),
(274, NULL, NULL, 19, 1, '2018-12-27 18:45:50'),
(275, NULL, NULL, 19, 1, '2018-12-27 18:46:54'),
(276, NULL, NULL, 19, 1, '2018-12-27 18:47:57'),
(277, NULL, NULL, 19, 1, '2018-12-27 18:49:01'),
(278, NULL, NULL, 19, 1, '2018-12-27 18:50:05'),
(279, NULL, NULL, 19, 1, '2018-12-27 18:50:12'),
(280, NULL, NULL, 19, 1, '2018-12-27 18:51:15'),
(281, NULL, NULL, 19, 1, '2018-12-27 18:52:18'),
(282, NULL, NULL, 19, 1, '2018-12-27 18:53:20'),
(283, NULL, NULL, 19, 1, '2018-12-27 19:10:57'),
(284, NULL, NULL, 19, 1, '2018-12-27 19:11:01'),
(285, NULL, NULL, 19, 1, '2018-12-27 19:11:05'),
(286, NULL, NULL, 19, 1, '2018-12-27 19:24:07'),
(287, NULL, NULL, 19, 1, '2018-12-27 19:25:14'),
(288, NULL, NULL, 19, 1, '2018-12-27 19:25:18'),
(289, NULL, NULL, 19, 1, '2018-12-27 19:25:22'),
(290, NULL, NULL, 19, 1, '2018-12-27 19:25:26'),
(291, NULL, NULL, 19, 1, '2018-12-27 19:26:15'),
(292, NULL, NULL, 19, 1, '2018-12-27 19:26:19'),
(293, NULL, NULL, 19, 1, '2018-12-27 19:26:22'),
(294, NULL, NULL, 19, 1, '2018-12-27 19:26:25'),
(295, NULL, NULL, 19, 1, '2018-12-27 19:26:28'),
(296, NULL, NULL, 19, 1, '2018-12-27 19:26:31'),
(297, NULL, NULL, 19, 1, '2018-12-27 19:26:35'),
(298, NULL, NULL, 19, 1, '2018-12-27 19:26:39'),
(299, NULL, NULL, 19, 1, '2018-12-27 19:26:42'),
(300, NULL, NULL, 19, 1, '2018-12-27 19:26:46'),
(301, NULL, NULL, 19, 1, '2018-12-27 19:26:50'),
(302, NULL, NULL, 19, 1, '2018-12-27 19:34:13'),
(303, NULL, NULL, 19, 1, '2018-12-27 19:36:29'),
(304, NULL, NULL, 19, 1, '2018-12-27 19:39:25'),
(305, NULL, NULL, 19, 1, '2018-12-27 19:44:10'),
(306, NULL, NULL, 19, 1, '2018-12-27 19:44:10'),
(307, NULL, NULL, 20, 1, '2018-12-27 19:46:57'),
(308, NULL, NULL, 19, 1, '2018-12-27 19:47:21'),
(309, NULL, NULL, 19, 1, '2018-12-27 19:47:47'),
(310, NULL, NULL, 19, 1, '2018-12-27 19:47:56'),
(311, NULL, NULL, 19, 1, '2018-12-27 22:06:14'),
(312, NULL, NULL, 19, 1, '2018-12-27 22:06:23'),
(313, NULL, NULL, 19, 1, '2018-12-27 22:10:02'),
(314, NULL, NULL, 19, 1, '2018-12-28 00:51:18'),
(315, NULL, NULL, 19, 1, '2018-12-28 08:24:10'),
(316, NULL, NULL, 19, 1, '2018-12-28 08:25:08'),
(317, NULL, NULL, 19, 1, '2018-12-28 08:25:12'),
(318, NULL, NULL, 23, 1, '2018-12-28 09:40:05'),
(319, NULL, NULL, 23, 1, '2018-12-28 13:04:13'),
(320, NULL, NULL, 23, 1, '2018-12-28 13:04:13'),
(321, NULL, NULL, 23, 1, '2018-12-28 13:17:43'),
(322, NULL, NULL, 23, 1, '2018-12-28 13:21:41'),
(323, NULL, NULL, 23, 1, '2018-12-28 13:32:10'),
(324, NULL, NULL, 23, 1, '2018-12-28 13:51:56'),
(325, NULL, NULL, 23, 1, '2018-12-28 14:12:02'),
(326, NULL, NULL, 23, 1, '2018-12-28 14:15:35'),
(327, NULL, NULL, 20, 1, '2018-12-28 15:32:05'),
(328, NULL, NULL, 21, 1, '2018-12-28 15:32:12'),
(329, NULL, NULL, 22, 1, '2018-12-28 15:35:37'),
(330, NULL, NULL, 23, 1, '2018-12-28 15:58:58'),
(331, NULL, NULL, 23, 1, '2018-12-28 15:58:59'),
(332, NULL, NULL, 23, 1, '2018-12-28 16:05:50'),
(333, NULL, NULL, 23, 1, '2018-12-28 16:07:14'),
(334, NULL, NULL, 19, 1, '2018-12-28 16:16:24'),
(335, NULL, NULL, 19, 1, '2018-12-28 16:23:29'),
(336, NULL, NULL, 19, 1, '2018-12-28 16:23:30'),
(337, NULL, NULL, 19, 1, '2018-12-28 16:24:30'),
(338, NULL, NULL, 19, 1, '2018-12-28 16:27:46'),
(339, NULL, NULL, 19, 1, '2018-12-28 16:28:18'),
(340, NULL, NULL, 19, 1, '2018-12-28 16:28:35'),
(341, NULL, NULL, 19, 1, '2018-12-28 16:32:19'),
(342, NULL, NULL, 19, 1, '2018-12-28 16:32:22'),
(343, NULL, NULL, 19, 1, '2018-12-28 16:32:26'),
(344, NULL, NULL, 19, 1, '2018-12-28 16:32:30'),
(345, NULL, NULL, 19, 1, '2018-12-28 16:32:34'),
(346, NULL, NULL, 19, 1, '2018-12-28 16:32:38'),
(347, NULL, NULL, 19, 1, '2018-12-28 16:32:42'),
(348, NULL, NULL, 19, 1, '2018-12-28 16:33:21'),
(349, NULL, NULL, 19, 1, '2018-12-28 16:33:32'),
(350, NULL, NULL, 19, 1, '2018-12-28 16:37:00'),
(351, NULL, NULL, 19, 1, '2018-12-28 16:37:02'),
(352, NULL, NULL, 19, 1, '2018-12-28 16:37:04'),
(353, NULL, NULL, 19, 1, '2018-12-28 16:37:06'),
(354, NULL, NULL, 19, 1, '2018-12-28 16:39:44'),
(355, NULL, NULL, 19, 1, '2018-12-28 16:40:13'),
(356, NULL, NULL, 19, 1, '2018-12-28 16:40:17'),
(357, NULL, NULL, 19, 1, '2018-12-28 16:43:24'),
(358, NULL, NULL, 19, 1, '2018-12-28 16:44:36'),
(359, NULL, NULL, 19, 1, '2018-12-28 16:44:46'),
(360, NULL, NULL, 19, 1, '2018-12-28 16:44:48'),
(361, NULL, NULL, 19, 1, '2018-12-28 16:44:49'),
(362, NULL, NULL, 19, 1, '2018-12-28 16:50:33'),
(363, NULL, NULL, 19, 1, '2018-12-28 16:59:37'),
(364, NULL, NULL, 19, 1, '2018-12-28 17:00:24'),
(365, NULL, NULL, 19, 1, '2018-12-28 17:04:47'),
(366, NULL, NULL, 19, 1, '2018-12-28 17:06:31'),
(367, NULL, NULL, 19, 1, '2018-12-28 17:07:00'),
(368, NULL, NULL, 19, 1, '2018-12-28 17:07:44'),
(369, NULL, NULL, 19, 1, '2018-12-28 17:10:22'),
(370, NULL, NULL, 19, 1, '2018-12-28 17:11:45'),
(371, NULL, NULL, 19, 1, '2018-12-28 17:14:21'),
(372, NULL, NULL, 19, 1, '2018-12-28 17:14:53'),
(373, NULL, NULL, 19, 1, '2018-12-28 17:16:09'),
(374, NULL, NULL, 19, 1, '2018-12-28 17:16:10'),
(375, NULL, NULL, 19, 1, '2018-12-28 17:16:11'),
(376, NULL, NULL, 23, 1, '2018-12-28 17:18:40'),
(377, NULL, NULL, 23, 1, '2018-12-28 17:18:42'),
(378, NULL, NULL, 19, 1, '2018-12-28 17:22:59'),
(379, NULL, NULL, 19, 1, '2018-12-28 17:24:14'),
(380, NULL, NULL, 19, 1, '2018-12-28 17:24:31'),
(381, NULL, NULL, 19, 1, '2018-12-28 17:24:36'),
(382, NULL, NULL, 19, 1, '2018-12-28 17:25:07'),
(383, NULL, NULL, 19, 1, '2018-12-28 17:26:33'),
(384, NULL, NULL, 19, 1, '2018-12-28 17:26:35'),
(385, NULL, NULL, 19, 1, '2018-12-28 17:26:36'),
(386, NULL, NULL, 19, 1, '2018-12-28 17:26:38'),
(387, NULL, NULL, 19, 1, '2018-12-28 17:27:20'),
(388, NULL, NULL, 19, 1, '2018-12-28 17:28:07'),
(389, NULL, NULL, 19, 1, '2018-12-28 17:29:23'),
(390, NULL, NULL, 19, 1, '2018-12-28 17:31:02'),
(391, NULL, NULL, 19, 1, '2018-12-28 17:31:49'),
(392, NULL, NULL, 19, 1, '2018-12-28 17:33:23'),
(393, NULL, NULL, 19, 1, '2018-12-28 17:36:42'),
(394, NULL, NULL, 19, 1, '2018-12-28 17:36:44'),
(395, NULL, NULL, 19, 1, '2018-12-28 17:36:45'),
(396, NULL, NULL, 19, 1, '2018-12-28 17:36:47'),
(397, NULL, NULL, 19, 1, '2018-12-28 17:36:48'),
(398, NULL, NULL, 19, 1, '2018-12-28 17:36:50'),
(399, NULL, NULL, 19, 1, '2018-12-28 17:44:12'),
(400, NULL, NULL, 19, 1, '2018-12-28 17:44:28'),
(401, NULL, NULL, 19, 1, '2018-12-28 17:44:43'),
(402, NULL, NULL, 19, 1, '2018-12-28 17:45:03'),
(403, NULL, NULL, 19, 1, '2018-12-28 17:45:47'),
(404, NULL, NULL, 19, 1, '2018-12-28 17:46:32'),
(405, NULL, NULL, 19, 1, '2018-12-28 17:46:33'),
(406, NULL, NULL, 19, 1, '2018-12-28 17:48:34'),
(407, NULL, NULL, 19, 1, '2018-12-28 17:48:49'),
(408, NULL, NULL, 19, 1, '2018-12-28 17:49:36'),
(409, NULL, NULL, 19, 1, '2018-12-28 17:50:36'),
(410, NULL, NULL, 19, 1, '2018-12-28 17:52:20'),
(411, NULL, NULL, 19, 1, '2018-12-28 17:52:23'),
(412, NULL, NULL, 19, 1, '2018-12-28 18:21:49'),
(413, NULL, NULL, 19, 1, '2018-12-28 18:30:17'),
(414, NULL, NULL, 19, 1, '2018-12-28 18:35:26'),
(415, NULL, NULL, 19, 1, '2018-12-28 18:38:24'),
(416, NULL, NULL, 19, 1, '2018-12-28 18:40:47'),
(417, NULL, NULL, 19, 1, '2018-12-28 18:53:03'),
(418, NULL, NULL, 19, 1, '2018-12-28 18:56:10'),
(419, NULL, NULL, 19, 1, '2018-12-28 18:56:11'),
(420, NULL, NULL, 19, 1, '2018-12-28 18:56:13'),
(421, NULL, NULL, 19, 1, '2018-12-28 18:56:13'),
(422, NULL, NULL, 19, 1, '2018-12-28 19:00:18'),
(423, NULL, NULL, 19, 1, '2018-12-28 19:00:57'),
(424, NULL, NULL, 19, 1, '2018-12-28 19:02:47'),
(425, NULL, NULL, 19, 1, '2018-12-28 19:04:47'),
(426, NULL, NULL, 19, 1, '2018-12-28 19:08:12'),
(427, NULL, NULL, 19, 1, '2018-12-28 19:11:37'),
(428, NULL, NULL, 19, 1, '2018-12-28 19:13:14'),
(429, NULL, NULL, 19, 1, '2018-12-28 19:15:11'),
(430, NULL, NULL, 19, 1, '2018-12-28 19:20:14'),
(431, NULL, NULL, 19, 1, '2018-12-28 19:23:15'),
(432, NULL, NULL, 19, 1, '2018-12-28 19:24:16'),
(433, NULL, NULL, 19, 1, '2018-12-28 19:25:34'),
(434, NULL, NULL, 19, 1, '2018-12-28 19:26:36'),
(435, NULL, NULL, 19, 1, '2018-12-29 05:40:59'),
(436, NULL, NULL, 19, 1, '2018-12-29 05:53:44'),
(437, NULL, NULL, 19, 1, '2018-12-29 05:54:38'),
(438, NULL, NULL, 19, 1, '2018-12-29 06:05:20'),
(439, NULL, NULL, 19, 1, '2018-12-29 06:09:12'),
(440, NULL, NULL, 19, 1, '2018-12-29 06:10:26'),
(441, NULL, NULL, 19, 1, '2018-12-29 06:11:15'),
(442, NULL, NULL, 22, 1, '2018-12-29 06:14:17'),
(443, NULL, NULL, 19, 1, '2018-12-29 06:14:45'),
(444, NULL, NULL, 19, 1, '2018-12-29 14:21:30'),
(445, NULL, NULL, 19, 1, '2018-12-29 14:22:49'),
(446, NULL, NULL, 19, 1, '2018-12-29 14:57:45'),
(447, NULL, NULL, 19, 1, '2018-12-29 15:08:39'),
(448, NULL, NULL, 19, 1, '2018-12-29 15:49:14'),
(449, NULL, NULL, 19, 1, '2018-12-29 15:51:29'),
(450, NULL, NULL, 19, 1, '2018-12-29 15:52:29'),
(451, NULL, NULL, 19, 1, '2018-12-29 15:53:46'),
(452, NULL, NULL, 19, 1, '2018-12-29 15:55:38'),
(453, NULL, NULL, 19, 1, '2018-12-29 15:55:50'),
(454, NULL, NULL, 19, 1, '2018-12-29 15:55:55'),
(455, NULL, NULL, 19, 1, '2018-12-29 15:55:59'),
(456, NULL, NULL, 19, 1, '2018-12-29 15:56:03'),
(457, NULL, NULL, 19, 1, '2018-12-29 15:56:08'),
(458, NULL, NULL, 19, 1, '2018-12-29 15:56:11'),
(459, NULL, NULL, 19, 1, '2018-12-29 15:56:15'),
(460, NULL, NULL, 19, 1, '2018-12-29 15:57:15'),
(461, NULL, NULL, 19, 1, '2018-12-29 16:09:25'),
(462, NULL, NULL, 19, 1, '2018-12-29 16:10:11'),
(463, NULL, NULL, 19, 1, '2018-12-29 16:10:16'),
(464, NULL, NULL, 19, 1, '2018-12-29 16:10:16'),
(465, NULL, NULL, 19, 1, '2018-12-29 16:10:20'),
(466, NULL, NULL, 19, 1, '2018-12-29 16:10:23'),
(467, NULL, NULL, 19, 1, '2018-12-29 16:10:27'),
(468, NULL, NULL, 19, 1, '2018-12-29 16:13:36'),
(469, NULL, NULL, 19, 1, '2018-12-29 16:15:00'),
(470, NULL, NULL, 19, 1, '2018-12-29 16:18:39'),
(471, NULL, NULL, 19, 1, '2018-12-29 16:22:19'),
(472, NULL, NULL, 19, 1, '2018-12-29 16:23:21'),
(473, NULL, NULL, 19, 1, '2018-12-29 16:24:55'),
(474, NULL, NULL, 19, 1, '2018-12-29 16:26:11'),
(475, NULL, NULL, 19, 1, '2018-12-29 16:27:53'),
(476, NULL, NULL, 19, 1, '2018-12-29 16:28:44'),
(477, NULL, NULL, 19, 1, '2018-12-29 16:33:13'),
(478, NULL, NULL, 19, 1, '2018-12-29 16:34:10'),
(479, NULL, NULL, 19, 1, '2018-12-29 16:36:55'),
(480, NULL, NULL, 19, 1, '2018-12-29 16:38:55'),
(481, NULL, NULL, 19, 1, '2018-12-29 16:40:17'),
(482, NULL, NULL, 19, 1, '2018-12-29 16:41:42'),
(483, NULL, NULL, 19, 1, '2018-12-29 16:42:03'),
(484, NULL, NULL, 19, 1, '2018-12-29 16:46:55'),
(485, NULL, NULL, 19, 1, '2018-12-29 16:48:40'),
(486, NULL, NULL, 19, 1, '2018-12-29 16:49:16'),
(487, NULL, NULL, 19, 1, '2018-12-29 16:50:26'),
(488, NULL, NULL, 19, 1, '2018-12-29 16:51:18'),
(489, NULL, NULL, 19, 1, '2018-12-29 16:52:51'),
(490, NULL, NULL, 19, 1, '2018-12-29 16:55:28'),
(491, NULL, NULL, 19, 1, '2018-12-29 16:55:33'),
(492, NULL, NULL, 19, 1, '2018-12-29 17:00:12'),
(493, NULL, NULL, 19, 1, '2018-12-29 17:02:50'),
(494, NULL, NULL, 19, 1, '2018-12-29 17:04:56'),
(495, NULL, NULL, 19, 1, '2018-12-29 17:06:49'),
(496, NULL, NULL, 19, 1, '2018-12-29 17:23:55'),
(497, NULL, NULL, 19, 1, '2018-12-29 17:26:50'),
(498, NULL, NULL, 19, 1, '2018-12-29 17:32:16'),
(499, NULL, NULL, 19, 1, '2018-12-29 17:32:22'),
(500, NULL, NULL, 19, 1, '2018-12-29 17:33:10'),
(501, NULL, NULL, 19, 1, '2018-12-29 17:59:10'),
(502, NULL, NULL, 19, 1, '2018-12-29 18:06:05'),
(503, NULL, NULL, 19, 1, '2018-12-29 18:07:15'),
(504, NULL, NULL, 19, 1, '2018-12-29 18:07:19'),
(505, NULL, NULL, 19, 1, '2018-12-29 18:10:56'),
(506, NULL, NULL, 19, 1, '2018-12-29 18:18:45'),
(507, NULL, NULL, 19, 1, '2018-12-29 18:18:49'),
(508, NULL, NULL, 20, 1, '2018-12-29 18:21:41'),
(509, NULL, NULL, 19, 1, '2018-12-30 05:13:34'),
(510, NULL, NULL, 19, 1, '2018-12-30 05:17:53'),
(511, NULL, NULL, 20, 1, '2018-12-30 05:22:31'),
(512, NULL, NULL, 20, 1, '2018-12-30 05:31:03'),
(513, NULL, NULL, 19, 1, '2018-12-30 05:33:52'),
(514, NULL, NULL, 19, 1, '2018-12-30 05:35:34'),
(515, NULL, NULL, 20, 1, '2018-12-30 06:01:17'),
(516, NULL, NULL, 19, 1, '2018-12-30 06:01:30'),
(517, NULL, NULL, 20, 1, '2018-12-30 06:01:37'),
(518, NULL, NULL, 20, 1, '2018-12-30 06:01:39'),
(519, NULL, NULL, 19, 1, '2018-12-30 06:01:43'),
(520, NULL, NULL, 20, 1, '2018-12-30 06:05:13'),
(521, NULL, NULL, 19, 1, '2018-12-30 06:05:13'),
(522, NULL, NULL, 19, 1, '2018-12-30 06:12:16'),
(523, NULL, NULL, 19, 1, '2018-12-30 06:58:00'),
(524, NULL, NULL, 19, 1, '2018-12-30 07:00:36'),
(525, NULL, NULL, 19, 1, '2018-12-30 07:02:05'),
(526, NULL, NULL, 19, 1, '2018-12-30 07:04:31'),
(527, NULL, NULL, 19, 1, '2018-12-30 07:05:50'),
(528, NULL, NULL, 22, 1, '2018-12-30 07:06:54'),
(529, NULL, NULL, 19, 1, '2018-12-30 07:11:10'),
(530, NULL, NULL, 19, 1, '2018-12-30 07:17:36'),
(531, NULL, NULL, 19, 1, '2018-12-30 09:37:51'),
(532, NULL, NULL, 19, 1, '2018-12-30 09:37:51'),
(533, NULL, NULL, 20, 1, '2018-12-30 09:39:58'),
(534, NULL, NULL, 19, 1, '2018-12-30 09:42:48'),
(535, NULL, NULL, 19, 1, '2018-12-30 10:10:17'),
(536, NULL, NULL, 19, 1, '2018-12-30 10:14:50'),
(537, NULL, NULL, 19, 1, '2018-12-30 10:14:53'),
(538, NULL, NULL, 19, 1, '2018-12-30 10:14:57'),
(539, NULL, NULL, 19, 1, '2018-12-30 10:15:01'),
(540, NULL, NULL, 19, 1, '2018-12-30 10:19:51'),
(541, NULL, NULL, 19, 1, '2018-12-30 10:19:54'),
(542, NULL, NULL, 19, 1, '2018-12-30 10:19:59'),
(543, NULL, NULL, 19, 1, '2018-12-30 10:20:02'),
(544, NULL, NULL, 19, 1, '2018-12-30 10:20:07'),
(545, NULL, NULL, 19, 1, '2018-12-30 10:20:12'),
(546, NULL, NULL, 19, 1, '2018-12-30 10:20:15'),
(547, NULL, NULL, 19, 1, '2018-12-30 10:20:18'),
(548, NULL, NULL, 19, 1, '2018-12-30 10:20:22'),
(549, NULL, NULL, 19, 1, '2018-12-30 10:20:25'),
(550, NULL, NULL, 19, 1, '2018-12-30 10:20:28'),
(551, NULL, NULL, 19, 1, '2018-12-30 10:20:32'),
(552, NULL, NULL, 19, 1, '2018-12-30 10:20:35'),
(553, NULL, NULL, 19, 1, '2018-12-30 10:20:38'),
(554, NULL, NULL, 19, 1, '2018-12-30 10:24:15'),
(555, NULL, NULL, 19, 1, '2018-12-30 10:28:37'),
(556, NULL, NULL, 19, 1, '2018-12-30 10:28:41'),
(557, NULL, NULL, 19, 1, '2018-12-30 10:28:44'),
(558, NULL, NULL, 19, 1, '2018-12-30 10:28:49'),
(559, NULL, NULL, 19, 1, '2018-12-30 10:28:52'),
(560, NULL, NULL, 19, 1, '2018-12-30 10:28:58'),
(561, NULL, NULL, 19, 1, '2018-12-30 10:32:06'),
(562, NULL, NULL, 19, 1, '2018-12-30 10:32:09'),
(563, NULL, NULL, 19, 1, '2018-12-30 10:32:13'),
(564, NULL, NULL, 19, 1, '2018-12-30 10:39:55'),
(565, NULL, NULL, 19, 1, '2018-12-30 10:39:57'),
(566, NULL, NULL, 19, 1, '2018-12-30 10:39:58'),
(567, NULL, NULL, 19, 1, '2018-12-30 10:42:09'),
(568, NULL, NULL, 19, 1, '2018-12-30 10:44:55'),
(569, NULL, NULL, 19, 1, '2018-12-30 10:45:25'),
(570, NULL, NULL, 19, 1, '2018-12-31 03:08:14'),
(571, NULL, NULL, 19, 1, '2018-12-31 08:12:19'),
(572, NULL, NULL, 19, 1, '2018-12-31 08:14:00'),
(573, NULL, NULL, 19, 1, '2018-12-31 08:20:29'),
(574, NULL, NULL, 19, 1, '2018-12-31 08:20:32'),
(575, NULL, NULL, 19, 1, '2018-12-31 08:20:37'),
(576, NULL, NULL, 19, 1, '2018-12-31 08:20:40'),
(577, NULL, NULL, 19, 1, '2018-12-31 08:20:44'),
(578, NULL, NULL, 19, 1, '2018-12-31 08:38:11'),
(579, NULL, NULL, 20, 1, '2018-12-31 08:39:15'),
(580, NULL, NULL, 19, 1, '2018-12-31 08:46:14'),
(581, NULL, NULL, 19, 1, '2018-12-31 08:47:28'),
(582, NULL, NULL, 19, 1, '2018-12-31 08:47:33'),
(583, NULL, NULL, 19, 1, '2018-12-31 08:50:52'),
(584, NULL, NULL, 19, 1, '2018-12-31 08:57:08'),
(585, NULL, NULL, 19, 1, '2018-12-31 08:59:20'),
(586, NULL, NULL, 19, 1, '2018-12-31 08:59:24'),
(587, NULL, NULL, 19, 1, '2018-12-31 09:01:20'),
(588, NULL, NULL, 19, 1, '2018-12-31 09:03:43'),
(589, NULL, NULL, 19, 1, '2018-12-31 09:05:19'),
(590, NULL, NULL, 19, 1, '2018-12-31 09:07:02'),
(591, NULL, NULL, 19, 1, '2018-12-31 09:07:06'),
(592, NULL, NULL, 19, 1, '2018-12-31 09:07:09'),
(593, NULL, NULL, 19, 1, '2018-12-31 09:07:13'),
(594, NULL, NULL, 19, 1, '2018-12-31 09:07:16'),
(595, NULL, NULL, 19, 1, '2018-12-31 09:07:19'),
(596, NULL, NULL, 19, 1, '2018-12-31 09:07:24'),
(597, NULL, NULL, 19, 1, '2018-12-31 09:07:27'),
(598, NULL, NULL, 19, 1, '2018-12-31 09:07:31'),
(599, NULL, NULL, 19, 1, '2018-12-31 09:07:35'),
(600, NULL, NULL, 19, 1, '2018-12-31 13:15:57'),
(601, NULL, NULL, 19, 1, '2018-12-31 13:16:01'),
(602, NULL, NULL, 19, 1, '2018-12-31 13:17:28'),
(603, NULL, NULL, 19, 1, '2018-12-31 13:19:21'),
(604, NULL, NULL, 19, 1, '2018-12-31 13:21:00'),
(605, NULL, NULL, 19, 1, '2018-12-31 13:21:04'),
(606, NULL, NULL, 19, 1, '2018-12-31 13:21:07'),
(607, NULL, NULL, 19, 1, '2018-12-31 13:21:11'),
(608, NULL, NULL, 19, 1, '2018-12-31 13:21:15'),
(609, NULL, NULL, 19, 1, '2018-12-31 13:21:18'),
(610, NULL, NULL, 19, 1, '2018-12-31 13:24:00'),
(611, NULL, NULL, 19, 1, '2018-12-31 13:24:05'),
(612, NULL, NULL, 19, 1, '2018-12-31 13:24:09'),
(613, NULL, NULL, 19, 1, '2018-12-31 13:24:12'),
(614, NULL, NULL, 19, 1, '2018-12-31 13:24:16'),
(615, NULL, NULL, 19, 1, '2018-12-31 13:24:19'),
(616, NULL, NULL, 19, 1, '2018-12-31 13:24:23'),
(617, NULL, NULL, 19, 1, '2018-12-31 13:24:26'),
(618, NULL, NULL, 19, 1, '2018-12-31 13:24:30'),
(619, NULL, NULL, 19, 1, '2018-12-31 13:24:35'),
(620, NULL, NULL, 19, 1, '2018-12-31 13:24:38'),
(621, NULL, NULL, 19, 1, '2018-12-31 13:24:41'),
(622, NULL, NULL, 19, 1, '2018-12-31 13:24:47'),
(623, NULL, NULL, 19, 1, '2018-12-31 13:26:48'),
(624, NULL, NULL, 19, 1, '2018-12-31 13:26:51'),
(625, NULL, NULL, 19, 1, '2018-12-31 13:26:55'),
(626, NULL, NULL, 19, 1, '2018-12-31 13:26:59'),
(627, NULL, NULL, 19, 1, '2018-12-31 13:27:03'),
(628, NULL, NULL, 19, 1, '2018-12-31 13:27:07'),
(629, NULL, NULL, 19, 1, '2018-12-31 13:27:10'),
(630, NULL, NULL, 19, 1, '2018-12-31 13:27:14'),
(631, NULL, NULL, 19, 1, '2018-12-31 13:27:17'),
(632, NULL, NULL, 19, 1, '2018-12-31 13:27:20'),
(633, NULL, NULL, 19, 1, '2018-12-31 13:27:23'),
(634, NULL, NULL, 19, 1, '2018-12-31 13:27:26'),
(635, NULL, NULL, 19, 1, '2018-12-31 13:27:29'),
(636, NULL, NULL, 19, 1, '2018-12-31 13:27:35'),
(637, NULL, NULL, 19, 1, '2018-12-31 13:27:38'),
(638, NULL, NULL, 19, 1, '2018-12-31 13:37:53'),
(639, NULL, NULL, 19, 1, '2018-12-31 13:48:09'),
(640, NULL, NULL, 19, 1, '2018-12-31 14:04:18'),
(641, NULL, NULL, 19, 1, '2018-12-31 14:13:59'),
(642, NULL, NULL, 19, 1, '2018-12-31 14:14:03'),
(643, NULL, NULL, 19, 1, '2018-12-31 14:14:07'),
(644, NULL, NULL, 19, 1, '2018-12-31 14:14:11'),
(645, NULL, NULL, 19, 1, '2018-12-31 14:14:14'),
(646, NULL, NULL, 19, 1, '2018-12-31 14:28:45'),
(647, NULL, NULL, 19, 1, '2018-12-31 14:28:48'),
(648, NULL, NULL, 19, 1, '2018-12-31 14:28:52'),
(649, NULL, NULL, 19, 1, '2018-12-31 14:30:06'),
(650, NULL, NULL, 19, 1, '2018-12-31 14:31:43'),
(651, NULL, NULL, 19, 1, '2018-12-31 14:31:47'),
(652, NULL, NULL, 20, 1, '2018-12-31 14:37:07'),
(653, NULL, NULL, 20, 1, '2018-12-31 14:41:40'),
(654, NULL, NULL, 20, 1, '2018-12-31 14:41:42'),
(655, NULL, NULL, 20, 1, '2018-12-31 14:41:43'),
(656, NULL, NULL, 20, 1, '2018-12-31 14:41:45'),
(657, NULL, NULL, 20, 1, '2018-12-31 14:41:46'),
(658, NULL, NULL, 20, 1, '2018-12-31 14:41:48'),
(659, NULL, NULL, 20, 1, '2018-12-31 14:41:49'),
(660, NULL, NULL, 20, 1, '2018-12-31 14:41:50'),
(661, NULL, NULL, 20, 1, '2018-12-31 14:43:14'),
(662, NULL, NULL, 20, 1, '2018-12-31 14:43:17'),
(663, NULL, NULL, 20, 1, '2018-12-31 14:43:19'),
(664, NULL, NULL, 20, 1, '2018-12-31 14:43:21'),
(665, NULL, NULL, 20, 1, '2018-12-31 14:43:22'),
(666, NULL, NULL, 20, 1, '2018-12-31 14:43:24'),
(667, NULL, NULL, 20, 1, '2018-12-31 14:43:25'),
(668, NULL, NULL, 20, 1, '2018-12-31 14:43:26'),
(669, NULL, NULL, 20, 1, '2018-12-31 14:43:28'),
(670, NULL, NULL, 20, 1, '2018-12-31 14:43:29'),
(671, NULL, NULL, 20, 1, '2018-12-31 14:43:30'),
(672, NULL, NULL, 20, 1, '2018-12-31 14:43:31'),
(673, NULL, NULL, 20, 1, '2018-12-31 14:43:33'),
(674, NULL, NULL, 20, 1, '2018-12-31 14:43:34'),
(675, NULL, NULL, 20, 1, '2018-12-31 14:43:35'),
(676, NULL, NULL, 20, 1, '2018-12-31 14:43:37'),
(677, NULL, NULL, 20, 1, '2018-12-31 14:43:38'),
(678, NULL, NULL, 20, 1, '2018-12-31 14:43:39'),
(679, NULL, NULL, 20, 1, '2018-12-31 14:43:41'),
(680, NULL, NULL, 20, 1, '2018-12-31 14:43:42'),
(681, NULL, NULL, 20, 1, '2018-12-31 14:43:43'),
(682, NULL, NULL, 20, 1, '2018-12-31 14:43:45'),
(683, NULL, NULL, 20, 1, '2018-12-31 14:43:46'),
(684, NULL, NULL, 20, 1, '2018-12-31 14:43:48'),
(685, NULL, NULL, 20, 1, '2018-12-31 14:43:50'),
(686, NULL, NULL, 20, 1, '2018-12-31 14:47:14'),
(687, NULL, NULL, 20, 1, '2018-12-31 14:47:14'),
(688, NULL, NULL, 20, 1, '2018-12-31 14:47:14'),
(689, NULL, NULL, 20, 1, '2018-12-31 14:47:15'),
(690, NULL, NULL, 20, 1, '2018-12-31 14:50:16'),
(691, NULL, NULL, 20, 1, '2018-12-31 15:29:37'),
(692, NULL, NULL, 20, 1, '2018-12-31 15:29:40'),
(693, NULL, NULL, 20, 1, '2018-12-31 16:53:07'),
(694, NULL, NULL, 20, 1, '2018-12-31 18:13:34'),
(695, NULL, NULL, 20, 1, '2018-12-31 18:15:12'),
(696, NULL, NULL, 20, 1, '2018-12-31 18:17:34'),
(697, NULL, NULL, 20, 1, '2018-12-31 18:17:36'),
(698, NULL, NULL, 20, 1, '2018-12-31 18:20:29'),
(699, NULL, NULL, 24, 1, '2018-12-31 18:37:11'),
(700, NULL, NULL, 24, 1, '2018-12-31 18:38:35'),
(701, NULL, NULL, 19, 1, '2019-01-01 00:01:41'),
(702, NULL, NULL, 23, 1, '2019-01-01 00:02:54'),
(703, NULL, NULL, 24, 1, '2019-01-01 00:03:02'),
(704, NULL, NULL, 24, 1, '2019-01-01 05:12:32'),
(705, NULL, NULL, 24, 1, '2019-01-01 05:33:13'),
(706, NULL, NULL, 24, 1, '2019-01-01 05:42:38'),
(707, NULL, NULL, 19, 1, '2019-01-01 05:45:52'),
(708, NULL, NULL, 24, 1, '2019-01-01 05:50:39'),
(709, NULL, NULL, 24, 1, '2019-01-01 05:51:47'),
(710, NULL, NULL, 24, 1, '2019-01-01 05:53:29'),
(711, NULL, NULL, 24, 1, '2019-01-01 05:54:53'),
(712, NULL, NULL, 24, 1, '2019-01-01 05:59:09'),
(713, NULL, NULL, 24, 1, '2019-01-01 06:01:21'),
(714, NULL, NULL, 24, 1, '2019-01-01 06:01:54'),
(715, NULL, NULL, 24, 1, '2019-01-01 06:04:04'),
(716, NULL, NULL, 24, 1, '2019-01-01 06:06:52'),
(717, NULL, NULL, 19, 1, '2019-01-01 06:07:16'),
(718, NULL, NULL, 19, 1, '2019-01-01 06:23:47'),
(719, NULL, NULL, 24, 1, '2019-01-01 06:25:12'),
(720, NULL, NULL, 24, 1, '2019-01-01 06:29:42'),
(721, NULL, NULL, 19, 1, '2019-01-01 06:32:18'),
(722, NULL, NULL, 19, 1, '2019-01-01 06:56:14'),
(723, NULL, NULL, 24, 1, '2019-01-01 06:56:19'),
(724, NULL, NULL, 24, 1, '2019-01-01 07:01:33'),
(725, NULL, NULL, 24, 1, '2019-01-01 07:03:45'),
(726, NULL, NULL, 24, 1, '2019-01-01 07:04:27'),
(727, NULL, NULL, 24, 1, '2019-01-01 07:05:01'),
(728, NULL, NULL, 24, 1, '2019-01-01 07:06:01'),
(729, NULL, NULL, 19, 1, '2019-01-01 07:06:14'),
(730, NULL, NULL, 19, 1, '2019-01-01 07:07:56'),
(731, NULL, NULL, 24, 1, '2019-01-01 07:21:46'),
(732, NULL, NULL, 24, 1, '2019-01-01 12:21:45'),
(733, NULL, NULL, 24, 1, '2019-01-01 12:27:57'),
(734, NULL, NULL, 24, 1, '2019-01-01 12:29:27'),
(735, NULL, NULL, 24, 1, '2019-01-01 12:30:02'),
(736, NULL, NULL, 24, 1, '2019-01-01 12:40:41'),
(737, NULL, NULL, 24, 1, '2019-01-01 12:44:09'),
(738, NULL, NULL, 24, 1, '2019-01-01 12:45:28'),
(739, NULL, NULL, 24, 1, '2019-01-01 12:47:34'),
(740, NULL, NULL, 24, 1, '2019-01-01 12:51:57'),
(741, NULL, NULL, 24, 1, '2019-01-01 12:52:00'),
(742, NULL, NULL, 19, 1, '2019-01-01 12:57:39'),
(743, NULL, NULL, 19, 1, '2019-01-01 14:42:13'),
(744, NULL, NULL, 19, 1, '2019-01-01 14:42:41'),
(745, NULL, NULL, 19, 1, '2019-01-01 14:54:12'),
(746, NULL, NULL, 19, 1, '2019-01-01 14:56:38'),
(747, NULL, NULL, 19, 1, '2019-01-01 15:02:23'),
(748, NULL, NULL, 19, 1, '2019-01-01 15:05:10'),
(749, NULL, NULL, 20, 1, '2019-01-01 15:11:08'),
(750, NULL, NULL, 24, 1, '2019-01-01 15:11:26'),
(751, NULL, NULL, 24, 1, '2019-01-01 15:14:22'),
(752, NULL, NULL, 24, 1, '2019-01-01 15:16:47'),
(753, NULL, NULL, 19, 1, '2019-01-01 15:17:44'),
(754, NULL, NULL, 24, 1, '2019-01-01 15:41:20'),
(755, NULL, NULL, 24, 1, '2019-01-01 15:41:27'),
(756, NULL, NULL, 24, 1, '2019-01-01 15:41:29'),
(757, NULL, NULL, 24, 1, '2019-01-01 15:43:17'),
(758, NULL, NULL, 24, 1, '2019-01-01 15:44:00'),
(759, NULL, NULL, 24, 1, '2019-01-01 15:44:02'),
(760, NULL, NULL, 19, 1, '2019-01-01 15:45:29'),
(761, NULL, NULL, 19, 1, '2019-01-01 15:52:13'),
(762, NULL, NULL, 19, 1, '2019-01-01 16:42:49'),
(763, NULL, NULL, 24, 1, '2019-01-01 19:37:28'),
(764, NULL, NULL, 24, 1, '2019-01-01 19:38:09');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE IF NOT EXISTS `review` (
  `review_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Review id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Review create date',
  `entity_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity id',
  `entity_pk_value` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product id',
  `status_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Status code',
  PRIMARY KEY (`review_id`),
  KEY `REVIEW_ENTITY_ID` (`entity_id`),
  KEY `REVIEW_STATUS_ID` (`status_id`),
  KEY `REVIEW_ENTITY_PK_VALUE` (`entity_pk_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Review base information' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `review_detail`
--

CREATE TABLE IF NOT EXISTS `review_detail` (
  `detail_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Review detail id',
  `review_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Review id',
  `store_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Store id',
  `title` varchar(255) NOT NULL COMMENT 'Title',
  `detail` text NOT NULL COMMENT 'Detail description',
  `nickname` varchar(128) NOT NULL COMMENT 'User nickname',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  PRIMARY KEY (`detail_id`),
  KEY `REVIEW_DETAIL_REVIEW_ID` (`review_id`),
  KEY `REVIEW_DETAIL_STORE_ID` (`store_id`),
  KEY `REVIEW_DETAIL_CUSTOMER_ID` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Review detail information' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `review_entity`
--

CREATE TABLE IF NOT EXISTS `review_entity` (
  `entity_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Review entity id',
  `entity_code` varchar(32) NOT NULL COMMENT 'Review entity code',
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Review entities' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `review_entity`
--

INSERT INTO `review_entity` (`entity_id`, `entity_code`) VALUES
(1, 'product'),
(2, 'customer'),
(3, 'category');

-- --------------------------------------------------------

--
-- Table structure for table `review_entity_summary`
--

CREATE TABLE IF NOT EXISTS `review_entity_summary` (
  `primary_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Summary review entity id',
  `entity_pk_value` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Product id',
  `entity_type` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Entity type id',
  `reviews_count` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Qty of reviews',
  `rating_summary` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Summarized rating',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store id',
  PRIMARY KEY (`primary_id`),
  KEY `REVIEW_ENTITY_SUMMARY_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Review aggregates' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `review_status`
--

CREATE TABLE IF NOT EXISTS `review_status` (
  `status_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Status id',
  `status_code` varchar(32) NOT NULL COMMENT 'Status code',
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Review statuses' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `review_status`
--

INSERT INTO `review_status` (`status_id`, `status_code`) VALUES
(1, 'Approved'),
(2, 'Pending'),
(3, 'Not Approved');

-- --------------------------------------------------------

--
-- Table structure for table `review_store`
--

CREATE TABLE IF NOT EXISTS `review_store` (
  `review_id` bigint(20) unsigned NOT NULL COMMENT 'Review Id',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  PRIMARY KEY (`review_id`,`store_id`),
  KEY `REVIEW_STORE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Review Store';

-- --------------------------------------------------------

--
-- Table structure for table `salesrule`
--

CREATE TABLE IF NOT EXISTS `salesrule` (
  `rule_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `from_date` date DEFAULT NULL COMMENT 'From',
  `to_date` date DEFAULT NULL COMMENT 'To',
  `uses_per_customer` int(11) NOT NULL DEFAULT '0' COMMENT 'Uses Per Customer',
  `is_active` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Is Active',
  `conditions_serialized` mediumtext COMMENT 'Conditions Serialized',
  `actions_serialized` mediumtext COMMENT 'Actions Serialized',
  `stop_rules_processing` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Stop Rules Processing',
  `is_advanced` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Advanced',
  `product_ids` text COMMENT 'Product Ids',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `simple_action` varchar(32) DEFAULT NULL COMMENT 'Simple Action',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `discount_qty` decimal(12,4) DEFAULT NULL COMMENT 'Discount Qty',
  `discount_step` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Discount Step',
  `apply_to_shipping` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Apply To Shipping',
  `times_used` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Times Used',
  `is_rss` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Is Rss',
  `coupon_type` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Coupon Type',
  `use_auto_generation` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Use Auto Generation',
  `uses_per_coupon` int(11) NOT NULL DEFAULT '0' COMMENT 'User Per Coupon',
  `simple_free_shipping` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Simple Free Shipping',
  PRIMARY KEY (`rule_id`),
  KEY `SALESRULE_IS_ACTIVE_SORT_ORDER_TO_DATE_FROM_DATE` (`is_active`,`sort_order`,`to_date`,`from_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `salesrule_coupon`
--

CREATE TABLE IF NOT EXISTS `salesrule_coupon` (
  `coupon_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Coupon Id',
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule Id',
  `code` varchar(255) DEFAULT NULL COMMENT 'Code',
  `usage_limit` int(10) unsigned DEFAULT NULL COMMENT 'Usage Limit',
  `usage_per_customer` int(10) unsigned DEFAULT NULL COMMENT 'Usage Per Customer',
  `times_used` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Times Used',
  `expiration_date` timestamp NULL DEFAULT NULL COMMENT 'Expiration Date',
  `is_primary` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Primary',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Coupon Code Creation Date',
  `type` smallint(6) DEFAULT '0' COMMENT 'Coupon Code Type',
  `generated_by_dotmailer` smallint(6) DEFAULT NULL COMMENT '1 = Generated by dotmailer',
  PRIMARY KEY (`coupon_id`),
  UNIQUE KEY `SALESRULE_COUPON_CODE` (`code`),
  UNIQUE KEY `SALESRULE_COUPON_RULE_ID_IS_PRIMARY` (`rule_id`,`is_primary`),
  KEY `SALESRULE_COUPON_RULE_ID` (`rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Coupon' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `salesrule_coupon_aggregated`
--

CREATE TABLE IF NOT EXISTS `salesrule_coupon_aggregated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date NOT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `coupon_code` varchar(50) DEFAULT NULL COMMENT 'Coupon Code',
  `coupon_uses` int(11) NOT NULL DEFAULT '0' COMMENT 'Coupon Uses',
  `subtotal_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `total_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount',
  `subtotal_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount Actual',
  `discount_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount Actual',
  `total_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount Actual',
  `rule_name` varchar(255) DEFAULT NULL COMMENT 'Rule Name',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALESRULE_COUPON_AGGRED_PERIOD_STORE_ID_ORDER_STS_COUPON_CODE` (`period`,`store_id`,`order_status`,`coupon_code`),
  KEY `SALESRULE_COUPON_AGGREGATED_STORE_ID` (`store_id`),
  KEY `SALESRULE_COUPON_AGGREGATED_RULE_NAME` (`rule_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Coupon Aggregated' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `salesrule_coupon_aggregated_order`
--

CREATE TABLE IF NOT EXISTS `salesrule_coupon_aggregated_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date NOT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `coupon_code` varchar(50) DEFAULT NULL COMMENT 'Coupon Code',
  `coupon_uses` int(11) NOT NULL DEFAULT '0' COMMENT 'Coupon Uses',
  `subtotal_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `total_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount',
  `rule_name` varchar(255) DEFAULT NULL COMMENT 'Rule Name',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_1094D1FBBCBB11704A29DEF3ACC37D2B` (`period`,`store_id`,`order_status`,`coupon_code`),
  KEY `SALESRULE_COUPON_AGGREGATED_ORDER_STORE_ID` (`store_id`),
  KEY `SALESRULE_COUPON_AGGREGATED_ORDER_RULE_NAME` (`rule_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Coupon Aggregated Order' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `salesrule_coupon_aggregated_updated`
--

CREATE TABLE IF NOT EXISTS `salesrule_coupon_aggregated_updated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date NOT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `coupon_code` varchar(50) DEFAULT NULL COMMENT 'Coupon Code',
  `coupon_uses` int(11) NOT NULL DEFAULT '0' COMMENT 'Coupon Uses',
  `subtotal_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `total_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount',
  `subtotal_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount Actual',
  `discount_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount Actual',
  `total_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount Actual',
  `rule_name` varchar(255) DEFAULT NULL COMMENT 'Rule Name',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_7196FA120A4F0F84E1B66605E87E213E` (`period`,`store_id`,`order_status`,`coupon_code`),
  KEY `SALESRULE_COUPON_AGGREGATED_UPDATED_STORE_ID` (`store_id`),
  KEY `SALESRULE_COUPON_AGGREGATED_UPDATED_RULE_NAME` (`rule_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Coupon Aggregated Updated' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `salesrule_coupon_usage`
--

CREATE TABLE IF NOT EXISTS `salesrule_coupon_usage` (
  `coupon_id` int(10) unsigned NOT NULL COMMENT 'Coupon Id',
  `customer_id` int(10) unsigned NOT NULL COMMENT 'Customer Id',
  `times_used` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Times Used',
  PRIMARY KEY (`coupon_id`,`customer_id`),
  KEY `SALESRULE_COUPON_USAGE_CUSTOMER_ID` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Coupon Usage';

-- --------------------------------------------------------

--
-- Table structure for table `salesrule_customer`
--

CREATE TABLE IF NOT EXISTS `salesrule_customer` (
  `rule_customer_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Customer Id',
  `rule_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Rule Id',
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Id',
  `times_used` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Times Used',
  PRIMARY KEY (`rule_customer_id`),
  KEY `SALESRULE_CUSTOMER_RULE_ID_CUSTOMER_ID` (`rule_id`,`customer_id`),
  KEY `SALESRULE_CUSTOMER_CUSTOMER_ID_RULE_ID` (`customer_id`,`rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Customer' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `salesrule_customer_group`
--

CREATE TABLE IF NOT EXISTS `salesrule_customer_group` (
  `rule_id` int(10) unsigned NOT NULL,
  `customer_group_id` int(10) unsigned NOT NULL COMMENT 'Customer Group Id',
  PRIMARY KEY (`rule_id`,`customer_group_id`),
  KEY `SALESRULE_CUSTOMER_GROUP_CUSTOMER_GROUP_ID` (`customer_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Rules To Customer Groups Relations';

-- --------------------------------------------------------

--
-- Table structure for table `salesrule_label`
--

CREATE TABLE IF NOT EXISTS `salesrule_label` (
  `label_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Label Id',
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule Id',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `label` varchar(255) DEFAULT NULL COMMENT 'Label',
  PRIMARY KEY (`label_id`),
  UNIQUE KEY `SALESRULE_LABEL_RULE_ID_STORE_ID` (`rule_id`,`store_id`),
  KEY `SALESRULE_LABEL_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Label' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `salesrule_product_attribute`
--

CREATE TABLE IF NOT EXISTS `salesrule_product_attribute` (
  `rule_id` int(10) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `customer_group_id` int(10) unsigned NOT NULL COMMENT 'Customer Group Id',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute Id',
  PRIMARY KEY (`rule_id`,`website_id`,`customer_group_id`,`attribute_id`),
  KEY `SALESRULE_PRODUCT_ATTRIBUTE_WEBSITE_ID` (`website_id`),
  KEY `SALESRULE_PRODUCT_ATTRIBUTE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `SALESRULE_PRODUCT_ATTRIBUTE_ATTRIBUTE_ID` (`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Product Attribute';

-- --------------------------------------------------------

--
-- Table structure for table `salesrule_website`
--

CREATE TABLE IF NOT EXISTS `salesrule_website` (
  `rule_id` int(10) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  PRIMARY KEY (`rule_id`,`website_id`),
  KEY `SALESRULE_WEBSITE_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Rules To Websites Relations';

-- --------------------------------------------------------

--
-- Table structure for table `sales_bestsellers_aggregated_daily`
--

CREATE TABLE IF NOT EXISTS `sales_bestsellers_aggregated_daily` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty Ordered',
  `rating_pos` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALES_BESTSELLERS_AGGREGATED_DAILY_PERIOD_STORE_ID_PRODUCT_ID` (`period`,`store_id`,`product_id`),
  KEY `SALES_BESTSELLERS_AGGREGATED_DAILY_STORE_ID` (`store_id`),
  KEY `SALES_BESTSELLERS_AGGREGATED_DAILY_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Bestsellers Aggregated Daily' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_bestsellers_aggregated_monthly`
--

CREATE TABLE IF NOT EXISTS `sales_bestsellers_aggregated_monthly` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty Ordered',
  `rating_pos` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALES_BESTSELLERS_AGGREGATED_MONTHLY_PERIOD_STORE_ID_PRODUCT_ID` (`period`,`store_id`,`product_id`),
  KEY `SALES_BESTSELLERS_AGGREGATED_MONTHLY_STORE_ID` (`store_id`),
  KEY `SALES_BESTSELLERS_AGGREGATED_MONTHLY_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Bestsellers Aggregated Monthly' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_bestsellers_aggregated_yearly`
--

CREATE TABLE IF NOT EXISTS `sales_bestsellers_aggregated_yearly` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty Ordered',
  `rating_pos` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALES_BESTSELLERS_AGGREGATED_YEARLY_PERIOD_STORE_ID_PRODUCT_ID` (`period`,`store_id`,`product_id`),
  KEY `SALES_BESTSELLERS_AGGREGATED_YEARLY_STORE_ID` (`store_id`),
  KEY `SALES_BESTSELLERS_AGGREGATED_YEARLY_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Bestsellers Aggregated Yearly' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_creditmemo`
--

CREATE TABLE IF NOT EXISTS `sales_creditmemo` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `adjustment_positive` decimal(12,4) DEFAULT NULL COMMENT 'Adjustment Positive',
  `base_shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Tax Amount',
  `store_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Order Rate',
  `base_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `base_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Order Rate',
  `grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Grand Total',
  `base_adjustment_negative` decimal(12,4) DEFAULT NULL COMMENT 'Base Adjustment Negative',
  `base_subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Incl Tax',
  `shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Amount',
  `subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Incl Tax',
  `adjustment_negative` decimal(12,4) DEFAULT NULL COMMENT 'Adjustment Negative',
  `base_shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Amount',
  `store_to_base_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Base Rate',
  `base_to_global_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `base_adjustment` decimal(12,4) DEFAULT NULL COMMENT 'Base Adjustment',
  `base_subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal',
  `discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Amount',
  `subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal',
  `adjustment` decimal(12,4) DEFAULT NULL COMMENT 'Adjustment',
  `base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `base_adjustment_positive` decimal(12,4) DEFAULT NULL COMMENT 'Base Adjustment Positive',
  `base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Tax Amount',
  `tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Amount',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `email_sent` smallint(5) unsigned DEFAULT NULL COMMENT 'Email Sent',
  `send_email` smallint(5) unsigned DEFAULT NULL COMMENT 'Send Email',
  `creditmemo_status` int(11) DEFAULT NULL COMMENT 'Creditmemo Status',
  `state` int(11) DEFAULT NULL COMMENT 'State',
  `shipping_address_id` int(11) DEFAULT NULL COMMENT 'Shipping Address Id',
  `billing_address_id` int(11) DEFAULT NULL COMMENT 'Billing Address Id',
  `invoice_id` int(11) DEFAULT NULL COMMENT 'Invoice Id',
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `order_currency_code` varchar(3) DEFAULT NULL COMMENT 'Order Currency Code',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `transaction_id` varchar(255) DEFAULT NULL COMMENT 'Transaction Id',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `shipping_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Discount Tax Compensation Amount',
  `base_shipping_discount_tax_compensation_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Discount Tax Compensation Amount',
  `shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Incl Tax',
  `base_shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Incl Tax',
  `discount_description` varchar(255) DEFAULT NULL COMMENT 'Discount Description',
  `customer_note` text COMMENT 'Customer Note',
  `customer_note_notify` smallint(5) unsigned DEFAULT NULL COMMENT 'Customer Note Notify',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `SALES_CREDITMEMO_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `SALES_CREDITMEMO_STORE_ID` (`store_id`),
  KEY `SALES_CREDITMEMO_ORDER_ID` (`order_id`),
  KEY `SALES_CREDITMEMO_CREDITMEMO_STATUS` (`creditmemo_status`),
  KEY `SALES_CREDITMEMO_STATE` (`state`),
  KEY `SALES_CREDITMEMO_CREATED_AT` (`created_at`),
  KEY `SALES_CREDITMEMO_UPDATED_AT` (`updated_at`),
  KEY `SALES_CREDITMEMO_SEND_EMAIL` (`send_email`),
  KEY `SALES_CREDITMEMO_EMAIL_SENT` (`email_sent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Creditmemo' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_creditmemo_comment`
--

CREATE TABLE IF NOT EXISTS `sales_creditmemo_comment` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `is_customer_notified` int(11) DEFAULT NULL COMMENT 'Is Customer Notified',
  `is_visible_on_front` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `comment` text COMMENT 'Comment',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  PRIMARY KEY (`entity_id`),
  KEY `SALES_CREDITMEMO_COMMENT_CREATED_AT` (`created_at`),
  KEY `SALES_CREDITMEMO_COMMENT_PARENT_ID` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Creditmemo Comment' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_creditmemo_grid`
--

CREATE TABLE IF NOT EXISTS `sales_creditmemo_grid` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `order_increment_id` varchar(50) DEFAULT NULL COMMENT 'Order Increment Id',
  `order_created_at` timestamp NULL DEFAULT NULL COMMENT 'Order Created At',
  `billing_name` varchar(255) DEFAULT NULL COMMENT 'Billing Name',
  `state` int(11) DEFAULT NULL COMMENT 'Status',
  `base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `order_status` varchar(32) DEFAULT NULL COMMENT 'Order Status',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `billing_address` varchar(255) DEFAULT NULL COMMENT 'Billing Address',
  `shipping_address` varchar(255) DEFAULT NULL COMMENT 'Shipping Address',
  `customer_name` varchar(128) NOT NULL COMMENT 'Customer Name',
  `customer_email` varchar(128) DEFAULT NULL COMMENT 'Customer Email',
  `customer_group_id` smallint(6) DEFAULT NULL COMMENT 'Customer Group Id',
  `payment_method` varchar(32) DEFAULT NULL COMMENT 'Payment Method',
  `shipping_information` varchar(255) DEFAULT NULL COMMENT 'Shipping Method Name',
  `subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal',
  `shipping_and_handling` decimal(12,4) DEFAULT NULL COMMENT 'Shipping and handling amount',
  `adjustment_positive` decimal(12,4) DEFAULT NULL COMMENT 'Adjustment Positive',
  `adjustment_negative` decimal(12,4) DEFAULT NULL COMMENT 'Adjustment Negative',
  `order_base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Order Grand Total',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `SALES_CREDITMEMO_GRID_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `SALES_CREDITMEMO_GRID_ORDER_INCREMENT_ID` (`order_increment_id`),
  KEY `SALES_CREDITMEMO_GRID_CREATED_AT` (`created_at`),
  KEY `SALES_CREDITMEMO_GRID_UPDATED_AT` (`updated_at`),
  KEY `SALES_CREDITMEMO_GRID_ORDER_CREATED_AT` (`order_created_at`),
  KEY `SALES_CREDITMEMO_GRID_STATE` (`state`),
  KEY `SALES_CREDITMEMO_GRID_BILLING_NAME` (`billing_name`),
  KEY `SALES_CREDITMEMO_GRID_ORDER_STATUS` (`order_status`),
  KEY `SALES_CREDITMEMO_GRID_BASE_GRAND_TOTAL` (`base_grand_total`),
  KEY `SALES_CREDITMEMO_GRID_STORE_ID` (`store_id`),
  KEY `SALES_CREDITMEMO_GRID_ORDER_BASE_GRAND_TOTAL` (`order_base_grand_total`),
  KEY `SALES_CREDITMEMO_GRID_ORDER_ID` (`order_id`),
  FULLTEXT KEY `FTI_32B7BA885941A8254EE84AE650ABDC86` (`increment_id`,`order_increment_id`,`billing_name`,`billing_address`,`shipping_address`,`customer_name`,`customer_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Creditmemo Grid';

-- --------------------------------------------------------

--
-- Table structure for table `sales_creditmemo_item`
--

CREATE TABLE IF NOT EXISTS `sales_creditmemo_item` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `base_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Price',
  `tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Amount',
  `base_row_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total',
  `discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Amount',
  `row_total` decimal(12,4) DEFAULT NULL COMMENT 'Row Total',
  `base_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `base_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Cost',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `product_id` int(11) DEFAULT NULL COMMENT 'Product Id',
  `order_item_id` int(11) DEFAULT NULL COMMENT 'Order Item Id',
  `additional_data` text COMMENT 'Additional Data',
  `description` text COMMENT 'Description',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `tax_ratio` text COMMENT 'Ratio of tax in the creditmemo item over tax of the order item',
  `weee_tax_applied` text COMMENT 'Weee Tax Applied',
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Amount',
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Row Amount',
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Disposition',
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Row Disposition',
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Amount',
  `base_weee_tax_applied_row_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Row Amnt',
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Disposition',
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Row Disposition',
  PRIMARY KEY (`entity_id`),
  KEY `SALES_CREDITMEMO_ITEM_PARENT_ID` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Creditmemo Item' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_invoice`
--

CREATE TABLE IF NOT EXISTS `sales_invoice` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Tax Amount',
  `tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Amount',
  `base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `store_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Order Rate',
  `base_shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Tax Amount',
  `base_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `base_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Order Rate',
  `grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Grand Total',
  `shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Amount',
  `subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Incl Tax',
  `base_subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Incl Tax',
  `store_to_base_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Base Rate',
  `base_shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Amount',
  `total_qty` decimal(12,4) DEFAULT NULL COMMENT 'Total Qty',
  `base_to_global_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal',
  `base_subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal',
  `discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Amount',
  `billing_address_id` int(11) DEFAULT NULL COMMENT 'Billing Address Id',
  `is_used_for_refund` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Used For Refund',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `email_sent` smallint(5) unsigned DEFAULT NULL COMMENT 'Email Sent',
  `send_email` smallint(5) unsigned DEFAULT NULL COMMENT 'Send Email',
  `can_void_flag` smallint(5) unsigned DEFAULT NULL COMMENT 'Can Void Flag',
  `state` int(11) DEFAULT NULL COMMENT 'State',
  `shipping_address_id` int(11) DEFAULT NULL COMMENT 'Shipping Address Id',
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `transaction_id` varchar(255) DEFAULT NULL COMMENT 'Transaction Id',
  `order_currency_code` varchar(3) DEFAULT NULL COMMENT 'Order Currency Code',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `shipping_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Discount Tax Compensation Amount',
  `base_shipping_discount_tax_compensation_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Discount Tax Compensation Amount',
  `shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Incl Tax',
  `base_shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Incl Tax',
  `base_total_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Refunded',
  `discount_description` varchar(255) DEFAULT NULL COMMENT 'Discount Description',
  `customer_note` text COMMENT 'Customer Note',
  `customer_note_notify` smallint(5) unsigned DEFAULT NULL COMMENT 'Customer Note Notify',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `SALES_INVOICE_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `SALES_INVOICE_STORE_ID` (`store_id`),
  KEY `SALES_INVOICE_GRAND_TOTAL` (`grand_total`),
  KEY `SALES_INVOICE_ORDER_ID` (`order_id`),
  KEY `SALES_INVOICE_STATE` (`state`),
  KEY `SALES_INVOICE_CREATED_AT` (`created_at`),
  KEY `SALES_INVOICE_UPDATED_AT` (`updated_at`),
  KEY `SALES_INVOICE_SEND_EMAIL` (`send_email`),
  KEY `SALES_INVOICE_EMAIL_SENT` (`email_sent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Invoice' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_invoiced_aggregated`
--

CREATE TABLE IF NOT EXISTS `sales_invoiced_aggregated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `orders_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Orders Invoiced',
  `invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced',
  `invoiced_captured` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced Captured',
  `invoiced_not_captured` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced Not Captured',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALES_INVOICED_AGGREGATED_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `SALES_INVOICED_AGGREGATED_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Invoiced Aggregated' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_invoiced_aggregated_order`
--

CREATE TABLE IF NOT EXISTS `sales_invoiced_aggregated_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `orders_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Orders Invoiced',
  `invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced',
  `invoiced_captured` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced Captured',
  `invoiced_not_captured` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced Not Captured',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALES_INVOICED_AGGREGATED_ORDER_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `SALES_INVOICED_AGGREGATED_ORDER_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Invoiced Aggregated Order' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_invoice_comment`
--

CREATE TABLE IF NOT EXISTS `sales_invoice_comment` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `is_customer_notified` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Customer Notified',
  `is_visible_on_front` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `comment` text COMMENT 'Comment',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  PRIMARY KEY (`entity_id`),
  KEY `SALES_INVOICE_COMMENT_CREATED_AT` (`created_at`),
  KEY `SALES_INVOICE_COMMENT_PARENT_ID` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Invoice Comment' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_invoice_grid`
--

CREATE TABLE IF NOT EXISTS `sales_invoice_grid` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `state` int(11) DEFAULT NULL COMMENT 'State',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `store_name` varchar(255) DEFAULT NULL COMMENT 'Store Name',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `order_increment_id` varchar(50) DEFAULT NULL COMMENT 'Order Increment Id',
  `order_created_at` timestamp NULL DEFAULT NULL COMMENT 'Order Created At',
  `customer_name` varchar(255) DEFAULT NULL COMMENT 'Customer Name',
  `customer_email` varchar(255) DEFAULT NULL COMMENT 'Customer Email',
  `customer_group_id` int(11) DEFAULT NULL,
  `payment_method` varchar(128) DEFAULT NULL COMMENT 'Payment Method',
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `order_currency_code` varchar(3) DEFAULT NULL COMMENT 'Order Currency Code',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `billing_name` varchar(255) DEFAULT NULL COMMENT 'Billing Name',
  `billing_address` varchar(255) DEFAULT NULL COMMENT 'Billing Address',
  `shipping_address` varchar(255) DEFAULT NULL COMMENT 'Shipping Address',
  `shipping_information` varchar(255) DEFAULT NULL COMMENT 'Shipping Method Name',
  `subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal',
  `shipping_and_handling` decimal(12,4) DEFAULT NULL COMMENT 'Shipping and handling amount',
  `grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Grand Total',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Grand Total',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `SALES_INVOICE_GRID_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `SALES_INVOICE_GRID_STORE_ID` (`store_id`),
  KEY `SALES_INVOICE_GRID_GRAND_TOTAL` (`grand_total`),
  KEY `SALES_INVOICE_GRID_ORDER_ID` (`order_id`),
  KEY `SALES_INVOICE_GRID_STATE` (`state`),
  KEY `SALES_INVOICE_GRID_ORDER_INCREMENT_ID` (`order_increment_id`),
  KEY `SALES_INVOICE_GRID_CREATED_AT` (`created_at`),
  KEY `SALES_INVOICE_GRID_UPDATED_AT` (`updated_at`),
  KEY `SALES_INVOICE_GRID_ORDER_CREATED_AT` (`order_created_at`),
  KEY `SALES_INVOICE_GRID_BILLING_NAME` (`billing_name`),
  KEY `SALES_INVOICE_GRID_BASE_GRAND_TOTAL` (`base_grand_total`),
  FULLTEXT KEY `FTI_95D9C924DD6A8734EB8B5D01D60F90DE` (`increment_id`,`order_increment_id`,`billing_name`,`billing_address`,`shipping_address`,`customer_name`,`customer_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Invoice Grid';

-- --------------------------------------------------------

--
-- Table structure for table `sales_invoice_item`
--

CREATE TABLE IF NOT EXISTS `sales_invoice_item` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `base_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Price',
  `tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Amount',
  `base_row_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total',
  `discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Amount',
  `row_total` decimal(12,4) DEFAULT NULL COMMENT 'Row Total',
  `base_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `base_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Cost',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `product_id` int(11) DEFAULT NULL COMMENT 'Product Id',
  `order_item_id` int(11) DEFAULT NULL COMMENT 'Order Item Id',
  `additional_data` text COMMENT 'Additional Data',
  `description` text COMMENT 'Description',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `tax_ratio` text COMMENT 'Ratio of tax invoiced over tax of the order item',
  `weee_tax_applied` text COMMENT 'Weee Tax Applied',
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Amount',
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Row Amount',
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Disposition',
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Row Disposition',
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Amount',
  `base_weee_tax_applied_row_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Row Amnt',
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Disposition',
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Row Disposition',
  PRIMARY KEY (`entity_id`),
  KEY `SALES_INVOICE_ITEM_PARENT_ID` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Invoice Item' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_order`
--

CREATE TABLE IF NOT EXISTS `sales_order` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `state` varchar(32) DEFAULT NULL COMMENT 'State',
  `status` varchar(32) DEFAULT NULL COMMENT 'Status',
  `coupon_code` varchar(255) DEFAULT NULL COMMENT 'Coupon Code',
  `protect_code` varchar(255) DEFAULT NULL COMMENT 'Protect Code',
  `shipping_description` varchar(255) DEFAULT NULL COMMENT 'Shipping Description',
  `is_virtual` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Virtual',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `base_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `base_discount_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Canceled',
  `base_discount_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Invoiced',
  `base_discount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Refunded',
  `base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `base_shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Amount',
  `base_shipping_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Canceled',
  `base_shipping_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Invoiced',
  `base_shipping_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Refunded',
  `base_shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Tax Amount',
  `base_shipping_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Tax Refunded',
  `base_subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal',
  `base_subtotal_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Canceled',
  `base_subtotal_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Invoiced',
  `base_subtotal_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Refunded',
  `base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `base_tax_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Canceled',
  `base_tax_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Invoiced',
  `base_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Refunded',
  `base_to_global_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `base_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Order Rate',
  `base_total_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Canceled',
  `base_total_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Invoiced',
  `base_total_invoiced_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Invoiced Cost',
  `base_total_offline_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Offline Refunded',
  `base_total_online_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Online Refunded',
  `base_total_paid` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Paid',
  `base_total_qty_ordered` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Qty Ordered',
  `base_total_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Refunded',
  `discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Amount',
  `discount_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Discount Canceled',
  `discount_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Discount Invoiced',
  `discount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Discount Refunded',
  `grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Grand Total',
  `shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Amount',
  `shipping_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Canceled',
  `shipping_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Invoiced',
  `shipping_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Refunded',
  `shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Tax Amount',
  `shipping_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Tax Refunded',
  `store_to_base_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Base Rate',
  `store_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Order Rate',
  `subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal',
  `subtotal_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Canceled',
  `subtotal_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Invoiced',
  `subtotal_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Refunded',
  `tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Amount',
  `tax_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Tax Canceled',
  `tax_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Tax Invoiced',
  `tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Tax Refunded',
  `total_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Total Canceled',
  `total_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Total Invoiced',
  `total_offline_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Total Offline Refunded',
  `total_online_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Total Online Refunded',
  `total_paid` decimal(12,4) DEFAULT NULL COMMENT 'Total Paid',
  `total_qty_ordered` decimal(12,4) DEFAULT NULL COMMENT 'Total Qty Ordered',
  `total_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Total Refunded',
  `can_ship_partially` smallint(5) unsigned DEFAULT NULL COMMENT 'Can Ship Partially',
  `can_ship_partially_item` smallint(5) unsigned DEFAULT NULL COMMENT 'Can Ship Partially Item',
  `customer_is_guest` smallint(5) unsigned DEFAULT NULL COMMENT 'Customer Is Guest',
  `customer_note_notify` smallint(5) unsigned DEFAULT NULL COMMENT 'Customer Note Notify',
  `billing_address_id` int(11) DEFAULT NULL COMMENT 'Billing Address Id',
  `customer_group_id` int(11) DEFAULT NULL,
  `edit_increment` int(11) DEFAULT NULL COMMENT 'Edit Increment',
  `email_sent` smallint(5) unsigned DEFAULT NULL COMMENT 'Email Sent',
  `send_email` smallint(5) unsigned DEFAULT NULL COMMENT 'Send Email',
  `forced_shipment_with_invoice` smallint(5) unsigned DEFAULT NULL COMMENT 'Forced Do Shipment With Invoice',
  `payment_auth_expiration` int(11) DEFAULT NULL COMMENT 'Payment Authorization Expiration',
  `quote_address_id` int(11) DEFAULT NULL COMMENT 'Quote Address Id',
  `quote_id` int(11) DEFAULT NULL COMMENT 'Quote Id',
  `shipping_address_id` int(11) DEFAULT NULL COMMENT 'Shipping Address Id',
  `adjustment_negative` decimal(12,4) DEFAULT NULL COMMENT 'Adjustment Negative',
  `adjustment_positive` decimal(12,4) DEFAULT NULL COMMENT 'Adjustment Positive',
  `base_adjustment_negative` decimal(12,4) DEFAULT NULL COMMENT 'Base Adjustment Negative',
  `base_adjustment_positive` decimal(12,4) DEFAULT NULL COMMENT 'Base Adjustment Positive',
  `base_shipping_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Discount Amount',
  `base_subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Incl Tax',
  `base_total_due` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Due',
  `payment_authorization_amount` decimal(12,4) DEFAULT NULL COMMENT 'Payment Authorization Amount',
  `shipping_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Discount Amount',
  `subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Incl Tax',
  `total_due` decimal(12,4) DEFAULT NULL COMMENT 'Total Due',
  `weight` decimal(12,4) DEFAULT NULL COMMENT 'Weight',
  `customer_dob` datetime DEFAULT NULL COMMENT 'Customer Dob',
  `increment_id` varchar(32) DEFAULT NULL COMMENT 'Increment Id',
  `applied_rule_ids` varchar(128) DEFAULT NULL COMMENT 'Applied Rule Ids',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `customer_email` varchar(128) DEFAULT NULL COMMENT 'Customer Email',
  `customer_firstname` varchar(128) DEFAULT NULL COMMENT 'Customer Firstname',
  `customer_lastname` varchar(128) DEFAULT NULL COMMENT 'Customer Lastname',
  `customer_middlename` varchar(128) DEFAULT NULL COMMENT 'Customer Middlename',
  `customer_prefix` varchar(32) DEFAULT NULL COMMENT 'Customer Prefix',
  `customer_suffix` varchar(32) DEFAULT NULL COMMENT 'Customer Suffix',
  `customer_taxvat` varchar(32) DEFAULT NULL COMMENT 'Customer Taxvat',
  `discount_description` varchar(255) DEFAULT NULL COMMENT 'Discount Description',
  `ext_customer_id` varchar(32) DEFAULT NULL COMMENT 'Ext Customer Id',
  `ext_order_id` varchar(32) DEFAULT NULL COMMENT 'Ext Order Id',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `hold_before_state` varchar(32) DEFAULT NULL COMMENT 'Hold Before State',
  `hold_before_status` varchar(32) DEFAULT NULL COMMENT 'Hold Before Status',
  `order_currency_code` varchar(3) DEFAULT NULL COMMENT 'Order Currency Code',
  `original_increment_id` varchar(32) DEFAULT NULL COMMENT 'Original Increment Id',
  `relation_child_id` varchar(32) DEFAULT NULL COMMENT 'Relation Child Id',
  `relation_child_real_id` varchar(32) DEFAULT NULL COMMENT 'Relation Child Real Id',
  `relation_parent_id` varchar(32) DEFAULT NULL COMMENT 'Relation Parent Id',
  `relation_parent_real_id` varchar(32) DEFAULT NULL COMMENT 'Relation Parent Real Id',
  `remote_ip` varchar(45) DEFAULT NULL COMMENT 'Remote Ip',
  `shipping_method` varchar(120) DEFAULT NULL,
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `store_name` varchar(32) DEFAULT NULL COMMENT 'Store Name',
  `x_forwarded_for` varchar(32) DEFAULT NULL COMMENT 'X Forwarded For',
  `customer_note` text COMMENT 'Customer Note',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `total_item_count` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Total Item Count',
  `customer_gender` int(11) DEFAULT NULL COMMENT 'Customer Gender',
  `discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `shipping_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Discount Tax Compensation Amount',
  `base_shipping_discount_tax_compensation_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Discount Tax Compensation Amount',
  `discount_tax_compensation_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Invoiced',
  `base_discount_tax_compensation_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Invoiced',
  `discount_tax_compensation_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Refunded',
  `base_discount_tax_compensation_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Refunded',
  `shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Incl Tax',
  `base_shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Incl Tax',
  `coupon_rule_name` varchar(255) DEFAULT NULL COMMENT 'Coupon Sales Rule Name',
  `paypal_ipn_customer_notified` int(11) DEFAULT '0' COMMENT 'Paypal Ipn Customer Notified',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `SALES_ORDER_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `SALES_ORDER_STATUS` (`status`),
  KEY `SALES_ORDER_STATE` (`state`),
  KEY `SALES_ORDER_STORE_ID` (`store_id`),
  KEY `SALES_ORDER_CREATED_AT` (`created_at`),
  KEY `SALES_ORDER_CUSTOMER_ID` (`customer_id`),
  KEY `SALES_ORDER_EXT_ORDER_ID` (`ext_order_id`),
  KEY `SALES_ORDER_QUOTE_ID` (`quote_id`),
  KEY `SALES_ORDER_UPDATED_AT` (`updated_at`),
  KEY `SALES_ORDER_SEND_EMAIL` (`send_email`),
  KEY `SALES_ORDER_EMAIL_SENT` (`email_sent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_order_address`
--

CREATE TABLE IF NOT EXISTS `sales_order_address` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Id',
  `customer_address_id` int(11) DEFAULT NULL COMMENT 'Customer Address Id',
  `quote_address_id` int(11) DEFAULT NULL COMMENT 'Quote Address Id',
  `region_id` int(11) DEFAULT NULL COMMENT 'Region Id',
  `customer_id` int(11) DEFAULT NULL COMMENT 'Customer Id',
  `fax` varchar(255) DEFAULT NULL COMMENT 'Fax',
  `region` varchar(255) DEFAULT NULL COMMENT 'Region',
  `postcode` varchar(255) DEFAULT NULL COMMENT 'Postcode',
  `lastname` varchar(255) DEFAULT NULL COMMENT 'Lastname',
  `street` varchar(255) DEFAULT NULL COMMENT 'Street',
  `city` varchar(255) DEFAULT NULL COMMENT 'City',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `telephone` varchar(255) DEFAULT NULL COMMENT 'Phone Number',
  `country_id` varchar(2) DEFAULT NULL COMMENT 'Country Id',
  `firstname` varchar(255) DEFAULT NULL COMMENT 'Firstname',
  `address_type` varchar(255) DEFAULT NULL COMMENT 'Address Type',
  `prefix` varchar(255) DEFAULT NULL COMMENT 'Prefix',
  `middlename` varchar(255) DEFAULT NULL COMMENT 'Middlename',
  `suffix` varchar(255) DEFAULT NULL COMMENT 'Suffix',
  `company` varchar(255) DEFAULT NULL COMMENT 'Company',
  `vat_id` text COMMENT 'Vat Id',
  `vat_is_valid` smallint(6) DEFAULT NULL COMMENT 'Vat Is Valid',
  `vat_request_id` text COMMENT 'Vat Request Id',
  `vat_request_date` text COMMENT 'Vat Request Date',
  `vat_request_success` smallint(6) DEFAULT NULL COMMENT 'Vat Request Success',
  PRIMARY KEY (`entity_id`),
  KEY `SALES_ORDER_ADDRESS_PARENT_ID` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order Address' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_order_aggregated_created`
--

CREATE TABLE IF NOT EXISTS `sales_order_aggregated_created` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `total_qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Qty Ordered',
  `total_qty_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Qty Invoiced',
  `total_income_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Income Amount',
  `total_revenue_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Revenue Amount',
  `total_profit_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Profit Amount',
  `total_invoiced_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Invoiced Amount',
  `total_canceled_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Canceled Amount',
  `total_paid_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Paid Amount',
  `total_refunded_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Refunded Amount',
  `total_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Tax Amount',
  `total_tax_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Tax Amount Actual',
  `total_shipping_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Shipping Amount',
  `total_shipping_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Shipping Amount Actual',
  `total_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Discount Amount',
  `total_discount_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Discount Amount Actual',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALES_ORDER_AGGREGATED_CREATED_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `SALES_ORDER_AGGREGATED_CREATED_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Aggregated Created' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_order_aggregated_updated`
--

CREATE TABLE IF NOT EXISTS `sales_order_aggregated_updated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `total_qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Qty Ordered',
  `total_qty_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Qty Invoiced',
  `total_income_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Income Amount',
  `total_revenue_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Revenue Amount',
  `total_profit_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Profit Amount',
  `total_invoiced_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Invoiced Amount',
  `total_canceled_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Canceled Amount',
  `total_paid_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Paid Amount',
  `total_refunded_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Refunded Amount',
  `total_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Tax Amount',
  `total_tax_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Tax Amount Actual',
  `total_shipping_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Shipping Amount',
  `total_shipping_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Shipping Amount Actual',
  `total_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Discount Amount',
  `total_discount_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Discount Amount Actual',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALES_ORDER_AGGREGATED_UPDATED_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `SALES_ORDER_AGGREGATED_UPDATED_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Aggregated Updated' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_order_grid`
--

CREATE TABLE IF NOT EXISTS `sales_order_grid` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `status` varchar(32) DEFAULT NULL COMMENT 'Status',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `store_name` varchar(255) DEFAULT NULL COMMENT 'Store Name',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `base_total_paid` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Paid',
  `grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Grand Total',
  `total_paid` decimal(12,4) DEFAULT NULL COMMENT 'Total Paid',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `order_currency_code` varchar(255) DEFAULT NULL COMMENT 'Order Currency Code',
  `shipping_name` varchar(255) DEFAULT NULL COMMENT 'Shipping Name',
  `billing_name` varchar(255) DEFAULT NULL COMMENT 'Billing Name',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `billing_address` varchar(255) DEFAULT NULL COMMENT 'Billing Address',
  `shipping_address` varchar(255) DEFAULT NULL COMMENT 'Shipping Address',
  `shipping_information` varchar(255) DEFAULT NULL COMMENT 'Shipping Method Name',
  `customer_email` varchar(255) DEFAULT NULL COMMENT 'Customer Email',
  `customer_group` varchar(255) DEFAULT NULL COMMENT 'Customer Group',
  `subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal',
  `shipping_and_handling` decimal(12,4) DEFAULT NULL COMMENT 'Shipping and handling amount',
  `customer_name` varchar(255) DEFAULT NULL COMMENT 'Customer Name',
  `payment_method` varchar(255) DEFAULT NULL COMMENT 'Payment Method',
  `total_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Total Refunded',
  `signifyd_guarantee_status` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `SALES_ORDER_GRID_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `SALES_ORDER_GRID_STATUS` (`status`),
  KEY `SALES_ORDER_GRID_STORE_ID` (`store_id`),
  KEY `SALES_ORDER_GRID_BASE_GRAND_TOTAL` (`base_grand_total`),
  KEY `SALES_ORDER_GRID_BASE_TOTAL_PAID` (`base_total_paid`),
  KEY `SALES_ORDER_GRID_GRAND_TOTAL` (`grand_total`),
  KEY `SALES_ORDER_GRID_TOTAL_PAID` (`total_paid`),
  KEY `SALES_ORDER_GRID_SHIPPING_NAME` (`shipping_name`),
  KEY `SALES_ORDER_GRID_BILLING_NAME` (`billing_name`),
  KEY `SALES_ORDER_GRID_CREATED_AT` (`created_at`),
  KEY `SALES_ORDER_GRID_CUSTOMER_ID` (`customer_id`),
  KEY `SALES_ORDER_GRID_UPDATED_AT` (`updated_at`),
  FULLTEXT KEY `FTI_65B9E9925EC58F0C7C2E2F6379C233E7` (`increment_id`,`billing_name`,`shipping_name`,`shipping_address`,`billing_address`,`customer_name`,`customer_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order Grid';

-- --------------------------------------------------------

--
-- Table structure for table `sales_order_item`
--

CREATE TABLE IF NOT EXISTS `sales_order_item` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Item Id',
  `order_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Order Id',
  `parent_item_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Item Id',
  `quote_item_id` int(10) unsigned DEFAULT NULL COMMENT 'Quote Item Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `product_type` varchar(255) DEFAULT NULL COMMENT 'Product Type',
  `product_options` text COMMENT 'Product Options',
  `weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Weight',
  `is_virtual` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Virtual',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `applied_rule_ids` text COMMENT 'Applied Rule Ids',
  `additional_data` text COMMENT 'Additional Data',
  `is_qty_decimal` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Qty Decimal',
  `no_discount` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'No Discount',
  `qty_backordered` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Backordered',
  `qty_canceled` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Canceled',
  `qty_invoiced` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Invoiced',
  `qty_ordered` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Ordered',
  `qty_refunded` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Refunded',
  `qty_shipped` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Shipped',
  `base_cost` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Cost',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Price',
  `original_price` decimal(12,4) DEFAULT NULL COMMENT 'Original Price',
  `base_original_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Original Price',
  `tax_percent` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Percent',
  `tax_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Amount',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Tax Amount',
  `tax_invoiced` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Invoiced',
  `base_tax_invoiced` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Tax Invoiced',
  `discount_percent` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Percent',
  `discount_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Amount',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Discount Amount',
  `discount_invoiced` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Invoiced',
  `base_discount_invoiced` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Discount Invoiced',
  `amount_refunded` decimal(12,4) DEFAULT '0.0000' COMMENT 'Amount Refunded',
  `base_amount_refunded` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Amount Refunded',
  `row_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Row Total',
  `base_row_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Row Total',
  `row_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Row Invoiced',
  `base_row_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Row Invoiced',
  `row_weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Row Weight',
  `base_tax_before_discount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Before Discount',
  `tax_before_discount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Before Discount',
  `ext_order_item_id` varchar(255) DEFAULT NULL COMMENT 'Ext Order Item Id',
  `locked_do_invoice` smallint(5) unsigned DEFAULT NULL COMMENT 'Locked Do Invoice',
  `locked_do_ship` smallint(5) unsigned DEFAULT NULL COMMENT 'Locked Do Ship',
  `price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `discount_tax_compensation_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Invoiced',
  `base_discount_tax_compensation_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Invoiced',
  `discount_tax_compensation_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Refunded',
  `base_discount_tax_compensation_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Refunded',
  `tax_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Tax Canceled',
  `discount_tax_compensation_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Canceled',
  `tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Tax Refunded',
  `base_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Refunded',
  `discount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Discount Refunded',
  `base_discount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Refunded',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  `gift_message_available` int(11) DEFAULT NULL COMMENT 'Gift Message Available',
  `free_shipping` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Free Shipping',
  `weee_tax_applied` text COMMENT 'Weee Tax Applied',
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Amount',
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Row Amount',
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Disposition',
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Row Disposition',
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Amount',
  `base_weee_tax_applied_row_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Row Amnt',
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Disposition',
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Row Disposition',
  PRIMARY KEY (`item_id`),
  KEY `SALES_ORDER_ITEM_ORDER_ID` (`order_id`),
  KEY `SALES_ORDER_ITEM_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order Item' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_order_payment`
--

CREATE TABLE IF NOT EXISTS `sales_order_payment` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `base_shipping_captured` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Captured',
  `shipping_captured` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Captured',
  `amount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Amount Refunded',
  `base_amount_paid` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Paid',
  `amount_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Amount Canceled',
  `base_amount_authorized` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Authorized',
  `base_amount_paid_online` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Paid Online',
  `base_amount_refunded_online` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Refunded Online',
  `base_shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Amount',
  `shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Amount',
  `amount_paid` decimal(12,4) DEFAULT NULL COMMENT 'Amount Paid',
  `amount_authorized` decimal(12,4) DEFAULT NULL COMMENT 'Amount Authorized',
  `base_amount_ordered` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Ordered',
  `base_shipping_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Refunded',
  `shipping_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Refunded',
  `base_amount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Refunded',
  `amount_ordered` decimal(12,4) DEFAULT NULL COMMENT 'Amount Ordered',
  `base_amount_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Canceled',
  `quote_payment_id` int(11) DEFAULT NULL COMMENT 'Quote Payment Id',
  `additional_data` text COMMENT 'Additional Data',
  `cc_exp_month` varchar(12) DEFAULT NULL COMMENT 'Cc Exp Month',
  `cc_ss_start_year` varchar(12) DEFAULT NULL COMMENT 'Cc Ss Start Year',
  `echeck_bank_name` varchar(128) DEFAULT NULL COMMENT 'Echeck Bank Name',
  `method` varchar(128) DEFAULT NULL COMMENT 'Method',
  `cc_debug_request_body` varchar(32) DEFAULT NULL COMMENT 'Cc Debug Request Body',
  `cc_secure_verify` varchar(32) DEFAULT NULL COMMENT 'Cc Secure Verify',
  `protection_eligibility` varchar(32) DEFAULT NULL COMMENT 'Protection Eligibility',
  `cc_approval` varchar(32) DEFAULT NULL COMMENT 'Cc Approval',
  `cc_last_4` varchar(100) DEFAULT NULL COMMENT 'Cc Last 4',
  `cc_status_description` varchar(32) DEFAULT NULL COMMENT 'Cc Status Description',
  `echeck_type` varchar(32) DEFAULT NULL COMMENT 'Echeck Type',
  `cc_debug_response_serialized` varchar(32) DEFAULT NULL COMMENT 'Cc Debug Response Serialized',
  `cc_ss_start_month` varchar(128) DEFAULT NULL COMMENT 'Cc Ss Start Month',
  `echeck_account_type` varchar(255) DEFAULT NULL COMMENT 'Echeck Account Type',
  `last_trans_id` varchar(32) DEFAULT NULL COMMENT 'Last Trans Id',
  `cc_cid_status` varchar(32) DEFAULT NULL COMMENT 'Cc Cid Status',
  `cc_owner` varchar(128) DEFAULT NULL COMMENT 'Cc Owner',
  `cc_type` varchar(32) DEFAULT NULL COMMENT 'Cc Type',
  `po_number` varchar(32) DEFAULT NULL COMMENT 'Po Number',
  `cc_exp_year` varchar(4) DEFAULT NULL COMMENT 'Cc Exp Year',
  `cc_status` varchar(4) DEFAULT NULL COMMENT 'Cc Status',
  `echeck_routing_number` varchar(32) DEFAULT NULL COMMENT 'Echeck Routing Number',
  `account_status` varchar(32) DEFAULT NULL COMMENT 'Account Status',
  `anet_trans_method` varchar(32) DEFAULT NULL COMMENT 'Anet Trans Method',
  `cc_debug_response_body` varchar(32) DEFAULT NULL COMMENT 'Cc Debug Response Body',
  `cc_ss_issue` varchar(32) DEFAULT NULL COMMENT 'Cc Ss Issue',
  `echeck_account_name` varchar(32) DEFAULT NULL COMMENT 'Echeck Account Name',
  `cc_avs_status` varchar(32) DEFAULT NULL COMMENT 'Cc Avs Status',
  `cc_number_enc` varchar(128) DEFAULT NULL,
  `cc_trans_id` varchar(32) DEFAULT NULL COMMENT 'Cc Trans Id',
  `address_status` varchar(32) DEFAULT NULL COMMENT 'Address Status',
  `additional_information` text COMMENT 'Additional Information',
  PRIMARY KEY (`entity_id`),
  KEY `SALES_ORDER_PAYMENT_PARENT_ID` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order Payment' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_order_status`
--

CREATE TABLE IF NOT EXISTS `sales_order_status` (
  `status` varchar(32) NOT NULL COMMENT 'Status',
  `label` varchar(128) NOT NULL COMMENT 'Label',
  PRIMARY KEY (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Status Table';

--
-- Dumping data for table `sales_order_status`
--

INSERT INTO `sales_order_status` (`status`, `label`) VALUES
('canceled', 'Canceled'),
('closed', 'Closed'),
('complete', 'Complete'),
('fraud', 'Suspected Fraud'),
('holded', 'On Hold'),
('payment_review', 'Payment Review'),
('paypal_canceled_reversal', 'PayPal Canceled Reversal'),
('paypal_reversed', 'PayPal Reversed'),
('pending', 'Pending'),
('pending_payment', 'Pending Payment'),
('pending_paypal', 'Pending PayPal'),
('processing', 'Processing');

-- --------------------------------------------------------

--
-- Table structure for table `sales_order_status_history`
--

CREATE TABLE IF NOT EXISTS `sales_order_status_history` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `is_customer_notified` int(11) DEFAULT NULL COMMENT 'Is Customer Notified',
  `is_visible_on_front` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `comment` text COMMENT 'Comment',
  `status` varchar(32) DEFAULT NULL COMMENT 'Status',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `entity_name` varchar(32) DEFAULT NULL COMMENT 'Shows what entity history is bind to.',
  PRIMARY KEY (`entity_id`),
  KEY `SALES_ORDER_STATUS_HISTORY_PARENT_ID` (`parent_id`),
  KEY `SALES_ORDER_STATUS_HISTORY_CREATED_AT` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order Status History' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_order_status_label`
--

CREATE TABLE IF NOT EXISTS `sales_order_status_label` (
  `status` varchar(32) NOT NULL COMMENT 'Status',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `label` varchar(128) NOT NULL COMMENT 'Label',
  PRIMARY KEY (`status`,`store_id`),
  KEY `SALES_ORDER_STATUS_LABEL_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Status Label Table';

-- --------------------------------------------------------

--
-- Table structure for table `sales_order_status_state`
--

CREATE TABLE IF NOT EXISTS `sales_order_status_state` (
  `status` varchar(32) NOT NULL COMMENT 'Status',
  `state` varchar(32) NOT NULL COMMENT 'Label',
  `is_default` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Default',
  `visible_on_front` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Visible on front',
  PRIMARY KEY (`status`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Status Table';

--
-- Dumping data for table `sales_order_status_state`
--

INSERT INTO `sales_order_status_state` (`status`, `state`, `is_default`, `visible_on_front`) VALUES
('canceled', 'canceled', 1, 1),
('closed', 'closed', 1, 1),
('complete', 'complete', 1, 1),
('fraud', 'payment_review', 0, 1),
('fraud', 'processing', 0, 1),
('holded', 'holded', 1, 1),
('payment_review', 'payment_review', 1, 1),
('pending', 'new', 1, 1),
('pending_payment', 'pending_payment', 1, 0),
('processing', 'processing', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sales_order_tax`
--

CREATE TABLE IF NOT EXISTS `sales_order_tax` (
  `tax_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Tax Id',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `code` varchar(255) DEFAULT NULL COMMENT 'Code',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  `percent` decimal(12,4) DEFAULT NULL COMMENT 'Percent',
  `amount` decimal(12,4) DEFAULT NULL COMMENT 'Amount',
  `priority` int(11) NOT NULL COMMENT 'Priority',
  `position` int(11) NOT NULL COMMENT 'Position',
  `base_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount',
  `process` smallint(6) NOT NULL COMMENT 'Process',
  `base_real_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Real Amount',
  PRIMARY KEY (`tax_id`),
  KEY `SALES_ORDER_TAX_ORDER_ID_PRIORITY_POSITION` (`order_id`,`priority`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Tax Table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_order_tax_item`
--

CREATE TABLE IF NOT EXISTS `sales_order_tax_item` (
  `tax_item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Tax Item Id',
  `tax_id` int(10) unsigned NOT NULL COMMENT 'Tax Id',
  `item_id` int(10) unsigned DEFAULT NULL COMMENT 'Item Id',
  `tax_percent` decimal(12,4) NOT NULL COMMENT 'Real Tax Percent For Item',
  `amount` decimal(12,4) NOT NULL COMMENT 'Tax amount for the item and tax rate',
  `base_amount` decimal(12,4) NOT NULL COMMENT 'Base tax amount for the item and tax rate',
  `real_amount` decimal(12,4) NOT NULL COMMENT 'Real tax amount for the item and tax rate',
  `real_base_amount` decimal(12,4) NOT NULL COMMENT 'Real base tax amount for the item and tax rate',
  `associated_item_id` int(10) unsigned DEFAULT NULL COMMENT 'Id of the associated item',
  `taxable_item_type` varchar(32) NOT NULL COMMENT 'Type of the taxable item',
  PRIMARY KEY (`tax_item_id`),
  UNIQUE KEY `SALES_ORDER_TAX_ITEM_TAX_ID_ITEM_ID` (`tax_id`,`item_id`),
  KEY `SALES_ORDER_TAX_ITEM_ASSOCIATED_ITEM_ID_SALES_ORDER_ITEM_ITEM_ID` (`associated_item_id`),
  KEY `SALES_ORDER_TAX_ITEM_ITEM_ID` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Tax Item' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_payment_transaction`
--

CREATE TABLE IF NOT EXISTS `sales_payment_transaction` (
  `transaction_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Transaction Id',
  `parent_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Id',
  `order_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Order Id',
  `payment_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Payment Id',
  `txn_id` varchar(100) DEFAULT NULL COMMENT 'Txn Id',
  `parent_txn_id` varchar(100) DEFAULT NULL COMMENT 'Parent Txn Id',
  `txn_type` varchar(15) DEFAULT NULL COMMENT 'Txn Type',
  `is_closed` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Closed',
  `additional_information` blob COMMENT 'Additional Information',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  PRIMARY KEY (`transaction_id`),
  UNIQUE KEY `SALES_PAYMENT_TRANSACTION_ORDER_ID_PAYMENT_ID_TXN_ID` (`order_id`,`payment_id`,`txn_id`),
  KEY `SALES_PAYMENT_TRANSACTION_PARENT_ID` (`parent_id`),
  KEY `SALES_PAYMENT_TRANSACTION_PAYMENT_ID` (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Payment Transaction' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_refunded_aggregated`
--

CREATE TABLE IF NOT EXISTS `sales_refunded_aggregated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `refunded` decimal(12,4) DEFAULT NULL COMMENT 'Refunded',
  `online_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Online Refunded',
  `offline_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Offline Refunded',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALES_REFUNDED_AGGREGATED_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `SALES_REFUNDED_AGGREGATED_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Refunded Aggregated' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_refunded_aggregated_order`
--

CREATE TABLE IF NOT EXISTS `sales_refunded_aggregated_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `refunded` decimal(12,4) DEFAULT NULL COMMENT 'Refunded',
  `online_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Online Refunded',
  `offline_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Offline Refunded',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALES_REFUNDED_AGGREGATED_ORDER_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `SALES_REFUNDED_AGGREGATED_ORDER_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Refunded Aggregated Order' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_sequence_meta`
--

CREATE TABLE IF NOT EXISTS `sales_sequence_meta` (
  `meta_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `entity_type` varchar(32) NOT NULL COMMENT 'Prefix',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `sequence_table` varchar(32) NOT NULL COMMENT 'table for sequence',
  PRIMARY KEY (`meta_id`),
  UNIQUE KEY `SALES_SEQUENCE_META_ENTITY_TYPE_STORE_ID` (`entity_type`,`store_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='sales_sequence_meta' AUTO_INCREMENT=9 ;

--
-- Dumping data for table `sales_sequence_meta`
--

INSERT INTO `sales_sequence_meta` (`meta_id`, `entity_type`, `store_id`, `sequence_table`) VALUES
(1, 'order', 0, 'sequence_order_0'),
(2, 'invoice', 0, 'sequence_invoice_0'),
(3, 'creditmemo', 0, 'sequence_creditmemo_0'),
(4, 'shipment', 0, 'sequence_shipment_0'),
(5, 'order', 1, 'sequence_order_1'),
(6, 'invoice', 1, 'sequence_invoice_1'),
(7, 'creditmemo', 1, 'sequence_creditmemo_1'),
(8, 'shipment', 1, 'sequence_shipment_1');

-- --------------------------------------------------------

--
-- Table structure for table `sales_sequence_profile`
--

CREATE TABLE IF NOT EXISTS `sales_sequence_profile` (
  `profile_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `meta_id` int(10) unsigned NOT NULL COMMENT 'Meta_id',
  `prefix` varchar(32) DEFAULT NULL COMMENT 'Prefix',
  `suffix` varchar(32) DEFAULT NULL COMMENT 'Suffix',
  `start_value` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'Start value for sequence',
  `step` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'Step for sequence',
  `max_value` int(10) unsigned NOT NULL COMMENT 'MaxValue for sequence',
  `warning_value` int(10) unsigned NOT NULL COMMENT 'WarningValue for sequence',
  `is_active` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'isActive flag',
  PRIMARY KEY (`profile_id`),
  UNIQUE KEY `SALES_SEQUENCE_PROFILE_META_ID_PREFIX_SUFFIX` (`meta_id`,`prefix`,`suffix`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='sales_sequence_profile' AUTO_INCREMENT=9 ;

--
-- Dumping data for table `sales_sequence_profile`
--

INSERT INTO `sales_sequence_profile` (`profile_id`, `meta_id`, `prefix`, `suffix`, `start_value`, `step`, `max_value`, `warning_value`, `is_active`) VALUES
(1, 1, NULL, NULL, 1, 1, 4294967295, 4294966295, 1),
(2, 2, NULL, NULL, 1, 1, 4294967295, 4294966295, 1),
(3, 3, NULL, NULL, 1, 1, 4294967295, 4294966295, 1),
(4, 4, NULL, NULL, 1, 1, 4294967295, 4294966295, 1),
(5, 5, NULL, NULL, 1, 1, 4294967295, 4294966295, 1),
(6, 6, NULL, NULL, 1, 1, 4294967295, 4294966295, 1),
(7, 7, NULL, NULL, 1, 1, 4294967295, 4294966295, 1),
(8, 8, NULL, NULL, 1, 1, 4294967295, 4294966295, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sales_shipment`
--

CREATE TABLE IF NOT EXISTS `sales_shipment` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `total_weight` decimal(12,4) DEFAULT NULL COMMENT 'Total Weight',
  `total_qty` decimal(12,4) DEFAULT NULL COMMENT 'Total Qty',
  `email_sent` smallint(5) unsigned DEFAULT NULL COMMENT 'Email Sent',
  `send_email` smallint(5) unsigned DEFAULT NULL COMMENT 'Send Email',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `customer_id` int(11) DEFAULT NULL COMMENT 'Customer Id',
  `shipping_address_id` int(11) DEFAULT NULL COMMENT 'Shipping Address Id',
  `billing_address_id` int(11) DEFAULT NULL COMMENT 'Billing Address Id',
  `shipment_status` int(11) DEFAULT NULL COMMENT 'Shipment Status',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `packages` text COMMENT 'Packed Products in Packages',
  `shipping_label` mediumblob COMMENT 'Shipping Label Content',
  `customer_note` text COMMENT 'Customer Note',
  `customer_note_notify` smallint(5) unsigned DEFAULT NULL COMMENT 'Customer Note Notify',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `SALES_SHIPMENT_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `SALES_SHIPMENT_STORE_ID` (`store_id`),
  KEY `SALES_SHIPMENT_TOTAL_QTY` (`total_qty`),
  KEY `SALES_SHIPMENT_ORDER_ID` (`order_id`),
  KEY `SALES_SHIPMENT_CREATED_AT` (`created_at`),
  KEY `SALES_SHIPMENT_UPDATED_AT` (`updated_at`),
  KEY `SALES_SHIPMENT_SEND_EMAIL` (`send_email`),
  KEY `SALES_SHIPMENT_EMAIL_SENT` (`email_sent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Shipment' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_shipment_comment`
--

CREATE TABLE IF NOT EXISTS `sales_shipment_comment` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `is_customer_notified` int(11) DEFAULT NULL COMMENT 'Is Customer Notified',
  `is_visible_on_front` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `comment` text COMMENT 'Comment',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  PRIMARY KEY (`entity_id`),
  KEY `SALES_SHIPMENT_COMMENT_CREATED_AT` (`created_at`),
  KEY `SALES_SHIPMENT_COMMENT_PARENT_ID` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Shipment Comment' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_shipment_grid`
--

CREATE TABLE IF NOT EXISTS `sales_shipment_grid` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_increment_id` varchar(32) NOT NULL COMMENT 'Order Increment Id',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `order_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Order Increment Id',
  `customer_name` varchar(128) NOT NULL COMMENT 'Customer Name',
  `total_qty` decimal(12,4) DEFAULT NULL COMMENT 'Total Qty',
  `shipment_status` int(11) DEFAULT NULL COMMENT 'Shipment Status',
  `order_status` varchar(32) DEFAULT NULL COMMENT 'Order',
  `billing_address` varchar(255) DEFAULT NULL COMMENT 'Billing Address',
  `shipping_address` varchar(255) DEFAULT NULL COMMENT 'Shipping Address',
  `billing_name` varchar(128) DEFAULT NULL COMMENT 'Billing Name',
  `shipping_name` varchar(128) DEFAULT NULL COMMENT 'Shipping Name',
  `customer_email` varchar(128) DEFAULT NULL COMMENT 'Customer Email',
  `customer_group_id` int(11) DEFAULT NULL,
  `payment_method` varchar(32) DEFAULT NULL COMMENT 'Payment Method',
  `shipping_information` varchar(255) DEFAULT NULL COMMENT 'Shipping Method Name',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `SALES_SHIPMENT_GRID_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `SALES_SHIPMENT_GRID_STORE_ID` (`store_id`),
  KEY `SALES_SHIPMENT_GRID_TOTAL_QTY` (`total_qty`),
  KEY `SALES_SHIPMENT_GRID_ORDER_INCREMENT_ID` (`order_increment_id`),
  KEY `SALES_SHIPMENT_GRID_SHIPMENT_STATUS` (`shipment_status`),
  KEY `SALES_SHIPMENT_GRID_ORDER_STATUS` (`order_status`),
  KEY `SALES_SHIPMENT_GRID_CREATED_AT` (`created_at`),
  KEY `SALES_SHIPMENT_GRID_UPDATED_AT` (`updated_at`),
  KEY `SALES_SHIPMENT_GRID_ORDER_CREATED_AT` (`order_created_at`),
  KEY `SALES_SHIPMENT_GRID_SHIPPING_NAME` (`shipping_name`),
  KEY `SALES_SHIPMENT_GRID_BILLING_NAME` (`billing_name`),
  FULLTEXT KEY `FTI_086B40C8955F167B8EA76653437879B4` (`increment_id`,`order_increment_id`,`shipping_name`,`customer_name`,`customer_email`,`billing_address`,`shipping_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Shipment Grid';

-- --------------------------------------------------------

--
-- Table structure for table `sales_shipment_item`
--

CREATE TABLE IF NOT EXISTS `sales_shipment_item` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `row_total` decimal(12,4) DEFAULT NULL COMMENT 'Row Total',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `weight` decimal(12,4) DEFAULT NULL COMMENT 'Weight',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `product_id` int(11) DEFAULT NULL COMMENT 'Product Id',
  `order_item_id` int(11) DEFAULT NULL COMMENT 'Order Item Id',
  `additional_data` text COMMENT 'Additional Data',
  `description` text COMMENT 'Description',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  PRIMARY KEY (`entity_id`),
  KEY `SALES_SHIPMENT_ITEM_PARENT_ID` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Shipment Item' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_shipment_track`
--

CREATE TABLE IF NOT EXISTS `sales_shipment_track` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `weight` decimal(12,4) DEFAULT NULL COMMENT 'Weight',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `track_number` text COMMENT 'Number',
  `description` text COMMENT 'Description',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  `carrier_code` varchar(32) DEFAULT NULL COMMENT 'Carrier Code',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`),
  KEY `SALES_SHIPMENT_TRACK_PARENT_ID` (`parent_id`),
  KEY `SALES_SHIPMENT_TRACK_ORDER_ID` (`order_id`),
  KEY `SALES_SHIPMENT_TRACK_CREATED_AT` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Shipment Track' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_shipping_aggregated`
--

CREATE TABLE IF NOT EXISTS `sales_shipping_aggregated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `shipping_description` varchar(255) DEFAULT NULL COMMENT 'Shipping Description',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `total_shipping` decimal(12,4) DEFAULT NULL COMMENT 'Total Shipping',
  `total_shipping_actual` decimal(12,4) DEFAULT NULL COMMENT 'Total Shipping Actual',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALES_SHPP_AGGRED_PERIOD_STORE_ID_ORDER_STS_SHPP_DESCRIPTION` (`period`,`store_id`,`order_status`,`shipping_description`),
  KEY `SALES_SHIPPING_AGGREGATED_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Shipping Aggregated' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_shipping_aggregated_order`
--

CREATE TABLE IF NOT EXISTS `sales_shipping_aggregated_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `shipping_description` varchar(255) DEFAULT NULL COMMENT 'Shipping Description',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `total_shipping` decimal(12,4) DEFAULT NULL COMMENT 'Total Shipping',
  `total_shipping_actual` decimal(12,4) DEFAULT NULL COMMENT 'Total Shipping Actual',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_C05FAE47282EEA68654D0924E946761F` (`period`,`store_id`,`order_status`,`shipping_description`),
  KEY `SALES_SHIPPING_AGGREGATED_ORDER_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Shipping Aggregated Order' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `search_query`
--

CREATE TABLE IF NOT EXISTS `search_query` (
  `query_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Query ID',
  `query_text` varchar(255) DEFAULT NULL COMMENT 'Query text',
  `num_results` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Num results',
  `popularity` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Popularity',
  `redirect` varchar(255) DEFAULT NULL COMMENT 'Redirect',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `display_in_terms` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Display in terms',
  `is_active` smallint(6) DEFAULT '1' COMMENT 'Active status',
  `is_processed` smallint(6) DEFAULT '0' COMMENT 'Processed status',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated at',
  PRIMARY KEY (`query_id`),
  UNIQUE KEY `SEARCH_QUERY_QUERY_TEXT_STORE_ID` (`query_text`,`store_id`),
  KEY `SEARCH_QUERY_QUERY_TEXT_STORE_ID_POPULARITY` (`query_text`,`store_id`,`popularity`),
  KEY `SEARCH_QUERY_STORE_ID` (`store_id`),
  KEY `SEARCH_QUERY_IS_PROCESSED` (`is_processed`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Search query table' AUTO_INCREMENT=5 ;

--
-- Dumping data for table `search_query`
--

INSERT INTO `search_query` (`query_id`, `query_text`, `num_results`, `popularity`, `redirect`, `store_id`, `display_in_terms`, `is_active`, `is_processed`, `updated_at`) VALUES
(1, 'grande', 1, 1, NULL, 1, 1, 1, 0, '2018-12-25 14:53:42'),
(4, 'grandee', 1, 1, NULL, 1, 1, 1, 0, '2019-01-01 07:11:12');

-- --------------------------------------------------------

--
-- Table structure for table `search_synonyms`
--

CREATE TABLE IF NOT EXISTS `search_synonyms` (
  `group_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Synonyms Group Id',
  `synonyms` text NOT NULL COMMENT 'list of synonyms making up this group',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id - identifies the store view these synonyms belong to',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website Id - identifies the website id these synonyms belong to',
  PRIMARY KEY (`group_id`),
  KEY `SEARCH_SYNONYMS_STORE_ID` (`store_id`),
  KEY `SEARCH_SYNONYMS_WEBSITE_ID` (`website_id`),
  FULLTEXT KEY `SEARCH_SYNONYMS_SYNONYMS` (`synonyms`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='table storing various synonyms groups' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sendfriend_log`
--

CREATE TABLE IF NOT EXISTS `sendfriend_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Log ID',
  `ip` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer IP address',
  `time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Log time',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website ID',
  PRIMARY KEY (`log_id`),
  KEY `SENDFRIEND_LOG_IP` (`ip`),
  KEY `SENDFRIEND_LOG_TIME` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Send to friend function log storage table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sequence_creditmemo_0`
--

CREATE TABLE IF NOT EXISTS `sequence_creditmemo_0` (
  `sequence_value` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sequence_creditmemo_1`
--

CREATE TABLE IF NOT EXISTS `sequence_creditmemo_1` (
  `sequence_value` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sequence_invoice_0`
--

CREATE TABLE IF NOT EXISTS `sequence_invoice_0` (
  `sequence_value` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sequence_invoice_1`
--

CREATE TABLE IF NOT EXISTS `sequence_invoice_1` (
  `sequence_value` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sequence_order_0`
--

CREATE TABLE IF NOT EXISTS `sequence_order_0` (
  `sequence_value` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sequence_order_1`
--

CREATE TABLE IF NOT EXISTS `sequence_order_1` (
  `sequence_value` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sequence_shipment_0`
--

CREATE TABLE IF NOT EXISTS `sequence_shipment_0` (
  `sequence_value` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sequence_shipment_1`
--

CREATE TABLE IF NOT EXISTS `sequence_shipment_1` (
  `sequence_value` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE IF NOT EXISTS `session` (
  `session_id` varchar(255) NOT NULL COMMENT 'Session Id',
  `session_expires` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Date of Session Expiration',
  `session_data` mediumblob NOT NULL COMMENT 'Session Data',
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Database Sessions Storage';

-- --------------------------------------------------------

--
-- Table structure for table `setup_module`
--

CREATE TABLE IF NOT EXISTS `setup_module` (
  `module` varchar(50) NOT NULL COMMENT 'Module',
  `schema_version` varchar(50) DEFAULT NULL COMMENT 'Schema Version',
  `data_version` varchar(50) DEFAULT NULL COMMENT 'Data Version',
  PRIMARY KEY (`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Module versions registry';

--
-- Dumping data for table `setup_module`
--

INSERT INTO `setup_module` (`module`, `schema_version`, `data_version`) VALUES
('Amazon_Core', '3.0.0', '3.0.0'),
('Amazon_Login', '3.0.0', '3.0.0'),
('Amazon_Payment', '3.0.0', '3.0.0'),
('Designstudio\\customlayout', '0.0.1', '0.0.1'),
('Designstudio_customlayout', '0.0.1', '0.0.1'),
('Dotdigitalgroup_Email', '3.0.1', '3.0.1'),
('Klarna_Core', '5.0.0', '5.0.0'),
('Klarna_Kp', '6.0.0', '6.0.0'),
('Klarna_Ordermanagement', '5.0.2', '5.0.2'),
('Magento_Inventory', '1.0.0', '1.0.0'),
('Magento_InventoryAdminUi', '1.0.0', '1.0.0'),
('Magento_InventoryApi', '1.0.0', '1.0.0'),
('Magento_InventoryBundleProduct', '1.0.0', '1.0.0'),
('Magento_InventoryBundleProductAdminUi', '1.0.0', '1.0.0'),
('Magento_InventoryCache', '1.0.0', '1.0.0'),
('Magento_InventoryCatalog', '1.0.0', '1.0.0'),
('Magento_InventoryCatalogAdminUi', '1.0.0', '1.0.0'),
('Magento_InventoryCatalogApi', '1.0.0', '1.0.0'),
('Magento_InventoryCatalogSearch', '1.0.0', '1.0.0'),
('Magento_InventoryConfigurableProduct', '1.0.0', '1.0.0'),
('Magento_InventoryConfigurableProductAdminUi', '1.0.0', '1.0.0'),
('Magento_InventoryConfigurableProductIndexer', '1.0.0', '1.0.0'),
('Magento_InventoryConfiguration', '1.0.0', '1.0.0'),
('Magento_InventoryConfigurationApi', '1.0.0', '1.0.0'),
('Magento_InventoryGroupedProduct', '1.0.0', '1.0.0'),
('Magento_InventoryGroupedProductAdminUi', '1.0.0', '1.0.0'),
('Magento_InventoryGroupedProductIndexer', '1.0.0', '1.0.0'),
('Magento_InventoryImportExport', '1.0.0', '1.0.0'),
('Magento_InventoryIndexer', '1.0.0', '1.0.0'),
('Magento_InventoryLowQuantityNotification', '1.0.0', '1.0.0'),
('Magento_InventoryLowQuantityNotificationAdminUi', '1.0.0', '1.0.0'),
('Magento_InventoryLowQuantityNotificationApi', '1.0.0', '1.0.0'),
('Magento_InventoryMultiDimensionalIndexerApi', '1.0.0', '1.0.0'),
('Magento_InventoryProductAlert', '1.0.0', '1.0.0'),
('Magento_InventoryReservations', '1.0.0', '1.0.0'),
('Magento_InventoryReservationsApi', '1.0.0', '1.0.0'),
('Magento_InventorySales', '1.0.0', '1.0.0'),
('Magento_InventorySalesAdminUi', '1.0.0', '1.0.0'),
('Magento_InventorySalesApi', '1.0.0', '1.0.0'),
('Magento_InventoryShipping', '1.0.0', '1.0.0'),
('Magento_InventoryShippingAdminUi', '1.0.0', '1.0.0'),
('Magento_InventorySourceDeductionApi', '1.0.0', '1.0.0'),
('Magento_InventorySourceSelection', '1.0.0', '1.0.0'),
('Magento_InventorySourceSelectionApi', '1.0.0', '1.0.0'),
('MSP_ReCaptcha', '1.5.0', '1.5.0'),
('MSP_TwoFactorAuth', '2.2.0', '2.2.0'),
('Temando_Shipping', '1.4.0', '1.4.0'),
('Vertex_Tax', '100.2.1', '100.2.1');

-- --------------------------------------------------------

--
-- Table structure for table `shipping_tablerate`
--

CREATE TABLE IF NOT EXISTS `shipping_tablerate` (
  `pk` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary key',
  `website_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Website Id',
  `dest_country_id` varchar(4) NOT NULL DEFAULT '0' COMMENT 'Destination coutry ISO/2 or ISO/3 code',
  `dest_region_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Destination Region Id',
  `dest_zip` varchar(10) NOT NULL DEFAULT '*' COMMENT 'Destination Post Code (Zip)',
  `condition_name` varchar(20) NOT NULL COMMENT 'Rate Condition name',
  `condition_value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Rate condition value',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `cost` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Cost',
  PRIMARY KEY (`pk`),
  UNIQUE KEY `UNQ_D60821CDB2AFACEE1566CFC02D0D4CAA` (`website_id`,`dest_country_id`,`dest_region_id`,`dest_zip`,`condition_name`,`condition_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Shipping Tablerate' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `signifyd_case`
--

CREATE TABLE IF NOT EXISTS `signifyd_case` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity_id',
  `order_id` int(10) unsigned DEFAULT NULL COMMENT 'Order_id',
  `case_id` int(10) unsigned DEFAULT NULL COMMENT 'Case_id',
  `guarantee_eligible` tinyint(1) DEFAULT NULL COMMENT 'Guarantee_eligible',
  `guarantee_disposition` varchar(32) DEFAULT 'PENDING' COMMENT 'Guarantee_disposition',
  `status` varchar(32) DEFAULT 'PENDING' COMMENT 'Status',
  `score` int(10) unsigned DEFAULT NULL COMMENT 'Score',
  `associated_team` text COMMENT 'Associated_team',
  `review_disposition` varchar(32) DEFAULT NULL COMMENT 'Review_disposition',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created_at',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated_at',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `SIGNIFYD_CASE_ORDER_ID` (`order_id`),
  UNIQUE KEY `SIGNIFYD_CASE_CASE_ID` (`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='signifyd_case' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sitemap`
--

CREATE TABLE IF NOT EXISTS `sitemap` (
  `sitemap_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Sitemap Id',
  `sitemap_type` varchar(32) DEFAULT NULL COMMENT 'Sitemap Type',
  `sitemap_filename` varchar(32) DEFAULT NULL COMMENT 'Sitemap Filename',
  `sitemap_path` varchar(255) DEFAULT NULL COMMENT 'Sitemap Path',
  `sitemap_time` timestamp NULL DEFAULT NULL COMMENT 'Sitemap Time',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store id',
  PRIMARY KEY (`sitemap_id`),
  KEY `SITEMAP_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='XML Sitemap' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `store`
--

CREATE TABLE IF NOT EXISTS `store` (
  `store_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Store Id',
  `code` varchar(32) DEFAULT NULL COMMENT 'Code',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website Id',
  `group_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Group Id',
  `name` varchar(255) NOT NULL COMMENT 'Store Name',
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Sort Order',
  `is_active` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Activity',
  PRIMARY KEY (`store_id`),
  UNIQUE KEY `STORE_CODE` (`code`),
  KEY `STORE_WEBSITE_ID` (`website_id`),
  KEY `STORE_IS_ACTIVE_SORT_ORDER` (`is_active`,`sort_order`),
  KEY `STORE_GROUP_ID` (`group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Stores' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `store`
--

INSERT INTO `store` (`store_id`, `code`, `website_id`, `group_id`, `name`, `sort_order`, `is_active`) VALUES
(0, 'admin', 0, 0, 'Admin', 0, 1),
(1, 'default', 1, 1, 'Default Store View', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `store_group`
--

CREATE TABLE IF NOT EXISTS `store_group` (
  `group_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Group Id',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website Id',
  `name` varchar(255) NOT NULL COMMENT 'Store Group Name',
  `root_category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Root Category Id',
  `default_store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Default Store Id',
  `code` varchar(32) DEFAULT NULL COMMENT 'Store group unique code',
  PRIMARY KEY (`group_id`),
  UNIQUE KEY `STORE_GROUP_CODE` (`code`),
  KEY `STORE_GROUP_WEBSITE_ID` (`website_id`),
  KEY `STORE_GROUP_DEFAULT_STORE_ID` (`default_store_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Store Groups' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `store_group`
--

INSERT INTO `store_group` (`group_id`, `website_id`, `name`, `root_category_id`, `default_store_id`, `code`) VALUES
(0, 0, 'Default', 0, 0, 'default'),
(1, 1, 'Main Website Store', 2, 1, 'main_website_store');

-- --------------------------------------------------------

--
-- Table structure for table `store_website`
--

CREATE TABLE IF NOT EXISTS `store_website` (
  `website_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Website Id',
  `code` varchar(32) DEFAULT NULL COMMENT 'Code',
  `name` varchar(64) DEFAULT NULL COMMENT 'Website Name',
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `default_group_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Default Group Id',
  `is_default` smallint(5) unsigned DEFAULT '0' COMMENT 'Defines Is Website Default',
  PRIMARY KEY (`website_id`),
  UNIQUE KEY `STORE_WEBSITE_CODE` (`code`),
  KEY `STORE_WEBSITE_SORT_ORDER` (`sort_order`),
  KEY `STORE_WEBSITE_DEFAULT_GROUP_ID` (`default_group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Websites' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `store_website`
--

INSERT INTO `store_website` (`website_id`, `code`, `name`, `sort_order`, `default_group_id`, `is_default`) VALUES
(0, 'admin', 'Admin', 0, 0, 0),
(1, 'base', 'Main Website', 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tax_calculation`
--

CREATE TABLE IF NOT EXISTS `tax_calculation` (
  `tax_calculation_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Tax Calculation Id',
  `tax_calculation_rate_id` int(11) NOT NULL COMMENT 'Tax Calculation Rate Id',
  `tax_calculation_rule_id` int(11) NOT NULL COMMENT 'Tax Calculation Rule Id',
  `customer_tax_class_id` smallint(6) NOT NULL COMMENT 'Customer Tax Class Id',
  `product_tax_class_id` smallint(6) NOT NULL COMMENT 'Product Tax Class Id',
  PRIMARY KEY (`tax_calculation_id`),
  KEY `TAX_CALCULATION_TAX_CALCULATION_RULE_ID` (`tax_calculation_rule_id`),
  KEY `TAX_CALCULATION_CUSTOMER_TAX_CLASS_ID` (`customer_tax_class_id`),
  KEY `TAX_CALCULATION_PRODUCT_TAX_CLASS_ID` (`product_tax_class_id`),
  KEY `TAX_CALC_TAX_CALC_RATE_ID_CSTR_TAX_CLASS_ID_PRD_TAX_CLASS_ID` (`tax_calculation_rate_id`,`customer_tax_class_id`,`product_tax_class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tax Calculation' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tax_calculation_rate`
--

CREATE TABLE IF NOT EXISTS `tax_calculation_rate` (
  `tax_calculation_rate_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Tax Calculation Rate Id',
  `tax_country_id` varchar(2) NOT NULL COMMENT 'Tax Country Id',
  `tax_region_id` int(11) NOT NULL COMMENT 'Tax Region Id',
  `tax_postcode` varchar(21) DEFAULT NULL COMMENT 'Tax Postcode',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `rate` decimal(12,4) NOT NULL COMMENT 'Rate',
  `zip_is_range` smallint(6) DEFAULT NULL COMMENT 'Zip Is Range',
  `zip_from` int(10) unsigned DEFAULT NULL COMMENT 'Zip From',
  `zip_to` int(10) unsigned DEFAULT NULL COMMENT 'Zip To',
  PRIMARY KEY (`tax_calculation_rate_id`),
  KEY `TAX_CALCULATION_RATE_TAX_COUNTRY_ID_TAX_REGION_ID_TAX_POSTCODE` (`tax_country_id`,`tax_region_id`,`tax_postcode`),
  KEY `TAX_CALCULATION_RATE_CODE` (`code`),
  KEY `IDX_CA799F1E2CB843495F601E56C84A626D` (`tax_calculation_rate_id`,`tax_country_id`,`tax_region_id`,`zip_is_range`,`tax_postcode`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Tax Calculation Rate' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tax_calculation_rate`
--

INSERT INTO `tax_calculation_rate` (`tax_calculation_rate_id`, `tax_country_id`, `tax_region_id`, `tax_postcode`, `code`, `rate`, `zip_is_range`, `zip_from`, `zip_to`) VALUES
(1, 'US', 12, '*', 'US-CA-*-Rate 1', 8.2500, NULL, NULL, NULL),
(2, 'US', 43, '*', 'US-NY-*-Rate 1', 8.3750, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tax_calculation_rate_title`
--

CREATE TABLE IF NOT EXISTS `tax_calculation_rate_title` (
  `tax_calculation_rate_title_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Tax Calculation Rate Title Id',
  `tax_calculation_rate_id` int(11) NOT NULL COMMENT 'Tax Calculation Rate Id',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `value` varchar(255) NOT NULL COMMENT 'Value',
  PRIMARY KEY (`tax_calculation_rate_title_id`),
  KEY `TAX_CALCULATION_RATE_TITLE_TAX_CALCULATION_RATE_ID_STORE_ID` (`tax_calculation_rate_id`,`store_id`),
  KEY `TAX_CALCULATION_RATE_TITLE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tax Calculation Rate Title' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tax_calculation_rule`
--

CREATE TABLE IF NOT EXISTS `tax_calculation_rule` (
  `tax_calculation_rule_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Tax Calculation Rule Id',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `priority` int(11) NOT NULL COMMENT 'Priority',
  `position` int(11) NOT NULL COMMENT 'Position',
  `calculate_subtotal` int(11) NOT NULL COMMENT 'Calculate off subtotal option',
  PRIMARY KEY (`tax_calculation_rule_id`),
  KEY `TAX_CALCULATION_RULE_PRIORITY_POSITION` (`priority`,`position`),
  KEY `TAX_CALCULATION_RULE_CODE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tax Calculation Rule' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tax_class`
--

CREATE TABLE IF NOT EXISTS `tax_class` (
  `class_id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT 'Class Id',
  `class_name` varchar(255) NOT NULL COMMENT 'Class Name',
  `class_type` varchar(8) NOT NULL DEFAULT 'CUSTOMER' COMMENT 'Class Type',
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Tax Class' AUTO_INCREMENT=10 ;

--
-- Dumping data for table `tax_class`
--

INSERT INTO `tax_class` (`class_id`, `class_name`, `class_type`) VALUES
(2, 'Taxable Goods', 'PRODUCT'),
(3, 'Retail Customer', 'CUSTOMER'),
(4, 'Refund Adjustments', 'PRODUCT'),
(5, 'Gift Options', 'PRODUCT'),
(6, 'Order Gift Wrapping', 'PRODUCT'),
(7, 'Item Gift Wrapping', 'PRODUCT'),
(8, 'Printed Gift Card', 'PRODUCT'),
(9, 'Reward Points', 'PRODUCT');

-- --------------------------------------------------------

--
-- Table structure for table `tax_order_aggregated_created`
--

CREATE TABLE IF NOT EXISTS `tax_order_aggregated_created` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `percent` float DEFAULT NULL COMMENT 'Percent',
  `orders_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `tax_base_amount_sum` float DEFAULT NULL COMMENT 'Tax Base Amount Sum',
  PRIMARY KEY (`id`),
  UNIQUE KEY `TAX_ORDER_AGGRED_CREATED_PERIOD_STORE_ID_CODE_PERCENT_ORDER_STS` (`period`,`store_id`,`code`,`percent`,`order_status`),
  KEY `TAX_ORDER_AGGREGATED_CREATED_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tax Order Aggregation' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tax_order_aggregated_updated`
--

CREATE TABLE IF NOT EXISTS `tax_order_aggregated_updated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `percent` float DEFAULT NULL COMMENT 'Percent',
  `orders_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `tax_base_amount_sum` float DEFAULT NULL COMMENT 'Tax Base Amount Sum',
  PRIMARY KEY (`id`),
  UNIQUE KEY `TAX_ORDER_AGGRED_UPDATED_PERIOD_STORE_ID_CODE_PERCENT_ORDER_STS` (`period`,`store_id`,`code`,`percent`,`order_status`),
  KEY `TAX_ORDER_AGGREGATED_UPDATED_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tax Order Aggregated Updated' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `temando_checkout_address`
--

CREATE TABLE IF NOT EXISTS `temando_checkout_address` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `shipping_address_id` int(10) unsigned NOT NULL COMMENT 'Magento Quote Address Id',
  `service_selection` text COMMENT 'Value Added Services',
  PRIMARY KEY (`entity_id`),
  KEY `TEMANDO_CHKT_ADDR_SHPP_ADDR_ID_QUOTE_ADDR_ADDR_ID` (`shipping_address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Temando Checkout Address' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `temando_collection_point_search`
--

CREATE TABLE IF NOT EXISTS `temando_collection_point_search` (
  `shipping_address_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `country_id` varchar(2) DEFAULT NULL,
  `postcode` varchar(255) DEFAULT NULL,
  `pending` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Pending',
  PRIMARY KEY (`shipping_address_id`),
  KEY `TEMANDO_COLLECTION_POINT_SRCH_COUNTRY_ID_DIR_COUNTRY_COUNTRY_ID` (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Collection Point Search';

-- --------------------------------------------------------

--
-- Table structure for table `temando_order`
--

CREATE TABLE IF NOT EXISTS `temando_order` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Magento Order Id',
  `ext_order_id` varchar(64) NOT NULL COMMENT 'Temando Order Id',
  PRIMARY KEY (`entity_id`),
  KEY `TEMANDO_ORDER_ORDER_ID_SALES_ORDER_ENTITY_ID` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Temando Order' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `temando_order_collection_point`
--

CREATE TABLE IF NOT EXISTS `temando_order_collection_point` (
  `recipient_address_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `collection_point_id` varchar(64) NOT NULL COMMENT 'Collection Point Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `country` varchar(2) NOT NULL COMMENT 'Country Code',
  `region` varchar(255) NOT NULL COMMENT 'Region',
  `postcode` varchar(255) NOT NULL COMMENT 'Zip/Postal Code',
  `city` varchar(255) NOT NULL COMMENT 'City',
  `street` text NOT NULL COMMENT 'Street',
  PRIMARY KEY (`recipient_address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Order Collection Point Entity';

-- --------------------------------------------------------

--
-- Table structure for table `temando_order_pickup_location`
--

CREATE TABLE IF NOT EXISTS `temando_order_pickup_location` (
  `recipient_address_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `pickup_location_id` varchar(64) NOT NULL COMMENT 'Pickup Location Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `country` varchar(2) NOT NULL COMMENT 'Country Code',
  `region` varchar(255) NOT NULL COMMENT 'Region',
  `postcode` varchar(255) NOT NULL COMMENT 'Zip/Postal Code',
  `city` varchar(255) NOT NULL COMMENT 'City',
  `street` text NOT NULL COMMENT 'Street',
  PRIMARY KEY (`recipient_address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Order Pickup Location Entity';

-- --------------------------------------------------------

--
-- Table structure for table `temando_pickup_location_search`
--

CREATE TABLE IF NOT EXISTS `temando_pickup_location_search` (
  `shipping_address_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `active` tinyint(1) NOT NULL COMMENT 'Active',
  PRIMARY KEY (`shipping_address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Pickup Location Search';

-- --------------------------------------------------------

--
-- Table structure for table `temando_quote_collection_point`
--

CREATE TABLE IF NOT EXISTS `temando_quote_collection_point` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `recipient_address_id` int(10) unsigned NOT NULL COMMENT 'Quote Address Id',
  `collection_point_id` varchar(64) NOT NULL COMMENT 'Collection Point Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `country` varchar(2) NOT NULL COMMENT 'Country Code',
  `region` varchar(255) NOT NULL COMMENT 'Region',
  `postcode` varchar(255) NOT NULL COMMENT 'Zip/Postal Code',
  `city` varchar(255) NOT NULL COMMENT 'City',
  `street` text NOT NULL COMMENT 'Street',
  `opening_hours` text NOT NULL COMMENT 'Opening Hours',
  `shipping_experiences` text NOT NULL COMMENT 'Shipping Experiences',
  `selected` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Selected',
  PRIMARY KEY (`entity_id`),
  KEY `FK_4ABED96BBA0BAF57A5EC10E47B5A0F12` (`recipient_address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Quote Collection Point Entity' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `temando_quote_pickup_location`
--

CREATE TABLE IF NOT EXISTS `temando_quote_pickup_location` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `recipient_address_id` int(10) unsigned NOT NULL COMMENT 'Quote Address Id',
  `pickup_location_id` varchar(64) NOT NULL COMMENT 'Pickup Location Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `country` varchar(2) NOT NULL COMMENT 'Country Code',
  `region` varchar(255) NOT NULL COMMENT 'Region',
  `postcode` varchar(255) NOT NULL COMMENT 'Zip/Postal Code',
  `city` varchar(255) NOT NULL COMMENT 'City',
  `street` text NOT NULL COMMENT 'Street',
  `opening_hours` text NOT NULL COMMENT 'Opening Hours',
  `shipping_experiences` text NOT NULL COMMENT 'Shipping Experiences',
  `selected` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Selected',
  PRIMARY KEY (`entity_id`),
  KEY `FK_9010B10870AF99FB0560ADA50F3F99F4` (`recipient_address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Quote Pickup Location Entity' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `temando_shipment`
--

CREATE TABLE IF NOT EXISTS `temando_shipment` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `shipment_id` int(10) unsigned NOT NULL COMMENT 'Magento Shipment Id',
  `ext_shipment_id` varchar(64) NOT NULL COMMENT 'External Shipment Id',
  `ext_location_id` varchar(64) DEFAULT NULL,
  `ext_tracking_url` varchar(255) DEFAULT NULL COMMENT 'External Tracking Url',
  `ext_tracking_reference` varchar(255) DEFAULT NULL COMMENT 'External Tracking Reference',
  `ext_return_shipment_id` varchar(64) DEFAULT NULL COMMENT 'External Return Shipment Id',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `TEMANDO_SHIPMENT_SHIPMENT_ID_EXT_SHIPMENT_ID` (`shipment_id`,`ext_shipment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Temando Shipment' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `theme`
--

CREATE TABLE IF NOT EXISTS `theme` (
  `theme_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Theme identifier',
  `parent_id` int(11) DEFAULT NULL COMMENT 'Parent Id',
  `theme_path` varchar(255) DEFAULT NULL COMMENT 'Theme Path',
  `theme_title` varchar(255) NOT NULL COMMENT 'Theme Title',
  `preview_image` varchar(255) DEFAULT NULL COMMENT 'Preview Image',
  `is_featured` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Is Theme Featured',
  `area` varchar(255) NOT NULL COMMENT 'Theme Area',
  `type` smallint(6) NOT NULL COMMENT 'Theme type: 0:physical, 1:virtual, 2:staging',
  `code` text COMMENT 'Full theme code, including package',
  PRIMARY KEY (`theme_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Core theme' AUTO_INCREMENT=9 ;

--
-- Dumping data for table `theme`
--

INSERT INTO `theme` (`theme_id`, `parent_id`, `theme_path`, `theme_title`, `preview_image`, `is_featured`, `area`, `type`, `code`) VALUES
(1, NULL, 'Magento/blank', 'Magento Blank', 'preview_image_5c08acd04c9a8.jpeg', 0, 'frontend', 0, 'Magento/blank'),
(2, 1, 'Magento/luma', 'Magento Luma', 'preview_image_5c08acd07d4b0.jpeg', 0, 'frontend', 0, 'Magento/luma'),
(3, NULL, 'Magento/backend', 'Magento 2 backend', NULL, 0, 'adminhtml', 0, 'Magento/backend'),
(7, 1, 'Designstudio/showcase', 'Designstudio showcase', NULL, 0, 'frontend', 0, 'Designstudio/showcase'),
(8, 7, 'Designstudio/simpleprod', 'Designstudio simpleprod', NULL, 0, 'frontend', 1, 'Designstudio/simpleprod');

-- --------------------------------------------------------

--
-- Table structure for table `theme_file`
--

CREATE TABLE IF NOT EXISTS `theme_file` (
  `theme_files_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Theme files identifier',
  `theme_id` int(10) unsigned NOT NULL COMMENT 'Theme Id',
  `file_path` varchar(255) DEFAULT NULL COMMENT 'Relative path to file',
  `file_type` varchar(32) NOT NULL COMMENT 'File Type',
  `content` longtext NOT NULL COMMENT 'File Content',
  `sort_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `is_temporary` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Is Temporary File',
  PRIMARY KEY (`theme_files_id`),
  KEY `THEME_FILE_THEME_ID_THEME_THEME_ID` (`theme_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Core theme files' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `translation`
--

CREATE TABLE IF NOT EXISTS `translation` (
  `key_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Key Id of Translation',
  `string` varchar(255) NOT NULL DEFAULT 'Translate String' COMMENT 'Translation String',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `translate` varchar(255) DEFAULT NULL COMMENT 'Translate',
  `locale` varchar(20) NOT NULL DEFAULT 'en_US' COMMENT 'Locale',
  `crc_string` bigint(20) NOT NULL DEFAULT '1591228201' COMMENT 'Translation String CRC32 Hash',
  PRIMARY KEY (`key_id`),
  UNIQUE KEY `TRANSLATION_STORE_ID_LOCALE_CRC_STRING_STRING` (`store_id`,`locale`,`crc_string`,`string`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Translations' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ui_bookmark`
--

CREATE TABLE IF NOT EXISTS `ui_bookmark` (
  `bookmark_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Bookmark identifier',
  `user_id` int(10) unsigned NOT NULL COMMENT 'User Id',
  `namespace` varchar(255) NOT NULL COMMENT 'Bookmark namespace',
  `identifier` varchar(255) NOT NULL COMMENT 'Bookmark Identifier',
  `current` smallint(6) NOT NULL COMMENT 'Mark current bookmark per user and identifier',
  `title` varchar(255) DEFAULT NULL COMMENT 'Bookmark title',
  `config` longtext COMMENT 'Bookmark config',
  `created_at` datetime NOT NULL COMMENT 'Bookmark created at',
  `updated_at` datetime NOT NULL COMMENT 'Bookmark updated at',
  PRIMARY KEY (`bookmark_id`),
  KEY `UI_BOOKMARK_USER_ID_NAMESPACE_IDENTIFIER` (`user_id`,`namespace`,`identifier`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Bookmark' AUTO_INCREMENT=13 ;

--
-- Dumping data for table `ui_bookmark`
--

INSERT INTO `ui_bookmark` (`bookmark_id`, `user_id`, `namespace`, `identifier`, `current`, `title`, `config`, `created_at`, `updated_at`) VALUES
(1, 1, 'design_config_listing', 'current', 0, NULL, '{"current":{"filters":{"applied":{"placeholder":true}},"columns":{"default":{"visible":true,"sorting":false},"actions":{"visible":true,"sorting":false},"store_website_id":{"visible":true,"sorting":false},"store_group_id":{"visible":true,"sorting":false},"store_id":{"visible":true,"sorting":false},"theme_theme_id":{"visible":true,"sorting":false}},"displayMode":"grid","positions":{"default":0,"store_website_id":1,"store_group_id":2,"store_id":3,"actions":4,"theme_theme_id":5},"paging":{"options":{"20":{"value":20,"label":20},"30":{"value":30,"label":30},"50":{"value":50,"label":50},"100":{"value":100,"label":100},"200":{"value":200,"label":200}},"value":20}}}', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 1, 'design_config_listing', 'default', 1, 'Default View', '{"views":{"default":{"label":"Default View","index":"default","editable":false,"data":{"filters":{"applied":{"placeholder":true}},"columns":{"default":{"visible":true,"sorting":false},"actions":{"visible":true,"sorting":false},"store_website_id":{"visible":true,"sorting":false},"store_group_id":{"visible":true,"sorting":false},"store_id":{"visible":true,"sorting":false},"theme_theme_id":{"visible":true,"sorting":false}},"displayMode":"grid","positions":{"default":0,"store_website_id":1,"store_group_id":2,"store_id":3,"actions":4,"theme_theme_id":5},"paging":{"options":{"20":{"value":20,"label":20},"30":{"value":30,"label":30},"50":{"value":50,"label":50},"100":{"value":100,"label":100},"200":{"value":200,"label":200}},"value":20}},"value":"Default View"}}}', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 1, 'cms_page_listing', 'current', 0, NULL, '{"current":{"columns":{"page_id":{"visible":true,"sorting":"asc"},"title":{"visible":true,"sorting":false},"identifier":{"visible":true,"sorting":false},"store_id":{"visible":true,"sorting":false},"meta_title":{"visible":false,"sorting":false},"meta_keywords":{"visible":false,"sorting":false},"meta_description":{"visible":false,"sorting":false},"actions":{"visible":true,"sorting":false},"ids":{"visible":true,"sorting":false},"page_layout":{"visible":true,"sorting":false},"is_active":{"visible":true,"sorting":false},"custom_theme":{"visible":false,"sorting":false},"custom_root_template":{"visible":false,"sorting":false},"creation_time":{"visible":true,"sorting":false},"update_time":{"visible":true,"sorting":false},"custom_theme_from":{"visible":false,"sorting":false},"custom_theme_to":{"visible":false,"sorting":false}},"displayMode":"grid","filters":{"applied":{"placeholder":true}},"search":{"value":""},"paging":{"options":{"20":{"value":20,"label":20},"30":{"value":30,"label":30},"50":{"value":50,"label":50},"100":{"value":100,"label":100},"200":{"value":200,"label":200}},"value":20},"positions":{"ids":0,"page_id":1,"title":2,"identifier":3,"page_layout":4,"store_id":5,"is_active":6,"creation_time":7,"update_time":8,"custom_theme_from":9,"custom_theme_to":10,"custom_theme":11,"custom_root_template":12,"meta_title":13,"meta_keywords":14,"meta_description":15,"actions":16}}}', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 1, 'cms_page_listing', 'default', 1, 'Default View', '{"views":{"default":{"label":"Default View","index":"default","editable":false,"data":{"columns":{"page_id":{"visible":true,"sorting":"asc"},"title":{"visible":true,"sorting":false},"identifier":{"visible":true,"sorting":false},"store_id":{"visible":true,"sorting":false},"meta_title":{"visible":false,"sorting":false},"meta_keywords":{"visible":false,"sorting":false},"meta_description":{"visible":false,"sorting":false},"actions":{"visible":true,"sorting":false},"ids":{"visible":true,"sorting":false},"page_layout":{"visible":true,"sorting":false},"is_active":{"visible":true,"sorting":false},"custom_theme":{"visible":false,"sorting":false},"custom_root_template":{"visible":false,"sorting":false},"creation_time":{"visible":true,"sorting":false},"update_time":{"visible":true,"sorting":false},"custom_theme_from":{"visible":false,"sorting":false},"custom_theme_to":{"visible":false,"sorting":false}},"displayMode":"grid","filters":{"applied":{"placeholder":true}},"search":{"value":""},"paging":{"options":{"20":{"value":20,"label":20},"30":{"value":30,"label":30},"50":{"value":50,"label":50},"100":{"value":100,"label":100},"200":{"value":200,"label":200}},"value":20},"positions":{"ids":0,"page_id":1,"title":2,"identifier":3,"page_layout":4,"store_id":5,"is_active":6,"creation_time":7,"update_time":8,"custom_theme_from":9,"custom_theme_to":10,"custom_theme":11,"custom_root_template":12,"meta_title":13,"meta_keywords":14,"meta_description":15,"actions":16}},"value":"Default View"}}}', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 1, 'cms_block_listing', 'current', 0, NULL, '{"current":{"columns":{"block_id":{"visible":true,"sorting":"asc"},"title":{"visible":true,"sorting":false},"identifier":{"visible":true,"sorting":false},"store_id":{"visible":true,"sorting":false},"actions":{"visible":true,"sorting":false},"is_active":{"visible":true,"sorting":false},"creation_time":{"visible":true,"sorting":false},"update_time":{"visible":true,"sorting":false},"ids":{"visible":true,"sorting":false}},"filters":{"applied":{"placeholder":true}},"displayMode":"grid","paging":{"options":{"20":{"value":20,"label":20},"30":{"value":30,"label":30},"50":{"value":50,"label":50},"100":{"value":100,"label":100},"200":{"value":200,"label":200}},"value":20},"search":{"value":""},"positions":{"ids":0,"block_id":1,"title":2,"identifier":3,"store_id":4,"is_active":5,"creation_time":6,"update_time":7,"actions":8}}}', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 1, 'cms_block_listing', 'default', 1, 'Default View', '{"views":{"default":{"label":"Default View","index":"default","editable":false,"data":{"columns":{"block_id":{"visible":true,"sorting":"asc"},"title":{"visible":true,"sorting":false},"identifier":{"visible":true,"sorting":false},"store_id":{"visible":true,"sorting":false},"actions":{"visible":true,"sorting":false},"is_active":{"visible":true,"sorting":false},"creation_time":{"visible":true,"sorting":false},"update_time":{"visible":true,"sorting":false},"ids":{"visible":true,"sorting":false}},"filters":{"applied":{"placeholder":true}},"displayMode":"grid","paging":{"options":{"20":{"value":20,"label":20},"30":{"value":30,"label":30},"50":{"value":50,"label":50},"100":{"value":100,"label":100},"200":{"value":200,"label":200}},"value":20},"search":{"value":""},"positions":{"ids":0,"block_id":1,"title":2,"identifier":3,"store_id":4,"is_active":5,"creation_time":6,"update_time":7,"actions":8}},"value":"Default View"}}}', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 1, 'design_theme_listing', 'current', 0, NULL, '{"current":{"filters":{"applied":{"placeholder":true}},"columns":{"theme_id":{"visible":false,"sorting":"asc"},"theme_title":{"visible":true,"sorting":false},"parent_theme_title":{"visible":true,"sorting":false},"theme_path":{"visible":true,"sorting":false},"actions":{"visible":true,"sorting":false}},"displayMode":"grid","paging":{"options":{"20":{"value":20,"label":20},"30":{"value":30,"label":30},"50":{"value":50,"label":50},"100":{"value":100,"label":100},"200":{"value":200,"label":200}},"value":20},"positions":{"theme_id":0,"theme_title":1,"parent_theme_title":2,"theme_path":3,"actions":4}}}', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 1, 'design_theme_listing', 'default', 1, 'Default View', '{"views":{"default":{"label":"Default View","index":"default","editable":false,"data":{"filters":{"applied":{"placeholder":true}},"columns":{"theme_id":{"visible":false,"sorting":"asc"},"theme_title":{"visible":true,"sorting":false},"parent_theme_title":{"visible":true,"sorting":false},"theme_path":{"visible":true,"sorting":false},"actions":{"visible":true,"sorting":false}},"displayMode":"grid","paging":{"options":{"20":{"value":20,"label":20},"30":{"value":30,"label":30},"50":{"value":50,"label":50},"100":{"value":100,"label":100},"200":{"value":200,"label":200}},"value":20},"positions":{"theme_id":0,"theme_title":1,"parent_theme_title":2,"theme_path":3,"actions":4}},"value":"Default View"}}}', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 1, 'product_listing', 'current', 0, NULL, '{"current":{"columns":{"entity_id":{"visible":true,"sorting":"asc"},"name":{"visible":true,"sorting":false},"sku":{"visible":true,"sorting":false},"price":{"visible":true,"sorting":false},"websites":{"visible":true,"sorting":false},"qty":{"visible":true,"sorting":false},"short_description":{"visible":false,"sorting":false},"special_price":{"visible":false,"sorting":false},"cost":{"visible":false,"sorting":false},"weight":{"visible":false,"sorting":false},"meta_title":{"visible":false,"sorting":false},"meta_keyword":{"visible":false,"sorting":false},"meta_description":{"visible":false,"sorting":false},"msrp":{"visible":false,"sorting":false},"url_key":{"visible":false,"sorting":false},"actions":{"visible":true,"sorting":false},"type_id":{"visible":true,"sorting":false},"attribute_set_id":{"visible":true,"sorting":false},"visibility":{"visible":true,"sorting":false},"status":{"visible":true,"sorting":false},"manufacturer":{"visible":false,"sorting":false},"color":{"visible":false,"sorting":false},"custom_design":{"visible":false,"sorting":false},"page_layout":{"visible":false,"sorting":false},"country_of_manufacture":{"visible":false,"sorting":false},"custom_layout":{"visible":false,"sorting":false},"gift_message_available":{"visible":false,"sorting":false},"tax_class_id":{"visible":false,"sorting":false},"cabinets":{"visible":true,"sorting":false},"shell":{"visible":true,"sorting":false},"salable_quantity":{"visible":true,"sorting":false},"special_from_date":{"visible":false,"sorting":false},"special_to_date":{"visible":false,"sorting":false},"news_from_date":{"visible":false,"sorting":false},"news_to_date":{"visible":false,"sorting":false},"custom_design_from":{"visible":false,"sorting":false},"custom_design_to":{"visible":false,"sorting":false},"ids":{"visible":true,"sorting":false},"thumbnail":{"visible":true,"sorting":false},"warranty":{"visible":true,"sorting":false},"featured":{"visible":true,"sorting":false},"cabinet_color_image":{"visible":true,"sorting":false},"shell_color_image":{"visible":true,"sorting":false},"customproductlayout":{"visible":true,"sorting":false}},"displayMode":"grid","filters":{"applied":{"placeholder":true}},"search":{"value":""},"paging":{"options":{"20":{"value":20,"label":20},"30":{"value":30,"label":30},"50":{"value":50,"label":50},"100":{"value":100,"label":100},"200":{"value":200,"label":200}},"value":20},"positions":{"ids":0,"entity_id":1,"thumbnail":2,"name":3,"type_id":4,"attribute_set_id":5,"sku":6,"price":7,"qty":8,"salable_quantity":9,"visibility":10,"status":11,"websites":12,"short_description":13,"special_price":14,"special_from_date":15,"special_to_date":16,"cost":17,"weight":18,"manufacturer":19,"meta_title":20,"meta_keyword":21,"meta_description":22,"color":23,"news_from_date":24,"news_to_date":25,"custom_design":26,"custom_design_from":27,"custom_design_to":28,"page_layout":29,"country_of_manufacture":30,"custom_layout":31,"msrp":32,"url_key":33,"gift_message_available":34,"tax_class_id":35,"cabinets":36,"shell":37,"actions":38,"warranty":39,"featured":40,"cabinet_color_image":41,"shell_color_image":42}}}', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 1, 'product_listing', 'default', 1, 'Default View', '{"views":{"default":{"label":"Default View","index":"default","editable":false,"data":{"columns":{"entity_id":{"visible":true,"sorting":"asc"},"name":{"visible":true,"sorting":false},"sku":{"visible":true,"sorting":false},"price":{"visible":true,"sorting":false},"websites":{"visible":true,"sorting":false},"qty":{"visible":true,"sorting":false},"short_description":{"visible":false,"sorting":false},"special_price":{"visible":false,"sorting":false},"cost":{"visible":false,"sorting":false},"weight":{"visible":false,"sorting":false},"meta_title":{"visible":false,"sorting":false},"meta_keyword":{"visible":false,"sorting":false},"meta_description":{"visible":false,"sorting":false},"msrp":{"visible":false,"sorting":false},"url_key":{"visible":false,"sorting":false},"actions":{"visible":true,"sorting":false},"type_id":{"visible":true,"sorting":false},"attribute_set_id":{"visible":true,"sorting":false},"visibility":{"visible":true,"sorting":false},"status":{"visible":true,"sorting":false},"manufacturer":{"visible":false,"sorting":false},"color":{"visible":false,"sorting":false},"custom_design":{"visible":false,"sorting":false},"page_layout":{"visible":false,"sorting":false},"country_of_manufacture":{"visible":false,"sorting":false},"custom_layout":{"visible":false,"sorting":false},"gift_message_available":{"visible":false,"sorting":false},"tax_class_id":{"visible":false,"sorting":false},"cabinets":{"visible":true,"sorting":false},"shell":{"visible":true,"sorting":false},"salable_quantity":{"visible":true,"sorting":false},"special_from_date":{"visible":false,"sorting":false},"special_to_date":{"visible":false,"sorting":false},"news_from_date":{"visible":false,"sorting":false},"news_to_date":{"visible":false,"sorting":false},"custom_design_from":{"visible":false,"sorting":false},"custom_design_to":{"visible":false,"sorting":false},"ids":{"visible":true,"sorting":false},"thumbnail":{"visible":true,"sorting":false}},"displayMode":"grid","filters":{"applied":{"placeholder":true}},"search":{"value":""},"paging":{"options":{"20":{"value":20,"label":20},"30":{"value":30,"label":30},"50":{"value":50,"label":50},"100":{"value":100,"label":100},"200":{"value":200,"label":200}},"value":20},"positions":{"ids":0,"entity_id":1,"thumbnail":2,"name":3,"type_id":4,"attribute_set_id":5,"sku":6,"price":7,"qty":8,"salable_quantity":9,"visibility":10,"status":11,"websites":12,"short_description":13,"special_price":14,"special_from_date":15,"special_to_date":16,"cost":17,"weight":18,"manufacturer":19,"meta_title":20,"meta_keyword":21,"meta_description":22,"color":23,"news_from_date":24,"news_to_date":25,"custom_design":26,"custom_design_from":27,"custom_design_to":28,"page_layout":29,"country_of_manufacture":30,"custom_layout":31,"msrp":32,"url_key":33,"gift_message_available":34,"tax_class_id":35,"cabinets":36,"shell":37,"actions":38}},"value":"Default View"}}}', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 1, 'product_attributes_listing', 'default', 1, 'Default View', '{"views":{"default":{"label":"Default View","index":"default","editable":false,"data":{"columns":{"frontend_label":{"visible":true,"sorting":false},"ids":{"visible":true,"sorting":false},"is_required":{"visible":true,"sorting":false},"is_user_defined":{"visible":true,"sorting":false},"is_visible":{"visible":true,"sorting":false},"is_global":{"visible":true,"sorting":false},"is_searchable":{"visible":true,"sorting":false},"is_comparable":{"visible":true,"sorting":false},"is_filterable":{"visible":true,"sorting":false},"attribute_code":{"visible":true,"sorting":"asc"}},"paging":{"options":{"20":{"value":20,"label":20},"30":{"value":30,"label":30},"50":{"value":50,"label":50},"100":{"value":100,"label":100},"200":{"value":200,"label":200}},"value":20},"positions":{"ids":0,"attribute_code":1,"frontend_label":2,"is_required":3,"is_user_defined":4,"is_visible":5,"is_global":6,"is_searchable":7,"is_comparable":8,"is_filterable":9},"displayMode":"grid"},"value":"Default View"}}}', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 1, 'product_attributes_listing', 'current', 0, NULL, '{"current":{"columns":{"frontend_label":{"visible":true,"sorting":false},"ids":{"visible":true,"sorting":false},"is_required":{"visible":true,"sorting":false},"is_user_defined":{"visible":true,"sorting":false},"is_visible":{"visible":true,"sorting":false},"is_global":{"visible":true,"sorting":false},"is_searchable":{"visible":true,"sorting":false},"is_comparable":{"visible":true,"sorting":false},"is_filterable":{"visible":true,"sorting":false},"attribute_code":{"visible":true,"sorting":"asc"}},"paging":{"options":{"20":{"value":20,"label":20},"30":{"value":30,"label":30},"50":{"value":50,"label":50},"100":{"value":100,"label":100},"200":{"value":200,"label":200}},"value":20},"positions":{"ids":0,"attribute_code":1,"frontend_label":2,"is_required":3,"is_user_defined":4,"is_visible":5,"is_global":6,"is_searchable":7,"is_comparable":8,"is_filterable":9},"displayMode":"grid"}}', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `url_rewrite`
--

CREATE TABLE IF NOT EXISTS `url_rewrite` (
  `url_rewrite_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rewrite Id',
  `entity_type` varchar(32) NOT NULL COMMENT 'Entity type code',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `request_path` varchar(255) DEFAULT NULL COMMENT 'Request Path',
  `target_path` varchar(255) DEFAULT NULL COMMENT 'Target Path',
  `redirect_type` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Redirect Type',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `description` varchar(255) DEFAULT NULL COMMENT 'Description',
  `is_autogenerated` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is rewrite generated automatically flag',
  `metadata` varchar(255) DEFAULT NULL COMMENT 'Meta data for url rewrite',
  PRIMARY KEY (`url_rewrite_id`),
  UNIQUE KEY `URL_REWRITE_REQUEST_PATH_STORE_ID` (`request_path`,`store_id`),
  KEY `URL_REWRITE_TARGET_PATH` (`target_path`),
  KEY `URL_REWRITE_STORE_ID_ENTITY_ID` (`store_id`,`entity_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Url Rewrites' AUTO_INCREMENT=37 ;

--
-- Dumping data for table `url_rewrite`
--

INSERT INTO `url_rewrite` (`url_rewrite_id`, `entity_type`, `entity_id`, `request_path`, `target_path`, `redirect_type`, `store_id`, `description`, `is_autogenerated`, `metadata`) VALUES
(1, 'cms-page', 1, 'no-route', 'cms/page/view/page_id/1', 0, 1, NULL, 1, NULL),
(2, 'cms-page', 2, 'home', 'cms/page/view/page_id/2', 0, 1, NULL, 1, NULL),
(3, 'cms-page', 3, 'enable-cookies', 'cms/page/view/page_id/3', 0, 1, NULL, 1, NULL),
(4, 'cms-page', 4, 'privacy-policy-cookie-restriction-mode', 'cms/page/view/page_id/4', 0, 1, NULL, 1, NULL),
(5, 'category', 3, 'hot-tub.html', 'catalog/category/view/id/3', 0, 1, NULL, 1, NULL),
(6, 'category', 4, 'swim-spas.html', 'catalog/category/view/id/4', 0, 1, NULL, 1, NULL),
(7, 'category', 5, 'pools.html', 'catalog/category/view/id/5', 0, 1, NULL, 1, NULL),
(8, 'category', 6, 'water-care.html', 'catalog/category/view/id/6', 0, 1, NULL, 1, NULL),
(9, 'category', 7, 'services.html', 'catalog/category/view/id/7', 0, 1, NULL, 1, NULL),
(10, 'category', 8, 'other-products.html', 'catalog/category/view/id/8', 0, 1, NULL, 1, NULL),
(12, 'category', 9, 'spa-accessories.html', 'catalog/category/view/id/9', 0, 1, NULL, 1, NULL),
(13, 'category', 9, 'other-products/spa-accessories.html', 'spa-accessories.html', 301, 1, NULL, 0, NULL),
(14, 'category', 10, 'hot-tub/hot-spring-spas.html', 'catalog/category/view/id/10', 0, 1, NULL, 1, NULL),
(20, 'product', 19, 'grandee-sup-r-sup-nxt.html', 'catalog/product/view/id/19', 0, 1, NULL, 1, NULL),
(21, 'category', 11, 'hot-tub/hot-spring-spas/highlife-nxt.html', 'catalog/category/view/id/11', 0, 1, NULL, 1, NULL),
(22, 'category', 12, 'hot-tub/fantasy-sup-r-sup-spas.html', 'catalog/category/view/id/12', 0, 1, NULL, 1, NULL),
(23, 'category', 13, 'hot-tub/caldera-sup-r-sup-spas.html', 'catalog/category/view/id/13', 0, 1, NULL, 1, NULL),
(24, 'category', 14, 'hot-tub/caldera-sup-r-sup-spas/utopia-series.html', 'catalog/category/view/id/14', 0, 1, NULL, 1, NULL),
(25, 'category', 15, 'hot-tub/freeflow-sup-r-sup-spas.html', 'catalog/category/view/id/15', 0, 1, NULL, 1, NULL),
(26, 'product', 20, 'steps-covers-lifters.html', 'catalog/product/view/id/20', 0, 1, NULL, 1, NULL),
(27, 'product', 20, 'hot-tub/steps-covers-lifters.html', 'catalog/product/view/id/20/category/3', 0, 1, NULL, 1, '{"category_id":"3"}'),
(28, 'product', 21, 'steps-covers-lifters-1.html', 'catalog/product/view/id/21', 0, 1, NULL, 1, NULL),
(29, 'product', 21, 'hot-tub/steps-covers-lifters-1.html', 'catalog/product/view/id/21/category/3', 0, 1, NULL, 1, '{"category_id":"3"}'),
(30, 'product', 22, 'steps-covers-lifters-2.html', 'catalog/product/view/id/22', 0, 1, NULL, 1, NULL),
(31, 'product', 22, 'hot-tub/steps-covers-lifters-2.html', 'catalog/product/view/id/22/category/3', 0, 1, NULL, 1, '{"category_id":"3"}'),
(32, 'product', 23, 'steps-covers-lifters-3.html', 'catalog/product/view/id/23', 0, 1, NULL, 1, NULL),
(33, 'product', 23, 'hot-tub/steps-covers-lifters-3.html', 'catalog/product/view/id/23/category/3', 0, 1, NULL, 1, '{"category_id":"3"}'),
(34, 'product', 24, 'hot-springr-32-polymer-spa-steps.html', 'catalog/product/view/id/24', 0, 1, NULL, 1, NULL),
(35, 'product', 24, 'spa-accessories/hot-springr-32-polymer-spa-steps.html', 'catalog/product/view/id/24/category/9', 0, 1, NULL, 1, '{"category_id":"9"}'),
(36, 'cms-page', 5, 'new-home', 'cms/page/view/page_id/5', 0, 1, NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `variable`
--

CREATE TABLE IF NOT EXISTS `variable` (
  `variable_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Variable Id',
  `code` varchar(255) DEFAULT NULL COMMENT 'Variable Code',
  `name` varchar(255) DEFAULT NULL COMMENT 'Variable Name',
  PRIMARY KEY (`variable_id`),
  UNIQUE KEY `VARIABLE_CODE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Variables' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `variable_value`
--

CREATE TABLE IF NOT EXISTS `variable_value` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Variable Value Id',
  `variable_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Variable Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `plain_value` text COMMENT 'Plain Text Value',
  `html_value` text COMMENT 'Html Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `VARIABLE_VALUE_VARIABLE_ID_STORE_ID` (`variable_id`,`store_id`),
  KEY `VARIABLE_VALUE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Variable Value' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vault_payment_token`
--

CREATE TABLE IF NOT EXISTS `vault_payment_token` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `public_hash` varchar(128) NOT NULL COMMENT 'Hash code for using on frontend',
  `payment_method_code` varchar(128) NOT NULL COMMENT 'Payment method code',
  `type` varchar(128) NOT NULL COMMENT 'Type',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `expires_at` timestamp NULL DEFAULT NULL COMMENT 'Expires At',
  `gateway_token` varchar(255) NOT NULL COMMENT 'Gateway Token',
  `details` text COMMENT 'Details',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `VAULT_PAYMENT_TOKEN_PUBLIC_HASH` (`public_hash`),
  UNIQUE KEY `VAULT_PAYMENT_TOKEN_PAYMENT_METHOD_CODE_CSTR_ID_GATEWAY_TOKEN` (`payment_method_code`,`customer_id`,`gateway_token`),
  KEY `VAULT_PAYMENT_TOKEN_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Vault tokens of payment' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vault_payment_token_order_payment_link`
--

CREATE TABLE IF NOT EXISTS `vault_payment_token_order_payment_link` (
  `order_payment_id` int(10) unsigned NOT NULL COMMENT 'Order payment Id',
  `payment_token_id` int(10) unsigned NOT NULL COMMENT 'Payment token Id',
  PRIMARY KEY (`order_payment_id`,`payment_token_id`),
  KEY `FK_4ED894655446D385894580BECA993862` (`payment_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Order payments to vault token';

-- --------------------------------------------------------

--
-- Table structure for table `vertex_customer_code`
--

CREATE TABLE IF NOT EXISTS `vertex_customer_code` (
  `customer_id` int(10) unsigned NOT NULL COMMENT 'Customer ID',
  `customer_code` text COMMENT 'Customer Code for Vertex',
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='vertex_customer_code';

-- --------------------------------------------------------

--
-- Table structure for table `vertex_invoice_sent`
--

CREATE TABLE IF NOT EXISTS `vertex_invoice_sent` (
  `invoice_id` int(10) unsigned NOT NULL COMMENT 'Invoice ID',
  `sent_to_vertex` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Invoice has been logged in Vertex',
  PRIMARY KEY (`invoice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='vertex_invoice_sent';

-- --------------------------------------------------------

--
-- Table structure for table `vertex_order_invoice_status`
--

CREATE TABLE IF NOT EXISTS `vertex_order_invoice_status` (
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order ID',
  `sent_to_vertex` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Invoice has been logged in Vertex',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='vertex_order_invoice_status';

-- --------------------------------------------------------

--
-- Table structure for table `vertex_taxrequest`
--

CREATE TABLE IF NOT EXISTS `vertex_taxrequest` (
  `request_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `request_type` varchar(255) NOT NULL COMMENT 'Request Type',
  `quote_id` bigint(20) DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `total_tax` varchar(255) NOT NULL COMMENT 'Total Tax Amount',
  `source_path` varchar(255) NOT NULL COMMENT 'Source path controller_module_action',
  `tax_area_id` varchar(255) NOT NULL COMMENT 'Tax Jurisdictions Id',
  `sub_total` varchar(255) NOT NULL COMMENT 'Response Subtotal Amount',
  `total` varchar(255) NOT NULL COMMENT 'Response Total Amount',
  `lookup_result` varchar(255) NOT NULL COMMENT 'Tax Area Response Lookup Result',
  `request_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Request create date',
  `request_xml` text NOT NULL COMMENT 'Request XML',
  `response_xml` text NOT NULL COMMENT 'Response XML',
  PRIMARY KEY (`request_id`),
  UNIQUE KEY `VERTEX_TAXREQUEST_REQUEST_ID` (`request_id`),
  KEY `VERTEX_TAXREQUEST_REQUEST_TYPE` (`request_type`),
  KEY `VERTEX_TAXREQUEST_ORDER_ID` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Log of requests to Vertex' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `weee_tax`
--

CREATE TABLE IF NOT EXISTS `weee_tax` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `country` varchar(2) DEFAULT NULL COMMENT 'Country',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value',
  `state` int(11) NOT NULL DEFAULT '0' COMMENT 'State',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute Id',
  PRIMARY KEY (`value_id`),
  KEY `WEEE_TAX_WEBSITE_ID` (`website_id`),
  KEY `WEEE_TAX_ENTITY_ID` (`entity_id`),
  KEY `WEEE_TAX_COUNTRY` (`country`),
  KEY `WEEE_TAX_ATTRIBUTE_ID` (`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Weee Tax' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `widget`
--

CREATE TABLE IF NOT EXISTS `widget` (
  `widget_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Widget Id',
  `widget_code` varchar(255) DEFAULT NULL COMMENT 'Widget code for template directive',
  `widget_type` varchar(255) DEFAULT NULL COMMENT 'Widget Type',
  `parameters` text COMMENT 'Parameters',
  PRIMARY KEY (`widget_id`),
  KEY `WIDGET_WIDGET_CODE` (`widget_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Preconfigured Widgets' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `widget_instance`
--

CREATE TABLE IF NOT EXISTS `widget_instance` (
  `instance_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Instance Id',
  `instance_type` varchar(255) DEFAULT NULL COMMENT 'Instance Type',
  `theme_id` int(10) unsigned NOT NULL COMMENT 'Theme id',
  `title` varchar(255) DEFAULT NULL COMMENT 'Widget Title',
  `store_ids` varchar(255) NOT NULL DEFAULT '0' COMMENT 'Store ids',
  `widget_parameters` text COMMENT 'Widget parameters',
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort order',
  PRIMARY KEY (`instance_id`),
  KEY `WIDGET_INSTANCE_THEME_ID_THEME_THEME_ID` (`theme_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Instances of Widget for Package Theme' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `widget_instance_page`
--

CREATE TABLE IF NOT EXISTS `widget_instance_page` (
  `page_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Page Id',
  `instance_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Instance Id',
  `page_group` varchar(25) DEFAULT NULL COMMENT 'Block Group Type',
  `layout_handle` varchar(255) DEFAULT NULL COMMENT 'Layout Handle',
  `block_reference` varchar(255) DEFAULT NULL COMMENT 'Container',
  `page_for` varchar(25) DEFAULT NULL COMMENT 'For instance entities',
  `entities` text COMMENT 'Catalog entities (comma separated)',
  `page_template` varchar(255) DEFAULT NULL COMMENT 'Path to widget template',
  PRIMARY KEY (`page_id`),
  KEY `WIDGET_INSTANCE_PAGE_INSTANCE_ID` (`instance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Instance of Widget on Page' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `widget_instance_page_layout`
--

CREATE TABLE IF NOT EXISTS `widget_instance_page_layout` (
  `page_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Page Id',
  `layout_update_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Layout Update Id',
  UNIQUE KEY `WIDGET_INSTANCE_PAGE_LAYOUT_LAYOUT_UPDATE_ID_PAGE_ID` (`layout_update_id`,`page_id`),
  KEY `WIDGET_INSTANCE_PAGE_LAYOUT_PAGE_ID` (`page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Layout updates';

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE IF NOT EXISTS `wishlist` (
  `wishlist_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Wishlist ID',
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer ID',
  `shared` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Sharing flag (0 or 1)',
  `sharing_code` varchar(32) DEFAULT NULL COMMENT 'Sharing encrypted code',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Last updated date',
  PRIMARY KEY (`wishlist_id`),
  UNIQUE KEY `WISHLIST_CUSTOMER_ID` (`customer_id`),
  KEY `WISHLIST_SHARED` (`shared`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Wishlist main Table' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`wishlist_id`, `customer_id`, `shared`, `sharing_code`, `updated_at`) VALUES
(1, 1, 0, 'er7OOXvtGVdQGWuKPoH6y5orAjCwd2QC', '2019-01-01 15:50:41');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist_item`
--

CREATE TABLE IF NOT EXISTS `wishlist_item` (
  `wishlist_item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Wishlist item ID',
  `wishlist_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Wishlist ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store ID',
  `added_at` timestamp NULL DEFAULT NULL COMMENT 'Add date and time',
  `description` text COMMENT 'Short description of wish list item',
  `qty` decimal(12,4) NOT NULL COMMENT 'Qty',
  PRIMARY KEY (`wishlist_item_id`),
  KEY `WISHLIST_ITEM_WISHLIST_ID` (`wishlist_id`),
  KEY `WISHLIST_ITEM_PRODUCT_ID` (`product_id`),
  KEY `WISHLIST_ITEM_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Wishlist items' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wishlist_item_option`
--

CREATE TABLE IF NOT EXISTS `wishlist_item_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Id',
  `wishlist_item_id` int(10) unsigned NOT NULL COMMENT 'Wishlist Item Id',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `value` text COMMENT 'Value',
  PRIMARY KEY (`option_id`),
  KEY `FK_A014B30B04B72DD0EAB3EECD779728D6` (`wishlist_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Wishlist Item Option Table' AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
