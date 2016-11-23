/*
Navicat MySQL Data Transfer

Source Server         : MYSQL
Source Server Version : 50622
Source Host           : localhost:3306
Source Database       : twcn

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2016-11-23 17:03:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for directmsgs
-- ----------------------------
DROP TABLE IF EXISTS `directmsgs`;
CREATE TABLE `directmsgs` (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `huid` int(11) NOT NULL,
  `suid` int(11) NOT NULL,
  `dcontent` varchar(1000) NOT NULL,
  `msgtime` datetime NOT NULL,
  `dstate` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`did`),
  KEY `FK_Relationship_16` (`suid`),
  KEY `FK_Relationship_17` (`huid`),
  CONSTRAINT `FK_Relationship_16` FOREIGN KEY (`suid`) REFERENCES `users` (`uid`),
  CONSTRAINT `FK_Relationship_17` FOREIGN KEY (`huid`) REFERENCES `users` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of directmsgs
-- ----------------------------

-- ----------------------------
-- Table structure for forwards
-- ----------------------------
DROP TABLE IF EXISTS `forwards`;
CREATE TABLE `forwards` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `fcontent` varchar(200) NOT NULL,
  `forwardtime` datetime NOT NULL,
  `fstate` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`fid`),
  KEY `FK_Relationship_19` (`tid`),
  KEY `FK_Relationship_20` (`uid`),
  CONSTRAINT `FK_Relationship_19` FOREIGN KEY (`tid`) REFERENCES `tweets` (`tid`),
  CONSTRAINT `FK_Relationship_20` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of forwards
-- ----------------------------

-- ----------------------------
-- Table structure for likes
-- ----------------------------
DROP TABLE IF EXISTS `likes`;
CREATE TABLE `likes` (
  `lid` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `liketime` datetime NOT NULL,
  PRIMARY KEY (`lid`),
  KEY `FK_Relationship_11` (`tid`),
  KEY `FK_Relationship_12` (`uid`),
  CONSTRAINT `FK_Relationship_11` FOREIGN KEY (`tid`) REFERENCES `tweets` (`tid`),
  CONSTRAINT `FK_Relationship_12` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of likes
-- ----------------------------

-- ----------------------------
-- Table structure for mentions
-- ----------------------------
DROP TABLE IF EXISTS `mentions`;
CREATE TABLE `mentions` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `tid` int(11) NOT NULL,
  PRIMARY KEY (`mid`),
  KEY `FK_Relationship_23` (`tid`),
  KEY `FK_Relationship_24` (`uid`),
  CONSTRAINT `FK_Relationship_23` FOREIGN KEY (`tid`) REFERENCES `tweets` (`tid`),
  CONSTRAINT `FK_Relationship_24` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mentions
-- ----------------------------

-- ----------------------------
-- Table structure for pics
-- ----------------------------
DROP TABLE IF EXISTS `pics`;
CREATE TABLE `pics` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(200) NOT NULL,
  `ppath` varchar(200) NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pics
-- ----------------------------

-- ----------------------------
-- Table structure for relationships
-- ----------------------------
DROP TABLE IF EXISTS `relationships`;
CREATE TABLE `relationships` (
  `rsid` int(11) NOT NULL AUTO_INCREMENT,
  `huid` int(11) NOT NULL,
  `suid` int(11) NOT NULL,
  `followtime` datetime DEFAULT CURRENT_TIMESTAMP,
  `rsstate` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`rsid`),
  KEY `FK_Relationship_2` (`suid`),
  KEY `FK_Relationship_3` (`huid`),
  CONSTRAINT `FK_Relationship_2` FOREIGN KEY (`suid`) REFERENCES `users` (`uid`),
  CONSTRAINT `FK_Relationship_3` FOREIGN KEY (`huid`) REFERENCES `users` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of relationships
-- ----------------------------
INSERT INTO `relationships` VALUES ('1', '1', '2', '2016-11-22 11:32:11', '1');
INSERT INTO `relationships` VALUES ('2', '1', '3', '2016-11-22 11:32:44', '1');
INSERT INTO `relationships` VALUES ('3', '1', '4', '2016-11-22 11:32:52', '1');
INSERT INTO `relationships` VALUES ('4', '2', '1', '2016-11-22 11:33:02', '1');
INSERT INTO `relationships` VALUES ('5', '2', '3', '2016-11-22 11:33:32', '1');
INSERT INTO `relationships` VALUES ('6', '1', '1', '2016-11-23 16:09:13', '1');
INSERT INTO `relationships` VALUES ('7', '17', '17', '2016-11-23 16:58:54', '1');
INSERT INTO `relationships` VALUES ('8', '2', '2', '2016-11-23 17:00:38', '1');
INSERT INTO `relationships` VALUES ('9', '3', '3', '2016-11-23 17:00:41', '1');
INSERT INTO `relationships` VALUES ('10', '4', '4', '2016-11-23 17:00:43', '1');
INSERT INTO `relationships` VALUES ('11', '5', '5', '2016-11-23 17:00:46', '1');

-- ----------------------------
-- Table structure for replays
-- ----------------------------
DROP TABLE IF EXISTS `replays`;
CREATE TABLE `replays` (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `huid` int(11) NOT NULL,
  `suid` int(11) NOT NULL,
  `tid` int(11) NOT NULL,
  `rcontent` varchar(1000) NOT NULL,
  `replaytime` datetime NOT NULL,
  `rstate` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`rid`),
  KEY `FK_Relationship_13` (`tid`),
  KEY `FK_Relationship_14` (`suid`),
  KEY `FK_Relationship_15` (`huid`),
  CONSTRAINT `FK_Relationship_13` FOREIGN KEY (`tid`) REFERENCES `tweets` (`tid`),
  CONSTRAINT `FK_Relationship_14` FOREIGN KEY (`suid`) REFERENCES `users` (`uid`),
  CONSTRAINT `FK_Relationship_15` FOREIGN KEY (`huid`) REFERENCES `users` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of replays
-- ----------------------------

-- ----------------------------
-- Table structure for t2p
-- ----------------------------
DROP TABLE IF EXISTS `t2p`;
CREATE TABLE `t2p` (
  `tpid` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  PRIMARY KEY (`tpid`),
  KEY `FK_Relationship_10` (`pid`),
  KEY `FK_Relationship_9` (`tid`),
  CONSTRAINT `FK_Relationship_10` FOREIGN KEY (`pid`) REFERENCES `pics` (`pid`),
  CONSTRAINT `FK_Relationship_9` FOREIGN KEY (`tid`) REFERENCES `tweets` (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t2p
-- ----------------------------

-- ----------------------------
-- Table structure for t2t
-- ----------------------------
DROP TABLE IF EXISTS `t2t`;
CREATE TABLE `t2t` (
  `ttid` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) NOT NULL,
  `tpid` int(11) NOT NULL,
  PRIMARY KEY (`ttid`),
  KEY `FK_Relationship_21` (`tid`),
  KEY `FK_Relationship_22` (`tpid`),
  CONSTRAINT `FK_Relationship_21` FOREIGN KEY (`tid`) REFERENCES `tweets` (`tid`),
  CONSTRAINT `FK_Relationship_22` FOREIGN KEY (`tpid`) REFERENCES `topics` (`tpid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t2t
-- ----------------------------

-- ----------------------------
-- Table structure for topics
-- ----------------------------
DROP TABLE IF EXISTS `topics`;
CREATE TABLE `topics` (
  `tpid` int(11) NOT NULL AUTO_INCREMENT,
  `tpcontent` varchar(200) NOT NULL,
  PRIMARY KEY (`tpid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of topics
-- ----------------------------

-- ----------------------------
-- Table structure for tweets
-- ----------------------------
DROP TABLE IF EXISTS `tweets`;
CREATE TABLE `tweets` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `vid` int(11) DEFAULT NULL,
  `uid` int(11) NOT NULL,
  `tcontent` varchar(200) NOT NULL,
  `tweettime` datetime NOT NULL,
  `tstate` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`tid`),
  KEY `FK_Relationship_18` (`vid`),
  KEY `FK_Relationship_6` (`uid`),
  CONSTRAINT `FK_Relationship_18` FOREIGN KEY (`vid`) REFERENCES `videos` (`vid`),
  CONSTRAINT `FK_Relationship_6` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tweets
-- ----------------------------
INSERT INTO `tweets` VALUES ('1', null, '1', 'sdfsdfaslkdjfllksjflk', '2016-11-23 10:02:51', '1');
INSERT INTO `tweets` VALUES ('2', null, '1', 'dg所发生的上的规划规划法规计划截图已经', '2016-11-23 10:03:05', '1');
INSERT INTO `tweets` VALUES ('3', null, '1', '水电费和愉快体验流浪鱼冗余及法规和规范化', '2016-11-23 10:03:18', '1');
INSERT INTO `tweets` VALUES ('4', null, '1', 'ullhgjkfg是打工奋斗GV给对方', '2016-11-23 10:03:33', '1');
INSERT INTO `tweets` VALUES ('5', null, '2', 'dfsdgfd的风格和速度发货', '2016-11-23 10:03:45', '1');
INSERT INTO `tweets` VALUES ('6', null, '1', 'sddfg这首歌是德国但是风格大方个', '2016-11-23 10:04:19', '1');
INSERT INTO `tweets` VALUES ('7', null, '2', '拉开距离考试', '2016-11-23 11:25:04', '1');
INSERT INTO `tweets` VALUES ('8', null, '3', 'test1', '2016-11-23 13:34:36', '1');
INSERT INTO `tweets` VALUES ('9', null, '2', 'tesff1', '2016-11-22 13:34:36', '1');
INSERT INTO `tweets` VALUES ('10', null, '3', 'testsdff1', '2016-11-23 13:34:36', '1');
INSERT INTO `tweets` VALUES ('11', null, '4', 'testsdfg1', '2016-11-25 13:34:36', '1');
INSERT INTO `tweets` VALUES ('12', null, '5', 'testsdfg1', '2016-11-13 13:34:36', '1');
INSERT INTO `tweets` VALUES ('13', null, '2', 'tesff1', '2016-11-22 13:34:26', '1');
INSERT INTO `tweets` VALUES ('14', null, '3', 'testsdff1', '2016-11-23 13:34:16', '1');
INSERT INTO `tweets` VALUES ('15', null, '4', 'testsdfg1', '2016-11-25 13:34:56', '1');
INSERT INTO `tweets` VALUES ('16', null, '5', 'testsdfg1', '2016-11-13 13:34:36', '1');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(200) NOT NULL COMMENT '添加唯一索引。使得可以根据用户名或者邮箱登录',
  `telphone` varchar(50) DEFAULT NULL,
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `gender` tinyint(4) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `city` varchar(200) DEFAULT NULL,
  `avatar` varchar(200) DEFAULT 'img/avatar/default_profit.png',
  `bio` varchar(1000) DEFAULT NULL,
  `registtime` datetime DEFAULT CURRENT_TIMESTAMP,
  `ustate` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `Unique_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'nick', '123', '123@qq.com', null, 'nick', null, null, null, 'img/avatar/GMZ5UIRl_bigger.jpeg', null, '2016-11-21 11:26:51', '1');
INSERT INTO `users` VALUES ('2', 'quadi', '123', '1234@qq.com', null, 'quadi', null, null, null, 'img/avatar/XT79xzRT_bigger.jpg', null, null, '1');
INSERT INTO `users` VALUES ('3', 'sdfg', '123', '12345@qq.com', null, 'sdfg', null, null, null, 'img/avatar/default_profit.png', null, null, '1');
INSERT INTO `users` VALUES ('4', 'eer', '234', 'sdfsdf', null, 'dsdfsd', null, null, null, null, null, '2016-11-22 10:59:02', '1');
INSERT INTO `users` VALUES ('5', 'dgasd', 'sdf', '123123@qq.com', null, 'dgasd', null, null, null, null, null, '2016-11-22 11:03:11', '1');
INSERT INTO `users` VALUES ('16', 'sfsdffd', 'sdsdf', 'sadfsf@sdfs.cc', null, 'sfsdffd', null, null, null, 'img/avatar/default_profit.png', null, '2016-11-23 16:55:15', '1');
INSERT INTO `users` VALUES ('17', 'sdfsdf', 'sdfs', 'sadfsf@sdfsd.ff', null, 'sdfsdf', null, null, null, 'img/avatar/default_profit.png', null, '2016-11-23 16:58:39', '1');

-- ----------------------------
-- Table structure for videos
-- ----------------------------
DROP TABLE IF EXISTS `videos`;
CREATE TABLE `videos` (
  `vid` int(11) NOT NULL AUTO_INCREMENT,
  `vname` varchar(200) NOT NULL,
  `vpath` varchar(200) NOT NULL,
  PRIMARY KEY (`vid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of videos
-- ----------------------------
