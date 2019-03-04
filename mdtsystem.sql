/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- --------------------------------------------------------

--
-- Table structure for table `mdt_logs`
--

CREATE TABLE `mdt_logs` (
  `logid` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `user` mediumtext NOT NULL,
  `content` mediumtext NOT NULL,
  `category` mediumtext NOT NULL,
  `dateline` bigint(20) NOT NULL,
  `visible` int(1) NOT NULL DEFAULT '1' COMMENT '1 = Visible, 0 = Hidden'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mdt_sessions`
--

CREATE TABLE `mdt_sessions` (
  `id` mediumint(9) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `session_id` mediumtext NOT NULL,
  `user_id` mediumint(9) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `timestamp` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mdt_units`
--

CREATE TABLE `mdt_units` (
  `unitid` mediumint(9) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `unit` mediumtext NOT NULL,
  `callid` mediumint(9) NOT NULL,
  `status` mediumtext NOT NULL,
  `collar` mediumtext NOT NULL,
  `steamid` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mdt_messages`
--

CREATE TABLE `mdt_messages` (
  `messageid` mediumint(9) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `recive` mediumtext NOT NULL,
  `post` mediumtext NOT NULL,
  `content` mediumtext NOT NULL,
  `dateline` bigint(20) NOT NULL,
  `visible` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mdt_calls`
--

CREATE TABLE `mdt_calls` (
  `callid` mediumint(9) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `type` mediumtext NOT NULL,
  `location` mediumtext NOT NULL,
  `description` mediumtext NOT NULL,
  `police_grade` mediumtext NOT NULL,
  `rmu_grade` mediumtext NOT NULL,
  `channel` mediumtext NOT NULL,
  `caller` mediumint(9) NOT NULL,
  `status` mediumint(9) NOT NULL,
  `dateline` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mdt_users`
--

CREATE TABLE `mdt_users` (
  `userid` mediumint(9) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `first_name` text NOT NULL,
  `surname` mediumtext NOT NULL,
  `email` mediumtext NOT NULL,
  `steamid` longtext NOT NULL,
  `password` mediumtext NOT NULL,
  `collar` mediumtext NOT NULL,
  `groups` mediumtext NOT NULL,
  `joindate` bigint(20) NOT NULL,
  `theme` int(11) NOT NULL DEFAULT '1',
  `last_ip` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mdt_users`
--

INSERT INTO `mdt_users` (`userid`, `first_name`, `surname`, `email`, `steamid`, `password`, `collar`, `groups`, `joindate`, `theme`, `last_ip`) VALUES
(1, 'Change', 'Me', 'Changeme@gmail.com', '', '$2y$10$.WY4s9XEo1e3Kzpva9GHBu5WYvbm14FNZhdexA9X1VN4plDcRhyke', '1234', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,', 1530222515, 2, '24.165.178.147');

-- --------------------------------------------------------

--
-- Table structure for table `mdt_pois`
--

CREATE TABLE `mdt_pois` (
  `id` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `civ_id` bigint(20) NOT NULL,
  `image` mediumtext NOT NULL,
  `reason` mediumtext NOT NULL,
  `notes` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mdt_reports`
--

CREATE TABLE `mdt_reports` (
  `id` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `user` bigint(20) NOT NULL,
  `incident` mediumtext NOT NULL,
  `cad` mediumtext NOT NULL,
  `located` mediumtext NOT NULL,
  `otherUnits` mediumtext NOT NULL,
  `arrested` mediumtext NOT NULL,
  `person` mediumtext NOT NULL,
  `arrestedFor` mediumtext NOT NULL,
  `foundItems` mediumtext NOT NULL,
  `whatHappened` longtext NOT NULL,
  `dateline` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mdt_usergroups`
--

CREATE TABLE `mdt_usergroups` (
  `id` mediumint(9) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `name` mediumtext NOT NULL,
  `perms` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usergroups`
--

INSERT INTO `mdt_usergroups` (`id`, `name`, `perms`) VALUES
(1, 'Registered User', 1),
(2, 'Community Member', 17),
(3, 'Trooper', 211),
(4, 'Corporal', 209),
(5, 'Sergeant', 241),
(6, 'Lieutenant', 8959),
(7, 'Captain', 25343),
(8, 'Chief', 27647),
(9, 'Moderator', 60159),
(10, 'Field Training Officer', 255),
(11, 'Dispatcher', 59647),
(12, 'Director', 64255),
(13, 'Administrator', 64511),
(14, 'Website Administrator', 16383);

-- --------------------------------------------------------

--
-- Table structure for table `user_perms`
--

CREATE TABLE `mdt_user_perms` (
  `perm` bigint(20) NOT NULL,
  `name` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `mdt_user_perms`
--

INSERT INTO `mdt_user_perms` (`perm`, `name`) VALUES
(1, 'Is A Registered Member[Do not uncheck this or will break usergroups!]'),
(2, 'Can Access Call Overview Page'),
(4, 'Can Access Assign Calls Page [Must have \"Can Access Call Overview Page\" Enabled]'),
(8, 'Can Access Dismiss Calls Page [Must have \"Can Access Call Overview Page\" Enabled]'),
(16, 'Can Access Civilian Area'),
(32, 'Can Access BOLO Area'),
(64, 'Can Access Reports Area'),
(128, 'Can Access CAD Area'),
(256, 'Can Access Admin Area'),
(512, 'Is a Command Member'),
(2048, 'Can End Shifts'),
(4096, 'Can Ban mdt_users'),
(8192, 'Can View Reports'),
(16384, 'Can view Form Responses'),
(32768, 'Can create & Delete events');

-- --------------------------------------------------------

--
-- Table structure for table `vois`
--

CREATE TABLE `mdt_vois` (
  `id` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `vehicle_id` bigint(20) NOT NULL,
  `image` mediumtext NOT NULL,
  `reason` mediumtext NOT NULL,
  `notes` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
