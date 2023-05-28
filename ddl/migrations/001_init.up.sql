-- Transaction
CREATE TABLE `transaction` (
  -- ID
  `id` VARCHAR(20) NOT NULL,
  -- UID
  `uid` VARCHAR(128) NOT NULL,
  -- local_date (YYYYMMDD)
  `local_date` CHAR(8) NOT NULL,
  -- content
  `content` BLOB NOT NULL,

  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Sheduled Transaction
CREATE TABLE `scheduled_transaction` (
  -- ID
  `id` VARCHAR(20) NOT NULL,
  -- UID
  `uid` VARCHAR(128) NOT NULL,
  -- content
  `content` BLOB NOT NULL,
  -- scheduled_type
  `scheduled_type` TINYINT NOT NULL,

  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Sheduled Transaction Queue
CREATE TABLE `scheduled_transaction_queue` (
  -- ID
  `id` VARCHAR(20) NOT NULL,
  -- scheduled_transaction_id
  `scheduled_transaction_id` VARCHAR(20) NOT NULL,
  -- scheduled_at
  `scheduled_at` DATETIME NOT NULL,

  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Transaction Location
CREATE TABLE `transaction_location` (
  -- ID
  `id` VARCHAR(20) NOT NULL,
  -- UID
  `uid` VARCHAR(128) NOT NULL,
  -- name
  `name` BLOB NOT NULL,

  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Transaction Category
CREATE TABLE `transaction_category` (
  -- ID
  `id` VARCHAR(20) NOT NULL,
  -- UID
  `uid` VARCHAR(128) NOT NULL,
  -- name
  `name` BLOB NOT NULL,

  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
