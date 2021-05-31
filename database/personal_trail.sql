-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 31, 2021 at 04:12 AM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `personal_trail`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
CREATE TABLE `articles` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `content` text,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `publish_date` date DEFAULT NULL,
  `clean_url` varchar(100) NOT NULL,
  `views` double NOT NULL DEFAULT '0',
  `status` varchar(45) DEFAULT 'active',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_user_id` int(11) DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  `deleted_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `title`, `description`, `content`, `author_id`, `category_id`, `publish_date`, `clean_url`, `views`, `status`, `created_at`, `updated_at`, `updated_user_id`, `deleted_date`, `deleted_user_id`) VALUES
(1, 'Ligula Tristique Malesuada Venenatis Fermentum', 'Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Cras mattis consectetur purus sit amet fermentum. Aenean lacinia bibendum nulla sed consectetur. Curabitur blandit tempus porttitor. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor.\n\nDonec sed odio dui consectetur adipiscing elit. Etiam adipiscing tincidunt elit, eu convallis felis suscipit ut. Pha', '<p>Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Cras mattis consectetur purus sit amet fermentum. Aenean lacinia bibendum nulla sed consectetur. Curabitur blandit tempus porttitor. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor.</p>\n\n<p>Donec sed odio dui consectetur adipiscing elit. Etiam adipiscing tincidunt elit, eu convallis felis suscipit ut. Phasellus rhoncus tincidunt auctor. Nullam eu sagittis mauris. Donec non dolor ac elit aliquam tincidunt at at sapien. Aenean tortor libero, condimentum ac laoreet vitae, varius tempor nisi. Duis non arcu vel lectus.</p>\n\n<blockquote>\n<p>Pellentesque non diam et tortor dignissim bibendum. Neque sit amet mauris egestas quis mattis velit fringilla. Curabitur viver justo sed scelerisque. Cras mattis consectetur purus sit amet fermentum. Aenean eu leo quam.</p>\n<small>VERY IMPORTANT PERSON</small></blockquote>\n\n<h3>Sit Vulputate Bibendum Purus</h3>\n\n<p>Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Aenean lacinia bibendum nulla sed consectetur. Cras mattis consectetur purus sit amet fermentum. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vestibulum id ligula porta felis euismod semper. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.</p>\n\n<p><a href="http://themes.iki-bir.com/juno7/style/images/art/bc2-full.jpg"><img alt="" src="http://themes.iki-bir.com/juno7/style/images/art/bc2.jpg" /></a><a href="http://themes.iki-bir.com/juno7/style/images/art/bc4-full.jpg"><img alt="" src="http://themes.iki-bir.com/juno7/style/images/art/bc4.jpg" /></a></p>\n\n<p><a href="http://themes.iki-bir.com/juno7/style/images/art/bc3-full.jpg"><img alt="" src="http://themes.iki-bir.com/juno7/style/images/art/bc3.jpg" /></a><a href="http://themes.iki-bir.com/juno7/style/images/art/bc5-full.jpg"><img alt="" src="http://themes.iki-bir.com/juno7/style/images/art/bc5.jpg" /></a></p>\n\n<p><a href="http://themes.iki-bir.com/juno7/style/images/art/bc6-full.jpg"><img alt="" src="http://themes.iki-bir.com/juno7/style/images/art/bc6.jpg" /></a><a href="http://themes.iki-bir.com/juno7/style/images/art/bc1-full.jpg"><img alt="" src="http://themes.iki-bir.com/juno7/style/images/art/bc1.jpg" /></a></p>\n\n<p>Cras mattis consectetur purus sit amet fermentum. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Nullam id dolor id nibh ultricies vehicula ut id elit. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Cras mattis consectetur purus sit amet fermentum. Donec sed odio dui. Donec id elit non mi porta gravida at eget metus. Maecenas faucibus mollis interdum. Cras mattis consectetur purus sit amet fermentum. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Vestibulum id ligula porta felis euismod semper. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cras mattis consectetur purus sit amet fermentum.</p>\n', 1, 1, '2017-03-09', 'ligula-tristique-malesuada-venenatis-fermentum', 58, 'active', '2017-03-09 06:41:51', '2017-03-29 10:09:37', NULL, NULL, NULL),
(2, 'Cursus Quam Ullamcorper Cras Ornare Dolor Mollis Nullam', 'Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Cras mattis consectetur purus sit amet fermentum. Aenean lacinia bibendum nulla sed consectetur. Curabitur blandit tempus porttitor. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor.\n\nDonec sed odio dui consectetur adipiscing elit. Etiam adipiscing tincidunt elit, eu convallis felis suscipit ut. Pha', '<p>Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Cras mattis consectetur purus sit amet fermentum. Aenean lacinia bibendum nulla sed consectetur. Curabitur blandit tempus porttitor. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor.</p>\n\n<p>Donec sed odio dui consectetur adipiscing elit. Etiam adipiscing tincidunt elit, eu convallis felis suscipit ut. Phasellus rhoncus tincidunt auctor. Nullam eu sagittis mauris. Donec non dolor ac elit aliquam tincidunt at at sapien. Aenean tortor libero, condimentum ac laoreet vitae, varius tempor nisi. Duis non arcu vel lectus.</p>\n\n<blockquote>\n<p>Pellentesque non diam et tortor dignissim bibendum. Neque sit amet mauris egestas quis mattis velit fringilla. Curabitur viver justo sed scelerisque. Cras mattis consectetur purus sit amet fermentum. Aenean eu leo quam.</p>\n<small>VERY IMPORTANT PERSON</small></blockquote>\n\n<h3>Sit Vulputate Bibendum Purus</h3>\n\n<p>Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Aenean lacinia bibendum nulla sed consectetur. Cras mattis consectetur purus sit amet fermentum. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vestibulum id ligula porta felis euismod semper. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.</p>\n\n<p><a href="http://themes.iki-bir.com/juno7/style/images/art/bc1-full.jpg"><img alt="" src="http://themes.iki-bir.com/juno7/style/images/art/bc1.jpg" /></a></p>\n\n<p><a href="http://themes.iki-bir.com/juno7/style/images/art/bc2-full.jpg"><img alt="" src="http://themes.iki-bir.com/juno7/style/images/art/bc2.jpg" /></a></p>\n\n<p><a href="http://themes.iki-bir.com/juno7/style/images/art/bc3-full.jpg"><img alt="" src="http://themes.iki-bir.com/juno7/style/images/art/bc3.jpg" /></a></p>\n\n<p><a href="http://themes.iki-bir.com/juno7/style/images/art/bc4-full.jpg"><img alt="" src="http://themes.iki-bir.com/juno7/style/images/art/bc4.jpg" /></a></p>\n\n<p><a href="http://themes.iki-bir.com/juno7/style/images/art/bc5-full.jpg"><img alt="" src="http://themes.iki-bir.com/juno7/style/images/art/bc5.jpg" /></a></p>\n\n<p><a href="http://themes.iki-bir.com/juno7/style/images/art/bc6-full.jpg"><img alt="" src="http://themes.iki-bir.com/juno7/style/images/art/bc6.jpg" /></a></p>\n\n<p>Cras mattis consectetur purus sit amet fermentum. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Nullam id dolor id nibh ultricies vehicula ut id elit. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Cras mattis consectetur purus sit amet fermentum. Donec sed odio dui. Donec id elit non mi porta gravida at eget metus. Maecenas faucibus mollis interdum. Cras mattis consectetur purus sit amet fermentum. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Vestibulum id ligula porta felis euismod semper. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cras mattis consectetur purus sit amet fermentum.</p>\n', 1, 1, '2017-03-09', 'cursus-quam-ullamcorper-cras-ornare-dolor-mollis-nullam', 23, 'active', '2017-03-09 06:41:51', '2017-03-29 04:03:10', NULL, NULL, NULL),
(3, 'Fringilla Ligula Consectetur Ridiculus Fermentum Cras Dapibus', 'Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Cras mattis consectetur purus sit amet fermentum. Aenean lacinia bibendum nulla sed consectetur. Curabitur blandit tempus porttitor. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor.\n\nDonec sed odio dui consectetur adipiscing elit. Etiam adipiscing tincidunt elit, eu convallis felis suscipit ut. Pha', '<p>Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Cras mattis consectetur purus sit amet fermentum. Aenean lacinia bibendum nulla sed consectetur. Curabitur blandit tempus porttitor. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor.</p>\n\n<p>Donec sed odio dui consectetur adipiscing elit. Etiam adipiscing tincidunt elit, eu convallis felis suscipit ut. Phasellus rhoncus tincidunt auctor. Nullam eu sagittis mauris. Donec non dolor ac elit aliquam tincidunt at at sapien. Aenean tortor libero, condimentum ac laoreet vitae, varius tempor nisi. Duis non arcu vel lectus.</p>\n\n<blockquote>\n<p>Pellentesque non diam et tortor dignissim bibendum. Neque sit amet mauris egestas quis mattis velit fringilla. Curabitur viver justo sed scelerisque. Cras mattis consectetur purus sit amet fermentum. Aenean eu leo quam.</p>\n<small>VERY IMPORTANT PERSON</small></blockquote>\n\n<h3>Sit Vulputate Bibendum Purus</h3>\n\n<p>Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Aenean lacinia bibendum nulla sed consectetur. Cras mattis consectetur purus sit amet fermentum. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vestibulum id ligula porta felis euismod semper. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.</p>\n\n<p><a href="http://themes.iki-bir.com/juno7/style/images/art/bc1-full.jpg"><img alt="" src="http://themes.iki-bir.com/juno7/style/images/art/bc1.jpg" /></a></p>\n\n<p><a href="http://themes.iki-bir.com/juno7/style/images/art/bc2-full.jpg"><img alt="" src="http://themes.iki-bir.com/juno7/style/images/art/bc2.jpg" /></a></p>\n\n<p><a href="http://themes.iki-bir.com/juno7/style/images/art/bc3-full.jpg"><img alt="" src="http://themes.iki-bir.com/juno7/style/images/art/bc3.jpg" /></a></p>\n\n<p><a href="http://themes.iki-bir.com/juno7/style/images/art/bc4-full.jpg"><img alt="" src="http://themes.iki-bir.com/juno7/style/images/art/bc4.jpg" /></a></p>\n\n<p><a href="http://themes.iki-bir.com/juno7/style/images/art/bc5-full.jpg"><img alt="" src="http://themes.iki-bir.com/juno7/style/images/art/bc5.jpg" /></a></p>\n\n<p><a href="http://themes.iki-bir.com/juno7/style/images/art/bc6-full.jpg"><img alt="" src="http://themes.iki-bir.com/juno7/style/images/art/bc6.jpg" /></a></p>\n\n<p>Cras mattis consectetur purus sit amet fermentum. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Nullam id dolor id nibh ultricies vehicula ut id elit. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Cras mattis consectetur purus sit amet fermentum. Donec sed odio dui. Donec id elit non mi porta gravida at eget metus. Maecenas faucibus mollis interdum. Cras mattis consectetur purus sit amet fermentum. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Vestibulum id ligula porta felis euismod semper. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cras mattis consectetur purus sit amet fermentum.</p>\n', 1, 1, '2017-03-09', 'fringilla-ligula-consectetur-ridiculus-fermentum-cras-dapibus', 3, 'active', '2017-03-09 06:41:51', '2017-03-29 03:28:15', NULL, NULL, NULL),
(4, 'Tellus Adipiscing Nibh Mattis', 'Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Cras mattis consectetur purus sit amet fermentum. Aenean lacinia bibendum nulla sed consectetur. Curabitur blandit tempus porttitor. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor.\n\nDonec sed odio dui consectetur adipiscing elit. Etiam adipiscing tincidunt elit, eu convallis felis suscipit ut. Pha', '<p>Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Cras mattis consectetur purus sit amet fermentum. Aenean lacinia bibendum nulla sed consectetur. Curabitur blandit tempus porttitor. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor.</p>\n\n<p>Donec sed odio dui consectetur adipiscing elit. Etiam adipiscing tincidunt elit, eu convallis felis suscipit ut. Phasellus rhoncus tincidunt auctor. Nullam eu sagittis mauris. Donec non dolor ac elit aliquam tincidunt at at sapien. Aenean tortor libero, condimentum ac laoreet vitae, varius tempor nisi. Duis non arcu vel lectus.</p>\n\n<blockquote>\n<p>Pellentesque non diam et tortor dignissim bibendum. Neque sit amet mauris egestas quis mattis velit fringilla. Curabitur viver justo sed scelerisque. Cras mattis consectetur purus sit amet fermentum. Aenean eu leo quam.</p>\n<small>VERY IMPORTANT PERSON</small></blockquote>\n\n<h3>Sit Vulputate Bibendum Purus</h3>\n\n<p>Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Aenean lacinia bibendum nulla sed consectetur. Cras mattis consectetur purus sit amet fermentum. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vestibulum id ligula porta felis euismod semper. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.</p>\n\n<p><a href="http://themes.iki-bir.com/juno7/style/images/art/bc1-full.jpg"><img alt="" src="http://themes.iki-bir.com/juno7/style/images/art/bc1.jpg" /></a></p>\n\n<p><a href="http://themes.iki-bir.com/juno7/style/images/art/bc2-full.jpg"><img alt="" src="http://themes.iki-bir.com/juno7/style/images/art/bc2.jpg" /></a></p>\n\n<p><a href="http://themes.iki-bir.com/juno7/style/images/art/bc3-full.jpg"><img alt="" src="http://themes.iki-bir.com/juno7/style/images/art/bc3.jpg" /></a></p>\n\n<p><a href="http://themes.iki-bir.com/juno7/style/images/art/bc4-full.jpg"><img alt="" src="http://themes.iki-bir.com/juno7/style/images/art/bc4.jpg" /></a></p>\n\n<p><a href="http://themes.iki-bir.com/juno7/style/images/art/bc5-full.jpg"><img alt="" src="http://themes.iki-bir.com/juno7/style/images/art/bc5.jpg" /></a></p>\n\n<p><a href="http://themes.iki-bir.com/juno7/style/images/art/bc6-full.jpg"><img alt="" src="http://themes.iki-bir.com/juno7/style/images/art/bc6.jpg" /></a></p>\n\n<p>Cras mattis consectetur purus sit amet fermentum. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Nullam id dolor id nibh ultricies vehicula ut id elit. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Cras mattis consectetur purus sit amet fermentum. Donec sed odio dui. Donec id elit non mi porta gravida at eget metus. Maecenas faucibus mollis interdum. Cras mattis consectetur purus sit amet fermentum. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Vestibulum id ligula porta felis euismod semper. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cras mattis consectetur purus sit amet fermentum.</p>\n', 1, 1, '2017-03-09', 'tellus-adipiscing-nibh-mattis', 2, 'active', '2017-03-09 06:41:51', '2017-03-28 03:00:05', NULL, NULL, NULL),
(5, 'Ultricies Fusce Porta Elit', 'Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Cras mattis consectetur purus sit amet fermentum. Aenean lacinia bibendum nulla sed consectetur. Curabitur blandit tempus porttitor. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor.\n\nDonec sed odio dui consectetur adipiscing elit. Etiam adipiscing tincidunt elit, eu convallis felis suscipit ut. Pha', '<p>Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Cras mattis consectetur purus sit amet fermentum. Aenean lacinia bibendum nulla sed consectetur. Curabitur blandit tempus porttitor. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor.</p>\n\n<p>Donec sed odio dui consectetur adipiscing elit. Etiam adipiscing tincidunt elit, eu convallis felis suscipit ut. Phasellus rhoncus tincidunt auctor. Nullam eu sagittis mauris. Donec non dolor ac elit aliquam tincidunt at at sapien. Aenean tortor libero, condimentum ac laoreet vitae, varius tempor nisi. Duis non arcu vel lectus.</p>\n\n<blockquote>\n<p>Pellentesque non diam et tortor dignissim bibendum. Neque sit amet mauris egestas quis mattis velit fringilla. Curabitur viver justo sed scelerisque. Cras mattis consectetur purus sit amet fermentum. Aenean eu leo quam.</p>\n<small>VERY IMPORTANT PERSON</small></blockquote>\n\n<h3>Sit Vulputate Bibendum Purus</h3>\n\n<p>Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Aenean lacinia bibendum nulla sed consectetur. Cras mattis consectetur purus sit amet fermentum. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vestibulum id ligula porta felis euismod semper. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.</p>\n\n<p><a href="http://themes.iki-bir.com/juno7/style/images/art/bc1-full.jpg"><img alt="" src="http://themes.iki-bir.com/juno7/style/images/art/bc1.jpg" /></a></p>\n\n<p><a href="http://themes.iki-bir.com/juno7/style/images/art/bc2-full.jpg"><img alt="" src="http://themes.iki-bir.com/juno7/style/images/art/bc2.jpg" /></a></p>\n\n<p><a href="http://themes.iki-bir.com/juno7/style/images/art/bc3-full.jpg"><img alt="" src="http://themes.iki-bir.com/juno7/style/images/art/bc3.jpg" /></a></p>\n\n<p><a href="http://themes.iki-bir.com/juno7/style/images/art/bc4-full.jpg"><img alt="" src="http://themes.iki-bir.com/juno7/style/images/art/bc4.jpg" /></a></p>\n\n<p><a href="http://themes.iki-bir.com/juno7/style/images/art/bc5-full.jpg"><img alt="" src="http://themes.iki-bir.com/juno7/style/images/art/bc5.jpg" /></a></p>\n\n<p><a href="http://themes.iki-bir.com/juno7/style/images/art/bc6-full.jpg"><img alt="" src="http://themes.iki-bir.com/juno7/style/images/art/bc6.jpg" /></a></p>\n\n<p>Cras mattis consectetur purus sit amet fermentum. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Nullam id dolor id nibh ultricies vehicula ut id elit. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Cras mattis consectetur purus sit amet fermentum. Donec sed odio dui. Donec id elit non mi porta gravida at eget metus. Maecenas faucibus mollis interdum. Cras mattis consectetur purus sit amet fermentum. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Vestibulum id ligula porta felis euismod semper. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cras mattis consectetur purus sit amet fermentum.</p>\n', 1, 1, '2017-03-09', 'ultricies-fusce-porta-elit', 1, 'active', '2017-03-09 06:41:51', '2017-03-27 10:00:56', NULL, NULL, NULL),
(6, 'Fringilla Quam Bibendum Magna', 'Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Cras mattis consectetur purus sit amet fermentum. Aenean lacinia bibendum nulla sed consectetur. Curabitur blandit tempus porttitor. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor.\n\nDonec sed odio dui consectetur adipiscing elit. Etiam adipiscing tincidunt elit, eu convallis felis suscipit ut. Pha', '<p>Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Cras mattis consectetur purus sit amet fermentum. Aenean lacinia bibendum nulla sed consectetur. Curabitur blandit tempus porttitor. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor.</p>\n\n<p>Donec sed odio dui consectetur adipiscing elit. Etiam adipiscing tincidunt elit, eu convallis felis suscipit ut. Phasellus rhoncus tincidunt auctor. Nullam eu sagittis mauris. Donec non dolor ac elit aliquam tincidunt at at sapien. Aenean tortor libero, condimentum ac laoreet vitae, varius tempor nisi. Duis non arcu vel lectus.</p>\n\n<blockquote>\n<p>Pellentesque non diam et tortor dignissim bibendum. Neque sit amet mauris egestas quis mattis velit fringilla. Curabitur viver justo sed scelerisque. Cras mattis consectetur purus sit amet fermentum. Aenean eu leo quam.</p>\n<small>VERY IMPORTANT PERSON</small></blockquote>\n\n<h3>Sit Vulputate Bibendum Purus</h3>\n\n<p>Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Aenean lacinia bibendum nulla sed consectetur. Cras mattis consectetur purus sit amet fermentum. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vestibulum id ligula porta felis euismod semper. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.</p>\n\n<p><a href="http://themes.iki-bir.com/juno7/style/images/art/bc1-full.jpg"><img alt="" src="http://themes.iki-bir.com/juno7/style/images/art/bc1.jpg" /></a></p>\n\n<p><a href="http://themes.iki-bir.com/juno7/style/images/art/bc2-full.jpg"><img alt="" src="http://themes.iki-bir.com/juno7/style/images/art/bc2.jpg" /></a></p>\n\n<p><a href="http://themes.iki-bir.com/juno7/style/images/art/bc3-full.jpg"><img alt="" src="http://themes.iki-bir.com/juno7/style/images/art/bc3.jpg" /></a></p>\n\n<p><a href="http://themes.iki-bir.com/juno7/style/images/art/bc4-full.jpg"><img alt="" src="http://themes.iki-bir.com/juno7/style/images/art/bc4.jpg" /></a></p>\n\n<p><a href="http://themes.iki-bir.com/juno7/style/images/art/bc5-full.jpg"><img alt="" src="http://themes.iki-bir.com/juno7/style/images/art/bc5.jpg" /></a></p>\n\n<p><a href="http://themes.iki-bir.com/juno7/style/images/art/bc6-full.jpg"><img alt="" src="http://themes.iki-bir.com/juno7/style/images/art/bc6.jpg" /></a></p>\n\n<p>Cras mattis consectetur purus sit amet fermentum. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Nullam id dolor id nibh ultricies vehicula ut id elit. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Cras mattis consectetur purus sit amet fermentum. Donec sed odio dui. Donec id elit non mi porta gravida at eget metus. Maecenas faucibus mollis interdum. Cras mattis consectetur purus sit amet fermentum. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Vestibulum id ligula porta felis euismod semper. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cras mattis consectetur purus sit amet fermentum.</p>\n', 1, 1, '2017-03-09', 'fringilla-quam-bibendum-magna', 1, 'active', '2017-03-09 06:41:51', '2017-03-28 03:00:10', NULL, NULL, NULL),
(7, 'Ornare Nullam Risus Cursus', 'Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Cras mattis consectetur purus sit amet fermentum. Aenean lacinia bibendum nulla sed consectetur. Curabitur blandit tempus porttitor. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor.\n\nDonec sed odio dui consectetur adipiscing elit. Etiam adipiscing tincidunt elit, eu convallis felis suscipit ut. Pha', '<p>Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Cras mattis consectetur purus sit amet fermentum. Aenean lacinia bibendum nulla sed consectetur. Curabitur blandit tempus porttitor. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor.</p>\n\n<p>Donec sed odio dui consectetur adipiscing elit. Etiam adipiscing tincidunt elit, eu convallis felis suscipit ut. Phasellus rhoncus tincidunt auctor. Nullam eu sagittis mauris. Donec non dolor ac elit aliquam tincidunt at at sapien. Aenean tortor libero, condimentum ac laoreet vitae, varius tempor nisi. Duis non arcu vel lectus.</p>\n\n<blockquote>\n<p>Pellentesque non diam et tortor dignissim bibendum. Neque sit amet mauris egestas quis mattis velit fringilla. Curabitur viver justo sed scelerisque. Cras mattis consectetur purus sit amet fermentum. Aenean eu leo quam.</p>\n<small>VERY IMPORTANT PERSON</small></blockquote>\n\n<h3>Sit Vulputate Bibendum Purus</h3>\n\n<p>Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Aenean lacinia bibendum nulla sed consectetur. Cras mattis consectetur purus sit amet fermentum. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vestibulum id ligula porta felis euismod semper. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.</p>\n\n<p><a href="http://themes.iki-bir.com/juno7/style/images/art/bc1-full.jpg"><img alt="" src="http://themes.iki-bir.com/juno7/style/images/art/bc1.jpg" /></a></p>\n\n<p><a href="http://themes.iki-bir.com/juno7/style/images/art/bc2-full.jpg"><img alt="" src="http://themes.iki-bir.com/juno7/style/images/art/bc2.jpg" /></a></p>\n\n<p><a href="http://themes.iki-bir.com/juno7/style/images/art/bc3-full.jpg"><img alt="" src="http://themes.iki-bir.com/juno7/style/images/art/bc3.jpg" /></a></p>\n\n<p><a href="http://themes.iki-bir.com/juno7/style/images/art/bc4-full.jpg"><img alt="" src="http://themes.iki-bir.com/juno7/style/images/art/bc4.jpg" /></a></p>\n\n<p><a href="http://themes.iki-bir.com/juno7/style/images/art/bc5-full.jpg"><img alt="" src="http://themes.iki-bir.com/juno7/style/images/art/bc5.jpg" /></a></p>\n\n<p><a href="http://themes.iki-bir.com/juno7/style/images/art/bc6-full.jpg"><img alt="" src="http://themes.iki-bir.com/juno7/style/images/art/bc6.jpg" /></a></p>\n\n<p>Cras mattis consectetur purus sit amet fermentum. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Nullam id dolor id nibh ultricies vehicula ut id elit. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Cras mattis consectetur purus sit amet fermentum. Donec sed odio dui. Donec id elit non mi porta gravida at eget metus. Maecenas faucibus mollis interdum. Cras mattis consectetur purus sit amet fermentum. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Vestibulum id ligula porta felis euismod semper. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cras mattis consectetur purus sit amet fermentum.</p>\n', 1, 1, '2017-03-09', 'ornare-nullam-risus-cursus', 4, 'active', '2017-03-09 06:41:51', '2017-03-29 09:49:48', NULL, NULL, NULL),
(8, 'test', '123', '<p>456</p>\n', 1, 1, '2017-03-23', 'test', 6, 'active', '2017-03-23 03:53:39', '2017-03-29 08:17:55', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `article_tags`
--

DROP TABLE IF EXISTS `article_tags`;
CREATE TABLE `article_tags` (
  `id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_user_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_user_id` int(11) DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  `deleted_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `article_tags`
--

INSERT INTO `article_tags` (`id`, `article_id`, `tag_id`, `created_at`, `created_user_id`, `updated_at`, `updated_user_id`, `deleted_date`, `deleted_user_id`) VALUES
(5, 8, 1, '2017-03-23 03:54:50', NULL, '2017-03-23 03:54:50', NULL, NULL, NULL),
(6, 8, 2, '2017-03-23 03:54:50', NULL, '2017-03-23 03:54:50', NULL, NULL, NULL),
(9, 1, 1, '2017-03-23 07:36:37', NULL, '2017-03-23 07:36:37', NULL, NULL, NULL),
(10, 1, 2, '2017-03-23 07:36:37', NULL, '2017-03-23 07:36:37', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `clean_url` varchar(100) NOT NULL,
  `status` varchar(45) DEFAULT 'active',
  `created_at` datetime DEFAULT NULL,
  `created_user_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_user_id` int(11) DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  `deleted_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `clean_url`, `status`, `created_at`, `created_user_id`, `updated_at`, `updated_user_id`, `deleted_date`, `deleted_user_id`) VALUES
(1, 'Lifestyle', 'Life of Style', 'lifestyle', 'active', '2017-03-06 09:39:52', NULL, '2017-03-09 01:43:06', NULL, NULL, NULL),
(2, 'Photography', 'The beautiful images around us', 'photography', 'active', '2017-03-06 09:56:29', NULL, '2017-03-09 01:43:23', NULL, NULL, NULL),
(3, 'Journal', 'A walk to remember', 'journal', 'active', '2017-03-06 09:57:49', NULL, '2017-03-09 01:45:04', NULL, NULL, NULL),
(4, 'Works', 'The creative works', 'works', 'active', '2017-03-06 09:58:10', NULL, '2017-03-09 01:45:07', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `title` varchar(20) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `content` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2016_03_08_164317_create_users_table', 1),
(2, '2016_03_08_164400_create_password_resets_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pictures`
--

DROP TABLE IF EXISTS `pictures`;
CREATE TABLE `pictures` (
  `id` int(11) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `filepath` varchar(255) NOT NULL,
  `article_id` int(11) NOT NULL,
  `status` varchar(45) DEFAULT 'active',
  `created_at` datetime DEFAULT NULL,
  `created_user_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_user_id` int(11) DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  `deleted_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pictures`
--

INSERT INTO `pictures` (`id`, `filename`, `filepath`, `article_id`, `status`, `created_at`, `created_user_id`, `updated_at`, `updated_user_id`, `deleted_date`, `deleted_user_id`) VALUES
(1, NULL, '14890425270.jpg', 1, 'active', '2017-03-09 06:55:27', NULL, '2017-03-09 06:55:27', NULL, NULL, NULL),
(2, NULL, '14902412190.jpg', 8, 'active', '2017-03-23 03:53:39', NULL, '2017-03-23 03:53:39', NULL, NULL, NULL),
(3, NULL, '14902412191.jpg', 8, 'active', '2017-03-23 03:53:39', NULL, '2017-03-23 03:53:39', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `slides`
--

DROP TABLE IF EXISTS `slides`;
CREATE TABLE `slides` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text,
  `filepath` varchar(255) NOT NULL,
  `status` varchar(45) DEFAULT 'active',
  `created_at` datetime DEFAULT NULL,
  `created_user_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_user_id` int(11) DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  `deleted_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `slides`
--

INSERT INTO `slides` (`id`, `title`, `description`, `filepath`, `status`, `created_at`, `created_user_id`, `updated_at`, `updated_user_id`, `deleted_date`, `deleted_user_id`) VALUES
(1, 'test123', '123', '1488967066.jpg', 'inactive', '2017-03-08 09:57:46', NULL, '2017-03-10 07:18:08', NULL, NULL, NULL),
(2, 'test', '123', '1488968775.jpg', 'inactive', '2017-03-08 10:26:15', NULL, '2017-03-10 07:18:16', NULL, NULL, NULL),
(3, 'tser', 'df', '1488968844.jpg', 'inactive', '2017-03-08 10:27:25', NULL, '2017-03-10 07:18:33', NULL, NULL, NULL),
(4, 'Ligula Tristique Malesuada Venenatis', 'very beautiful', '1489718899.jpg', 'active', '2017-03-10 07:17:45', NULL, '2017-03-17 02:48:19', NULL, NULL, NULL),
(5, 'Tellus Adipiscing Nibh Mattis Malesuada', 'the sunset', '1489718913.jpg', 'active', '2017-03-10 07:19:54', NULL, '2017-03-17 02:48:33', NULL, NULL, NULL),
(6, 'Mollis Elit Amet Etiam', 'Light house', '1489718924.jpg', 'active', '2017-03-10 07:20:33', NULL, '2017-03-17 02:48:44', NULL, NULL, NULL),
(7, 'Fringilla Quam Bibendum Magna', 'null', '1489718997.jpg', 'active', '2017-03-10 07:21:24', NULL, '2017-03-17 02:49:57', NULL, NULL, NULL),
(8, 'Cursus Risus Tellus Fusce', 'null', '1489719011.jpg', 'active', '2017-03-10 07:21:55', NULL, '2017-03-17 02:50:11', NULL, NULL, NULL),
(9, 'Ultricies Fusce Porta Elit Vestibulum', NULL, '1489130570.jpg', 'active', '2017-03-10 07:22:50', NULL, '2017-03-10 07:22:50', NULL, NULL, NULL),
(10, 'Dapibus Ridiculus Parturient Bibendum', NULL, '1489130599.jpg', 'active', '2017-03-10 07:23:19', NULL, '2017-03-10 07:23:19', NULL, NULL, NULL),
(11, 'Adipiscing Risus Elit Tortor', NULL, '1489130620.jpg', 'active', '2017-03-10 07:23:40', NULL, '2017-03-10 07:23:40', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `clean_url` varchar(100) NOT NULL,
  `status` varchar(45) DEFAULT 'active',
  `created_at` datetime DEFAULT NULL,
  `created_user_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_user_id` int(11) DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  `deleted_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `description`, `clean_url`, `status`, `created_at`, `created_user_id`, `updated_at`, `updated_user_id`, `deleted_date`, `deleted_user_id`) VALUES
(1, 'Journal', 'a journal', 'journal', 'active', '2017-03-22 08:20:51', NULL, '2017-03-22 08:20:51', NULL, NULL, NULL),
(2, 'Nature', 'Beautiful nature', 'nature', 'active', '2017-03-22 08:21:14', NULL, '2017-03-22 08:21:14', NULL, NULL, NULL),
(3, 'Workshop', 'working for beautiful life', 'workshop', 'active', '2017-03-23 04:00:43', NULL, '2017-03-23 04:00:43', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Minh Luan', 'pnmluan@gmail.com', '$2y$10$TjEqT.D5p8RhnY98BgvBTutt.TkFlGCU2TAbT/k.QdN6h0oGxKowa', 'uYgSaQbZqf', NULL, NULL),
(2, 'Clark Kent', 'superman@dc.com', '$2y$10$Z7CDThuccmWvyg7QlFo8uOhkqzBMovOGCtXtF3/zSgwfw.nlnAw4u', 'eYod2u03ON', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `clean_url_UNIQUE` (`clean_url`);

--
-- Indexes for table `article_tags`
--
ALTER TABLE `article_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `clean_url_UNIQUE` (`clean_url`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `pictures`
--
ALTER TABLE `pictures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slides`
--
ALTER TABLE `slides`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `clean_url_UNIQUE` (`clean_url`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `article_tags`
--
ALTER TABLE `article_tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `pictures`
--
ALTER TABLE `pictures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `slides`
--
ALTER TABLE `slides`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
