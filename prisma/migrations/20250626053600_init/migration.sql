-- CreateTable
CREATE TABLE `users` (
    `id` VARCHAR(191) NOT NULL,
    `user_code` VARCHAR(191) NULL,
    `avatar` VARCHAR(191) NULL,
    `firstname` VARCHAR(191) NOT NULL,
    `middlename` VARCHAR(191) NULL,
    `lastname` VARCHAR(191) NOT NULL,
    `gender` VARCHAR(191) NOT NULL,
    `contact_number` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `employee_id` VARCHAR(191) NOT NULL,
    `department_id` VARCHAR(191) NULL,
    `position` VARCHAR(191) NOT NULL,
    `role` VARCHAR(191) NOT NULL,
    `status` BOOLEAN NOT NULL DEFAULT true,
    `password` VARCHAR(191) NOT NULL,
    `last_login` DATETIME(3) NULL,
    `created_by` VARCHAR(191) NULL,
    `updated_by` VARCHAR(191) NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    UNIQUE INDEX `users_user_code_key`(`user_code`),
    UNIQUE INDEX `users_contact_number_key`(`contact_number`),
    UNIQUE INDEX `users_email_key`(`email`),
    UNIQUE INDEX `users_employee_id_key`(`employee_id`),
    INDEX `users_employee_id_idx`(`employee_id`),
    INDEX `users_created_by_idx`(`created_by`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `password_reset_tokens` (
    `id` VARCHAR(191) NOT NULL,
    `user_id` VARCHAR(191) NULL,
    `token` VARCHAR(191) NOT NULL,
    `expires_at` DATETIME(3) NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    INDEX `password_reset_tokens_user_id_idx`(`user_id`),
    UNIQUE INDEX `password_reset_tokens_user_id_token_key`(`user_id`, `token`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `suppliers` (
    `id` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `supplier_code` VARCHAR(191) NOT NULL,
    `office_primary_address` VARCHAR(191) NOT NULL,
    `office_secondary_address` VARCHAR(191) NULL,
    `country_id` VARCHAR(191) NULL,
    `currency_id` VARCHAR(191) NULL,
    `contact_primary_name` VARCHAR(191) NOT NULL,
    `contact_primary_position` VARCHAR(191) NOT NULL,
    `contact_primary_email` VARCHAR(191) NOT NULL,
    `contact_primary_phone` VARCHAR(191) NOT NULL,
    `contact_secondary_name` VARCHAR(191) NULL,
    `contact_secondary_position` VARCHAR(191) NULL,
    `contact_secondary_email` VARCHAR(191) NULL,
    `contact_secondary_phone` VARCHAR(191) NULL,
    `tin_number` VARCHAR(191) NOT NULL,
    `taxable` BOOLEAN NOT NULL,
    `bank` VARCHAR(191) NOT NULL,
    `bank_account` VARCHAR(191) NOT NULL,
    `payment_terms` VARCHAR(191) NOT NULL,
    `credit_limit` DECIMAL(65, 30) NOT NULL,
    `notes` MEDIUMTEXT NULL,
    `status` BOOLEAN NOT NULL,
    `created_by` VARCHAR(191) NULL,
    `updated_by` VARCHAR(191) NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    UNIQUE INDEX `suppliers_id_key`(`id`),
    UNIQUE INDEX `suppliers_supplier_code_key`(`supplier_code`),
    INDEX `suppliers_country_id_idx`(`country_id`),
    INDEX `suppliers_created_by_idx`(`created_by`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `brands` (
    `id` VARCHAR(191) NOT NULL,
    `brand_code` VARCHAR(191) NOT NULL,
    `brand_name` VARCHAR(191) NOT NULL,
    `status` BOOLEAN NOT NULL,
    `created_by` VARCHAR(191) NULL,
    `updated_by` VARCHAR(191) NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    UNIQUE INDEX `brands_id_key`(`id`),
    UNIQUE INDEX `brands_brand_code_key`(`brand_code`),
    INDEX `brands_brand_code_idx`(`brand_code`),
    INDEX `brands_created_by_idx`(`created_by`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `products` (
    `id` VARCHAR(191) NOT NULL,
    `product_code` VARCHAR(191) NOT NULL,
    `product_name` VARCHAR(191) NOT NULL,
    `description` VARCHAR(191) NOT NULL,
    `price` DECIMAL(11, 2) NOT NULL,
    `cost` DECIMAL(11, 2) NOT NULL,
    `intransit_quantity` INTEGER NULL,
    `good_quantity` INTEGER NULL,
    `damaged_quantity` INTEGER NULL,
    `reorder_level` INTEGER NULL,
    `notes` MEDIUMTEXT NULL,
    `avatar` VARCHAR(191) NULL,
    `status` BOOLEAN NOT NULL,
    `created_by` VARCHAR(191) NULL,
    `updated_by` VARCHAR(191) NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,
    `department_id` VARCHAR(191) NULL,
    `sub_department_id` VARCHAR(191) NULL,
    `classification_id` VARCHAR(191) NULL,
    `sub_classification_id` VARCHAR(191) NULL,
    `uom_id` VARCHAR(191) NULL,
    `supplier_id` VARCHAR(191) NULL,

    UNIQUE INDEX `products_id_key`(`id`),
    UNIQUE INDEX `products_product_code_key`(`product_code`),
    INDEX `products_created_by_idx`(`created_by`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `departments` (
    `id` VARCHAR(191) NOT NULL,
    `department_code` VARCHAR(191) NOT NULL,
    `department_name` VARCHAR(191) NOT NULL,
    `status` BOOLEAN NOT NULL,
    `created_by` VARCHAR(191) NULL,
    `updated_by` VARCHAR(191) NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    UNIQUE INDEX `departments_id_key`(`id`),
    UNIQUE INDEX `departments_department_code_key`(`department_code`),
    INDEX `departments_department_code_idx`(`department_code`),
    INDEX `departments_created_by_idx`(`created_by`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `sub_departments` (
    `id` VARCHAR(191) NOT NULL,
    `sub_department_code` VARCHAR(191) NOT NULL,
    `sub_department_name` VARCHAR(191) NOT NULL,
    `notes` MEDIUMTEXT NULL,
    `status` BOOLEAN NOT NULL,
    `department_id` VARCHAR(191) NULL,
    `created_by` VARCHAR(191) NULL,
    `updated_by` VARCHAR(191) NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    UNIQUE INDEX `sub_departments_id_key`(`id`),
    UNIQUE INDEX `sub_departments_sub_department_code_key`(`sub_department_code`),
    INDEX `sub_departments_department_id_idx`(`department_id`),
    INDEX `sub_departments_created_by_idx`(`created_by`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `classifications` (
    `id` VARCHAR(191) NOT NULL,
    `classification_code` VARCHAR(191) NOT NULL,
    `classification_name` VARCHAR(191) NOT NULL,
    `notes` MEDIUMTEXT NULL,
    `status` BOOLEAN NOT NULL,
    `created_by` VARCHAR(191) NULL,
    `updated_by` VARCHAR(191) NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    UNIQUE INDEX `classifications_id_key`(`id`),
    UNIQUE INDEX `classifications_classification_code_key`(`classification_code`),
    INDEX `classifications_classification_code_idx`(`classification_code`),
    INDEX `classifications_created_by_idx`(`created_by`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `sub_classifications` (
    `id` VARCHAR(191) NOT NULL,
    `sub_classification_code` VARCHAR(191) NOT NULL,
    `sub_classification_name` VARCHAR(191) NOT NULL,
    `notes` MEDIUMTEXT NULL,
    `status` BOOLEAN NOT NULL,
    `classification_id` VARCHAR(191) NULL,
    `created_by` VARCHAR(191) NULL,
    `updated_by` VARCHAR(191) NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    UNIQUE INDEX `sub_classifications_id_key`(`id`),
    UNIQUE INDEX `sub_classifications_sub_classification_code_key`(`sub_classification_code`),
    INDEX `sub_classifications_classification_id_idx`(`classification_id`),
    INDEX `sub_classifications_created_by_idx`(`created_by`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `units_of_measure` (
    `id` VARCHAR(191) NOT NULL,
    `uom_code` VARCHAR(191) NOT NULL,
    `uom_name` VARCHAR(191) NOT NULL,
    `status` BOOLEAN NOT NULL,
    `created_by` VARCHAR(191) NULL,
    `updated_by` VARCHAR(191) NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    UNIQUE INDEX `units_of_measure_uom_code_key`(`uom_code`),
    INDEX `units_of_measure_uom_code_idx`(`uom_code`),
    INDEX `units_of_measure_created_by_idx`(`created_by`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `countries` (
    `id` VARCHAR(191) NOT NULL,
    `country_code` VARCHAR(191) NOT NULL,
    `country_name` VARCHAR(191) NOT NULL,
    `status` BOOLEAN NOT NULL,
    `created_by` VARCHAR(191) NULL,
    `updated_by` VARCHAR(191) NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    UNIQUE INDEX `countries_id_key`(`id`),
    UNIQUE INDEX `countries_country_code_key`(`country_code`),
    INDEX `countries_created_by_idx`(`created_by`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `currencies` (
    `id` VARCHAR(191) NOT NULL,
    `currency_code` VARCHAR(191) NOT NULL,
    `currency_name` VARCHAR(191) NOT NULL,
    `status` BOOLEAN NOT NULL,
    `created_by` VARCHAR(191) NULL,
    `updated_by` VARCHAR(191) NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    UNIQUE INDEX `currencies_id_key`(`id`),
    UNIQUE INDEX `currencies_currency_code_key`(`currency_code`),
    INDEX `currencies_created_by_idx`(`created_by`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `unit_classifications` (
    `id` VARCHAR(191) NOT NULL,
    `unit_code` VARCHAR(191) NOT NULL,
    `unit_name` VARCHAR(191) NOT NULL,
    `status` BOOLEAN NOT NULL,
    `created_by` VARCHAR(191) NULL,
    `updated_by` VARCHAR(191) NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    UNIQUE INDEX `unit_classifications_id_key`(`id`),
    UNIQUE INDEX `unit_classifications_unit_code_key`(`unit_code`),
    INDEX `unit_classifications_created_by_idx`(`created_by`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `house_and_lot_locations` (
    `id` VARCHAR(191) NOT NULL,
    `hall_code` VARCHAR(191) NOT NULL,
    `hall_name` VARCHAR(191) NOT NULL,
    `status` BOOLEAN NOT NULL,
    `created_by` VARCHAR(191) NULL,
    `updated_by` VARCHAR(191) NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    UNIQUE INDEX `house_and_lot_locations_id_key`(`id`),
    UNIQUE INDEX `house_and_lot_locations_hall_code_key`(`hall_code`),
    INDEX `house_and_lot_locations_created_by_idx`(`created_by`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `projects` (
    `id` VARCHAR(191) NOT NULL,
    `project_code` VARCHAR(191) NOT NULL,
    `project_name` VARCHAR(191) NOT NULL,
    `address` VARCHAR(191) NOT NULL,
    `contact_person` VARCHAR(191) NOT NULL,
    `contact_number` VARCHAR(191) NOT NULL,
    `status` BOOLEAN NOT NULL,
    `created_by` VARCHAR(191) NULL,
    `updated_by` VARCHAR(191) NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    UNIQUE INDEX `projects_id_key`(`id`),
    UNIQUE INDEX `projects_project_code_key`(`project_code`),
    INDEX `projects_created_by_idx`(`created_by`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `models` (
    `id` VARCHAR(191) NOT NULL,
    `model_code` VARCHAR(191) NOT NULL,
    `model_name` VARCHAR(191) NOT NULL,
    `status` BOOLEAN NOT NULL,
    `created_by` VARCHAR(191) NULL,
    `updated_by` VARCHAR(191) NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    UNIQUE INDEX `models_id_key`(`id`),
    UNIQUE INDEX `models_model_code_key`(`model_code`),
    INDEX `models_created_by_idx`(`created_by`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `units` (
    `id` VARCHAR(191) NOT NULL,
    `unit_code` VARCHAR(191) NOT NULL,
    `unit_name` VARCHAR(191) NOT NULL,
    `status` BOOLEAN NOT NULL,
    `address` VARCHAR(191) NOT NULL,
    `contact_person` VARCHAR(191) NOT NULL,
    `contact_number` VARCHAR(191) NOT NULL,
    `project_code` VARCHAR(191) NULL,
    `unit_type` VARCHAR(191) NOT NULL,
    `project_id` VARCHAR(191) NULL,
    `model_id` VARCHAR(191) NULL,
    `unit_classification_id` VARCHAR(191) NULL,
    `house_and_lot_location_id` VARCHAR(191) NULL,
    `created_by` VARCHAR(191) NULL,
    `updated_by` VARCHAR(191) NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    UNIQUE INDEX `units_id_key`(`id`),
    UNIQUE INDEX `units_unit_code_key`(`unit_code`),
    INDEX `units_created_by_idx`(`created_by`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `audit_logs` (
    `id` VARCHAR(191) NOT NULL,
    `user_id` VARCHAR(191) NULL,
    `action` VARCHAR(191) NOT NULL,
    `url` VARCHAR(191) NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `users` ADD CONSTRAINT `users_department_id_fkey` FOREIGN KEY (`department_id`) REFERENCES `departments`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `password_reset_tokens` ADD CONSTRAINT `password_reset_tokens_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `suppliers` ADD CONSTRAINT `suppliers_country_id_fkey` FOREIGN KEY (`country_id`) REFERENCES `countries`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `suppliers` ADD CONSTRAINT `suppliers_currency_id_fkey` FOREIGN KEY (`currency_id`) REFERENCES `currencies`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `products` ADD CONSTRAINT `products_department_id_fkey` FOREIGN KEY (`department_id`) REFERENCES `departments`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `products` ADD CONSTRAINT `products_sub_department_id_fkey` FOREIGN KEY (`sub_department_id`) REFERENCES `sub_departments`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `products` ADD CONSTRAINT `products_classification_id_fkey` FOREIGN KEY (`classification_id`) REFERENCES `classifications`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `products` ADD CONSTRAINT `products_sub_classification_id_fkey` FOREIGN KEY (`sub_classification_id`) REFERENCES `sub_classifications`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `products` ADD CONSTRAINT `products_uom_id_fkey` FOREIGN KEY (`uom_id`) REFERENCES `units_of_measure`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `products` ADD CONSTRAINT `products_supplier_id_fkey` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `sub_departments` ADD CONSTRAINT `sub_departments_department_id_fkey` FOREIGN KEY (`department_id`) REFERENCES `departments`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `sub_classifications` ADD CONSTRAINT `sub_classifications_classification_id_fkey` FOREIGN KEY (`classification_id`) REFERENCES `classifications`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `units` ADD CONSTRAINT `units_project_id_fkey` FOREIGN KEY (`project_id`) REFERENCES `projects`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `units` ADD CONSTRAINT `units_model_id_fkey` FOREIGN KEY (`model_id`) REFERENCES `models`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `units` ADD CONSTRAINT `units_unit_classification_id_fkey` FOREIGN KEY (`unit_classification_id`) REFERENCES `unit_classifications`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `units` ADD CONSTRAINT `units_house_and_lot_location_id_fkey` FOREIGN KEY (`house_and_lot_location_id`) REFERENCES `house_and_lot_locations`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
