-- phpMyAdmin SQL Dump
-- version 3.3.7
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2013 年 10 月 20 日 11:50
-- 服务器版本: 5.1.50
-- PHP 版本: 5.2.14

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `shouge`
--

-- --------------------------------------------------------

--
-- 表的结构 `yge_ad`
--

CREATE TABLE IF NOT EXISTS `yge_ad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT '名称',
  `category_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '广告分类',
  `title_style` text NOT NULL COMMENT '标题样式',
  `title_style_serialize` text NOT NULL COMMENT '标题样式序列化',
  `ad_type` char(10) NOT NULL DEFAULT 'text' COMMENT '广告类型',
  `link_url` varchar(255) NOT NULL COMMENT '链接地址',
  `description` text NOT NULL COMMENT '简介',
  `code_body` text NOT NULL COMMENT '代码内容',
  `height` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '高度',
  `width` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '宽度',
  `text_body` text NOT NULL COMMENT '文字广告内容',
  `font_size` varchar(255) NOT NULL COMMENT '文字大小',
  `attach_file` varchar(50) NOT NULL COMMENT '附件名称',
  `attach_ext` varchar(50) NOT NULL COMMENT '附件类型',
  `attach_alt` varchar(255) NOT NULL COMMENT 'alt 文字',
  `display_order` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '排序数值，越小排得越前',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='广告' AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `yge_ad`
--

INSERT INTO `yge_ad` (`id`, `title`, `category_id`, `title_style`, `title_style_serialize`, `ad_type`, `link_url`, `description`, `code_body`, `height`, `width`, `text_body`, `font_size`, `attach_file`, `attach_ext`, `attach_alt`, `display_order`, `status`, `create_time`, `update_time`) VALUES
(1, 'test1', 33, 'color:#800080;font-weight:bold;TEXT-DECORATION: underline', 'a:3:{s:5:"color";s:7:"#800080";s:4:"bold";s:4:"bold";s:9:"underline";s:9:"underline";}', 'image', 'ddd', 'test', 'test', 0, 0, '', '12px', 'Ad/4b89c936da4e9.jpg', '', 'test', 0, 0, 1267282184, 1267324636),
(3, 'test3', 33, '', '', 'image', 'ggg', '', '', 0, 0, '', '12px', 'Ad/4b89c96059ba3.jpg', '', '', 0, 0, 1267321184, 1267793689);

-- --------------------------------------------------------

--
-- 表的结构 `yge_admin`
--

CREATE TABLE IF NOT EXISTS `yge_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '角色组',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `realname` varchar(50) NOT NULL COMMENT '真实姓名',
  `notepad` text NOT NULL COMMENT '备忘录',
  `sex` char(5) NOT NULL DEFAULT '男' COMMENT '性别',
  `telephone` varchar(50) NOT NULL COMMENT '电话',
  `mobile_telephone` varchar(50) NOT NULL COMMENT '手机',
  `fax` varchar(50) NOT NULL COMMENT 'FAX',
  `web_url` varchar(100) NOT NULL COMMENT '网址',
  `email` varchar(50) NOT NULL COMMENT '电子邮件',
  `qq` varchar(50) NOT NULL COMMENT 'QQ',
  `address` varchar(100) NOT NULL DEFAULT '' COMMENT '地址',
  `login_count` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `last_login_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='管理员' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `yge_admin`
--

INSERT INTO `yge_admin` (`id`, `role_id`, `username`, `password`, `realname`, `notepad`, `sex`, `telephone`, `mobile_telephone`, `fax`, `web_url`, `email`, `qq`, `address`, `login_count`, `create_time`, `update_time`, `last_login_time`) VALUES
(1, 1, 'lizhongyi', '93279e3308bdbbeed946fc965017f67a', 'admin', '<script>alert(erwerwdasdasderwe\\\\\\''/nihertertao/\\\\\\'')</swrewrewcript>sdfsdfds', '男', '1860123421', '1860123421', '05560000000', '1860123421', '1860123421', '1860123421', '', 1, 1312176093, 1344238928, 1312176093);

-- --------------------------------------------------------

--
-- 表的结构 `yge_admin_log`
--

