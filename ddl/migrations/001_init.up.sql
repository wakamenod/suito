-- Expense
CREATE TABLE `expense` (
  -- ID
  `id` VARCHAR(20) NOT NULL,
  -- UID
  `uid` VARCHAR(128) NOT NULL,
  -- Title
  `title` VARCHAR(256) NOT NULL,
  -- Amount
  `amount` INT NOT NULL,
  -- Memo
  `memo` VARCHAR(512) NOT NULL,
  -- Expense Location Id
  `expense_location_id` VARCHAR(20) NOT NULL,
  -- Expense Category Id
  `expense_category_id` VARCHAR(20) NOT NULL,
  -- local_date (YYYYMMDD)
  `local_date` CHAR(8) NOT NULL,

  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Expense Split
CREATE TABLE `expense_split` (
  -- ID
  `id` VARCHAR(20) NOT NULL,
  -- expense_id
  `expense_id` VARCHAR(20) NOT NULL,
  -- Amount
  `amount` INT NOT NULL,

  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Income
CREATE TABLE `income` (
  -- ID
  `id` VARCHAR(20) NOT NULL,
  -- UID
  `uid` VARCHAR(128) NOT NULL,
  -- Title
  `title` VARCHAR(256) NOT NULL,
  -- Amount
  `amount` INT NOT NULL,
  -- Memo
  `memo` VARCHAR(512) NOT NULL,
  -- local_date (YYYYMMDD)
  `local_date` CHAR(8) NOT NULL,

  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Sheduled Expense
CREATE TABLE `scheduled_expense` (
  -- ID
  `id` VARCHAR(20) NOT NULL,
  -- UID
  `uid` VARCHAR(128) NOT NULL,
  -- Title
  `title` VARCHAR(256) NOT NULL,
  -- Amount
  `amount` INT NOT NULL,
  -- Memo
  `memo` VARCHAR(512) NOT NULL,
  -- Expense Location Id
  `expense_location_id` VARCHAR(20) NOT NULL,
  -- Expense Category Id
  `expense_category_id` VARCHAR(20) NOT NULL,
  -- scheduled_type
  `scheduled_type` TINYINT NOT NULL,

  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Sheduled Income
CREATE TABLE `scheduled_income` (
  -- ID
  `id` VARCHAR(20) NOT NULL,
  -- UID
  `uid` VARCHAR(128) NOT NULL,
  -- Title
  `title` VARCHAR(256) NOT NULL,
  -- Amount
  `amount` INT NOT NULL,
  -- Memo
  `memo` VARCHAR(512) NOT NULL,
  -- scheduled_type
  `scheduled_type` TINYINT NOT NULL,

  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Sheduled Expense Queue
CREATE TABLE `scheduled_expense_queue` (
  -- ID
  `id` VARCHAR(20) NOT NULL,
  -- scheduled_expense_id
  `scheduled_expense_id` VARCHAR(20) NOT NULL,
  -- scheduled_at
  `scheduled_at` DATETIME NOT NULL,

  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Sheduled Income Queue
CREATE TABLE `scheduled_income_queue` (
  -- ID
  `id` VARCHAR(20) NOT NULL,
  -- scheduled_income_id
  `scheduled_income_id` VARCHAR(20) NOT NULL,
  -- scheduled_at
  `scheduled_at` DATETIME NOT NULL,

  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Expense Location
CREATE TABLE `expense_location` (
  -- ID
  `id` VARCHAR(20) NOT NULL,
  -- UID
  `uid` VARCHAR(128) NOT NULL,
  -- Name
  `name` VARCHAR(256) NOT NULL,

  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Expense Category
CREATE TABLE `expense_category` (
  -- ID
  `id` VARCHAR(20) NOT NULL,
  -- UID
  `uid` VARCHAR(128) NOT NULL,
  -- Name
  `name` VARCHAR(256) NOT NULL,

  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
