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
  -- Local Date
  `local_date` DATE NOT NULL,

  `deleted_at` DATETIME,
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
  -- Income Type ID
  `income_type_id` VARCHAR(20) NOT NULL,
  -- Amount
  `amount` INT NOT NULL,
  -- Memo
  `memo` VARCHAR(512) NOT NULL,
  -- Local Date
  `local_date` DATE NOT NULL,

  `deleted_at` DATETIME,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Expense Shedule
CREATE TABLE `expense_schedule` (
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
  -- schedule_type
  `schedule_type` TINYINT NOT NULL,
  -- Timezone
  `timezone` VARCHAR(64) NOT NULL,

  `deleted_at` DATETIME,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Income Shedule
CREATE TABLE `income_schedule` (
  -- ID
  `id` VARCHAR(20) NOT NULL,
  -- UID
  `uid` VARCHAR(128) NOT NULL,
  -- Income Type ID
  `income_type_id` VARCHAR(20) NOT NULL,
  -- Amount
  `amount` INT NOT NULL,
  -- Memo
  `memo` VARCHAR(512) NOT NULL,
  -- schedule_type
  `schedule_type` TINYINT NOT NULL,
  -- Timezone
  `timezone` VARCHAR(64) NOT NULL,

  `deleted_at` DATETIME,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Sheduled Expense Queue
CREATE TABLE `scheduled_expense_queue` (
  -- ID
  `id` VARCHAR(20) NOT NULL,
  -- expense_schedule_id
  `expense_schedule_id` VARCHAR(20) NOT NULL,
  -- scheduled_at
  `scheduled_at` DATETIME NOT NULL,

  `deleted_at` DATETIME,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Sheduled Income Queue
CREATE TABLE `scheduled_income_queue` (
  -- ID
  `id` VARCHAR(20) NOT NULL,
  -- income_schedule_id
  `income_schedule_id` VARCHAR(20) NOT NULL,
  -- scheduled_at
  `scheduled_at` DATETIME NOT NULL,

  `deleted_at` DATETIME,
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
  UNIQUE INDEX `uid_name_UNIQUE` (`uid`, `name`),
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
  UNIQUE INDEX `uid_name_UNIQUE` (`uid`, `name`),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Income Type
CREATE TABLE `income_type` (
  -- ID
  `id` VARCHAR(20) NOT NULL,
  -- UID
  `uid` VARCHAR(128) NOT NULL,
  -- Name
  `name` VARCHAR(256) NOT NULL,

  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  UNIQUE INDEX `uid_name_UNIQUE` (`uid`, `name`),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
