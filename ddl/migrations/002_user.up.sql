-- User
CREATE TABLE `user` (
  -- ID
  `id` VARCHAR(20) NOT NULL,
  -- UID
  `uid` VARCHAR(128) NOT NULL,

  `deleted_at` DATETIME,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