CREATE TABLE IF NOT EXISTS `yge_admin_log` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` tinyint(3) unsigned NOT NULL COMMENT '用户ID',
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '用户',
  `action` text NOT NULL COMMENT 'URI',
  `ip` char(15) NOT NULL DEFAULT '127.0.0.1' COMMENT 'IP',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '录入时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='管理员操作日志' AUTO_INCREMENT=4575 ;

--
-- 转存表中的数据 `yge_admin_log`
--

INSERT INTO `yge_admin_log` (`id`, `user_id`, `username`, `action`, `ip`, `create_time`) VALUES
(3805, 1, 'lizhongyi', '/admin.php?a=index&m=Database', '127.0.0.1', 1345784685),
(3806, 1, 'lizhongyi', '/admin.php?a=index&m=AdminLog', '127.0.0.1', 1345784721),
(3807, 1, 'lizhongyi', '/admin.php?a=index&m=Database', '127.0.0.1', 1345784728),
(3808, 1, 'lizhongyi', '/admin.php?a=index&m=Database', '127.0.0.1', 1345784769),
(3809, 1, 'lizhongyi', '/admin.php?a=index&m=Database', '127.0.0.1', 1345785047),
(3810, 1, 'lizhongyi', '/admin.php?a=index&m=Database', '127.0.0.1', 1345788395),
(3811, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1346044528),
(3812, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1346045476),
(3813, 1, 'lizhongyi', '/admin.php?a=index&m=Product', '127.0.0.1', 1346045478),
(3814, 1, 'lizhongyi', '/admin.php?a=index&m=Category', '127.0.0.1', 1346045479),
(3815, 1, 'lizhongyi', '/admin.php?a=index&m=Product', '127.0.0.1', 1346045480),
(3816, 1, 'lizhongyi', '/admin.php?a=index&m=Ad', '127.0.0.1', 1346045482),
(3817, 1, 'lizhongyi', '/admin.php?a=index&m=Category', '127.0.0.1', 1346045483),
(3818, 1, 'lizhongyi', '/admin.php?a=index&m=Product', '127.0.0.1', 1346045484),
(3819, 1, 'lizhongyi', '/admin.php?a=index&m=Notice', '127.0.0.1', 1346045486),
(3820, 1, 'lizhongyi', '/admin.php?a=index&m=Product', '127.0.0.1', 1346045488),
(3821, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1346385468),
(3822, 1, 'lizhongyi', '/admin.php?a=index&m=Theme', '127.0.0.1', 1346385477),
(3823, 1, 'lizhongyi', '/admin.php?a=index&m=Module', '127.0.0.1', 1346385478),
(3824, 1, 'lizhongyi', '/admin.php?a=index&m=Theme', '127.0.0.1', 1346385479),
(3825, 1, 'lizhongyi', '/admin.php?a=index&m=Config', '127.0.0.1', 1346385480),
(3826, 1, 'lizhongyi', '/admin.php?a=doModify&m=Config (编辑系统配置)', '127.0.0.1', 1346385484),
(3827, 1, 'lizhongyi', '/admin.php/Config', '127.0.0.1', 1346385485),
(3828, 1, 'lizhongyi', '/admin.php/Config', '127.0.0.1', 1346385703),
(3829, 1, 'lizhongyi', '/admin.php?a=doModify&m=Config (编辑系统配置)', '127.0.0.1', 1346385707),
(3830, 1, 'lizhongyi', '/admin.php/Config', '127.0.0.1', 1346385708),
(3831, 1, 'nihao', '/admin.php', '127.0.0.1', 1346387154),
(3832, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1346387237),
(3833, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1346387239),
(3834, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1346387345),
(3835, 1, '', '/admin.php', '127.0.0.1', 1346387361),
(3836, 1, '', '/admin.php', '127.0.0.1', 1346387363),
(3837, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1346388098),
(3838, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1346388102),
(3839, 1, 'lizhongyi', '/admin.php?a=index&m=Article', '127.0.0.1', 1346388107),
(3840, 1, 'lizhongyi', '/admin.php?a=index&m=Article', '127.0.0.1', 1346388108),
(3841, 1, '', '/admin.php', '127.0.0.1', 1346388117),
(3842, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1346388853),
(3843, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1346388855),
(3844, 1, '', '/admin.php', '127.0.0.1', 1346388863),
(3845, 1, '', '/admin.php', '127.0.0.1', 1346388864),
(3846, 1, '', '/admin.php', '127.0.0.1', 1346388865),
(3847, 1, '', '/admin.php', '127.0.0.1', 1346388866),
(3848, 1, '', '/admin.php', '127.0.0.1', 1346388894),
(3849, 1, '', '/admin.php', '127.0.0.1', 1346388895),
(3850, 1, '', '/admin.php', '127.0.0.1', 1346388902),
(3851, 1, '', '/admin.php', '127.0.0.1', 1346388902),
(3852, 1, '', '/admin.php', '127.0.0.1', 1346388903),
(3853, 1, '', '/admin.php', '127.0.0.1', 1346388905),
(3854, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1346389366),
(3855, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1346389368),
(3856, 1, 'lizhongyi', '/admin.php?a=index&m=Index', '127.0.0.1', 1346389418),
(3857, 1, 'lizhongyi', '/admin.php?a=index&m=Index', '127.0.0.1', 1346389419),
(3858, 1, 'lizhongyi', '/admin.php?a=index&m=Index', '127.0.0.1', 1346389420),
(3859, 1, 'lizhongyi', '/admin.php?a=index&m=Index', '127.0.0.1', 1346389420),
(3860, 1, 'lizhongyi', '/admin.php?a=index&m=Index', '127.0.0.1', 1346389420),
(3861, 1, 'lizhongyi', '/admin.php?a=index&m=Index', '127.0.0.1', 1346389449),
(3862, 1, 'lizhongyi', '/admin.php?a=index&m=Index', '127.0.0.1', 1346389450),
(3863, 1, 'lizhongyi', '/admin.php?a=index&m=Index', '127.0.0.1', 1346389590),
(3864, 1, 'lizhongyi', '/admin.php?a=index&m=Index', '127.0.0.1', 1346389591),
(3865, 1, 'lizhongyi', '/admin.php?a=index&m=Index', '127.0.0.1', 1346389622),
(3866, 1, 'lizhongyi', '/admin.php?a=index&m=Index', '127.0.0.1', 1346389623),
(3867, 1, 'lizhongyi', '/admin.php?a=index&m=Index', '127.0.0.1', 1346389629),
(3868, 1, 'lizhongyi', '/admin.php?a=index&m=Index', '127.0.0.1', 1346389630),
(3869, 1, 'lizhongyi', '/admin.php?a=index&m=Index', '127.0.0.1', 1346390802),
(3870, 1, 'lizhongyi', '/admin.php?a=index&m=Index', '127.0.0.1', 1346394292),
(3871, 1, 'lizhongyi', '/admin.php?a=index&m=Page', '127.0.0.1', 1346394294),
(3872, 1, 'lizhongyi', '/admin.php?a=index&m=Page', '127.0.0.1', 1346394308),
(3873, 1, 'lizhongyi', '/admin.php?a=doModify&m=Page (编辑:27)', '127.0.0.1', 1346394708),
(3874, 1, 'lizhongyi', '/admin.php/Page', '127.0.0.1', 1346394709),
(3875, 1, 'lizhongyi', '/admin.php/Page', '127.0.0.1', 1346394732),
(3876, 1, 'lizhongyi', '/admin.php?a=index&m=Product', '127.0.0.1', 1346394870),
(3877, 1, 'lizhongyi', '/admin.php?a=doCommand&m=Product (批量更新: 100,99,98,97 影响 4 条记录)', '127.0.0.1', 1346394876),
(3878, 1, 'lizhongyi', '/admin.php/Product', '127.0.0.1', 1346394878),
(3879, 1, 'lizhongyi', '/admin.php/Product', '127.0.0.1', 1346394879),
(3880, 1, 'lizhongyi', '/admin.php/Product', '127.0.0.1', 1346394880),
(3881, 1, 'lizhongyi', '/admin.php/Product', '127.0.0.1', 1346394881),
(3882, 1, 'lizhongyi', '/admin.php?a=index&m=Product', '127.0.0.1', 1346394883),
(3883, 1, 'lizhongyi', '/admin.php?a=doCommand&m=Product (批量更新: 100,99,98,97 影响 4 条记录)', '127.0.0.1', 1346394887),
(3884, 1, 'lizhongyi', '/admin.php/Product', '127.0.0.1', 1346394889),
(3885, 1, 'lizhongyi', '/admin.php?a=doCommand&m=Product (删除: 100,99,98,97)', '127.0.0.1', 1346394893),
(3886, 1, 'lizhongyi', '/admin.php?m=Product', '127.0.0.1', 1346394895),
(3887, 1, 'lizhongyi', '/admin.php?a=index&m=Category', '127.0.0.1', 1346394922),
(3888, 1, 'lizhongyi', '/admin.php?a=doModify&m=Category (编辑:104)', '127.0.0.1', 1346394947),
(3889, 1, 'lizhongyi', '/admin.php/Category', '127.0.0.1', 1346394949),
(3890, 1, 'lizhongyi', '/admin.php?a=index&m=Product', '127.0.0.1', 1346394951),
(3891, 1, 'lizhongyi', '/admin.php?a=doInsert&m=Product (录入:101)', '127.0.0.1', 1346395009),
(3892, 1, 'lizhongyi', '/admin.php?m=Product', '127.0.0.1', 1346395011),
(3893, 1, 'lizhongyi', '/admin.php?a=doInsert&m=Product (录入:102)', '127.0.0.1', 1346395058),
(3894, 1, 'lizhongyi', '/admin.php?m=Product', '127.0.0.1', 1346395059),
(3895, 1, 'lizhongyi', '/admin.php?a=doInsert&m=Product (录入:103)', '127.0.0.1', 1346395114),
(3896, 1, 'lizhongyi', '/admin.php?m=Product', '127.0.0.1', 1346395116),
(3897, 1, 'lizhongyi', '/admin.php?a=doInsert&m=Product (录入:104)', '127.0.0.1', 1346395267),
(3898, 1, 'lizhongyi', '/admin.php?m=Product', '127.0.0.1', 1346395269),
(3899, 1, 'lizhongyi', '/admin.php?m=Product', '127.0.0.1', 1346395289),
(3900, 1, 'lizhongyi', '/admin.php?m=Product', '127.0.0.1', 1346395323),
(3901, 1, 'lizhongyi', '/admin.php?m=Product', '127.0.0.1', 1346395324),
(3902, 1, 'lizhongyi', '/admin.php?m=Product', '127.0.0.1', 1346395379),
(3903, 1, 'lizhongyi', '/admin.php?a=doModify&m=Product (编辑:104)', '127.0.0.1', 1346396055),
(3904, 1, 'lizhongyi', '/admin.php/Product', '127.0.0.1', 1346396058),
(3905, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1346406539),
(3906, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1346406539),
(3907, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1346406541),
(3908, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1346475629),
(3909, 1, 'lizhongyi', '/admin.php?a=index&m=Config', '127.0.0.1', 1346477186),
(3910, 1, 'lizhongyi', '/admin.php?a=doModify&m=Config (编辑系统配置)', '127.0.0.1', 1346477199),
(3911, 1, 'lizhongyi', '/admin.php/Config', '127.0.0.1', 1346477202),
(3912, 1, 'lizhongyi', '/admin.php?a=doModify&m=Config (编辑系统配置)', '127.0.0.1', 1346477242),
(3913, 1, 'lizhongyi', '/admin.php/Config', '127.0.0.1', 1346477246),
(3914, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1336009944),
(3915, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1336010286),
(3916, 1, 'lizhongyi', '/admin.php?a=index&m=Config', '127.0.0.1', 1336012156),
(3917, 1, 'lizhongyi', '/admin.php?a=index&m=Config', '127.0.0.1', 1336012187),
(3918, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1336013824),
(3919, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1336013825),
(3920, 1, 'lizhongyi', '/admin.php?a=index&m=Menu', '127.0.0.1', 1336013848),
(3921, 1, 'lizhongyi', '/admin.php?a=index&m=Menu', '127.0.0.1', 1336014458),
(3922, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1336017193),
(3923, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1336017194),
(3924, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1336017194),
(3925, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1336020878),
(3926, 1, 'lizhongyi', '/admin.php?a=index&m=Menu', '127.0.0.1', 1336024784),
(3927, 1, 'lizhongyi', '/admin.php?a=index&m=Menu', '127.0.0.1', 1336025223),
(3928, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1336026456),
(3929, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1336026457),
(3930, 1, 'lizhongyi', '/admin.php?a=index&m=Menu', '127.0.0.1', 1336026515),
(3931, 1, 'lizhongyi', '/admin.php?a=doCommand&m=Menu (批量更新: 38,10,9,8,7,6,5,1 影响 8 条记录)', '127.0.0.1', 1336026523),
(3932, 1, 'lizhongyi', '/admin.php/Menu', '127.0.0.1', 1336026526),
(3933, 1, 'lizhongyi', '/admin.php/Menu', '127.0.0.1', 1336026542),
(3934, 1, 'lizhongyi', '/admin.php?a=doCommand&m=Menu (批量更新: 38,10,9,8,7,6,5,1 影响 8 条记录)', '127.0.0.1', 1336026929),
(3935, 1, 'lizhongyi', '/admin.php/Menu', '127.0.0.1', 1336026931),
(3936, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1336028133),
(3937, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1336030117),
(3938, 1, 'lizhongyi', '/admin.php?a=index&m=Module', '127.0.0.1', 1336031528),
(3939, 1, 'lizhongyi', '/admin.php?a=index&m=Config', '127.0.0.1', 1336031529),
(3940, 1, 'lizhongyi', '/admin.php?a=doModify&m=Config (编辑系统配置)', '127.0.0.1', 1336031533),
(3941, 1, 'lizhongyi', '/admin.php/Config', '127.0.0.1', 1336031535),
(3942, 1, 'lizhongyi', '/admin.php?a=index&m=Article', '127.0.0.1', 1336031552),
(3943, 1, 'lizhongyi', '/admin.php?a=doModify&m=Article&jump=%2Fadmin.php%3Fa%3Dindex%26m%3DArticle (编辑:840)', '127.0.0.1', 1336031558),
(3944, 1, 'lizhongyi', '/admin.php?a=doModify&m=Article&jump=%2Fadmin.php%3Fa%3Dindex%26m%3DArticle (编辑:840)', '127.0.0.1', 1336031568),
(3945, 1, 'lizhongyi', '/admin.php?a=doModify&m=Article&jump=%2Fadmin.php%3Fa%3Dindex%26m%3DArticle (编辑:840)', '127.0.0.1', 1336031803),
(3946, 1, 'lizhongyi', '/admin.php?a=doModify&m=Article&jump=%2Fadmin.php%3Fa%3Dindex%26m%3DArticle (编辑:840)', '127.0.0.1', 1336031804),
(3947, 1, 'lizhongyi', '/admin.php?a=doModify&m=Article&jump=%2Fadmin.php%3Fa%3Dindex%26m%3DArticle (编辑:840)', '127.0.0.1', 1336031821),
(3948, 1, 'lizhongyi', '/admin.php/Article', '127.0.0.1', 1336031822),
(3949, 1, 'lizhongyi', '/admin.php?a=doModify&m=Article&jump=%2Fadmin.php%2FArticle (编辑:840)', '127.0.0.1', 1336032910),
(3950, 1, 'lizhongyi', '/admin.php/Article', '127.0.0.1', 1336032914),
(3951, 1, 'lizhongyi', '/admin.php?a=doModify&m=Article&jump=%2Fadmin.php%2FArticle (编辑:840)', '127.0.0.1', 1336032938),
(3952, 1, 'lizhongyi', '/admin.php/Article', '127.0.0.1', 1336032939),
(3953, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1336040064),
(3954, 1, 'lizhongyi', '/admin.php?a=index&m=Module', '127.0.0.1', 1336040068),
(3955, 1, 'lizhongyi', '/admin.php?a=index&m=Config', '127.0.0.1', 1336040068),
(3956, 1, 'lizhongyi', '/admin.php?a=doModify&m=Config (编辑系统配置)', '127.0.0.1', 1336040072),
(3957, 1, 'lizhongyi', '/admin.php/Config', '127.0.0.1', 1336040074),
(3958, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1336052293),
(3959, 1, 'lizhongyi', '/admin.php?a=index&m=Article', '127.0.0.1', 1336052665),
(3960, 1, 'lizhongyi', '/admin.php?a=doModify&m=Article&jump=%2Fadmin.php%3Fa%3Dindex%26m%3DArticle (编辑:840)', '127.0.0.1', 1336052720),
(3961, 1, 'lizhongyi', '/admin.php/Article', '127.0.0.1', 1336052723),
(3962, 1, 'lizhongyi', '/admin.php?a=index&m=Article', '127.0.0.1', 1336052770),
(3963, 1, 'lizhongyi', '/admin.php?a=doModify&m=Article&jump=%2Fadmin.php%3Fa%3Dindex%26m%3DArticle (编辑:835)', '127.0.0.1', 1336052782),
(3964, 1, 'lizhongyi', '/admin.php/Article', '127.0.0.1', 1336052784),
(3965, 1, 'lizhongyi', '/admin.php?a=doModify&m=Article&jump=%2Fadmin.php%2FArticle (编辑:836)', '127.0.0.1', 1336052894),
(3966, 1, 'lizhongyi', '/admin.php?a=doModify&m=Article&jump=%2Fadmin.php%2FArticle (编辑:836)', '127.0.0.1', 1336052898),
(3967, 1, 'lizhongyi', '/admin.php?a=index&m=Article', '127.0.0.1', 1336056891),
(3968, 1, 'lizhongyi', '/admin.php?a=doModify&m=Article&jump=%2Fadmin.php%3Fa%3Dindex%26m%3DArticle (编辑:840)', '127.0.0.1', 1336056899),
(3969, 1, 'lizhongyi', '/admin.php/Article', '127.0.0.1', 1336056903),
(3970, 1, 'lizhongyi', '/admin.php?a=doModify&m=Article&jump=%2Fadmin.php%2FArticle (编辑:840)', '127.0.0.1', 1336056982),
(3971, 1, 'lizhongyi', '/admin.php/Article', '127.0.0.1', 1336056985),
(3972, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1336114863),
(3973, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1336124634),
(3974, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1336124783),
(3975, 1, 'lizhongyi', '/admin.php?a=index&m=Index', '127.0.0.1', 1336124799),
(3976, 1, 'lizhongyi', '/admin.php?a=index&m=Index', '127.0.0.1', 1336124801),
(3977, 1, 'lizhongyi', '/admin.php?a=index&m=Index', '127.0.0.1', 1336125081),
(3978, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1346816777),
(3979, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1347085019),
(3980, 1, 'lizhongyi', '/admin.php?a=index&m=Category', '127.0.0.1', 1347085025),
(3981, 1, 'lizhongyi', '/admin.php?a=index&m=Category', '127.0.0.1', 1347085504),
(3982, 1, 'lizhongyi', '/admin.php?a=doInsert&m=Category (录入:112)', '127.0.0.1', 1347085524),
(3983, 1, 'lizhongyi', '/admin.php/Category', '127.0.0.1', 1347085527),
(3984, 1, 'lizhongyi', '/admin.php?a=doInsert&m=Category (录入:113)', '127.0.0.1', 1347085540),
(3985, 1, 'lizhongyi', '/admin.php/Category', '127.0.0.1', 1347085543),
(3986, 1, 'lizhongyi', '/admin.php?a=index&m=Product', '127.0.0.1', 1347086816),
(3987, 1, 'lizhongyi', '/admin.php?a=index&m=Category', '127.0.0.1', 1347086818),
(3988, 1, 'lizhongyi', '/admin.php?a=index&m=Product&category=103', '127.0.0.1', 1347095594),
(3989, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1347106099),
(3990, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1347106100),
(3991, 1, 'lizhongyi', '/admin.php?a=index&m=Article', '127.0.0.1', 1347106106),
(3992, 1, 'lizhongyi', '/admin.php?a=index&m=Category', '127.0.0.1', 1347106108),
(3993, 1, 'lizhongyi', '/admin.php?a=doInsert&m=Category (录入:114)', '127.0.0.1', 1347106138),
(3994, 1, 'lizhongyi', '/admin.php/Category', '127.0.0.1', 1347106141),
(3995, 1, 'lizhongyi', '/admin.php?a=index&m=Index', '127.0.0.1', 1347106985),
(3996, 1, 'lizhongyi', '/admin.php?a=index&m=Category', '127.0.0.1', 1347110097),
(3997, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1347182746),
(3998, 1, 'lizhongyi', '/admin.php?a=index&m=Category', '127.0.0.1', 1347184035),
(3999, 1, 'lizhongyi', '/admin.php?a=index&m=Category', '127.0.0.1', 1347184558),
(4000, 1, 'lizhongyi', '/admin.php?a=doInsert&m=Category (录入:115)', '127.0.0.1', 1347184591),
(4001, 1, 'lizhongyi', '/admin.php/Category', '127.0.0.1', 1347184594),
(4002, 1, 'lizhongyi', '/admin.php?a=index&m=Category', '127.0.0.1', 1347188809),
(4003, 1, 'lizhongyi', '/admin.php?a=doCommand&m=Category (删除: 115)', '127.0.0.1', 1347188827),
(4004, 1, 'lizhongyi', '/admin.php/Category', '127.0.0.1', 1347188831),
(4005, 1, 'lizhongyi', '/admin.php/Category', '127.0.0.1', 1347188831),
(4006, 1, 'lizhongyi', '/admin.php/Category', '127.0.0.1', 1347188867),
(4007, 1, 'lizhongyi', '/admin.php/Category', '127.0.0.1', 1347188879),
(4008, 1, 'lizhongyi', '/admin.php?a=index&m=Tools', '127.0.0.1', 1347188921),
(4009, 1, 'lizhongyi', '/admin.php?a=doCache&m=Tools (更新缓存)', '127.0.0.1', 1347188925),
(4010, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1347190876),
(4011, 1, 'lizhongyi', '/admin.php?a=index&m=Config', '127.0.0.1', 1347190887),
(4012, 1, 'lizhongyi', '/admin.php?a=doModify&m=Config (编辑系统配置)', '127.0.0.1', 1347190894),
(4013, 1, 'lizhongyi', '/admin.php/Config', '127.0.0.1', 1347190897),
(4014, 1, 'lizhongyi', '/admin.php/Config', '127.0.0.1', 1347191319),
(4015, 1, 'lizhongyi', '/admin.php?a=index&m=Config', '127.0.0.1', 1347191323),
(4016, 1, 'lizhongyi', '/admin.php?a=doModify&m=Config (编辑系统配置)', '127.0.0.1', 1347191340),
(4017, 1, 'lizhongyi', '/admin.php/Config', '127.0.0.1', 1347191342),
(4018, 1, 'lizhongyi', '/admin.php?a=index&m=Category', '127.0.0.1', 1347192314),
(4019, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1347199095),
(4020, 1, 'lizhongyi', '/admin.php?a=index&m=Product&category=103', '127.0.0.1', 1347199566),
(4021, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1347244715),
(4022, 1, 'lizhongyi', '/admin.php?a=index&m=Product&category=103', '127.0.0.1', 1347352539),
(4023, 1, 'lizhongyi', '/admin.php/Product', '127.0.0.1', 1347352575),
(4024, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1347522760),
(4025, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1347522979),
(4026, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1347522980),
(4027, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1347523094),
(4028, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1347523259),
(4029, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1347523311),
(4030, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1347523312),
(4031, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1347523313),
(4032, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1347523317),
(4033, 1, 'lizhongyi', '/admin.php?a=index&m=Config', '127.0.0.1', 1347523389),
(4034, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1347523539),
(4035, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1347523540),
(4036, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1347523705),
(4037, 1, 'lizhongyi', '/admin.php?a=index&m=Product&category=103', '127.0.0.1', 1347524226),
(4038, 1, 'lizhongyi', '/admin.php?a=index&m=Product&category=103', '127.0.0.1', 1347524230),
(4039, 1, 'lizhongyi', '/admin.php?a=index&m=Config', '127.0.0.1', 1347524287),
(4040, 1, 'lizhongyi', '/admin.php?a=index&m=Tags', '127.0.0.1', 1347524403),
(4041, 1, 'lizhongyi', '/admin.php?a=index&m=Module', '127.0.0.1', 1347524536),
(4042, 1, 'lizhongyi', '/admin.php?a=index&m=Menu', '127.0.0.1', 1347524540),
(4043, 1, 'lizhongyi', '/admin.php?a=doCommand&m=Menu (批量更新: 38,10,9,8,7,6,5,1 影响 8 条记录)', '127.0.0.1', 1347524547),
(4044, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1347524559),
(4045, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1347524561),
(4046, 1, 'lizhongyi', '/admin.php?a=index&m=Category', '127.0.0.1', 1347524600),
(4047, 1, 'lizhongyi', '/admin.php?a=doInsert&m=Category (录入:116)', '127.0.0.1', 1347524622),
(4048, 1, 'lizhongyi', '/admin.php?m=Category', '127.0.0.1', 1347524660),
(4049, 1, 'lizhongyi', '/admin.php?a=index&m=Job', '127.0.0.1', 1347524681),
(4050, 1, 'lizhongyi', '/admin.php?a=doModify&m=Job (编辑:8)', '127.0.0.1', 1347524686),
(4051, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1347524696),
(4052, 1, 'lizhongyi', '/admin.php?a=index&m=Article', '127.0.0.1', 1347524701),
(4053, 1, 'lizhongyi', '/admin.php?a=doCommand&m=Article (批量更新: 840,839,838,837,836,835,834,833 影响 8 条记录)', '127.0.0.1', 1347524705),
(4054, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1347524711),
(4055, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1347524712),
(4056, 1, 'lizhongyi', '/admin.php?a=index&m=Article', '127.0.0.1', 1347524769),
(4057, 1, 'lizhongyi', '/admin.php?a=doModify&m=Article&jump=%2Fadmin.php%3Fa%3Dindex%26m%3DArticle (编辑:840)', '127.0.0.1', 1347524776),
(4058, 1, 'lizhongyi', '/admin.php?a=doModify&m=Article&jump=%2Fadmin.php%3Fa%3Dindex%26m%3DArticle (编辑:840)', '127.0.0.1', 1347524842),
(4059, 1, 'lizhongyi', '/admin.php?a=doModify&m=Article&jump=%2Fadmin.php%3Fa%3Dindex%26m%3DArticle (编辑:840)', '127.0.0.1', 1347524849),
(4060, 1, 'lizhongyi', '/admin.php?a=doModify&m=Article&jump=%2Fadmin.php%3Fa%3Dindex%26m%3DArticle (编辑:840)', '127.0.0.1', 1347524865),
(4061, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1347524874),
(4062, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1347524875),
(4063, 1, 'lizhongyi', '/admin.php?a=index&m=Category', '127.0.0.1', 1347524881),
(4064, 1, 'lizhongyi', '/admin.php?a=index&m=Menu', '127.0.0.1', 1347524884),
(4065, 1, 'lizhongyi', '/admin.php?a=index&m=Category', '127.0.0.1', 1347524889),
(4066, 1, 'lizhongyi', '/admin.php?a=index&m=Article', '127.0.0.1', 1347524897),
(4067, 1, 'lizhongyi', '/admin.php?a=doModify&m=Article&jump=%2Fadmin.php%3Fa%3Dindex%26m%3DArticle (编辑:840)', '127.0.0.1', 1347525089),
(4068, 1, 'lizhongyi', '/admin.php?a=index&m=Module', '127.0.0.1', 1347525252),
(4069, 1, 'lizhongyi', '/admin.php?a=index&m=Module', '127.0.0.1', 1347525254),
(4070, 1, 'lizhongyi', '/admin.php?a=index&m=Tags', '127.0.0.1', 1347525332),
(4071, 1, 'lizhongyi', '/admin.php?a=index&m=Module', '127.0.0.1', 1347525333),
(4072, 1, 'lizhongyi', '/admin.php?a=index&m=Config', '127.0.0.1', 1347525335),
(4073, 1, 'lizhongyi', '/admin.php?a=doModify&m=Config (编辑系统配置)', '127.0.0.1', 1347525339),
(4074, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1347525345),
(4075, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1347525346),
(4076, 1, 'lizhongyi', '/admin.php?a=index&m=Article', '127.0.0.1', 1347525349),
(4077, 1, 'lizhongyi', '/admin.php?a=doModify&m=Article&jump=%2Fadmin.php%3Fa%3Dindex%26m%3DArticle (编辑:840)', '127.0.0.1', 1347525355),
(4078, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1347525396),
(4079, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1347525397),
(4080, 1, 'lizhongyi', '/admin.php?a=index&m=Config', '127.0.0.1', 1347525403),
(4081, 1, 'lizhongyi', '/admin.php?a=doModify&m=Config (编辑系统配置)', '127.0.0.1', 1347525406),
(4082, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1347525412),
(4083, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1347525418),
(4084, 1, 'lizhongyi', '/admin.php?a=index&m=Article', '127.0.0.1', 1347525425),
(4085, 1, 'lizhongyi', '/admin.php?a=index&m=Category', '127.0.0.1', 1347525496),
(4086, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1347526269),
(4087, 1, 'lizhongyi', '/admin.php?a=index&m=Category', '127.0.0.1', 1347526337),
(4088, 1, 'lizhongyi', '/admin.php?a=index&m=Admin', '127.0.0.1', 1347526594),
(4089, 1, 'lizhongyi', '/admin.php?a=index&m=Index', '127.0.0.1', 1347526633),
(4090, 1, 'lizhongyi', '/admin.php?a=index&m=Index', '127.0.0.1', 1347526915),
(4091, 1, 'lizhongyi', '/admin.php?a=index&m=Category', '127.0.0.1', 1347526916),
(4092, 1, 'lizhongyi', '/admin.php?a=index&m=Index', '127.0.0.1', 1347527300),
(4093, 1, 'lizhongyi', '/admin.php?a=index&m=Index', '127.0.0.1', 1347527424),
(4094, 1, 'lizhongyi', '/admin.php?a=index&m=Index', '127.0.0.1', 1347527424),
(4095, 1, 'lizhongyi', '/admin.php?a=index&m=Index', '127.0.0.1', 1347527425),
(4096, 1, 'lizhongyi', '/admin.php?a=index&m=Index', '127.0.0.1', 1347527425),
(4097, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1347538868),
(4098, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1347538900),
(4099, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1347540606),
(4100, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1347586274),
(4101, 1, 'lizhongyi', '/admin.php?a=index&m=Page', '127.0.0.1', 1347586367),
(4102, 1, 'lizhongyi', '/admin.php?a=index&m=Article', '127.0.0.1', 1347586503),
(4103, 1, 'lizhongyi', '/admin.php?a=doModify&m=Article&jump=%2Fadmin.php%3Fa%3Dindex%26m%3DArticle (编辑:840)', '127.0.0.1', 1347586509),
(4104, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1347587206),
(4105, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1347589733),
(4106, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1347589735),
(4107, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1347590905),
(4108, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1347592011),
(4109, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1347592013),
(4110, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1347594067),
(4111, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1347594068),
(4112, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1347600656),
(4113, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1347600658),
(4114, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1347601061),
(4115, 1, 'lizhongyi', '/admin.php?a=index&m=Menu', '127.0.0.1', 1347601899),
(4116, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1347636966),
(4117, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1347637026),
(4118, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1347868676),
(4119, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1347873644),
(4120, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1347884883),
(4121, 1, 'lizhongyi', '/admin.php?m=Config&a=index', '127.0.0.1', 1347886414),
(4122, 1, 'lizhongyi', '/admin.php?m=Config&a=index', '127.0.0.1', 1347888507),
(4123, 1, 'lizhongyi', '/admin.php?m=Config&a=doModify (编辑系统配置)', '127.0.0.1', 1347888517),
(4124, 1, 'lizhongyi', '/admin.php/Config', '127.0.0.1', 1347888520),
(4125, 1, 'lizhongyi', '/admin.php?m=Config&a=doModify (编辑系统配置)', '127.0.0.1', 1347888574),
(4126, 1, 'lizhongyi', '/admin.php/Config', '127.0.0.1', 1347888578),
(4127, 1, 'lizhongyi', '/admin.php/Config', '127.0.0.1', 1347888741),
(4128, 1, 'lizhongyi', '/admin.php?m=Config&a=doModify (编辑系统配置)', '127.0.0.1', 1347888750),
(4129, 1, 'lizhongyi', '/admin.php/Config', '127.0.0.1', 1347888754),
(4130, 1, 'lizhongyi', '/admin.php/Config', '127.0.0.1', 1347888778),
(4131, 1, 'lizhongyi', '/admin.php?m=Config&a=doModify (编辑系统配置)', '127.0.0.1', 1347888790),
(4132, 1, 'lizhongyi', '/admin.php/Config', '127.0.0.1', 1347888794),
(4133, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1347954160),
(4134, 1, 'lizhongyi', '/admin.php?m=Module&a=index', '127.0.0.1', 1347954186),
(4135, 1, 'lizhongyi', '/admin.php?m=Config&a=index', '127.0.0.1', 1347954190),
(4136, 1, 'lizhongyi', '/admin.php?m=Config&a=index', '127.0.0.1', 1347954295),
(4137, 1, 'lizhongyi', '/admin.php?m=Config&a=index', '127.0.0.1', 1347954320),
(4138, 1, 'lizhongyi', '/admin.php?m=Config&a=index', '127.0.0.1', 1347954322),
(4139, 1, 'lizhongyi', '/admin.php?m=Module&a=index', '127.0.0.1', 1347954329),
(4140, 1, 'lizhongyi', '/admin.php?m=Config&a=index', '127.0.0.1', 1347954331),
(4141, 1, 'lizhongyi', '/admin.php?m=Config&a=doModify (编辑系统配置)', '127.0.0.1', 1347954342),
(4142, 1, 'lizhongyi', '/admin.php/Config', '127.0.0.1', 1347954346),
(4143, 1, 'lizhongyi', '/admin.php?m=Config&a=doModify (编辑系统配置)', '127.0.0.1', 1347954357),
(4144, 1, 'lizhongyi', '/admin.php/Config', '127.0.0.1', 1347954360),
(4145, 1, 'lizhongyi', '/admin.php/Config', '127.0.0.1', 1347954388),
(4146, 1, 'lizhongyi', '/admin.php/Config', '127.0.0.1', 1347954391),
(4147, 1, 'lizhongyi', '/admin.php/Config', '127.0.0.1', 1347954410),
(4148, 1, 'lizhongyi', '/admin.php/Config', '127.0.0.1', 1347954448),
(4149, 1, 'lizhongyi', '/admin.php/Config', '127.0.0.1', 1347954484),
(4150, 1, 'lizhongyi', '/admin.php/Config', '127.0.0.1', 1347954487),
(4151, 1, 'lizhongyi', '/admin.php/Config', '127.0.0.1', 1347954500),
(4152, 1, 'lizhongyi', '/admin.php/Config', '127.0.0.1', 1347954511),
(4153, 1, 'lizhongyi', '/admin.php/Config', '127.0.0.1', 1347954513),
(4154, 1, 'lizhongyi', '/admin.php/Config', '127.0.0.1', 1347954589),
(4155, 1, 'lizhongyi', '/admin.php/Config', '127.0.0.1', 1347954613),
(4156, 1, 'lizhongyi', '/admin.php/Config', '127.0.0.1', 1347954643),
(4157, 1, 'lizhongyi', '/admin.php/Config', '127.0.0.1', 1347954657),
(4158, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1348132178),
(4159, 1, 'lizhongyi', '/admin.php?m=Config&a=index', '127.0.0.1', 1348132181),
(4160, 1, 'lizhongyi', '/admin.php?m=Config&a=doModify (编辑系统配置)', '127.0.0.1', 1348132187),
(4161, 1, 'lizhongyi', '/admin.php/Config', '127.0.0.1', 1348132191),
(4162, 1, 'lizhongyi', '/admin.php', '114.245.212.27', 1348217807),
(4163, 1, 'lizhongyi', '/admin.php', '114.245.212.27', 1348218005),
(4164, 1, 'lizhongyi', '/admin.php', '114.245.212.27', 1348225312),
(4165, 1, 'lizhongyi', '/admin.php?m=Category&a=index', '114.245.212.27', 1348225315),
(4166, 1, 'lizhongyi', '/admin.php?m=Product&a=index', '114.245.212.27', 1348225316),
(4167, 1, 'lizhongyi', '/admin.php', '123.114.251.204', 1348276579),
(4168, 1, 'lizhongyi', '/admin.php?m=Config&a=index', '123.114.251.204', 1348276593),
(4169, 1, 'lizhongyi', '/admin.php?m=Config&a=doModify (编辑系统配置)', '123.114.251.204', 1348276600),
(4170, 1, 'lizhongyi', '/admin.php', '123.114.251.204', 1348277029),
(4171, 1, 'lizhongyi', '/admin.php?m=Module&a=index', '123.114.251.204', 1348277091),
(4172, 1, 'lizhongyi', '/admin.php?m=Config&a=index', '123.114.251.204', 1348277092),
(4173, 1, 'lizhongyi', '/admin.php?m=Config&a=doModify (编辑系统配置)', '123.114.251.204', 1348277102),
(4174, 1, 'lizhongyi', '/admin.php', '114.245.192.28', 1348535830),
(4175, 1, 'lizhongyi', '/admin.php?m=Menu&a=index', '114.245.192.28', 1348537222),
(4176, 1, 'lizhongyi', '/admin.php?m=Menu&a=doCommand (删除: 38,10,9,8,7,6,5,1)', '114.245.192.28', 1348537250),
(4177, 1, 'lizhongyi', '/admin.php?m=Menu', '114.245.192.28', 1348537254),
(4178, 1, 'lizhongyi', '/admin.php?m=Category&a=index', '114.245.192.28', 1348537259),
(4179, 1, 'lizhongyi', '/admin.php?m=Category&a=index', '114.245.192.28', 1348537266),
(4180, 1, 'lizhongyi', '/admin.php?m=Category&a=index', '114.245.192.28', 1348537273),
(4181, 1, 'lizhongyi', '/admin.php?m=Menu&a=index', '114.245.192.28', 1348537283),
(4182, 1, 'lizhongyi', '/admin.php?m=Category&a=index', '114.245.192.28', 1348539309),
(4183, 1, 'lizhongyi', '/admin.php?m=Menu&a=index', '114.245.192.28', 1348539435),
(4184, 1, 'lizhongyi', '/admin.php?m=Tools&a=index', '114.245.192.28', 1348539670),
(4185, 1, 'lizhongyi', '/admin.php?m=Tools&a=doCache (更新缓存)', '114.245.192.28', 1348539673),
(4186, 1, 'lizhongyi', '/admin.php?m=Category&a=index', '114.245.192.28', 1348539705),
(4187, 1, 'lizhongyi', '/admin.php?m=Tools&a=index', '114.245.192.28', 1348539747),
(4188, 1, 'lizhongyi', '/admin.php?m=Tools&a=doCache (更新缓存)', '114.245.192.28', 1348539750),
(4189, 1, 'lizhongyi', '/admin.php?m=Menu&a=index', '114.245.192.28', 1348539755),
(4190, 1, 'lizhongyi', '/admin.php?m=Category&a=index', '114.245.192.28', 1348540293),
(4191, 1, 'lizhongyi', '/admin.php?m=Category&a=index', '114.245.192.28', 1348540328),
(4192, 1, 'lizhongyi', '/admin.php?m=Menu&a=index', '114.245.192.28', 1348540331),
(4193, 1, 'lizhongyi', '/admin.php?m=Category&a=index', '114.245.192.28', 1348540335),
(4194, 1, 'lizhongyi', '/admin.php?m=Menu&a=index', '114.245.192.28', 1348540340),
(4195, 1, 'lizhongyi', '/admin.php?m=Menu&a=index', '114.245.192.28', 1348540406),
(4196, 1, 'lizhongyi', '/admin.php?m=Category&a=index', '114.245.192.28', 1348540410),
(4197, 1, 'lizhongyi', '/admin.php?m=Menu&a=index', '114.245.192.28', 1348540414),
(4198, 1, 'lizhongyi', '/admin.php?m=Menu&a=doCommand (批量更新: 46 影响 1 条记录)', '114.245.192.28', 1348540473),
(4199, 1, 'lizhongyi', '/admin.php', '114.245.192.28', 1348540524),
(4200, 1, 'lizhongyi', '/admin.php?m=AdminRole&a=index', '114.245.192.28', 1348540540),
(4201, 1, 'lizhongyi', '/admin.php?m=Admin', '114.245.192.28', 1348540559),
(4202, 1, 'lizhongyi', '/admin.php', '114.245.192.28', 1348543124),
(4203, 1, 'lizhongyi', '/admin.php', '114.245.192.28', 1348543228),
(4204, 1, 'lizhongyi', '/admin.php', '114.245.192.28', 1348543336),
(4205, 1, 'lizhongyi', '/admin.php?s=Article', '114.245.192.28', 1348544134),
(4206, 1, 'lizhongyi', '/admin.php?s=Article', '114.245.192.28', 1348544317),
(4207, 1, 'lizhongyi', '/admin.php', '114.245.192.28', 1348544497),
(4208, 1, 'lizhongyi', '/admin.php', '114.245.192.28', 1348544499),
(4209, 1, 'lizhongyi', '/admin.php', '114.245.192.28', 1348544536),
(4210, 1, 'lizhongyi', '/admin.php', '114.245.192.28', 1348544537),
(4211, 1, 'lizhongyi', '/admin.php?m=Index&a=index', '114.245.192.28', 1348544552),
(4212, 1, 'lizhongyi', '/admin.php?s=Index&a=index', '114.245.192.28', 1348544558),
(4213, 1, 'lizhongyi', '/admin.php?', '114.245.192.28', 1348544561),
(4214, 1, 'lizhongyi', '/admin.php', '114.245.192.28', 1348544650),
(4215, 1, 'lizhongyi', '/admin.php', '114.245.192.28', 1348544652),
(4216, 1, 'lizhongyi', '/admin.php', '114.245.192.28', 1348545576),
(4217, 1, 'lizhongyi', '/admin.php', '114.245.192.28', 1348550825),
(4218, 1, 'lizhongyi', '/admin.php', '114.245.192.28', 1348550826),
(4219, 1, 'lizhongyi', '/admin.php?m=Menu&a=index', '114.245.192.28', 1348550830),
(4220, 1, 'lizhongyi', '/admin.php?m=Menu&a=index', '114.245.192.28', 1348550831),
(4221, 1, 'lizhongyi', '/admin.php?m=Menu&a=doCommand (批量更新: 46 影响 1 条记录)', '114.245.192.28', 1348550833),
(4222, 1, 'lizhongyi', '/admin.php/Menu', '114.245.192.28', 1348550837),
(4223, 1, 'lizhongyi', '/admin.php', '114.245.192.28', 1348550926),
(4224, 1, 'lizhongyi', '/admin.php', '114.245.192.28', 1348551154),
(4225, 1, 'lizhongyi', '/admin.php', '114.245.192.28', 1348551604),
(4226, 1, 'lizhongyi', '/admin.php', '114.245.192.28', 1348551721),
(4227, 1, 'lizhongyi', '/admin.php?m=Category&a=index', '114.245.192.28', 1348551782),
(4228, 1, 'lizhongyi', '/admin.php?m=Menu&a=index', '114.245.192.28', 1348551785),
(4229, 1, 'lizhongyi', '/admin.php?m=Article&a=index', '114.245.192.28', 1348551787),
(4230, 1, 'lizhongyi', '/admin.php', '114.245.192.28', 1348552830),
(4231, 1, 'lizhongyi', '/admin.php', '114.245.192.28', 1348552830),
(4232, 1, 'lizhongyi', '/admin.php', '114.245.192.28', 1348553603),
(4233, 1, 'lizhongyi', '/admin.php?m=Config&a=index', '114.245.192.28', 1348553605),
(4234, 1, 'lizhongyi', '/admin.php?m=Config&a=doModify (编辑系统配置)', '114.245.192.28', 1348553617),
(4235, 1, 'lizhongyi', '/admin.php', '114.245.192.28', 1348563830),
(4236, 1, 'lizhongyi', '/admin.php', '114.245.192.28', 1348565043),
(4237, 1, 'lizhongyi', '/admin.php', '114.245.192.28', 1348567221),
(4238, 1, 'lizhongyi', '/admin.php', '114.245.192.28', 1348567221),
(4239, 1, 'lizhongyi', '/admin.php', '114.245.192.28', 1348567223),
(4240, 1, 'lizhongyi', '/admin.php', '114.245.192.28', 1348567513),
(4241, 1, 'lizhongyi', '/admin.php', '114.245.192.28', 1348567514),
(4242, 1, 'lizhongyi', '/admin.php', '114.245.192.28', 1348567515),
(4243, 1, 'lizhongyi', '/admin.php/Index/index.html', '114.245.192.28', 1348567532),
(4244, 1, 'lizhongyi', '/admin.php/Category/index.html', '114.245.192.28', 1348567536),
(4245, 1, 'lizhongyi', '/admin.php/Menu/index.html', '114.245.192.28', 1348567541),
(4246, 1, 'lizhongyi', '/admin.php', '114.245.182.224', 1348802387),
(4247, 1, 'lizhongyi', '/admin.php', '114.245.182.224', 1348802390),
(4248, 1, 'lizhongyi', '/admin.php', '114.245.182.224', 1348802396),
(4249, 1, 'lizhongyi', '/admin.php/Module/index.html', '114.245.182.224', 1348802403),
(4250, 1, 'lizhongyi', '/admin.php/Config/index.html', '114.245.182.224', 1348802415),
(4251, 1, 'lizhongyi', '/admin.php/Config/doModify.html (编辑系统配置)', '114.245.182.224', 1348802423),
(4252, 1, 'lizhongyi', '/admin.php/Config/', '114.245.182.224', 1348802436),
(4253, 1, 'lizhongyi', '/admin.php', '114.245.196.238', 1350009096),
(4254, 1, 'lizhongyi', '/admin.php/Menu/index.html', '114.245.196.238', 1350009106),
(4255, 1, 'lizhongyi', '/admin.php/Category/index.html', '114.245.196.238', 1350009116),
(4256, 1, 'lizhongyi', '/admin.php/Menu/index.html', '114.245.196.238', 1350009120),
(4257, 1, 'lizhongyi', '/admin.php/Category/index.html', '114.245.196.238', 1350009122),
(4258, 1, 'lizhongyi', '/admin.php', '61.149.70.59', 1350455468),
(4259, 1, 'lizhongyi', '/admin.php', '61.149.70.59', 1350455537),
(4260, 1, 'lizhongyi', '/admin.php', '61.149.70.59', 1350455538),
(4261, 1, 'lizhongyi', '/admin.php/Menu/index.html', '61.149.70.59', 1350455542),
(4262, 1, 'lizhongyi', '/admin.php/Menu/index.html', '61.149.70.59', 1350455560),
(4263, 1, 'lizhongyi', '/admin.php/Menu/doCommand.html (批量更新: 49,48 影响 2 条记录)', '61.149.70.59', 1350455565),
(4264, 1, 'lizhongyi', '/admin.php/Menu/', '61.149.70.59', 1350455573),
(4265, 1, 'lizhongyi', '/admin.php/Category/index.html', '61.149.70.59', 1350455737),
(4266, 1, 'lizhongyi', '/admin.php/Menu/index.html', '61.149.70.59', 1350455744),
(4267, 1, 'lizhongyi', '/admin.php/Menu/index.html', '61.149.70.59', 1350455753),
(4268, 1, 'lizhongyi', '/admin.php/Category/index.html', '61.149.70.59', 1350455755),
(4269, 1, 'lizhongyi', '/admin.php/Theme/index.html', '61.149.70.59', 1350456493),
(4270, 1, 'lizhongyi', '/admin.php/Module/index.html', '61.149.70.59', 1350456497),
(4271, 1, 'lizhongyi', '/admin.php/Theme/index.html', '61.149.70.59', 1350456517),
(4272, 1, 'lizhongyi', '/admin.php/Theme/', '61.149.70.59', 1350456796),
(4273, 1, 'lizhongyi', '/admin.php', '61.149.70.59', 1350457433),
(4274, 1, 'lizhongyi', '/admin.php/Theme/index.html', '61.149.70.59', 1350457965),
(4275, 1, 'lizhongyi', '/admin.php/Theme', '61.149.70.59', 1350457976),
(4276, 1, 'lizhongyi', '/admin.php/Theme', '61.149.70.59', 1350458025),
(4277, 1, 'lizhongyi', '/admin.php/Theme', '61.149.70.59', 1350458049),
(4278, 1, 'lizhongyi', '/admin.php/Index/index.html', '61.149.70.59', 1350458076),
(4279, 1, 'lizhongyi', '/admin.php/Theme/index.html', '61.149.70.59', 1350458080),
(4280, 1, 'lizhongyi', '/admin.php/Theme/', '61.149.70.59', 1350458137),
(4281, 1, 'lizhongyi', '/admin.php/Theme/index', '61.149.70.59', 1350458143),
(4282, 1, 'lizhongyi', '/admin.php/Theme/index.html', '61.149.70.59', 1350458312),
(4283, 1, 'lizhongyi', '/admin.php/Theme/template.html', '61.149.70.59', 1350458382),
(4284, 1, 'lizhongyi', '/admin.php/Theme/doCommand/operate/deleteTemplate/fileName/Li9BcHAvVHBsL2RlZmF1bHQvUGFnZS9hYm91dC5odG1s.html (删除模板:./App/Tpl/default/Page/about.html)', '61.149.70.59', 1350458415),
(4285, 1, 'lizhongyi', '/admin.php/Theme/', '61.149.70.59', 1350458445),
(4286, 1, 'lizhongyi', '/admin.php/Theme/', '61.149.70.59', 1350458450),
(4287, 1, 'lizhongyi', '/admin.php/Theme', '61.149.70.59', 1350458455),
(4288, 1, 'lizhongyi', '/admin.php/Theme/template.html', '61.149.70.59', 1350458465),
(4289, 1, 'lizhongyi', '/admin.php/Module/index.html', '61.149.70.59', 1350458601),
(4290, 1, 'lizhongyi', '/admin.php/Article/index.html', '61.149.70.59', 1350458618),
(4291, 1, 'lizhongyi', '/admin.php/Article/', '61.149.70.59', 1350458644),
(4292, 1, 'lizhongyi', '/admin.php/Article/', '61.149.70.59', 1350458761),
(4293, 1, 'lizhongyi', '/admin.php/Article', '61.149.70.59', 1350459044),
(4294, 1, 'lizhongyi', '/admin.php/Article', '61.149.70.59', 1350459103),
(4295, 1, 'lizhongyi', '/admin.php/Article', '61.149.70.59', 1350459112),
(4296, 1, 'lizhongyi', '/admin.php/Product/index.html', '61.149.70.59', 1350459124),
(4297, 1, 'lizhongyi', '/admin.php/Product', '61.149.70.59', 1350459134),
(4298, 1, 'lizhongyi', '/admin.php/Config/index.html', '61.149.70.59', 1350459141),
(4299, 1, 'lizhongyi', '/admin.php/Module/index.html', '61.149.70.59', 1350459145),
(4300, 1, 'lizhongyi', '/admin.php/Theme/index.html', '61.149.70.59', 1350459147),
(4301, 1, 'lizhongyi', '/admin.php/Theme/template.html', '61.149.70.59', 1350459151),
(4302, 1, 'lizhongyi', '/admin.php/Theme/doCommand/operate/deleteTemplate/fileName/Li9BcHAvVHBsL2RlZmF1bHQvUHJvZHVjdC9pbmRleDEuaHRtbA==.html (删除模板:./App/Tpl/default/Product/index1.html)', '61.149.70.59', 1350459160),
(4303, 1, 'lizhongyi', '/admin.php/Theme/template.html', '61.149.70.59', 1350459164),
(4304, 1, 'lizhongyi', '/admin.php/Config/index.html', '61.149.70.59', 1350459380),
(4305, 1, 'lizhongyi', '/admin.php/Theme/', '61.149.70.59', 1350459819),
(4306, 1, 'lizhongyi', '/admin.php', '61.149.70.59', 1350471213),
(4307, 1, 'lizhongyi', '/admin.php/Menu/index.html', '61.149.70.59', 1350471217),
(4308, 1, 'lizhongyi', '/admin.php/Module/index.html', '61.149.70.59', 1350471219),
(4309, 1, 'lizhongyi', '/admin.php/Category/index.html', '61.149.70.59', 1350471222),
(4310, 1, 'lizhongyi', '/admin.php/Menu/index.html', '61.149.70.59', 1350471317),
(4311, 1, 'lizhongyi', '/admin.php', '123.117.1.133', 1350693884),
(4312, 1, 'lizhongyi', '/admin.php/Module/index.html', '123.117.1.133', 1350693888),
(4313, 1, 'lizhongyi', '/admin.php/Config/index.html', '123.117.1.133', 1350693889),
(4314, 1, 'lizhongyi', '/admin.php/Config/doModify.html (编辑系统配置)', '123.117.1.133', 1350693898),
(4315, 1, 'lizhongyi', '/admin.php/Config', '123.117.1.133', 1350693902),
(4316, 1, 'lizhongyi', '/admin.php', '114.245.208.227', 1352359611),
(4317, 1, 'lizhongyi', '/admin.php/Category/index.html', '114.245.208.227', 1352359618),
(4318, 1, 'lizhongyi', '/admin.php/Category/doInsert.html (录入:117)', '114.245.208.227', 1352359629),
(4319, 1, 'lizhongyi', '/admin.php/Category', '114.245.208.227', 1352359632),
(4320, 1, 'lizhongyi', '/admin.php/Category/doInsert.html (录入:118)', '114.245.208.227', 1352359645),
(4321, 1, 'lizhongyi', '/admin.php/Category', '114.245.208.227', 1352359648),
(4322, 1, 'lizhongyi', '/admin.php/Category/doInsert.html (录入:119)', '114.245.208.227', 1352359670),
(4323, 1, 'lizhongyi', '/admin.php/Category', '114.245.208.227', 1352359674),
(4324, 1, 'lizhongyi', '/admin.php', '114.245.211.253', 1352783578),
(4325, 1, 'lizhongyi', '/admin.php/Config/index.html', '114.245.211.253', 1352783580),
(4326, 1, 'lizhongyi', '/admin.php/Config/doModify.html (编辑系统配置)', '114.245.211.253', 1352783603),
(4327, 1, 'lizhongyi', '/admin.php/Config', '114.245.211.253', 1352783606),
(4328, 1, 'lizhongyi', '/admin.php', '114.245.211.253', 1352783628),
(4329, 1, 'lizhongyi', '/admin.php/Config/index.html', '114.245.211.253', 1352783642),
(4330, 1, 'lizhongyi', '/admin.php/Config/doModify.html (编辑系统配置)', '114.245.211.253', 1352783652),
(4331, 1, 'lizhongyi', '/admin.php/Config', '114.245.211.253', 1352783655),
(4332, 1, 'lizhongyi', '/admin.php', '114.245.217.147', 1352970131),
(4333, 1, 'lizhongyi', '/admin.php/Category/index.html', '114.245.217.147', 1352970136),
(4334, 1, 'lizhongyi', '/admin.php/Category/doInsert.html (录入:120)', '114.245.217.147', 1352970164),
(4335, 1, 'lizhongyi', '/admin.php/Category', '114.245.217.147', 1352970167),
(4336, 1, 'lizhongyi', '/admin.php', '119.6.126.117', 1353650581),
(4337, 1, 'lizhongyi', '/admin.php/Module/index.html', '119.6.126.117', 1353650592),
(4338, 1, 'lizhongyi', '/admin.php/Theme/index.html', '119.6.126.117', 1353650593),
(4339, 1, 'lizhongyi', '/admin.php/Module/index.html', '119.6.126.117', 1353650596),
(4340, 1, 'lizhongyi', '/admin.php/Menu/index.html', '119.6.126.117', 1353650601),
(4341, 1, 'lizhongyi', '/admin.php/Category/index.html', '119.6.126.117', 1353650602),
(4342, 1, 'lizhongyi', '/admin.php/Article/index.html', '119.6.126.117', 1353650604),
(4343, 1, 'lizhongyi', '/admin.php/Product/index.html', '119.6.126.117', 1353650605),
(4344, 1, 'lizhongyi', '/admin.php/Download/index.html', '119.6.126.117', 1353650606),
(4345, 1, 'lizhongyi', '/admin.php/Download/index.html', '119.6.126.117', 1353650606),
(4346, 1, 'lizhongyi', '/admin.php/Link/index.html', '119.6.126.117', 1353650608),
(4347, 1, 'lizhongyi', '/admin.php/Ad/index.html', '119.6.126.117', 1353650610),
(4348, 1, 'lizhongyi', '/admin.php/Ad/index.html', '119.6.126.117', 1353650610),
(4349, 1, 'lizhongyi', '/admin.php/Page/index.html', '119.6.126.117', 1353650613),
(4350, 1, 'lizhongyi', '/admin.php/Ad/index.html', '119.6.126.117', 1353650615),
(4351, 1, 'lizhongyi', '/admin.php/Tools/index.html', '119.6.126.117', 1353650626),
(4352, 1, 'lizhongyi', '/admin.php/', '114.244.183.25', 1354549390),
(4353, 1, 'lizhongyi', '/admin.php/Module/index.html', '114.244.183.25', 1354549399),
(4354, 1, 'lizhongyi', '/admin.php', '114.244.183.25', 1354549527),
(4355, 1, 'lizhongyi', '/admin.php', '114.244.183.25', 1354549528),
(4356, 1, 'lizhongyi', '/admin.php', '114.244.183.25', 1354549529),
(4357, 1, 'lizhongyi', '/admin.php/Module/index.html', '114.244.183.25', 1354549534),
(4358, 1, 'lizhongyi', '/admin.php/Module/doModify.html', '114.244.183.25', 1354549542),
(4359, 1, 'lizhongyi', '/admin.php/Module', '114.244.183.25', 1354549545),
(4360, 1, 'lizhongyi', '/admin.php', '114.245.215.178', 1354616945),
(4361, 1, 'lizhongyi', '/admin.php', '114.245.215.178', 1354617012),
(4362, 1, 'lizhongyi', '/admin.php/Module/index.html', '114.245.215.178', 1354617023),
(4363, 1, 'lizhongyi', '/admin.php/Tools/index.html', '114.245.215.178', 1354617042),
(4364, 1, 'lizhongyi', '/admin.php/Tools/doCache.html (更新缓存)', '114.245.215.178', 1354617045),
(4365, 1, 'lizhongyi', '/admin.php/Config/index.html', '114.245.215.178', 1354617048),
(4366, 1, 'lizhongyi', '/admin.php/Module/index.html', '114.245.215.178', 1354617050),
(4367, 1, 'lizhongyi', '/admin.php', '114.245.215.178', 1354619724),
(4368, 1, 'lizhongyi', '/admin.php/Article/index.html', '114.245.215.178', 1354619729),
(4369, 1, 'lizhongyi', '/admin.php/Article/doInsert.html (录入:841)', '114.245.215.178', 1354619764),
(4370, 1, 'lizhongyi', '/admin.php?m=Article', '114.245.215.178', 1354619768),
(4371, 1, 'lizhongyi', '/admin.php', '114.245.206.188', 1359694848),
(4372, 1, 'lizhongyi', '/admin.php/Category/index.html', '114.245.206.188', 1359694853),
(4373, 1, 'lizhongyi', '/admin.php/Article/index.html', '114.245.206.188', 1359694854),
(4374, 1, 'lizhongyi', '/admin.php/Article/index.html', '114.245.206.188', 1359694929),
(4375, 1, 'lizhongyi', '/admin.php', '114.245.208.19', 1359945483),
(4376, 1, 'lizhongyi', '/admin.php/Category/index.html', '114.245.208.19', 1359945546),
(4377, 1, 'lizhongyi', '/admin.php', '114.245.208.19', 1359946159),
(4378, 1, 'lizhongyi', '/admin.php/Category/index.html', '114.245.208.19', 1359946161),
(4379, 1, 'lizhongyi', '/admin.php/Database/index.html', '114.245.208.19', 1359946163),
(4380, 1, 'lizhongyi', '/admin.php/Article/index.html', '114.245.208.19', 1359946182),
(4381, 1, 'lizhongyi', '/admin.php', '114.245.223.51', 1361935729),
(4382, 1, 'lizhongyi', '/admin.php/Admin/index.html', '114.245.223.51', 1361935734),
(4383, 1, 'lizhongyi', '/admin.php/AdminRole/index.html', '114.245.223.51', 1361935737),
(4384, 1, 'lizhongyi', '/admin.php/Admin/index.html', '114.245.223.51', 1361935763),
(4385, 1, 'lizhongyi', '/admin.php', '117.79.232.165', 1361968685),
(4386, 1, 'lizhongyi', '/admin.php/Config/index.html', '117.79.232.165', 1361968692),
(4387, 1, 'lizhongyi', '/admin.php', '61.51.77.100', 1363159672),
(4388, 1, 'lizhongyi', '/admin.php/Article/index.html', '61.51.77.100', 1363159676),
(4389, 1, 'lizhongyi', '/admin.php', '114.245.202.92', 1363679299),
(4390, 1, 'lizhongyi', '/admin.php/AdminRole/index.html', '114.245.202.92', 1363679304),
(4391, 1, 'lizhongyi', '/admin.php', '114.245.200.207', 1368782533),
(4392, 1, 'lizhongyi', '/admin.php/Category/index.html', '114.245.200.207', 1368782535),
(4393, 1, 'lizhongyi', '/admin.php/Article/index.html', '114.245.200.207', 1368782538),
(4394, 1, 'lizhongyi', '/admin.php', '114.245.200.207', 1368788014),
(4395, 1, 'lizhongyi', '/admin.php/Article/index.html', '114.245.200.207', 1368788032),
(4396, 1, 'lizhongyi', '/admin.php', '61.149.213.51', 1368857484),
(4397, 1, 'lizhongyi', '/admin.php/Category/index.html', '61.149.213.51', 1368857485),
(4398, 1, 'lizhongyi', '/admin.php', '61.149.213.51', 1368864718),
(4399, 1, 'lizhongyi', '/admin.php/Category/index.html', '61.149.213.51', 1368864720),
(4400, 1, 'lizhongyi', '/admin.php', '61.51.75.100', 1369277516),
(4401, 1, 'lizhongyi', '/admin.php/Category/index.html', '61.51.75.100', 1369277521),
(4402, 1, 'lizhongyi', '/admin.php/Article/index.html', '61.51.75.100', 1369277523),
(4403, 1, 'lizhongyi', '/admin.php/Database/index.html', '61.51.75.100', 1369280517),
(4404, 1, 'lizhongyi', '/admin.php', '114.245.188.59', 1370592581),
(4405, 1, 'lizhongyi', '/admin.php', '61.51.75.216', 1373868082),
(4406, 1, 'lizhongyi', '/admin.php', '221.223.236.164', 1373868346),
(4407, 1, 'lizhongyi', '/admin.php/Menu/index.html', '221.223.236.164', 1373868350),
(4408, 1, 'lizhongyi', '/admin.php/Article/index.html', '221.223.236.164', 1373868354),
(4409, 1, 'lizhongyi', '/admin.php/Theme/index.html', '221.223.236.164', 1373868506),
(4410, 1, 'lizhongyi', '/admin.php/Module/index.html', '221.223.236.164', 1373868510),
(4411, 1, 'lizhongyi', '/admin.php/Article/index.html', '221.223.236.164', 1373868513),
(4412, 1, 'lizhongyi', '/admin.php/Feedback/index.html', '221.223.236.164', 1373868518),
(4413, 1, 'lizhongyi', '/admin.php/Job/index.html', '221.223.236.164', 1373868524),
(4414, 1, 'lizhongyi', '/admin.php', '114.245.194.238', 1381220295),
(4415, 1, 'lizhongyi', '/admin.php', '114.245.194.238', 1381220305),
(4416, 1, 'lizhongyi', '/admin.php', '114.245.194.238', 1381220346),
(4417, 1, 'lizhongyi', '/admin.php/AdminRole/index.html', '114.245.194.238', 1381220349),
(4418, 1, 'lizhongyi', '/admin.php/Theme/index.html', '114.245.194.238', 1381220350),
(4419, 1, 'lizhongyi', '/admin.php/Config/index.html', '114.245.194.238', 1381220351),
(4420, 1, 'lizhongyi', '/admin.php/Theme/index.html', '114.245.194.238', 1381220353),
(4421, 1, 'lizhongyi', '/admin.php/Theme/index.html', '114.245.194.238', 1381220355),
(4422, 1, 'lizhongyi', '/admin.php/Config/index.html', '114.245.194.238', 1381220356),
(4423, 1, 'lizhongyi', '/admin.php/Index/index.html', '114.245.194.238', 1381220356),
(4424, 1, 'lizhongyi', '/admin.php/Index/index.html', '114.245.194.238', 1381220362),
(4425, 1, 'lizhongyi', '/admin.php/Index/index.html', '114.245.194.238', 1381220377),
(4426, 1, 'lizhongyi', '/admin.php/Index/index.html', '114.245.194.238', 1381220378),
(4427, 1, 'lizhongyi', '/admin.php', '114.245.194.238', 1381220385),
(4428, 1, 'lizhongyi', '/admin.php', '114.245.194.238', 1381220388),
(4429, 1, 'lizhongyi', '/admin.php', '114.245.194.238', 1381220395),
(4430, 1, 'lizhongyi', '/admin.php/Config/index.html', '114.245.194.238', 1381220396),
(4431, 1, 'lizhongyi', '/admin.php/Menu/index.html', '114.245.194.238', 1381220401),
(4432, 1, 'lizhongyi', '/admin.php/Category/index.html', '114.245.194.238', 1381220406),
(4433, 1, 'lizhongyi', '/admin.php/Article/index.html', '114.245.194.238', 1381220408),
(4434, 1, 'lizhongyi', '/admin.php', '61.51.76.27', 1381494439),
(4435, 1, 'lizhongyi', '/admin.php', '114.245.214.248', 1382001835),
(4436, 1, 'lizhongyi', '/admin.php/AdminRole/index.html', '114.245.214.248', 1382001845),
(4437, 1, 'lizhongyi', '/admin.php/Admin/index.html', '114.245.214.248', 1382001847),
(4438, 1, 'lizhongyi', '/admin.php/Theme/index.html', '114.245.214.248', 1382001849),
(4439, 1, 'lizhongyi', '/admin.php/Module/index.html', '114.245.214.248', 1382001850),
(4440, 1, 'lizhongyi', '/admin.php/Config/index.html', '114.245.214.248', 1382001852);
INSERT INTO `yge_admin_log` (`id`, `user_id`, `username`, `action`, `ip`, `create_time`) VALUES
(4441, 1, 'lizhongyi', '/admin.php/Index/index.html', '114.245.214.248', 1382001854),
(4442, 1, 'lizhongyi', '/admin.php/Config/index.html', '114.245.214.248', 1382001855),
(4443, 1, 'lizhongyi', '/admin.php/AdminLog/index.html', '114.245.214.248', 1382001863),
(4444, 1, 'lizhongyi', '/admin.php/Page/index.html', '114.245.214.248', 1382001869),
(4445, 1, 'lizhongyi', '/admin.php/Download/index.html', '114.245.214.248', 1382001871),
(4446, 1, 'lizhongyi', '/admin.php', '114.245.214.248', 1382001887),
(4447, 1, 'lizhongyi', '/admin.php/Config/index.html', '114.245.214.248', 1382001890),
(4448, 1, 'lizhongyi', '/admin.php/Config/index.html', '127.0.0.1', 1382251585),
(4449, 1, 'lizhongyi', '/admin.php/Config/index.html', '127.0.0.1', 1382251589),
(4450, 1, 'lizhongyi', '/admin.php/Config/index.html', '127.0.0.1', 1382251654),
(4451, 1, 'lizhongyi', '/admin.php/Product/index.html', '127.0.0.1', 1382251664),
(4452, 1, 'lizhongyi', '/admin.php/Product/doModify.html (编辑:105)', '127.0.0.1', 1382251703),
(4453, 1, 'lizhongyi', '/admin.php/Product/doModify.html (编辑:105)', '127.0.0.1', 1382251738),
(4454, 1, 'lizhongyi', '/admin.php/Product/doModify.html (编辑:105)', '127.0.0.1', 1382251750),
(4455, 1, 'lizhongyi', '/admin.php/Config/index.html', '127.0.0.1', 1382251781),
(4456, 1, 'lizhongyi', '/admin.php/Product/index.html', '127.0.0.1', 1382251826),
(4457, 1, 'lizhongyi', '/admin.php/Product/doModify.html (编辑:105)', '127.0.0.1', 1382251838),
(4458, 1, 'lizhongyi', '/admin.php/Product/index.html', '127.0.0.1', 1382251897),
(4459, 1, 'lizhongyi', '/admin.php/Product/doCommand.html (批量更新: 105,103,102 影响 3 条记录)', '127.0.0.1', 1382251920),
(4460, 1, 'lizhongyi', '/admin.php/Product', '127.0.0.1', 1382251923),
(4461, 1, 'lizhongyi', '/admin.php/Product/doModify.html (编辑:103)', '127.0.0.1', 1382251937),
(4462, 1, 'lizhongyi', '/admin.php/Product', '127.0.0.1', 1382251940),
(4463, 1, 'lizhongyi', '/admin.php/Product/doModify.html (编辑:102)', '127.0.0.1', 1382251953),
(4464, 1, 'lizhongyi', '/admin.php/Product', '127.0.0.1', 1382251957),
(4465, 1, 'lizhongyi', '/admin.php/Category/index.html', '127.0.0.1', 1382251969),
(4466, 1, 'lizhongyi', '/admin.php/Category/doCommand.html (删除: 112,120,116,117,118,119,113)', '127.0.0.1', 1382251985),
(4467, 1, 'lizhongyi', '/admin.php/Category/doCommand.html (删除: )', '127.0.0.1', 1382251985),
(4468, 1, 'lizhongyi', '/admin.php/Category/doCommand.html (删除: )', '127.0.0.1', 1382251985),
(4469, 1, 'lizhongyi', '/admin.php/Category/doCommand.html (删除: )', '127.0.0.1', 1382251985),
(4470, 1, 'lizhongyi', '/admin.php/Category/doCommand.html (删除: )', '127.0.0.1', 1382251985),
(4471, 1, 'lizhongyi', '/admin.php/Category/doCommand.html (删除: )', '127.0.0.1', 1382251985),
(4472, 1, 'lizhongyi', '/admin.php/Category/doCommand.html (删除: )', '127.0.0.1', 1382251985),
(4473, 1, 'lizhongyi', '/admin.php/Category', '127.0.0.1', 1382251986),
(4474, 1, 'lizhongyi', '/admin.php/Category/doModify.html (编辑:104)', '127.0.0.1', 1382252010),
(4475, 1, 'lizhongyi', '/admin.php/Category', '127.0.0.1', 1382252014),
(4476, 1, 'lizhongyi', '/admin.php/Product/index.html', '127.0.0.1', 1382252019),
(4477, 1, 'lizhongyi', '/admin.php/Product/doInsert.html (录入:106)', '127.0.0.1', 1382252059),
(4478, 1, 'lizhongyi', '/admin.php?m=Product', '127.0.0.1', 1382252062),
(4479, 1, 'lizhongyi', '/admin.php/Product/doInsert.html (录入:107)', '127.0.0.1', 1382252090),
(4480, 1, 'lizhongyi', '/admin.php?m=Product', '127.0.0.1', 1382252093),
(4481, 1, 'lizhongyi', '/admin.php/Product/doInsert.html (录入:108)', '127.0.0.1', 1382252264),
(4482, 1, 'lizhongyi', '/admin.php?m=Product', '127.0.0.1', 1382252267),
(4483, 1, 'lizhongyi', '/admin.php/Product/doModify.html (编辑:108)', '127.0.0.1', 1382252278),
(4484, 1, 'lizhongyi', '/admin.php/Product', '127.0.0.1', 1382252281),
(4485, 1, 'lizhongyi', '/admin.php/Product', '127.0.0.1', 1382252834),
(4486, 1, 'lizhongyi', '/admin.php/Product/doModify.html (编辑:108)', '127.0.0.1', 1382252855),
(4487, 1, 'lizhongyi', '/admin.php/Product', '127.0.0.1', 1382252858),
(4488, 1, 'lizhongyi', '/admin.php/Product', '127.0.0.1', 1382252910),
(4489, 1, 'lizhongyi', '/admin.php/Product/doModify.html (编辑:108)', '127.0.0.1', 1382252917),
(4490, 1, 'lizhongyi', '/admin.php/Product', '127.0.0.1', 1382252920),
(4491, 1, 'lizhongyi', '/admin.php/Article/index.html', '127.0.0.1', 1382253026),
(4492, 1, 'lizhongyi', '/admin.php/Article/', '127.0.0.1', 1382253039),
(4493, 1, 'lizhongyi', '/admin.php/Article/doModify.html (编辑:841)', '127.0.0.1', 1382253064),
(4494, 1, 'lizhongyi', '/admin.php/Article', '127.0.0.1', 1382253067),
(4495, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1382254637),
(4496, 1, 'lizhongyi', '/admin.php/Article/index.html', '127.0.0.1', 1382254641),
(4497, 1, 'lizhongyi', '/admin.php/Article', '127.0.0.1', 1382254752),
(4498, 1, 'lizhongyi', '/admin.php/Article', '127.0.0.1', 1382254754),
(4499, 1, 'lizhongyi', '/admin.php/Article', '127.0.0.1', 1382254763),
(4500, 1, 'lizhongyi', '/admin.php/Article/index.html', '127.0.0.1', 1382254942),
(4501, 1, 'lizhongyi', '/admin.php/Product/index.html', '127.0.0.1', 1382254952),
(4502, 1, 'lizhongyi', '/admin.php/Product/index.html', '127.0.0.1', 1382255013),
(4503, 1, 'lizhongyi', '/admin.php/Product/index.html', '127.0.0.1', 1382255015),
(4504, 1, 'lizhongyi', '/admin.php/Article/index.html', '127.0.0.1', 1382255016),
(4505, 1, 'lizhongyi', '/admin.php/Article/index.html', '127.0.0.1', 1382255029),
(4506, 1, 'lizhongyi', '/admin.php/Article/doModify.html (编辑:841)', '127.0.0.1', 1382255043),
(4507, 1, 'lizhongyi', '/admin.php/Article', '127.0.0.1', 1382255047),
(4508, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1382255150),
(4509, 1, 'lizhongyi', '/admin.php/Article/index.html', '127.0.0.1', 1382255155),
(4510, 1, 'lizhongyi', '/admin.php/Article/doModify.html (编辑:841)', '127.0.0.1', 1382255163),
(4511, 1, 'lizhongyi', '/admin.php/Article', '127.0.0.1', 1382255167),
(4512, 1, 'lizhongyi', '/admin.php/Article/doModify.html (编辑:841)', '127.0.0.1', 1382255205),
(4513, 1, 'lizhongyi', '/admin.php/Article', '127.0.0.1', 1382255208),
(4514, 1, 'lizhongyi', '/admin.php/Product/index.html', '127.0.0.1', 1382255228),
(4515, 1, 'lizhongyi', '/admin.php/Product/doModify.html (编辑:108)', '127.0.0.1', 1382255242),
(4516, 1, 'lizhongyi', '/admin.php/Product', '127.0.0.1', 1382255245),
(4517, 1, 'lizhongyi', '/admin.php/Config/index.html', '127.0.0.1', 1382255480),
(4518, 1, 'lizhongyi', '/admin.php/Product/index.html', '127.0.0.1', 1382255485),
(4519, 1, 'lizhongyi', '/admin.php/Product/doModify.html (编辑:108)', '127.0.0.1', 1382255493),
(4520, 1, 'lizhongyi', '/admin.php/', '127.0.0.1', 1382255496),
(4521, 1, 'lizhongyi', '/admin.php/Product/index.html', '127.0.0.1', 1382255499),
(4522, 1, 'lizhongyi', '/admin.php/Product/doModify.html (编辑:107)', '127.0.0.1', 1382255521),
(4523, 1, 'lizhongyi', '/admin.php/Config/index.html', '127.0.0.1', 1382255575),
(4524, 1, 'lizhongyi', '/admin.php/Product/index.html', '127.0.0.1', 1382255600),
(4525, 1, 'lizhongyi', '/admin.php/Product/doModify.html (编辑:106)', '127.0.0.1', 1382255610),
(4526, 1, 'lizhongyi', '/admin.php/Product', '127.0.0.1', 1382255613),
(4527, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1382256008),
(4528, 1, 'lizhongyi', '/admin.php/Product/index.html', '127.0.0.1', 1382256011),
(4529, 1, 'lizhongyi', '/admin.php/Product/doModify.html (编辑:105)', '127.0.0.1', 1382256020),
(4530, 1, 'lizhongyi', '/admin.php/Product', '127.0.0.1', 1382256023),
(4531, 1, 'lizhongyi', '/admin.php', '127.0.0.1', 1382261991),
(4532, 1, 'lizhongyi', '/admin.php/Category/index.html', '127.0.0.1', 1382262012),
(4533, 1, 'lizhongyi', '/admin.php/Category/doCommand.html (删除: 111,114,110)', '127.0.0.1', 1382262035),
(4534, 1, 'lizhongyi', '/admin.php/Category/doCommand.html (删除: )', '127.0.0.1', 1382262035),
(4535, 1, 'lizhongyi', '/admin.php/Category/doCommand.html (删除: )', '127.0.0.1', 1382262035),
(4536, 1, 'lizhongyi', '/admin.php/Category', '127.0.0.1', 1382262037),
(4537, 1, 'lizhongyi', '/admin.php/Category/doModify.html (编辑:98)', '127.0.0.1', 1382262069),
(4538, 1, 'lizhongyi', '/admin.php/Category', '127.0.0.1', 1382262072),
(4539, 1, 'lizhongyi', '/admin.php/Category/doModify.html (编辑:2)', '127.0.0.1', 1382262086),
(4540, 1, 'lizhongyi', '/admin.php/Category', '127.0.0.1', 1382262089),
(4541, 1, 'lizhongyi', '/admin.php/Category/doModify.html (编辑:2)', '127.0.0.1', 1382262102),
(4542, 1, 'lizhongyi', '/admin.php/Category', '127.0.0.1', 1382262106),
(4543, 1, 'lizhongyi', '/admin.php/Category/doModify.html (编辑:2)', '127.0.0.1', 1382262122),
(4544, 1, 'lizhongyi', '/admin.php/Category', '127.0.0.1', 1382262125),
(4545, 1, 'lizhongyi', '/admin.php/Category/doInsert.html (录入:121)', '127.0.0.1', 1382262138),
(4546, 1, 'lizhongyi', '/admin.php/Category', '127.0.0.1', 1382262141),
(4547, 1, 'lizhongyi', '/admin.php/Category/doInsert.html (录入:122)', '127.0.0.1', 1382266166),
(4548, 1, 'lizhongyi', '/admin.php/Category', '127.0.0.1', 1382266169),
(4549, 1, 'lizhongyi', '/admin.php/Category/doInsert.html (录入:123)', '127.0.0.1', 1382266187),
(4550, 1, 'lizhongyi', '/admin.php/Category', '127.0.0.1', 1382266190),
(4551, 1, 'lizhongyi', '/admin.php/Category/doInsert.html (录入:124)', '127.0.0.1', 1382266204),
(4552, 1, 'lizhongyi', '/admin.php/Category', '127.0.0.1', 1382266207),
(4553, 1, 'lizhongyi', '/admin.php/Page/index.html', '127.0.0.1', 1382266210),
(4554, 1, 'lizhongyi', '/admin.php/Menu/index.html', '127.0.0.1', 1382266237),
(4555, 1, 'lizhongyi', '/admin.php/Category/index.html', '127.0.0.1', 1382266239),
(4556, 1, 'lizhongyi', '/admin.php/Page/index.html', '127.0.0.1', 1382266253),
(4557, 1, 'lizhongyi', '/admin.php/Page/doInsert.html (提交录入:28)', '127.0.0.1', 1382266321),
(4558, 1, 'lizhongyi', '/admin.php/Page', '127.0.0.1', 1382266324),
(4559, 1, 'lizhongyi', '/admin.php/Page/doModify.html (编辑:27)', '127.0.0.1', 1382266359),
(4560, 1, 'lizhongyi', '/admin.php/Page', '127.0.0.1', 1382266362),
(4561, 1, 'lizhongyi', '/admin.php/Page/doInsert.html (提交录入:29)', '127.0.0.1', 1382266388),
(4562, 1, 'lizhongyi', '/admin.php/Page', '127.0.0.1', 1382266391),
(4563, 1, 'lizhongyi', '/admin.php/Page', '127.0.0.1', 1382266400),
(4564, 1, 'lizhongyi', '/admin.php/Page/doInsert.html (提交录入:30)', '127.0.0.1', 1382266425),
(4565, 1, 'lizhongyi', '/admin.php/Page', '127.0.0.1', 1382266428),
(4566, 1, 'lizhongyi', '/admin.php/Page/doInsert.html (提交录入:31)', '127.0.0.1', 1382266453),
(4567, 1, 'lizhongyi', '/admin.php/Page', '127.0.0.1', 1382266456),
(4568, 1, 'lizhongyi', '/admin.php/Page/doInsert.html (提交录入:32)', '127.0.0.1', 1382266504),
(4569, 1, 'lizhongyi', '/admin.php/Page', '127.0.0.1', 1382266507),
(4570, 1, 'lizhongyi', '/admin.php/Page/doInsert.html (提交录入:33)', '127.0.0.1', 1382266530),
(4571, 1, 'lizhongyi', '/admin.php/Page', '127.0.0.1', 1382266533),
(4572, 1, 'lizhongyi', '/admin.php/Category/index.html', '127.0.0.1', 1382266727),
(4573, 1, 'lizhongyi', '/admin.php/Article/index.html', '127.0.0.1', 1382267521),
(4574, 1, 'lizhongyi', '/admin.php/Page/index.html', '127.0.0.1', 1382267525);

-- --------------------------------------------------------

--
-- 表的结构 `yge_admin_role`
--

CREATE TABLE IF NOT EXISTS `yge_admin_role` (
  `id` tinyint(1) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) NOT NULL DEFAULT 'all' COMMENT '名称',
  `role_permission` text NOT NULL COMMENT '权限',
  `system` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '系统内置',
  `create_time` int(11) unsigned NOT NULL COMMENT '增加时间',
  `update_time` int(11) unsigned NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='管理员角色' AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `yge_admin_role`
--

INSERT INTO `yge_admin_role` (`id`, `role_name`, `role_permission`, `system`, `create_time`, `update_time`) VALUES
(1, '超级管理', 'Menu_index,Menu_insert,Menu_modify,Menu_command,Category_index,Category_modify,Category_update,Aticle_index,Aticle_modify,Aticle_insert,Aticle_move,Aticle_command,Product_index,Product_insert,Product_modify,Product_command,Product_order,Product_move,Download_index,Download_insert,Download_modify,Download_command,Download_move,Feedback_index,Feedback_insert,Feedback_modify,Feedback_command,Job_index,Job_insert,Job_modify,Job_resume,Job_command,Notice_index,Notice_insert,Notice_modify,Notice_command,Link_index,Link_insert,Link_modify,Link_command,Page_index,Page_insert,Page_modify,Page_command,Ad_index,Ad_insert,Ad_modify,Ad_command,Tags,Comment_index,Comment_modify,Comment_command,Admin_index,Admin_insert,Admin_modify,Admin_command,Template,AdminRole_index,AdminRole_insert,AdminRole_modify,AdminRole_command', 1, 0, 0),
(2, '禁止访问', 'disable', 1, 0, 0),
(3, '普通管理', 'Menu_index,Menu_insert,Menu_modify,Menu_command,Category_index,Category_modify,Aticle_index,Aticle_modify,Aticle_insert,Aticle_move,Aticle_command,Product_index,Product_insert,Product_modify,Product_command,Product_order,Product_move,Download_index,Download_insert,Download_modify,Download_command,Download_move,Feedback_index,Feedback_insert,Feedback_modify,Feedback_command,Job_index,Job_insert,Job_modify,Job_resume,Job_command,Notice_index,Notice_insert,Notice_modify,Notice_command,Link_index,Link_insert,Link_modify,Link_command,Page_index,Page_insert,Page_modify,Page_command,Ad_index,Ad_insert,Ad_modify,Ad_command,Tags,Comment_index,Comment_modify,Comment_command,Admin_index,Admin_insert,Admin_modify,Admin_command,Theme,AdminRole_index,AdminRole_insert,AdminRole_modify,AdminRole_command,Module_index,Module_install,Config_index,Config_core,Database_index,Database_export,AdminLog,Tools,Label', 1, 0, 1263392210);

-- --------------------------------------------------------

--
-- 表的结构 `yge_article`
--

CREATE TABLE IF NOT EXISTS `yge_article` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '类别',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(100) NOT NULL DEFAULT '' COMMENT '发布用户名',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `title_style` varchar(255) NOT NULL DEFAULT '' COMMENT '标题样式',
  `title_style_serialize` varchar(255) NOT NULL COMMENT '标题样式序列化',
  `keyword` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `copy_from` varchar(255) NOT NULL DEFAULT '' COMMENT '来源',
  `from_link` varchar(255) NOT NULL DEFAULT '0' COMMENT '来源链接 ',
  `link_url` varchar(255) NOT NULL DEFAULT '' COMMENT '外链地址',
  `html_url` varchar(255) NOT NULL,
  `description` text NOT NULL COMMENT '简单描述',
  `content` mediumtext NOT NULL COMMENT '内容',
  `tags` varchar(255) NOT NULL COMMENT 'tags',
  `template` varchar(100) NOT NULL COMMENT '模板文件',
  `attach` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '附件',
  `attach_image` varchar(100) NOT NULL DEFAULT '' COMMENT '图片',
  `attach_thumb` varchar(100) NOT NULL DEFAULT '' COMMENT '缩略图',
  `istop` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '置顶',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `recommend` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '推荐',
  `display_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `view_count` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '查看次数',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='新闻' AUTO_INCREMENT=842 ;

