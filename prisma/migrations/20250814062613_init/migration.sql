/*
  Warnings:

  - You are about to drop the column `avatar` on the `users` table. All the data in the column will be lost.
  - You are about to drop the column `contact_number` on the `users` table. All the data in the column will be lost.
  - You are about to drop the column `created_by` on the `users` table. All the data in the column will be lost.
  - You are about to drop the column `department_id` on the `users` table. All the data in the column will be lost.
  - You are about to drop the column `employee_id` on the `users` table. All the data in the column will be lost.
  - You are about to drop the column `gender` on the `users` table. All the data in the column will be lost.
  - You are about to drop the column `last_login` on the `users` table. All the data in the column will be lost.
  - You are about to drop the column `position` on the `users` table. All the data in the column will be lost.
  - You are about to drop the column `role` on the `users` table. All the data in the column will be lost.
  - You are about to drop the column `status` on the `users` table. All the data in the column will be lost.
  - You are about to drop the column `updated_by` on the `users` table. All the data in the column will be lost.
  - You are about to drop the column `user_code` on the `users` table. All the data in the column will be lost.
  - You are about to drop the `audit_logs` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `brands` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `classifications` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `countries` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `currencies` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `departments` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `house_and_lot_locations` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `models` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `products` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `projects` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `sub_classifications` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `sub_departments` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `suppliers` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `unit_classifications` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `units` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `units_of_measure` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `products` DROP FOREIGN KEY `products_classification_id_fkey`;

-- DropForeignKey
ALTER TABLE `products` DROP FOREIGN KEY `products_department_id_fkey`;

-- DropForeignKey
ALTER TABLE `products` DROP FOREIGN KEY `products_sub_classification_id_fkey`;

-- DropForeignKey
ALTER TABLE `products` DROP FOREIGN KEY `products_sub_department_id_fkey`;

-- DropForeignKey
ALTER TABLE `products` DROP FOREIGN KEY `products_supplier_id_fkey`;

-- DropForeignKey
ALTER TABLE `products` DROP FOREIGN KEY `products_uom_id_fkey`;

-- DropForeignKey
ALTER TABLE `sub_classifications` DROP FOREIGN KEY `sub_classifications_classification_id_fkey`;

-- DropForeignKey
ALTER TABLE `sub_departments` DROP FOREIGN KEY `sub_departments_department_id_fkey`;

-- DropForeignKey
ALTER TABLE `suppliers` DROP FOREIGN KEY `suppliers_country_id_fkey`;

-- DropForeignKey
ALTER TABLE `suppliers` DROP FOREIGN KEY `suppliers_currency_id_fkey`;

-- DropForeignKey
ALTER TABLE `units` DROP FOREIGN KEY `units_house_and_lot_location_id_fkey`;

-- DropForeignKey
ALTER TABLE `units` DROP FOREIGN KEY `units_model_id_fkey`;

-- DropForeignKey
ALTER TABLE `units` DROP FOREIGN KEY `units_project_id_fkey`;

-- DropForeignKey
ALTER TABLE `units` DROP FOREIGN KEY `units_unit_classification_id_fkey`;

-- DropForeignKey
ALTER TABLE `users` DROP FOREIGN KEY `users_department_id_fkey`;

-- DropIndex
DROP INDEX `users_contact_number_key` ON `users`;

-- DropIndex
DROP INDEX `users_created_by_idx` ON `users`;

-- DropIndex
DROP INDEX `users_email_key` ON `users`;

-- DropIndex
DROP INDEX `users_employee_id_idx` ON `users`;

-- DropIndex
DROP INDEX `users_employee_id_key` ON `users`;

-- DropIndex
DROP INDEX `users_user_code_key` ON `users`;

-- AlterTable
ALTER TABLE `users` DROP COLUMN `avatar`,
    DROP COLUMN `contact_number`,
    DROP COLUMN `created_by`,
    DROP COLUMN `department_id`,
    DROP COLUMN `employee_id`,
    DROP COLUMN `gender`,
    DROP COLUMN `last_login`,
    DROP COLUMN `position`,
    DROP COLUMN `role`,
    DROP COLUMN `status`,
    DROP COLUMN `updated_by`,
    DROP COLUMN `user_code`;

-- DropTable
DROP TABLE `audit_logs`;

-- DropTable
DROP TABLE `brands`;

-- DropTable
DROP TABLE `classifications`;

-- DropTable
DROP TABLE `countries`;

-- DropTable
DROP TABLE `currencies`;

-- DropTable
DROP TABLE `departments`;

-- DropTable
DROP TABLE `house_and_lot_locations`;

-- DropTable
DROP TABLE `models`;

-- DropTable
DROP TABLE `products`;

-- DropTable
DROP TABLE `projects`;

-- DropTable
DROP TABLE `sub_classifications`;

-- DropTable
DROP TABLE `sub_departments`;

-- DropTable
DROP TABLE `suppliers`;

-- DropTable
DROP TABLE `unit_classifications`;

-- DropTable
DROP TABLE `units`;

-- DropTable
DROP TABLE `units_of_measure`;
