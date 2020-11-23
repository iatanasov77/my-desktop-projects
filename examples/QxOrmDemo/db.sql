DROP DATABASE IF EXISTS `QxOrmDemo`;
CREATE DATABASE `QxOrmDemo`;
USE `QxOrmDemo`;

CREATE TABLE `Category` (
  `category_id` int UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  `name` varchar(64) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `category` (
  `category_id` int UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  `name` varchar(64) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `Author` (
  `author_id` int UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  `name` varchar(64) NOT NULL,
  `sex` varchar(64),
  `birthday` datetime
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `author` (
  `author_id` int UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  `name` varchar(64) NOT NULL,
  `sex` varchar(64),
  `birthday` datetime
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `Blog` (
  `blog_id` int UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  `author_id` int,
  `date_creation` datetime,
  `blog_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `blog` (
  `blog_id` int UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  `author_id` int,
  `date_creation` datetime,
  `blog_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `Comment` (
  `comment_id` int UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  `blog_id` int NOT NULL,
  `date_creation` datetime,
  `comment_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `comment` (
  `comment_id` int UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  `blog_id` int NOT NULL,
  `date_creation` datetime,
  `comment_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `Category_Blog` (
  `blog_id` int NOT NULL,
  `category_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `category_blog` (
  `blog_id` int NOT NULL,
  `category_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