--
-- 转存表中的数据 `yge_article`
--

INSERT INTO `yge_article` (`id`, `category_id`, `user_id`, `username`, `title`, `title_style`, `title_style_serialize`, `keyword`, `copy_from`, `from_link`, `link_url`, `html_url`, `description`, `content`, `tags`, `template`, `attach`, `attach_image`, `attach_thumb`, `istop`, `status`, `recommend`, `display_order`, `view_count`, `create_time`, `update_time`) VALUES
(833, 98, 1, 'lizhongyi', '没定义请留空，默认为 detail 不需要填写.htmladadsa', '', '', '', '', '', '', 'html/Article/meitijujiao/201204/833.html', '', 'asdasdasdadsewr wew rwe rwe r', '', '', 0, '', '', 0, 0, 0, 0, 402, 1333296000, 0),
(835, 98, 1, 'lizhongyi', '无二玩儿玩儿无二为二位肉味儿', '', '', '', '', '', '', 'html/Article/meitijujiao/201204/835.html', '无二', '<div style="margin-left:0px;font-size:14px;color:#333333;font-family:Verdana, Arial, Tahoma;background-color:#FFFFFF;">\r\n	<table width="100%">\r\n		<tbody>\r\n			<tr>\r\n				<td>\r\n					<style="text-align:left" style="padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">\r\n					<p style="text-align:center;">\r\n						<a target="_blank" href="http://down.qiannao.com/space/file/ylws/2012-8001-6881-770b-7535-5f71/20120830-300a-4fdd-9556-300b-8ffd-5fc6-66fe-7ecf-7684-5929-7c41-4e4b-97f3.mp3/.page">点这里下载本期音频（标准MP3格式）</a>\r\n					</p>\r\n					<div align="center" style="margin-left:0px;">\r\n						&nbsp;\r\n					</div>\r\n					<div align="center" style="margin-left:0px;">\r\n						<embed height="500" width="640" src="http://173.254.199.124/wlds/player/youku.swf?VideoIDS=XNDQ1MDc4MTQ0&amp;isAutoPlay=false&amp;isDebug=false&amp;UserID=&amp;winType=interior&amp;playMovie=true&amp;MMControl=false&amp;MMout=false&amp;" type="application/x-shockwave-flash" quality="high" autostart="true" allowscriptaccess="never" />\r\n					</div>\r\n					<p style="text-align:center;">\r\n						&nbsp;\r\n					</p>\r\n</style="text-align:left">\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					<align="center" style="padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; "></align="center">\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					<style="text-align:left" style="padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">责任编辑：月落无声网</style="text-align:left">\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					<style="text-align:left" style="padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">分享到：</style="text-align:left">\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					<div style="margin-left:0px;text-align:left !important;">\r\n						<a href="http://173.254.199.124/a/llkdy/2012gsws/2012/0831/5101.html#"></a><a href="http://173.254.199.124/a/llkdy/2012gsws/2012/0831/5101.html#"></a><a href="http://173.254.199.124/a/llkdy/2012gsws/2012/0831/5101.html#"></a><a href="http://173.254.199.124/a/llkdy/2012gsws/2012/0831/5101.html#"></a><a href="http://173.254.199.124/a/llkdy/2012gsws/2012/0831/5101.html#"></a><a href="http://173.254.199.124/a/llkdy/2012gsws/2012/0831/5101.html#"></a><a href="http://173.254.199.124/a/llkdy/2012gsws/2012/0831/5101.html#"></a><a href="http://173.254.199.124/a/llkdy/2012gsws/2012/0831/5101.html#"></a><a href="http://173.254.199.124/a/llkdy/2012gsws/2012/0831/5101.html#"></a><a href="http://173.254.199.124/a/llkdy/2012gsws/2012/0831/5101.html#"></a><a href="http://173.254.199.124/a/llkdy/2012gsws/2012/0831/5101.html#"></a><a href="http://173.254.199.124/a/llkdy/2012gsws/2012/0831/5101.html#"></a><a href="http://173.254.199.124/a/llkdy/2012gsws/2012/0831/5101.html#"></a><a href="http://173.254.199.124/a/llkdy/2012gsws/2012/0831/5101.html#"></a><span style="background-color:initial !important;font-family:瀹嬩綋, Arial;">更多</span><a href="http://173.254.199.124/a/llkdy/2012gsws/2012/0831/5101.html#">5</a>\r\n					</div>\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div style="margin-left:0px;text-align:center;font-family:Verdana, Arial, Tahoma;background-color:#FFFFFF;">\r\n	<ul style="margin-left:auto;">\r\n	</ul>\r\n</div>\r\n<div style="margin-left:auto;font-family:Verdana, Arial, Tahoma;background-color:#FFFFFF;">\r\n	<div style="margin-left:0px;background-color:initial;">\r\n		<div style="margin-left:0px;font-size:14px;font-weight:bold;color:#CC3300;">\r\n			顶一下\r\n		</div>\r\n		<div style="margin-left:0px;color:#CC6633;">\r\n			(62)\r\n		</div>\r\n		<div style="margin-left:0px;">\r\n			<div style="margin-left:0px;background-color:#E8E8E8;">\r\n				<span style="background-color:#FFC535;"></span>\r\n			</div>\r\n			<div style="margin-left:0px;font-size:10px;">\r\n				100.00%\r\n			</div>\r\n		</div>\r\n	</div>\r\n	<div style="margin-left:0px;background-color:initial;">\r\n		<div style="margin-left:0px;font-size:14px;font-weight:bold;color:#3366CC;">\r\n			踩一下\r\n		</div>\r\n		<div style="margin-left:0px;color:#3399CC;">\r\n			(0)\r\n		</div>\r\n		<div style="margin-left:0px;">\r\n			<div style="margin-left:0px;background-color:#E8E8E8;">\r\n				<span style="background-color:#94C0E4;"></span>\r\n			</div>\r\n			<div style="margin-left:0px;font-size:10px;">\r\n				0.00%\r\n			</div>\r\n		</div>\r\n	</div>\r\n</div>\r\n<div style="margin-left:auto;background-color:#FFFFFF;font-family:Verdana, Arial, Tahoma;">\r\n	h\r\n</div>', '', '', 0, '', '', 0, 0, 0, 0, 332, 1333296000, 1336052782),
(838, 98, 1, 'lizhongyi', '阿斯达阿斯达阿斯达', '', '', '', '', '', '', 'html/Article/meitijujiao/201204/838.html', '阿斯达阿斯达', '阿斯达阿斯达按时大大', '', '', 0, '', '', 0, 0, 0, 0, 6592, 1333382400, 0),
(839, 98, 1, 'lizhongyi', '阿斯达阿斯达敖德萨撒旦', '', '', '', '', '', '', 'html/Article/meitijujiao/201204/839.html', '', '敖德萨阿斯达阿四大四大阿萨德撒的', '', '', 0, '', '', 0, 0, 0, 0, 968, 1333382400, 0),
(841, 98, 1, 'lizhongyi', '四平青年', '', '', '', '', '', '', '', 'asdasdasdasdasdasd', '阿四大说的敖德萨asas asd ', '', '', 1, '/Article/201310/m_52638a657a067.jpg', '/Article/201310/s_52638a657a067.jpg', 0, 0, 0, 0, 3643, 1354550400, 1382255205);

