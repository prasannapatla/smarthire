-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 28, 2019 at 11:34 PM
-- Server version: 5.7.27-0ubuntu0.19.04.1
-- PHP Version: 7.2.19-0ubuntu0.19.04.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smarthireuser`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add categories', 7, 'add_categories'),
(26, 'Can change categories', 7, 'change_categories'),
(27, 'Can delete categories', 7, 'delete_categories'),
(28, 'Can view categories', 7, 'view_categories'),
(29, 'Can add exam', 8, 'add_exam'),
(30, 'Can change exam', 8, 'change_exam'),
(31, 'Can delete exam', 8, 'delete_exam'),
(32, 'Can view exam', 8, 'view_exam'),
(33, 'Can add questions', 9, 'add_questions'),
(34, 'Can change questions', 9, 'change_questions'),
(35, 'Can delete questions', 9, 'delete_questions'),
(36, 'Can view questions', 9, 'view_questions'),
(37, 'Can add users', 10, 'add_users'),
(38, 'Can change users', 10, 'change_users'),
(39, 'Can delete users', 10, 'delete_users'),
(40, 'Can view users', 10, 'view_users'),
(41, 'Can add selected_questions', 11, 'add_selected_questions'),
(42, 'Can change selected_questions', 11, 'change_selected_questions'),
(43, 'Can delete selected_questions', 11, 'delete_selected_questions'),
(44, 'Can view selected_questions', 11, 'view_selected_questions'),
(45, 'Can add result_set', 12, 'add_result_set'),
(46, 'Can change result_set', 12, 'change_result_set'),
(47, 'Can delete result_set', 12, 'delete_result_set'),
(48, 'Can view result_set', 12, 'view_result_set'),
(49, 'Can add event', 13, 'add_event'),
(50, 'Can change event', 13, 'change_event'),
(51, 'Can delete event', 13, 'delete_event'),
(52, 'Can view event', 13, 'view_event'),
(53, 'Can add event counter', 14, 'add_eventcounter'),
(54, 'Can change event counter', 14, 'change_eventcounter'),
(55, 'Can delete event counter', 14, 'delete_eventcounter'),
(56, 'Can view event counter', 14, 'view_eventcounter');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(13, 'django_eventstream', 'event'),
(14, 'django_eventstream', 'eventcounter'),
(6, 'sessions', 'session'),
(7, 'smart', 'categories'),
(8, 'smart', 'exam'),
(9, 'smart', 'questions'),
(12, 'smart', 'result_set'),
(11, 'smart', 'selected_questions'),
(10, 'smart', 'users');

-- --------------------------------------------------------

--
-- Table structure for table `django_eventstream_event`
--

CREATE TABLE `django_eventstream_event` (
  `id` int(11) NOT NULL,
  `channel` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `data` longtext NOT NULL,
  `eid` bigint(20) NOT NULL,
  `created` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_eventstream_eventcounter`
--

