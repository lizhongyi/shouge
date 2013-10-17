-- phpMyAdmin SQL Dump
-- version 3.2.5
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2011 年 09 月 21 日 03:19
-- 服务器版本: 5.0.89
-- PHP 版本: 5.2.12

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- 数据库: `sgcms`
--

-- --------------------------------------------------------

--
-- 表的结构 `sgcorp_solution`
--

CREATE TABLE IF NOT EXISTS `sgcorp_solution` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(50) NOT NULL,
  `cat` char(10) NOT NULL,
  `catname` varchar(20) NOT NULL,
  `content` text NOT NULL,
  `add_time` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `sgcorp_solution`
--