-- --------------------------------------------------------

--
-- 表的结构 `yge_category`
--

CREATE TABLE IF NOT EXISTS `yge_category` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `module` char(20) NOT NULL DEFAULT 'N/A' COMMENT '模块',
  `parent_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '上级目录',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '名称',
  `biaozhi` varchar(50) NOT NULL COMMENT '分类标志',
  `html_url` varchar(255) NOT NULL,
  `menu` int(2) NOT NULL DEFAULT '0',
  `keyword` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `display_order` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `protected` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否保护',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '录入时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `displayorder` (`display_order`),
  KEY `parentid` (`parent_id`),
  FULLTEXT KEY `biaozhi` (`biaozhi`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='全局分类' AUTO_INCREMENT=125 ;

--
-- 转存表中的数据 `yge_category`
--

INSERT INTO `yge_category` (`id`, `module`, `parent_id`, `title`, `biaozhi`, `html_url`, `menu`, `keyword`, `description`, `display_order`, `protected`, `status`, `create_time`, `update_time`) VALUES
(2, '', 1, '行业动态', 'hangyedongtai', 'html/Article/gonsixinwen/index.html', 1, '', '公司动态', 0, 0, 0, 1262410927, 1382262122),
(14, 'Download', 0, '下载模块', '', '', 0, '', '下载模块', 0, 0, 0, 1262411171, 1342680191),
(15, '', 14, '系统软件', '', '', 0, '', '系统软件', 1, 0, 0, 1262411182, 1262411190),
(1, 'Article', 0, '文章模块', '', '', 1, '', '', 0, 0, 0, 0, 0),
(17, '', 14, '恢复类软件', '', '', 0, '', '恢复类软件', 0, 0, 0, 1262411216, 0),
(33, '', 32, '首页横幅', '', '', 0, '', '首页横幅', 0, 0, 0, 1267112629, 1267288982),
(32, 'Ad', 0, '广告模块', '', '', 0, '', '广告模块', 0, 0, 0, 1267112377, 1267112406),
(34, '', 32, '公共', '', '', 0, '', '公共', 0, 0, 0, 1267112648, 0),
(35, 'Link', 0, '链接类型', '', '', 0, '', '链接类型', 0, 0, 0, 1267287014, 0),
(36, '', 35, '默认类型', '', '', 0, '', '普通链接', 0, 0, 0, 1267287066, 1267288647),
(104, '', 103, '企业网站', 'qiyewangzhan', 'html/Product/shexiang/index.html', 1, '', '', 0, 0, 0, 1342668413, 1382252010),
(99, '', 72, '公司活动', '', '', 0, '', '', 0, 0, 0, 1324554041, 0),
(103, 'Product', 0, '产品模块', 'Product', '', 1, '', '产品的跟分类', 0, 0, 0, 1342668340, 1344836777),
(98, '', 1, '解决方案', 'jiejuefangan', 'html/Article/meitijujiao/index.html', 1, '', '', 0, 0, 0, 1324552052, 1382262069),
(84, '', 72, '员工天地', '', '', 0, '', '', 0, 0, 0, 1316584975, 1324554013),
(94, '', 93, '企业文化', '', '', 0, '', '', 0, 0, 0, 1316832672, 1324552285),
(121, '', 1, '公司新闻', 'gongsixinwen', '', 0, '', '', 0, 0, 0, 1382262138, 0),
(122, 'Category', 0, '关于我们', 'guanyu', '', 0, '', '', 0, 0, 0, 1382266166, 0),
(123, '', 122, '关于我们', 'guanyu', '', 0, '', '', 0, 0, 0, 1382266187, 0),
(124, '', 122, '服务项目', 'fuwu', '', 0, '', '', 0, 0, 0, 1382266204, 0);

-- --------------------------------------------------------

--
-- 表的结构 `yge_comment`
--

CREATE TABLE IF NOT EXISTS `yge_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` char(20) NOT NULL DEFAULT 'Aticle' COMMENT '模块',
  `title_id` int(11) unsigned NOT NULL COMMENT '文章ID',
  `title` varchar(255) NOT NULL COMMENT '文章标题',
  `username` varchar(20) NOT NULL DEFAULT '' COMMENT '用户',
  `email` varchar(255) NOT NULL COMMENT '邮箱',
  `ip` char(15) NOT NULL DEFAULT '' COMMENT 'ip',
  `content` text NOT NULL COMMENT '评论内容',
  `reply_content` text NOT NULL COMMENT '评论回复',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '提交时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='评论' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `yge_comment`
--

INSERT INTO `yge_comment` (`id`, `module`, `title_id`, `title`, `username`, `email`, `ip`, `content`, `reply_content`, `status`, `create_time`, `update_time`) VALUES
(1, 'Aticle', 9, '', 'ooooo', 'ooo', '192.168.1.222', 'ooooo', '', 1, 1312182344, 0);

-- --------------------------------------------------------

--
-- 表的结构 `yge_config`
--

CREATE TABLE IF NOT EXISTS `yge_config` (
  `id` tinyint(1) unsigned NOT NULL AUTO_INCREMENT,
  `lang` char(20) NOT NULL DEFAULT 'cn' COMMENT '语言',
  `site_name` varchar(100) NOT NULL COMMENT '网站名称',
  `company_name` varchar(200) NOT NULL COMMENT '公司名称',
  `site_url` varchar(200) NOT NULL COMMENT '网站地址',
  `contact_name` varchar(50) NOT NULL COMMENT '联系人',
  `telephone` varchar(50) NOT NULL COMMENT '电话',
  `email` varchar(100) NOT NULL COMMENT 'email',
  `fax` varchar(50) NOT NULL COMMENT '传真',
  `mobile_telephone` varchar(50) NOT NULL COMMENT '手机',
  `address` varchar(200) NOT NULL COMMENT '地址',
  `icp` varchar(20) NOT NULL COMMENT 'icp',
  `qq` varchar(50) NOT NULL COMMENT 'qq',
  `msn` varchar(100) NOT NULL COMMENT 'msn',
  `im` varchar(250) NOT NULL COMMENT '即时通讯工具',
  `web_status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '网站状态',
  `status_description` text NOT NULL COMMENT '停止描述',
  `header_content` text NOT NULL COMMENT '头部内容',
  `footer_content` text NOT NULL COMMENT '脚部内容',
  `comment_verify` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否开启留言/评论审核',
  `sys_log` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '系统日志',
  `sys_log_ext` varchar(255) NOT NULL COMMENT '记录日志类型',
  `download_suffix` varchar(255) NOT NULL DEFAULT 'Winndows' COMMENT '下载类型',
  `run_system` varchar(255) NOT NULL COMMENT '运行平台',
  `global_thumb_status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '缩略图开关',
  `watermark_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '水印开关',
  `watermark_size` varchar(50) NOT NULL COMMENT '水印尺寸',
  `watermark_position` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '水印位置',
  `watermark_padding` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '水印边距',
  `watermark_trans` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '水印透明度',
  `global_attach_size` int(10) unsigned NOT NULL DEFAULT '2048000' COMMENT '附件大小',
  `global_attach_suffix` varchar(200) NOT NULL COMMENT '允许附件类型',
  `Aticle_thumb_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '新闻缩略图状态',
  `Aticle_thumb_size` varchar(50) NOT NULL COMMENT '新闻缩略图高',
  `product_thumb_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '产品缩略图开关',
  `product_thumb_size` varchar(50) NOT NULL COMMENT '产品缩略图高',
  `download_thumb_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '下载缩略图开关',
  `download_thumb_size` varchar(50) NOT NULL COMMENT '下载缩略图高',
  `global_thumb_size` varchar(50) NOT NULL COMMENT '全局缩略图 尺寸',
  `seo_title` varchar(200) NOT NULL,
  `seo_keyword` varchar(240) NOT NULL,
  `seo_description` varchar(240) NOT NULL,
  `smtpserver` varchar(50) NOT NULL,
  `smtpport` smallint(4) NOT NULL,
  `smtpyz` smallint(1) NOT NULL,
  `smtpmail` varchar(50) NOT NULL,
  `smtpuser` varchar(50) NOT NULL,
  `smtppass` varchar(50) NOT NULL,
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '提交时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='系统配置' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `yge_config`
--

INSERT INTO `yge_config` (`id`, `lang`, `site_name`, `company_name`, `site_url`, `contact_name`, `telephone`, `email`, `fax`, `mobile_telephone`, `address`, `icp`, `qq`, `msn`, `im`, `web_status`, `status_description`, `header_content`, `footer_content`, `comment_verify`, `sys_log`, `sys_log_ext`, `download_suffix`, `run_system`, `global_thumb_status`, `watermark_status`, `watermark_size`, `watermark_position`, `watermark_padding`, `watermark_trans`, `global_attach_size`, `global_attach_suffix`, `Aticle_thumb_status`, `Aticle_thumb_size`, `product_thumb_status`, `product_thumb_size`, `download_thumb_status`, `download_thumb_size`, `global_thumb_size`, `seo_title`, `seo_keyword`, `seo_description`, `smtpserver`, `smtpport`, `smtpyz`, `smtpmail`, `smtpuser`, `smtppass`, `create_time`, `update_time`) VALUES
(1, 'cn', '一个cms', '一个cms', 'yigcms.com', '', '', '', '', '', '北京市海淀区', '', '', '', '', 0, '', '', '地址：北京市海淀区　\r\n\r\n电话: 010-63971971 　\r\n\r\n手机: 13261285464　', 1, 1, 'index,delete,modify,insert,update,login', 'Winndows', 'window,linux', 1, 0, '500', 0, 0, 0, 3000000, 'jpg,gif,bmp,png,doc,docx,rar,7z,zip,png,swf,xls,pdf,', 0, '', 1, '500,220', 1, '500,220', '500,220', '这是沃我们的网站', '阿萨德均按时大大', '阿斯达啊实打实大的是', 'smtp.qq.com', 25, 1, '165256676@qq.com', '165256676', 'jjj', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `yge_download`
--

CREATE TABLE IF NOT EXISTS `yge_download` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '软件名称',
  `title_style` varchar(255) NOT NULL DEFAULT '' COMMENT '样式',
  `title_style_serialize` varchar(255) NOT NULL COMMENT '样式序列化',
  `category_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '类别',
  `keyword` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `run_system` varchar(255) NOT NULL DEFAULT 'windows' COMMENT '运行系统',
  `extension` varchar(10) NOT NULL DEFAULT 'zip' COMMENT '扩展名',
  `file_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '大小',
  `file_size_unit` char(10) NOT NULL DEFAULT 'KB' COMMENT '大小单位',
  `download_url` text NOT NULL COMMENT '下载地址1',
  `link_url` varchar(100) NOT NULL COMMENT '外链',
  `description` text NOT NULL COMMENT '简单描述',
  `content` text NOT NULL COMMENT '介绍',
  `tags` varchar(255) NOT NULL COMMENT 'tags',
  `template` varchar(100) NOT NULL COMMENT '模板文件',
  `file_attach` varchar(50) NOT NULL DEFAULT '' COMMENT '附件地址',
  `attach` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件',
  `attach_image` varchar(50) NOT NULL DEFAULT '' COMMENT '附件大图',
  `attach_thumb` varchar(50) NOT NULL DEFAULT '' COMMENT '缩略图',
  `view_count` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '查看次数',
  `istop` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '置顶',
  `recommend` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '推荐',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `display_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='下载' AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `yge_download`
