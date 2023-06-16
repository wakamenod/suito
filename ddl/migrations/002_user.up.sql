-- User
CREATE TABLE `user` (
  -- ID
  `id` VARCHAR(20) NOT NULL,
  -- UID
  `uid` VARCHAR(128) NOT NULL,
  -- active flag
  `is_active` tinyint(1) AS ((case when isnull(`deleted_at`) then 1 else NULL end)) VIRTUAL,

  `deleted_at` DATETIME,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  UNIQUE INDEX `uid` (`uid`, `is_active`),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
