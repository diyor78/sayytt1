DROP TABLE IF EXISTS `cms_ads`;

CREATE TABLE `cms_ads` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `view` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `layout` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  `count_link` int(10) unsigned NOT NULL DEFAULT '0',
  `name` text NOT NULL,
  `link` text NOT NULL,
  `to` int(10) unsigned NOT NULL DEFAULT '0',
  `color` varchar(10) NOT NULL DEFAULT '',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `day` int(10) unsigned NOT NULL DEFAULT '0',
  `mesto` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `bold` tinyint(1) NOT NULL DEFAULT '0',
  `italic` tinyint(1) NOT NULL DEFAULT '0',
  `underline` tinyint(1) NOT NULL DEFAULT '0',
  `show` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;




DROP TABLE IF EXISTS `cms_album_cat`;

CREATE TABLE `cms_album_cat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sort` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(40) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `password` varchar(20) NOT NULL DEFAULT '',
  `access` tinyint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `access` (`access`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;




DROP TABLE IF EXISTS `cms_album_comments`;

CREATE TABLE `cms_album_comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sub_id` int(10) unsigned NOT NULL DEFAULT '0',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `text` text NOT NULL,
  `reply` text NOT NULL,
  `attributes` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sub_id` (`sub_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;




DROP TABLE IF EXISTS `cms_album_downloads`;

CREATE TABLE `cms_album_downloads` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `file_id` int(10) unsigned NOT NULL DEFAULT '0',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`file_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;




DROP TABLE IF EXISTS `cms_album_files`;

CREATE TABLE `cms_album_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `album_id` int(10) unsigned NOT NULL,
  `description` text NOT NULL,
  `img_name` varchar(100) NOT NULL DEFAULT '',
  `tmb_name` varchar(100) NOT NULL DEFAULT '',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `comments` tinyint(1) NOT NULL DEFAULT '1',
  `comm_count` int(10) unsigned NOT NULL DEFAULT '0',
  `access` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `vote_plus` int(11) NOT NULL DEFAULT '0',
  `vote_minus` int(11) NOT NULL DEFAULT '0',
  `views` int(10) unsigned NOT NULL DEFAULT '0',
  `downloads` int(10) unsigned NOT NULL DEFAULT '0',
  `unread_comments` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `album_id` (`album_id`),
  KEY `access` (`access`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;




DROP TABLE IF EXISTS `cms_album_views`;

CREATE TABLE `cms_album_views` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `file_id` int(10) unsigned NOT NULL DEFAULT '0',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`file_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;




DROP TABLE IF EXISTS `cms_album_votes`;

CREATE TABLE `cms_album_votes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `file_id` int(10) unsigned NOT NULL DEFAULT '0',
  `vote` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `file_id` (`file_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;




DROP TABLE IF EXISTS `cms_ban_ip`;

CREATE TABLE `cms_ban_ip` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip1` bigint(11) NOT NULL DEFAULT '0',
  `ip2` bigint(11) NOT NULL DEFAULT '0',
  `ban_type` tinyint(4) NOT NULL DEFAULT '0',
  `link` varchar(100) NOT NULL,
  `who` varchar(25) NOT NULL,
  `reason` text NOT NULL,
  `date` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ip1` (`ip1`),
  UNIQUE KEY `ip2` (`ip2`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;




DROP TABLE IF EXISTS `cms_ban_users`;

CREATE TABLE `cms_ban_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `ban_time` int(11) NOT NULL DEFAULT '0',
  `ban_while` int(11) NOT NULL DEFAULT '0',
  `ban_type` tinyint(4) NOT NULL DEFAULT '1',
  `ban_who` varchar(30) NOT NULL DEFAULT '',
  `ban_ref` int(11) NOT NULL DEFAULT '0',
  `ban_reason` text NOT NULL,
  `ban_raz` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `ban_time` (`ban_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;




DROP TABLE IF EXISTS `cms_contact`;

CREATE TABLE `cms_contact` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `from_id` int(10) unsigned NOT NULL DEFAULT '0',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `friends` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ban` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `man` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_user` (`user_id`,`from_id`),
  KEY `time` (`time`),
  KEY `ban` (`ban`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;




DROP TABLE IF EXISTS `cms_counters`;

CREATE TABLE `cms_counters` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sort` int(10) NOT NULL DEFAULT '1',
  `name` varchar(30) NOT NULL,
  `link1` text NOT NULL,
  `link2` text NOT NULL,
  `mode` tinyint(4) NOT NULL DEFAULT '1',
  `switch` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;




DROP TABLE IF EXISTS `cms_forum_files`;

CREATE TABLE `cms_forum_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cat` int(10) unsigned NOT NULL DEFAULT '0',
  `subcat` int(10) unsigned NOT NULL DEFAULT '0',
  `topic` int(10) unsigned NOT NULL DEFAULT '0',
  `post` int(10) unsigned NOT NULL DEFAULT '0',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `filename` text NOT NULL,
  `filetype` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `dlcount` int(10) unsigned NOT NULL DEFAULT '0',
  `del` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cat` (`cat`),
  KEY `subcat` (`subcat`),
  KEY `topic` (`topic`),
  KEY `post` (`post`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;




DROP TABLE IF EXISTS `cms_forum_rdm`;

CREATE TABLE `cms_forum_rdm` (
  `topic_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`topic_id`,`user_id`),
  KEY `time` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;




DROP TABLE IF EXISTS `cms_forum_vote`;

CREATE TABLE `cms_forum_vote` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(2) NOT NULL DEFAULT '0',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `topic` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(200) NOT NULL,
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `topic` (`topic`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;




DROP TABLE IF EXISTS `cms_forum_vote_users`;

CREATE TABLE `cms_forum_vote_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL DEFAULT '0',
  `topic` int(11) NOT NULL,
  `vote` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `topic` (`topic`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;




DROP TABLE IF EXISTS `cms_mail`;

CREATE TABLE `cms_mail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `from_id` int(10) unsigned NOT NULL DEFAULT '0',
  `text` text NOT NULL,
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `read` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sys` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `delete` int(10) unsigned NOT NULL DEFAULT '0',
  `file_name` varchar(100) NOT NULL DEFAULT '',
  `count` int(10) NOT NULL DEFAULT '0',
  `size` int(10) NOT NULL DEFAULT '0',
  `them` varchar(100) NOT NULL DEFAULT '',
  `spam` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `from_id` (`from_id`),
  KEY `time` (`time`),
  KEY `read` (`read`),
  KEY `sys` (`sys`),
  KEY `delete` (`delete`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;




DROP TABLE IF EXISTS `cms_sessions`;

CREATE TABLE `cms_sessions` (
  `session_id` char(32) NOT NULL DEFAULT '',
  `ip` bigint(11) NOT NULL DEFAULT '0',
  `ip_via_proxy` bigint(11) NOT NULL DEFAULT '0',
  `browser` varchar(255) NOT NULL DEFAULT '',
  `lastdate` int(10) unsigned NOT NULL DEFAULT '0',
  `sestime` int(10) unsigned NOT NULL DEFAULT '0',
  `views` int(10) unsigned NOT NULL DEFAULT '0',
  `movings` smallint(5) unsigned NOT NULL DEFAULT '0',
  `place` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`session_id`),
  KEY `lastdate` (`lastdate`),
  KEY `place` (`place`(10))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO cms_sessions VALUES("f2ecb22a115d56dc0d7fa2f30790ecbb","1385289926","3161573768","Opera Mini: NokiaX2-00","1397465236","1397465141","0","4","error404");
INSERT INTO cms_sessions VALUES("dc89b17b77a4013b1ed29d653b954a4f","1385290076","3161579200","Opera Mini: NokiaX2-00","1397466429","1397466415","0","1","news");



DROP TABLE IF EXISTS `cms_settings`;

CREATE TABLE `cms_settings` (
  `key` tinytext NOT NULL,
  `val` text NOT NULL,
  PRIMARY KEY (`key`(30))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO cms_settings VALUES("active","1");
INSERT INTO cms_settings VALUES("admp","panel");
INSERT INTO cms_settings VALUES("antiflood","a:5:{s:4:\"mode\";i:2;s:3:\"day\";i:10;s:5:\"night\";i:30;s:7:\"dayfrom\";i:10;s:5:\"dayto\";i:22;}");
INSERT INTO cms_settings VALUES("clean_time","1397463603");
INSERT INTO cms_settings VALUES("copyright","www.UzDISCO.Ru");
INSERT INTO cms_settings VALUES("email","broker-master@bk.ru");
INSERT INTO cms_settings VALUES("flsz","4000");
INSERT INTO cms_settings VALUES("gzip","1");
INSERT INTO cms_settings VALUES("homeurl","http://uzdisco.ru");
INSERT INTO cms_settings VALUES("karma","a:6:{s:12:\"karma_points\";i:5;s:10:\"karma_time\";i:86400;s:5:\"forum\";i:20;s:4:\"time\";i:0;s:2:\"on\";i:1;s:3:\"adm\";i:0;}");
INSERT INTO cms_settings VALUES("lng","uz");
INSERT INTO cms_settings VALUES("mod_reg","2");
INSERT INTO cms_settings VALUES("mod_forum","2");
INSERT INTO cms_settings VALUES("mod_guest","2");
INSERT INTO cms_settings VALUES("mod_lib","2");
INSERT INTO cms_settings VALUES("mod_gal","2");
INSERT INTO cms_settings VALUES("mod_down_comm","1");
INSERT INTO cms_settings VALUES("mod_down","2");
INSERT INTO cms_settings VALUES("mod_lib_comm","1");
INSERT INTO cms_settings VALUES("mod_gal_comm","1");
INSERT INTO cms_settings VALUES("meta_desc","Powered by BMaster");
INSERT INTO cms_settings VALUES("meta_key","uzdisco");
INSERT INTO cms_settings VALUES("news","a:8:{s:4:\"view\";i:1;s:4:\"size\";i:200;s:8:\"quantity\";i:5;s:4:\"days\";i:3;s:6:\"breaks\";i:1;s:7:\"smileys\";i:1;s:4:\"tags\";i:1;s:3:\"kom\";i:1;}");
INSERT INTO cms_settings VALUES("reg_message","");
INSERT INTO cms_settings VALUES("setting_mail","");
INSERT INTO cms_settings VALUES("skindef","musiqiy");
INSERT INTO cms_settings VALUES("them_message","");
INSERT INTO cms_settings VALUES("timeshift","0");
INSERT INTO cms_settings VALUES("site_access","2");
INSERT INTO cms_settings VALUES("lng_list","a:15:{s:2:\"az\";s:13:\"Azәrbaycanca\";s:2:\"cn\";s:6:\"中文\";s:2:\"de\";s:7:\"Deutsch\";s:2:\"en\";s:7:\"English\";s:2:\"ge\";s:21:\"ქართული\";s:2:\"id\";s:9:\"Indonesia\";s:2:\"kz\";s:14:\"Қазақша\";s:2:\"lv\";s:9:\"Latviešu\";s:2:\"pl\";s:6:\"Polski\";s:2:\"ro\";s:8:\"Română\";s:2:\"ru\";s:14:\"Русский\";s:2:\"tj\";s:12:\"Тоҷики\";s:2:\"uk\";s:20:\"Українська\";s:2:\"uz\";s:9:\"O\'zbekcha\";s:2:\"vn\";s:10:\"Việt Nam\";}");



DROP TABLE IF EXISTS `cms_users_data`;

CREATE TABLE `cms_users_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `key` varchar(30) NOT NULL DEFAULT '',
  `val` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `key` (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;




DROP TABLE IF EXISTS `cms_users_guestbook`;

CREATE TABLE `cms_users_guestbook` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sub_id` int(10) unsigned NOT NULL,
  `time` int(11) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `text` text NOT NULL,
  `reply` text NOT NULL,
  `attributes` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sub_id` (`sub_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;




DROP TABLE IF EXISTS `cms_users_iphistory`;

CREATE TABLE `cms_users_iphistory` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `ip` bigint(11) NOT NULL DEFAULT '0',
  `ip_via_proxy` bigint(11) NOT NULL DEFAULT '0',
  `time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `user_ip` (`ip`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO cms_users_iphistory VALUES("1","1","3283975108","0","1397463603");
INSERT INTO cms_users_iphistory VALUES("2","1","3283975108","628019888","1397465125");



DROP TABLE IF EXISTS `down_bookmarks`;

CREATE TABLE `down_bookmarks` (
  `user` int(11) NOT NULL,
  `file` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;




DROP TABLE IF EXISTS `downfiles`;

CREATE TABLE `downfiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(2) NOT NULL DEFAULT '0',
  `pathid` int(11) NOT NULL,
  `way` text NOT NULL,
  `name` text NOT NULL,
  `desc` text NOT NULL,
  `time` int(11) NOT NULL,
  `rating` varchar(3) NOT NULL DEFAULT '0',
  `gol` text NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  `size` int(11) NOT NULL DEFAULT '0',
  `login` text NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '1',
  `themeid` int(11) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `pathid` (`pathid`),
  KEY `time` (`time`),
  KEY `type_status` (`type`,`status`),
  FULLTEXT KEY `desc` (`desc`),
  FULLTEXT KEY `way` (`way`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;




DROP TABLE IF EXISTS `downkomm`;

CREATE TABLE `downkomm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fileid` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `text` text NOT NULL,
  `plus` int(11) NOT NULL,
  `minus` int(11) NOT NULL,
  `golos` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;




DROP TABLE IF EXISTS `download`;

CREATE TABLE `download` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `refid` int(11) NOT NULL DEFAULT '0',
  `adres` text NOT NULL,
  `time` int(11) NOT NULL DEFAULT '0',
  `name` text NOT NULL,
  `type` varchar(4) NOT NULL DEFAULT '',
  `avtor` varchar(25) NOT NULL DEFAULT '',
  `ip` text NOT NULL,
  `soft` text NOT NULL,
  `text` text NOT NULL,
  `screen` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `refid` (`refid`),
  KEY `time` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;




DROP TABLE IF EXISTS `downpath`;

CREATE TABLE `downpath` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `refid` int(11) NOT NULL,
  `way` text NOT NULL,
  `name` text NOT NULL,
  `desc` text NOT NULL,
  `position` int(11) NOT NULL,
  `dost` int(11) NOT NULL DEFAULT '0',
  `types` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `ref` (`refid`),
  KEY `position` (`position`),
  FULLTEXT KEY `way` (`way`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO downpath VALUES("1","0","uzbek/","O`zbekcha","","0","0","");
INSERT INTO downpath VALUES("2","0","yoshlar/","Yosh xonandalar","","0","0","");
INSERT INTO downpath VALUES("3","0","xorij/","Xorij","","0","0","");
INSERT INTO downpath VALUES("4","0","klip/","Kliplar","","0","0","");



DROP TABLE IF EXISTS `downscreen`;

CREATE TABLE `downscreen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fileid` int(11) NOT NULL,
  `way` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;




DROP TABLE IF EXISTS `forum`;

CREATE TABLE `forum` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `refid` int(10) unsigned NOT NULL DEFAULT '0',
  `type` char(1) NOT NULL DEFAULT '',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `from` varchar(25) NOT NULL DEFAULT '',
  `realid` int(3) NOT NULL DEFAULT '0',
  `ip` bigint(11) NOT NULL DEFAULT '0',
  `ip_via_proxy` bigint(11) NOT NULL DEFAULT '0',
  `soft` text NOT NULL,
  `text` text NOT NULL,
  `close` tinyint(1) NOT NULL DEFAULT '0',
  `close_who` varchar(25) NOT NULL DEFAULT '',
  `vip` tinyint(1) NOT NULL DEFAULT '0',
  `edit` text NOT NULL,
  `tedit` int(10) unsigned NOT NULL DEFAULT '0',
  `kedit` int(2) unsigned NOT NULL DEFAULT '0',
  `curators` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `refid` (`refid`),
  KEY `type` (`type`),
  KEY `time` (`time`),
  KEY `close` (`close`),
  KEY `user_id` (`user_id`),
  FULLTEXT KEY `text` (`text`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;




DROP TABLE IF EXISTS `gallery`;

CREATE TABLE `gallery` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `refid` int(11) NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL DEFAULT '0',
  `type` varchar(2) NOT NULL DEFAULT '',
  `avtor` varchar(25) NOT NULL DEFAULT '',
  `text` text NOT NULL,
  `name` text NOT NULL,
  `user` binary(1) NOT NULL DEFAULT '\0',
  `ip` text NOT NULL,
  `soft` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `refid` (`refid`),
  KEY `type` (`type`),
  KEY `time` (`time`),
  KEY `avtor` (`avtor`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;




DROP TABLE IF EXISTS `guest`;

CREATE TABLE `guest` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `adm` tinyint(1) NOT NULL DEFAULT '0',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(25) NOT NULL DEFAULT '',
  `text` text NOT NULL,
  `ip` bigint(11) NOT NULL DEFAULT '0',
  `browser` tinytext NOT NULL,
  `admin` varchar(25) NOT NULL DEFAULT '',
  `otvet` text NOT NULL,
  `otime` int(10) unsigned NOT NULL DEFAULT '0',
  `edit_who` varchar(20) NOT NULL DEFAULT '',
  `edit_time` int(10) unsigned NOT NULL DEFAULT '0',
  `edit_count` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `time` (`time`),
  KEY `ip` (`ip`),
  KEY `adm` (`adm`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;




DROP TABLE IF EXISTS `karma_users`;

CREATE TABLE `karma_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  `karma_user` int(10) unsigned NOT NULL DEFAULT '0',
  `points` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `text` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `karma_user` (`karma_user`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;




DROP TABLE IF EXISTS `lib`;

CREATE TABLE `lib` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `refid` int(10) unsigned NOT NULL DEFAULT '0',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(4) NOT NULL DEFAULT '',
  `name` tinytext NOT NULL,
  `announce` text NOT NULL,
  `avtor` varchar(25) NOT NULL DEFAULT '',
  `text` mediumtext NOT NULL,
  `ip` int(11) NOT NULL DEFAULT '0',
  `soft` text NOT NULL,
  `moder` tinyint(1) NOT NULL DEFAULT '0',
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `moder` (`moder`),
  KEY `time` (`time`),
  KEY `refid` (`refid`),
  FULLTEXT KEY `name` (`name`),
  FULLTEXT KEY `text` (`text`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;




DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `avt` varchar(25) NOT NULL DEFAULT '',
  `name` text NOT NULL,
  `text` text NOT NULL,
  `kom` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;




DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL DEFAULT '',
  `name_lat` varchar(40) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `rights` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `failed_login` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `imname` varchar(50) NOT NULL DEFAULT '',
  `sex` varchar(2) NOT NULL DEFAULT '',
  `komm` int(10) unsigned NOT NULL DEFAULT '0',
  `postforum` int(10) unsigned NOT NULL DEFAULT '0',
  `postguest` int(10) unsigned NOT NULL DEFAULT '0',
  `yearofbirth` int(4) NOT NULL DEFAULT '0',
  `datereg` int(10) unsigned NOT NULL DEFAULT '0',
  `lastdate` int(10) unsigned NOT NULL DEFAULT '0',
  `mail` varchar(50) NOT NULL DEFAULT '',
  `icq` int(10) unsigned NOT NULL DEFAULT '0',
  `skype` varchar(50) NOT NULL DEFAULT '',
  `jabber` varchar(50) NOT NULL DEFAULT '',
  `www` varchar(50) NOT NULL DEFAULT '',
  `about` text NOT NULL,
  `live` varchar(100) NOT NULL DEFAULT '',
  `mibile` varchar(50) NOT NULL DEFAULT '',
  `status` varchar(100) NOT NULL DEFAULT '',
  `ip` bigint(11) NOT NULL DEFAULT '0',
  `ip_via_proxy` bigint(11) NOT NULL DEFAULT '0',
  `browser` text NOT NULL,
  `preg` tinyint(1) NOT NULL DEFAULT '0',
  `regadm` varchar(25) NOT NULL DEFAULT '',
  `mailvis` tinyint(1) NOT NULL DEFAULT '0',
  `dayb` int(2) NOT NULL DEFAULT '0',
  `monthb` int(2) NOT NULL DEFAULT '0',
  `sestime` int(10) unsigned NOT NULL DEFAULT '0',
  `total_on_site` int(10) unsigned NOT NULL DEFAULT '0',
  `lastpost` int(10) unsigned NOT NULL DEFAULT '0',
  `rest_code` varchar(32) NOT NULL DEFAULT '',
  `rest_time` int(10) unsigned NOT NULL DEFAULT '0',
  `movings` int(10) unsigned NOT NULL DEFAULT '0',
  `place` varchar(30) NOT NULL DEFAULT '',
  `set_user` text NOT NULL,
  `set_forum` text NOT NULL,
  `set_mail` text NOT NULL,
  `karma_plus` int(11) NOT NULL DEFAULT '0',
  `karma_minus` int(11) NOT NULL DEFAULT '0',
  `karma_time` int(10) unsigned NOT NULL DEFAULT '0',
  `karma_off` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `comm_count` int(10) unsigned NOT NULL DEFAULT '0',
  `comm_old` int(10) unsigned NOT NULL DEFAULT '0',
  `smileys` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name_lat` (`name_lat`),
  KEY `lastdate` (`lastdate`),
  KEY `place` (`place`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO users VALUES("1","Admin","admin","e06c34521ef428b20bcbc6d63c138446","9","0","","m","0","0","0","0","1397463603","1397466964","broker-master@bk.ru","0","","","http://uzdisco.ru","","","","","3283975108","628020544","NokiaX3-02/5.0 (06.00) Profile/MIDP-2.1 Configuration/CLDC-1.1 UCWEB/2.0 (Java; U; MIDP-2.0; ru; NokiaX3-02) U2/1.0.0 UCBrowser/9.4.1.377 U2/1.0.0 Mob","1","","0","0","0","1397466628","1623","0","","0","28","error404","a:12:{s:6:\"avatar\";b:1;s:6:\"digest\";b:0;s:10:\"direct_url\";b:0;s:7:\"field_h\";i:3;s:7:\"field_w\";i:20;s:5:\"kmess\";i:20;s:8:\"quick_go\";b:0;s:9:\"timeshift\";i:0;s:4:\"skin\";s:7:\"musiqiy\";s:7:\"smileys\";b:1;s:8:\"translit\";b:0;s:3:\"lng\";s:2:\"uz\";}","","","0","0","1397463609","0","0","0","");