--

INSERT INTO `yge_download` (`id`, `user_id`, `title`, `title_style`, `title_style_serialize`, `category_id`, `keyword`, `run_system`, `extension`, `file_size`, `file_size_unit`, `download_url`, `link_url`, `description`, `content`, `tags`, `template`, `file_attach`, `attach`, `attach_image`, `attach_thumb`, `view_count`, `istop`, `recommend`, `status`, `display_order`, `create_time`, `update_time`) VALUES
(1, 1, '泄露个人信息 铁道部坦承是个问题 ', '', '', 15, '', '', 'zip', 0, 'KB', 'test', '', '泄露个人信息 铁道部坦承是个问题 ', '<p style="text-indent: 2em">环球网记者范凌志报道，台湾前&ldquo;副总统&rdquo;吕秀莲本周访问美国华府。她在与美方人士会面时称，美国虽然持续对台军售，但不能忽略台湾&ldquo;自我防卫&rdquo;的需求，应该&ldquo;尽快考虑出售F16C/D型战机&rdquo;。</p>\r\n<p style="text-indent: 2em">据台湾&ldquo;中央社&rdquo;24日消息，吕秀莲此行已与美国国务院、美国在台协会（AIT）官员见面，并拜会了美国多位涉台机构官员。</p>\r\n<p style="text-indent: 2em">吕秀莲称，对于美国政府决定新一波的对台军售，台湾当然&ldquo;很感谢&rdquo;，但&ldquo;遗憾的是F16C/D型战机仍未纳入&rdquo;。美方亲台官员与议员还说，洛克希德马丁公司（LockheedMartin）万一关闭F16生产线，台湾要取得F-35战机将&ldquo;更为困难&rdquo;。</p>\r\n<p style="text-indent: 2em">同时，&ldquo;台湾连线&rdquo;共同主席、共和党籍众议员狄亚士巴拉特（Lincoln Diaz-Balart）等人承诺&ldquo;将发动国会连署&rdquo;要求行政部门尽快决定F16C/D的军售案。</p>\r\n<p style="text-indent: 2em">此前，美联社及路透两大国际通讯社在22日都在台北发布新闻，指根据美国政府最新公布的报告指出，台湾在与大陆进行战斗时，&ldquo;可供作战的战机数量将不敷使用，也凸显台湾空防战力已有&lsquo;不堪一击&rsquo;的危机&rdquo;。</p>\r\n<p style="text-indent: 2em">路透认为，这份报告可能促成美国在肯定触怒北京的情况下，对台提供新的军售，以确保台海情势稳定；美联社则点出，美国防部强烈怀疑：台湾是否拥有足够</p>', '', '', '', 0, '', '', 1, 0, 0, 0, 0, 1266940800, 0),
(2, 1, '广西公务员考试涉嫌试题泄露 已立案调查 ', 'color:#800080;font-weight:bold', 'a:2:{s:5:"color";s:7:"#800080";s:4:"bold";s:4:"bold";}', 15, '', '', 'zip', 0, 'KB', 'http://test.com\r\nhttp://www.sss.com', 'http://www.sss.com', '', '<p style="text-indent: 2em">吕秀莲称，对于美国政府决定新一波的对台军售，台湾当然&ldquo;很感谢&rdquo;，但&ldquo;遗憾的是F16C/D型战机仍未纳入&rdquo;。美方亲台官员与议员还说，洛克希德马丁公司（LockheedMartin）万一关闭F16生产线，台湾要取得F-35战机将&ldquo;更为困难&rdquo;。</p>\r\n<p style="text-indent: 2em">同时，&ldquo;台湾连线&rdquo;共同主席、共和党籍众议员狄亚士巴拉特（Lincoln Diaz-Balart）等人承诺&ldquo;将发动国会连署&rdquo;要求行政部门尽快决定F16C/D的军售案。</p>\r\n<p style="text-indent: 2em">此前，美联社及路透两大国际通讯社在22日都在台北发布新闻，指根据美国政府最新公布的报告指出，台湾在与大陆进行战斗时，&ldquo;可供作战的战机数量将不敷使用，也凸显台湾空防战力已有&lsquo;不堪一击&rsquo;的危机&rdquo;。</p>\r\n<p style="text-indent: 2em">路透认为，这份报告可能促成美国在肯定触怒北京的情况下，对台提供新的军售，以确保台海情势稳定；美联社则点出，美国防部强烈怀疑：台湾是否拥有足够抵御大陆攻击的能力。</p>\r\n<p style="text-indent: 2em">台空军对此表示，美方正在评估台湾采购F-16C/D的可行性，目前台方尚未取得这份报告，因此不便对媒体报道评论。而台当局高层官员则分析称，美国官方刻意将这份报告提供给国际媒体并选在台北发出，是向两岸发出极为明显的政治讯息，可能是为宣布出售F-16C/D给台湾进行&ldquo;暖身铺路&rdquo;，台湾静观这项发展，并&ldquo;将会做好准备&rdquo;。</p>', '了修正,55,aaaxxx', '', '', 0, '', '', 0, 0, 0, 0, 0, 1266940800, 0),
(3, 1, 'fsg', '', '', 17, '', '', 'zip', 0, 'MB', 'fsg', '', 'fasdf', '<p>fsg</p>', 'fsdf', '', '', 1, 'Download/201003/4b910457af736.jpg', 'Download/201003/4b910457af736_s.jpg', 0, 0, 0, 0, 0, 1267718400, 0),
(4, 1, 'asdf', '', '', 15, '', '', 'zip', 0, 'MB', 'asdf', '', '', '<p>fasdf</p>', '', '', '', 1, 'Download/201003/4b91048378829.gif', 'Download/201003/4b91048378829_s.gif', 1, 0, 0, 0, 0, 1267718400, 0),
(5, 1, 'ccc', '', '', 15, '', '', 'zip', 0, 'MB', 'cc', '', '', '<p>cc</p>', '了修正,55,fadsf,hghdf', '', '', 0, '', '', 0, 0, 0, 0, 0, 1267891200, 0);

-- --------------------------------------------------------

--
-- 表的结构 `yge_feedback`
--

CREATE TABLE IF NOT EXISTS `yge_feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT '留言主题',
  `username` varchar(50) NOT NULL COMMENT '留言者',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是为男，否为女',
  `mobile_tel` varchar(20) NOT NULL DEFAULT '' COMMENT '手机',
  `telephone` varchar(50) NOT NULL DEFAULT '' COMMENT '电话',
  `fax` varchar(50) NOT NULL COMMENT '传真',
  `qq` varchar(50) NOT NULL COMMENT 'QQ',
  `email` varchar(50) NOT NULL COMMENT 'email',
  `web_url` varchar(200) NOT NULL DEFAULT '' COMMENT '个人主页',
  `address` varchar(50) NOT NULL DEFAULT '' COMMENT '地址',
  `content` text NOT NULL COMMENT '留言内容',
  `reply_content` text NOT NULL COMMENT '回复内容',
  `status` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `ip` char(15) NOT NULL DEFAULT '0' COMMENT '留言IP',
  `reply_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '回复时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '留言时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='留言' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `yge_feedback`
--

INSERT INTO `yge_feedback` (`id`, `title`, `username`, `sex`, `mobile_tel`, `telephone`, `fax`, `qq`, `email`, `web_url`, `address`, `content`, `reply_content`, `status`, `ip`, `reply_time`, `create_time`, `update_time`) VALUES
(1, 'uikuik', 'uikuik', 1, 'uik', 'uik', 'uiku', 'ikuik', 'kuikuik', 'http://ui', '', 'kikuikuik', '', 1, '192.168.1.222', 0, 1312182324, 0),
(2, '', '大时代', 1, '', '', '', '', '阿斯达爱上', '', '', '阿斯达爱上', '', 1, '114.245.188.59', 0, 1370594647, 0);

-- --------------------------------------------------------

--
-- 表的结构 `yge_idc`
--

CREATE TABLE IF NOT EXISTS `yge_idc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cpu` char(20) NOT NULL,
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(20) NOT NULL COMMENT '发布者',
  `category_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '分类ID',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '产品名称',
  `title_style` varchar(255) NOT NULL DEFAULT '' COMMENT '标题样式',
  `title_style_serialize` varchar(255) NOT NULL COMMENT '标题样式序列化',
  `standard` varchar(50) NOT NULL DEFAULT '' COMMENT '规格',
  `number` varchar(50) NOT NULL DEFAULT '' COMMENT '产品型号',
  `keyword` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `sale_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `market_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '市场价',
  `shop_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商场价',
  `description` text NOT NULL COMMENT '描述',
  `content` text NOT NULL COMMENT '产品说明',
  `tags` varchar(255) NOT NULL COMMENT 'tags',
  `area` char(20) NOT NULL COMMENT '地区',
  `template` varchar(100) NOT NULL COMMENT '模板文件',
  `attach` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否附件 1是0否',
  `attach_image` varchar(100) NOT NULL DEFAULT '' COMMENT '图片',
  `attach_thumb` varchar(100) NOT NULL DEFAULT '' COMMENT '缩略图',
  `link_url` varchar(100) NOT NULL COMMENT '外链接',
  `istop` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '置顶',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否审核',
  `xianlu` int(11) NOT NULL,
  `nianfu` char(20) NOT NULL,
  `yuefu` char(20) NOT NULL,
  `yingpan` char(20) NOT NULL,
  `neicun` varchar(20) NOT NULL,
  `recommend` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `display_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `view_count` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '点击次数',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='产品' AUTO_INCREMENT=20 ;

--
-- 转存表中的数据 `yge_idc`
--

INSERT INTO `yge_idc` (`id`, `cpu`, `user_id`, `username`, `category_id`, `title`, `title_style`, `title_style_serialize`, `standard`, `number`, `keyword`, `sale_price`, `market_price`, `shop_price`, `description`, `content`, `tags`, `area`, `template`, `attach`, `attach_image`, `attach_thumb`, `link_url`, `istop`, `status`, `xianlu`, `nianfu`, `yuefu`, `yingpan`, `neicun`, `recommend`, `display_order`, `view_count`, `create_time`, `update_time`) VALUES
(19, '', 1, 'lizhongyi', 101, '我要录入这些呢', '', '', '', '', '', 0.00, 0.00, 0.00, '', '阿斯大苏打阿萨德', '', '', '', 0, '', '', '', 0, 0, 0, '', '', '', '', 0, 0, 2, 1326297600, 0);

-- --------------------------------------------------------

--
-- 表的结构 `yge_job`
--

CREATE TABLE IF NOT EXISTS `yge_job` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '工作名称或招聘对象',
  `title_style` varchar(255) NOT NULL COMMENT '标题样式',
  `title_style_serialize` varchar(255) NOT NULL COMMENT '标题样式序列化',
  `keyword` varchar(250) NOT NULL COMMENT '关键字',
  `number` int(11) unsigned NOT NULL COMMENT '招聘人数',
  `description` text NOT NULL COMMENT '招聘要求',
  `content` text NOT NULL COMMENT '详细介绍',
  `template` varchar(100) NOT NULL COMMENT '模板文件',
  `tags` varchar(255) NOT NULL COMMENT 'tags',
  `copy_from` varchar(255) NOT NULL COMMENT '来源',
  `from_link` varchar(255) NOT NULL COMMENT '来源链接',
  `link_url` varchar(200) NOT NULL COMMENT '链接地址',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `time_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '招聘时间/1长期2限时',
  `end_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '有效天数',
  `attach_file` varchar(100) NOT NULL DEFAULT '' COMMENT '附件',
  `istop` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '置顶',
  `view_count` mediumint(8) unsigned NOT NULL DEFAULT '1' COMMENT '查看次数',
  `display_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='招聘' AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `yge_job`
--

INSERT INTO `yge_job` (`id`, `user_id`, `title`, `title_style`, `title_style_serialize`, `keyword`, `number`, `description`, `content`, `template`, `tags`, `copy_from`, `from_link`, `link_url`, `status`, `time_type`, `end_time`, `attach_file`, `istop`, `view_count`, `display_order`, `create_time`, `update_time`) VALUES
(8, 1, '招聘人员测试', '', '', '', 0, '招聘人员测试招聘人员测试招聘人员测试招聘人员测试', '<p>女性，已婚，25-45岁，工作地点在开发区，4812军工厂对面。</p>', '', '招聘人员测试', '', '', '', 0, 0, 1267891200, '', 0, 8, 0, 1267891200, 1347524686);

-- --------------------------------------------------------

--
-- 表的结构 `yge_label`
--

CREATE TABLE IF NOT EXISTS `yge_label` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `description` text NOT NULL COMMENT '简述',
  `content` text NOT NULL COMMENT '内容',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '录入时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='标签调用' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `yge_label`
--

INSERT INTO `yge_label` (`id`, `title`, `description`, `content`, `create_time`, `update_time`) VALUES
(1, '调取新闻列表', '这是调取新闻的模板列表', '<ygecms:getData model="Article" name="list" id="vo" offset="5" length=''10''>\r\n{$vo[''title'']}\r\n</ygecms:getData>', 0, 1345705705);

-- --------------------------------------------------------

--
-- 表的结构 `yge_link`
--

CREATE TABLE IF NOT EXISTS `yge_link` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL COMMENT '网站名称',
  `title_style` varchar(255) NOT NULL COMMENT '标题样式',
  `title_style_serialize` varchar(255) NOT NULL COMMENT '标题样式序列化',
  `category_id` tinyint(4) unsigned NOT NULL DEFAULT '1' COMMENT '链接类型：首页，内页，论坛,文字',
  `link_type` enum('text','image') NOT NULL DEFAULT 'text' COMMENT '链接类型',
  `link_url` varchar(255) NOT NULL DEFAULT '' COMMENT '地址',
  `description` text NOT NULL COMMENT '简介',
  `attach_image` varchar(50) NOT NULL DEFAULT '' COMMENT '附件图片',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '首页显示、内页显示等显示方式',
  `display_order` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '排序数值，越小排得越前',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '录入时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '重新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='链接' AUTO_INCREMENT=19 ;

--
-- 转存表中的数据 `yge_link`
--

INSERT INTO `yge_link` (`id`, `title`, `title_style`, `title_style_serialize`, `category_id`, `link_type`, `link_url`, `description`, `attach_image`, `status`, `display_order`, `create_time`, `update_time`) VALUES
(16, '小何安防公司', '', '', 36, 'text', 'http://www.dongart.net/', '', '', 0, 0, 1306554094, 0),
(17, '大哥安防公司', '', '', 36, 'text', 'http://www.qiaozilong.com/', '', '', 0, 0, 1306554242, 0),
(18, '某某个安防公司', '', '', 36, 'text', 'http://www.barbie-eye.com/', '', '', 0, 0, 1306554466, 0);

-- --------------------------------------------------------

--
-- 表的结构 `yge_member`
--

CREATE TABLE IF NOT EXISTS `yge_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '角色组',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `realname` varchar(50) NOT NULL COMMENT '真实姓名',
  `question` varchar(50) NOT NULL COMMENT '问题',
  `answer` varchar(50) NOT NULL COMMENT '答案',
  `sex` tinyint(4) NOT NULL COMMENT '性别真为男',
  `telephone` varchar(50) NOT NULL COMMENT '电话',
  `mobile_telephone` varchar(50) NOT NULL COMMENT '手机',
  `fax` varchar(50) NOT NULL COMMENT 'FAX',
  `regip` varchar(200) NOT NULL,
  `group` int(11) NOT NULL,
  `web_url` varchar(100) NOT NULL COMMENT '网址',
  `email` varchar(50) NOT NULL COMMENT '电子邮件',
  `address` varchar(100) NOT NULL,
  `login_count` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `last_login_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='会员' AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `yge_member`
--


-- --------------------------------------------------------

--
-- 表的结构 `yge_menu`
--

