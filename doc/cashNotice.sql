/*
Navicat MySQL Data Transfer

Source Server         : 卡券
Source Server Version : 50548
Source Host           : 47.106.110.63:3306
Source Database       : cashNotice

Target Server Type    : MYSQL
Target Server Version : 50548
File Encoding         : 65001

Date: 2018-08-24 09:30:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE `admin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_menu
-- ----------------------------
INSERT INTO `admin_menu` VALUES ('1', '0', '1', '首页', 'fa-bar-chart', '/', null, '2018-08-22 04:10:56');
INSERT INTO `admin_menu` VALUES ('2', '0', '2', '管理员', 'fa-tasks', null, null, '2018-08-22 04:11:11');
INSERT INTO `admin_menu` VALUES ('3', '2', '3', '管理员', 'fa-users', 'auth/users', null, '2018-08-22 14:31:10');
INSERT INTO `admin_menu` VALUES ('4', '2', '4', '角色', 'fa-user', 'auth/roles', null, '2018-08-22 04:13:03');
INSERT INTO `admin_menu` VALUES ('5', '2', '5', '权限', 'fa-ban', 'auth/permissions', null, '2018-08-22 04:13:12');
INSERT INTO `admin_menu` VALUES ('6', '2', '6', '菜单', 'fa-bars', 'auth/menu', null, '2018-08-22 04:13:21');
INSERT INTO `admin_menu` VALUES ('7', '2', '7', '操作日志', 'fa-history', 'auth/logs', null, '2018-08-22 04:13:33');
INSERT INTO `admin_menu` VALUES ('8', '2', '0', '员工管理', 'fa-user-md', 'employee', '2018-08-22 14:38:47', '2018-08-22 14:41:42');
INSERT INTO `admin_menu` VALUES ('9', '2', '0', '工资邮件发送', 'fa-envelope', '/cash', '2018-08-23 11:26:00', '2018-08-23 11:26:28');
INSERT INTO `admin_menu` VALUES ('10', '0', '8', '上传文件管理', 'fa-file', 'media', '2018-08-23 14:36:33', '2018-08-23 14:37:11');

-- ----------------------------
-- Table structure for admin_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `admin_operation_log`;
CREATE TABLE `admin_operation_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_operation_log_user_id_index` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_operation_log
-- ----------------------------

-- ----------------------------
-- Table structure for admin_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_permissions`;
CREATE TABLE `admin_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_permissions_name_unique` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_permissions
-- ----------------------------
INSERT INTO `admin_permissions` VALUES ('1', 'All permission', '*', '', '*', null, null);
INSERT INTO `admin_permissions` VALUES ('2', 'Dashboard', 'dashboard', 'GET', '/', null, null);
INSERT INTO `admin_permissions` VALUES ('3', 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', null, null);
INSERT INTO `admin_permissions` VALUES ('4', 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', null, null);
INSERT INTO `admin_permissions` VALUES ('5', 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', null, null);
INSERT INTO `admin_permissions` VALUES ('6', 'Media manager', 'ext.media-manager', null, '/media*', '2018-08-23 14:36:33', '2018-08-23 14:36:33');

-- ----------------------------
-- Table structure for admin_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_menu`;
CREATE TABLE `admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_role_menu
-- ----------------------------
INSERT INTO `admin_role_menu` VALUES ('1', '2', null, null);

-- ----------------------------
-- Table structure for admin_role_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_permissions`;
CREATE TABLE `admin_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_role_permissions
-- ----------------------------
INSERT INTO `admin_role_permissions` VALUES ('1', '1', null, null);

-- ----------------------------
-- Table structure for admin_role_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_users`;
CREATE TABLE `admin_role_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_role_users
-- ----------------------------
INSERT INTO `admin_role_users` VALUES ('1', '1', null, null);

-- ----------------------------
-- Table structure for admin_roles
-- ----------------------------
DROP TABLE IF EXISTS `admin_roles`;
CREATE TABLE `admin_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_roles_name_unique` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_roles
-- ----------------------------
INSERT INTO `admin_roles` VALUES ('1', 'Administrator', 'administrator', '2018-08-22 03:45:52', '2018-08-22 03:45:52');

-- ----------------------------
-- Table structure for admin_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_user_permissions`;
CREATE TABLE `admin_user_permissions` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for admin_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE `admin_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_username_unique` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_users
-- ----------------------------
INSERT INTO `admin_users` VALUES ('1', 'admin', '$2y$10$vLohRGK5ovumlalhsTSlz.xcpv5ALET9r3LA8KZEuv6zfnTIjbuES', 'admin', null, 'vejs1ntAb9aNyBsDHRfFiiBH9xkumxGXenXdFM4P0KX4ycedUFiY3XhVsK2r', '2018-08-22 03:45:52', '2018-08-22 04:17:45');

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------
INSERT INTO `failed_jobs` VALUES ('1', 'beanstalkd', 'SendEmail', '{\"displayName\":\"App\\\\Jobs\\\\SendEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendEmail\",\"command\":\"O:18:\\\"App\\\\Jobs\\\\SendEmail\\\":8:{s:7:\\\"\\u0000*\\u0000file\\\";s:56:\\\"\\/www\\/CashNotice\\/public\\/uploads\\/excel\\/20180823170831.xlsx\\\";s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";s:9:\\\"SendEmail\\\";s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\"}}', 'Swift_TransportException: Connection could not be established with host smtp.mxhichina.com [Connection timed out #110] in /www/CashNotice/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/StreamBuffer.php:269\nStack trace:\n#0 /www/CashNotice/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/StreamBuffer.php(58): Swift_Transport_StreamBuffer->establishSocketConnection()\n#1 /www/CashNotice/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/AbstractSmtpTransport.php(143): Swift_Transport_StreamBuffer->initialize(Array)\n#2 /www/CashNotice/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Mailer.php(64): Swift_Transport_AbstractSmtpTransport->start()\n#3 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(451): Swift_Mailer->send(Object(Swift_Message), Array)\n#4 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(235): Illuminate\\Mail\\Mailer->sendSwiftMessage(Object(Swift_Message))\n#5 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Support/Facades/Facade.php(221): Illuminate\\Mail\\Mailer->send(\'email.reminder\', Array, Object(Closure))\n#6 /www/CashNotice/app/Jobs/SendEmail.php(59): Illuminate\\Support\\Facades\\Facade::__callStatic(\'send\', Array)\n#7 [internal function]: App\\Jobs\\SendEmail->App\\Jobs\\{closure}(Object(PHPExcel_Worksheet))\n#8 /www/CashNotice/vendor/maatwebsite/excel/src/Maatwebsite/Excel/Excel.php(123): call_user_func(Object(Closure), Object(Maatwebsite\\Excel\\Readers\\LaravelExcelReader))\n#9 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Support/Facades/Facade.php(221): Maatwebsite\\Excel\\Excel->load(\'/www/CashNotice...\', Object(Closure))\n#10 /www/CashNotice/app/Jobs/SendEmail.php(63): Illuminate\\Support\\Facades\\Facade::__callStatic(\'load\', Array)\n#11 [internal function]: App\\Jobs\\SendEmail->handle()\n#12 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(29): call_user_func_array(Array, Array)\n#13 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(87): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#14 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(31): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#15 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Container/Container.php(549): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#16 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(94): Illuminate\\Container\\Container->call(Array)\n#17 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(114): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\SendEmail))\n#18 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendEmail))\n#19 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(98): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#20 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(49): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\SendEmail), false)\n#21 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(76): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\BeanstalkdJob), Array)\n#22 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(320): Illuminate\\Queue\\Jobs\\Job->fire()\n#23 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(270): Illuminate\\Queue\\Worker->process(\'beanstalkd\', Object(Illuminate\\Queue\\Jobs\\BeanstalkdJob), Object(Illuminate\\Queue\\WorkerOptions))\n#24 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(114): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\BeanstalkdJob), \'beanstalkd\', Object(Illuminate\\Queue\\WorkerOptions))\n#25 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(101): Illuminate\\Queue\\Worker->daemon(\'beanstalkd\', \'SendEmail\', Object(Illuminate\\Queue\\WorkerOptions))\n#26 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(85): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'beanstalkd\', \'SendEmail\')\n#27 [internal function]: Illuminate\\Queue\\Console\\WorkCommand->handle()\n#28 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(29): call_user_func_array(Array, Array)\n#29 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(87): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#30 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(31): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#31 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Container/Container.php(549): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#32 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Console/Command.php(183): Illuminate\\Container\\Container->call(Array)\n#33 /www/CashNotice/vendor/symfony/console/Command/Command.php(251): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#34 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Console/Command.php(170): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#35 /www/CashNotice/vendor/symfony/console/Application.php(946): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#36 /www/CashNotice/vendor/symfony/console/Application.php(248): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#37 /www/CashNotice/vendor/symfony/console/Application.php(148): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#38 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Console/Application.php(88): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#39 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(121): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#40 /www/CashNotice/artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#41 {main}', '2018-08-23 17:10:01');
INSERT INTO `failed_jobs` VALUES ('2', 'beanstalkd', 'SendEmail', '{\"displayName\":\"App\\\\Jobs\\\\SendEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendEmail\",\"command\":\"O:18:\\\"App\\\\Jobs\\\\SendEmail\\\":8:{s:7:\\\"\\u0000*\\u0000file\\\";s:56:\\\"\\/www\\/CashNotice\\/public\\/uploads\\/excel\\/20180823171208.xlsx\\\";s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";s:9:\\\"SendEmail\\\";s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\"}}', 'Swift_TransportException: Connection could not be established with host smtp.mxhichina.com [Connection timed out #110] in /www/CashNotice/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/StreamBuffer.php:269\nStack trace:\n#0 /www/CashNotice/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/StreamBuffer.php(58): Swift_Transport_StreamBuffer->establishSocketConnection()\n#1 /www/CashNotice/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/AbstractSmtpTransport.php(143): Swift_Transport_StreamBuffer->initialize(Array)\n#2 /www/CashNotice/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Mailer.php(64): Swift_Transport_AbstractSmtpTransport->start()\n#3 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(451): Swift_Mailer->send(Object(Swift_Message), Array)\n#4 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(235): Illuminate\\Mail\\Mailer->sendSwiftMessage(Object(Swift_Message))\n#5 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Support/Facades/Facade.php(221): Illuminate\\Mail\\Mailer->send(\'email.reminder\', Array, Object(Closure))\n#6 /www/CashNotice/app/Jobs/SendEmail.php(59): Illuminate\\Support\\Facades\\Facade::__callStatic(\'send\', Array)\n#7 [internal function]: App\\Jobs\\SendEmail->App\\Jobs\\{closure}(Object(PHPExcel_Worksheet))\n#8 /www/CashNotice/vendor/maatwebsite/excel/src/Maatwebsite/Excel/Excel.php(123): call_user_func(Object(Closure), Object(Maatwebsite\\Excel\\Readers\\LaravelExcelReader))\n#9 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Support/Facades/Facade.php(221): Maatwebsite\\Excel\\Excel->load(\'/www/CashNotice...\', Object(Closure))\n#10 /www/CashNotice/app/Jobs/SendEmail.php(63): Illuminate\\Support\\Facades\\Facade::__callStatic(\'load\', Array)\n#11 [internal function]: App\\Jobs\\SendEmail->handle()\n#12 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(29): call_user_func_array(Array, Array)\n#13 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(87): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#14 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(31): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#15 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Container/Container.php(549): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#16 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(94): Illuminate\\Container\\Container->call(Array)\n#17 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(114): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\SendEmail))\n#18 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendEmail))\n#19 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(98): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#20 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(49): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\SendEmail), false)\n#21 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(76): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\BeanstalkdJob), Array)\n#22 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(320): Illuminate\\Queue\\Jobs\\Job->fire()\n#23 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(270): Illuminate\\Queue\\Worker->process(\'beanstalkd\', Object(Illuminate\\Queue\\Jobs\\BeanstalkdJob), Object(Illuminate\\Queue\\WorkerOptions))\n#24 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(114): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\BeanstalkdJob), \'beanstalkd\', Object(Illuminate\\Queue\\WorkerOptions))\n#25 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(101): Illuminate\\Queue\\Worker->daemon(\'beanstalkd\', \'SendEmail\', Object(Illuminate\\Queue\\WorkerOptions))\n#26 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(85): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'beanstalkd\', \'SendEmail\')\n#27 [internal function]: Illuminate\\Queue\\Console\\WorkCommand->handle()\n#28 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(29): call_user_func_array(Array, Array)\n#29 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(87): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#30 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(31): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#31 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Container/Container.php(549): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#32 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Console/Command.php(183): Illuminate\\Container\\Container->call(Array)\n#33 /www/CashNotice/vendor/symfony/console/Command/Command.php(251): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#34 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Console/Command.php(170): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#35 /www/CashNotice/vendor/symfony/console/Application.php(946): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#36 /www/CashNotice/vendor/symfony/console/Application.php(248): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#37 /www/CashNotice/vendor/symfony/console/Application.php(148): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#38 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Console/Application.php(88): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#39 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(121): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#40 /www/CashNotice/artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#41 {main}', '2018-08-23 17:13:39');
INSERT INTO `failed_jobs` VALUES ('3', 'beanstalkd', 'SendEmail', '{\"displayName\":\"App\\\\Jobs\\\\SendEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendEmail\",\"command\":\"O:18:\\\"App\\\\Jobs\\\\SendEmail\\\":8:{s:7:\\\"\\u0000*\\u0000file\\\";s:56:\\\"\\/www\\/CashNotice\\/public\\/uploads\\/excel\\/20180823171454.xlsx\\\";s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";s:9:\\\"SendEmail\\\";s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\"}}', 'Swift_TransportException: Connection could not be established with host smtp.mxhichina.com [Connection timed out #110] in /www/CashNotice/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/StreamBuffer.php:269\nStack trace:\n#0 /www/CashNotice/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/StreamBuffer.php(58): Swift_Transport_StreamBuffer->establishSocketConnection()\n#1 /www/CashNotice/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/AbstractSmtpTransport.php(143): Swift_Transport_StreamBuffer->initialize(Array)\n#2 /www/CashNotice/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Mailer.php(64): Swift_Transport_AbstractSmtpTransport->start()\n#3 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(451): Swift_Mailer->send(Object(Swift_Message), Array)\n#4 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(235): Illuminate\\Mail\\Mailer->sendSwiftMessage(Object(Swift_Message))\n#5 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Support/Facades/Facade.php(221): Illuminate\\Mail\\Mailer->send(\'email.reminder\', Array, Object(Closure))\n#6 /www/CashNotice/app/Jobs/SendEmail.php(59): Illuminate\\Support\\Facades\\Facade::__callStatic(\'send\', Array)\n#7 [internal function]: App\\Jobs\\SendEmail->App\\Jobs\\{closure}(Object(PHPExcel_Worksheet))\n#8 /www/CashNotice/vendor/maatwebsite/excel/src/Maatwebsite/Excel/Excel.php(123): call_user_func(Object(Closure), Object(Maatwebsite\\Excel\\Readers\\LaravelExcelReader))\n#9 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Support/Facades/Facade.php(221): Maatwebsite\\Excel\\Excel->load(\'/www/CashNotice...\', Object(Closure))\n#10 /www/CashNotice/app/Jobs/SendEmail.php(63): Illuminate\\Support\\Facades\\Facade::__callStatic(\'load\', Array)\n#11 [internal function]: App\\Jobs\\SendEmail->handle()\n#12 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(29): call_user_func_array(Array, Array)\n#13 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(87): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#14 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(31): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#15 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Container/Container.php(549): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#16 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(94): Illuminate\\Container\\Container->call(Array)\n#17 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(114): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\SendEmail))\n#18 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendEmail))\n#19 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(98): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#20 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(49): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\SendEmail), false)\n#21 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(76): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\BeanstalkdJob), Array)\n#22 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(320): Illuminate\\Queue\\Jobs\\Job->fire()\n#23 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(270): Illuminate\\Queue\\Worker->process(\'beanstalkd\', Object(Illuminate\\Queue\\Jobs\\BeanstalkdJob), Object(Illuminate\\Queue\\WorkerOptions))\n#24 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(114): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\BeanstalkdJob), \'beanstalkd\', Object(Illuminate\\Queue\\WorkerOptions))\n#25 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(101): Illuminate\\Queue\\Worker->daemon(\'beanstalkd\', \'SendEmail\', Object(Illuminate\\Queue\\WorkerOptions))\n#26 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(85): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'beanstalkd\', \'SendEmail\')\n#27 [internal function]: Illuminate\\Queue\\Console\\WorkCommand->handle()\n#28 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(29): call_user_func_array(Array, Array)\n#29 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(87): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#30 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(31): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#31 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Container/Container.php(549): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#32 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Console/Command.php(183): Illuminate\\Container\\Container->call(Array)\n#33 /www/CashNotice/vendor/symfony/console/Command/Command.php(251): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#34 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Console/Command.php(170): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#35 /www/CashNotice/vendor/symfony/console/Application.php(946): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#36 /www/CashNotice/vendor/symfony/console/Application.php(248): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#37 /www/CashNotice/vendor/symfony/console/Application.php(148): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#38 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Console/Application.php(88): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#39 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(121): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#40 /www/CashNotice/artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#41 {main}', '2018-08-23 17:16:24');
INSERT INTO `failed_jobs` VALUES ('4', 'beanstalkd', 'SendEmail', '{\"displayName\":\"App\\\\Jobs\\\\SendEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendEmail\",\"command\":\"O:18:\\\"App\\\\Jobs\\\\SendEmail\\\":8:{s:7:\\\"\\u0000*\\u0000file\\\";s:56:\\\"\\/www\\/CashNotice\\/public\\/uploads\\/excel\\/20180823175004.xlsx\\\";s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";s:9:\\\"SendEmail\\\";s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\"}}', 'Swift_TransportException: Connection could not be established with host smtp.mxhichina.com [Connection timed out #110] in /www/CashNotice/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/StreamBuffer.php:269\nStack trace:\n#0 /www/CashNotice/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/StreamBuffer.php(58): Swift_Transport_StreamBuffer->establishSocketConnection()\n#1 /www/CashNotice/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/AbstractSmtpTransport.php(143): Swift_Transport_StreamBuffer->initialize(Array)\n#2 /www/CashNotice/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Mailer.php(64): Swift_Transport_AbstractSmtpTransport->start()\n#3 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(451): Swift_Mailer->send(Object(Swift_Message), Array)\n#4 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(235): Illuminate\\Mail\\Mailer->sendSwiftMessage(Object(Swift_Message))\n#5 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Support/Facades/Facade.php(221): Illuminate\\Mail\\Mailer->send(\'email.reminder\', Array, Object(Closure))\n#6 /www/CashNotice/app/Jobs/SendEmail.php(59): Illuminate\\Support\\Facades\\Facade::__callStatic(\'send\', Array)\n#7 [internal function]: App\\Jobs\\SendEmail->App\\Jobs\\{closure}(Object(PHPExcel_Worksheet))\n#8 /www/CashNotice/vendor/maatwebsite/excel/src/Maatwebsite/Excel/Excel.php(123): call_user_func(Object(Closure), Object(Maatwebsite\\Excel\\Readers\\LaravelExcelReader))\n#9 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Support/Facades/Facade.php(221): Maatwebsite\\Excel\\Excel->load(\'/www/CashNotice...\', Object(Closure))\n#10 /www/CashNotice/app/Jobs/SendEmail.php(63): Illuminate\\Support\\Facades\\Facade::__callStatic(\'load\', Array)\n#11 [internal function]: App\\Jobs\\SendEmail->handle()\n#12 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(29): call_user_func_array(Array, Array)\n#13 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(87): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#14 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(31): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#15 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Container/Container.php(549): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#16 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(94): Illuminate\\Container\\Container->call(Array)\n#17 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(114): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\SendEmail))\n#18 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendEmail))\n#19 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(98): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#20 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(49): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\SendEmail), false)\n#21 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(76): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\BeanstalkdJob), Array)\n#22 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(320): Illuminate\\Queue\\Jobs\\Job->fire()\n#23 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(270): Illuminate\\Queue\\Worker->process(\'beanstalkd\', Object(Illuminate\\Queue\\Jobs\\BeanstalkdJob), Object(Illuminate\\Queue\\WorkerOptions))\n#24 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(114): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\BeanstalkdJob), \'beanstalkd\', Object(Illuminate\\Queue\\WorkerOptions))\n#25 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(101): Illuminate\\Queue\\Worker->daemon(\'beanstalkd\', \'SendEmail\', Object(Illuminate\\Queue\\WorkerOptions))\n#26 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(85): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'beanstalkd\', \'SendEmail\')\n#27 [internal function]: Illuminate\\Queue\\Console\\WorkCommand->handle()\n#28 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(29): call_user_func_array(Array, Array)\n#29 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(87): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#30 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(31): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#31 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Container/Container.php(549): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#32 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Console/Command.php(183): Illuminate\\Container\\Container->call(Array)\n#33 /www/CashNotice/vendor/symfony/console/Command/Command.php(251): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#34 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Console/Command.php(170): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#35 /www/CashNotice/vendor/symfony/console/Application.php(946): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#36 /www/CashNotice/vendor/symfony/console/Application.php(248): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#37 /www/CashNotice/vendor/symfony/console/Application.php(148): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#38 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Console/Application.php(88): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#39 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(121): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#40 /www/CashNotice/artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#41 {main}', '2018-08-23 17:51:35');
INSERT INTO `failed_jobs` VALUES ('5', 'beanstalkd', 'SendEmail', '{\"displayName\":\"App\\\\Jobs\\\\SendEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendEmail\",\"command\":\"O:18:\\\"App\\\\Jobs\\\\SendEmail\\\":8:{s:7:\\\"\\u0000*\\u0000file\\\";s:56:\\\"\\/www\\/CashNotice\\/public\\/uploads\\/excel\\/20180823175157.xlsx\\\";s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";s:9:\\\"SendEmail\\\";s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\"}}', 'Swift_TransportException: Connection could not be established with host smtp.mxhichina.com [Connection timed out #110] in /www/CashNotice/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/StreamBuffer.php:269\nStack trace:\n#0 /www/CashNotice/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/StreamBuffer.php(58): Swift_Transport_StreamBuffer->establishSocketConnection()\n#1 /www/CashNotice/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/AbstractSmtpTransport.php(143): Swift_Transport_StreamBuffer->initialize(Array)\n#2 /www/CashNotice/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Mailer.php(64): Swift_Transport_AbstractSmtpTransport->start()\n#3 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(451): Swift_Mailer->send(Object(Swift_Message), Array)\n#4 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(235): Illuminate\\Mail\\Mailer->sendSwiftMessage(Object(Swift_Message))\n#5 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Support/Facades/Facade.php(221): Illuminate\\Mail\\Mailer->send(\'email.reminder\', Array, Object(Closure))\n#6 /www/CashNotice/app/Jobs/SendEmail.php(59): Illuminate\\Support\\Facades\\Facade::__callStatic(\'send\', Array)\n#7 [internal function]: App\\Jobs\\SendEmail->App\\Jobs\\{closure}(Object(PHPExcel_Worksheet))\n#8 /www/CashNotice/vendor/maatwebsite/excel/src/Maatwebsite/Excel/Excel.php(123): call_user_func(Object(Closure), Object(Maatwebsite\\Excel\\Readers\\LaravelExcelReader))\n#9 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Support/Facades/Facade.php(221): Maatwebsite\\Excel\\Excel->load(\'/www/CashNotice...\', Object(Closure))\n#10 /www/CashNotice/app/Jobs/SendEmail.php(63): Illuminate\\Support\\Facades\\Facade::__callStatic(\'load\', Array)\n#11 [internal function]: App\\Jobs\\SendEmail->handle()\n#12 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(29): call_user_func_array(Array, Array)\n#13 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(87): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#14 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(31): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#15 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Container/Container.php(549): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#16 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(94): Illuminate\\Container\\Container->call(Array)\n#17 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(114): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\SendEmail))\n#18 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendEmail))\n#19 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(98): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#20 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(49): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\SendEmail), false)\n#21 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(76): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\BeanstalkdJob), Array)\n#22 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(320): Illuminate\\Queue\\Jobs\\Job->fire()\n#23 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(270): Illuminate\\Queue\\Worker->process(\'beanstalkd\', Object(Illuminate\\Queue\\Jobs\\BeanstalkdJob), Object(Illuminate\\Queue\\WorkerOptions))\n#24 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(114): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\BeanstalkdJob), \'beanstalkd\', Object(Illuminate\\Queue\\WorkerOptions))\n#25 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(101): Illuminate\\Queue\\Worker->daemon(\'beanstalkd\', \'SendEmail\', Object(Illuminate\\Queue\\WorkerOptions))\n#26 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(85): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'beanstalkd\', \'SendEmail\')\n#27 [internal function]: Illuminate\\Queue\\Console\\WorkCommand->handle()\n#28 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(29): call_user_func_array(Array, Array)\n#29 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(87): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#30 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(31): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#31 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Container/Container.php(549): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#32 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Console/Command.php(183): Illuminate\\Container\\Container->call(Array)\n#33 /www/CashNotice/vendor/symfony/console/Command/Command.php(251): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#34 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Console/Command.php(170): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#35 /www/CashNotice/vendor/symfony/console/Application.php(946): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#36 /www/CashNotice/vendor/symfony/console/Application.php(248): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#37 /www/CashNotice/vendor/symfony/console/Application.php(148): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#38 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Console/Application.php(88): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#39 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(121): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#40 /www/CashNotice/artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#41 {main}', '2018-08-23 17:53:28');
INSERT INTO `failed_jobs` VALUES ('6', 'beanstalkd', 'SendEmail', '{\"displayName\":\"App\\\\Jobs\\\\SendEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendEmail\",\"command\":\"O:18:\\\"App\\\\Jobs\\\\SendEmail\\\":8:{s:7:\\\"\\u0000*\\u0000file\\\";s:56:\\\"\\/www\\/CashNotice\\/public\\/uploads\\/excel\\/20180823175535.xlsx\\\";s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";s:9:\\\"SendEmail\\\";s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\"}}', 'Swift_TransportException: Connection could not be established with host smtp.mxhichina.com [Connection timed out #110] in /www/CashNotice/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/StreamBuffer.php:269\nStack trace:\n#0 /www/CashNotice/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/StreamBuffer.php(58): Swift_Transport_StreamBuffer->establishSocketConnection()\n#1 /www/CashNotice/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/AbstractSmtpTransport.php(143): Swift_Transport_StreamBuffer->initialize(Array)\n#2 /www/CashNotice/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Mailer.php(64): Swift_Transport_AbstractSmtpTransport->start()\n#3 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(451): Swift_Mailer->send(Object(Swift_Message), Array)\n#4 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(235): Illuminate\\Mail\\Mailer->sendSwiftMessage(Object(Swift_Message))\n#5 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Support/Facades/Facade.php(221): Illuminate\\Mail\\Mailer->send(\'email.reminder\', Array, Object(Closure))\n#6 /www/CashNotice/app/Jobs/SendEmail.php(59): Illuminate\\Support\\Facades\\Facade::__callStatic(\'send\', Array)\n#7 [internal function]: App\\Jobs\\SendEmail->App\\Jobs\\{closure}(Object(PHPExcel_Worksheet))\n#8 /www/CashNotice/vendor/maatwebsite/excel/src/Maatwebsite/Excel/Excel.php(123): call_user_func(Object(Closure), Object(Maatwebsite\\Excel\\Readers\\LaravelExcelReader))\n#9 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Support/Facades/Facade.php(221): Maatwebsite\\Excel\\Excel->load(\'/www/CashNotice...\', Object(Closure))\n#10 /www/CashNotice/app/Jobs/SendEmail.php(63): Illuminate\\Support\\Facades\\Facade::__callStatic(\'load\', Array)\n#11 [internal function]: App\\Jobs\\SendEmail->handle()\n#12 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(29): call_user_func_array(Array, Array)\n#13 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(87): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#14 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(31): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#15 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Container/Container.php(549): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#16 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(94): Illuminate\\Container\\Container->call(Array)\n#17 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(114): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\SendEmail))\n#18 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendEmail))\n#19 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(98): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#20 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(49): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\SendEmail), false)\n#21 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(76): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\BeanstalkdJob), Array)\n#22 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(320): Illuminate\\Queue\\Jobs\\Job->fire()\n#23 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(270): Illuminate\\Queue\\Worker->process(\'beanstalkd\', Object(Illuminate\\Queue\\Jobs\\BeanstalkdJob), Object(Illuminate\\Queue\\WorkerOptions))\n#24 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(114): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\BeanstalkdJob), \'beanstalkd\', Object(Illuminate\\Queue\\WorkerOptions))\n#25 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(101): Illuminate\\Queue\\Worker->daemon(\'beanstalkd\', \'SendEmail\', Object(Illuminate\\Queue\\WorkerOptions))\n#26 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(85): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'beanstalkd\', \'SendEmail\')\n#27 [internal function]: Illuminate\\Queue\\Console\\WorkCommand->handle()\n#28 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(29): call_user_func_array(Array, Array)\n#29 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(87): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#30 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(31): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#31 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Container/Container.php(549): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#32 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Console/Command.php(183): Illuminate\\Container\\Container->call(Array)\n#33 /www/CashNotice/vendor/symfony/console/Command/Command.php(251): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#34 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Console/Command.php(170): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#35 /www/CashNotice/vendor/symfony/console/Application.php(946): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#36 /www/CashNotice/vendor/symfony/console/Application.php(248): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#37 /www/CashNotice/vendor/symfony/console/Application.php(148): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#38 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Console/Application.php(88): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#39 /www/CashNotice/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(121): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#40 /www/CashNotice/artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#41 {main}', '2018-08-23 17:57:05');

-- ----------------------------
-- Table structure for jobs
-- ----------------------------
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of jobs
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('1', '2014_10_12_000000_create_users_table', '1');
INSERT INTO `migrations` VALUES ('2', '2014_10_12_100000_create_password_resets_table', '1');
INSERT INTO `migrations` VALUES ('3', '2018_08_21_092301_create_permission_tables', '1');
INSERT INTO `migrations` VALUES ('4', '2016_01_04_173148_create_admin_tables', '2');

-- ----------------------------
-- Table structure for model_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) unsigned NOT NULL,
  `model_id` int(10) unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`) USING BTREE,
  CONSTRAINT `model_has_permissions_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of model_has_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for model_has_roles
-- ----------------------------
DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE `model_has_roles` (
  `role_id` int(10) unsigned NOT NULL,
  `model_id` int(10) unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`) USING BTREE,
  CONSTRAINT `model_has_roles_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of model_has_roles
-- ----------------------------

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of permissions
-- ----------------------------

-- ----------------------------
-- Table structure for role_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`) USING BTREE,
  CONSTRAINT `role_has_permissions_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of role_has_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of roles
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