CREATE TABLE `django_eventstream_eventcounter` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` bigint(20) NOT NULL,
  `updated` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2019-08-28 14:15:36.759648'),
(2, 'auth', '0001_initial', '2019-08-28 14:15:38.672246'),
(3, 'admin', '0001_initial', '2019-08-28 14:15:46.519171'),
(4, 'admin', '0002_logentry_remove_auto_add', '2019-08-28 14:15:47.965183'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2019-08-28 14:15:48.036588'),
(6, 'contenttypes', '0002_remove_content_type_name', '2019-08-28 14:15:49.020591'),
(7, 'auth', '0002_alter_permission_name_max_length', '2019-08-28 14:15:49.189496'),
(8, 'auth', '0003_alter_user_email_max_length', '2019-08-28 14:15:49.301417'),
(9, 'auth', '0004_alter_user_username_opts', '2019-08-28 14:15:49.343381'),
(10, 'auth', '0005_alter_user_last_login_null', '2019-08-28 14:15:49.872765'),
(11, 'auth', '0006_require_contenttypes_0002', '2019-08-28 14:15:49.966665'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2019-08-28 14:15:50.094506'),
(13, 'auth', '0008_alter_user_username_max_length', '2019-08-28 14:15:50.276792'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2019-08-28 14:15:50.537241'),
(15, 'auth', '0010_alter_group_name_max_length', '2019-08-28 14:15:50.650065'),
(16, 'auth', '0011_update_proxy_permissions', '2019-08-28 14:15:50.698180'),
(17, 'sessions', '0001_initial', '2019-08-28 14:15:50.989344'),
(18, 'smart', '0001_initial', '2019-08-28 14:15:53.231937'),
(19, 'django_eventstream', '0001_initial', '2019-08-28 14:53:43.848290');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('0i53yvjs1udz3ubhttgqm8jmveuosy2f', 'NmVjNTM5ODEwNTM2YzhiNmFlZDE0YmNmMGY2MGM1ZmU4MzBiM2M2YTp7InRlc3QiOiJndXJ1In0=', '2019-09-11 17:00:15.119808'),
('19gllwqdaxepbxa5iylq8dawqjf5607p', 'NmVjNTM5ODEwNTM2YzhiNmFlZDE0YmNmMGY2MGM1ZmU4MzBiM2M2YTp7InRlc3QiOiJndXJ1In0=', '2019-09-11 16:56:19.411346'),
('1f3tpipxeadenzm8dlo0nshjpix43cn6', 'NmVjNTM5ODEwNTM2YzhiNmFlZDE0YmNmMGY2MGM1ZmU4MzBiM2M2YTp7InRlc3QiOiJndXJ1In0=', '2019-09-11 16:56:09.334675'),
('1ft5v8wdw1qpowi1m2c00m0xa69r3vxa', 'NmVjNTM5ODEwNTM2YzhiNmFlZDE0YmNmMGY2MGM1ZmU4MzBiM2M2YTp7InRlc3QiOiJndXJ1In0=', '2019-09-11 16:56:29.489595'),
('4pp8q8t87rt3aat665owtvuqo8x0dikz', 'NmVjNTM5ODEwNTM2YzhiNmFlZDE0YmNmMGY2MGM1ZmU4MzBiM2M2YTp7InRlc3QiOiJndXJ1In0=', '2019-09-11 16:56:24.452543'),
('5ywbfhqxse84t8t3irjmy0d8y5p2faxy', 'NmVjNTM5ODEwNTM2YzhiNmFlZDE0YmNmMGY2MGM1ZmU4MzBiM2M2YTp7InRlc3QiOiJndXJ1In0=', '2019-09-11 17:00:04.934874'),
('8ez6ukpdrjtqc99d5c2nunupsd9gvt9m', 'NmVjNTM5ODEwNTM2YzhiNmFlZDE0YmNmMGY2MGM1ZmU4MzBiM2M2YTp7InRlc3QiOiJndXJ1In0=', '2019-09-11 17:00:35.379687'),
('b51y81ux1fvuulplrl82qx2j4tknoxll', 'NmVjNTM5ODEwNTM2YzhiNmFlZDE0YmNmMGY2MGM1ZmU4MzBiM2M2YTp7InRlc3QiOiJndXJ1In0=', '2019-09-11 17:01:00.649226'),
('bc2r2quxnqj3fbkzrtqinltx9g2hneuo', 'NGMyZmMyNTc0NzBkOTljNmExOWQ0YzMyNThkZTc5MDA3MWQxNmEwMTp7fQ==', '2019-09-11 18:01:48.233906'),
('cww64bf7bx8aejx100sak2jtd4kjhbtn', 'NmVjNTM5ODEwNTM2YzhiNmFlZDE0YmNmMGY2MGM1ZmU4MzBiM2M2YTp7InRlc3QiOiJndXJ1In0=', '2019-09-11 17:00:45.454343'),
('d2uuwtej6bpr3subi6ci1orngm7bz9qw', 'NmVjNTM5ODEwNTM2YzhiNmFlZDE0YmNmMGY2MGM1ZmU4MzBiM2M2YTp7InRlc3QiOiJndXJ1In0=', '2019-09-11 16:55:59.246324'),
('dslclgmvtuorit6dcs8e2xl4agcjn4f1', 'NmVjNTM5ODEwNTM2YzhiNmFlZDE0YmNmMGY2MGM1ZmU4MzBiM2M2YTp7InRlc3QiOiJndXJ1In0=', '2019-09-11 17:01:15.844453'),
('id8rp4gtgz5sggh7htj9tpawwbn4h2qz', 'NmVjNTM5ODEwNTM2YzhiNmFlZDE0YmNmMGY2MGM1ZmU4MzBiM2M2YTp7InRlc3QiOiJndXJ1In0=', '2019-09-11 17:01:05.691978'),
('jn0x13zm6x5m3gany954vcnrk8teveho', 'NmVjNTM5ODEwNTM2YzhiNmFlZDE0YmNmMGY2MGM1ZmU4MzBiM2M2YTp7InRlc3QiOiJndXJ1In0=', '2019-09-11 17:00:20.161353'),
('m7vfkkgq523aqeqnt3jdxz0tk1y5qm08', 'NmVjNTM5ODEwNTM2YzhiNmFlZDE0YmNmMGY2MGM1ZmU4MzBiM2M2YTp7InRlc3QiOiJndXJ1In0=', '2019-09-11 17:00:55.608262'),
('nf9moamd9ouj07ds3tp79u79dipuc11n', 'NmVjNTM5ODEwNTM2YzhiNmFlZDE0YmNmMGY2MGM1ZmU4MzBiM2M2YTp7InRlc3QiOiJndXJ1In0=', '2019-09-11 17:01:10.799162'),
('njd0otrwe6sc2kwqdf5v95h8obewgimf', 'NmVjNTM5ODEwNTM2YzhiNmFlZDE0YmNmMGY2MGM1ZmU4MzBiM2M2YTp7InRlc3QiOiJndXJ1In0=', '2019-09-11 16:55:54.209554'),
('o4eb728urq0mmi9x9sabkr7mr776eqnf', 'NmVjNTM5ODEwNTM2YzhiNmFlZDE0YmNmMGY2MGM1ZmU4MzBiM2M2YTp7InRlc3QiOiJndXJ1In0=', '2019-09-11 16:55:49.124084'),
('onpptewx2m544pptwb2tn7t5t32qltxn', 'NmVjNTM5ODEwNTM2YzhiNmFlZDE0YmNmMGY2MGM1ZmU4MzBiM2M2YTp7InRlc3QiOiJndXJ1In0=', '2019-09-11 16:59:54.811630'),
('paqvzlbaa8yj48qowfwyeg9xxn6au91k', 'NmVjNTM5ODEwNTM2YzhiNmFlZDE0YmNmMGY2MGM1ZmU4MzBiM2M2YTp7InRlc3QiOiJndXJ1In0=', '2019-09-11 17:00:10.020038'),
('qb2wez1it3obie0i38bfc67yuo89v4hr', 'NmVjNTM5ODEwNTM2YzhiNmFlZDE0YmNmMGY2MGM1ZmU4MzBiM2M2YTp7InRlc3QiOiJndXJ1In0=', '2019-09-11 17:00:50.559152'),
('tbf1wrrxut4vjaerp9uw7upbt30j43ew', 'NmVjNTM5ODEwNTM2YzhiNmFlZDE0YmNmMGY2MGM1ZmU4MzBiM2M2YTp7InRlc3QiOiJndXJ1In0=', '2019-09-11 17:00:40.416920'),
('tnh968trjmiuvkcvu8rtkp423roi5njo', 'NmVjNTM5ODEwNTM2YzhiNmFlZDE0YmNmMGY2MGM1ZmU4MzBiM2M2YTp7InRlc3QiOiJndXJ1In0=', '2019-09-11 16:56:14.374465'),
('tq15ryo32i809xa0n2if11ki02vd0135', 'NmVjNTM5ODEwNTM2YzhiNmFlZDE0YmNmMGY2MGM1ZmU4MzBiM2M2YTp7InRlc3QiOiJndXJ1In0=', '2019-09-11 17:00:25.198064'),
('vma9fjyofk7oy55vbj4pd9fqn2817m5k', 'NmVjNTM5ODEwNTM2YzhiNmFlZDE0YmNmMGY2MGM1ZmU4MzBiM2M2YTp7InRlc3QiOiJndXJ1In0=', '2019-09-11 17:00:30.326513'),
('zeuqmcxldzdwrya1lxw4vmsra7pi4sue', 'NmVjNTM5ODEwNTM2YzhiNmFlZDE0YmNmMGY2MGM1ZmU4MzBiM2M2YTp7InRlc3QiOiJndXJ1In0=', '2019-09-11 16:59:59.890553'),
('zu5jneok0tiy7hts8eti7emdxhj8b6ol', 'NmVjNTM5ODEwNTM2YzhiNmFlZDE0YmNmMGY2MGM1ZmU4MzBiM2M2YTp7InRlc3QiOiJndXJ1In0=', '2019-09-11 16:56:04.285760');

-- --------------------------------------------------------

--
-- Table structure for table `smart_categories`
--

CREATE TABLE `smart_categories` (
  `id` int(11) NOT NULL,
  `cat` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `smart_categories`
--

INSERT INTO `smart_categories` (`id`, `cat`) VALUES
(1, 'Aptitude'),
(5, 'cat1'),
(3, 'Networking'),
(2, 'Programming'),
(4, 'Verbal');

-- --------------------------------------------------------

--
-- Table structure for table `smart_exam`
--

CREATE TABLE `smart_exam` (
  `id` int(11) NOT NULL,
  `e_name` varchar(32) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `duration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `smart_exam`