CREATE TABLE IF NOT EXISTS `yge_menu` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL DEFAULT '' COMMENT '标题',
  `title_style` varchar(255) NOT NULL COMMENT '标题样式',
  `title_style_serialize` varchar(255) NOT NULL COMMENT '标题模式序列化',
  `parent_id` tinyint(4) NOT NULL DEFAULT '0' COMMENT '上级',
  `link_url` varchar(100) NOT NULL DEFAULT '' COMMENT '跳转URL',
  `target` varchar(10) NOT NULL DEFAULT '_blank' COMMENT '新窗口',
  `weizhi` int(4) NOT NULL,
  `cid` int(9) NOT NULL,
  `display_order` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '录入时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='导航' AUTO_INCREMENT=57 ;

--
-- 转存表中的数据 `yge_menu`
--

INSERT INTO `yge_menu` (`id`, `title`, `title_style`, `title_style_serialize`, `parent_id`, `link_url`, `target`, `weizhi`, `cid`, `display_order`, `status`, `create_time`, `update_time`) VALUES
(53, '媒体聚焦', '', '', 0, '/html/Article/meitijujiao/index.html', '_blank', 2, 98, 0, 0, 1350471230, 0),
(52, '文章模块', '', '', 0, '/index.php/Article/index/category/1.html', '_blank', 2, 1, 0, 0, 1350471229, 0),
(51, '产品模块', '', '', 0, '/index.php/Product/index/category/103.html', '_blank', 2, 103, 0, 0, 1350455764, 0),
(48, '摄像头', '', '', 0, '/html/Product/shexiang/index.html', '_blank', 2, 104, 0, 0, 1348567540, 0),
(54, '公司新闻', '', '', 0, '/html/Article/gonsixinwen/index.html', '_blank', 2, 2, 0, 0, 1350471231, 0),
(55, '员工风采', '', '', 0, '/html/Article/ygfc/index.html', '_blank', 2, 111, 0, 0, 1350471232, 0),
(56, '员工照片', '', '', 0, '/html/Article/yuangong/index.html', '_blank', 2, 114, 0, 0, 1350471233, 0);

-- --------------------------------------------------------

--
-- 表的结构 `yge_module`
--

CREATE TABLE IF NOT EXISTS `yge_module` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `module_title` varchar(100) NOT NULL COMMENT '中文',
  `module_name` varchar(50) NOT NULL DEFAULT '' COMMENT '模块名称',
  `module_permission` text NOT NULL COMMENT '包含权限',
  `system_module` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否内置',
  `left_menu` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示在管理菜单左侧',
  `developer` text NOT NULL COMMENT '开发者版权',
  `build_version` varchar(255) NOT NULL DEFAULT 'N/A' COMMENT '版本',
  `display_order` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='模块' AUTO_INCREMENT=107 ;

--
-- 转存表中的数据 `yge_module`
--

INSERT INTO `yge_module` (`id`, `module_title`, `module_name`, `module_permission`, `system_module`, `left_menu`, `developer`, `build_version`, `display_order`, `status`, `create_time`, `update_time`) VALUES
(4, '导航管理', 'Menu', '浏览=Menu_index|录入=Menu_insert|编辑=Menu_modify|批量操作=Menu_command', 1, 1, '', '2.0', 0, 0, 0, 0),
(7, '分类管理', 'Category', '浏览=Category_index|编辑=Category_modify|批量操作=Category_update', 1, 1, '', '2.0', 0, 0, 0, 0),
(8, '文章管理', 'Article', '浏览=Article_index|编辑=Article_modify|录入=Article_insert|移动栏目=Article_move|批量操作=Article_command', 1, 1, '', '2.0', 0, 0, 0, 0),
(9, '产品管理', 'Product', '浏览=Product_index|录入=Product_insert|编辑=Product_modify|批量操作=Product_command|订单管理=Product_order|移动类别=Product_move', 0, 1, '', '2.0', 0, 0, 0, 0),
(10, '下载管理', 'Download', '浏览=Download_index|录入=Download_insert|编辑=Download_modify|批量操作=Download_command|移动栏目=Download_move', 0, 1, '', '2.0', 0, 0, 0, 0),
(11, '留言管理', 'Feedback', '浏览=Feedback_index|录入=Feedback_insert|编辑=Feedback_modify|批量操作=Feedback_command', 0, 1, '', '2.0', 0, 0, 0, 0),
(12, '招聘管理', 'Job', '浏览=Job_index|录入=Job_insert|编辑=Job_modify|应聘管理=Job_resume|批量操作=Job_command', 0, 1, '', '2.0', 0, 0, 0, 0),
(13, '公告管理', 'Notice', '浏览=Notice_index|录入=Notice_insert|编辑=Notice_modify|批量操作=Notice_command', 0, 1, '', '2.0', 0, 0, 0, 0),
(14, '链接管理', 'Link', '浏览=Link_index|录入=Link_insert|编辑=Link_modify|批量操作=Link_command', 0, 1, '', '2.0', 0, 0, 0, 0),
(15, '单页管理', 'Page', '浏览=Page_index|录入=Page_insert|编辑=Page_modify|批量操作=Page_command', 1, 1, '', '2.0', 0, 0, 0, 0),
(16, '广告管理', 'Ad', '浏览=Ad_index|录入=Ad_insert|编辑=Ad_modify|批量操作=Ad_command', 0, 1, '', '2.0', 0, 0, 0, 0),
(27, 'Tags', 'Tags', '管理=Tags', 1, 1, '', '2.0', 0, 0, 0, 0),
(28, '评论管理', 'Comment', '浏览=Comment_index|回复=Comment_modify|批量操作=Comment_command', 0, 1, '', '2.0', 0, 0, 0, 0),
(29, '管理员管理', 'Admin', '浏览=Admin_index|录入=Admin_insert|编辑=Admin_modify|批量操作=Admin_command', 1, 0, '', '2.0', 0, 0, 0, 0),
(31, '模板风格', 'Theme', '管理=Theme', 1, 0, 'developer:shuguangcms\r\nweb:http://www.sgcms.cn', '2.0', 0, 0, 0, 0),
(30, '角色管理', 'AdminRole', '浏览=AdminRole_index|录入=AdminRole_insert|编辑=AdminRole_modify|批量操作=AdminRole_command', 1, 0, 'developer:shuguangcms\r\nweb:http://www.sgcms.cn', '2.0', 0, 0, 0, 0),
(32, '模块管理', 'Module', '浏览=Module_index|编辑=Module_modify|安装=Module_install|卸载=Module_uninstall', 1, 0, 'developer:shuguangcms\r\nweb:http://www.sgcms.cn', '2.0', 0, 0, 0, 0),
(33, '系统配置', 'Config', '浏览系统配置=Config_index|编辑系统配置=Config_modify|浏览核心配置=Config_core|编辑核心配置=Config_coreModify', 1, 0, 'developer:shuguangcms\r\nweb:http://www.sgcms.cn', '2.0', 0, 0, 0, 0),
(34, '数据库管理', 'Database', '浏览=Database_index|执行SQL=Database_query|备份数据库=Database_export|恢复数据库=Database_import', 1, 0, 'developer:shuguangcms\r\nweb:http://www.sgcms.cn', '2.0', 0, 0, 0, 0),
(35, '操作日志管理', 'AdminLog', '管理=AdminLog', 1, 0, 'developer:shuguangcms\r\nweb:http://www.sgcms.cn', '2.0', 0, 0, 0, 0),
(36, '工具箱管理', 'Tools', '管理=Tools', 1, 0, 'developer:shuguangcms\r\nweb:http://www.sgcms.cn', '2.0', 0, 0, 0, 0),
(37, '数据调用', 'Label', '管理=Label', 1, 0, 'developer:shuguangcms', '', 0, 0, 0, 0),
(105, '客户中心', 'Solution', '浏览=Solution_index|录入=Solution_insert|编辑=Solution_modify|批量操作=Product_command|订单管理=Solution_order|移动类别=Solution_move', 0, 1, '', 'N/A', 0, 0, 1316575356, 0);

-- --------------------------------------------------------

--
-- 表的结构 `yge_notice`
--

CREATE TABLE IF NOT EXISTS `yge_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'udi',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `title_style` varchar(255) NOT NULL COMMENT '标题样式',
  `title_style_serialize` varchar(255) NOT NULL COMMENT '样式序列化',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `come_from` varchar(50) NOT NULL DEFAULT '' COMMENT '来源名称',
  `come_from_url` varchar(255) NOT NULL COMMENT '来源地址',
  `link_url` varchar(100) NOT NULL COMMENT '链接地址',
  `content` text NOT NULL COMMENT '内容',
  `template` varchar(100) NOT NULL COMMENT '模板文件',
  `tags` varchar(255) NOT NULL COMMENT 'tags',
  `start_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '开始时间',
  `end_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  `attach_file` varchar(100) NOT NULL DEFAULT '' COMMENT '附件文件',
  `keyword` varchar(250) NOT NULL COMMENT '关键字',
  `view_count` int(11) unsigned NOT NULL COMMENT '查看次数',
  `display_order` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '录入时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='公告' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `yge_notice`
--

INSERT INTO `yge_notice` (`id`, `user_id`, `title`, `title_style`, `title_style_serialize`, `username`, `come_from`, `come_from_url`, `link_url`, `content`, `template`, `tags`, `start_time`, `end_time`, `attach_file`, `keyword`, `view_count`, `display_order`, `status`, `create_time`, `update_time`) VALUES
(1, 1, '这个公告就能显示么？', '', '', '', '艾什顿', '暗示打算的', '', '<h3 style="color: red">&nbsp;</h3>\r\n<p>不限就是爱仕达爱仕达爱仕达爱仕达爱仕达是</p>', '', '', 1312128000, 1314720000, '', '爱上大声的', 0, 0, 0, 1312179086, 0),
(2, 1, '这个公告就能显示么？', '', '', '', '艾什顿', '暗示打算的', '', '<h3 style="color: red">&nbsp;</h3>\r\n<p>不限就是爱仕达爱仕达爱仕达爱仕达爱仕达是</p>', '', '', 1312128000, 1314720000, '', '爱上大声的', 0, 0, 0, 1312179101, 0);

-- --------------------------------------------------------

--
-- 表的结构 `yge_operatelog`
--

CREATE TABLE IF NOT EXISTS `yge_operatelog` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `yge_operatelog`
--


-- --------------------------------------------------------

--
-- 表的结构 `yge_order`
--

CREATE TABLE IF NOT EXISTS `yge_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  `realname` varchar(255) NOT NULL DEFAULT '' COMMENT '收货人',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '地址',
  `zipcode` varchar(50) NOT NULL DEFAULT '' COMMENT '邮编',
  `telephone` varchar(255) NOT NULL DEFAULT '' COMMENT '电话',
  `fax` varchar(50) NOT NULL COMMENT '传真',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '电子邮件',
  `introduction` text NOT NULL COMMENT '详细内容',
  `remark` text NOT NULL COMMENT '备注',
  `status` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '状态(0未阅 1已阅 2已处理)',
  `ip` char(15) NOT NULL DEFAULT '127.0.0.1' COMMENT 'IP',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '订货日期',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='订单' AUTO_INCREMENT=17 ;

--
-- 转存表中的数据 `yge_order`
--


-- --------------------------------------------------------

--
-- 表的结构 `yge_page`
--

CREATE TABLE IF NOT EXISTS `yge_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `category_id` int(11) NOT NULL,
  `link_label` char(50) NOT NULL DEFAULT '' COMMENT '链接标识',
  `keyword` varchar(250) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` text NOT NULL COMMENT '简述',
  `content` text NOT NULL COMMENT '内容',
  `template` varchar(100) NOT NULL COMMENT '模板',
  `attach_image` varchar(100) NOT NULL DEFAULT '' COMMENT '附件图片',
  `attach_thumb` varchar(100) NOT NULL DEFAULT '' COMMENT '附件缩略图',
  `attach_ext` varchar(50) NOT NULL COMMENT '附件类型',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否显示',
  `view_count` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '查看次数',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '录入时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='单页' AUTO_INCREMENT=34 ;

--
-- 转存表中的数据 `yge_page`
--

INSERT INTO `yge_page` (`id`, `title`, `category_id`, `link_label`, `keyword`, `description`, `content`, `template`, `attach_image`, `attach_thumb`, `attach_ext`, `status`, `view_count`, `create_time`, `update_time`) VALUES
(27, 'APP开发', 124, 'aboutus', '', '', '<p>\r\n	  ygecms，建站利器，采用thinkphp框架编写，完美MVC架构，是目前市面上那个最敏捷的cms。非常适合中小型网站建设/二次来发。\r\n</p>\r\n<p>\r\n	主要内置的功能模块有，新闻模块，产品模块，单页模块，招聘下载模块，浏览模块，会员系统。免费开源，欢迎使用。\r\n</p>', '', '', '', '', 0, 0, 1317195061, 1382266359),
(28, '简介', 123, 'jianjie', '', '', '手哥工作室哈哈哈哈哈哈', '', '', '', '', 0, 0, 1382266321, 0),
(29, '团队', 123, 'team', '', '', '我们是一个非常牛逼的团队你知道吗？啊撒大声地', '', '', '', '', 0, 0, 1382266388, 0),
(30, '网络维护', 124, 'wangluoweihu', '', '', '网络维护是吧遳的', '', '', '', '', 0, 0, 1382266425, 0),
(31, '网络推广', 124, 'wangluotuiguang', '', '', '网络推广', '', '', '', '', 0, 0, 1382266453, 0),
(32, '软件开发', 124, 'ruanjiankaifa', '', '', '软件开发哈哈哈', '', '', '', '', 0, 0, 1382266504, 0),
(33, '网站建设', 124, 'wangzhanjianshe', '', '', '网站建设哈哈哈哈 ', '', '', '', '', 0, 0, 1382266530, 0);

-- --------------------------------------------------------

--
-- 表的结构 `yge_product`
--

CREATE TABLE IF NOT EXISTS `yge_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(20) NOT NULL COMMENT '发布者',
  `category_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '分类ID',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '产品名称',
  `title_style` varchar(255) NOT NULL DEFAULT '' COMMENT '标题样式',
  `title_style_serialize` varchar(255) NOT NULL COMMENT '标题样式序列化',
  `standard` varchar(50) NOT NULL DEFAULT '' COMMENT '规格',
  `number` varchar(50) NOT NULL DEFAULT '' COMMENT '产品型号',
  `keyword` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `sale_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `market_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '市场价',
  `shop_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商场价',
  `description` text NOT NULL COMMENT '描述',
  `content` text NOT NULL COMMENT '产品说明',
  `tags` varchar(255) NOT NULL COMMENT 'tags',
  `area` char(20) NOT NULL COMMENT '地区',
  `template` varchar(100) NOT NULL COMMENT '模板文件',
  `attach` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否附件 1是0否',
  `attach_image` varchar(100) NOT NULL DEFAULT '' COMMENT '图片',
  `attach_thumb` varchar(100) NOT NULL DEFAULT '' COMMENT '缩略图',
  `link_url` varchar(100) NOT NULL COMMENT '外链接',
  `html_url` varchar(255) NOT NULL,
  `istop` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '置顶',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否审核',
  `recommend` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `display_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `view_count` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '点击次数',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='产品' AUTO_INCREMENT=109 ;

--
-- 转存表中的数据 `yge_product`
--

