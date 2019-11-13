-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 13, 2019 at 08:51 PM
-- Server version: 5.7.27-0ubuntu0.18.04.1
-- PHP Version: 7.2.24-0ubuntu0.18.04.1

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
(56, 'Can view event counter', 14, 'view_eventcounter'),
(57, 'Can add email_status', 15, 'add_email_status'),
(58, 'Can change email_status', 15, 'change_email_status'),
(59, 'Can delete email_status', 15, 'delete_email_status'),
(60, 'Can view email_status', 15, 'view_email_status'),
(61, 'Can add selected_code_questions', 17, 'add_selected_code_questions'),
(62, 'Can change selected_code_questions', 17, 'change_selected_code_questions'),
(63, 'Can delete selected_code_questions', 17, 'delete_selected_code_questions'),
(64, 'Can view selected_code_questions', 17, 'view_selected_code_questions'),
(65, 'Can add code_set', 16, 'add_code_set'),
(66, 'Can change code_set', 16, 'change_code_set'),
(67, 'Can delete code_set', 16, 'delete_code_set'),
(68, 'Can view code_set', 16, 'view_code_set'),
(69, 'Can add coding_result_set', 18, 'add_coding_result_set'),
(70, 'Can change coding_result_set', 18, 'change_coding_result_set'),
(71, 'Can delete coding_result_set', 18, 'delete_coding_result_set'),
(72, 'Can view coding_result_set', 18, 'view_coding_result_set'),
(73, 'Can add code_questions', 16, 'add_code_questions'),
(74, 'Can change code_questions', 16, 'change_code_questions'),
(75, 'Can delete code_questions', 16, 'delete_code_questions'),
(76, 'Can view code_questions', 16, 'view_code_questions'),
(77, 'Can add code_init', 19, 'add_code_init'),
(78, 'Can change code_init', 19, 'change_code_init'),
(79, 'Can delete code_init', 19, 'delete_code_init'),
(80, 'Can view code_init', 19, 'view_code_init'),
(81, 'Can add admin_users', 20, 'add_admin_users'),
(82, 'Can change admin_users', 20, 'change_admin_users'),
(83, 'Can delete admin_users', 20, 'delete_admin_users'),
(84, 'Can view admin_users', 20, 'view_admin_users');

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
(20, 'smart', 'admin_users'),
(7, 'smart', 'categories'),
(19, 'smart', 'code_init'),
(16, 'smart', 'code_questions'),
(18, 'smart', 'coding_result_set'),
(15, 'smart', 'email_status'),
(8, 'smart', 'exam'),
(9, 'smart', 'questions'),
(12, 'smart', 'result_set'),
(17, 'smart', 'selected_code_questions'),
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
(19, 'django_eventstream', '0001_initial', '2019-08-28 14:53:43.848290'),
(20, 'smart', '0002_exam_total_marks', '2019-08-30 12:49:05.142380'),
(21, 'smart', '0003_auto_20190830_1504', '2019-08-30 12:49:05.183215'),
(22, 'smart', '0002_users_malpractices', '2019-09-12 19:46:28.142815'),
(23, 'smart', '0003_auto_20190913_1431', '2019-09-13 16:31:22.361372'),
(24, 'smart', '0004_users_email_sent_status', '2019-09-30 11:44:13.079841'),
(25, 'smart', '0005_email_status', '2019-09-30 11:44:13.930843'),
(26, 'smart', '0006_users_feedback', '2019-10-11 04:45:34.164587'),
(27, 'smart', '0007_auto_20191011_1226', '2019-10-11 06:56:55.436290'),
(28, 'smart', '0008_auto_20191011_1230', '2019-10-11 07:00:42.967335'),
(29, 'smart', '0009_auto_20191011_1236', '2019-10-11 07:06:49.692178'),
(30, 'smart', '0002_code_init', '2019-10-18 09:05:38.298921'),
(31, 'smart', '0002_auto_20191018_1719', '2019-10-18 11:49:17.332306'),
(32, 'smart', '0003_auto_20191025_1136', '2019-10-25 06:06:48.314473'),
(33, 'smart', '0004_auto_20191025_1230', '2019-10-25 07:00:57.863787'),
(34, 'smart', '0005_auto_20191025_1308', '2019-10-25 07:38:07.350538'),
(35, 'smart', '0002_auto_20191107_1157', '2019-11-07 15:01:45.198665'),
(36, 'smart', '0003_auto_20191108_2311', '2019-11-08 17:41:24.971618'),
(37, 'smart', '0004_auto_20191109_1117', '2019-11-09 05:47:10.976257'),
(38, 'smart', '0005_auto_20191111_2252', '2019-11-11 17:22:07.284607'),
(39, 'smart', '0006_admin_users', '2019-11-13 20:29:42.157840'),
(40, 'smart', '0007_auto_20191113_2042', '2019-11-13 20:29:42.164112'),
(41, 'smart', '0008_auto_20191113_2242', '2019-11-13 20:29:42.170113');

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
('01ud6a1ocqgg5ycnzv0em3fg00t5idcr', 'NGMyZmMyNTc0NzBkOTljNmExOWQ0YzMyNThkZTc5MDA3MWQxNmEwMTp7fQ==', '2019-10-07 10:51:52.104848'),
('0cgbpg16c7fyya9k184780g1rby9bbuq', 'OTc0MWI5MjMzMjg4NjdkOTg1OGNiNGMxYjYzNGJlZDE1ZjQzMDBmYTp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkBnbWFpbC5jb20ifQ==', '2019-09-13 19:06:55.031354'),
('0da9oa1cpl4olfjufq3aehwqz5gygmg7', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-04 10:22:43.809670'),
('0gnqp1m3cqiuqndo61xpueg76r8sz6hr', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-03 07:43:57.458231'),
('0i53yvjs1udz3ubhttgqm8jmveuosy2f', 'NmVjNTM5ODEwNTM2YzhiNmFlZDE0YmNmMGY2MGM1ZmU4MzBiM2M2YTp7InRlc3QiOiJndXJ1In0=', '2019-09-11 17:00:15.119808'),
('0ktuk15r0sj1s0dqnx6zv7c331rbz9ng', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-22 08:52:10.783371'),
('0l4o0pcz2suwhwamv3kj2gvmt0f7irx9', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-19 12:28:43.110141'),
('0lc98gudhde4t3dxyflaox2pdfxuhp1g', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-09-30 06:10:41.353010'),
('0stlicdbpg8ytn6mudjv6xp2oa1jrlqw', 'OTc0MWI5MjMzMjg4NjdkOTg1OGNiNGMxYjYzNGJlZDE1ZjQzMDBmYTp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkBnbWFpbC5jb20ifQ==', '2019-09-13 18:39:36.600580'),
('0xkj9qr3icclu4qyuii3jqias8eyi8pe', 'NGMyZmMyNTc0NzBkOTljNmExOWQ0YzMyNThkZTc5MDA3MWQxNmEwMTp7fQ==', '2019-09-19 05:21:47.208493'),
('0yev842lpdp9hcblyu1uh1mo725lvvh1', 'OWI2ODIxNTc3NjZkZGM4MDcyOWViMzFiMDAzZTQyNTJiN2Y1YmQ4YTp7ImxvZ2dlZF9pbiI6bnVsbH0=', '2019-09-30 06:13:00.754566'),
('19gllwqdaxepbxa5iylq8dawqjf5607p', 'NmVjNTM5ODEwNTM2YzhiNmFlZDE0YmNmMGY2MGM1ZmU4MzBiM2M2YTp7InRlc3QiOiJndXJ1In0=', '2019-09-11 16:56:19.411346'),
('1b5wri1k0cselc6etb14cy0jlxcubf8p', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-07 12:35:18.646084'),
('1f3tpipxeadenzm8dlo0nshjpix43cn6', 'NmVjNTM5ODEwNTM2YzhiNmFlZDE0YmNmMGY2MGM1ZmU4MzBiM2M2YTp7InRlc3QiOiJndXJ1In0=', '2019-09-11 16:56:09.334675'),
('1ft5v8wdw1qpowi1m2c00m0xa69r3vxa', 'NmVjNTM5ODEwNTM2YzhiNmFlZDE0YmNmMGY2MGM1ZmU4MzBiM2M2YTp7InRlc3QiOiJndXJ1In0=', '2019-09-11 16:56:29.489595'),
('1g56iu0b8pnv4qk6qw9eyhgddq0jyvpc', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-21 10:04:20.129038'),
('1isxs9s8dsuij3bd13gobeqhotoyz4rs', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-27 09:08:21.345837'),
('1libogbj8umd5vxlji14yz272duis6iv', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-27 09:53:26.857208'),
('1n4z9bwv47nfhcyzm69bqinphy66x2s3', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-21 10:35:35.293038'),
('1uhe3erhcp3qcfo2fbn2o9qpuksyernl', 'ZGQ1YWY1MGZjYjUzZmNlNjE1NmUyNGNhNTc1OTU1MGQ0YjRhZDg5Yzp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSIsInNlbnRfZW1haWxzIjpbXX0=', '2019-09-20 19:05:10.335036'),
('1w9q0zcsxkqjf29v1gmoh6n559ggdvme', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-29 07:45:47.689805'),
('1y1t20neiz45a9q2b19i0ame7s8tinqk', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-09-27 09:25:08.480687'),
('1zj0dy4sowy1xczile7ebvm8jufoac1i', 'NGMyZmMyNTc0NzBkOTljNmExOWQ0YzMyNThkZTc5MDA3MWQxNmEwMTp7fQ==', '2019-10-07 09:54:38.583259'),
('20awgzxfttpm6v1dzfkayk82ta3silas', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-21 10:27:01.838976'),
('24h1408w44v55peg4s8i0ovpkp0le9zc', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-27 09:47:42.174545'),
('280ppqijxhuquajyr22cr6iyz83bdzqr', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-27 10:45:52.153219'),
('2bfgnb7ed5arbeo289u4y71oudxc00kn', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-04 06:53:58.263989'),
('2ndt2u3a3yjktwnbvrmlaexcib5f9w1m', 'ZGQ1YWY1MGZjYjUzZmNlNjE1NmUyNGNhNTc1OTU1MGQ0YjRhZDg5Yzp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSIsInNlbnRfZW1haWxzIjpbXX0=', '2019-09-23 07:07:39.816921'),
('2pno54x9u01phqsd7dcdmggki8fcp4pl', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-27 09:38:25.700559'),
('2rcbaoctfk5l3zoc1ubh7zlgl5sd2r9s', 'NGMyZmMyNTc0NzBkOTljNmExOWQ0YzMyNThkZTc5MDA3MWQxNmEwMTp7fQ==', '2019-10-07 10:25:55.777268'),
('2vzyua16e6zndz0k8yp2iz0g02gswu3w', 'NGMyZmMyNTc0NzBkOTljNmExOWQ0YzMyNThkZTc5MDA3MWQxNmEwMTp7fQ==', '2019-10-04 09:37:08.270668'),
('30ve7jadgf4k7vfqvv8wxxnvxermbcpt', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-09-19 07:57:12.335407'),
('369ga6ysttn3ije1exsi7yu6iohql2ha', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-03 07:28:43.876816'),
('3bczyd6xegknmgdnfvd535czpek56atc', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-27 07:45:32.844860'),
('3dnv63e2dkx27s9jpm5fj408obfi3pvn', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-22 10:12:56.352131'),
('3du7dr5vcwb6bui3yyikxtlycz7f29v4', 'OWI2ODIxNTc3NjZkZGM4MDcyOWViMzFiMDAzZTQyNTJiN2Y1YmQ4YTp7ImxvZ2dlZF9pbiI6bnVsbH0=', '2019-09-23 09:07:21.601279'),
('3ez78q7jpwuu5s4amu1kxj2awyni2ch8', 'OWI2ODIxNTc3NjZkZGM4MDcyOWViMzFiMDAzZTQyNTJiN2Y1YmQ4YTp7ImxvZ2dlZF9pbiI6bnVsbH0=', '2019-09-27 09:23:26.048927'),
('3iuer891pzf34k3ktqreaw6ije07nwo9', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-27 09:24:19.975352'),
('3kea9h5gmb0eophi8fuhbggk20e5ntne', 'OGI2OGNiZGM1MTRmMWQzMTM0NjE2Y2YyZGQ5OTk1Njg0ZGE4NDAwYzp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJBRE1JTkBURVJSQUxPR0lDLkNPTSJ9', '2019-10-07 10:57:31.422547'),
('3lst5c8j5w2o5bahf36y83cw0jx9aw61', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-09-24 15:30:24.490464'),
('3p5f6175u8cvo90ql6sq99orlonvhn3h', 'NGMyZmMyNTc0NzBkOTljNmExOWQ0YzMyNThkZTc5MDA3MWQxNmEwMTp7fQ==', '2019-10-04 10:24:00.943046'),
('3rftszdm4vagnj1sr5tzetapyzcj4uqe', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-27 09:37:45.212419'),
('3vjbij1t3s3vxng3v89isx100atm7syr', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-02 07:38:04.503311'),
('3w2g00s9ir5y0ux6zi7j2nhf0pnwrp09', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-01 16:24:28.898570'),
('3z2cip6pibem6mabk746ez3outlbyhth', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-27 10:13:05.288367'),
('46sycemmj61qbqss9d85mz6ym2zhe9pq', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-27 09:34:08.129404'),
('46u1q4r8h0pjd6xea5777r03jke6p2ln', 'NGMyZmMyNTc0NzBkOTljNmExOWQ0YzMyNThkZTc5MDA3MWQxNmEwMTp7fQ==', '2019-10-04 10:04:14.382086'),
('49xujn9pqr3ehhkctje0fseicw91lct8', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-04 10:18:34.704966'),
('4c7v7ksskmsz3amfrma90y87bel0iq8u', 'OWI2ODIxNTc3NjZkZGM4MDcyOWViMzFiMDAzZTQyNTJiN2Y1YmQ4YTp7ImxvZ2dlZF9pbiI6bnVsbH0=', '2019-10-07 09:51:18.612099'),
('4pp8q8t87rt3aat665owtvuqo8x0dikz', 'NmVjNTM5ODEwNTM2YzhiNmFlZDE0YmNmMGY2MGM1ZmU4MzBiM2M2YTp7InRlc3QiOiJndXJ1In0=', '2019-09-11 16:56:24.452543'),
('4tjpaw3y6rlw3heuttnibigp87hs0dxp', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-03 11:36:08.422683'),
('4zifgveouaz0sf6bx255udbk77tsuhce', 'OWI2ODIxNTc3NjZkZGM4MDcyOWViMzFiMDAzZTQyNTJiN2Y1YmQ4YTp7ImxvZ2dlZF9pbiI6bnVsbH0=', '2019-09-23 09:07:20.121532'),
('50v2knawaufuk3kvqc6809w7a6vm947d', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-27 10:46:36.469175'),
('5j4nf2q93znafqreilp1ufr29u471i9d', 'NGMyZmMyNTc0NzBkOTljNmExOWQ0YzMyNThkZTc5MDA3MWQxNmEwMTp7fQ==', '2019-09-17 09:51:31.663096'),
('5p9464up78pmg4y7i3n3qx4a5b23dkuf', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-27 20:45:38.690634'),
('5qve0bbr6d3tsw1ezdxfh08vu2yyx7ap', 'OWI2ODIxNTc3NjZkZGM4MDcyOWViMzFiMDAzZTQyNTJiN2Y1YmQ4YTp7ImxvZ2dlZF9pbiI6bnVsbH0=', '2019-09-23 09:07:25.880636'),
('5v5pmeog3hj2f3v9gxn7utz80gjtnn77', 'ZGQ1YWY1MGZjYjUzZmNlNjE1NmUyNGNhNTc1OTU1MGQ0YjRhZDg5Yzp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSIsInNlbnRfZW1haWxzIjpbXX0=', '2019-09-21 08:11:54.472999'),
('5ywbfhqxse84t8t3irjmy0d8y5p2faxy', 'NmVjNTM5ODEwNTM2YzhiNmFlZDE0YmNmMGY2MGM1ZmU4MzBiM2M2YTp7InRlc3QiOiJndXJ1In0=', '2019-09-11 17:00:04.934874'),
('5zqhaccxq2t92kz13yaem8e33zk39kbt', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-09-20 09:26:03.801513'),
('627nhs7g0vvw94j0m9rdjkbujrwp37hq', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-22 05:17:48.776420'),
('65t4vxapp86xk7uqme6pdthcnsnwhuiq', 'OTc0MWI5MjMzMjg4NjdkOTg1OGNiNGMxYjYzNGJlZDE1ZjQzMDBmYTp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkBnbWFpbC5jb20ifQ==', '2019-09-13 12:41:17.708885'),
('6916s275tvk16se8mrhwx3anwtko97mg', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-03 08:50:25.944009'),
('69w3k14sug8pl9fdz6ortlzlsgt8yqny', 'OWI2ODIxNTc3NjZkZGM4MDcyOWViMzFiMDAzZTQyNTJiN2Y1YmQ4YTp7ImxvZ2dlZF9pbiI6bnVsbH0=', '2019-09-23 09:07:24.428957'),
('6esv3szy2b246eta45jj3xj3egvbbi4b', 'NGMyZmMyNTc0NzBkOTljNmExOWQ0YzMyNThkZTc5MDA3MWQxNmEwMTp7fQ==', '2019-10-07 10:15:49.538618'),
('6rqndtm25f979y6fz8chyptep5g5df2y', 'MDY0ODE5NmFjNTllNzk5OTE1Yzg1MjY1ODFiNjY0ZGMwMzRmNzFjYTp7ImFkbWluIjoiYWRtaW5AdGVycmFsb2dpYy5jb20iLCJsb2dnZWRfaW4iOm51bGx9', '2019-10-30 04:28:56.614393'),
('6tj32g18iejw8u5mwi7ggd267k2co5j5', 'OWI2ODIxNTc3NjZkZGM4MDcyOWViMzFiMDAzZTQyNTJiN2Y1YmQ4YTp7ImxvZ2dlZF9pbiI6bnVsbH0=', '2019-09-23 09:07:20.550718'),
('71mdkcb2d3hhwiaaq0jup3rwjzr2pnie', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-07 09:32:48.889825'),
('74n6b1bvsmbdzbkwsy1p97059qokx4fi', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-27 10:02:41.586307'),
('77e2gohtsmcjrn2d5dqdg8o48342r1b4', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-03 08:35:11.566408'),
('79sje06zzvmnd2ro5er5k143v4onsoxl', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-03 07:30:45.084078'),
('7js9leqcd69oscj5v584m7hmih0lxcop', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-27 10:30:09.409866'),
('7l0ytyxtbmqw2wpaj68h8581f25b22bb', 'MDY0ODE5NmFjNTllNzk5OTE1Yzg1MjY1ODFiNjY0ZGMwMzRmNzFjYTp7ImFkbWluIjoiYWRtaW5AdGVycmFsb2dpYy5jb20iLCJsb2dnZWRfaW4iOm51bGx9', '2019-10-30 11:26:46.131068'),
('7lvy1k81zv7y1wbe6j7s6smiudp8cbye', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-04 06:56:18.547056'),
('7xscagzerxqlflmuxs96s4hl9dqp904f', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-01 12:05:20.628611'),
('89tamrypi036dfbax7c9euwajf4ii2v9', 'NGMyZmMyNTc0NzBkOTljNmExOWQ0YzMyNThkZTc5MDA3MWQxNmEwMTp7fQ==', '2019-09-17 13:00:16.864189'),
('8ez6ukpdrjtqc99d5c2nunupsd9gvt9m', 'NmVjNTM5ODEwNTM2YzhiNmFlZDE0YmNmMGY2MGM1ZmU4MzBiM2M2YTp7InRlc3QiOiJndXJ1In0=', '2019-09-11 17:00:35.379687'),
('8ncspdbri5ephnn7lt9iuh4ahd6mr6q3', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-04 06:53:15.016824'),
('8o5acw3d9g7uqvyevs498r36u453v8st', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-25 10:51:33.847506'),
('8st4fkeplof9hh5wo7xodjoqaongat5t', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-22 09:10:18.276984'),
('8y89g7ctkx8xg5nqu68leg9eipqg36r9', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-21 09:51:44.801437'),
('96g9alo4azy4nfgg6cw7pisn1czx66er', 'MWFkZmM3NTU3MzIyOWI0MzY4OWYxNGQ2NzQ1MDEzZjkyMjExNDRhZjp7ImxvZ2dlZF9pbiI6Imd1cnVwcmFzYWQuYnJAdGVycmFsb2dpYy5jb20ifQ==', '2019-09-19 16:34:22.683082'),
('99q4a36xw2rboagqk5uwptzh3ooj2k4c', 'OWI2ODIxNTc3NjZkZGM4MDcyOWViMzFiMDAzZTQyNTJiN2Y1YmQ4YTp7ImxvZ2dlZF9pbiI6bnVsbH0=', '2019-09-23 09:07:27.526427'),
('9njktu345okaah7tfajssf6wtq8ij76e', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-04 09:18:25.797814'),
('9uttv0ewa68cev52i53b6hw06zfe6nxi', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-03 06:42:36.625047'),
('9wedpddq7ue8d1r3bbs3uvok2dj18jwk', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-27 09:20:31.179956'),
('al7jhocehzifw4rg50meu104khbxn9h1', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-03 08:39:03.023155'),
('amua5svy2duf89qolvasp53zqmywku8p', 'NGMyZmMyNTc0NzBkOTljNmExOWQ0YzMyNThkZTc5MDA3MWQxNmEwMTp7fQ==', '2019-10-04 10:03:53.464216'),
('ar2det0f3wvwep4jwmntjuv0n90chp0v', 'OWI2ODIxNTc3NjZkZGM4MDcyOWViMzFiMDAzZTQyNTJiN2Y1YmQ4YTp7ImxvZ2dlZF9pbiI6bnVsbH0=', '2019-09-23 09:07:25.131269'),
('askce65a1f8vhs1m3xdk9z3vc312fzk2', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-07 11:45:46.863878'),
('atzr8juos0qb8dy18rfikloqulcouncd', 'NGMyZmMyNTc0NzBkOTljNmExOWQ0YzMyNThkZTc5MDA3MWQxNmEwMTp7fQ==', '2019-10-07 10:50:12.533961'),
('axerdd5ewpw6rr1e822jv9kqze7kfaf7', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-22 06:22:33.973564'),
('b3qyyuvy1rmwmzatw79ftpvys75baxx7', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-27 09:59:57.947059'),
('b51y81ux1fvuulplrl82qx2j4tknoxll', 'NmVjNTM5ODEwNTM2YzhiNmFlZDE0YmNmMGY2MGM1ZmU4MzBiM2M2YTp7InRlc3QiOiJndXJ1In0=', '2019-09-11 17:01:00.649226'),
('b5lpltiozomrivv37wwgmcotvr6jgaf4', 'NTdlNDI4YjU0YTA5NzYwYTY5NTBlZGNjMzk5NGFiNGIyODM3MGY2Zjp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSIsInNlbnRfZW1haWxzIjpbInNlbnQ6IHdhbHRlcmtub2Nrc0BnbWFpbC5jb20iXX0=', '2019-09-27 09:18:55.797922'),
('b5raowx0nooofyhix28wlprajoioxikf', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-27 10:42:08.632221'),
('b6m24p93yise0mwz512fzhoe65gv2i1n', 'N2JlMTc2MTIwMTdkNmI5ZWZlMDc0YmFlN2M4ZmNkNDA3YmFjMzNkOTp7ImxvZ2dlZF9pbiI6ImtyaXNobmF2ZWVyYXBwYS5iQHRlcnJhbG9naWMuY29tIn0=', '2019-10-07 10:48:33.925261'),
('bbnj5aoxnfkqnlapwtkzssogxd9k6htp', 'NGMyZmMyNTc0NzBkOTljNmExOWQ0YzMyNThkZTc5MDA3MWQxNmEwMTp7fQ==', '2019-09-17 09:50:20.490028'),
('bc2r2quxnqj3fbkzrtqinltx9g2hneuo', 'NGMyZmMyNTc0NzBkOTljNmExOWQ0YzMyNThkZTc5MDA3MWQxNmEwMTp7fQ==', '2019-09-11 18:01:48.233906'),
('bc6wwh956oxi82d48rb14lvl7w0bhv8a', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-07 11:58:12.099347'),
('bde57ru6p2znfif5f0s3iyblz1kpc2bi', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-03 07:41:24.977012'),
('bqokxt4a2mc49rhr9zc69xie6l2sjou7', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-21 10:31:36.077964'),
('bszzdsiweic2xbm51afdth4z7vtvrka7', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-22 10:06:08.081786'),
('byajqsajku9ocsb1sgx3qux0lchr7df5', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-23 07:17:11.836323'),
('c2vait0ozjrlul7oqhxl236rd0pmuyoo', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-27 11:58:40.510914'),
('ccksz1r63hr33zcnwgp7tvvlzqzhk3qe', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-27 07:42:26.597278'),
('ckk0x0p5lk3txzbgbp436ddoa7xkh441', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-04 06:48:52.551256'),
('cq08bhqlydb64xhkzxsfmmwofqnaquju', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-03 07:33:33.694695'),
('cww64bf7bx8aejx100sak2jtd4kjhbtn', 'NmVjNTM5ODEwNTM2YzhiNmFlZDE0YmNmMGY2MGM1ZmU4MzBiM2M2YTp7InRlc3QiOiJndXJ1In0=', '2019-09-11 17:00:45.454343'),
('cxh80ikf3bk4ha8u5cczt4s6pxrqogbf', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-09-23 09:08:59.623044'),
('d2nns9tdp8mibl84bvbv6soq2pta0mnv', 'OWI2ODIxNTc3NjZkZGM4MDcyOWViMzFiMDAzZTQyNTJiN2Y1YmQ4YTp7ImxvZ2dlZF9pbiI6bnVsbH0=', '2019-09-23 09:07:23.094124'),
('d2uuwtej6bpr3subi6ci1orngm7bz9qw', 'NmVjNTM5ODEwNTM2YzhiNmFlZDE0YmNmMGY2MGM1ZmU4MzBiM2M2YTp7InRlc3QiOiJndXJ1In0=', '2019-09-11 16:55:59.246324'),
('d4m4hw0l24jwxawik4z4je98xyfev4sc', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-09-25 10:41:46.969393'),
('d91cj8rp321bqvkbbeh97uu56gknkc99', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-09-22 17:26:25.480436'),
('dc5n2wv62y36dlopmk6lewwbl9m858xj', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-27 10:16:44.079943'),
('dixk4bwqblfpuw1vv0l9leqbk5vl04dh', 'MzViMGQ0NDYyZWM2YjdhNzhhODc2NDQ2OGI4NzA3MzRhMGNhNGUxYjp7ImxvZ2dlZF9pbiI6InNhaW1hbmFzYS5wc0B0ZXJyYWxvZ2ljLmNvbSIsImFkbWluIjoiYWRtaW5AdGVycmFsb2dpYy5jb20iLCJfc2Vzc2lvbl9leHBpcnkiOjAsInFubyI6MTIsInRpbWVyIjoiMTc6MDE6MTciLCJxdWV0aW9uX3NldCI6WyIxMTQmc2VwOzxkaXY+YnVsayBxdWUgMjwvZGl2PlxuPHByZT5wZ208L3ByZT4mc2VwO29wdDEmc2VwO29wdDImc2VwO29wdDMmc2VwO29wdDQmc2VwO29wdDImc2VwOzQ0IiwiNTcmc2VwOzxkaXY+U29tZSBwcm92ZXJicy9pZGlvbXMgYXJlIGdpdmVuIGJlbG93IHRvZ2V0aGVyIHdpdGggdGhlaXIgbWVhbmluZ3MuIENob29zZSB0aGUgY29ycmVjdCBtZWFuaW5nIG9mIHByb3ZlcmIvaWRpb21cblRvIGhhdmUgYW4gYXhlIHRvIGdyaW5kXG48L2Rpdj4mc2VwO0EgcHJpdmF0ZSBlbmQgdG8gc2VydmUmc2VwO1RvIGZhaWwgdG8gYXJvdXNlIGludGVyZXN0JnNlcDtUbyBoYXZlIG5vIHJlc3VsdCZzZXA7VG8gd29yayBmb3IgYm90aCBzaWRlcyZzZXA7QSBwcml2YXRlIGVuZCB0byBzZXJ2ZSZzZXA7NDQiLCI2NiZzZXA7PGRpdj5UaGUgbGFzdCBhZGRyZXNzIG9mIElQIGFkZHJlc3MgcmVwcmVzZW50c1xuPC9kaXY+JnNlcDtVbmljYXN0IGFkZHJlc3Mmc2VwO05ldHdvcmsgYWRkcmVzcyZzZXA7QnJvYWRjYXN0IGFkZHJlc3Mmc2VwO05vbmUgb2YgYWJvdmUmc2VwO0Jyb2FkY2FzdCBhZGRyZXNzJnNlcDs0NCIsIjEyNyZzZXA7PGRpdj5idWxrIHF1ZSAxPC9kaXY+JnNlcDtvcHQxJnNlcDtvcHQyJnNlcDtvcHQzJnNlcDtvcHQ0JnNlcDtvcHQxJnNlcDs0NCIsIjc2JnNlcDs8ZGl2PldoYXQgaXMgdGhlIHVzZXMgb2Ygc3VibmV0dGluZz9cbjwvZGl2PiZzZXA7SXQgZGl2aWRlcyBvbmUgbGFyZ2UgbmV0d29yayBpbnRvIHNldmVyYWwgc21hbGxlciBvbmVzJnNlcDtJdCBkaXZpZGVzIG5ldHdvcmsgaW50byBuZXR3b3JrIGNsYXNzZXMmc2VwO0l0IHNwZWVkcyB1cCB0aGUgc3BlZWQgb2YgbmV0d29yayZzZXA7Tm9uZSBvZiBhYm92ZSZzZXA7SXQgZGl2aWRlcyBvbmUgbGFyZ2UgbmV0d29yayBpbnRvIHNldmVyYWwgc21hbGxlciBvbmVzJnNlcDs0NCIsIjY4JnNlcDs8ZGl2PkhvdyBtYW55IGxheWVycyBhcmUgaW4gdGhlIFRDUC9JUCBtb2RlbD88L2Rpdj4mc2VwOzQgbGF5ZXJzJnNlcDs1IGxheWVycyZzZXA7NiBsYXllcnMmc2VwOzcgbGF5ZXJzJnNlcDs0IGxheWVycyZzZXA7NDQiLCI1MiZzZXA7PGRpdj5BIHNlbnRlbmNlIGJyb2tlbiBpbnRvIGZpdmUgb3Igc2l4IHBhcnRzLiBKb2luIHRoZXNlIHBhcnRzIHRvIG1ha2UgYSBtZWFuaW5nZnVsIHNlbnRlbmNlLiBUaGUgY29ycmVjdCBvcmRlciBvZiBwYXJ0cyBpcyB0aGUgYW5zd2VyXG4mbHQ7YnImZ3Q7XG4xLiBkbyBcdTAwYTAgJmx0O2JyJmd0OzIuIHRvZGF5ICZsdDticiZndDsgXHUwMGEwMy4geW91ICZsdDticiZndDsgXHUwMGEwNC4gbXVzdCAmbHQ7YnImZ3Q7IFx1MDBhMDUuIGl0XG48L2Rpdj4mc2VwOzM0MTUyJnNlcDsyNTQxMyZzZXA7MTI1NDMmc2VwOzUxMzI0JnNlcDszNDE1MiZzZXA7NDQiLCI0OCZzZXA7PGRpdj5jaG9vc2UgdGhlIG9uZSB3aGljaCBiZXN0IGV4cHJlc3NlcyB0aGUgZ2l2ZW4gc2VudGVuY2UgaW4gUGFzc2l2ZS9BY3RpdmUgdm9pY2UmbHQ7YnImZ3Q7Jmx0O2JyJmd0O1xuQWZ0ZXIgZHJpdmluZyBwcm9mZXNzb3IgS3VtYXIgdG8gdGhlIG11c2V1bSBzaGUgZHJvcHBlZCBoaW0gYXQgaGlzIGhvdGVsLlxuPC9kaXY+JnNlcDtBZnRlciBiZWluZyBkcml2ZW4gdG8gdGhlIG11c2V1bSwgUHJvZmVzc29yIEt1bWFyIHdhcyBkcm9wcGVkIGF0IGhpcyBob3RlbC4mc2VwO1Byb2Zlc3NvciBLdW1hciB3YXMgYmVpbmcgZHJpdmVuIGRyb3BwZWQgYXQgaGlzIGhvdGVsLiZzZXA7QWZ0ZXIgc2hlIGhhZCBkcml2ZW4gUHJvZmVzc29yIEt1bWFyIHRvIHRoZSBtdXNldW0gc2hlIGhhZCBkcm9wcGVkIGhpbSBhdCBoaXMgaG90ZWwuJnNlcDtBZnRlciBzaGUgd2FzIGRyaXZlbiBQcm9mZXNzb3IgS3VtYXIgdG8gdGhlIG11c2V1bSBzaGUgaGFkIGRyb3BwZWQgaGltIGF0IGhpcyBob3RlbC4mc2VwO0FmdGVyIGJlaW5nIGRyaXZlbiB0byB0aGUgbXVzZXVtLCBQcm9mZXNzb3IgS3VtYXIgd2FzIGRyb3BwZWQgYXQgaGlzIGhvdGVsLiZzZXA7NDQiLCI0MyZzZXA7PGRpdj4gRmluZCB0aGUgY29ycmVjdGx5IHNwZWx0IHdvcmRzLjwvZGl2PiZzZXA7QmVuZWZpdHRlZCZzZXA7QmVuZWZpdGVkJnNlcDtCZW5pZml0ZWQmc2VwO0JlbmVmZXRlZCZzZXA7QmVuZWZpdGVkJnNlcDs0NCIsIjI4JnNlcDs8ZGl2PldoYXQgd2lsbCBiZSB0aGUgb3V0cHV0IG9mIHRoZSBwcm9ncmFtPyZsdDsvZGl2Jmd0O1xuJmx0O3ByZSZndDtcbiNpbmNsdWRlICZhbXA7bHQgc3RkaW8uaCAmYW1wO2d0XG5pbnQgbWFpbigpXG57XG4gXHUwMGEwIFx1MDBhMGNvbnN0IGludCB4PTU7XG4gXHUwMGEwIFx1MDBhMGNvbnN0IGludCAqcHRyeDtcbiBcdTAwYTAgXHUwMGEwcHRyeCA9ICZhbXA7eDtcbiBcdTAwYTAgXHUwMGEwKnB0cnggPSAxMDtcbiBcdTAwYTAgXHUwMGEwcHJpbnRmKCZxdW90OyVkXFxuJnF1b3Q7LCB4KTtcbiBcdTAwYTAgXHUwMGEwcmV0dXJuIDA7XG59XG48L2Rpdj4mc2VwOzUmc2VwO0Vycm9yJnNlcDsxMCZzZXA7R2FyYmFnZSBWYWx1ZSZzZXA7RXJyb3Imc2VwOzQ0IiwiMTImc2VwOzxkaXY+VGhlIHN1bSBvZiBhZ2VzIG9mIDUgY2hpbGRyZW4gYm9ybiBhdCB0aGUgaW50ZXJ2YWxzIG9mIDMgeWVhcnMgZWFjaCBpcyA1MCB5ZWFycy4gV2hhdCBpcyB0aGUgYWdlIG9mIHRoZSB5b3VuZ2VzdCBjaGlsZD88L2Rpdj4mc2VwOzQgeWVhcnMmc2VwOzggeWVhcnMmc2VwOzEwIHllYXJzJnNlcDtOb25lIG9mIHRoZXNlJnNlcDs0IHllYXJzJnNlcDs0NCIsIjc1JnNlcDs8ZGl2PldoYXQgZG9lcyBwcm90b2NvbCBkZWZpbmVzP1xuPC9kaXY+JnNlcDtQcm90b2NvbCBkZWZpbmVzIHdoYXQgZGF0YSBpcyBjb21tdW5pY2F0ZWQuJnNlcDtQcm90b2NvbCBkZWZpbmVzIGhvdyBkYXRhIGlzIGNvbW11bmljYXRlZC4mc2VwO1Byb3RvY29sIGRlZmluZXMgd2hlbiBkYXRhIGlzIGNvbW11bmljYXRlZC4mc2VwO0FsbCBvZiBhYm92ZSZzZXA7QWxsIG9mIGFib3ZlJnNlcDs0NCIsIjYwJnNlcDs8ZGl2PkZpbmQgdGhlIGNvcnJlY3RseSBzcGVsdCB3b3JkczwvZGl2PiZzZXA7SnVkaWNpb3VzJnNlcDtDYW5jaW91cyZzZXA7RG90YWdlJnNlcDtHcmFjb3VzJnNlcDtKdWRpY2lvdXMmc2VwOzQ0IiwiNDEmc2VwOzxkaXY+Y2hvb3NlIHRoZSB3b3JkIHdoaWNoIGlzIHRoZSBleGFjdCBPUFBPU0lURSBvZiB0aGUgZ2l2ZW4gd29yZHMuXG5FTk9STU9VU1xuPC9kaXY+JnNlcDtTb2Z0JnNlcDtBdmVyYWdlJnNlcDtUaW55JnNlcDtXZWFrJnNlcDtUaW55JnNlcDs0NCIsIjIyJnNlcDs8ZGl2PldoaWNoIG9mIHRoZSBmb2xsb3dpbmcgaXMgdGhlIGNvcnJlY3Qgb3JkZXIgb2YgZXZhbHVhdGlvbiBmb3IgdGhlIGJlbG93IGV4cHJlc3Npb24/Jmx0O2JyJmd0O1xueiA9IHggKyB5ICogeiAvIDQgJSAyIC0gMVxuPC9kaXY+JnNlcDsqIC8gJSArIC0gPSZzZXA7PSAqIC8gJSArIC0mc2VwOy8gKiAlIC0gKyA9JnNlcDsqICUgLyAtICsgPSZzZXA7KiAvICUgKyAtID0mc2VwOzQ0IiwiNDcmc2VwOzxkaXY+Y2hvb3NlIHRoZSBvbmUgd2hpY2ggY2FuIGJlIHN1YnN0aXR1dGVkIGZvciB0aGUgZ2l2ZW4gd29yZC9zZW50ZW5jZS4mbHQ7YnImZ3Q7Jmx0O2JyJmd0O1xuQSBwZXJzb24gb2YgZ29vZCB1bmRlcnN0YW5kaW5nIGtub3dsZWRnZSBhbmQgcmVhc29uaW5nIHBvd2VyXG48L2Rpdj4mc2VwO0V4cGVydCZzZXA7SW50ZWxsZWN0dWFsJnNlcDtTbm9iJnNlcDtMaXRlcmF0ZSZzZXA7SW50ZWxsZWN0dWFsJnNlcDs0NCIsIjU4JnNlcDs8ZGl2PnRoZSBzZW50ZW5jZXMgaGF2ZSBiZWVuIGdpdmVuIGluIERpcmVjdC9JbmRpcmVjdCBzcGVlY2guIEZyb20gdGhlIGdpdmVuIGFsdGVybmF0aXZlcywgY2hvb3NlIHRoZSBvbmUgd2hpY2ggYmVzdCBleHByZXNzZXMgdGhlIGdpdmVuIHNlbnRlbmNlIGluIEluZGlyZWN0L0RpcmVjdCBzcGVlY2hcdFxuJmx0O2JyJmd0O1xuSGUgc2FpZCB0byBoaXMgZmF0aGVyLCAmcXVvdDtQbGVhc2UgaW5jcmVhc2UgbXkgcG9ja2V0LW1vbmV5LiZxdW90O1xuPC9kaXY+JnNlcDtIZSB0b2xkIGhpcyBmYXRoZXIsIFwiUGxlYXNlIGluY3JlYXNlIHRoZSBwb2NrZXQtbW9uZXlcIiZzZXA7SGUgcmVxdWVzdGVkIGhpcyBmYXRoZXIgdG8gaW5jcmVhc2UgaGlzIHBvY2tldC1tb25leS4mc2VwO0hlIHBsZWFkZWQgaGlzIGZhdGhlciB0byBwbGVhc2UgaW5jcmVhc2UgbXkgcG9ja2V0IG1vbmV5LiZzZXA7SGUgYXNrZWQgaGlzIGZhdGhlciB0byBpbmNyZWFzZSBoaXMgcG9ja2V0LW1vbmV5LiZzZXA7SGUgcmVxdWVzdGVkIGhpcyBmYXRoZXIgdG8gaW5jcmVhc2UgaGlzIHBvY2tldC1tb25leS4mc2VwOzQ0IiwiNDQmc2VwOzxkaXY+IFNpbmNlIHRoZSBiZWdpbm5pbmcgb2YgaGlzdG9yeSAmbHQ7YnImZ3Q7XG5QIDpcdGhhdmUgbWFuYWdlZCB0byBjYXRjaCZsdDticiZndDtcblEgOlx0dGhlIEVza2ltb3MgYW5kIFJlZCBJbmRpYW5zJmx0O2JyJmd0O1xuUiA6XHRieSBhIHZlcnkgZGlmZmljdWx0eSBtZXRob2QmbHQ7YnImZ3Q7XG5TIDpcdGEgZmV3IHNwZWNpbWVucyBvZiB0aGlzIGFxdWF0aWMgYW5pbWFsJmx0O2JyJmd0O1xuVGhlIFByb3BlciBzZXF1ZW5jZSBzaG91bGQgYmU6XG48L2Rpdj4mc2VwO1FSUFMmc2VwO1NRUFImc2VwO1NRUlAmc2VwO1FQU1Imc2VwO1FQU1Imc2VwOzQ0IiwiNjMmc2VwOzxkaXY+IF9fX19fX18gcHJvdmlkZXMgYSBjb25uZWN0aW9uLW9yaWVudGVkIHJlbGlhYmxlIHNlcnZpY2UgZm9yIHNlbmRpbmcgbWVzc2FnZXM8L2Rpdj4mc2VwO1RDUCZzZXA7SVAmc2VwO1VEUCZzZXA7QWxsIG9mIHRoZSBhYm92ZSZzZXA7VENQJnNlcDs0NCIsIjU2JnNlcDs8ZGl2PkkgZmVsdCB0aGUgd2FsbCBvZiB0aGUgdHVubmVsIHNoaXZlci4gVGhlIG1hc3RlciBhbGFybSBzcXVlYWxlZCB0aHJvdWdoIG15IGVhcnBob25lcy4gQWxtb3N0IHNpbXVsdGFuZW91c2x5LCBKYWNrIHllbGxlZCBkb3duIHRvIG1lIHRoYXQgdGhlcmUgd2FzIGEgd2FybmluZyBsaWdodCBvbi4gRmxlZXRpbmcgYnV0IHNwZWN0YWN1bGFyIHNpZ2h0cyBzbmFwcGVkIGludG8gYW5zIG91dCBvZiB2aWV3LCB0aGUgc25vdywgdGhlIHNob3dlciBvZiBkZWJyaXMsIHRoZSBtb29uLCBsb29taW5nIGNsb3NlIGFuZCBiaWcsIHRoZSBkYXp6bGluZyBzdW5zaGluZSBmb3Igb25jZSB1bmZpbHRlcmVkIGJ5IGxheWVycyBvZiBhaXIuIFRoZSBsYXN0IHR3ZWx2ZSBob3VycyBiZWZvcmUgcmUtZW50cnkgd2VyZSBwYXJ0aWN1bGFyIGJvbmUtY2hpbGxpbmcuIER1cmluZyB0aGlzIHBlcmlvZCwgSSBoYWQgdG8gZ28gdXAgaW4gdG8gY29tbWFuZCBtb2R1bGUuIEV2ZW4gYWZ0ZXIgdGhlIGZpZXJ5IHJlLWVudHJ5IHNwbGFzaGluZyBkb3duIGluIDgxbyB3YXRlciBpbiBzb3V0aCBwYWNpZmljLCB3ZSBjb3VsZCBzdGlsbCBzZWUgb3VyIGZyb3N0eSBicmVhdGggaW5zaWRlIHRoZSBjb21tYW5kIG1vZHVsZS5cbiZsdDticiZndDtcblRoZSB3b3JkICYjeDI3O0NvbW1hbmQgTW9kdWxlJiN4Mjc7IHVzZWQgdHdpY2UgaW4gdGhlIGdpdmVuIHBhc3NhZ2UgaW5kaWNhdGVzIHBlcmhhcHMgdGhhdCBpdCBkZWFscyB3aXRoXG48L2Rpdj4mc2VwO2FuIGFsYXJtaW5nIGpvdXJuZXkmc2VwO2EgY29tbWFuZGluZyBzaXR1YXRpb24mc2VwO2Egam91cm5leSBpbnRvIG91dGVyIHNwYWNlJnNlcDthIGZyaWdodGZ1bCBiYXR0bGUuJnNlcDthIGpvdXJuZXkgaW50byBvdXRlciBzcGFjZSZzZXA7NDQiLCI3MiZzZXA7PGRpdj5XaGF0IGlzIHRoZSBzaXplIG9mIE5ldHdvcmsgYml0cyAmYW1wOyBIb3N0IGJpdHMgb2YgQ2xhc3MgQSBvZiBJUCBhZGRyZXNzPzwvZGl2PiZzZXA7TmV0d29yayBiaXRzIDcsIEhvc3QgYml0cyAyNCZzZXA7TmV0d29yayBiaXRzIDgsIEhvc3QgYml0cyAyNCZzZXA7TmV0d29yayBiaXRzIDcsIEhvc3QgYml0cyAyMyZzZXA7TmV0d29yayBiaXRzIDgsIEhvc3QgYml0cyAyMyZzZXA7TmV0d29yayBiaXRzIDcsIEhvc3QgYml0cyAyNCZzZXA7NDQiLCI4MCZzZXA7PGRpdj5XaGljaCBuZXR3b3JraW5nIGRldmljZSBjb25uZWN0IG9uZSBMQU4gdG8gb3RoZXIgTEFOIHVzaW5nXG5zYW1lIHByb3RvY29sP1xuPC9kaXY+JnNlcDtSb3V0ZXImc2VwO1N3aXRjaCZzZXA7QnJpZGdlJnNlcDtNb2RlbSZzZXA7U3dpdGNoJnNlcDs0NCIsIjc3JnNlcDs8ZGl2PlJlcGVhdGVyIG9wZXJhdGVzIGluIHdoaWNoIGxheWVyIG9mIHRoZSBPU0kgbW9kZWw/XG48L2Rpdj4mc2VwO1BoeXNpY2FsIGxheWVyJnNlcDtEYXRhIGxpbmsgbGF5ZXImc2VwO05ldHdvcmsgbGF5ZXImc2VwO1RyYW5zcG9ydCBsYXllciZzZXA7VHJhbnNwb3J0IGxheWVyJnNlcDs0NCIsIjUwJnNlcDs8ZGl2PkNob29zZSB0aGUgd29yZCB3aGljaCBiZXN0IGV4cHJlc3NlcyB0aGUgbWVhbmluZyBvZiB0aGUgZ2l2ZW4gd29yZC5cbiZsdDticiZndDsmbHQ7YnImZ3Q7XG5DQU5OWVxuPC9kaXY+JnNlcDtPYnN0aW5hdGUmc2VwO0hhbmRzb21lJnNlcDtDbGV2ZXImc2VwO1N0b3V0JnNlcDtDbGV2ZXImc2VwOzQ0IiwiNTkmc2VwOzxkaXY+Y2hvb3NlIHRoZSBvbmUgd2hpY2ggY2FuIGJlIHN1YnN0aXR1dGVkIGZvciB0aGUgZ2l2ZW4gd29yZC9zZW50ZW5jZS4mbHQ7YnImZ3Q7XG5FeHRyZW1lIG9sZCBhZ2Ugd2hlbiBhIG1hbiBiZWhhdmVzIGxpa2UgYSBmb29sXG48L2Rpdj4mc2VwO0ltYmVjaWxpdHkmc2VwO1NlbmlsaXR5JnNlcDtEb3RhZ2Umc2VwO1N1cGVyYW5udWF0aW9uJnNlcDtEb3RhZ2Umc2VwOzQ0IiwiNjImc2VwOzxkaXY+QnJpZGdlIHdvcmtzIGluIHdoaWNoIGxheWVyIG9mIHRoZSBPU0kgbW9kZWw/XG48L2Rpdj4mc2VwO0FwcGxpYXRpb24gbGF5ZXImc2VwO1RyYW5zcG9ydCBsYXllciZzZXA7TmV0d29yayBsYXllciZzZXA7RGF0YWxpbmsgbGF5ZXImc2VwO0RhdGFsaW5rIGxheWVyJnNlcDs0NCIsIjc0JnNlcDs8ZGl2PlRoZSBJbnRlcm5ldCBpcyBhbiBleGFtcGxlIG9mXG48L2Rpdj4mc2VwO0NlbGwgc3dpdGNoZWQgbmV0d29yayZzZXA7Y2lyY3VpdCBzd2l0Y2hlZCBuZXR3b3JrJnNlcDtQYWNrZXQgc3dpdGNoZWQgbmV0d29yayZzZXA7QWxsIG9mIGFib3ZlJnNlcDtQYWNrZXQgc3dpdGNoZWQgbmV0d29yayZzZXA7NDQiLCI3MSZzZXA7PGRpdj5XaGF0IGlzIHRoZSBhZGRyZXNzIHNpemUgb2YgSVB2NiA/XG48L2Rpdj4mc2VwOzMyIGJpdCZzZXA7NjQgYml0JnNlcDsxMjggYml0JnNlcDsyNTYgYml0JnNlcDsxMjggYml0JnNlcDs0NCIsIjY1JnNlcDs8ZGl2PldoaWNoIG9mIHRoZSBmb2xsb3dpbmcgSVAgYWRkcmVzcyBjbGFzcyBpcyBNdWx0aWNhc3RcbjwvZGl2PiZzZXA7Q2xhc3MgQSZzZXA7Q2xhc3MgQiZzZXA7Q2xhc3MgQyZzZXA7Q2xhc3MgRCZzZXA7Q2xhc3MgRCZzZXA7NDQiLCI5NiZzZXA7PGRpdj5UaGUgcHJvdG9jb2wgZGF0YSB1bml0KFBEVSkgZm9yIHRoZSBhcHBsaWNhdGlvbiBsYXllciBpbiB0aGUgSW50ZXJuZXQgc3RhY2sgaXM8L2Rpdj4mc2VwO1NlZ21lbnQmc2VwO0RhdGFncmFtJnNlcDtNZXNzYWdlJnNlcDtGcmFtZSZzZXA7TWVzc2FnZSZzZXA7NDQiLCIyNiZzZXA7PGRpdj5XaGljaCBiaXR3aXNlIG9wZXJhdG9yIGlzIHN1aXRhYmxlIGZvciB0dXJuaW5nIG9mZiBhIHBhcnRpY3VsYXIgYml0IGluIGEgbnVtYmVyP1xuPC9kaXY+JnNlcDsmJiBvcGVyYXRvciZzZXA7JiBvcGVyYXRvciZzZXA7fHwgb3BlcmF0b3Imc2VwOyEgb3BlcmF0b3Imc2VwOyYgb3BlcmF0b3Imc2VwOzQ0IiwiNDYmc2VwOzxkaXY+IFRoZSBmaXJzdCBhbmQgc2l4dGggc2VudGVuY2UgYXJlIGdpdmVuIGluIHRoZSBiZWdpbmluZy5UaGUgbWlkZGxlIGZvdXIgc2VudGVuY2VzIGluIGVhY2ggaGF2ZSBiZWVuIHJlbW92ZWQgYW5kIGp1bWJsZWQgdXAuIFRoZXNlIGFyZSBsYWJlbGxlZCBhcyBQLCBRLCBSIGFuZCBTLiBGaW5kIG91dCB0aGUgcHJvcGVyIG9yZGVyIGZvciB0aGUgZm91ciBzZW50ZW5jZXMmbHQ7YnImZ3Q7XG5TMTpcdENhbGN1dHRhIHVubGlrZSBvdGhlciBjaXRpZXMga2VwdHMgaXRzIHRyYW1zLiZsdDticiZndDtcblAgOlx0QXMgYSByZXN1bHQgdGhlcmUgaG9ycmVuZG91cyBjb25nZXN0aW9uLiZsdDticiZndDtcblEgOlx0SXQgd2FzIGdvaW5nIHRvIGJlIHRoZSBmaXJzdCBpbiBTb3V0aCBBc2lhLiZsdDticiZndDtcblIgOlx0VGhleSBydW4gZG93biB0aGUgY2VudHJlIG9mIHRoZSByb2FkJmx0O2JyJmd0O1xuUyA6XHRUbyBlYXNlIGluIHRoZSBjaXR5IGRlY2lkZWQgdG8gYnVpbGQgYW4gdW5kZXJncm91bmQgcmFpbHdheSBsaW5lLiZsdDticiZndDtcblM2Olx0VGhlIGZvdW5kYXRpb24gc3RvbmUgd2FzIGxhaWQgaW4gMTk3Mi4mbHQ7YnImZ3Q7XG5UaGUgUHJvcGVyIHNlcXVlbmNlIHNob3VsZCBiZTpcbjwvZGl2PiZzZXA7UFJTUSZzZXA7UFNRUiZzZXA7U1FSUCZzZXA7UlBTUSZzZXA7UlBTUSZzZXA7NDQiLCI0MiZzZXA7PGRpdj5SZWFkIGVhY2ggc2VudGVuY2UgdG8gZmluZCBvdXQgd2hldGhlciB0aGVyZSBpcyBhbnkgZ3JhbW1hdGljYWwgZXJyb3IgaW4gaXQuIFRoZSBlcnJvciwgaWYgYW55IHdpbGwgYmUgaW4gb25lIHBhcnQgb2YgdGhlIHNlbnRlbmNlLiBUaGUgbGV0dGVyIG9mIHRoYXQgcGFydCBpcyB0aGUgYW5zd2VyLiBJZiB0aGVyZSBpcyBubyBlcnJvciwgdGhlIGFuc3dlciBpcyAmI3gyNztEJiN4Mjc7LiAoSWdub3JlIHRoZSBlcnJvcnMgb2YgcHVuY3R1YXRpb24sIGlmIGFueSlcbjwvZGl2PiZzZXA7V2UgZGlzY3Vzc2VkIGFib3V0IHRoZSBwcm9ibGVtIHNvIHRob3JvdWdobHkmc2VwO29uIHRoZSBldmUgb2YgdGhlIGV4YW1pbmF0aW9uJnNlcDt0aGF0IEkgZm91bmQgaXQgdmVyeSBlYXN5IHRvIHdvcmsgaXQgb3V0JnNlcDtObyBlcnJvciZzZXA7V2UgZGlzY3Vzc2VkIGFib3V0IHRoZSBwcm9ibGVtIHNvIHRob3JvdWdobHkmc2VwOzQ0IiwiMTEzJnNlcDs8ZGl2PmJ1bGsgcXVlIDE8L2Rpdj4mc2VwO29wdDEmc2VwO29wdDImc2VwO29wdDMmc2VwO29wdDQmc2VwO29wdDEmc2VwOzQ0IiwiNzAmc2VwOzxkaXY+V2hpY2ggb2YgZm9sbG93aW5nIHByb3ZpZGVzIHJlbGlhYmxlIGNvbW11bmljYXRpb24/XG48L2Rpdj4mc2VwO1RDUCZzZXA7SVAmc2VwO1VEUCZzZXA7QWxsIG9mIHRoZSBhYm92ZSZzZXA7VENQJnNlcDs0NCIsIjU0JnNlcDs8ZGl2PkFuIGluY29tcGxldGUgc3RhdGVtZW50IChTdGVtKSBmb2xsb3dlZCBieSBmaWxsZXJzIGlzIGdpdmVuLiBQaWNrIG91dCB0aGUgYmVzdCBvbmUgd2hpY2ggY2FuIGNvbXBsZXRlIGluY29tcGxldGUgc3RlbSBjb3JyZWN0bHkgYW5kIG1lYW5pbmdmdWxseS5cdFxuJmx0O2JyJmd0O1xuRGVzcGl0ZSBoaXMgYmVzdCBlZmZvcnRzIHRvIGNvbmNlYWwgaGlzIGFuZ2VyIC4uLi4uLlxuXG48L2Rpdj4mc2VwO3dlIGNvdWxkIGRldGVjdCB0aGF0IGhlIHdhcyB2ZXJ5IGhhcHB5JnNlcDtoZSBmYWlsZWQgdG8gZ2l2ZSB1cyBhbiBpbXByZXNzaW9uIG9mIGhpcyBhZ29ueSZzZXA7aGUgc3VjY2VlZGVkIGluIGNhbW91ZmxhZ2luZyBoaXMgZW1vdGlvbnMmc2VwO3Blb3BsZSBjYW1lIHRvIGtub3cgdGhhdCBoZSB3YXMgYW5ub3llZCZzZXA7cGVvcGxlIGNhbWUgdG8ga25vdyB0aGF0IGhlIHdhcyBhbm5veWVkJnNlcDs0NCIsIjc5JnNlcDs8ZGl2PldoaWNoIG9mIHRoZSBmb2xsb3dpbmcgaXMgYW4gZXhhbXBsZSBvZiBQZXJzb25hbCBBcmVhIE5ldHdvcmtpbmc/PC9kaXY+JnNlcDtXQU4mc2VwO1dMQU4mc2VwO0JsdWV0b290aCZzZXA7QWxsIG9mIHRoZSBhYm92ZSZzZXA7Qmx1ZXRvb3RoJnNlcDs0NCIsIjUxJnNlcDs8ZGl2PlBpY2sgb3V0IHRoZSBtb3N0IGVmZmVjdGl2ZSB3b3JkKHMpIGZyb20gdGhlIGdpdmVuIHdvcmRzIHRvIGZpbGwgaW4gdGhlIGJsYW5rIHRvIG1ha2UgdGhlIHNlbnRlbmNlIG1lYW5pbmdmdWxseSBjb21wbGV0ZS5cbiZsdDticiZndDtcblJvaGFuIGFuZCBSb2hpdCBhcmUgdHdpbiBicm90aGVycywgYnV0IHRoZXkgZG8gbm90IGxvb2sgLi4uLi4uXG48L2Rpdj4mc2VwO3VuaXF1ZSZzZXA7ZGlmZmVyZW50JnNlcDtsaWtlbHkmc2VwO2FsaWtlJnNlcDthbGlrZSZzZXA7NDQiLCI0NSZzZXA7PGRpdj5DaG9vc2UgdGhlIGNvcnJlY3QgYWx0ZXJuYXRpdmUuIEluIGNhc2Ugbm8gaW1wcm92ZW1lbnQgaXMgbmVlZGVkLCBvcHRpb24gJiN4Mjc7RCYjeDI3OyBpcyB0aGUgYW5zd2VyLlxuVGhlIHdvcmtlcnMgYXJlIGhlbGwgYmVudCBhdCBnZXR0aW5nIHdoYXQgaXMgZHVlIHRvIHRoZW0uXG48L2Rpdj4mc2VwO2hlbGwgYmVudCBvbiBnZXR0aW5nJnNlcDtoZWxsIGJlbnQgZm9yIGdldHRpbmcmc2VwO2hlbGwgYmVudCB1cG9uIGdldHRpbmcmc2VwO05vIGltcHJvdmVtZW50JnNlcDtoZWxsIGJlbnQgdXBvbiBnZXR0aW5nJnNlcDs0NCIsIjU1JnNlcDs8ZGl2PlJlYXJyYW5nZSB0aGUgZm9sbG93aW5nIGZpdmUgc2VudGVuY2VzIGluIHByb3BlciBzZXF1ZW5jZSBzbyBhcyB0byBmb3IgYSBtZWFuaW5nZnVsIHBhcmFncmFwaCwgdGhlbiBhbnN3ZXIgdGhlIHF1ZXN0aW9ucyBnaXZlbiBiZWxvdyB0aGVtLiZsdDticiZndDtcbiBcdTAwYTAgXHUwMGEwIFx1MDBhMCBcdTAwYTAxIEFmdGVyIEV4YW1pbmluZyBoaW0sIHRoZSBkb2N0b3Igc21pbGVkIGF0IGhpbSBtaXNjaGlldm91c2x5IGFuZCB0b29rIG91dCBhIHN5cmluZ2UuJmx0O2JyJmd0O1xuXHQyIFRoaW5raW5nIHRoYXQgaGUgd2FzIHJlYWxseSBzaWNrLCBoaXMgZmF0aGVyIHN1bW1vbmVkIHRoZSBmYW1pbHkgZG9jdG9yLiZsdDticiZndDtcblx0MyBUaGF0IGRheSwgTWludHUgd2FudGVkIHRvIHRha2UgYSBkYXkgb2ZmIGZyb20gc2Nob29sJmx0O2JyJmd0O1xuXHQ0IEltbWVkaWF0ZWx5LCBNaW50dSBqdW1wZWQgdXAgZnJvbSBoaXMgYmVkIGFuZCBzd29yZSB0aGUgaGUgd2FzIGZpbmUmbHQ7YnImZ3Q7XG5cdDUgVGhlcmVmb3I7IGhlIHByZXRlbmRlZCB0byBiZSBzaWNrIGFuZCByZW1haW5lZCBpbiBiZWQuJmx0O2JyJmd0O1xuJmx0O2JyJmd0O1xuV2hpY2ggc2VudGVuY2Ugc2hvdWxkIGNvbWUgZm91cnRoIGluIHRoZSBwYXJhZ3JhcGg/PC9kaXY+JnNlcDsxJnNlcDsyJnNlcDszJnNlcDs0JnNlcDsxJnNlcDs0NCIsIjQ5JnNlcDs8ZGl2PlNlbGVjdCB0aGUgcGFpciB3aGljaCBoYXMgdGhlIHNhbWUgcmVsYXRpb25zaGlwLlxuJmx0O2JyJmd0OyZsdDticiZndDtcbkRJVkE6T1BFUkE8L2Rpdj4mc2VwO3Byb2R1Y2VyOnRoZWF0cmUmc2VwO2RpcmVjdG9yOmRyYW1hJnNlcDtjb25kdWN0b3I6YnVzJnNlcDt0aGVzcGlhbjpwbGF5JnNlcDt0aGVzcGlhbjpwbGF5JnNlcDs0NCIsIjYxJnNlcDs8ZGl2PkVhY2ggSVAgcGFja2V0IG11c3QgY29udGFpblxuPC9kaXY+JnNlcDtTb3VyY2Ugb3IgRGVzdGluYXRpb24gYWRkcmVzcyZzZXA7T25seSBTb3VyY2UgYWRkcmVzcyZzZXA7T25seSBEZXN0aW5hdGlvbiBhZGRyZXNzJnNlcDtTb3VyY2UgYW5kIERlc3RpbmF0aW9uIGFkZHJlc3Mmc2VwO1NvdXJjZSBhbmQgRGVzdGluYXRpb24gYWRkcmVzcyZzZXA7NDQiLCI2OSZzZXA7PGRpdj4gV2hhdCBpcyB0aGUgbWluaW11bSBoZWFkZXIgc2l6ZSBvZiBhbiBJUCBwYWNrZXQ/XG48L2Rpdj4mc2VwOzE2IGJ5dGVzJnNlcDsxMCBieXRlcyZzZXA7MjAgYnl0ZXMmc2VwOzMyIGJ5dGVzJnNlcDsyMCBieXRlcyZzZXA7NDQiLCI0MCZzZXA7PGRpdj5XaGF0IGRvIHRoZSBmb2xsb3dpbmcgZGVjbGFyYXRpb24gc2lnbmlmeT8mbHQ7L2RpdiZndDtcbiZsdDtwcmUmZ3Q7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFxuICBpbnQgKCpwZikoKTtcbjwvZGl2PiZzZXA7cGYgaXMgYSBwb2ludGVyIHRvIGEgZnVuY3Rpb24gd2hpY2ggcmV0dXJuIGludCAmc2VwO3BmIGlzIGEgZnVuY3Rpb24gcG9pbnRlci4mc2VwO3BmIGlzIGEgcG9pbnRlciB0byBmdW5jdGlvbi4mc2VwO3BmIGlzIGEgZnVuY3Rpb24gb2YgcG9pbnRlciB2YXJpYWJsZSZzZXA7cGYgaXMgYSBwb2ludGVyIHRvIGEgZnVuY3Rpb24gd2hpY2ggcmV0dXJuIGludCAmc2VwOzQ0IiwiMTAzJnNlcDs8ZGl2PldoYXQgcGVyY2VudCBvZiAxMjAgYXJlIDkwPzwvZGl2PiZzZXA7MjUlJnNlcDs1MCUmc2VwOzc1JSZzZXA7MzMlJnNlcDs3NSUmc2VwOzQ0IiwiNjQmc2VwOzxkaXY+V2hpY2ggbGF5ZXJzIG9mIHRoZSBPU0kgbW9kZWwgYXJlIGhvc3QtdG8taG9zdCBsYXllcnM/XG48L2Rpdj4mc2VwO1RyYW5zcG9ydCwgU2Vzc2lvbiwgUHJlc2VudGF0aW9uLCBBcHBsaWNhdGlvbiZzZXA7TmV0d29yaywgVHJhbnNwb3J0LCBTZXNzaW9uLCBQcmVzZW50YXRpb24mc2VwO0RhdGFsaW5rLCBOZXR3b3JrLCBUcmFuc3BvcnQsIFNlc3Npb24mc2VwO1BoeXNpY2FsLCBEYXRhbGluaywgTmV0d29yaywgVHJhbnNwb3J0JnNlcDtUcmFuc3BvcnQsIFNlc3Npb24sIFByZXNlbnRhdGlvbiwgQXBwbGljYXRpb24mc2VwOzQ0IiwiNzgmc2VwOzxkaXY+V2hpY2ggb2YgdGhlIGZvbGxvd2luZyBuZXR3b3JrIGRldmljZSBoYXMgdGhlIHNsb3dlc3QgdHlwZSBvZlxuY29ubmVjdGlvbj9cbjwvZGl2PiZzZXA7RFNMJnNlcDtSb3V0ZXImc2VwO0JyaWRnZXMmc2VwO0RpYWwtdXAgbW9kZW1zJnNlcDtEaWFsLXVwIG1vZGVtcyZzZXA7NDQiLCIxMTYmc2VwOzxkaXY+YnVsayBxdWUgNDwvZGl2PiZzZXA7b3B0MSZzZXA7b3B0MiZzZXA7b3B0MyZzZXA7b3B0NCZzZXA7b3B0NCZzZXA7NDQiLCI2NyZzZXA7PGRpdj5Ib3cgbWFueSBiaXRzIGFyZSB0aGVyZSBpbiB0aGUgRXRoZXJuZXQgYWRkcmVzcz9cbjwvZGl2PiZzZXA7NjQgYml0cyZzZXA7NDggYml0cyZzZXA7MzIgYml0cyZzZXA7MTYgYml0cyZzZXA7NDggYml0cyZzZXA7NDQiLCIxMjQmc2VwOzxkaXY+YnVsayBxdWUgMzwvZGl2PiZzZXA7b3B0MSZzZXA7b3B0MiZzZXA7b3B0MyZzZXA7b3B0NCZzZXA7b3B0MyZzZXA7NDQiXSwicHJldl9xdWUiOm51bGwsInNjb3JlIjoxLCJxdWVfY250IjowLCJzZWxlY3RlZF9jb2RlX3F1ZXN0aW9ucyI6W1szMCwiZG8gamF2YSBwZ20iLCJpbXBvcnQgamF2YS51dGlsLlNjYW5uZXI7ICAvLyBJbXBvcnQgdGhlIFNjYW5uZXIgY2xhc3NcblxuY2xhc3MgcGdtIHtcbiAgcHVibGljIHN0YXRpYyB2b2lkIG1haW4oU3RyaW5nW10gYXJncykge1xuICAgIFNjYW5uZXIgbXlPYmogPSBuZXcgU2Nhbm5lcihTeXN0ZW0uaW4pOyAgLy8gQ3JlYXRlIGEgU2Nhbm5lciBvYmplY3RcbiAgICBTeXN0ZW0ub3V0LnByaW50bG4oJnF1b3Q7RW50ZXIgdXNlcm5hbWUmcXVvdDspO1xuXG4gICAgU3RyaW5nIHVzZXJOYW1lID0gbXlPYmoubmV4dExpbmUoKTsgIC8vIFJlYWQgdXNlciBpbnB1dFxuICAgIFN5c3RlbS5vdXQucHJpbnRsbigmcXVvdDtVc2VybmFtZSBpczogJnF1b3Q7ICsgdXNlck5hbWUpOyAgLy8gT3V0cHV0IHVzZXIgaW5wdXRcbiAgfVxufSIsImphdmEiLCJndXJ1IiwicmFqIiwic3dhZ2F0aCIsInZpc2hyYW0iLCJwcmFqd2FsIiwiRW50ZXIgdXNlcm5hbWVcblVzZXJuYW1lIGlzOiByYWoiLCJFbnRlciB1c2VybmFtZVxuVXNlcm5hbWUgaXM6IHN3YWdhdGgiLCJFbnRlciB1c2VybmFtZVxuVXNlcm5hbWUgaXM6IHZpc2hyYW0iLCJFbnRlciB1c2VybmFtZVxuVXNlcm5hbWUgaXM6IHByYWp3YWwiXSxbMzEsInRlc3RjYXNlMiIsImltcG9ydCBqYXZhLnV0aWwuU2Nhbm5lcjsgIC8vIEltcG9ydCB0aGUgU2Nhbm5lciBjbGFzc1xuXG5jbGFzcyBwZ20ge1xuICBwdWJsaWMgc3RhdGljIHZvaWQgbWFpbihTdHJpbmdbXSBhcmdzKSB7XG4gICAgU2Nhbm5lciBteU9iaiA9IG5ldyBTY2FubmVyKFN5c3RlbS5pbik7ICAvLyBDcmVhdGUgYSBTY2FubmVyIG9iamVjdFxuICAgIFN5c3RlbS5vdXQucHJpbnRsbigmcXVvdDtFbnRlciBuYW1lJnF1b3Q7KTtcblxuICAgIFN0cmluZyB1c2VyTmFtZSA9IG15T2JqLm5leHRMaW5lKCk7ICAvLyBSZWFkIHVzZXIgaW5wdXRcbiAgICBTeXN0ZW0ub3V0LnByaW50bG4oJnF1b3Q7VVIgbmFtZSBpczogJnF1b3Q7ICsgdXNlck5hbWUpOyAgLy8gT3V0cHV0IHVzZXIgaW5wdXRcbiAgfVxufSIsImphdmEiLCJleGFtcGxlMSIsInRlc3QxIiwidGVzdDIiLCJ0ZXN0MyIsInRlc3Q0IiwiRW50ZXIgbmFtZVxuVVIgbmFtZSBpczogdGVzdDEiLCJFbnRlciBuYW1lXG5VUiBuYW1lIGlzOiB0ZXN0MiIsIkVudGVyIG5hbWVcblVSIG5hbWUgaXM6IHRlc3QzIiwiRW50ZXIgbmFtZVxuVVIgbmFtZSBpczogdGVzdDQiXSxbMzMsIkphdmEgcHJvZ3JhbSB0byBmaW5kIHRoZSBBU0NJSSB2YWx1ZSBvZiBhIGNoYXJhY3RlciIsImltcG9ydCBqYXZhLnV0aWwuKjtcbnB1YmxpYyBjbGFzcyBwZ21cbntcbnB1YmxpYyBzdGF0aWMgdm9pZCBtYWluKFN0cmluZ1tdIGFyZ3MpXG57XG5jaGFyIGNoO1xuU2Nhbm5lciBzYyA9IG5ldyBTY2FubmVyKFN5c3RlbS5pbik7XG5jaCA9IHNjLm5leHQoKS5jaGFyQXQoMCk7XG5pbnQgYXNjaWkgPSAoaW50KSBjaDtcblN5c3RlbS5vdXQucHJpbnRsbigmcXVvdDtBU0NJSSBvZiAmcXVvdDsgKyBjaCArICZxdW90OyBpcyAmcXVvdDsgKyBhc2NpaSk7ICAgLy8gUHJpbnRzIHRoZSBBU0NJSSB2YWx1ZSBvZiB0aGUgaW5wdXQgY2hhcmFjdGVyXG59XG59IiwiamF2YSIsImEiLCIxIiwibiIsIn4iLCJBIiwiQVNDSUkgb2YgMSBpcyA0OSIsIkFTQ0lJIG9mIG4gaXMgMTEwIiwiQVNDSUkgb2YgfiBpcyAxMjYiLCJBU0NJSSBvZiBBIGlzIDY1Il0sWzMyLCJDIHByb2dyYW0gdG8gY2hlY2sgd2hldGhlciB0aGUgY2hhcmFjdGVyIGlzIGFuIGFscGhhYmV0IG9yIG5vdCIsIiNpbmNsdWRlICZsdDtzdGRpby5oJmd0O1xuaW50IG1haW4oKVxue1xuY2hhciBjaDtcbnByaW50ZigmcXVvdDtFbnRlciBhIGNoYXJhY3RlcjogJnF1b3Q7KTtcbnNjYW5mKCZxdW90OyAlYyZxdW90OywmYW1wO2NoKTtcbnByaW50ZigmcXVvdDtcXG4mcXVvdDspO1xuaWYoIChjaCAmZ3Q7PSAmI3gyNzthJiN4Mjc7ICZhbXA7JmFtcDsgY2ggJmx0Oz0gJiN4Mjc7eiYjeDI3OykgfHwgKCBjaCAmZ3Q7PSAmI3gyNztBJiN4Mjc7ICZhbXA7JmFtcDsgY2ggJmx0Oz0mI3gyNztaJiN4Mjc7KSlcbnByaW50ZigmcXVvdDslYyBpcyBhbiBhbHBoYWJldFxcbiZxdW90OyxjaCk7XG5lbHNlXG5wcmludGYoJnF1b3Q7JWMgaXMgbm90IGFuIGFscGhhYmV0XFxuJnF1b3Q7LGNoKTtcblxucmV0dXJuIDA7XG59IiwiY3BwIiwiYSIsIjEiLCJ6IiwiQSIsIjAiLCJFbnRlciBhIGNoYXJhY3RlcjogXG4xIGlzIG5vdCBhbiBhbHBoYWJldCIsIkVudGVyIGEgY2hhcmFjdGVyOiBcbnogaXMgYW4gYWxwaGFiZXQiLCJFbnRlciBhIGNoYXJhY3RlcjogXG5BIGlzIGFuIGFscGhhYmV0IiwiRW50ZXIgYSBjaGFyYWN0ZXI6IFxuMCBpcyBub3QgYW4gYWxwaGFiZXQiXV19', '2019-11-27 11:31:48.439165'),
('dlh4cvv8lsgaicfcmewf3l1cyqjbkf89', 'OWI2ODIxNTc3NjZkZGM4MDcyOWViMzFiMDAzZTQyNTJiN2Y1YmQ4YTp7ImxvZ2dlZF9pbiI6bnVsbH0=', '2019-09-23 09:07:22.049328'),
('dmkxbud1z5jkjhekw9ahyzv0rsp819xo', 'NGMyZmMyNTc0NzBkOTljNmExOWQ0YzMyNThkZTc5MDA3MWQxNmEwMTp7fQ==', '2019-09-17 09:52:34.451350'),
('dslclgmvtuorit6dcs8e2xl4agcjn4f1', 'NmVjNTM5ODEwNTM2YzhiNmFlZDE0YmNmMGY2MGM1ZmU4MzBiM2M2YTp7InRlc3QiOiJndXJ1In0=', '2019-09-11 17:01:15.844453'),
('dwr3xssfbtzfdg16xfmpykmvfzf4wqud', 'NGMyZmMyNTc0NzBkOTljNmExOWQ0YzMyNThkZTc5MDA3MWQxNmEwMTp7fQ==', '2019-11-22 10:01:42.912716'),
('e304suqx9jbixoa50a4k18mb51b61twp', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-21 10:01:54.549725'),
('ebgzhrkuvelaa6760kkikodfd30bgho9', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-22 10:07:27.224549'),
('efmhjyv04uhni0hlktg4827ttyn6lkwc', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-03 11:23:49.648840'),
('ek90ov34ho2g9io2yldllsgyquxe80xl', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-27 04:47:46.426132'),
('eo9293a4a6uwumn1m1ec73yt4tagki37', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-04 05:58:25.227948'),
('epd8fq0boccgropmet8nuovptjc66qc5', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-03 11:22:21.670415'),
('esgxgp30rcn54bzt3useezr0shm45wbc', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-27 10:51:47.006099'),
('ev6iyyokpt1mxradwf8uvszealonog8g', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-27 07:06:07.277879'),
('f2xuydwvzeqe7bwsejrcs26xm7b1aeip', 'ZGQ1YWY1MGZjYjUzZmNlNjE1NmUyNGNhNTc1OTU1MGQ0YjRhZDg5Yzp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSIsInNlbnRfZW1haWxzIjpbXX0=', '2019-09-23 06:41:08.615297'),
('f3gwtzf9o6lbai1p1ito28rtrx8op73f', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-03 07:25:43.929847'),
('f4z4tptfc7a7n3m29xihr568xloe9w3z', 'OWI2ODIxNTc3NjZkZGM4MDcyOWViMzFiMDAzZTQyNTJiN2Y1YmQ4YTp7ImxvZ2dlZF9pbiI6bnVsbH0=', '2019-09-23 09:07:29.367682'),
('f6yr7d0fk7kf8nx2phggo34cyj6319is', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-03 07:37:04.671619'),
('fakqky4zavidekfabqekgjc1ymo66ep3', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-04 05:57:10.860462'),
('fd4469t6ebg9da9tk30hb7dg5mc324sj', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-27 10:44:49.477020'),
('fuqsdacsyc7upbovxsliooqhbn1kvq7x', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-09-25 05:04:39.595726'),
('g8hoq0zxcxsojmxjutlh75hhfq90cz3p', 'NGMyZmMyNTc0NzBkOTljNmExOWQ0YzMyNThkZTc5MDA3MWQxNmEwMTp7fQ==', '2019-10-07 10:34:59.890922'),
('g9i2vljgnj4wz4zjiabx79jwnsou3d45', 'NGMyZmMyNTc0NzBkOTljNmExOWQ0YzMyNThkZTc5MDA3MWQxNmEwMTp7fQ==', '2019-10-04 10:10:13.294651'),
('garohzt3a8r4z9zgocdib919nm57iigy', 'OTc0MWI5MjMzMjg4NjdkOTg1OGNiNGMxYjYzNGJlZDE1ZjQzMDBmYTp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkBnbWFpbC5jb20ifQ==', '2019-09-12 20:06:37.044203'),
('gghmkbbuflulstk9u9pg8cbeqv7b3z9s', 'OWI2ODIxNTc3NjZkZGM4MDcyOWViMzFiMDAzZTQyNTJiN2Y1YmQ4YTp7ImxvZ2dlZF9pbiI6bnVsbH0=', '2019-10-04 10:33:19.657976'),
('ghfrrlqhzje2hh9yhiu7x4revnovty53', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-22 06:22:08.195570'),
('giclzupquy4cvululcyqvvlikmlrnw4e', 'OWI2ODIxNTc3NjZkZGM4MDcyOWViMzFiMDAzZTQyNTJiN2Y1YmQ4YTp7ImxvZ2dlZF9pbiI6bnVsbH0=', '2019-09-23 09:07:23.778725'),
('gmvj1gc0rvsrb7omzwc40wjxti01cvx6', 'ZTIzZmJjMzJhNGU4YTc3ZTZiNjRlNDRiNzBiODIxYjdiMjM2NWE0YTp7ImxvZ2dlZF9pbiI6IlByYWp3YWwuYm1AdGVycmFsb2dpYy5jb20iLCJfc2Vzc2lvbl9leHBpcnkiOjAsInFubyI6MX0=', '2019-09-13 06:31:28.981683'),
('gs7rwdsrv7tmqlnvx4zzl8mnrag4uwml', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-07 11:52:13.153666'),
('h899c7qq5i8zywzhom7vzb7rmgwxxq9o', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-27 10:07:06.422598'),
('h8p0y32ga65cp9ev5l4ruqdrkgkf99f1', 'OWI2ODIxNTc3NjZkZGM4MDcyOWViMzFiMDAzZTQyNTJiN2Y1YmQ4YTp7ImxvZ2dlZF9pbiI6bnVsbH0=', '2019-09-23 09:07:30.362006'),
('ha83emzkonxncamg1es24xonnma26v63', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-03 06:49:04.691400'),
('hev6l7ltm3ye17q7jplmns1q060bmchz', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-02 07:38:04.490380'),
('hs2zaeb1duarstyea3ni8p8smxqmfarm', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-09-23 09:07:19.977938'),
('ht9v47ei7wnyd62tdtvyksvdjtrjt0k2', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-04 09:33:59.733667'),
('hvidq8981uzbkvfdzdbw64777eprl6js', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-23 09:32:30.772835'),
('hwaqap7utz2fv1fogyq6mz2fhopm0wlq', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-04 10:19:57.885775'),
('hyvvw7g9i2483gkaicpijnh5jkj0ekub', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-22 06:20:20.022701'),
('i31gfq7gmb7266gwkzp9021sppbb3duj', 'ZGQ1YWY1MGZjYjUzZmNlNjE1NmUyNGNhNTc1OTU1MGQ0YjRhZDg5Yzp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSIsInNlbnRfZW1haWxzIjpbXX0=', '2019-09-21 09:17:22.596887'),
('i4y2si79wpaqlqrmq054m193qfs3hfy6', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-09-18 06:19:01.216573'),
('id8rp4gtgz5sggh7htj9tpawwbn4h2qz', 'NmVjNTM5ODEwNTM2YzhiNmFlZDE0YmNmMGY2MGM1ZmU4MzBiM2M2YTp7InRlc3QiOiJndXJ1In0=', '2019-09-11 17:01:05.691978'),
('idd6l54p2refucmuipy0v9kbcq0jii5i', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-27 10:14:06.818334'),
('ie32z0zosrn2fomqq4xmssp9oennudp9', 'NGMyZmMyNTc0NzBkOTljNmExOWQ0YzMyNThkZTc5MDA3MWQxNmEwMTp7fQ==', '2019-09-30 05:41:12.193060'),
('iedhhhbm5wfxn2ildqyvtnac72f1ojkr', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-25 08:57:50.278849'),
('ieecv6laok4vz3zoa38s7ycoi6nanwed', 'NGMyZmMyNTc0NzBkOTljNmExOWQ0YzMyNThkZTc5MDA3MWQxNmEwMTp7fQ==', '2019-09-30 07:12:52.890455'),
('iej29f2b9cjsht8pb9kvpziffdfyaloi', 'NGMyZmMyNTc0NzBkOTljNmExOWQ0YzMyNThkZTc5MDA3MWQxNmEwMTp7fQ==', '2019-11-26 17:29:13.860162'),
('incwqz5c4r6oihskolz5k7xit2b7pw7o', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-25 18:46:02.572059'),
('inx3nxuiyzj8j2lmcyzrr5jz5m17ibh4', 'NGMyZmMyNTc0NzBkOTljNmExOWQ0YzMyNThkZTc5MDA3MWQxNmEwMTp7fQ==', '2019-09-22 13:34:58.547875'),
('j2b4drsezpumfyxdtlbkcfvurfq9jswr', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-22 09:22:48.974769'),
('j4sg59h48zs1to4lfwp2spwzea14hl13', 'NGMyZmMyNTc0NzBkOTljNmExOWQ0YzMyNThkZTc5MDA3MWQxNmEwMTp7fQ==', '2019-09-20 06:31:19.491207'),
('j6h0gsfdnpy8txmr8cbvcmkgychmmr1i', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-03 11:25:50.685850'),
('j8b3msxutrgi7k1elgw7lvqxmpcndisb', 'NGMyZmMyNTc0NzBkOTljNmExOWQ0YzMyNThkZTc5MDA3MWQxNmEwMTp7fQ==', '2019-09-21 17:48:42.704441'),
('jh8mc2tujs6uzkkvfahbrvyq5l0wnhif', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-04 06:57:39.474203'),
('jheg9b6fn6wpnr5z3ah1aii4nq4k7z0i', 'ZGQ1YWY1MGZjYjUzZmNlNjE1NmUyNGNhNTc1OTU1MGQ0YjRhZDg5Yzp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSIsInNlbnRfZW1haWxzIjpbXX0=', '2019-09-20 13:45:40.834654');
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('jigs0i3l3zc8gld88j5aofobdl2szxva', 'Y2M1MWFmNGU2YThjMzQ3OGRjN2ZjOTNhMzY5ZDk5MzdhMDUwMjU5Mzp7ImxvZ2dlZF9pbiI6Im5laGEua3JAdGVycmFsb2dpYy5jb20iLCJfc2Vzc2lvbl9leHBpcnkiOjB9', '2019-11-27 12:12:27.279695'),
('jir3193pgefug736py532m4vg7pnbjc5', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-09-21 17:09:17.788184'),
('jn0x13zm6x5m3gany954vcnrk8teveho', 'NmVjNTM5ODEwNTM2YzhiNmFlZDE0YmNmMGY2MGM1ZmU4MzBiM2M2YTp7InRlc3QiOiJndXJ1In0=', '2019-09-11 17:00:20.161353'),
('jwj1zrdqkccntvglwpou8oh45x5hplmd', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-04 06:58:41.282918'),
('k0t77n8kuk0xe6axr16380ojz08hsxaj', 'NGMyZmMyNTc0NzBkOTljNmExOWQ0YzMyNThkZTc5MDA3MWQxNmEwMTp7fQ==', '2019-09-17 17:43:57.255145'),
('kmh2jsr0th8dppy4zmhxtz8lhbpsuhwh', 'OWI2ODIxNTc3NjZkZGM4MDcyOWViMzFiMDAzZTQyNTJiN2Y1YmQ4YTp7ImxvZ2dlZF9pbiI6bnVsbH0=', '2019-09-23 09:07:19.889929'),
('ksk20fy94opgkhz5wmglftliq62mzcrk', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-04 05:59:18.518739'),
('ktndokzd7oe5e9rfl97gi7kfio34bnid', 'NGMyZmMyNTc0NzBkOTljNmExOWQ0YzMyNThkZTc5MDA3MWQxNmEwMTp7fQ==', '2019-10-07 08:39:19.846495'),
('kwpllvydybqj92f2ga02m5uvuc1z3bxc', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-09-27 10:22:14.672622'),
('lm4x8obv3xj8ap1e44lft1fir2otpx40', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-22 09:25:40.558607'),
('lsl7zgshapdwg5fvw0eawjazxtc62db0', 'MDY0ODE5NmFjNTllNzk5OTE1Yzg1MjY1ODFiNjY0ZGMwMzRmNzFjYTp7ImFkbWluIjoiYWRtaW5AdGVycmFsb2dpYy5jb20iLCJsb2dnZWRfaW4iOm51bGx9', '2019-10-29 05:15:07.529124'),
('m4xt9izx7gkypt2bkyf1p0a8kjk0ulq6', 'NGMyZmMyNTc0NzBkOTljNmExOWQ0YzMyNThkZTc5MDA3MWQxNmEwMTp7fQ==', '2019-10-04 10:26:23.743086'),
('m7vfkkgq523aqeqnt3jdxz0tk1y5qm08', 'NmVjNTM5ODEwNTM2YzhiNmFlZDE0YmNmMGY2MGM1ZmU4MzBiM2M2YTp7InRlc3QiOiJndXJ1In0=', '2019-09-11 17:00:55.608262'),
('m9x8uo5w4estc83dohsiwyn2i4obgkvq', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-27 09:33:03.765705'),
('mabsfeltbuzxfdjbpsok2zt41j73vth9', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-27 07:46:04.260530'),
('md94i0kjm1wzh493etn19dzg350lbfkh', 'OWI2ODIxNTc3NjZkZGM4MDcyOWViMzFiMDAzZTQyNTJiN2Y1YmQ4YTp7ImxvZ2dlZF9pbiI6bnVsbH0=', '2019-09-23 09:07:21.201102'),
('mwuvc2qadw71dhzgq5vmqf0ol6v7srtg', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-03 08:54:22.998764'),
('myuuhompwo14n00kaochwzwesh4fwr25', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-04 06:52:30.975617'),
('myz9o8wykq4aj4odtiwtf0kz1h5wmqb1', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-09-23 08:41:59.602938'),
('n22co7ekjidrx1mg0qve5tehf9y0c9yz', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-03 10:35:16.394783'),
('n2v6lveedi7gbx0wyqjpwe29dsxungo5', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-27 10:01:24.514917'),
('n3if9hme431h8j865lpk2lxczdluh99v', 'NGMyZmMyNTc0NzBkOTljNmExOWQ0YzMyNThkZTc5MDA3MWQxNmEwMTp7fQ==', '2019-10-04 10:08:23.156503'),
('n40atpfw8gygefyugqjvp5q1ram9l59g', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-27 09:31:05.396510'),
('n43fjsjibr8ik8ao6ug095izq1zxnqxw', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-09-27 09:26:45.240648'),
('n9wcpik29uvqbquf7v9opbgixks61350', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-03 08:34:17.616731'),
('ndion9mglar2tlfwpni89lzbkt5bdt1s', 'NGMyZmMyNTc0NzBkOTljNmExOWQ0YzMyNThkZTc5MDA3MWQxNmEwMTp7fQ==', '2019-09-27 16:35:44.434552'),
('nf9moamd9ouj07ds3tp79u79dipuc11n', 'NmVjNTM5ODEwNTM2YzhiNmFlZDE0YmNmMGY2MGM1ZmU4MzBiM2M2YTp7InRlc3QiOiJndXJ1In0=', '2019-09-11 17:01:10.799162'),
('njd0otrwe6sc2kwqdf5v95h8obewgimf', 'NmVjNTM5ODEwNTM2YzhiNmFlZDE0YmNmMGY2MGM1ZmU4MzBiM2M2YTp7InRlc3QiOiJndXJ1In0=', '2019-09-11 16:55:54.209554'),
('o1es24yknn69l7ol8baf6wv2rmgwxko9', 'NTYwNTI3NjVlNGVkY2NlNzI1MGZkY2RjZWZiMTY0NzZlMGVlNDQwZjp7ImxvZ2dlZF9pbiI6InN3YWdhdGhiYWlsb3JlQGdtYWlsLmNvbSIsIl9zZXNzaW9uX2V4cGlyeSI6MCwicW5vIjo1LCJ0aW1lciI6IjEyOjAzOjA4IiwicXVldGlvbl9zZXQiOlsiMjQmc2VwOzxkaXY+SW4gd2hpY2ggaGVhZGVyIGZpbGUgaXMgdGhlIE5VTEwgbWFjcm8gZGVmaW5lZD88L2Rpdj4mc2VwO3N0ZGlvLmgmc2VwO3N0ZGRlZi5oJnNlcDtzdGRpby5oIGFuZCBzdGRkZWYuaCZzZXA7bWF0aC5oJnNlcDtzdGRpby5oIGFuZCBzdGRkZWYuaCZzZXA7NCIsIjM4JnNlcDs8ZGl2PkluIEMsIGlmIHlvdSBwYXNzIGFuIGFycmF5IGFzIGFuIGFyZ3VtZW50IHRvIGEgZnVuY3Rpb24sIHdoYXQgYWN0dWFsbHkgZ2V0cyBwYXNzZWQ/PC9kaXY+JnNlcDtWYWx1ZSBvZiBlbGVtZW50cyBpbiBhcnJheSZzZXA7Rmlyc3QgZWxlbWVudCBvZiB0aGUgYXJyYXkmc2VwO0Jhc2UgYWRkcmVzcyBvZiB0aGUgYXJyYXkmc2VwO0FkZHJlc3Mgb2YgdGhlIGxhc3QgZWxlbWVudCBvZiBhcnJheSZzZXA7QmFzZSBhZGRyZXNzIG9mIHRoZSBhcnJheSZzZXA7NCIsIjc4JnNlcDs8ZGl2PldoaWNoIG9mIHRoZSBmb2xsb3dpbmcgbmV0d29yayBkZXZpY2UgaGFzIHRoZSBzbG93ZXN0IHR5cGUgb2ZcbmNvbm5lY3Rpb24/XG48L2Rpdj4mc2VwO0RTTCZzZXA7Um91dGVyJnNlcDtCcmlkZ2VzJnNlcDtEaWFsLXVwIG1vZGVtcyZzZXA7RGlhbC11cCBtb2RlbXMmc2VwOzQiLCI0NyZzZXA7PGRpdj5jaG9vc2UgdGhlIG9uZSB3aGljaCBjYW4gYmUgc3Vic3RpdHV0ZWQgZm9yIHRoZSBnaXZlbiB3b3JkL3NlbnRlbmNlLjxicj48YnI+XG5BIHBlcnNvbiBvZiBnb29kIHVuZGVyc3RhbmRpbmcga25vd2xlZGdlIGFuZCByZWFzb25pbmcgcG93ZXJcbjwvZGl2PiZzZXA7RXhwZXJ0JnNlcDtJbnRlbGxlY3R1YWwmc2VwO1Nub2Imc2VwO0xpdGVyYXRlJnNlcDtJbnRlbGxlY3R1YWwmc2VwOzQiLCI1NCZzZXA7PGRpdj5BbiBpbmNvbXBsZXRlIHN0YXRlbWVudCAoU3RlbSkgZm9sbG93ZWQgYnkgZmlsbGVycyBpcyBnaXZlbi4gUGljayBvdXQgdGhlIGJlc3Qgb25lIHdoaWNoIGNhbiBjb21wbGV0ZSBpbmNvbXBsZXRlIHN0ZW0gY29ycmVjdGx5IGFuZCBtZWFuaW5nZnVsbHkuXHRcbjxicj5cbkRlc3BpdGUgaGlzIGJlc3QgZWZmb3J0cyB0byBjb25jZWFsIGhpcyBhbmdlciAuLi4uLi5cblxuPC9kaXY+JnNlcDt3ZSBjb3VsZCBkZXRlY3QgdGhhdCBoZSB3YXMgdmVyeSBoYXBweSZzZXA7aGUgZmFpbGVkIHRvIGdpdmUgdXMgYW4gaW1wcmVzc2lvbiBvZiBoaXMgYWdvbnkmc2VwO2hlIHN1Y2NlZWRlZCBpbiBjYW1vdWZsYWdpbmcgaGlzIGVtb3Rpb25zJnNlcDtwZW9wbGUgY2FtZSB0byBrbm93IHRoYXQgaGUgd2FzIGFubm95ZWQmc2VwO3Blb3BsZSBjYW1lIHRvIGtub3cgdGhhdCBoZSB3YXMgYW5ub3llZCZzZXA7NCIsIjkmc2VwOzxkaXY+QSBib2F0IGNhbiB0cmF2ZWwgd2l0aCBhIHNwZWVkIG9mIDEzIGttL2hyIGluIHN0aWxsIHdhdGVyLiBJZiB0aGUgc3BlZWQgb2YgdGhlIHN0cmVhbSBpcyA0IGttL2hyLCBmaW5kIHRoZSB0aW1lIHRha2VuIGJ5IHRoZSBib2F0IHRvIGdvIDY4IGttIGRvd25zdHJlYW0uPC9kaXY+JnNlcDsyIGhvdXJzJnNlcDszIGhvdXJzJnNlcDszIGhvdXJzJnNlcDs1IGhvdXJzJnNlcDszIGhvdXJzJnNlcDs0IiwiNzMmc2VwOzxkaXY+V2hhdCBkb2VzIFJvdXRlciBkbyBpbiBhIG5ldHdvcms/PC9kaXY+JnNlcDtGb3J3YXJkcyBhIHBhY2tldCB0byBhbGwgb3V0Z29pbmcgbGlua3Mmc2VwO0ZvcndhcmRzIGEgcGFja2V0IHRvIHRoZSBuZXh0IGZyZWUgb3V0Z29pbmcgbGluayZzZXA7RGV0ZXJtaW5lcyBvbiB3aGljaCBvdXRpbmcgbGluayBhIHBhY2tldCBpcyB0byBiZSBmb3J3YXJkZWQmc2VwO0ZvcndhcmRzIGEgcGFja2V0IHRvIGFsbCBvdXRnb2luZyBsaW5rcyBleGNlcHQgdGhlIG9yaWdpbmF0ZWQgbGluayZzZXA7RGV0ZXJtaW5lcyBvbiB3aGljaCBvdXRpbmcgbGluayBhIHBhY2tldCBpcyB0byBiZSBmb3J3YXJkZWQmc2VwOzQiLCI0JnNlcDs8ZGl2PldoYXQgcGVyY2VudGFnZSBvZiBudW1iZXJzIGZyb20gMSB0byA3MCBoYXZlIDEgb3IgOSBpbiB0aGUgdW5pdCdzIGRpZ2l0P1xuPC9kaXY+JnNlcDsxJnNlcDsxNCZzZXA7MjAmc2VwOzIxJnNlcDsyMCZzZXA7NCJdLCJzY29yZSI6OH0=', '2019-09-13 06:35:00.789571'),
('o1tss3hqxryhkq10r9bz7noj47vtilai', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-04 09:59:33.130965'),
('o4eb728urq0mmi9x9sabkr7mr776eqnf', 'NmVjNTM5ODEwNTM2YzhiNmFlZDE0YmNmMGY2MGM1ZmU4MzBiM2M2YTp7InRlc3QiOiJndXJ1In0=', '2019-09-11 16:55:49.124084'),
('o7ur1tfo18acfd2vyendgpzguuzjsd44', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-02 06:46:33.381461'),
('o8sifc2hluzug8ogwy2q1970r212su6s', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-27 11:50:52.066074'),
('od5hqodiaowmb01vc06ywhwiqwowwshb', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-07 10:32:43.118860'),
('oep3c7uvxt0t79txj1bnqzmkik0boulp', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-27 10:45:58.172058'),
('ogjb8wz7jwt7s29og3l34wobv0oxm7yi', 'NGMyZmMyNTc0NzBkOTljNmExOWQ0YzMyNThkZTc5MDA3MWQxNmEwMTp7fQ==', '2019-10-04 10:25:10.970632'),
('onpptewx2m544pptwb2tn7t5t32qltxn', 'NmVjNTM5ODEwNTM2YzhiNmFlZDE0YmNmMGY2MGM1ZmU4MzBiM2M2YTp7InRlc3QiOiJndXJ1In0=', '2019-09-11 16:59:54.811630'),
('oquvbcxnxv2up3whwptfsv76q5uikwsr', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-09-19 10:28:55.975200'),
('ot1t6v00k20mzw3nicm4ku0bfghtmrnc', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-04 06:52:05.894538'),
('oux96jaos7eutg2kyviagkx8mal3as6w', 'NGMyZmMyNTc0NzBkOTljNmExOWQ0YzMyNThkZTc5MDA3MWQxNmEwMTp7fQ==', '2019-09-13 06:26:18.587117'),
('oy0q8g5sf2mmdagw6rmffmd0emaje8qf', 'NGMyZmMyNTc0NzBkOTljNmExOWQ0YzMyNThkZTc5MDA3MWQxNmEwMTp7fQ==', '2019-10-07 10:07:02.511244'),
('p2nmcvdqwqcpsn5xz3ifc85g7pynppvy', 'OWI2ODIxNTc3NjZkZGM4MDcyOWViMzFiMDAzZTQyNTJiN2Y1YmQ4YTp7ImxvZ2dlZF9pbiI6bnVsbH0=', '2019-09-23 09:07:20.297863'),
('p4ivckrhki4j76zhsfoc5fzgl2jzqaw7', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-27 12:13:03.426206'),
('p9gqla0myirqmwurqpdqyh06nmovbbfd', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-21 10:34:58.125738'),
('paqvzlbaa8yj48qowfwyeg9xxn6au91k', 'NmVjNTM5ODEwNTM2YzhiNmFlZDE0YmNmMGY2MGM1ZmU4MzBiM2M2YTp7InRlc3QiOiJndXJ1In0=', '2019-09-11 17:00:10.020038'),
('pfjvfqd6n2xa5vpq4l42evnjl8xnhws4', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-22 09:01:09.146831'),
('phr4b8dh74p2f73rpqi4tur8hblc8qln', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-27 09:20:43.832774'),
('pk35u74m8n2g0ug39udcbjx4et6bttnz', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-22 14:55:39.266009'),
('pofjj189g0tklufy4q3owonvsppguz6h', 'OWI2ODIxNTc3NjZkZGM4MDcyOWViMzFiMDAzZTQyNTJiN2Y1YmQ4YTp7ImxvZ2dlZF9pbiI6bnVsbH0=', '2019-09-19 07:18:04.494311'),
('pyc50s2epkhtu815f9s76jdyn1o3i70q', 'MWM4NmM1ZDlhNGRmNGQ5NmFkOGExZWJlMTk0MjMwNjZmZjc1NmZiODp7ImxvZ2dlZF9pbiI6Im5laGEua3JAdGVycmFsb2dpYy5jb20iLCJhZG1pbiI6ImFkbWluQHRlcnJhbG9naWMuY29tIiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==', '2019-11-27 12:09:22.851203'),
('pzu75qtjjohc96k6ffi2pjsiujo9v04v', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-03 07:46:17.334440'),
('q0gkhksnec1h6l0gki68uqz3rufho2hr', 'NGMyZmMyNTc0NzBkOTljNmExOWQ0YzMyNThkZTc5MDA3MWQxNmEwMTp7fQ==', '2019-11-27 09:16:32.727592'),
('q4ev26k7hl2lg8hcj0e4hu4jn88lb31o', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-03 06:45:55.621840'),
('q5lhzwic70ep7ca5cfszffg1v262tqvl', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-26 14:45:17.379270'),
('q8hbcz2h1vbyda98gxlqqadymbsn9kvb', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-27 10:27:06.929619'),
('q8zo41moyp3khideq0s43bs1ryq8qn9a', 'NGMyZmMyNTc0NzBkOTljNmExOWQ0YzMyNThkZTc5MDA3MWQxNmEwMTp7fQ==', '2019-09-17 10:19:14.644912'),
('qb2wez1it3obie0i38bfc67yuo89v4hr', 'NmVjNTM5ODEwNTM2YzhiNmFlZDE0YmNmMGY2MGM1ZmU4MzBiM2M2YTp7InRlc3QiOiJndXJ1In0=', '2019-09-11 17:00:50.559152'),
('qbi3yrfkgbu5k22nqf2y1688b5z84m7x', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-04 05:50:26.228907'),
('qcraj91e8q473yb45ms3sssgdac99ygh', 'NGMyZmMyNTc0NzBkOTljNmExOWQ0YzMyNThkZTc5MDA3MWQxNmEwMTp7fQ==', '2019-10-07 09:59:00.428446'),
('qh3rlbornznmqi5453ma4afgwzquvyzz', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-26 16:01:10.155580'),
('qopzt67gahz6jf16webajbwdogduun00', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-09-19 16:35:43.698813'),
('qp1dkxkph429it0lymhb0mz8hc96xfig', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-27 10:54:08.648774'),
('qqxbztahq3v58etx7vacv5etgxd5wdor', 'OWI2ODIxNTc3NjZkZGM4MDcyOWViMzFiMDAzZTQyNTJiN2Y1YmQ4YTp7ImxvZ2dlZF9pbiI6bnVsbH0=', '2019-09-23 09:07:20.851866'),
('qs34dpl1q13y2nya3ttlxjsls82xek6s', 'ZGQ1YWY1MGZjYjUzZmNlNjE1NmUyNGNhNTc1OTU1MGQ0YjRhZDg5Yzp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSIsInNlbnRfZW1haWxzIjpbXX0=', '2019-09-21 16:20:21.474551'),
('qs6hr300a7c8n8yqag0nnet7eaocc1jm', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-27 09:51:10.768581'),
('qvkzmvyhnqgg20v3nm7he5rdyv3q660j', 'MDY0ODE5NmFjNTllNzk5OTE1Yzg1MjY1ODFiNjY0ZGMwMzRmNzFjYTp7ImFkbWluIjoiYWRtaW5AdGVycmFsb2dpYy5jb20iLCJsb2dnZWRfaW4iOm51bGx9', '2019-10-23 12:03:20.285275'),
('r0z6l73xxlck07tfkhgbsbb19j2wja8a', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-03 07:24:40.008716'),
('r8gunrqnvd7vio2j0hu6mza37wxgiowl', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-02 06:45:01.043160'),
('resslpcxhylhttxlqpyc8cl9eau30vws', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-03 06:46:52.482203'),
('rf3aqdao507mqpa5p6xmbge05jaloq76', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-22 08:53:52.925315'),
('rgj55k7gcctqxsczxm3p0448w2a1old5', 'OWI2ODIxNTc3NjZkZGM4MDcyOWViMzFiMDAzZTQyNTJiN2Y1YmQ4YTp7ImxvZ2dlZF9pbiI6bnVsbH0=', '2019-10-07 10:45:11.119414'),
('rgsim7ribjuleh0j4gj6cibpkp40omq6', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-09-26 04:48:18.698990'),
('rpmq6apcerwmn95fvot4olmsn7sogey7', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-03 07:33:59.376503'),
('s3yv9m9qkfi16scvcd2mzepf41qd5viv', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-04 05:58:19.890630'),
('s7mfjhf1ykjgw4qjrx9ofq2bt8y9mucc', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-04 06:24:01.253827'),
('scwqibvlncv0eocf7pa7b0e22wua7dsp', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-03 07:26:24.789312'),
('sikpdm6ew74ql0jn014i2xtua05qq8b3', 'ZGQ1YWY1MGZjYjUzZmNlNjE1NmUyNGNhNTc1OTU1MGQ0YjRhZDg5Yzp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSIsInNlbnRfZW1haWxzIjpbXX0=', '2019-09-23 05:22:22.175159'),
('sj5qr0vew3c58u2xgsoc9ffxf6cn8s2q', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-04 07:01:29.505958'),
('skpn0g2qtacnjehs8zygstge9yobrp9i', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-09-25 10:16:39.575969'),
('slrgce4wscdccg15rp166xatpde7g1n0', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-27 09:39:24.364275'),
('sp75cs5v34va054d1c9yl1jhurnzmdhd', 'ZGQ1YWY1MGZjYjUzZmNlNjE1NmUyNGNhNTc1OTU1MGQ0YjRhZDg5Yzp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSIsInNlbnRfZW1haWxzIjpbXX0=', '2019-09-24 14:25:17.052766'),
('sqa28r7r6oaivjibkcbij73y4bidn3cu', 'OWI2ODIxNTc3NjZkZGM4MDcyOWViMzFiMDAzZTQyNTJiN2Y1YmQ4YTp7ImxvZ2dlZF9pbiI6bnVsbH0=', '2019-09-23 09:07:31.405262'),
('sqsgcag6k6xby6ycvk2a4q5857i35aea', 'NGMyZmMyNTc0NzBkOTljNmExOWQ0YzMyNThkZTc5MDA3MWQxNmEwMTp7fQ==', '2019-10-04 09:48:16.804885'),
('srw2honx8ikvc0x406fwbtk1by1291ji', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-27 10:00:50.766992'),
('ssqd4fe4qjmqmqk9mv3fbhrvebacu90o', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-08 04:40:37.036653'),
('sukhr1bd59ods1i77o4inakbqklb7itx', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-07 11:54:13.935025'),
('sxfpc8gjeqxg2scwpr4o76vl2rveczc3', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-03 08:48:59.565942'),
('t2v9foccxd9wqwjvbnp9d2ly1oawoyzy', 'OWI2ODIxNTc3NjZkZGM4MDcyOWViMzFiMDAzZTQyNTJiN2Y1YmQ4YTp7ImxvZ2dlZF9pbiI6bnVsbH0=', '2019-09-23 09:07:28.423256'),
('t6zsw935q962lp6b17mwtl3sppmjs870', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-03 08:30:01.611720'),
('t970ww9s6m2hm2327v8jjiivo8khunyh', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-07 12:05:51.739795'),
('ta7utk04wzzgrf4vbjv2vcdrt07imlb1', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-09-21 13:13:27.945262'),
('tand6nzzy5auh1qsuwvvpki9mef9y879', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-03 07:05:16.416383'),
('tbf1wrrxut4vjaerp9uw7upbt30j43ew', 'NmVjNTM5ODEwNTM2YzhiNmFlZDE0YmNmMGY2MGM1ZmU4MzBiM2M2YTp7InRlc3QiOiJndXJ1In0=', '2019-09-11 17:00:40.416920'),
('tbl69yv2m6rqpb513vvs3qbdc3g55g47', 'NGMyZmMyNTc0NzBkOTljNmExOWQ0YzMyNThkZTc5MDA3MWQxNmEwMTp7fQ==', '2019-10-04 09:34:40.057399'),
('tnh968trjmiuvkcvu8rtkp423roi5njo', 'NmVjNTM5ODEwNTM2YzhiNmFlZDE0YmNmMGY2MGM1ZmU4MzBiM2M2YTp7InRlc3QiOiJndXJ1In0=', '2019-09-11 16:56:14.374465'),
('tq15ryo32i809xa0n2if11ki02vd0135', 'NmVjNTM5ODEwNTM2YzhiNmFlZDE0YmNmMGY2MGM1ZmU4MzBiM2M2YTp7InRlc3QiOiJndXJ1In0=', '2019-09-11 17:00:25.198064'),
('tt8p3nylqllx6cfxzizfiv092i28od19', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-22 06:21:26.102094'),
('ttxoll59yc8dswxrdpl48l48fp854dj3', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-19 12:28:59.225358'),
('ttzelqot7ozhruhk187t61fxgqn3269h', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-03 07:22:58.395936'),
('tvgjtm114d926sl9xogn6g9mqjx09tnn', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-03 07:29:36.718869'),
('tvx09uk5hcoxs4qkdxh6017li9t2a2xo', 'NGMyZmMyNTc0NzBkOTljNmExOWQ0YzMyNThkZTc5MDA3MWQxNmEwMTp7fQ==', '2019-10-03 06:11:00.936195'),
('ty8n54zc3aa877tskk3cntsqj76bwd50', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-22 05:23:42.647378'),
('u0f2mqx42o0j7gic4zqgrnhuecb7zfvk', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-27 09:37:59.814698'),
('u2nq4erhg4k59iheuejbryvui0lokq8b', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-09-30 06:12:06.639336'),
('u4mqyh72h6yw2i73s6knllum3xvbd7ck', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-27 10:22:57.184489'),
('u72whx8n8qe8gxsg0m5oqeiy4yq14eci', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-22 09:08:10.105612'),
('u8h6mwhh72p2hffiw7qjr7vzixd40vrb', 'NGMyZmMyNTc0NzBkOTljNmExOWQ0YzMyNThkZTc5MDA3MWQxNmEwMTp7fQ==', '2019-09-18 05:44:14.613442'),
('ua3bohw1jkwtbe7c8ycwbmtb02swbcsc', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-04 06:59:50.180964'),
('uaowluj1a5ttenqbs2sylouhrwng42kf', 'Zjc0YTM2MTg3NmZlMjFlNThjZmE5NjAyYmUzMjJjZThlM2QzZWY2ZDp7ImxvZ2dlZF9pbiI6ImJyZ3VydTkwQGdtYWlsLmNvbSIsInF1ZV9jbnQiOjMsInNlbGVjdGVkX2NvZGVfcXVlc3Rpb25zIjpbWzQsIkMgcHJvZ3JhbSB0byBjaGVjayB3aGV0aGVyIHRoZSBjaGFyYWN0ZXIgaXMgYW4gYWxwaGFiZXQgb3Igbm90IiwiI2luY2x1ZGUgPHN0ZGlvLmg+XG5pbnQgbWFpbigpXG57XG5jaGFyIGNoO1xucHJpbnRmKFwiRW50ZXIgYSBjaGFyYWN0ZXI6IFwiKTtcbnNjYW5mKFwiICVjXCIsJmNoKTtcbnByaW50ZihcIlxcblwiKTtcbmlmKCAoY2ggPj0gJ2EnICYmIGNoIDw9ICd6JykgfHwgKCBjaCA+PSAnQScgJiYgY2ggPD0nWicpKVxucHJpbnRmKFwiJWMgaXMgYW4gYWxwaGFiZXRcXG5cIixjaCk7XG5lbHNlXG5wcmludGYoXCIlYyBpcyBub3QgYW4gYWxwaGFiZXRcXG5cIixjaCk7XG5cbnJldHVybiAwO1xufSIsImNwcCIsImEiLCIxIiwieiIsIkEiLCIwIl0sWzUsIkphdmEgcHJvZ3JhbSB0byBmaW5kIHRoZSBBU0NJSSB2YWx1ZSBvZiBhIGNoYXJhY3RlciIsImltcG9ydCBqYXZhLnV0aWwuKjtcbnB1YmxpYyBjbGFzcyBwZ21cbntcbnB1YmxpYyBzdGF0aWMgdm9pZCBtYWluKFN0cmluZ1tdIGFyZ3MpXG57XG5jaGFyIGNoO1xuU2Nhbm5lciBzYyA9IG5ldyBTY2FubmVyKFN5c3RlbS5pbik7XG5jaCA9IHNjLm5leHQoKS5jaGFyQXQoMCk7XG5pbnQgYXNjaWkgPSAoaW50KSBjaDtcblN5c3RlbS5vdXQucHJpbnRsbihcIkFTQ0lJIG9mIFwiICsgY2ggKyBcIiBpcyBcIiArIGFzY2lpKTsgICAvLyBQcmludHMgdGhlIEFTQ0lJIHZhbHVlIG9mIHRoZSBpbnB1dCBjaGFyYWN0ZXJcbn1cbn0iLCJqYXZhIiwiYSIsIjEiLCJuIiwifiIsIkEiXSxbMSwiZG8gamF2YSBwZ20iLCJpbXBvcnQgamF2YS51dGlsLlNjYW5uZXI7ICAvLyBJbXBvcnQgdGhlIFNjYW5uZXIgY2xhc3NcblxuY2xhc3MgcGdtIHtcbiAgcHVibGljIHN0YXRpYyB2b2lkIG1haW4oU3RyaW5nW10gYXJncykge1xuICAgIFNjYW5uZXIgbXlPYmogPSBuZXcgU2Nhbm5lcihTeXN0ZW0uaW4pOyAgLy8gQ3JlYXRlIGEgU2Nhbm5lciBvYmplY3RcbiAgICBTeXN0ZW0ub3V0LnByaW50bG4oXCJFbnRlciB1c2VybmFtZVwiKTtcblxuICAgIFN0cmluZyB1c2VyTmFtZSA9IG15T2JqLm5leHRMaW5lKCk7ICAvLyBSZWFkIHVzZXIgaW5wdXRcbiAgICBTeXN0ZW0ub3V0LnByaW50bG4oXCJVc2VybmFtZSBpczogXCIgKyB1c2VyTmFtZSk7ICAvLyBPdXRwdXQgdXNlciBpbnB1dFxuICB9XG59IiwiamF2YSIsImd1cnUiLCJyYWoiLCJzd2FnYXRoIiwidmlzaHJhbSIsInByYWp3YWwiXV0sImNvZGluZ19zY29yZSI6MTV9', '2019-11-21 16:06:22.252859'),
('uczpdwqv3zxj7sjleqwc70btmpfdvpzo', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-27 07:53:20.461329'),
('ugead8qm6867ye5bewx090m5zvsjn8fh', 'NGMyZmMyNTc0NzBkOTljNmExOWQ0YzMyNThkZTc5MDA3MWQxNmEwMTp7fQ==', '2019-09-23 05:13:16.324071'),
('uh5u1yt0fky79fnuypxevnjv7jhzf6dl', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-07 10:18:49.291692'),
('ulqxlverjoq2ksd9zyu91k08622jhuqu', 'YzBhMzFjYmNhOGYyNDIzOGNiMjhjZDVjMzZmMTY5YTI1YzRlYWUxOTp7ImxvZ2dlZF9pbiI6InJhanNoZWthci5jc0B0ZXJyYWxvZ2ljLmNvbSIsIl9zZXNzaW9uX2V4cGlyeSI6MCwidGltZXIiOiIxODowMTowOSIsInF1ZXRpb25fc2V0IjpbIjM2JnNlcDs8ZGl2PkluIHRoZSBmb2xsb3dpbmcgY29kZSB3aGF0IGlzICYjeDI3O1AmI3gyNzs/Jmx0Oy9kaXYmZ3Q7XG4mbHQ7cHJlJmd0O1xudHlwZWRlZiBjaGFyICpjaGFycDtcbmNvbnN0IGNoYXJwIFA7XG48L2Rpdj4mc2VwO1AgaXMgYSBjb25zdGFudCZzZXA7UCBpcyBhIGNoYXJhY3RlciBjb25zdGFudCZzZXA7UCBpcyBjaGFyYWN0ZXIgdHlwZSZzZXA7UCBpcyBjaGFyYWN0ZXIgdHlwZSZzZXA7UCBpcyBhIGNvbnN0YW50JnNlcDs0MyIsIjEwMSZzZXA7PGRpdj5Ud28gcGlwZXMgQSBhbmQgQiBjYW4gc2VwYXJhdGVseSBmaWxsIGEgdGFuayBpbiAyIG1pbnV0ZXMgYW5kIDE1IG1pbnV0ZXMgcmVzcGVjdGl2ZWx5LiBCb3RoIHRoZSBwaXBlcyBhcmUgb3BlbmVkIHRvZ2V0aGVyIGJ1dCA0IG1pbnV0ZXMgYWZ0ZXIgdGhlIHN0YXJ0IHRoZSBwaXBlIEEgaXMgdHVybmVkIG9mZi4gSG93IG11Y2ggdGltZSB3aWxsIGl0IHRha2UgdG8gZmlsbCB0aGUgdGFuaz88L2Rpdj4mc2VwOzkgbWluJnNlcDsxMCBtaW4mc2VwOzExIG1pbiZzZXA7MTIgbWluJnNlcDsxMCBtaW4mc2VwOzQzIiwiNTkmc2VwOzxkaXY+Y2hvb3NlIHRoZSBvbmUgd2hpY2ggY2FuIGJlIHN1YnN0aXR1dGVkIGZvciB0aGUgZ2l2ZW4gd29yZC9zZW50ZW5jZS4mbHQ7YnImZ3Q7XG5FeHRyZW1lIG9sZCBhZ2Ugd2hlbiBhIG1hbiBiZWhhdmVzIGxpa2UgYSBmb29sXG48L2Rpdj4mc2VwO0ltYmVjaWxpdHkmc2VwO1NlbmlsaXR5JnNlcDtEb3RhZ2Umc2VwO1N1cGVyYW5udWF0aW9uJnNlcDtEb3RhZ2Umc2VwOzQzIiwiMzImc2VwOzxkaXY+V2hhdCB3aWxsIHlvdSBkbyB0byB0cmVhdCB0aGUgY29uc3RhbnQgMy4xNCBhcyBhIGxvbmcgZG91YmxlPzwvZGl2PiZzZXA7dXNlIDMuMTRMRCZzZXA7dXNlIDMuMTRMJnNlcDt1c2UgMy4xNERMJnNlcDt1c2UgMy4xNExGJnNlcDt1c2UgMy4xNEwmc2VwOzQzIiwiODAmc2VwOzxkaXY+V2hpY2ggbmV0d29ya2luZyBkZXZpY2UgY29ubmVjdCBvbmUgTEFOIHRvIG90aGVyIExBTiB1c2luZ1xuc2FtZSBwcm90b2NvbD9cbjwvZGl2PiZzZXA7Um91dGVyJnNlcDtTd2l0Y2gmc2VwO0JyaWRnZSZzZXA7TW9kZW0mc2VwO1N3aXRjaCZzZXA7NDMiLCI0MiZzZXA7PGRpdj5SZWFkIGVhY2ggc2VudGVuY2UgdG8gZmluZCBvdXQgd2hldGhlciB0aGVyZSBpcyBhbnkgZ3JhbW1hdGljYWwgZXJyb3IgaW4gaXQuIFRoZSBlcnJvciwgaWYgYW55IHdpbGwgYmUgaW4gb25lIHBhcnQgb2YgdGhlIHNlbnRlbmNlLiBUaGUgbGV0dGVyIG9mIHRoYXQgcGFydCBpcyB0aGUgYW5zd2VyLiBJZiB0aGVyZSBpcyBubyBlcnJvciwgdGhlIGFuc3dlciBpcyAmI3gyNztEJiN4Mjc7LiAoSWdub3JlIHRoZSBlcnJvcnMgb2YgcHVuY3R1YXRpb24sIGlmIGFueSlcbjwvZGl2PiZzZXA7V2UgZGlzY3Vzc2VkIGFib3V0IHRoZSBwcm9ibGVtIHNvIHRob3JvdWdobHkmc2VwO29uIHRoZSBldmUgb2YgdGhlIGV4YW1pbmF0aW9uJnNlcDt0aGF0IEkgZm91bmQgaXQgdmVyeSBlYXN5IHRvIHdvcmsgaXQgb3V0JnNlcDtObyBlcnJvciZzZXA7V2UgZGlzY3Vzc2VkIGFib3V0IHRoZSBwcm9ibGVtIHNvIHRob3JvdWdobHkmc2VwOzQzIiwiMTAwJnNlcDs8ZGl2PlR3byBwaXBlcyBBIGFuZCBCIGNhbiBmaWxsIGEgY2lzdGVybiBpbiAyMCBhbmQgMzAgbWludXRlcyByZXNwZWN0aXZlbHksIGFuZCBhIHRoaXJkIHBpcGUgQyBjYW4gZW1wdHkgaXQgaW4gNDAgbWludXRlcy4gSG93IGxvbmcgd2lsbCBpdCB0YWtlIHRvIGZpbGwgdGhlIGNpc3Rlcm4gaWYgYWxsIHRoZSB0aHJlZSBhcmUgb3BlbmVkIGF0IHRoZSBzYW1lIHRpbWU/PC9kaXY+JnNlcDsgMTkgMS83IG1pbiZzZXA7MTUgMS83IG1pbiZzZXA7MTcgMS83IG1pbiZzZXA7NyAxLzcgbWluJnNlcDsxNyAxLzcgbWluJnNlcDs0MyIsIjY0JnNlcDs8ZGl2PldoaWNoIGxheWVycyBvZiB0aGUgT1NJIG1vZGVsIGFyZSBob3N0LXRvLWhvc3QgbGF5ZXJzP1xuPC9kaXY+JnNlcDtUcmFuc3BvcnQsIFNlc3Npb24sIFByZXNlbnRhdGlvbiwgQXBwbGljYXRpb24mc2VwO05ldHdvcmssIFRyYW5zcG9ydCwgU2Vzc2lvbiwgUHJlc2VudGF0aW9uJnNlcDtEYXRhbGluaywgTmV0d29yaywgVHJhbnNwb3J0LCBTZXNzaW9uJnNlcDtQaHlzaWNhbCwgRGF0YWxpbmssIE5ldHdvcmssIFRyYW5zcG9ydCZzZXA7VHJhbnNwb3J0LCBTZXNzaW9uLCBQcmVzZW50YXRpb24sIEFwcGxpY2F0aW9uJnNlcDs0MyJdLCJwcmV2X3F1ZSI6IjY0Iiwic2NvcmUiOjR9', '2019-11-19 12:31:31.852196'),
('uv9c5ts89crujfiiuk7s7o4pvsdbw7qs', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-03 06:52:59.010508'),
('ux9pu4qoi32rbt84pn4xgce7cctlldng', 'OWI2ODIxNTc3NjZkZGM4MDcyOWViMzFiMDAzZTQyNTJiN2Y1YmQ4YTp7ImxvZ2dlZF9pbiI6bnVsbH0=', '2019-10-03 14:31:42.759925'),
('uxs44cyupkt7ivq4sb6xu39mi3tgjf1f', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-07 11:57:31.021736'),
('uzw21e17tb33vxul4bkhghqiut3q86os', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-27 09:50:02.328062'),
('v55kp8mprgr1gjq3w8naw8a27xkfshty', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-03 07:27:40.240591'),
('v5etwtppql4ushv4mcjucy330aipmm20', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-22 10:04:10.414799'),
('vlgjexoo6mk53akl1fxak1hu2o6fvaua', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-21 10:35:19.152362'),
('vma9fjyofk7oy55vbj4pd9fqn2817m5k', 'NmVjNTM5ODEwNTM2YzhiNmFlZDE0YmNmMGY2MGM1ZmU4MzBiM2M2YTp7InRlc3QiOiJndXJ1In0=', '2019-09-11 17:00:30.326513'),
('vnk66n9l2tdhdd6u1w6uh93baq5d3x00', 'OWI2ODIxNTc3NjZkZGM4MDcyOWViMzFiMDAzZTQyNTJiN2Y1YmQ4YTp7ImxvZ2dlZF9pbiI6bnVsbH0=', '2019-09-30 06:13:57.455966'),
('vo25gh266flsfkuxpu08ts7zvncjng7j', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-04 10:02:30.276418'),
('vo5bq56taicjortdjg1r682ywskh885r', 'NGMyZmMyNTc0NzBkOTljNmExOWQ0YzMyNThkZTc5MDA3MWQxNmEwMTp7fQ==', '2019-10-04 10:28:26.876159'),
('vpl952rqeibes5n0fbdc2evdoub81xwg', 'YTYwMjUzOWNmODQ2YTc1YmJjZThjOGMxZWIwMWQ2MzE2NDE1MTI3Yzp7ImxvZ2dlZF9pbiI6Imd1cnVwcmFzYWQuYnJAdGVycmFsb2dpYy5jb20iLCJhZG1pbiI6ImFkbWluQHRlcnJhbG9naWMuY29tIiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==', '2019-11-27 12:12:56.391350'),
('vs16o95tua17luk3qu7hxvry27eiuy3q', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-21 09:10:21.427417'),
('vt0y7xv1atkni9m161ers7t9jgjj3d3m', 'OWI2ODIxNTc3NjZkZGM4MDcyOWViMzFiMDAzZTQyNTJiN2Y1YmQ4YTp7ImxvZ2dlZF9pbiI6bnVsbH0=', '2019-09-24 07:39:23.803398'),
('vuco9pd7sf13p14a2907ntbcqu71v3wi', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-21 10:34:03.927940'),
('vwuszrtm85rhv0ugj5zg43ljqymqc1qe', 'NTdhOWZlMmE1NjQ0M2QyMDkwYjdjNGVjOGNiMTZjZjkzMGE5NjY4OTp7InF1ZXRpb25fc2V0IjpbIjEwNiZzZXA7PGRpdj5MQ00gb2YgODcgYW5kIDE0NSBpczo8L2Rpdj4mc2VwOzEzMDUmc2VwOzQzNSZzZXA7ODc1JnNlcDs0OCZzZXA7NDM1JnNlcDs0NSIsIjEwNyZzZXA7PGRpdj5MQ00gb2YgNDU1LCAxMTcsIDMzOCBpczo8L2Rpdj4mc2VwOzEwNjcwJnNlcDsxMDY0NzAmc2VwOzEwNDY3MCZzZXA7MTA3NDcwJnNlcDsxMDY0NzAmc2VwOzQ1IiwiMTAyJnNlcDs8ZGl2PkEgY2lzdGVybiBoYXMgYSBsZWFrIHdoaWNoIHdvdWxkIGVtcHR5IHRoZSBjaXN0ZXJuIGluIDIwIG1pbnV0ZXMuIEEgdGFwIGlzIHR1cm5lZCBvbiB3aGljaCBhZG1pdHMgNCBsaXRlcnMgYSBtaW51dGUgaW50byB0aGUgY2lzdGVybiwgYW5kIGl0IGlzIGVtcHRpZWQgaW4gMjQgbWludXRlcy4gSG93IG1hbnkgbGl0ZXJzIGRvZXMgdGhlIGNpc3Rlcm4gaG9sZD88L2Rpdj4mc2VwOzQ4MCBsaXRlcnMmc2VwOzYwMCBsaXRlcnMmc2VwOzcyMCBsaXRlcnMmc2VwOzgwMCBsaXRlcnMmc2VwOzQ4MCBsaXRlcnMmc2VwOzQ1IiwiMTcmc2VwOzxkaXY+VGhyZWUgdGltZXMgdGhlIGZpcnN0IG9mIHRocmVlIGNvbnNlY3V0aXZlIG9kZCBpbnRlZ2VycyBpcyAzIG1vcmUgdGhhbiB0d2ljZSB0aGUgdGhpcmQuIFRoZSB0aGlyZCBpbnRlZ2VyIGlzOjwvZGl2PiZzZXA7OSZzZXA7MTEmc2VwOzQzMjAmc2VwOzE1JnNlcDsxNSZzZXA7NDUiLCIxMDQmc2VwOzxkaXY+SG93IG11Y2ggaXMgODAlIG9mIDQwIGlzIGdyZWF0ZXIgdGhhbiA0LzUgb2YgMjU/PC9kaXY+JnNlcDs0JnNlcDs2JnNlcDs5JnNlcDsxMiZzZXA7MTImc2VwOzQ1IiwiMTA1JnNlcDs8ZGl2PkZpbmQgdGhlIG9uZSB3aGljaCBkb2VzIG5vdCBiZWxvbmcgdG8gdGhhdCBncm91cCA/PGJyIC8+PC9kaXY+JnNlcDszJnNlcDs0JnNlcDs3JnNlcDs5JnNlcDs0JnNlcDs0NSIsIjIwJnNlcDs8ZGl2PkEgY2FuIGNvbnRhaW5zIGEgbWl4dHVyZSBvZiB0d28gbGlxdWlkcyBBIGFuZCBCIGlzIHRoZSByYXRpbyA3IDogNS4gV2hlbiA5IGxpdHJlcyBvZiBtaXh0dXJlIGFyZSBkcmF3biBvZmYgYW5kIHRoZSBjYW4gaXMgZmlsbGVkIHdpdGggQiwgdGhlIHJhdGlvIG9mIEEgYW5kIEIgYmVjb21lcyA3IDogOS4gSG93IG1hbnkgbGl0cmVzIG9mIGxpcXVpZCBBIHdhcyBjb250YWluZWQgYnkgdGhlIGNhbiBpbml0aWFsbHk/PC9kaXY+JnNlcDsxMCZzZXA7MjAmc2VwOzIxJnNlcDsyNSZzZXA7MjEmc2VwOzQ1IiwiMTImc2VwOzxkaXY+VGhlIHN1bSBvZiBhZ2VzIG9mIDUgY2hpbGRyZW4gYm9ybiBhdCB0aGUgaW50ZXJ2YWxzIG9mIDMgeWVhcnMgZWFjaCBpcyA1MCB5ZWFycy4gV2hhdCBpcyB0aGUgYWdlIG9mIHRoZSB5b3VuZ2VzdCBjaGlsZD88L2Rpdj4mc2VwOzQgeWVhcnMmc2VwOzggeWVhcnMmc2VwOzEwIHllYXJzJnNlcDtOb25lIG9mIHRoZXNlJnNlcDs0IHllYXJzJnNlcDs0NSIsIjg3JnNlcDs8ZGl2PkZpbmQgdGhlIEguQy5GLCBpZiB0aGUgbnVtYmVycyBhcmUgaW4gdGhlIHJhdGlvIG9mIDQgOiA1IDogNiBhbmQgdGhlaXIgTC5DLk0uIGlzIDI0MDAuPC9kaXY+JnNlcDszNSZzZXA7MjAmc2VwOzQwJnNlcDsyNSZzZXA7NDAmc2VwOzQ1IiwiMTA5JnNlcDs8ZGl2PkhDRiBvZiAzLzE2LCA1LzEyLCA3LzggaXM6PC9kaXY+JnNlcDsyLzQ3JnNlcDszLzQ3JnNlcDsxLzQ4JnNlcDs1LzQ4JnNlcDsxLzQ4JnNlcDs0NSIsIjkmc2VwOzxkaXY+QSBib2F0IGNhbiB0cmF2ZWwgd2l0aCBhIHNwZWVkIG9mIDEzIGttL2hyIGluIHN0aWxsIHdhdGVyLiBJZiB0aGUgc3BlZWQgb2YgdGhlIHN0cmVhbSBpcyA0IGttL2hyLCBmaW5kIHRoZSB0aW1lIHRha2VuIGJ5IHRoZSBib2F0IHRvIGdvIDY4IGttIGRvd25zdHJlYW0uPC9kaXY+JnNlcDsyIGhvdXJzJnNlcDszIGhvdXJzJnNlcDs0IGhvdXJzJnNlcDs1IGhvdXJzJnNlcDszIGhvdXJzJnNlcDs0NSIsIjEwMCZzZXA7PGRpdj5Ud28gcGlwZXMgQSBhbmQgQiBjYW4gZmlsbCBhIGNpc3Rlcm4gaW4gMjAgYW5kIDMwIG1pbnV0ZXMgcmVzcGVjdGl2ZWx5LCBhbmQgYSB0aGlyZCBwaXBlIEMgY2FuIGVtcHR5IGl0IGluIDQwIG1pbnV0ZXMuIEhvdyBsb25nIHdpbGwgaXQgdGFrZSB0byBmaWxsIHRoZSBjaXN0ZXJuIGlmIGFsbCB0aGUgdGhyZWUgYXJlIG9wZW5lZCBhdCB0aGUgc2FtZSB0aW1lPzwvZGl2PiZzZXA7IDE5IDEvNyBtaW4mc2VwOzE1IDEvNyBtaW4mc2VwOzE3IDEvNyBtaW4mc2VwOzcgMS83IG1pbiZzZXA7MTcgMS83IG1pbiZzZXA7NDUiLCIxOCZzZXA7PGRpdj5UaGUgc3F1YXJlIHJvb3Qgb2YgNjQwMDkgaXM6XG48L2Rpdj4mc2VwOzI1MyZzZXA7MzQ3JnNlcDszNjMmc2VwOzgwMyZzZXA7MjUzJnNlcDs0NSIsIjEwMyZzZXA7PGRpdj5XaGF0IHBlcmNlbnQgb2YgMTIwIGFyZSA5MD88L2Rpdj4mc2VwOzI1JSZzZXA7NTAlJnNlcDs3NSUmc2VwOzMzJSZzZXA7NzUlJnNlcDs0NSIsIjE0JnNlcDs8ZGl2PklmIDYgbWVuIGFuZCA4IGJveXMgY2FuIGRvIGEgcGllY2Ugb2Ygd29yayBpbiAxMCBkYXlzIHdoaWxlIDI2IG1lbiBhbmQgNDggYm95cyBjYW4gZG8gdGhlIHNhbWUgaW4gMiBkYXlzLCB0aGUgdGltZSB0YWtlbiBieSAxNSBtZW4gYW5kIDIwIGJveXMgaW4gZG9pbmcgdGhlIHNhbWUgdHlwZSBvZiB3b3JrIHdpbGwgYmU6PC9kaXY+JnNlcDs0IGRheXMmc2VwOzUgZGF5cyZzZXA7NiBkYXlzJnNlcDs3IGRheXMmc2VwOzQgZGF5cyZzZXA7NDUiLCIxMDEmc2VwOzxkaXY+VHdvIHBpcGVzIEEgYW5kIEIgY2FuIHNlcGFyYXRlbHkgZmlsbCBhIHRhbmsgaW4gMiBtaW51dGVzIGFuZCAxNSBtaW51dGVzIHJlc3BlY3RpdmVseS4gQm90aCB0aGUgcGlwZXMgYXJlIG9wZW5lZCB0b2dldGhlciBidXQgNCBtaW51dGVzIGFmdGVyIHRoZSBzdGFydCB0aGUgcGlwZSBBIGlzIHR1cm5lZCBvZmYuIEhvdyBtdWNoIHRpbWUgd2lsbCBpdCB0YWtlIHRvIGZpbGwgdGhlIHRhbms/PC9kaXY+JnNlcDs5IG1pbiZzZXA7MTAgbWluJnNlcDsxMSBtaW4mc2VwOzEyIG1pbiZzZXA7MTAgbWluJnNlcDs0NSIsIjE5JnNlcDs8ZGl2PlR3byBjYXJkcyBhcmUgZHJhd24gdG9nZXRoZXIgZnJvbSBhIHBhY2sgb2YgNTIgY2FyZHMuIFRoZSBwcm9iYWJpbGl0eSB0aGF0IG9uZSBpcyBhIHNwYWRlIGFuZCBvbmUgaXMgYSBoZWFydCwgaXM6XG48L2Rpdj4mc2VwOzMvMjAmc2VwOzI5LzM0JnNlcDs0Ny8xMDAmc2VwOzEzLzEwMiZzZXA7MTMvMTAyJnNlcDs0NSJdLCJwcmV2X3F1ZSI6IjEwNyIsInRpbWVyIjoiMTg6MzY6MDIiLCJzY29yZSI6MSwiX3Nlc3Npb25fZXhwaXJ5IjowLCJsb2dnZWRfaW4iOiJndXJ1cHJhc2FkLmJyQHRlcnJhbG9naWMuY29tIn0=', '2019-11-04 13:06:10.995189'),
('w2x7p6iattnarwv0v193ayh3px05ir42', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-27 07:06:47.482552'),
('w59gbd6o4t8bbru87of18i8qe3i0w2o3', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-03 06:51:42.487547'),
('w6x22s2zcrj9annn0prxtge1gnsktwk6', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-09-26 07:29:06.953047'),
('w8s2cg7ugi9k3uovueai0mlsnoh9qo1r', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-03 07:38:45.139534'),
('wa03mk33mgm8wiqejwfilzvkn84i1klz', 'ZGQ1YWY1MGZjYjUzZmNlNjE1NmUyNGNhNTc1OTU1MGQ0YjRhZDg5Yzp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSIsInNlbnRfZW1haWxzIjpbXX0=', '2019-09-21 05:04:30.436003'),
('wdz8xnmtwd00gw8isepkctck0exjv27d', 'MDY0ODE5NmFjNTllNzk5OTE1Yzg1MjY1ODFiNjY0ZGMwMzRmNzFjYTp7ImFkbWluIjoiYWRtaW5AdGVycmFsb2dpYy5jb20iLCJsb2dnZWRfaW4iOm51bGx9', '2019-11-19 05:48:47.495140'),
('wfcrwgcmlivnq3tlihlvcujgejp8dtkj', 'NGMyZmMyNTc0NzBkOTljNmExOWQ0YzMyNThkZTc5MDA3MWQxNmEwMTp7fQ==', '2019-09-21 04:46:23.162427'),
('wj6zpk7dll6c1t1mlptljfl1mw78252w', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-03 07:47:07.622057'),
('wj75u58inc7p5ed1gtdlkbsibox3d03i', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-27 10:52:55.032144'),
('wk75j2o0jy9lwcrpgi3rhotn3bq733uz', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-07 12:04:57.801077'),
('wmbmdogfis6awiq5jsstwl4i0cyejtmu', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-03 06:45:04.898214'),
('wuyrurrvkelt4hg6k5yidvia194c8tl1', 'OWI2ODIxNTc3NjZkZGM4MDcyOWViMzFiMDAzZTQyNTJiN2Y1YmQ4YTp7ImxvZ2dlZF9pbiI6bnVsbH0=', '2019-09-17 09:11:26.577177'),
('x6opmi9qvbm1lyxcu5s4963251otkas5', 'OWI2ODIxNTc3NjZkZGM4MDcyOWViMzFiMDAzZTQyNTJiN2Y1YmQ4YTp7ImxvZ2dlZF9pbiI6bnVsbH0=', '2019-09-23 09:07:26.678288'),
('xb8vwtez00l7f5d0m6ekdjx7ec5q2pdm', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-07 11:47:17.326138'),
('xevu5efuui46fwiyuwfwsjyq6w55hljx', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-03 11:30:49.311397'),
('xjwk6ub5dobagig6gw6zbj42u89zguf3', 'OWI2ODIxNTc3NjZkZGM4MDcyOWViMzFiMDAzZTQyNTJiN2Y1YmQ4YTp7ImxvZ2dlZF9pbiI6bnVsbH0=', '2019-09-23 09:07:22.547234'),
('xrv9p9my3ncqta9wejxnsmkk56cee59h', 'ZGQ1YWY1MGZjYjUzZmNlNjE1NmUyNGNhNTc1OTU1MGQ0YjRhZDg5Yzp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSIsInNlbnRfZW1haWxzIjpbXX0=', '2019-09-23 05:39:20.031015'),
('y21oip9iag5ace4r0x7sviq0oclaqheo', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-22 10:12:56.271828'),
('y239cveweiyilix7vs9aw6cgxey1qpsx', 'OTc0MWI5MjMzMjg4NjdkOTg1OGNiNGMxYjYzNGJlZDE1ZjQzMDBmYTp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkBnbWFpbC5jb20ifQ==', '2019-09-13 09:17:35.674918'),
('y58jzrffvo98jcs78cq76fgsz3pxn971', 'NGMyZmMyNTc0NzBkOTljNmExOWQ0YzMyNThkZTc5MDA3MWQxNmEwMTp7fQ==', '2019-10-03 08:52:23.946786'),
('y60ya2gel8sxqqfszgkcnaskc3hzeafm', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-03 11:28:57.381192'),
('yaglpvyravab6jsui698q37fh08t3g1e', 'OWI2ODIxNTc3NjZkZGM4MDcyOWViMzFiMDAzZTQyNTJiN2Y1YmQ4YTp7ImxvZ2dlZF9pbiI6bnVsbH0=', '2019-09-23 09:08:57.663554'),
('ydnmpu49ahf7o1c66z1c1955niilieh0', 'NGMyZmMyNTc0NzBkOTljNmExOWQ0YzMyNThkZTc5MDA3MWQxNmEwMTp7fQ==', '2019-10-04 10:06:20.592836'),
('yiakpeqgmr8397omq9s7jjhhxcx07mlo', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-04 06:28:08.326335'),
('ymc4nephmoxywnkhvy1vo9llcvpoui48', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-07 11:55:59.226377'),
('ymvlryerob85gybxttqt63jcq2mdmc2e', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-26 10:38:06.248420'),
('yrkhq7m1k6irf2mut2a75oyj7c1venl9', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-04 09:22:19.105269'),
('yseu0gxwmmeb304vsga1oc06v5lyo2k0', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-22 05:19:21.522635'),
('ytasb2dcsyzb6n9ngbxptakgoy2ledb4', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-11-27 09:40:25.351575'),
('yvbetqaa60v95vzv53vhycdt17g5a4hh', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-03 08:41:21.010964'),
('z3k1fvigk15ki6bnztycx1xgv3u4tp2d', 'OTc0MWI5MjMzMjg4NjdkOTg1OGNiNGMxYjYzNGJlZDE1ZjQzMDBmYTp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkBnbWFpbC5jb20ifQ==', '2019-09-13 03:42:27.732468'),
('zeuqmcxldzdwrya1lxw4vmsra7pi4sue', 'NmVjNTM5ODEwNTM2YzhiNmFlZDE0YmNmMGY2MGM1ZmU4MzBiM2M2YTp7InRlc3QiOiJndXJ1In0=', '2019-09-11 16:59:59.890553'),
('zivr789wsny0dptrbsru3olijq1ct41u', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-03 07:35:02.877875'),
('zt5zbejn9obefm2ekizl159odjaeyxc6', 'ZTI0NjNkNDY0NjViZjFlNGNkZjlmMTFjMzgyYzJlNjViZjdlODI2MDp7ImxvZ2dlZF9pbiI6bnVsbCwiYWRtaW4iOiJhZG1pbkB0ZXJyYWxvZ2ljLmNvbSJ9', '2019-10-04 07:30:53.012872'),
('zu5jneok0tiy7hts8eti7emdxhj8b6ol', 'NmVjNTM5ODEwNTM2YzhiNmFlZDE0YmNmMGY2MGM1ZmU4MzBiM2M2YTp7InRlc3QiOiJndXJ1In0=', '2019-09-11 16:56:04.285760');

-- --------------------------------------------------------

--
-- Table structure for table `smart_admin_users`
--

CREATE TABLE `smart_admin_users` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `email` varchar(254) NOT NULL,
  `password` varchar(70) NOT NULL,
  `super_admin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `smart_admin_users`
--

INSERT INTO `smart_admin_users` (`id`, `name`, `email`, `password`, `super_admin`) VALUES
(3, 'admin', 'admin@terralogic.com', '70d615107eCoJ44bmpSkf2jCmxEM7Gag==', 1),
(26, 'admin2', 'admin2@terralogic.com', '6bda38c798nq2TwyfinYlW3qYSdFMWnw==', 1),
(27, 'test', 'test@gmail.com', '87924606b40Lty2btcd7B6fSPtmcK3hQ==', 0),
(28, 'test2', 'test2@gmail.com', 'cc2e1669550Lty2btcd7B6fSPtmcK3hQ==', 0);

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
(3, 'Networking'),
(2, 'Programming'),
(4, 'Verbal');

-- --------------------------------------------------------

--
-- Table structure for table `smart_code_questions`
--

CREATE TABLE `smart_code_questions` (
  `id` int(11) NOT NULL,
  `pbm_stmt` longtext NOT NULL,
  `code` longtext NOT NULL,
  `example_input` longtext NOT NULL,
  `test_input1` longtext NOT NULL,
  `test_input2` longtext NOT NULL,
  `test_input3` longtext NOT NULL,
  `test_input4` longtext NOT NULL,
  `lang` varchar(255) NOT NULL,
  `expected_output1` longtext NOT NULL,
  `expected_output2` longtext NOT NULL,
  `expected_output3` longtext NOT NULL,
  `expected_output4` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `smart_code_questions`
--

INSERT INTO `smart_code_questions` (`id`, `pbm_stmt`, `code`, `example_input`, `test_input1`, `test_input2`, `test_input3`, `test_input4`, `lang`, `expected_output1`, `expected_output2`, `expected_output3`, `expected_output4`) VALUES
(30, 'do java pgm', 'import java.util.Scanner;  // Import the Scanner class\n\nclass pgm {\n  public static void main(String[] args) {\n    Scanner myObj = new Scanner(System.in);  // Create a Scanner object\n    System.out.println(&quot;Enter username&quot;);\n\n    String userName = myObj.nextLine();  // Read user input\n    System.out.println(&quot;Username is: &quot; + userName);  // Output user input\n  }\n}', 'guru', 'raj', 'swagath', 'vishram', 'prajwal', 'java', 'Enter username\nUsername is: raj', 'Enter username\nUsername is: swagath', 'Enter username\nUsername is: vishram', 'Enter username\nUsername is: prajwal'),
(31, 'testcase2', 'import java.util.Scanner;  // Import the Scanner class\n\nclass pgm {\n  public static void main(String[] args) {\n    Scanner myObj = new Scanner(System.in);  // Create a Scanner object\n    System.out.println(&quot;Enter name&quot;);\n\n    String userName = myObj.nextLine();  // Read user input\n    System.out.println(&quot;UR name is: &quot; + userName);  // Output user input\n  }\n}', 'example1', 'test1', 'test2', 'test3', 'test4', 'java', 'Enter name\nUR name is: test1', 'Enter name\nUR name is: test2', 'Enter name\nUR name is: test3', 'Enter name\nUR name is: test4'),
(32, 'C program to check whether the character is an alphabet or not', '#include &lt;stdio.h&gt;\nint main()\n{\nchar ch;\nprintf(&quot;Enter a character: &quot;);\nscanf(&quot; %c&quot;,&amp;ch);\nprintf(&quot;\\n&quot;);\nif( (ch &gt;= &#x27;a&#x27; &amp;&amp; ch &lt;= &#x27;z&#x27;) || ( ch &gt;= &#x27;A&#x27; &amp;&amp; ch &lt;=&#x27;Z&#x27;))\nprintf(&quot;%c is an alphabet\\n&quot;,ch);\nelse\nprintf(&quot;%c is not an alphabet\\n&quot;,ch);\n\nreturn 0;\n}', 'a', '1', 'z', 'A', '0', 'cpp', 'Enter a character: \n1 is not an alphabet', 'Enter a character: \nz is an alphabet', 'Enter a character: \nA is an alphabet', 'Enter a character: \n0 is not an alphabet'),
(33, 'Java program to find the ASCII value of a character', 'import java.util.*;\npublic class pgm\n{\npublic static void main(String[] args)\n{\nchar ch;\nScanner sc = new Scanner(System.in);\nch = sc.next().charAt(0);\nint ascii = (int) ch;\nSystem.out.println(&quot;ASCII of &quot; + ch + &quot; is &quot; + ascii);   // Prints the ASCII value of the input character\n}\n}', 'a', '1', 'n', '~', 'A', 'java', 'ASCII of 1 is 49', 'ASCII of n is 110', 'ASCII of ~ is 126', 'ASCII of A is 65');

-- --------------------------------------------------------

--
-- Table structure for table `smart_coding_result_set`
--

CREATE TABLE `smart_coding_result_set` (
  `id` int(11) NOT NULL,
  `user_code` longtext NOT NULL,
  `lang` varchar(255) NOT NULL,
  `total_testcase_passed` int(11) NOT NULL,
  `code_questions_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `e_time` time(6) NOT NULL,
  `s_time` time(6) NOT NULL,
  `exam_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `smart_coding_result_set`
--

INSERT INTO `smart_coding_result_set` (`id`, `user_code`, `lang`, `total_testcase_passed`, `code_questions_id`, `user_id`, `e_time`, `s_time`, `exam_id`) VALUES
(132, '#include &lt;stdio.h&gt;\nint main()\n{\nchar ch;\nprintf(&quot;Enter a character: &quot;);\nscanf(&quot; %c&quot;,&amp;ch);\nprintf(&quot;\\n&quot;);\nif( (ch &gt;= &#x27;a&#x27; &amp;&amp; ch &lt;= &#x27;z&#x27;) || ( ch &gt;= &#x27;A&#x27; &amp;&amp; ch &lt;=&#x27;Z&#x27;))\nprintf(&quot;%c iss an alphabet\\n&quot;,ch);\nelse\nprintf(&quot;%c is not an alphabet\\n&quot;,ch);\n\nreturn 0;\n}', 'cpp', 2, 32, 273, '12:35:50.000000', '12:14:18.000000', 43),
(133, 'import java.util.Scanner;  // Import the Scanner class\n\nclass pgm {\n  public static void main(String[] args) {\n    Scanner myObj = new Scanner(System.in);  // Create a Scanner object\n    System.out.println(&quot;Enter name&quot;);\n\n    String userName = myObj.nextLine();  // Read user input\n    System.out.println(&quot;UR name is: &quot; + userName);  // Output user input\n  }\n}', 'java', 5, 31, 273, '12:35:03.000000', '12:14:54.000000', 43),
(134, 'import java.util.*;\npublic class pgm\n{\npublic static void main(String[] args)\n{\nchar ch;\nScanner sc = new Scanner(System.in);\nch = sc.next().charAt(0);\nint ascii = (int) ch;\nSystem.out.println(&quot;ASCII of &quot; + ch + &quot; is &quot; + ascii);   // Prints the ASCII value of the input character\n}\n}', 'java', 5, 33, 273, '12:42:22.000000', '12:15:26.000000', 43),
(135, '', '', 0, 30, 273, '13:10:11.000000', '12:15:59.000000', 43),
(158, '', '', 0, 30, 279, '13:10:11.000000', '13:09:24.000000', 64),
(159, '', '', 0, 30, 283, '00:00:00.000000', '17:01:48.000000', 44);

-- --------------------------------------------------------

--
-- Table structure for table `smart_email_status`
--

CREATE TABLE `smart_email_status` (
  `id` int(11) NOT NULL,
  `status` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `smart_email_status`
--

INSERT INTO `smart_email_status` (`id`, `status`) VALUES
(113, 'Sent :	2019-11-13 17:40:35	guruprasad.br@terralogic.com'),
(114, 'All mail are sent.');

-- --------------------------------------------------------

--
-- Table structure for table `smart_exam`
--

CREATE TABLE `smart_exam` (
  `id` int(11) NOT NULL,
  `e_name` varchar(32) NOT NULL,
  `start_date` datetime(6) NOT NULL,
  `end_date` datetime(6) NOT NULL,
  `duration` int(11) NOT NULL,
  `total_marks` int(11) NOT NULL,
  `code_duration` int(11) NOT NULL,
  `code_total_marks` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `smart_exam`
--

INSERT INTO `smart_exam` (`id`, `e_name`, `start_date`, `end_date`, `duration`, `total_marks`, `code_duration`, `code_total_marks`) VALUES
(43, 'Freshers Hiring May', '2019-09-18 00:00:00.000000', '2019-12-21 00:00:00.000000', 3600, 8, 1800, 20),
(44, 'Python Hiring July', '2019-09-18 00:00:00.000000', '2019-12-14 00:00:00.000000', 3600, 79, 15300, 20),
(64, 'raj', '2019-11-12 07:36:00.000000', '2019-11-12 07:40:00.000000', 120, 40, 60, 20);

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
(9, '<div>A boat can travel with a speed of 13 km/hr in still water. If the speed of the stream is 4 km/hr, find the time taken by the boat to go 68 km downstream.</div>', '2 hours', '3 hours', '4 hours', '5 hours', '3 hours', 1),
(12, '<div>The sum of ages of 5 children born at the intervals of 3 years each is 50 years. What is the age of the youngest child?</div>', '4 years', '8 years', '10 years', 'None of these', '4 years', 1),
(14, '<div>If 6 men and 8 boys can do a piece of work in 10 days while 26 men and 48 boys can do the same in 2 days, the time taken by 15 men and 20 boys in doing the same type of work will be:</div>', '4 days', '5 days', '6 days', '7 days', '4 days', 1),
(17, '<div>Three times the first of three consecutive odd integers is 3 more than twice the third. The third integer is:</div>', '9', '11', '4320', '15', '15', 1),
(18, '<div>The square root of 64009 is:\n</div>', '253', '347', '363', '803', '253', 1),
(19, '<div>Two cards are drawn together from a pack of 52 cards. The probability that one is a spade and one is a heart, is:\n</div>', '3/20', '29/34', '47/100', '13/102', '13/102', 1),
(20, '<div>A can contains a mixture of two liquids A and B is the ratio 7 : 5. When 9 litres of mixture are drawn off and the can is filled with B, the ratio of A and B becomes 7 : 9. How many litres of liquid A was contained by the can initially?</div>', '10', '20', '21', '25', '21', 1),
(22, '<div>Which of the following is the correct order of evaluation for the below expression?&lt;br&gt;\nz = x + y * z / 4 % 2 - 1\n</div>', '* / % + - =', '= * / % + -', '/ * % - + =', '* % / - + =', '* / % + - =', 2),
(23, '<div>The keyword used to transfer control from a function back to the calling function is</div>', 'switch', 'goto', 'return', 'go back', 'return', 2),
(24, '<div>In which header file is the NULL macro defined?</div>', 'stdio.h', 'stddef.h', 'stdio.h and stddef.h', 'math.h', 'stdio.h and stddef.h', 2),
(25, '<div>To print out a and b given below, which of the following printf() statement will you use? \n<pre>\n#include &amp;lt stdio.h&amp;gt\n\nfloat a=3.14;\ndouble b=3.14;\n</pre>\n</div>', 'printf(&quot;%f %lf&quot;, a, b);', 'printf(&quot;%Lf %f&quot;, a, b);', 'printf(&quot;%Lf %Lf&quot;, a, b);', 'printf(&quot;%f %Lf&quot;, a, b);', 'printf(&quot;%f %lf&quot;, a, b);', 2),
(26, '<div>Which bitwise operator is suitable for turning off a particular bit in a number?\n</div>', '&amp;&amp; operator', '&amp; operator', '|| operator', '! operator', '&amp; operator', 2),
(27, '<div>Which of the following function is more appropriate for reading in a multi-word string?\n</div>', 'printf();', 'scanf();', 'gets();', 'puts();', 'gets();', 2),
(28, '<div>What will be the output of the program?&lt;/div&gt;\n&lt;pre&gt;\n#include &amp;lt stdio.h &amp;gt\nint main()\n{\n    const int x=5;\n    const int *ptrx;\n    ptrx = &amp;x;\n    *ptrx = 10;\n    printf(&quot;%d\\n&quot;, x);\n    return 0;\n}\n</div>', '5', 'Error', '10', 'Garbage Value', 'Error', 2),
(29, '<div>Which standard library function will you use to find the last occurance of a character in a string in C?</div>', 'strnchar()', 'strchar()', 'strrchar()', 'strrchr()', 'strrchr()', 2),
(30, '<div>Which of the following is not logical operator?</div>', '&amp;', '&amp;&amp;', '||', '!', '&amp;', 2),
(31, '<div>Which of the following cannot be checked in a switch-case statement?\n</div>', 'Character', 'Integer', 'Float', 'enum', 'Float', 2),
(32, '<div>What will you do to treat the constant 3.14 as a long double?</div>', 'use 3.14LD', 'use 3.14L', 'use 3.14DL', 'use 3.14LF', 'use 3.14L', 2),
(33, '<div>What will happen if in a C program you assign a value to an array element whose subscript exceeds the size of array?</div>', 'The element will be set to 0.', 'The compiler would report an error', 'The program may crash if some important data gets overwritten.', 'The array size would appropriately grow.', 'The program may crash if some important data gets overwritten.', 2),
(34, '<div> How will you free the allocated memory ?</div>', 'remove(var-name);', 'free(var-name);', 'delete(var-name);', 'dalloc(var-name);', 'free(var-name);', 2),
(35, '<div> What do the &#x27;c&#x27; and &#x27;v&#x27; in argv stands for?\n</div>', '&#x27;c&#x27; means argument control &#x27;v&#x27; means argument vector', '&#x27;c&#x27; means argument count &#x27;v&#x27; means argument vertex', '&#x27;c&#x27; means argument count &#x27;v&#x27; means argument vector', '&#x27;c&#x27; means argument configuration &#x27;v&#x27; means argument visibility', '&#x27;c&#x27; means argument count &#x27;v&#x27; means argument vector', 2),
(36, '<div>In the following code what is &#x27;P&#x27;?&lt;/div&gt;\n&lt;pre&gt;\ntypedef char *charp;\nconst charp P;\n</div>', 'P is a constant', 'P is a character constant', 'P is character type', 'P is character type', 'P is a constant', 2),
(37, '<div>Which header file should be included to use functions like malloc() and calloc()?\n</div>', 'memory.h', 'stdlib.h', 'string.h', 'dos.h', 'stdlib.h', 2),
(38, '<div>In C, if you pass an array as an argument to a function, what actually gets passed?</div>', 'Value of elements in array', 'First element of the array', 'Base address of the array', 'Address of the last element of array', 'Base address of the array', 2),
(40, '<div>What do the following declaration signify?&lt;/div&gt;\n&lt;pre&gt;                                                                                                    \n  int (*pf)();\n</div>', 'pf is a pointer to a function which return int ', 'pf is a function pointer.', 'pf is a pointer to function.', 'pf is a function of pointer variable', 'pf is a pointer to a function which return int ', 2),
(41, '<div>choose the word which is the exact OPPOSITE of the given words.\nENORMOUS\n</div>', 'Soft', 'Average', 'Tiny', 'Weak', 'Tiny', 4),
(42, '<div>Read each sentence to find out whether there is any grammatical error in it. The error, if any will be in one part of the sentence. The letter of that part is the answer. If there is no error, the answer is &#x27;D&#x27;. (Ignore the errors of punctuation, if any)\n</div>', 'We discussed about the problem so thoroughly', 'on the eve of the examination', 'that I found it very easy to work it out', 'No error', 'We discussed about the problem so thoroughly', 4),
(43, '<div> Find the correctly spelt words.</div>', 'Benefitted', 'Benefited', 'Benifited', 'Benefeted', 'Benefited', 4),
(44, '<div> Since the beginning of history &lt;br&gt;\nP :	have managed to catch&lt;br&gt;\nQ :	the Eskimos and Red Indians&lt;br&gt;\nR :	by a very difficulty method&lt;br&gt;\nS :	a few specimens of this aquatic animal&lt;br&gt;\nThe Proper sequence should be:\n</div>', 'QRPS', 'SQPR', 'SQRP', 'QPSR', 'QPSR', 4),
(45, '<div>Choose the correct alternative. In case no improvement is needed, option &#x27;D&#x27; is the answer.\nThe workers are hell bent at getting what is due to them.\n</div>', 'hell bent on getting', 'hell bent for getting', 'hell bent upon getting', 'No improvement', 'hell bent upon getting', 4),
(46, '<div> The first and sixth sentence are given in the begining.The middle four sentences in each have been removed and jumbled up. These are labelled as P, Q, R and S. Find out the proper order for the four sentences&lt;br&gt;\nS1:	Calcutta unlike other cities kepts its trams.&lt;br&gt;\nP :	As a result there horrendous congestion.&lt;br&gt;\nQ :	It was going to be the first in South Asia.&lt;br&gt;\nR :	They run down the centre of the road&lt;br&gt;\nS :	To ease in the city decided to build an underground railway line.&lt;br&gt;\nS6:	The foundation stone was laid in 1972.&lt;br&gt;\nThe Proper sequence should be:\n</div>', 'PRSQ', 'PSQR', 'SQRP', 'RPSQ', 'RPSQ', 4),
(47, '<div>choose the one which can be substituted for the given word/sentence.&lt;br&gt;&lt;br&gt;\nA person of good understanding knowledge and reasoning power\n</div>', 'Expert', 'Intellectual', 'Snob', 'Literate', 'Intellectual', 4),
(48, '<div>choose the one which best expresses the given sentence in Passive/Active voice&lt;br&gt;&lt;br&gt;\nAfter driving professor Kumar to the museum she dropped him at his hotel.\n</div>', 'After being driven to the museum, Professor Kumar was dropped at his hotel.', 'Professor Kumar was being driven dropped at his hotel.', 'After she had driven Professor Kumar to the museum she had dropped him at his hotel.', 'After she was driven Professor Kumar to the museum she had dropped him at his hotel.', 'After being driven to the museum, Professor Kumar was dropped at his hotel.', 4),
(49, '<div>Select the pair which has the same relationship.\n&lt;br&gt;&lt;br&gt;\nDIVA:OPERA</div>', 'producer:theatre', 'director:drama', 'conductor:bus', 'thespian:play', 'thespian:play', 4),
(50, '<div>Choose the word which best expresses the meaning of the given word.\n&lt;br&gt;&lt;br&gt;\nCANNY\n</div>', 'Obstinate', 'Handsome', 'Clever', 'Stout', 'Clever', 4),
(51, '<div>Pick out the most effective word(s) from the given words to fill in the blank to make the sentence meaningfully complete.\n&lt;br&gt;\nRohan and Rohit are twin brothers, but they do not look ......\n</div>', 'unique', 'different', 'likely', 'alike', 'alike', 4),
(52, '<div>A sentence broken into five or six parts. Join these parts to make a meaningful sentence. The correct order of parts is the answer\n&lt;br&gt;\n1. do   &lt;br&gt;2. today &lt;br&gt;  3. you &lt;br&gt;  4. must &lt;br&gt;  5. it\n</div>', '34152', '25413', '12543', '51324', '34152', 4),
(54, '<div>An incomplete statement (Stem) followed by fillers is given. Pick out the best one which can complete incomplete stem correctly and meaningfully.	\n&lt;br&gt;\nDespite his best efforts to conceal his anger ......\n\n</div>', 'we could detect that he was very happy', 'he failed to give us an impression of his agony', 'he succeeded in camouflaging his emotions', 'people came to know that he was annoyed', 'people came to know that he was annoyed', 4),
(55, '<div>Rearrange the following five sentences in proper sequence so as to for a meaningful paragraph, then answer the questions given below them.&lt;br&gt;\n        1 After Examining him, the doctor smiled at him mischievously and took out a syringe.&lt;br&gt;\n	2 Thinking that he was really sick, his father summoned the family doctor.&lt;br&gt;\n	3 That day, Mintu wanted to take a day off from school&lt;br&gt;\n	4 Immediately, Mintu jumped up from his bed and swore the he was fine&lt;br&gt;\n	5 Therefor; he pretended to be sick and remained in bed.&lt;br&gt;\n&lt;br&gt;\nWhich sentence should come fourth in the paragraph?</div>', '1', '2', '3', '4', '1', 4),
(56, '<div>I felt the wall of the tunnel shiver. The master alarm squealed through my earphones. Almost simultaneously, Jack yelled down to me that there was a warning light on. Fleeting but spectacular sights snapped into ans out of view, the snow, the shower of debris, the moon, looming close and big, the dazzling sunshine for once unfiltered by layers of air. The last twelve hours before re-entry were particular bone-chilling. During this period, I had to go up in to command module. Even after the fiery re-entry splashing down in 81o water in south pacific, we could still see our frosty breath inside the command module.\n&lt;br&gt;\nThe word &#x27;Command Module&#x27; used twice in the given passage indicates perhaps that it deals with\n</div>', 'an alarming journey', 'a commanding situation', 'a journey into outer space', 'a frightful battle.', 'a journey into outer space', 4),
(57, '<div>Some proverbs/idioms are given below together with their meanings. Choose the correct meaning of proverb/idiom\nTo have an axe to grind\n</div>', 'A private end to serve', 'To fail to arouse interest', 'To have no result', 'To work for both sides', 'A private end to serve', 4),
(58, '<div>the sentences have been given in Direct/Indirect speech. From the given alternatives, choose the one which best expresses the given sentence in Indirect/Direct speech	\n&lt;br&gt;\nHe said to his father, &quot;Please increase my pocket-money.&quot;\n</div>', 'He told his father, &quot;Please increase the pocket-money&quot;', 'He requested his father to increase his pocket-money.', 'He pleaded his father to please increase my pocket money.', 'He asked his father to increase his pocket-money.', 'He requested his father to increase his pocket-money.', 4),
(59, '<div>choose the one which can be substituted for the given word/sentence.&lt;br&gt;\nExtreme old age when a man behaves like a fool\n</div>', 'Imbecility', 'Senility', 'Dotage', 'Superannuation', 'Dotage', 4),
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
(72, '<div>What is the size of Network bits &amp; Host bits of Class A of IP address?</div>', 'Network bits 7, Host bits 24', 'Network bits 8, Host bits 24', 'Network bits 7, Host bits 23', 'Network bits 8, Host bits 23', 'Network bits 7, Host bits 24', 3),
(74, '<div>The Internet is an example of\n</div>', 'Cell switched network', 'circuit switched network', 'Packet switched network', 'All of above', 'Packet switched network', 3),
(75, '<div>What does protocol defines?\n</div>', 'Protocol defines what data is communicated.', 'Protocol defines how data is communicated.', 'Protocol defines when data is communicated.', 'All of above', 'All of above', 3),
(76, '<div>What is the uses of subnetting?\n</div>', 'It divides one large network into several smaller ones', 'It divides network into network classes', 'It speeds up the speed of network', 'None of above', 'It divides one large network into several smaller ones', 3),
(77, '<div>Repeater operates in which layer of the OSI model?\n</div>', 'Physical layer', 'Data link layer', 'Network layer', 'Transport layer', 'Transport layer', 3),
(78, '<div>Which of the following network device has the slowest type of\nconnection?\n</div>', 'DSL', 'Router', 'Bridges', 'Dial-up modems', 'Dial-up modems', 3),
(79, '<div>Which of the following is an example of Personal Area Networking?</div>', 'WAN', 'WLAN', 'Bluetooth', 'All of the above', 'Bluetooth', 3),
(80, '<div>Which networking device connect one LAN to other LAN using\nsame protocol?\n</div>', 'Router', 'Switch', 'Bridge', 'Modem', 'Switch', 3),
(87, '<div>Find the H.C.F, if the numbers are in the ratio of 4 : 5 : 6 and their L.C.M. is 2400.</div>', '35', '20', '40', '25', '40', 1),
(96, '<div>The protocol data unit(PDU) for the application layer in the Internet stack is</div>', 'Segment', 'Datagram', 'Message', 'Frame', 'Message', 3),
(98, '<div>1. Are logical operator sequence points?<br /></div>', 'True', 'False', 'Depends on the compiler', 'Depends on the standard', 'True', 2),
(99, '<div>What will be the final value of d in the following C code?<br /><br /></div>\n<pre>    #include &lt;stdio.h&gt;\n    int main()\n    {\n        int a = 10, b = 5, c = 5;\n        int d;\n        d = b + c == a;\n        printf(&quot;%d&quot;, d);\n    }</pre>', 'Syntax error', '1', '5', '10', '1', 2),
(100, '<div>Two pipes A and B can fill a cistern in 20 and 30 minutes respectively, and a third pipe C can empty it in 40 minutes. How long will it take to fill the cistern if all the three are opened at the same time?</div>', ' 19 1/7 min', '15 1/7 min', '17 1/7 min', '7 1/7 min', '17 1/7 min', 1),
(101, '<div>Two pipes A and B can separately fill a tank in 2 minutes and 15 minutes respectively. Both the pipes are opened together but 4 minutes after the start the pipe A is turned off. How much time will it take to fill the tank?</div>', '9 min', '10 min', '11 min', '12 min', '10 min', 1),
(102, '<div>A cistern has a leak which would empty the cistern in 20 minutes. A tap is turned on which admits 4 liters a minute into the cistern, and it is emptied in 24 minutes. How many liters does the cistern hold?</div>', '480 liters', '600 liters', '720 liters', '800 liters', '480 liters', 1),
(103, '<div>What percent of 120 are 90?</div>', '25%', '50%', '75%', '33%', '75%', 1),
(104, '<div>How much is 80% of 40 is greater than 4/5 of 25?</div>', '4', '6', '9', '12', '12', 1),
(105, '<div>Find the one which does not belong to that group ?<br /></div>', '3', '4', '7', '9', '4', 1),
(106, '<div>LCM of 87 and 145 is:</div>', '1305', '435', '875', '48', '435', 1),
(107, '<div>LCM of 455, 117, 338 is:</div>', '10670', '106470', '104670', '107470', '106470', 1),
(109, '<div>HCF of 3/16, 5/12, 7/8 is:</div>', '2/47', '3/47', '1/48', '5/48', '1/48', 1),
(113, '<div>bulk que 1</div>', 'opt1', 'opt2', 'opt3', 'opt4', 'opt1', 2),
(114, '<div>bulk que 2</div>\n<pre>pgm</pre>', 'opt1', 'opt2', 'opt3', 'opt4', 'opt2', 2),
(115, '<div>bulk que 3</div>', 'opt1', 'opt2', 'opt3', 'opt4', 'opt3', 2),
(116, '<div>bulk que 4</div>', 'opt1', 'opt2', 'opt3', 'opt4', 'opt4', 2),
(117, '<div>bulk que 1</div>', 'opt1', 'opt2', 'opt3', 'opt4', 'opt1', 2),
(118, '<div>bulk que 2</div>\n<pre>pgm</pre>', 'opt1', 'opt2', 'opt3', 'opt4', 'opt2', 2),
(119, '<div>bulk que 3</div>', 'opt1', 'opt2', 'opt3', 'opt4', 'opt3', 2),
(120, '<div>bulk que 4</div>', 'opt1', 'opt2', 'opt3', 'opt4', 'opt4', 2),
(122, '<div>bulk que 1</div>', 'opt1', 'opt2', 'opt3', 'opt4', 'opt1', 2),
(123, '<div>bulk que 2</div>\n<pre>pgm</pre>', 'opt1', 'opt2', 'opt3', 'opt4', 'opt2', 2),
(124, '<div>bulk que 3</div>', 'opt1', 'opt2', 'opt3', 'opt4', 'opt3', 2),
(125, '<div>bulk que 4</div>', 'opt1', 'opt2', 'opt3', 'opt4', 'opt4', 2),
(127, '<div>bulk que 1</div>', 'opt1', 'opt2', 'opt3', 'opt4', 'opt1', 2),
(128, '<div>bulk que 2</div>\n<pre>pgm</pre>', 'opt1', 'opt2', 'opt3', 'opt4', 'opt2', 2),
(129, '<div>bulk que 3</div>', 'opt1', 'opt2', 'opt3', 'opt4', 'opt3', 2),
(130, '<div>bulk que 4</div>', 'opt1', 'opt2', 'opt3', 'opt4', 'opt4', 2),
(177, '<div>bulk que 2</div>\n<pre>pgm</pre>', 'opt1', 'opt2', 'opt3', 'opt4', 'opt2', 3),
(178, '<div>bulk que 3</div>', 'opt1', 'opt2', 'opt3', 'opt4', 'opt3', 3),
(179, '<div>bulk que 4</div>', 'opt1', 'opt2', 'opt3', 'opt4', 'opt4', 3),
(182, '<div>bulk que 2</div>\n<pre>pgm</pre>', 'opt1', 'opt2', 'opt3', 'opt4', 'opt2', 2),
(183, '<div>bulk que 3</div>', 'opt1', 'opt2', 'opt3', 'opt4', 'opt3', 2),
(184, '<div>bulk que 4</div>', 'opt1', 'opt2', 'opt3', 'opt4', 'opt4', 2),
(185, '<div>bulk que apti</div>', 'opt1', 'opt2', 'opt3', 'opt4', 'opt4', 1),
(189, '<div>bulk que apti</div>', 'opt1', 'opt2', 'opt3', 'opt4', 'opt4', 1),
(193, '<div>bulk que apti</div>', 'opt1', 'opt2', 'opt3', 'opt4', 'opt4', 1),
(197, '<div>bulk que apti</div>', 'opt1', 'opt2', 'opt3', 'opt4', 'opt4', 1),
(201, '<div>bulk que apti</div>', 'opt1', 'opt2', 'opt3', 'opt4', 'opt4', 1),
(205, '<div>bulk que apti</div>', 'opt1', 'opt2', 'opt3', 'opt4', 'opt4', 1),
(206, '<div>bulk que 2</div>\n<pre>pgm</pre>', 'opt1', 'opt2', 'opt3', 'opt4', 'opt2', 1),
(207, '<div>bulk que 3</div>', 'opt1', 'opt2', 'opt3', 'opt4', 'opt3', 1),
(208, '<div>bulk que 4</div>', 'opt1', 'opt2', 'opt3', 'opt4', 'opt4', 1),
(209, '<div>bulk que apti</div>', 'opt1', 'opt2', 'opt3', 'opt4', 'opt4', 1);

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

--
-- Dumping data for table `smart_result_set`
--

INSERT INTO `smart_result_set` (`id`, `ans`, `date_f`, `s_time`, `e_time`, `exam_id`, `que_id`, `user_id`) VALUES
(1618, 'All of above', '2019-09-23', '15:44:53.000000', '15:45:00.000000', 43, 75, 192),
(1619, 'Garbage Value', '2019-09-23', '15:45:00.000000', '15:45:01.000000', 43, 28, 192),
(1620, '12', '2019-09-23', '15:45:01.000000', '15:45:03.000000', 43, 104, 192),
(1621, '800 liters', '2019-09-23', '15:45:04.000000', '15:45:05.000000', 43, 102, 192),
(1622, '48', '2019-09-23', '15:45:05.000000', '15:45:08.000000', 43, 106, 192),
(1623, 'null', '2019-09-23', '15:45:08.000000', '15:45:08.000000', 43, 56, 192),
(1624, 'null', '2019-09-23', '15:45:08.000000', '15:45:08.000000', 43, 52, 192),
(1625, 'null', '2019-09-23', '15:45:08.000000', '15:45:09.000000', 43, 36, 192),
(1626, 'null', '2019-09-23', '15:45:09.000000', '15:45:09.000000', 43, 50, 192),
(1627, 'null', '2019-09-23', '15:45:09.000000', '15:45:10.000000', 43, 70, 192),
(1628, 'null', '2019-09-23', '15:45:10.000000', '15:45:10.000000', 43, 34, 192),
(1629, 'null', '2019-09-23', '15:45:10.000000', '15:45:10.000000', 43, 78, 192),
(1630, 'null', '2019-09-23', '15:45:10.000000', '15:45:10.000000', 43, 41, 192),
(1631, 'After being driven to the museum, Professor Kumar was dropped at his hotel.', '2019-09-23', '15:45:10.000000', '15:45:12.000000', 43, 48, 192),
(1632, 'None of these', '2019-09-23', '15:45:12.000000', '15:45:13.000000', 43, 12, 192),
(1633, '10', '2019-09-23', '15:45:13.000000', '15:45:15.000000', 43, 99, 192),
(1634, 'Class D', '2019-09-23', '15:45:15.000000', '15:45:18.000000', 43, 65, 192),
(1636, '2 hours', '2019-09-23', '15:45:18.000000', '15:45:20.000000', 43, 9, 192),
(1637, 'go back', '2019-09-23', '15:45:20.000000', '15:45:22.000000', 43, 23, 192),
(1638, 'null', '2019-09-23', '15:45:22.000000', '16:04:53.000000', 43, 71, 192),
(1961, '7 1/7 min', '2019-11-08', '15:13:55.000000', '15:14:02.000000', 43, 100, 264),
(1962, '12 min', '2019-11-08', '15:14:02.000000', '15:14:04.000000', 43, 101, 264),
(1963, 'Modem', '2019-11-08', '15:14:04.000000', '15:14:05.000000', 43, 80, 264),
(1964, 'Physical, Datalink, Network, Transport', '2019-11-08', '15:14:05.000000', '15:14:19.000000', 43, 64, 264),
(1965, 'P is character type', '2019-11-08', '15:14:19.000000', '15:14:22.000000', 43, 36, 264),
(1966, 'null', '2019-11-08', '15:14:22.000000', '15:14:23.000000', 43, 42, 264),
(1967, 'null', '2019-11-08', '15:14:23.000000', '15:14:26.000000', 43, 32, 264),
(1968, 'null', '2019-11-08', '15:14:26.000000', '15:14:26.000000', 43, 59, 264),
(1993, 'P is a character constant', '2019-11-09', '12:13:52.000000', '12:13:54.000000', 43, 36, 273),
(1994, 'Network, Transport, Session, Presentation', '2019-11-09', '12:13:55.000000', '12:13:58.000000', 43, 64, 273),
(1995, 'Senility', '2019-11-09', '12:13:58.000000', '12:14:01.000000', 43, 59, 273),
(1996, 'on the eve of the examination', '2019-11-09', '12:14:01.000000', '12:14:03.000000', 43, 42, 273),
(1997, '10 min', '2019-11-09', '12:14:03.000000', '12:14:06.000000', 43, 101, 273),
(1998, 'use 3.14L', '2019-11-09', '12:14:06.000000', '12:14:08.000000', 43, 32, 273),
(1999, 'Switch', '2019-11-09', '12:14:08.000000', '12:14:11.000000', 43, 80, 273),
(2000, 'null', '2019-11-09', '12:14:11.000000', '12:14:12.000000', 43, 100, 273),
(2010, 'opt4', '2019-11-12', '13:08:04.000000', '13:08:06.000000', 64, 117, 279),
(2011, '!', '2019-11-12', '13:08:06.000000', '13:08:09.000000', 64, 30, 279),
(2012, 'printf(&quot;%f %Lf&quot;, a, b);', '2019-11-12', '13:08:09.000000', '13:08:11.000000', 64, 25, 279),
(2013, '12', '2019-11-12', '13:08:11.000000', '13:08:16.000000', 64, 104, 279),
(2014, 'opt4', '2019-11-12', '13:08:17.000000', '13:08:18.000000', 64, 129, 279),
(2015, '25', '2019-11-12', '13:08:18.000000', '13:08:20.000000', 64, 20, 279),
(2016, '800 liters', '2019-11-12', '13:08:20.000000', '13:08:21.000000', 64, 102, 279),
(2017, 'Address of the last element of array', '2019-11-12', '13:08:21.000000', '13:08:25.000000', 64, 38, 279),
(2018, '803', '2019-11-12', '13:08:25.000000', '13:08:28.000000', 64, 18, 279),
(2019, '25', '2019-11-12', '13:08:28.000000', '13:08:29.000000', 64, 87, 279),
(2020, '5/48', '2019-11-12', '13:08:29.000000', '13:08:34.000000', 64, 109, 279),
(2022, 'opt4', '2019-11-12', '13:08:36.000000', '13:08:38.000000', 64, 115, 279),
(2023, 'Depends on the standard', '2019-11-12', '13:08:38.000000', '13:08:40.000000', 64, 98, 279),
(2024, 'enum', '2019-11-12', '13:08:40.000000', '13:08:41.000000', 64, 31, 279),
(2025, '10', '2019-11-12', '13:08:41.000000', '13:08:42.000000', 64, 99, 279),
(2026, 'dos.h', '2019-11-12', '13:08:42.000000', '13:08:44.000000', 64, 37, 279),
(2027, '&#x27;c&#x27; means argument configuration &#x27;v&#x27; means argument visibility', '2019-11-12', '13:08:44.000000', '13:08:46.000000', 64, 35, 279),
(2028, 'use 3.14LF', '2019-11-12', '13:08:46.000000', '13:08:48.000000', 64, 32, 279),
(2029, '13/102', '2019-11-12', '13:08:48.000000', '13:08:49.000000', 64, 19, 279),
(2030, 'opt4', '2019-11-12', '13:08:50.000000', '13:08:51.000000', 64, 119, 279),
(2033, 'null', '2019-11-12', '13:09:10.000000', '13:09:10.000000', 64, 36, 279),
(2034, 'null', '2019-11-12', '13:09:10.000000', '13:09:10.000000', 64, 105, 279),
(2035, 'null', '2019-11-12', '13:09:10.000000', '13:09:11.000000', 64, 130, 279),
(2036, 'null', '2019-11-12', '13:09:11.000000', '13:09:11.000000', 64, 14, 279),
(2038, 'null', '2019-11-12', '13:09:11.000000', '13:09:11.000000', 64, 33, 279),
(2039, 'null', '2019-11-12', '13:09:11.000000', '13:09:11.000000', 64, 27, 279),
(2040, 'null', '2019-11-12', '13:09:11.000000', '13:09:11.000000', 64, 24, 279),
(2041, 'null', '2019-11-12', '13:09:11.000000', '13:09:11.000000', 64, 100, 279),
(2042, 'null', '2019-11-12', '13:09:11.000000', '13:09:12.000000', 64, 107, 279),
(2043, 'null', '2019-11-12', '13:09:12.000000', '13:09:12.000000', 64, 34, 279),
(2044, 'null', '2019-11-12', '13:09:12.000000', '13:09:12.000000', 64, 101, 279),
(2045, 'null', '2019-11-12', '13:09:12.000000', '13:09:12.000000', 64, 9, 279),
(2046, 'null', '2019-11-12', '13:09:12.000000', '13:09:12.000000', 64, 106, 279),
(2047, 'null', '2019-11-12', '13:09:13.000000', '13:09:13.000000', 64, 123, 279),
(2048, 'null', '2019-11-12', '13:09:13.000000', '13:09:13.000000', 64, 17, 279),
(2049, 'null', '2019-11-13', '17:01:17.000000', '17:01:21.000000', 44, 114, 283),
(2050, 'null', '2019-11-13', '17:01:21.000000', '17:01:22.000000', 44, 57, 283),
(2051, 'null', '2019-11-13', '17:01:22.000000', '17:01:22.000000', 44, 66, 283),
(2052, 'null', '2019-11-13', '17:01:22.000000', '17:01:23.000000', 44, 127, 283),
(2053, 'null', '2019-11-13', '17:01:23.000000', '17:01:23.000000', 44, 76, 283),
(2054, 'null', '2019-11-13', '17:01:23.000000', '17:01:23.000000', 44, 68, 283),
(2055, 'null', '2019-11-13', '17:01:23.000000', '17:01:24.000000', 44, 52, 283),
(2056, 'After she was driven Professor Kumar to the museum she had dropped him at his hotel.', '2019-11-13', '17:01:24.000000', '17:01:26.000000', 44, 48, 283),
(2057, 'Benefeted', '2019-11-13', '17:01:26.000000', '17:01:28.000000', 44, 43, 283),
(2058, 'Garbage Value', '2019-11-13', '17:01:28.000000', '17:01:30.000000', 44, 28, 283),
(2059, 'None of these', '2019-11-13', '17:01:30.000000', '17:01:31.000000', 44, 12, 283),
(2060, 'All of above', '2019-11-13', '17:01:31.000000', '17:01:33.000000', 44, 75, 283),
(2061, 'null', '2019-11-13', '17:01:33.000000', '00:00:00.000000', 44, 60, 283);

-- --------------------------------------------------------

--
-- Table structure for table `smart_selected_code_questions`
--

CREATE TABLE `smart_selected_code_questions` (
  `id` int(11) NOT NULL,
  `code_questions_id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `smart_selected_code_questions`
--

INSERT INTO `smart_selected_code_questions` (`id`, `code_questions_id`, `exam_id`) VALUES
(37, 30, 43),
(39, 31, 43),
(36, 32, 43),
(38, 33, 43),
(67, 30, 44),
(65, 31, 44),
(66, 32, 44),
(64, 33, 44),
(41, 30, 64),
(42, 32, 64),
(43, 33, 64);

-- --------------------------------------------------------

--
-- Table structure for table `smart_selected_questions`
--

CREATE TABLE `smart_selected_questions` (
  `id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `que_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `smart_selected_questions`
--

INSERT INTO `smart_selected_questions` (`id`, `exam_id`, `que_id`) VALUES
(1770, 43, 42),
(1769, 43, 59),
(1768, 43, 64),
(1767, 43, 80),
(2085, 44, 12),
(2107, 44, 22),
(2110, 44, 26),
(2109, 44, 28),
(2111, 44, 40),
(2143, 44, 41),
(2142, 44, 42),
(2157, 44, 43),
(2149, 44, 44),
(2151, 44, 45),
(2140, 44, 46),
(2139, 44, 47),
(2154, 44, 48),
(2148, 44, 49),
(2153, 44, 50),
(2150, 44, 51),
(2144, 44, 52),
(2152, 44, 54),
(2141, 44, 55),
(2155, 44, 56),
(2146, 44, 57),
(2147, 44, 58),
(2156, 44, 59),
(2145, 44, 60),
(2120, 44, 61),
(2132, 44, 62),
(2125, 44, 63),
(2129, 44, 64),
(2137, 44, 65),
(2127, 44, 66),
(2134, 44, 67),
(2131, 44, 68),
(2124, 44, 69),
(2135, 44, 70),
(2130, 44, 71),
(2121, 44, 72),
(2123, 44, 74),
(2136, 44, 75),
(2133, 44, 76),
(2126, 44, 77),
(2122, 44, 78),
(2138, 44, 79),
(2128, 44, 80),
(2119, 44, 96),
(2083, 44, 103),
(2116, 44, 113),
(2113, 44, 114),
(2105, 44, 116),
(2108, 44, 124),
(2118, 44, 127);

-- --------------------------------------------------------

--
-- Table structure for table `smart_users`
--

CREATE TABLE `smart_users` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `email` varchar(254) NOT NULL,
  `password` varchar(70) NOT NULL,
  `score` varchar(5) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `malpractices` int(11) NOT NULL,
  `email_sent_status` tinyint(1) NOT NULL,
  `feedback` int(11) NOT NULL,
  `coding_score` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `smart_users`
--

INSERT INTO `smart_users` (`id`, `name`, `email`, `password`, `score`, `exam_id`, `malpractices`, `email_sent_status`, `feedback`, `coding_score`) VALUES
(191, 'swagath', 'swagath.bhat@terralogic.com', 'wCuT2+YN0p/oFjv+lrScHg==', '-1', 43, 3, 1, 0, '-1'),
(192, 'prajwal', 'prajwal.bm@terralogic.com', 'sl0A2NXbHydxVsQUxEc5yQ==', '4/20', 43, 2, 1, 0, '-1'),
(264, 'raj', 'rajshekar.cs@terralogic.com', 'MqNyBMcMfJANuxYSxnPAlw==', '0', 43, 3, 1, 0, '-1'),
(273, 'Guruprasad BR', 'brguru90@gmail.com', '6RZYTuf/mjEHOJDaTcZXGg==', '3/8', 43, 0, 1, 5, '12/20'),
(279, 'raj', 'rajshekar821@gmail.com', 'tLlYNeo8SqV2VP1Ie+nC3w==', '3/40', 64, 0, 1, 5, '-1'),
(282, '', 'Saimanasa@terralogic.com', 'iLIpiaDhZKnOvVINozS8og==', '-1', 64, 0, 0, 0, '-1'),
(283, '', 'saimanasa.ps@terralogic.com', 'lLfGnqe+t4UL+LNwC8chlA==', '1/79', 44, 0, 1, 0, '-1');

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
-- Indexes for table `smart_admin_users`
--
ALTER TABLE `smart_admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `smart_categories`
--
ALTER TABLE `smart_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cat` (`cat`);

--
-- Indexes for table `smart_code_questions`
--
ALTER TABLE `smart_code_questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `smart_coding_result_set`
--
ALTER TABLE `smart_coding_result_set`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `smart_coding_result_set_code_questions_id_user_i_a6c8cb85_uniq` (`code_questions_id`,`user_id`,`exam_id`),
  ADD KEY `smart_coding_result_set_user_id_e8aa5368_fk_smart_users_id` (`user_id`),
  ADD KEY `smart_coding_result__code_questions_id_4bd7da04_fk_smart_cod` (`code_questions_id`),
  ADD KEY `smart_coding_result_set_exam_id_a17f79a5_fk_smart_exam_id` (`exam_id`);

--
-- Indexes for table `smart_email_status`
--
ALTER TABLE `smart_email_status`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `smart_selected_code_questions`
--
ALTER TABLE `smart_selected_code_questions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `smart_selected_code_questions_exam_id_code_set_id_9706c636_uniq` (`exam_id`,`code_questions_id`),
  ADD KEY `smart_selected_code__code_questions_id_b058bbe2_fk_smart_cod` (`code_questions_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `smart_admin_users`
--
ALTER TABLE `smart_admin_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `smart_categories`
--
ALTER TABLE `smart_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `smart_code_questions`
--
ALTER TABLE `smart_code_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;
--
-- AUTO_INCREMENT for table `smart_coding_result_set`
--
ALTER TABLE `smart_coding_result_set`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=160;
--
-- AUTO_INCREMENT for table `smart_email_status`
--
ALTER TABLE `smart_email_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;
--
-- AUTO_INCREMENT for table `smart_exam`
--
ALTER TABLE `smart_exam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;
--
-- AUTO_INCREMENT for table `smart_questions`
--
ALTER TABLE `smart_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=210;
--
-- AUTO_INCREMENT for table `smart_result_set`
--
ALTER TABLE `smart_result_set`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2062;
--
-- AUTO_INCREMENT for table `smart_selected_code_questions`
--
ALTER TABLE `smart_selected_code_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;
--
-- AUTO_INCREMENT for table `smart_selected_questions`
--
ALTER TABLE `smart_selected_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2210;
--
-- AUTO_INCREMENT for table `smart_users`
--
ALTER TABLE `smart_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=287;
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
-- Constraints for table `smart_coding_result_set`
--
ALTER TABLE `smart_coding_result_set`
  ADD CONSTRAINT `smart_coding_result__code_questions_id_4bd7da04_fk_smart_cod` FOREIGN KEY (`code_questions_id`) REFERENCES `smart_code_questions` (`id`),
  ADD CONSTRAINT `smart_coding_result_set_exam_id_a17f79a5_fk_smart_exam_id` FOREIGN KEY (`exam_id`) REFERENCES `smart_exam` (`id`),
  ADD CONSTRAINT `smart_coding_result_set_user_id_e8aa5368_fk_smart_users_id` FOREIGN KEY (`user_id`) REFERENCES `smart_users` (`id`);

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
-- Constraints for table `smart_selected_code_questions`
--
ALTER TABLE `smart_selected_code_questions`
  ADD CONSTRAINT `smart_selected_code__code_questions_id_b058bbe2_fk_smart_cod` FOREIGN KEY (`code_questions_id`) REFERENCES `smart_code_questions` (`id`),
  ADD CONSTRAINT `smart_selected_code_questions_exam_id_8b907aa1_fk_smart_exam_id` FOREIGN KEY (`exam_id`) REFERENCES `smart_exam` (`id`);

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
