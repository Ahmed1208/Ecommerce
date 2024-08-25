-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema ecommerce
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ecommerce
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ecommerce` DEFAULT CHARACTER SET utf8mb3 ;
USE `ecommerce` ;

-- -----------------------------------------------------
-- Table `ecommerce`.`admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`admin` (
  `admin_id` INT NOT NULL,
  `admin_name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`admin_id`),
  UNIQUE INDEX `admin_id_UNIQUE` (`admin_id` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `admin_name_UNIQUE` (`admin_name` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `ecommerce`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`user` (
  `user_id` INT NOT NULL,
  `user_name` VARCHAR(45) NOT NULL,
  `balance` FLOAT NOT NULL,
  `address` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `birth_date` DATE NULL DEFAULT NULL,
  `phone` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `user_id_UNIQUE` (`user_id` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `ecommerce`.`balance_logs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`balance_logs` (
  `balance_logs_id` INT NOT NULL,
  `payment_type` VARCHAR(45) NOT NULL,
  `amount` FLOAT NOT NULL,
  `user_user_id` INT NOT NULL,
  PRIMARY KEY (`balance_logs_id`, `user_user_id`),
  UNIQUE INDEX `balance_logs_id_UNIQUE` (`balance_logs_id` ASC) VISIBLE,
  INDEX `fk_balance_logs_user1_idx` (`user_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_balance_logs_user1`
    FOREIGN KEY (`user_user_id`)
    REFERENCES `ecommerce`.`user` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `ecommerce`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`category` (
  `category_id` INT NOT NULL,
  `category_name` VARCHAR(45) NOT NULL,
  `main_category_id` VARCHAR(45) NULL DEFAULT NULL,
  `description` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE INDEX `category_id_UNIQUE` (`category_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `ecommerce`.`interests`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`interests` (
  `interests_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`interests_id`),
  UNIQUE INDEX `interests_id_UNIQUE` (`interests_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `ecommerce`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`order` (
  `order_id` INT NOT NULL,
  `total_price` DOUBLE NOT NULL,
  `date` TIMESTAMP NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  `user_id` INT NOT NULL,
  `payment_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`order_id`),
  UNIQUE INDEX `order_id_UNIQUE` (`order_id` ASC) VISIBLE,
  INDEX `fk_order_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_order_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `ecommerce`.`user` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `ecommerce`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`product` (
  `product_id` INT NOT NULL,
  `product_name` VARCHAR(45) NOT NULL,
  `description` TEXT NOT NULL,
  `category_id` INT NOT NULL,
  `quantity` INT NULL DEFAULT NULL,
  `price` INT NULL DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  UNIQUE INDEX `product_id_UNIQUE` (`product_id` ASC) VISIBLE,
  INDEX `fk_product_category1_idx` (`category_id` ASC) VISIBLE,
  CONSTRAINT `fk_product_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `ecommerce`.`category` (`category_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `ecommerce`.`order_products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`order_products` (
  `product_id` INT NOT NULL,
  `order_id` INT NOT NULL,
  PRIMARY KEY (`product_id`, `order_id`),
  UNIQUE INDEX `product_id_UNIQUE` (`product_id` ASC) VISIBLE,
  UNIQUE INDEX `order_id_UNIQUE` (`order_id` ASC) VISIBLE,
  INDEX `fk_product_has_order_order1_idx` (`order_id` ASC) VISIBLE,
  INDEX `fk_product_has_order_product1_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `fk_product_has_order_order1`
    FOREIGN KEY (`order_id`)
    REFERENCES `ecommerce`.`order` (`order_id`),
  CONSTRAINT `fk_product_has_order_product1`
    FOREIGN KEY (`product_id`)
    REFERENCES `ecommerce`.`product` (`product_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `ecommerce`.`products_inside_cart`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`products_inside_cart` (
  `user_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `product_quantity` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`, `product_id`),
  INDEX `fk_user_has_product_product1_idx` (`product_id` ASC) VISIBLE,
  INDEX `fk_user_has_product_user_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_has_product_product1`
    FOREIGN KEY (`product_id`)
    REFERENCES `ecommerce`.`product` (`product_id`),
  CONSTRAINT `fk_user_has_product_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `ecommerce`.`user` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `ecommerce`.`user_interests`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`user_interests` (
  `user_user_id` INT NOT NULL,
  `interests_interests_id` INT NOT NULL,
  PRIMARY KEY (`user_user_id`, `interests_interests_id`),
  UNIQUE INDEX `user_user_id_UNIQUE` (`user_user_id` ASC) VISIBLE,
  UNIQUE INDEX `interests_interests_id_UNIQUE` (`interests_interests_id` ASC) VISIBLE,
  INDEX `fk_user_has_interests_interests1_idx` (`interests_interests_id` ASC) VISIBLE,
  INDEX `fk_user_has_interests_user1_idx` (`user_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_has_interests_interests1`
    FOREIGN KEY (`interests_interests_id`)
    REFERENCES `ecommerce`.`interests` (`interests_id`),
  CONSTRAINT `fk_user_has_interests_user1`
    FOREIGN KEY (`user_user_id`)
    REFERENCES `ecommerce`.`user` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