INSERT INTO `yge_product` (`id`, `user_id`, `username`, `category_id`, `title`, `title_style`, `title_style_serialize`, `standard`, `number`, `keyword`, `sale_price`, `market_price`, `shop_price`, `description`, `content`, `tags`, `area`, `template`, `attach`, `attach_image`, `attach_thumb`, `link_url`, `html_url`, `istop`, `status`, `recommend`, `display_order`, `view_count`, `create_time`, `update_time`) VALUES
(102, 1, 'lizhongyi', 104, '案例3', '', '', '222', '222', '', 0.00, 0.00, 0.00, 'ND-SL200IR系列百万高清网络红外摄像机\r\n\r\n', '<p style="margin-left:0px;color:#000000;font-family:Arial, Helvetica, sans-serif;font-size:12px;font-style:normal;font-weight:normal;text-align:-webkit-auto;text-indent:0px;background-color:#FFFFFF;">\r\n	<strong>ND-SL200IR</strong><strong>系列百万高清网络红外摄像机</strong>\r\n</p>\r\n<p style="margin-left:0px;color:#000000;font-family:Arial, Helvetica, sans-serif;font-size:12px;font-style:normal;font-weight:normal;text-align:-webkit-auto;text-indent:0px;background-color:#FFFFFF;">\r\n	<strong>产品简述</strong>\r\n</p>\r\n<p style="margin-left:0px;color:#000000;font-family:Arial, Helvetica, sans-serif;font-size:12px;font-style:normal;font-weight:normal;text-align:-webkit-auto;text-indent:0px;background-color:#FFFFFF;">\r\n	ND-SL200IR系列百万像素高清网络红外摄像机，采用1/2.5英寸低照度感光器，相对普通高清红外摄像机具有更大的感光面积，在低照度下的成像效果远远高于普通高清红外摄像机。极大的改善低照度效果、提升画质、信噪比。          ND-SL200IR系列数字摄像机为日夜两用型，白天彩色，晚上红外灯开启，配合超低照度感光器出色的画质，解决高清数字摄像机相对黑暗环境成像效果不清晰的现状。\r\n</p>\r\n<p style="margin-left:0px;color:#000000;font-family:Arial, Helvetica, sans-serif;font-size:12px;font-style:normal;font-weight:normal;text-align:-webkit-auto;text-indent:0px;background-color:#FFFFFF;">\r\n	<strong>特色功能</strong>\r\n</p>\r\n<p style="margin-left:0px;color:#000000;font-family:Arial, Helvetica, sans-serif;font-size:12px;font-style:normal;font-weight:normal;text-indent:0px;background-color:#FFFFFF;" align="left">\r\n	IP-MAC绑定\r\n</p>\r\n<p style="margin-left:0px;color:#000000;font-family:Arial, Helvetica, sans-serif;font-size:12px;font-style:normal;font-weight:normal;text-indent:0px;background-color:#FFFFFF;" align="left">\r\n	断电恢复功能\r\n</p>\r\n<p style="margin-left:0px;color:#000000;font-family:Arial, Helvetica, sans-serif;font-size:12px;font-style:normal;font-weight:normal;text-indent:0px;background-color:#FFFFFF;" align="left">\r\n	低照度自动转换\r\n</p>\r\n<p style="margin-left:0px;color:#000000;font-family:Arial, Helvetica, sans-serif;font-size:12px;font-style:normal;font-weight:normal;text-indent:0px;background-color:#FFFFFF;" align="left">\r\n	实时显示实时录像、回放\r\n</p>\r\n<p style="margin-left:0px;color:#000000;font-family:Arial, Helvetica, sans-serif;font-size:12px;font-style:normal;font-weight:normal;text-indent:0px;background-color:#FFFFFF;" align="left">\r\n	更高色彩还原度,可图像倒置\r\n</p>\r\n<p style="margin-left:0px;color:#000000;font-family:Arial, Helvetica, sans-serif;font-size:12px;font-style:normal;font-weight:normal;text-indent:0px;background-color:#FFFFFF;" align="left">\r\n	可按照客户需求增减相应的程序\r\n</p>\r\n<p style="margin-left:0px;color:#000000;font-family:Arial, Helvetica, sans-serif;font-size:12px;font-style:normal;font-weight:normal;text-indent:0px;background-color:#FFFFFF;" align="left">\r\n	随时提供远程技术升级，增设新的功能\r\n</p>\r\n<p style="margin-left:0px;color:#000000;font-family:Arial, Helvetica, sans-serif;font-size:12px;font-style:normal;font-weight:normal;text-indent:0px;background-color:#FFFFFF;" align="left">\r\n	支持报警、开发语音双向对讲、多用户管理等\r\n</p>\r\n<p style="margin-left:0px;color:#000000;font-family:Arial, Helvetica, sans-serif;font-size:12px;font-style:normal;font-weight:normal;text-indent:0px;background-color:#FFFFFF;" align="left">\r\n	支持升级WEB浏览、抓拍、WPA2、WEP加密协议\r\n</p>\r\n<p style="margin-left:0px;color:#000000;font-family:Arial, Helvetica, sans-serif;font-size:12px;font-style:normal;font-weight:normal;text-indent:0px;background-color:#FFFFFF;" align="left">\r\n	散热性能更高并适合更高工作温度并保修期延长至三年保\r\n</p>\r\n<p style="margin-left:0px;color:#000000;font-family:Arial, Helvetica, sans-serif;font-size:12px;font-style:normal;font-weight:normal;text-indent:0px;background-color:#FFFFFF;" align="left">\r\n	可升级：P2P手机浏览、流媒体服务器转发，单访问鉴权，多用户权限管理\r\n</p>\r\n<p style="margin-left:0px;color:#000000;font-family:Arial, Helvetica, sans-serif;font-size:12px;font-style:normal;font-weight:normal;text-align:-webkit-auto;text-indent:0px;background-color:#FFFFFF;">\r\n	可提供第三方系统集成接口,配合平台软件实现不同网络环境大规模联网 \r\n</p>\r\n<p style="margin-left:0px;color:#000000;font-family:Arial, Helvetica, sans-serif;font-size:12px;font-style:normal;font-weight:normal;text-align:-webkit-auto;text-indent:0px;background-color:#FFFFFF;">\r\n	 \r\n</p>\r\n<br />', '', '', '', 1, '/Product/201310/m_52637db1b6ac6.jpg', '', '', '/html/Product/shexiang/201209/102.html', 0, 0, 0, 0, 138, 1346342400, 0),
(106, 1, 'lizhongyi', 104, '案例4', '', '', '', '', '', 0.00, 0.00, 0.00, '这个是案例四这我才是下这，这个是案例四这我才是下这，这个是案例四这我才是下这，这个是案例四这我才是下这，', '这个是案例四这我才是下这，这个是案例四这我才是下这，这个是案例四这我才是下这，这个是案例四这我才是下这，这个是案例四这我才是下这，', '', '', '', 1, '/Product/201310/m_52638bf9ed975.jpg', '/Product/201310/s_52638bf9ed975.jpg', '', '', 0, 0, 0, 0, 0, 1382198400, 0),
(103, 1, 'lizhongyi', 104, '案例2', '', '', '1212', '1212', '', 0.00, 0.00, 0.00, '红外防水摄像机，摄像机\r\n\r\n产品型号:AM-838M20  图像传感器:1/3″SONY CCD  水平清晰度:480电视线\r\n\r\n其它参数:\r\n\r\n像素: 500(水平)×582(垂直) PAL制式; 510(水平)×492(垂直) NTSC制式', '<p style="margin-left:0px;color:#000000;font-family:Arial, Helvetica, sans-serif;font-size:12px;font-style:normal;font-weight:normal;text-align:-webkit-auto;text-indent:0px;background-color:#FFFFFF;">\r\n	<span style="font-family:宋体;font-size:9pt;">红外防水摄像机，摄像机</span><span style="font-size:9pt;"></span>\r\n</p>\r\n<p style="margin-left:0px;color:#000000;font-family:Arial, Helvetica, sans-serif;font-size:12px;font-style:normal;font-weight:normal;text-align:-webkit-auto;text-indent:0px;background-color:#FFFFFF;">\r\n	<span style="font-family:宋体;font-size:9pt;">产品型号</span><span style="font-size:9pt;">:AM-838M20<span> <span> </span></span></span><span style="font-family:宋体;font-size:9pt;">图像传感器</span><span style="font-size:9pt;">:1/3</span><span style="font-family:宋体;font-size:9pt;">″</span><span style="font-size:9pt;">SONY CCD<span> <span> </span></span></span><span style="font-family:宋体;font-size:9pt;">水平清晰度</span><span style="font-size:9pt;">:480</span><span style="font-family:宋体;font-size:9pt;">电视线</span><span style="font-size:9pt;"></span>\r\n</p>\r\n<p style="margin-left:0px;color:#000000;font-family:Arial, Helvetica, sans-serif;font-size:12px;font-style:normal;font-weight:normal;text-align:-webkit-auto;text-indent:0px;background-color:#FFFFFF;">\r\n	<span style="font-family:宋体;font-size:9pt;">其它参数</span><span style="font-size:9pt;">:</span>\r\n</p>\r\n<p style="margin-left:0px;color:#000000;font-family:Arial, Helvetica, sans-serif;font-size:12px;font-style:normal;font-weight:normal;text-align:-webkit-auto;text-indent:0px;background-color:#FFFFFF;">\r\n	<span style="font-family:宋体;font-size:9pt;">像素</span><span style="font-size:9pt;">: 500(</span><span style="font-family:宋体;font-size:9pt;">水平</span><span style="font-size:9pt;">)</span><span style="font-family:宋体;font-size:9pt;">×</span><span style="font-size:9pt;">582(</span><span style="font-family:宋体;font-size:9pt;">垂直</span><span style="font-size:9pt;">) PAL</span><span style="font-family:宋体;font-size:9pt;">制式</span><span style="font-size:9pt;">; 510(</span><span style="font-family:宋体;font-size:9pt;">水平</span><span style="font-size:9pt;">)</span><span style="font-family:宋体;font-size:9pt;">×</span><span style="font-size:9pt;">492(</span><span style="font-family:宋体;font-size:9pt;">垂直</span><span style="font-size:9pt;">) NTSC</span><span style="font-family:宋体;font-size:9pt;">制式</span><span style="font-size:9pt;"></span>\r\n</p>\r\n<p style="margin-left:0px;color:#000000;font-family:Arial, Helvetica, sans-serif;font-size:12px;font-style:normal;font-weight:normal;text-align:-webkit-auto;text-indent:0px;background-color:#FFFFFF;">\r\n	<span style="font-family:宋体;font-size:9pt;">制式</span><span style="font-size:9pt;">: PAL/NTSC</span>\r\n</p>\r\n<p style="margin-left:0px;color:#000000;font-family:Arial, Helvetica, sans-serif;font-size:12px;font-style:normal;font-weight:normal;text-align:-webkit-auto;text-indent:0px;background-color:#FFFFFF;">\r\n	<span style="font-family:宋体;font-size:9pt;">同步系统</span><span style="font-size:9pt;">:<span> </span></span><span style="font-family:宋体;font-size:9pt;">内同步</span><span style="font-size:9pt;"></span>\r\n</p>\r\n<p style="margin-left:0px;color:#000000;font-family:Arial, Helvetica, sans-serif;font-size:12px;font-style:normal;font-weight:normal;text-align:-webkit-auto;text-indent:0px;background-color:#FFFFFF;">\r\n	<span style="font-family:宋体;font-size:9pt;">水平清晰度</span><span style="font-size:9pt;">: 420/480</span><span style="font-family:宋体;font-size:9pt;">电视线</span><span style="font-size:9pt;"></span>\r\n</p>\r\n<p style="margin-left:0px;color:#000000;font-family:Arial, Helvetica, sans-serif;font-size:12px;font-style:normal;font-weight:normal;text-align:-webkit-auto;text-indent:0px;background-color:#FFFFFF;">\r\n	<span style="font-family:宋体;font-size:9pt;">最低照度</span><span style="font-size:9pt;">: 0Lux(</span><span style="font-family:宋体;font-size:9pt;">红外灯开启</span><span style="font-size:9pt;">) 0.8 Lux(</span><span style="font-family:宋体;font-size:9pt;">白天</span><span style="font-size:9pt;">)/F1.2</span>\r\n</p>\r\n<p style="margin-left:0px;color:#000000;font-family:Arial, Helvetica, sans-serif;font-size:12px;font-style:normal;font-weight:normal;text-align:-webkit-auto;text-indent:0px;background-color:#FFFFFF;">\r\n	<span style="font-family:宋体;font-size:9pt;">信噪比</span><span style="font-size:9pt;">:<span> </span></span><span style="font-family:宋体;font-size:9pt;">≥</span><span style="font-size:9pt;">48dB</span>\r\n</p>\r\n<p style="margin-left:0px;color:#000000;font-family:Arial, Helvetica, sans-serif;font-size:12px;font-style:normal;font-weight:normal;text-align:-webkit-auto;text-indent:0px;background-color:#FFFFFF;">\r\n	<span style="font-family:宋体;font-size:9pt;">快门速度</span><span style="font-size:9pt;">: 1/50(1/60) -1/100,000(</span><span style="font-family:宋体;font-size:9pt;">秒</span><span style="font-size:9pt;">)</span>\r\n</p>\r\n<p style="margin-left:0px;color:#000000;font-family:Arial, Helvetica, sans-serif;font-size:12px;font-style:normal;font-weight:normal;text-align:-webkit-auto;text-indent:0px;background-color:#FFFFFF;">\r\n	<span style="font-family:宋体;font-size:9pt;">视频输出</span><span style="font-size:9pt;">: BNC</span><span style="font-family:宋体;font-size:9pt;">型</span><span style="font-size:9pt;"><span> </span>1.0Vp-p 75</span><span style="font-family:宋体;font-size:9pt;">Ω</span><span style="font-size:9pt;"></span>\r\n</p>\r\n<p style="margin-left:0px;color:#000000;font-family:Arial, Helvetica, sans-serif;font-size:12px;font-style:normal;font-weight:normal;text-align:-webkit-auto;text-indent:0px;background-color:#FFFFFF;">\r\n	<span style="font-family:宋体;font-size:9pt;">白平衡</span><span style="font-size:9pt;">:<span> </span></span><span style="font-family:宋体;font-size:9pt;">自动跟踪白平衡</span><span style="font-size:9pt;"></span>\r\n</p>\r\n<p style="margin-left:0px;color:#000000;font-family:Arial, Helvetica, sans-serif;font-size:12px;font-style:normal;font-weight:normal;text-align:-webkit-auto;text-indent:0px;background-color:#FFFFFF;">\r\n	<span style="font-family:宋体;font-size:9pt;">背光补偿</span><span style="font-size:9pt;">:<span> </span></span><span style="font-family:宋体;font-size:9pt;">开</span><span style="font-size:9pt;">/</span><span style="font-family:宋体;font-size:9pt;">关</span><span style="font-size:9pt;"><span> </span></span><span style="font-family:宋体;font-size:9pt;">可选</span><span style="font-size:9pt;"></span>\r\n</p>\r\n<p style="margin-left:0px;color:#000000;font-family:Arial, Helvetica, sans-serif;font-size:12px;font-style:normal;font-weight:normal;text-align:-webkit-auto;text-indent:0px;background-color:#FFFFFF;">\r\n	<span style="font-family:宋体;font-size:9pt;">增益控制</span><span style="font-size:9pt;">:<span> </span></span><span style="font-family:宋体;font-size:9pt;">开</span><span style="font-size:9pt;">/</span><span style="font-family:宋体;font-size:9pt;">关</span><span style="font-size:9pt;"><span> </span></span><span style="font-family:宋体;font-size:9pt;">可选</span><span style="font-size:9pt;"></span>\r\n</p>\r\n<p style="margin-left:0px;color:#000000;font-family:Arial, Helvetica, sans-serif;font-size:12px;font-style:normal;font-weight:normal;text-align:-webkit-auto;text-indent:0px;background-color:#FFFFFF;">\r\n	<span style="font-family:宋体;font-size:9pt;">电子快门</span><span style="font-size:9pt;">:<span> </span></span><span style="font-family:宋体;font-size:9pt;">开</span><span style="font-size:9pt;">/</span><span style="font-family:宋体;font-size:9pt;">关</span><span style="font-size:9pt;"><span> </span></span><span style="font-family:宋体;font-size:9pt;">可选</span><span style="font-size:9pt;"></span>\r\n</p>\r\n<p style="margin-left:0px;color:#000000;font-family:Arial, Helvetica, sans-serif;font-size:12px;font-style:normal;font-weight:normal;text-align:-webkit-auto;text-indent:0px;background-color:#FFFFFF;">\r\n	<span style="font-family:宋体;font-size:9pt;">电源功耗</span><span style="font-size:9pt;">: DC12V 1.2W</span>\r\n</p>\r\n<p style="margin-left:0px;color:#000000;font-family:Arial, Helvetica, sans-serif;font-size:12px;font-style:normal;font-weight:normal;text-align:-webkit-auto;text-indent:0px;background-color:#FFFFFF;">\r\n	<span style="font-family:宋体;font-size:9pt;">镜头</span><span style="font-size:9pt;">: 3.6mm</span>\r\n</p>\r\n<p style="margin-left:0px;color:#000000;font-family:Arial, Helvetica, sans-serif;font-size:12px;font-style:normal;font-weight:normal;text-align:-webkit-auto;text-indent:0px;background-color:#FFFFFF;">\r\n	<span style="font-family:宋体;font-size:9pt;">颜色</span><span style="font-size:9pt;">:</span><span style="font-family:宋体;font-size:9pt;">银白色</span><span style="font-size:9pt;"><span>            <span> </span></span></span><span style="font-family:宋体;font-size:9pt;">红外灯距离</span><span style="font-size:9pt;">:20M</span>\r\n</p>\r\n<p style="margin-left:0px;color:#000000;font-family:Arial, Helvetica, sans-serif;font-size:12px;font-style:normal;font-weight:normal;text-align:-webkit-auto;text-indent:0px;background-color:#FFFFFF;">\r\n	<span style="font-family:宋体;font-size:9pt;">红外灯数</span><span style="font-size:9pt;">: 24PCS</span>\r\n</p>\r\n<p style="margin-left:0px;color:#000000;font-family:Arial, Helvetica, sans-serif;font-size:12px;font-style:normal;font-weight:normal;text-align:-webkit-auto;text-indent:0px;background-color:#FFFFFF;">\r\n	<span style="font-family:宋体;font-size:9pt;">红外红外灯自动开关</span><span style="font-size:9pt;">:<span> </span></span><span style="font-family:宋体;font-size:9pt;">夜晚</span><span style="font-size:9pt;">(</span><span style="font-family:宋体;font-size:9pt;">开</span><span style="font-size:9pt;">)/</span><span style="font-family:宋体;font-size:9pt;">白天</span><span style="font-size:9pt;">(</span><span style="font-family:宋体;font-size:9pt;">关</span><span style="font-size:9pt;">)</span>\r\n</p>\r\n<br />', '', '', '', 1, '/Product/201310/m_52637da12f8c7.jpg', '', '', '/html/Product/shexiang/201209/103.html', 0, 0, 0, 0, 154, 1346342400, 0),
(105, 1, 'lizhongyi', 104, '案例一', '', '', '', '', '', 0.00, 0.00, 0.00, '阿斯顿阿斯顿啊', '阿斯顿阿斯顿啊阿斯顿说东方闪电矛少的地方', '', '', '', 1, '/Product/201310/m_52638d945c80a.jpg', '/Product/201310/s_52638d945c80a.jpg', '', 'html/Product/shexiang/201209/105.html', 0, 0, 0, 0, 120, 1347465600, 0),
(107, 1, 'lizhongyi', 104, '案例5', '', '', '', '', '', 0.00, 0.00, 0.00, '阿斯达飒飒的阿斯达阿斯达阿斯达删掉阿斯达阿斯达阿斯达', '阿斯达阿斯达阿斯达阿斯达', '', '', '', 1, '/Product/201310/m_52638ba0ed774.jpg', '/Product/201310/s_52638ba0ed774.jpg', '', '', 0, 0, 0, 0, 0, 1382198400, 0),
(108, 1, 'lizhongyi', 104, '案例6', '', '', '', '', '', 0.00, 0.00, 0.00, '这就看首页杀样了哈哈哈哈阿斯达撒大声地阿斯达', '把别人的案例都搞一搞哈哈哈哈哈asdas asd a', '', '', '', 1, '/Product/201310/m_52638b85a7b0c.jpg', '/Product/201310/s_52638b85a7b0c.jpg', '', '', 0, 0, 0, 0, 0, 1382198400, 0);

-- --------------------------------------------------------

--
-- 表的结构 `yge_resume`
--

CREATE TABLE IF NOT EXISTS `yge_resume` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '岗位ID',
  `realname` varchar(50) NOT NULL DEFAULT '' COMMENT '姓名',
  `sex` char(2) NOT NULL DEFAULT '男' COMMENT '性别',
  `birthday` varchar(50) NOT NULL DEFAULT '' COMMENT '出生日期',
  `marry` char(10) NOT NULL DEFAULT '未婚' COMMENT '婚否',
  `school` varchar(255) NOT NULL DEFAULT '' COMMENT '学校',
  `degree` varchar(255) NOT NULL DEFAULT '' COMMENT '学历',
  `gradyear` varchar(50) NOT NULL DEFAULT '' COMMENT '毕业时间',
  `telephone` varchar(50) NOT NULL COMMENT '电话',
  `address` varchar(50) NOT NULL COMMENT '联系地址',
  `introduction` text NOT NULL COMMENT '简介',
  `remark` text NOT NULL COMMENT '备注',
  `ip` char(15) NOT NULL DEFAULT '127.0.0.1' COMMENT 'IP',
  `attach_file` varchar(100) NOT NULL COMMENT '附件',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT '状态(0未阅 1已阅 2录用 3未录用)',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '应聘时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='应聘简历' AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `yge_resume`
--


-- --------------------------------------------------------

--
-- 表的结构 `yge_sms`
--