--

INSERT INTO `smart_exam` (`id`, `e_name`, `start_date`, `end_date`, `duration`) VALUES
(1, 'exam1', '2019-06-01', '2019-12-25', 3600);

-- --------------------------------------------------------

--
-- Table structure for table `smart_questions`
--

CREATE TABLE `smart_questions` (
  `id` int(11) NOT NULL,
  `question` longtext NOT NULL,
  `opt1` longtext NOT NULL,
  `opt2` longtext NOT NULL,
  `opt3` longtext NOT NULL,
  `opt4` longtext NOT NULL,
  `ans` longtext NOT NULL,
  `cat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `smart_questions`
--

INSERT INTO `smart_questions` (`id`, `question`, `opt1`, `opt2`, `opt3`, `opt4`, `ans`, `cat_id`) VALUES
(1, '<div>A sum of money at simple interest amounts to Rs. 815 in 3 years and to Rs. 854 in 4 years. The sum is:\n</div>', 'Rs. 650', 'Rs. 690', 'Rs. 698', 'Rs. 700', 'Rs. 698', 1),
(2, '<div>The cost price of 20 articles is the same as the selling price of x articles. If the profit is 25%, then the value of x is:\n</div>', '15', '16', '18', '25', '16', 1),
(3, '<div>The length of the bridge, which a train 130 metres long and travelling at 45 km/hr can cross in 30 seconds, is:\n</div>', '200 m', '225 m', '245 m', '250 m', '245 m', 1),
(4, '<div>What percentage of numbers from 1 to 70 have 1 or 9 in the unit\'s digit?\n</div>', '1', '14', '20', '21', '20', 1),
(5, '<div>Today is Monday. After 61 days, it will be:</div>', 'Wednesday', 'Saturday', 'Tuesday', 'Thursday', 'Saturday', 1),
(6, '<div>In the first 10 overs of a cricket game, the run rate was only 3.2. What should be the run rate in the remaining 40 overs to reach the target of 282 runs?</div>', '6.25', '6.5', '6.75', '7', '6.25', 1),
(7, '<div>A right triangle with sides 3 cm, 4 cm and 5 cm is rotated the side of 3 cm to form a cone. The volume of the cone so formed is:\n</div>', '12 cm^3', '15 cm^3', '16 cm^3', '20 cm^3', '12 cm^3', 1),
(8, '<div>It is being given that (2^32 + 1) is completely divisible by a whole number. Which of the following numbers is completely divisible by this number?\n</div>', '(2^16 + 1)', '(2^16 - 1)', '(7 x 223)', '(2^96 + 1)', '(2^96 + 1)', 1),
(9, '<div>A boat can travel with a speed of 13 km/hr in still water. If the speed of the stream is 4 km/hr, find the time taken by the boat to go 68 km downstream.</div>', '2 hours', '3 hours', '3 hours', '5 hours', '3 hours', 1),
(10, '<div>If log 2 = 0.3010 and log 3 = 0.4771, the value of log5 512 is:\n</div>', '2.870', '2.967', '3.876', '3.912', '3.876', 1),
(11, '<div>A and B invest in a business in the ratio 3 : 2. If 5% of the total profit goes to charity and A\'s share is Rs. 855, the total profit is:</div>', 'Rs. 1425', 'Rs. 1500', 'Rs. 1537.50', 'Rs. 1576', 'Rs. 1500', 1),
(12, '<div>The sum of ages of 5 children born at the intervals of 3 years each is 50 years. What is the age of the youngest child?</div>', '4 years', '8 years', '10 years', 'None of these', '4 years', 1),
(13, '<div>A person crosses a 600 m long street in 5 minutes. What is his speed in km per hour?\n</div>', '3.6', '7.2', '8.4', '10', '7.2', 1),
(14, '<div>If 6 men and 8 boys can do a piece of work in 10 days while 26 men and 48 boys can do the same in 2 days, the time taken by 15 men and 20 boys in doing the same type of work will be:</div>', '4 days', '5 days', '6 days', '7 days', '4 days', 1),
(15, '<div>An accurate clock shows 8 o\'clock in the morning. Through how may degrees will the hour hand rotate when the clock shows 2 o\'clock in the afternoon?</div>', '144°', '150°', '168°', '180°', '180°', 1),
(16, '<div>In how many different ways can the letters of the word \'OPTICAL\' be arranged so that the vowels always come together?</div>', '120', '720', '4320', '2160', '720', 1),
(17, '<div>Three times the first of three consecutive odd integers is 3 more than twice the third. The third integer is:</div>', '9', '11', '4320', '15', '15', 1),
(18, '<div>The square root of 64009 is:\n</div>', '253', '347', '363', '803', '253', 1),
(19, '<div>Two cards are drawn together from a pack of 52 cards. The probability that one is a spade and one is a heart, is:\n</div>', '3/20', '29/34', '47/100', '13/102', '13/102', 1),
(20, '<div>A can contains a mixture of two liquids A and B is the ratio 7 : 5. When 9 litres of mixture are drawn off and the can is filled with B, the ratio of A and B becomes 7 : 9. How many litres of liquid A was contained by the can initially?</div>', '10', '20', '21', '25', '21', 1),
(21, '<div>Which of the following special symbol allowed in a variable name?\n</div>', '* (asterisk)', '| (pipeline)', '- (hyphen)', '_ (underscore)', '_ (underscore)', 2),
(22, '<div>Which of the following is the correct order of evaluation for the below expression?<br>\nz = x + y * z / 4 % 2 - 1\n</div>', '* / % + - =', '= * / % + -', '/ * % - + =', '* % / - + =', '* / % + - =', 2),
(23, '<div>The keyword used to transfer control from a function back to the calling function is</div>', 'switch', 'goto', 'return', 'go back', 'return', 2),
(24, '<div>In which header file is the NULL macro defined?</div>', 'stdio.h', 'stddef.h', 'stdio.h and stddef.h', 'math.h', 'stdio.h and stddef.h', 2),
(25, '<div>To print out a and b given below, which of the following printf() statement will you use? </div>                 \n<pre>\n\n#include<stdio.h>\n\nfloat a=3.14;\ndouble b=3.14;\n</pre>', 'printf(\"%f %lf\", a, b);', 'printf(\"%Lf %f\", a, b);', 'printf(\"%Lf %Lf\", a, b);', 'printf(\"%f %Lf\", a, b);', 'printf(\"%f %lf\", a, b);', 2),
(26, '<div>Which bitwise operator is suitable for turning off a particular bit in a number?\n</div>', '&& operator', '& operator', '|| operator', '! operator', '& operator', 2),
(27, '<div>Which of the following function is more appropriate for reading in a multi-word string?\n</div>', 'printf();', 'scanf();', 'gets();', 'puts();', 'gets();', 2),
(28, '<div>What will be the output of the program?</div>\n<pre>\n#include<stdio.h>\nint main()\n{\n    const int x=5;\n    const int *ptrx;\n    ptrx = &x;\n    *ptrx = 10;\n    printf(\"%d\\n\", x);\n    return 0;\n}\n</pre>', '5', 'Error', '10', 'Garbage Value', 'Error', 2),
(29, '<div>Which standard library function will you use to find the last occurance of a character in a string in C?</div>', 'strnchar()', 'strchar()', 'strrchar()', 'strrchr()', 'strrchr()', 2),
(30, '<div>Which of the following is not logical operator?</div>', '&', '&&', '||', '!', '&', 2),
(31, '<div>Which of the following cannot be checked in a switch-case statement?\n</div>', 'Character', 'Integer', 'Float', 'enum', 'Float', 2),
(32, '<div>What will you do to treat the constant 3.14 as a long double?</div>', 'use 3.14LD', 'use 3.14L', 'use 3.14DL', 'use 3.14LF', 'use 3.14L', 2),
(33, '<div>What will happen if in a C program you assign a value to an array element whose subscript exceeds the size of array?</div>', 'The element will be set to 0.', 'The compiler would report an error', 'The program may crash if some important data gets overwritten.', 'The array size would appropriately grow.', 'The program may crash if some important data gets overwritten.', 2),
(34, '<div> How will you free the allocated memory ?</div>', 'remove(var-name);', 'free(var-name);', 'delete(var-name);', 'dalloc(var-name);', 'free(var-name);', 2),
(35, '<div> What do the \'c\' and \'v\' in argv stands for?\n</div>', '\'c\' means argument control \'v\' means argument vector', '\'c\' means argument count \'v\' means argument vertex', '\'c\' means argument count \'v\' means argument vector', '\'c\' means argument configuration \'v\' means argument visibility', '\'c\' means argument count \'v\' means argument vector', 2),
(36, '<div>In the following code what is \'P\'?</div>\n<pre>\ntypedef char *charp;\nconst charp P;\n</pre>', 'P is a constant', 'P is a character constant', 'P is character type', 'P is character type', 'P is a constant', 2),
(37, '<div>Which header file should be included to use functions like malloc() and calloc()?\n</div>', 'memory.h', 'stdlib.h', 'string.h', 'dos.h', 'stdlib.h', 2),
(38, '<div>In C, if you pass an array as an argument to a function, what actually gets passed?</div>', 'Value of elements in array', 'First element of the array', 'Base address of the array', 'Address of the last element of array', 'Base address of the array', 2),
(39, '<div>How many times the program will print \"Terralogic\"? </div>\n<pre>\n#include<stdio.h>\n\nint main()\n{\n    printf(\"Terralogic\");\n    main();\n    return 0;\n}\n</pre>', 'Infinite times', '32767 times', '65535 times', 'Till stack overflows', 'Till stack overflows', 2),
(40, '<div>What do the following declaration signify?</div>\n<pre>                                                                                                    \n  int (*pf)();\n</pre>', 'pf is a pointer to a function which return int ', 'pf is a function pointer.', 'pf is a pointer to function.', 'pf is a function of pointer variable', 'pf is a pointer to a function which return int ', 2),
(41, '<div>choose the word which is the exact OPPOSITE of the given words.\nENORMOUS\n</div>', 'Soft', 'Average', 'Tiny', 'Weak', 'Tiny', 4),
(42, '<div>Read each sentence to find out whether there is any grammatical error in it. The error, if any will be in one part of the sentence. The letter of that part is the answer. If there is no error, the answer is \'D\'. (Ignore the errors of punctuation, if any)\n</div>', 'We discussed about the problem so thoroughly', 'on the eve of the examination', 'that I found it very easy to work it out', 'No error', 'We discussed about the problem so thoroughly', 4),
(43, '<div> Find the correctly spelt words.</div>', 'Benefitted', 'Benefited', 'Benifited', 'Benefeted', 'Benefited', 4),
(44, '<div> Since the beginning of history <br>\nP :	have managed to catch<br>\nQ :	the Eskimos and Red Indians<br>\nR :	by a very difficulty method<br>\nS :	a few specimens of this aquatic animal<br>\nThe Proper sequence should be:\n</div>', 'QRPS', 'SQPR', 'SQRP', 'QPSR', 'QPSR', 4),
(45, '<div>Choose the correct alternative. In case no improvement is needed, option \'D\' is the answer.\nThe workers are hell bent at getting what is due to them.\n</div>', 'hell bent on getting', 'hell bent for getting', 'hell bent upon getting', 'No improvement', 'hell bent upon getting', 4),
(46, '<div> The first and sixth sentence are given in the begining.The middle four sentences in each have been removed and jumbled up. These are labelled as P, Q, R and S. Find out the proper order for the four sentences<br>\nS1:	Calcutta unlike other cities kepts its trams.<br>\nP :	As a result there horrendous congestion.<br>\nQ :	It was going to be the first in South Asia.<br>\nR :	They run down the centre of the road<br>\nS :	To ease in the city decided to build an underground railway line.<br>\nS6:	The foundation stone was laid in 1972.<br>\nThe Proper sequence should be:\n</div>', 'PRSQ', 'PSQR', 'SQRP', 'RPSQ', 'RPSQ', 4),
(47, '<div>choose the one which can be substituted for the given word/sentence.<br><br>\nA person of good understanding knowledge and reasoning power\n</div>', 'Expert', 'Intellectual', 'Snob', 'Literate', 'Intellectual', 4),
(48, '<div>choose the one which best expresses the given sentence in Passive/Active voice<br><br>\nAfter driving professor Kumar to the museum she dropped him at his hotel.\n</div>', 'After being driven to the museum, Professor Kumar was dropped at his hotel.', 'Professor Kumar was being driven dropped at his hotel.', 'After she had driven Professor Kumar to the museum she had dropped him at his hotel.', 'After she was driven Professor Kumar to the museum she had dropped him at his hotel.', 'After being driven to the museum, Professor Kumar was dropped at his hotel.', 4),
(49, '<div>Select the pair which has the same relationship.\n<br><br>\nDIVA:OPERA</div>', 'producer:theatre', 'director:drama', 'conductor:bus', 'thespian:play', 'thespian:play', 4),
(50, '<div>Choose the word which best expresses the meaning of the given word.\n<br><br>\nCANNY\n</div>', 'Obstinate', 'Handsome', 'Clever', 'Stout', 'Clever', 4),
(51, '<div>Pick out the most effective word(s) from the given words to fill in the blank to make the sentence meaningfully complete.\n<br>\nRohan and Rohit are twin brothers, but they do not look ......\n</div>', 'unique', 'different', 'likely', 'alike', 'alike', 4),
(52, '<div>A sentence broken into five or six parts. Join these parts to make a meaningful sentence. The correct order of parts is the answer\n<br>\n1. do   <br>2. today <br>  3. you <br>  4. must <br>  5. it\n</div>', '34152', '25413', '12543', '51324', '34152', 4),
(53, '<div>Which of phrases given below each sentence should replace the phrase printed in bold type to make the grammatically correct? If the sentence is correct as it is, mark \'E\' as the answer.	\n<br>\nI need not offer any explanation regarding this incident - my behaviour is speaking itself\n</div>', 'will speak to itself', 'speaks for itself', 'has been speaking', 'speaks about itself', 'speaks for itself', 4),
(54, '<div>An incomplete statement (Stem) followed by fillers is given. Pick out the best one which can complete incomplete stem correctly and meaningfully.	\n<br>\nDespite his best efforts to conceal his anger ......\n\n</div>', 'we could detect that he was very happy', 'he failed to give us an impression of his agony', 'he succeeded in camouflaging his emotions', 'people came to know that he was annoyed', 'people came to know that he was annoyed', 4),
(55, '<pre><div>Rearrange the following five sentences in proper sequence so as to for a meaningful paragraph, then answer the questions given below them.<br>\n        1 After Examining him, the doctor smiled at him mischievously and took out a syringe.<br>\n	2 Thinking that he was really sick, his father summoned the family doctor.<br>\n	3 That day, Mintu wanted to take a day off from school<br>\n	4 Immediately, Mintu jumped up from his bed and swore the he was fine<br>\n	5 Therefor; he pretended to be sick and remained in bed.<br>\n<br>\nWhich sentence should come fourth in the paragraph?</div></pre>', '1', '2', '3', '4', '1', 4),
(56, '<div>I felt the wall of the tunnel shiver. The master alarm squealed through my earphones. Almost simultaneously, Jack yelled down to me that there was a warning light on. Fleeting but spectacular sights snapped into ans out of view, the snow, the shower of debris, the moon, looming close and big, the dazzling sunshine for once unfiltered by layers of air. The last twelve hours before re-entry were particular bone-chilling. During this period, I had to go up in to command module. Even after the fiery re-entry splashing down in 81o water in south pacific, we could still see our frosty breath inside the command module.\n<br>\nThe word \'Command Module\' used twice in the given passage indicates perhaps that it deals with\n</div>', 'an alarming journey', 'a commanding situation', 'a journey into outer space', 'a frightful battle.', 'a journey into outer space', 4),
(57, '<div>Some proverbs/idioms are given below together with their meanings. Choose the correct meaning of proverb/idiom\nTo have an axe to grind\n</div>', 'A private end to serve', 'To fail to arouse interest', 'To have no result', 'To work for both sides', 'A private end to serve', 4),
(58, '<div>the sentences have been given in Direct/Indirect speech. From the given alternatives, choose the one which best expresses the given sentence in Indirect/Direct speech	\n<br>\nHe said to his father, \"Please increase my pocket-money.\"\n</div>', 'He told his father, \"Please increase the pocket-money\"', 'He requested his father to increase his pocket-money.', 'He pleaded his father to please increase my pocket money.', 'He asked his father to increase his pocket-money.', 'He requested his father to increase his pocket-money.', 4),
(59, '<div>choose the one which can be substituted for the given word/sentence.<br>\nExtreme old age when a man behaves like a fool\n</div>', 'Imbecility', 'Senility', 'Dotage', 'Superannuation', 'Dotage', 4),
(60, '<div>Find the correctly spelt words</div>', 'Judicious', 'Cancious', 'Dotage', 'Gracous', 'Judicious', 4),
(61, '<div>Each IP packet must contain\n</div>', 'Source or Destination address', 'Only Source address', 'Only Destination address', 'Source and Destination address', 'Source and Destination address', 3),
(62, '<div>Bridge works in which layer of the OSI model?\n</div>', 'Appliation layer', 'Transport layer', 'Network layer', 'Datalink layer', 'Datalink layer', 3),
(63, '<div> _______ provides a connection-oriented reliable service for sending messages</div>', 'TCP', 'IP', 'UDP', 'All of the above', 'TCP', 3),
(64, '<div>Which layers of the OSI model are host-to-host layers?\n</div>', 'Transport, Session, Presentation, Application', 'Network, Transport, Session, Presentation', 'Datalink, Network, Transport, Session', 'Physical, Datalink, Network, Transport', 'Transport, Session, Presentation, Application', 3),
(65, '<div>Which of the following IP address class is Multicast\n</div>', 'Class A', 'Class B', 'Class C', 'Class D', 'Class D', 3),
(66, '<div>The last address of IP address represents\n</div>', 'Unicast address', 'Network address', 'Broadcast address', 'None of above', 'Broadcast address', 3),
(67, '<div>How many bits are there in the Ethernet address?\n</div>', '64 bits', '48 bits', '32 bits', '16 bits', '48 bits', 3),
(68, '<div>How many layers are in the TCP/IP model?</div>', '4 layers', '5 layers', '6 layers', '7 layers', '4 layers', 3),
(69, '<div> What is the minimum header size of an IP packet?\n</div>', '16 bytes', '10 bytes', '20 bytes', '32 bytes', '20 bytes', 3),
(70, '<div>Which of following provides reliable communication?\n</div>', 'TCP', 'IP', 'UDP', 'All of the above', 'TCP', 3),
(71, '<div>What is the address size of IPv6 ?\n</div>', '32 bit', '64 bit', '128 bit', '256 bit', '128 bit', 3),
(72, '<div>What is the size of Network bits & Host bits of Class A of IP address?</div>', 'Network bits 7, Host bits 24', 'Network bits 8, Host bits 24', 'Network bits 7, Host bits 23', 'Network bits 8, Host bits 23', 'Network bits 7, Host bits 24', 3),
(73, '<div>What does Router do in a network?</div>', 'Forwards a packet to all outgoing links', 'Forwards a packet to the next free outgoing link', 'Determines on which outing link a packet is to be forwarded', 'Forwards a packet to all outgoing links except the originated link', 'Determines on which outing link a packet is to be forwarded', 3),
(74, '<div>The Internet is an example of\n</div>', 'Cell switched network', 'circuit switched network', 'Packet switched network', 'All of above', 'Packet switched network', 3),
(75, '<div>What does protocol defines?\n</div>', 'Protocol defines what data is communicated.', 'Protocol defines how data is communicated.', 'Protocol defines when data is communicated.', 'All of above', 'All of above', 3),
(76, '<div>What is the uses of subnetting?\n</div>', 'It divides one large network into several smaller ones', 'It divides network into network classes', 'It speeds up the speed of network', 'None of above', 'It divides one large network into several smaller ones', 3),
(77, '<div>Repeater operates in which layer of the OSI model?\n</div>', 'Physical layer', 'Data link layer', 'Network layer', 'Transport layer', 'Transport layer', 3),
(78, '<div>Which of the following network device has the slowest type of\nconnection?\n</div>', 'DSL', 'Router', 'Bridges', 'Dial-up modems', 'Dial-up modems', 3),
(79, '<div>Which of the following is an example of Personal Area Networking?</div>', 'WAN', 'WLAN', 'Bluetooth', 'All of the above', 'Bluetooth', 3),
(80, '<div>Which networking device connect one LAN to other LAN using\nsame protocol?\n</div>', 'Router', 'Switch', 'Bridge', 'Modem', 'Switch', 3);

-- --------------------------------------------------------

--
-- Table structure for table `smart_result_set`
--

CREATE TABLE `smart_result_set` (
  `id` int(11) NOT NULL,
  `ans` longtext NOT NULL,
  `date_f` date NOT NULL,
  `s_time` time(6) NOT NULL,
  `e_time` time(6) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `que_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `smart_selected_questions`
--

CREATE TABLE `smart_selected_questions` (
  `id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `que_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `smart_users`
--

CREATE TABLE `smart_users` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `email` varchar(254) NOT NULL,
  `password` varchar(10) NOT NULL,
  `score` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `smart_users`
--

INSERT INTO `smart_users` (`id`, `name`, `email`, `password`, `score`, `exam_id`) VALUES
(1, 'guru', 'brguru90@gmail.com', '2425Nr', -1, 1),
(2, 'guru2', 'brguru90@hotmail.com', '3pYCYh', -1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_eventstream_event`
--
ALTER TABLE `django_eventstream_event`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_eventstream_event_channel_eid_20f68a1a_uniq` (`channel`,`eid`),
  ADD KEY `django_eventstream_event_channel_49bacd5e` (`channel`),
  ADD KEY `django_eventstream_event_type_0e7a664e` (`type`),
  ADD KEY `django_eventstream_event_eid_2da5c1c0` (`eid`),
  ADD KEY `django_eventstream_event_created_039c5d02` (`created`);

--
-- Indexes for table `django_eventstream_eventcounter`
--
ALTER TABLE `django_eventstream_eventcounter`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `django_eventstream_eventcounter_updated_0b6f9a25` (`updated`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `smart_categories`
--
ALTER TABLE `smart_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cat` (`cat`);

--
-- Indexes for table `smart_exam`
--
ALTER TABLE `smart_exam`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `e_name` (`e_name`);

--
-- Indexes for table `smart_questions`
--
ALTER TABLE `smart_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `smart_questions_cat_id_774f4d2e_fk_smart_categories_id` (`cat_id`);

--
-- Indexes for table `smart_result_set`
--
ALTER TABLE `smart_result_set`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `smart_result_set_exam_id_que_id_user_id_c379fe59_uniq` (`exam_id`,`que_id`,`user_id`),
  ADD KEY `smart_result_set_que_id_de5af1c1_fk_smart_questions_id` (`que_id`),
  ADD KEY `smart_result_set_user_id_f12f1ad6_fk_smart_users_id` (`user_id`);

--
-- Indexes for table `smart_selected_questions`
--
ALTER TABLE `smart_selected_questions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `smart_selected_questions_exam_id_que_id_1b759c70_uniq` (`exam_id`,`que_id`),
  ADD KEY `smart_selected_questions_que_id_64e62720_fk_smart_questions_id` (`que_id`);

--
-- Indexes for table `smart_users`
--
ALTER TABLE `smart_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `smart_users_exam_id_b22366e5_fk_smart_exam_id` (`exam_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `django_eventstream_event`
--
ALTER TABLE `django_eventstream_event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `django_eventstream_eventcounter`
--
ALTER TABLE `django_eventstream_eventcounter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `smart_categories`
--
ALTER TABLE `smart_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `smart_exam`
--
ALTER TABLE `smart_exam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `smart_questions`
--
ALTER TABLE `smart_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;
--
-- AUTO_INCREMENT for table `smart_result_set`
--
ALTER TABLE `smart_result_set`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `smart_selected_questions`
--
ALTER TABLE `smart_selected_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `smart_users`
--
ALTER TABLE `smart_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `smart_questions`
--
ALTER TABLE `smart_questions`
  ADD CONSTRAINT `smart_questions_cat_id_774f4d2e_fk_smart_categories_id` FOREIGN KEY (`cat_id`) REFERENCES `smart_categories` (`id`);

--
-- Constraints for table `smart_result_set`
--
ALTER TABLE `smart_result_set`
  ADD CONSTRAINT `smart_result_set_exam_id_3e575753_fk_smart_exam_id` FOREIGN KEY (`exam_id`) REFERENCES `smart_exam` (`id`),
  ADD CONSTRAINT `smart_result_set_que_id_de5af1c1_fk_smart_questions_id` FOREIGN KEY (`que_id`) REFERENCES `smart_questions` (`id`),
  ADD CONSTRAINT `smart_result_set_user_id_f12f1ad6_fk_smart_users_id` FOREIGN KEY (`user_id`) REFERENCES `smart_users` (`id`);

--
-- Constraints for table `smart_selected_questions`
--
ALTER TABLE `smart_selected_questions`
  ADD CONSTRAINT `smart_selected_questions_exam_id_40c7665c_fk_smart_exam_id` FOREIGN KEY (`exam_id`) REFERENCES `smart_exam` (`id`),
  ADD CONSTRAINT `smart_selected_questions_que_id_64e62720_fk_smart_questions_id` FOREIGN KEY (`que_id`) REFERENCES `smart_questions` (`id`);

--
-- Constraints for table `smart_users`
--
ALTER TABLE `smart_users`
  ADD CONSTRAINT `smart_users_exam_id_b22366e5_fk_smart_exam_id` FOREIGN KEY (`exam_id`) REFERENCES `smart_exam` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