CREATE TABLE IF NOT EXISTS `yge_sms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `toid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `faid` int(11) NOT NULL,
  `shouid` int(11) NOT NULL,
  `delid` int(11) NOT NULL,
  `content` varchar(500) CHARACTER SET utf8 NOT NULL,
  `create_time` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `toid` (`toid`),
  KEY `uid` (`uid`),
  KEY `faid` (`faid`),
  KEY `shouid` (`shouid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=87 ;

--
-- 转存表中的数据 `yge_sms`
--

INSERT INTO `yge_sms` (`id`, `toid`, `uid`, `faid`, `shouid`, `delid`, `content`, `create_time`, `status`) VALUES
(30, 19, 0, 1, 0, 1, '小猫我给你发一条你看看吧', 0, 0),
(33, 19, 0, 1, 0, 1, '你为什么不回复我 话扥饿我真的很想干掉你呢', 0, 0),
(34, 19, 0, 1, 0, 1, '好吧你还是干掉我把', 0, 0),
(35, 1, 0, 19, 0, 0, '你不要跟我墨迹好么我说老兄真鸡巴能模拟啊啊 ', 0, 1),
(37, 18, 0, 1, 0, 0, '这合适么？》', 0, 0),
(38, 18, 0, 1, 0, 0, '那这个真的能么？', 0, 0),
(39, 18, 0, 1, 0, 0, '关键是这李我擦', 0, 0),
(40, 17, 0, 1, 0, 0, '阿四大说的撒阿萨德', 0, 1),
(41, 1, 0, 17, 0, 0, '试试呢', 0, 1),
(42, 17, 0, 1, 0, 0, '哈哈网页不刷新得到通知  这个也是参考zhihu哈哈', 0, 0),
(43, 17, 0, 1, 0, 0, '好像有bug被我发现了，我给你发私信应该没有通知才对。', 0, 1),
(44, 17, 0, 1, 0, 0, '发现了不是bug 还是这个网速有延迟', 0, 1),
(45, 24, 0, 1, 0, 0, '你好 大帅', 0, 1),
(46, 26, 0, 1, 0, 0, '奶粉你好哈哈 ', 0, 1),
(47, 19, 0, 25, 0, 0, '···············', 0, 0),
(48, 19, 0, 25, 0, 0, '谁几把很好打的？？', 0, 0),
(49, 19, 0, 25, 0, 25, '谁几把很好打的？？', 0, 0),
(50, 19, 0, 25, 0, 25, '谁几把很好打的？？', 0, 0),
(51, 24, 0, 1, 0, 0, '再给你来几条看看', 0, 1),
(52, 24, 0, 1, 0, 0, '我给你发你也给我回下哈哈', 0, 1),
(53, 1, 0, 24, 0, 0, '我勒個去，你上癮了', 0, 1),
(54, 24, 0, 1, 0, 0, '组合键测试完毕了', 0, 1),
(55, 1, 0, 24, 0, 0, '我試試', 0, 1),
(57, 25, 0, 1, 0, 0, '你好轮子', 0, 0),
(58, 27, 0, 29, 0, 0, '你还哈哈', 0, 0),
(59, 1, 0, 29, 0, 0, '你能收到么？', 0, 1),
(60, 25, 0, 29, 0, 0, '我不信你有', 0, 0),
(61, 34, 0, 1, 0, 0, '我就是站长 现在测试用户功能', 0, 1),
(62, 41, 0, 1, 0, 0, '我很喜欢你&lt;br/&gt;&lt;br/&gt;', 0, 0),
(63, 29, 0, 1, 0, 1, '我就给你发信息了', 0, 0),
(64, 43, 0, 1, 0, 0, '我看看吧', 0, 0),
(65, 0, 0, 1, 0, 0, '埃索达', 0, 0),
(66, 29, 0, 1, 0, 0, '试试哈哈哈', 0, 0),
(67, 30, 0, 1, 0, 0, '那就自动修复了', 0, 0),
(68, 19, 0, 1, 0, 0, '看看看哈哈哈哈 ', 0, 0),
(69, 0, 0, 24, 0, 0, '毛线啊，头像咋没了', 0, 0),
(70, 24, 0, 1, 0, 0, '没有么？', 0, 1),
(71, 0, 0, 24, 0, 0, '头像头像', 0, 0),
(72, 0, 0, 24, 0, 0, '头像哪去了', 0, 0),
(73, 21, 0, 1, 0, 0, '有的啊', 0, 0),
(74, 0, 0, 24, 0, 0, '头像招来', 0, 0),
(75, 24, 0, 1, 0, 0, '这个才是你吧是吧', 0, 1),
(76, 24, 0, 28, 0, 0, '我发给你试试', 0, 1),
(77, 1, 0, 24, 0, 0, '我给你发', 0, 1),
(78, 19, 0, 1, 0, 0, '看看吧哈哈', 0, 0),
(79, 24, 0, 28, 0, 0, '我给你发的这个应该没问题吧', 0, 1),
(80, 46, 0, 28, 0, 0, '你好我给你发东西了开始', 0, 0),
(81, 55, 0, 1, 0, 0, '你谁啊 ', 0, 0),
(82, 55, 0, 1, 0, 0, 'asdasdas', 0, 0),
(83, 55, 0, 1, 0, 0, '撒大打算打', 0, 0),
(84, 29, 0, 1, 0, 0, 'zxZ', 0, 0),
(85, 1, 0, 58, 0, 0, '我给你发一一条提示会在哪呢', 0, 1),
(86, 37, 0, 1, 0, 0, '啊山大苏打', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `yge_solution`
--

CREATE TABLE IF NOT EXISTS `yge_solution` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '类别',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(100) NOT NULL DEFAULT '' COMMENT '发布用户名',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `title_style` varchar(255) NOT NULL DEFAULT '' COMMENT '标题样式',
  `title_style_serialize` varchar(255) NOT NULL COMMENT '标题样式序列化',
  `keyword` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `copy_from` varchar(255) NOT NULL DEFAULT '' COMMENT '来源',
  `from_link` varchar(255) NOT NULL DEFAULT '0' COMMENT '来源链接 ',
  `link_url` varchar(255) NOT NULL DEFAULT '' COMMENT '外链地址',
  `description` text NOT NULL COMMENT '简单描述',
  `content` mediumtext NOT NULL COMMENT '内容',
  `tags` varchar(255) NOT NULL COMMENT 'tags',
  `template` varchar(100) NOT NULL COMMENT '模板文件',
  `attach` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '附件',
  `attach_image` varchar(100) NOT NULL DEFAULT '' COMMENT '图片',
  `attach_thumb` varchar(100) NOT NULL DEFAULT '' COMMENT '缩略图',
  `istop` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '置顶',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `recommend` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '推荐',
  `display_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `view_count` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '查看次数',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='新闻' AUTO_INCREMENT=57 ;

--
-- 转存表中的数据 `yge_solution`
--


-- --------------------------------------------------------

--
-- 表的结构 `yge_tags`
--

CREATE TABLE IF NOT EXISTS `yge_tags` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `tag_name` char(20) NOT NULL DEFAULT '' COMMENT '标签',
  `module` char(20) NOT NULL DEFAULT '' COMMENT '模块',
  `total_count` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '出现主题数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='tag标签' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `yge_tags`
--

INSERT INTO `yge_tags` (`id`, `tag_name`, `module`, `total_count`) VALUES
(1, '花卉租摆', 'Product', 1),
(2, '招聘人员测试', 'Job', 1);

-- --------------------------------------------------------

--
-- 表的结构 `yge_tags_cache`
--

CREATE TABLE IF NOT EXISTS `yge_tags_cache` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module` char(20) NOT NULL DEFAULT '' COMMENT '模块',
  `tag_name` char(20) NOT NULL COMMENT '标签名',
  `title_id` int(10) unsigned NOT NULL COMMENT '主题ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='tag主题关联' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `yge_tags_cache`
--

INSERT INTO `yge_tags_cache` (`id`, `module`, `tag_name`, `title_id`) VALUES
(1, 'Product', '花卉租摆', 4),
(2, 'Job', '招聘人员测试', 8);

-- --------------------------------------------------------

--
-- 表的结构 `yge_user`
--

CREATE TABLE IF NOT EXISTS `yge_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '角色组',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `realname` varchar(50) NOT NULL COMMENT '真实姓名',
  `pinyin` char(100) NOT NULL,
  `face` varchar(255) NOT NULL,
  `face1` smallint(1) NOT NULL,
  `face2` varchar(50) NOT NULL,
  `question` varchar(50) NOT NULL COMMENT '问题',
  `answer` varchar(50) NOT NULL COMMENT '答案',
  `sex` tinyint(4) NOT NULL COMMENT '性别真为男',
  `telephone` varchar(50) NOT NULL COMMENT '电话',
  `mobile_telephone` varchar(50) NOT NULL COMMENT '手机',
  `fax` varchar(50) NOT NULL COMMENT 'FAX',
  `regip` varchar(200) NOT NULL,
  `group` int(11) NOT NULL,
  `web_url` varchar(100) NOT NULL COMMENT '网址',
  `email` varchar(50) NOT NULL COMMENT '电子邮件',
  `address` varchar(100) NOT NULL,
  `edu` varchar(255) NOT NULL COMMENT '教育背景',
  `about` varchar(500) NOT NULL,
  `hometown` varchar(255) NOT NULL,
  `city` bigint(20) NOT NULL,
  `worker` varchar(255) NOT NULL,
  `birthday` varchar(255) NOT NULL,
  `motto` varchar(255) NOT NULL,
  `randnum` varchar(50) NOT NULL,
  `login_count` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `last_login_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='会员' AUTO_INCREMENT=69 ;

--
-- 转存表中的数据 `yge_user`
--

INSERT INTO `yge_user` (`id`, `role_id`, `username`, `password`, `realname`, `pinyin`, `face`, `face1`, `face2`, `question`, `answer`, `sex`, `telephone`, `mobile_telephone`, `fax`, `regip`, `group`, `web_url`, `email`, `address`, `edu`, `about`, `hometown`, `city`, `worker`, `birthday`, `motto`, `randnum`, `login_count`, `create_time`, `update_time`, `last_login_time`) VALUES
(1, 0, 'nihao', '93279e3308bdbbeed946fc965017f67a', '小小花', 'xiaoxiaohua', '/Uploads/User/face/a0b923820dcc509a6f75849b1371698833.gif', 0, '/Uploads/User/face/m_51c27696807c2.gif', '', '', 1, '111', '', '', '', 0, '', '592341646@qq.com', '', '埃索达', '鹅鹅埃索达你说是真的么?DASDS QEQWE QWE好吧&lt;br/&gt;阿四大说的''''&lt;h1&gt;asdasd&lt;/h1&gt;', '11', 6, 'asdasdads', '19840214', '埃索达他v ', '', 218, 0, 0, 1382002145),
(2, 0, 'asdasd', 'a8f5f167f44f4964e6c998dee827110c', '', '', '', 0, '', '', '', 0, '', '', '', '', 0, '', '', '', '', '', '', 0, '', '', '', 'IC4xOTI4MzgzMDA=', 0, 0, 0, 0),
(11, 0, 'nihaoa', '5e543256c480ac577d30f76f9120eb74', '', '', '', 0, '', '', '', 0, '', '', '', '127.0.0.1', 0, '', '', '', '', '', '', 0, '', '', '', '', 1, 0, 0, 1346376057),
(12, 0, 'nihao1', '93279e3308bdbbeed946fc965017f67addd', '', '', '', 0, '', '', '', 0, '', '', '', '127.0.0.1', 0, '', '', '', '', '', '', 0, '', '', '', '', 1, 0, 0, 1346376375),
(13, 0, 'king', '58cf703f664397ec4f0ac359b84b565c', '', '', '', 0, '', '', '', 0, '', '', '', '218.85.143.90', 0, '', '', '', '', '', '', 0, '', '', '', '', 1, 0, 0, 1349945728),
(14, 0, 'wohenhao', '93279e3308bdbbeed946fc965017f67a', '', '', '', 0, '', '', '', 0, '', '', '', '114.245.218.231', 0, '', '', '', '', '', '', 0, '', '', '', '', 1, 0, 0, 1349946676),
(15, 0, '5838182', '93279e3308bdbbeed946fc965017f67a', '', '', '', 0, '', '', '', 0, '', '', '', '114.245.218.231', 0, '', '', '', '', '', '1', 1, '', '0', '', '', 1, 0, 0, 1349947076),
(16, 0, '董某', '73f093a7a52c5fd4a77a3aa024fe61e9', '', '', '', 0, '', '', '', 0, '', '', '', '211.157.141.2', 0, '', '', '', '', '', '', 0, '', '', '', '', 1, 0, 0, 1349947156),
(17, 0, 'lanyang0', 'aa9ff9ba0cd0e7180c887f3ba7408276', '', '', '', 0, '', '', '', 0, '', '', '', '221.3.133.236', 0, '', '', '', '', '', '', 0, '', '', '', '', 4, 0, 0, 1351130242),
(18, 0, 'pmpen', 'de20cbe519cdd19c4cbb5e2386730a52', '', '', '', 0, '', '', '', 0, '', '', '', '114.112.37.134', 0, '', '', '', '', '', '', 0, '', '', '', '', 1, 0, 0, 1350012038),
(19, 0, 'wocawoca', '93279e3308bdbbeed946fc965017f67a', '我几把很好打的', 'wojibahenhaodade', '', 0, '', '', '', 0, '', '', '', '125.34.163.64', 0, '', '啊实打实的', '', '', '', '1', 1, '阿什顿阿什顿', '0', '', '', 1, 0, 0, 1350391889),
(20, 0, '这也要名字', '6ab64f99a410bcac1b1ef1a634010838', '这也要名字', 'zheyeyaomingzi', '', 0, '', '', '', 0, '', '', '', '14.222.29.224', 0, '', 'dx_liudongxiao@163.com', '', '', '', '1', 1, '码农', '00000000', '', '', 1, 0, 0, 1350612245),
(21, 0, 'zun9981', 'f6ebef5a5f6bdf8037a079b3fe2ee88e', '潘帥', '', '', 0, '', '', '', 0, '', '', '', '116.236.117.242', 0, '', 'zun9981@gmail.com', '', '', '', '4421517312', 4295101696, '前端', '00000000', '', '', 1, 0, 0, 1350612348),
(22, 0, '李强', 'e4fd65f43d022b803cfc084565b9c8db', '', '', '', 0, '', '', '', 0, '', '', '', '61.149.70.224', 0, '', '', '', '', '', '', 0, '', '', '', '', 1, 0, 0, 1350612391),
(23, 0, 'xiaok', '58cf703f664397ec4f0ac359b84b565c', '小K', 'xiao', '', 0, '', '', '', 0, '', '', '', '218.85.143.90', 0, '', 'king@comemind.com', '', '', '', '1', 1, '页面仔', '0', '', '', 1, 0, 0, 1350612501),
(24, 0, '潘帥', 'f6ebef5a5f6bdf8037a079b3fe2ee88e', '潘帥', '', '/Uploads/User/face/m_508ba04f93af7.png', 1, '', '', '', 0, '', '', '', '116.236.117.242', 0, '', 'zun9981@gmail.com', '', '', '', '1', 1, '', '0', '戀愛恐懼症', '', 5, 0, 0, 1356918003),
(25, 0, 'xilun', '25f9e794323b453885f5181f1b624d0b', '希仑', 'xilun', '', 0, '', '', '', 0, '', '', '', '183.129.215.106', 0, '', 'xilun@xilun.com', '', '博士后', '希仑', '4295032832', 4295032832, 'web前端开发', '19900909', '希仑', '', 1, 0, 0, 1350612571),
(26, 0, 'naifen00', 'fa539637cecb3da5e5c3680366e3ae6f', '', '', '', 0, '', '', '', 0, '', '', '', '211.103.216.218', 0, '', '', '', '', '', '', 0, '', '', '', '', 5, 0, 0, 1351068481),
(27, 0, 'zhuzhu', '93279e3308bdbbeed946fc965017f67a', '猪猪', 'zhuzhu', '', 0, '', '', '', 0, '', '', '', '114.245.212.57', 0, '', '7383838@qq.com', '', '', '', '1', 1, '猪猪', '0', '', '', 1, 0, 0, 1350889250),
(28, 0, 'maomao', '93279e3308bdbbeed946fc965017f67a', '猫猫', 'maomao', '/Uploads/User/face/33e75ff09dd601bbe69f351039152189.jpg', 1, '', '', '', 0, '', '', '', '114.245.212.57', 0, '', 'asda@123.com', '', '', '我的爪子很长', '4445962240', 4445962240, '哈斯爱上', '20100507', '我是一只猫', '', 3, 0, 0, 1351414652),
(29, 0, 'damaohou', '93279e3308bdbbeed946fc965017f67a', '我是你的哥哥', 'woshinidegege', '', 0, '', '', '', 0, '', '', '', '114.245.212.57', 0, '', '埃索达说的', '', '爱上大大', '埃索达', '1', 1, '埃索达', '0', '爱上大大', '', 1, 0, 0, 1350897289),
(30, 0, 'woshizhu', '93279e3308bdbbeed946fc965017f67a', '我是猪', 'woshizhu', '', 0, '', '', '', 0, '', '', '', '114.245.212.57', 0, '', '', '', '', '', '1', 1, '', '0', '', '', 1, 0, 0, 1350899640),
(31, 0, '我真的很蛋疼', '93279e3308bdbbeed946fc965017f67a', '我真的很但应', 'wozhendehendanying', '', 0, '', '', '', 0, '', '', '', '114.245.212.57', 0, '', '', '', '', '', '1', 1, '', '0', '', '', 1, 0, 0, 1350899890),
(32, 0, 'xiaohualian', '93279e3308bdbbeed946fc965017f67a', '小花脸', 'xiaohualian', '', 0, '', '', '', 0, '', '', '', '123.114.249.224', 0, '', '', '', '', '', '1', 1, '', '0', '', '', 1, 0, 0, 1350913614),
(33, 0, 'woshiyigebing', '93279e3308bdbbeed946fc965017f67a', '我是一个兵', 'woshiyigebing', '', 0, '', '', '', 0, '', '', '', '123.114.249.224', 0, '', '', '', '', '', '1', 1, '', '0', '', '', 1, 0, 0, 1350913955),
(34, 0, '随风浮梦', '5a56fb2a54ec47e65c58148e69928a2d', '随风浮梦', 'suifengfumeng', '', 0, '', '', '', 0, '', '', '', '222.33.57.68', 0, '', 'delzdh@126.com', '', '', '', '1', 1, 'web前端', '0', '为每一天的崭新技术而欣慰', '', 1, 0, 0, 1350957255),
(35, 0, 'lml87623', 'e10adc3949ba59abbe56e057f20f883e', '', '', '', 0, '', '', '', 0, '', '', '', '58.246.57.186', 0, '', '', '', '', '', '', 0, '', '', '', '', 1, 0, 0, 1350957546),
(36, 0, '站长义哥', '93279e3308bdbbeed946fc965017f67a', '站长义哥', 'zhanchangyige', '', 0, '', '', '', 0, '', '', '', '114.245.214.55', 0, '', '', '', '', '', '1', 1, '', '0', '', '', 1, 0, 0, 1350957655),
(37, 0, '我是一只狗', '93279e3308bdbbeed946fc965017f67a', '我是一只狗', 'woshiyizhigou', '', 0, '', '', '', 0, '', '', '', '114.245.214.55', 0, '', '', '', '', '', '1', 1, '', '0', '', '', 1, 0, 0, 1350959529),
(38, 0, 'lolipop', '93bc9d7123e6f022b6d147f80cfb9b10', 'lolipop', 'lolipop', '', 0, '', '', '', 0, '', '', '', '58.255.227.8', 0, '', '444064034@qq.com', '', '大专', '囫囵吞枣', '4530767104', 4531683584, '前端攻城湿', '19900301', 'ajax', '', 2, 0, 0, 1350960433),
(39, 0, 'godkatrina', '1f88348af4db125c21314e99ef4dae9f', '猫猫没睡醒', 'maomaomeishuixing', '', 0, '', '', '', 0, '', '', '', '203.86.83.66', 0, '', '1072462373@qq.com', '', '大学', '', '4313645056', 4295034112, 'web前端', '19880721', '吃和睡是人生最大的乐事', '', 1, 0, 0, 1350978187),
(40, 0, 'sz8501', 'e10adc3949ba59abbe56e057f20f883e', 'sadas', 'sadas', '', 0, '', '', '', 0, '', '', '', '218.18.71.99', 0, '', 'asfas', '', 'asfa', 'asgsdgd', '25', 19, 'asfasf', '19890121', 'asfasf', '', 1, 0, 0, 1350978489),
(41, 0, 'shiwo', '93279e3308bdbbeed946fc965017f67a', '是我老大', 'shiwolaoda', '', 0, '', '', '', 0, '', '', '', '114.245.214.55', 0, '', '', '', '', '', '1', 1, '', '0', '', '', 1, 0, 0, 1350983495),
(42, 0, '谁是我', '93279e3308bdbbeed946fc965017f67a', '谁是我啊', 'shuishiwoa', '', 0, '', '', '', 0, '', '', '', '114.245.214.55', 0, '', '', '', '', '', '1', 1, '', '0', '', '', 1, 0, 0, 1350983528),
(43, 0, '不能没有我', '93279e3308bdbbeed946fc965017f67a', '不能没有我', 'bunengmeiyouwo', '', 0, '', '', '', 0, '', '', '', '114.245.214.55', 0, '', '', '', '', '', '1', 1, '', '0', '', '', 1, 0, 0, 1350983551),
(44, 0, 'a535766609', '7679737df1b34139e63624e95de9c0b8', '', '', '', 0, '', '', '', 0, '', '', '', '119.51.210.209', 0, '', '', '', '', '', '', 0, '', '', '', '', 1, 0, 0, 1351036680),
(45, 0, 'haolee', '020415e5880600f7d349eb7cc93a6cb1', '', '', '', 0, '', '', '', 0, '', '', '', '113.111.200.140', 0, '', '', '', '', '', '', 0, '', '', '', '', 1, 0, 0, 1351068534),
(46, 0, 'test123', 'e10adc3949ba59abbe56e057f20f883e', '我是来测试的。。。', 'woshilaiceshide', '', 0, '', '', '', 0, '', '', '', '116.204.103.177', 0, '', 'w3cfuns@qq.com', '', '小学毕业', '没啥写的', '2', 30, '你猜', '20110202', '测试自动的东西 让你们不说话', '', 1, 0, 0, 1351068695),
(47, 0, 'demo', 'd54bb7c79d9cbae990935202a6f90b0f', '', '', '', 0, '', '', '', 0, '', '', '', '113.240.176.140', 0, '', '', '', '', '', '', 0, '', '', '', '', 1, 0, 0, 1351221143),
(48, 0, 'xiaoxiao', 'f5193a89d636cb202d828dd5c21befcd', '', '', '', 0, '', '', '', 0, '', '', '', '59.173.253.146', 0, '', '', '', '', '', '', 0, '', '', '', '', 1, 0, 0, 1351221423),
(49, 0, '123', 'e10adc3949ba59abbe56e057f20f883e', '', '', '', 0, '', '', '', 0, '', '', '', '123.127.46.142', 0, '', '', '', '', '', '', 0, '', '', '', '', 1, 0, 0, 1351221433),
(50, 0, 'apple', 'b02394bde85a78ec6acc76c99888e7f4', '', '', '', 0, '', '', '', 0, '', '', '', '118.112.166.252', 0, '', '', '', '', '', '', 0, '', '', '', '', 1, 0, 0, 1351223439),
(51, 0, '123456', 'e10adc3949ba59abbe56e057f20f883e', '', '', '', 0, '', '', '', 0, '', '', '', '113.90.223.92', 0, '', '', '', '', '', '1', 1, '', '0', '', '', 2, 0, 0, 1351413934),
(52, 0, '00000000', 'dd4b21e9ef71e1291183a46b913ae6f2', '', '', '/Uploads/User/face/m_508b9d38a8f3d.jpg', 1, '', '', '', 0, '', '', '', '222.128.12.21', 0, '', '', '', '', '', '1', 1, '', '0', '', '', 1, 0, 0, 1351326992),
(53, 0, 'tianwen', '2a48ec5b51e134b55c84454542b58cb0', 'tianwen', 'tianwen', '', 0, '', '', '', 0, '', '', '', '106.3.102.39', 0, '', 'tianwen_1979@hotmail.com', '', '', '', '4615176704', 4295036160, 'tianwen', '19790601', '', '', 3, 0, 0, 1351348388),
(54, 0, 'lxuay6421', 'dd6bf8f04aeb05d43c3fe66394a79dd7', 'tester', 'tester', '', 0, '', '', '', 0, '', '', '', '175.25.247.5', 0, '', '258443145@qq.com', '', '', '', '1', 1, '', '0', '', '', 1, 0, 0, 1351410440),
(55, 0, 'ASasAS', 'c4de6e238cd1c37bcc5ec9c5bb3e41b3', '', '', '', 0, '', '', '', 0, '', '', '', '211.157.141.5', 0, '', '', '', '', '', '', 0, '', '', '', '', 1, 0, 0, 1351422387),
(56, 0, '20121117001', 'f243553101b902b8bc8f92015c958078', '', '', '', 0, '', '', '', 0, '', '', '', '111.194.7.98', 0, '', '', '', '', '', '', 0, '', '', '', '', 1, 0, 0, 1353152294),
(57, 0, 'xiaobu945', 'ff2511ac0a69e7570d4533d7bd680021', '', '', '', 0, '', '', '', 0, '', '', '', '114.244.12.45', 0, '', '', '', '', '', '', 0, '', '', '', '', 1, 0, 0, 1358649263),
(58, 0, 'xiaolizi', '93279e3308bdbbeed946fc965017f67a', '小李子', 'xiaolizi', '', 0, '', '', '', 0, '', '', '', '114.245.213.220', 0, '', 'asdads@qq.com', '', '', '啊十大是', '1', 1, '啊山大苏打', '0', '', '', 1, 0, 0, 1366861444),
(59, 0, 'colin.chen', '78217ccd31896dac7acb61d6730e9e9a', '', '', '', 0, '', '', '', 0, '', '', '', '123.157.218.82', 0, '', '', '', '', '', '', 0, '', '', '', '', 1, 0, 0, 1370592320),
(60, 0, 'baidu.ocm', 'f5193a89d636cb202d828dd5c21befcd', '', '', '/Uploads/User/face/m_51b194eda07fa.js', 1, '', '', '', 0, '', '', '', '180.168.49.186', 0, '', '2@qq.com', '', '', '', '4', 3, '', '20120000', '', '', 1, 0, 0, 1370592436),
(61, 0, 'freedom', 'ab1cd85b5cdfe4b78c3f7dfb9e933615', '', '', '', 0, '', '', '', 0, '', '', '', '218.89.229.122', 0, '', '', '', '', '', '', 0, '', '', '', '', 1, 0, 0, 1370592446),
(62, 0, 'aaaaaa', 'ab1cd85b5cdfe4b78c3f7dfb9e933615', '', '', '', 0, '', '', '', 0, '', '', '', '218.89.229.122', 0, '', '', '', '', '', '', 0, '', '', '', '', 1, 0, 0, 1370592488),
(63, 0, 'a', '0192023a7bbd73250516f069df18b500', '', '', '', 0, '', '', '', 0, '', '', '', '14.127.219.175', 0, '', '', '', '', '', '', 0, '', '', '', '', 1, 0, 0, 1370594485),
(64, 0, 'swdwd', 'f34d889a51fd995759d5f5b91e8173b7', '', '', '/Uploads/User/face/m_51c12d9681423.gif', 1, '', '', '', 0, '', '', '', '180.168.49.186', 0, '', '', '', '', '', '', 0, '', '', '', '', 1, 0, 0, 1371614603),
(65, 0, 'leopeck', 'f9a27ff168078557b714096d071b557c', '小小', 'xiaoxiao', '/Uploads/User/face/m_51c281dd57f9a.jpg', 1, '', '', '', 0, '', '', '', '202.107.194.183', 0, '', '1', '', '1', '1', '1', 1, '1', '20130103', '1', '', 1, 0, 0, 1371701693),
(66, 0, 'ss522408', '5be0dc49fa0d7bdecee55a6a70cbf51a', '', '', '', 0, '', '', '', 0, '', '', '', '117.135.159.4', 0, '', '', '', '', '', '', 0, '', '', '', '', 1, 0, 0, 1374810546),
(67, 0, 'mmz0717', 'e15588f25d07d891b08cc9bde823508d', 'sam', 'sam', '', 0, '', '', '', 0, '', '', '', '183.2.41.153', 0, '', 'mmz0717＠gmail.com', '', '', '', '1', 1, '', '0', '', '', 1, 0, 0, 1374819659),
(68, 0, 'coolking', '5a56fb2a54ec47e65c58148e69928a2d', '', '', '', 0, '', '', '', 0, '', '', '', '59.46.116.121', 0, '', '', '', '', '', '1', 1, '', '0', '', '', 2, 0, 0, 1382001896);

-- --------------------------------------------------------

--
-- 表的结构 `yge_usermsg`
--

CREATE TABLE IF NOT EXISTS `yge_usermsg` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `toid` int(11) NOT NULL,
  `hfid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `luname` char(20) NOT NULL,
  `content` varchar(500) CHARACTER SET utf8 NOT NULL,
  `create_time` int(11) NOT NULL,
  `ly_ip` int(11) NOT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=94 ;

--
-- 转存表中的数据 `yge_usermsg`
--

INSERT INTO `yge_usermsg` (`id`, `toid`, `hfid`, `uid`, `luname`, `content`, `create_time`, `ly_ip`) VALUES
(58, 0, 50, 1, '', '', 1349944978, 0),
(57, 0, 50, 1, '', '', 1349944871, 0),
(56, 0, 51, 1, '', '你在说什么啊呢', 1349944723, 0),
(55, 0, 51, 1, '', '随碟附送大是大非', 1349944706, 0),
(54, 0, 51, 1, '', '阿四大说的', 1349944615, 0),
(53, 0, 51, 1, '', '我试试吧看看怎么样', 1349944556, 0),
(52, 0, 46, 1, '', '请不要在我这里乱讲了好么', 1349944283, 0),
(51, 1, 0, 19, '', '你们就不能一起说说', 1349944174, 0),
(50, 1, 0, 19, '', '怎么能还是我在说蛤', 1349944160, 0),
(49, 0, 46, 18, '', '我比较反对这个楼主你说呢这厮不像话', 1349942619, 0),
(48, 0, 46, 18, '', '我可以插一句嘴么我觉得我楼下说的不对', 1349942541, 0),
(47, 0, 46, 19, '', '这个能提交成功么我不信啊', 1349942352, 0),
(46, 1, 0, 19, '', '你干回复我说的话么？', 1349942159, 0),
(45, 1, 0, 19, '', '真的是这样子的么？', 1349941900, 0),
(44, 1, 0, 19, '', '其实我有话对你说', 1349941844, 0),
(59, 16, 0, 1, '', '特瑞特让他而特而特 ', 1350011621, 0),
(60, 16, 0, 1, '', 'asdasdads 阿阿斯顿埃索达', 1350011696, 0),
(61, 16, 0, 1, '', 'asdasdads 阿阿斯顿埃索达按时打算打算大说的埃索达', 1350011710, 0),
(62, 0, 51, 17, '', '啊实打实的', 1350011748, 0),
(63, 0, 51, 17, '', '可以?', 1350011775, 0),
(64, 17, 0, 1, '', '老B我表示对你热烈的欢迎', 1350011796, 0),
(65, 0, 50, 17, '', '', 1350011820, 0),
(66, 16, 0, 1, '', '玩儿玩儿玩儿', 1350011945, 0),
(67, 16, 0, 1, '', '', 1350011998, 0),
(68, 18, 0, 1, '', '你是谁啊', 1350027332, 0),
(69, 0, 68, 1, '', '说的发生地', 1350028520, 0),
(70, 17, 0, 1, '', '给你留言了你看不见吧', 1350455073, 0),
(71, 17, 0, 1, '', '给你留言了你看不见吧撒旦法是否', 1350455088, 0),
(72, 17, 0, 1, '', '给你留言了你看不见吧', 1350455088, 0),
(73, 0, 51, 1, '', '恩恩', 1350460012, 0),
(74, 0, 68, 25, '', '希仑', 1350613147, 0),
(75, 0, 68, 25, '', '希仑', 1350613148, 0),
(76, 25, 0, 1, '', '给你留言看看咯', 1350615271, 0),
(77, 25, 0, 1, '', '你怎么不上来看看啊', 1350629625, 0),
(78, 19, 0, 1, '', '哈哈笑伙子我给你留言了', 1350662796, 0),
(79, 19, 0, 1, '', '哈哈笑伙子我给你留言了', 1350663417, 0),
(80, 26, 0, 1, '', '还没给你留言么？', 1350699760, 0),
(81, 0, 80, 1, '', '我在给你来一条卡看', 1350803012, 0),
(82, 43, 0, 1, '', 'DESAD ', 1351325870, 0),
(83, 24, 0, 1, '', '阿四大说的爱上', 1351674029, 0),
(84, 0, 51, 1, '', '我在试试', 1352640837, 0),
(85, 53, 0, 1, '', 'ffsdfsfdsdfsdfs', 1352768435, 0),
(86, 55, 0, 0, '', '啊神顶峰神顶峰', 1353852809, 0),
(87, 56, 0, 1, '', 'werwerwerwerwe rwer werwerw rwer werwerwerwerwe rwer werwerw rwer werwerwerwerwe rwer werwerw rwer werwerwerwerwe rwer werwerw rwer werwerwerwerwe rwer werwerw rwer werwerwerwerwe rwer werwerw rwer werwerwerwerwe rwer werwerw rwer werwerwerwerwe rwer werwerw rwer werwerwerwerwe rwer werwerw rwer werwerwerwerwe rwer werwerw rwer werwerwerwerwe rwer werwerw rwer werwerwerwerwe rwer werwerw rwer werwerwerwerwe rwer werwerw rwer werwerwerwerwe rwer werwerw rwer werwerwerwerwe rwer werwerw rwer werwe', 1354759664, 0),
(88, 56, 0, 57, '', '44444444444444', 1358649319, 0),
(89, 0, 88, 57, '', 'kobu.cc', 1358649334, 0),
(90, 0, 51, 1, '', '这个回复很智能啊', 1366861363, 0),
(91, 58, 0, 1, '', '玩儿玩儿玩儿', 1368610914, 0),
(92, 0, 46, 1, '', '阿四大四大\n阿斯达阿斯达', 1375148730, 0),
(93, 66, 0, 1, '', '阿斯达阿斯达是&lt;br/&gt;', 1375148737, 0);

-- --------------------------------------------------------

--
-- 表的结构 `yge_user_log`
--

CREATE TABLE IF NOT EXISTS `yge_user_log` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` tinyint(3) unsigned NOT NULL COMMENT '用户ID',
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '用户',
  `action` text NOT NULL COMMENT 'URI',
  `ip` char(15) NOT NULL DEFAULT '127.0.0.1' COMMENT 'IP',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '录入时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='管理员操作日志' AUTO_INCREMENT=3821 ;

--
-- 转存表中的数据 `yge_user_log`
--


-- --------------------------------------------------------

--
-- 表的结构 `yge_user_role`
--

CREATE TABLE IF NOT EXISTS `yge_user_role` (
  `id` tinyint(1) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) NOT NULL DEFAULT 'all' COMMENT '名称',
  `role_permission` text NOT NULL COMMENT '权限',
  `system` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '系统内置',
  `create_time` int(11) unsigned NOT NULL COMMENT '增加时间',
  `update_time` int(11) unsigned NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='管理员角色' AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `yge_user_role`
--

INSERT INTO `yge_user_role` (`id`, `role_name`, `role_permission`, `system`, `create_time`, `update_time`) VALUES
(1, '超级管理', 'Menu_index,Menu_insert,Menu_modify,Menu_command,Category_index,Category_modify,Category_update,Aticle_index,Aticle_modify,Aticle_insert,Aticle_move,Aticle_command,Product_index,Product_insert,Product_modify,Product_command,Product_order,Product_move,Download_index,Download_insert,Download_modify,Download_command,Download_move,Feedback_index,Feedback_insert,Feedback_modify,Feedback_command,Job_index,Job_insert,Job_modify,Job_resume,Job_command,Notice_index,Notice_insert,Notice_modify,Notice_command,Link_index,Link_insert,Link_modify,Link_command,Page_index,Page_insert,Page_modify,Page_command,Ad_index,Ad_insert,Ad_modify,Ad_command,Tags,Comment_index,Comment_modify,Comment_command,Admin_index,Admin_insert,Admin_modify,Admin_command,Template,AdminRole_index,AdminRole_insert,AdminRole_modify,AdminRole_command', 1, 0, 0),
(2, '禁止访问', 'disable', 1, 0, 0),
(3, '普通管理', 'Menu_index,Menu_insert,Menu_modify,Menu_command,Category_index,Category_modify,Aticle_index,Aticle_modify,Aticle_insert,Aticle_move,Aticle_command,Product_index,Product_insert,Product_modify,Product_command,Product_order,Product_move,Download_index,Download_insert,Download_modify,Download_command,Download_move,Feedback_index,Feedback_insert,Feedback_modify,Feedback_command,Job_index,Job_insert,Job_modify,Job_resume,Job_command,Notice_index,Notice_insert,Notice_modify,Notice_command,Link_index,Link_insert,Link_modify,Link_command,Page_index,Page_insert,Page_modify,Page_command,Ad_index,Ad_insert,Ad_modify,Ad_command,Tags,Comment_index,Comment_modify,Comment_command,Admin_index,Admin_insert,Admin_modify,Admin_command,Theme,AdminRole_index,AdminRole_insert,AdminRole_modify,AdminRole_command,Module_index,Module_install,Config_index,Config_core,Database_index,Database_export,AdminLog,Tools,Label', 1, 0, 1263392210);
