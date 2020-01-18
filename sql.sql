-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Counsellor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Counsellor` (
  `idCounsellor` INT NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `phoneNo` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `` VARCHAR(45) NULL,
  PRIMARY KEY (`idCounsellor`),
  UNIQUE INDEX `idCounsellor_UNIQUE` (`idCounsellor` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`table2`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`table2` (
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`table3`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`table3` (
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`table4`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`table4` (
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`counsellors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`counsellors` (
  `idcounsellors` INT NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NULL,
  PRIMARY KEY (`idcounsellors`),
  UNIQUE INDEX `idcounsellors_UNIQUE` (`idcounsellors` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `phone_UNIQUE` (`phone` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`staff` (
  `idstaff` INT NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NULL,
  PRIMARY KEY (`idstaff`),
  UNIQUE INDEX `idcounsellors_UNIQUE` (`idstaff` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `phone_UNIQUE` (`phone` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`students` (
  `idstudents` INT NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NULL,
  `dateRegistered` DATETIME NULL DEFAULT getdate(),
  `counsellors_idcounsellors` INT NOT NULL,
  `status` VARCHAR(45) NULL,
  PRIMARY KEY (`idstudents`, `counsellors_idcounsellors`),
  UNIQUE INDEX `idcounsellors_UNIQUE` (`idstudents` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `phone_UNIQUE` (`phone` ASC) VISIBLE,
  INDEX `fk_students_counsellors_idx` (`counsellors_idcounsellors` ASC) VISIBLE,
  CONSTRAINT `fk_students_counsellors`
    FOREIGN KEY (`counsellors_idcounsellors`)
    REFERENCES `mydb`.`counsellors` (`idcounsellors`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`courses` (
  `idcourses` INT NOT NULL,
  `courseName` VARCHAR(45) NOT NULL,
  `duration` INT NOT NULL,
  PRIMARY KEY (`idcourses`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`modules`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`modules` (
  `idcourses` INT NOT NULL,
  `moduleName` VARCHAR(45) NOT NULL,
  `duration` INT NOT NULL,
  PRIMARY KEY (`idcourses`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Batches`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Batches` (
  `idBatches` INT NOT NULL AUTO_INCREMENT,
  `moduleName` VARCHAR(45) NOT NULL,
  `moduleId` INT NULL,
  PRIMARY KEY (`idBatches`),
  UNIQUE INDEX `idBatches_UNIQUE` (`idBatches` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`batch`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`batch` (
  `idbatch` INT NOT NULL AUTO_INCREMENT,
  `staff_idstaff` INT NOT NULL,
  `modules_idcourses` INT NOT NULL,
  PRIMARY KEY (`idbatch`, `staff_idstaff`, `modules_idcourses`),
  UNIQUE INDEX `idbatch_UNIQUE` (`idbatch` ASC) VISIBLE,
  INDEX `fk_batch_staff1_idx` (`staff_idstaff` ASC) VISIBLE,
  INDEX `fk_batch_modules1_idx` (`modules_idcourses` ASC) VISIBLE,
  CONSTRAINT `fk_batch_staff1`
    FOREIGN KEY (`staff_idstaff`)
    REFERENCES `mydb`.`staff` (`idstaff`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_batch_modules1`
    FOREIGN KEY (`modules_idcourses`)
    REFERENCES `mydb`.`modules` (`idcourses`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`batch`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`batch` (
  `idbatch` INT NOT NULL AUTO_INCREMENT,
  `staff_idstaff` INT NOT NULL,
  `modules_idcourses` INT NOT NULL,
  PRIMARY KEY (`idbatch`, `staff_idstaff`, `modules_idcourses`),
  UNIQUE INDEX `idbatch_UNIQUE` (`idbatch` ASC) VISIBLE,
  INDEX `fk_batch_staff1_idx` (`staff_idstaff` ASC) VISIBLE,
  INDEX `fk_batch_modules1_idx` (`modules_idcourses` ASC) VISIBLE,
  CONSTRAINT `fk_batch_staff1`
    FOREIGN KEY (`staff_idstaff`)
    REFERENCES `mydb`.`staff` (`idstaff`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_batch_modules1`
    FOREIGN KEY (`modules_idcourses`)
    REFERENCES `mydb`.`modules` (`idcourses`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`students_has_courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`students_has_courses` (
  `students_idstudents` INT NOT NULL,
  `students_counsellors_idcounsellors` INT NOT NULL,
  `courses_idcourses` INT NOT NULL,
  `dateStarted` DATETIME NULL DEFAULT getdate(),
  PRIMARY KEY (`students_idstudents`, `students_counsellors_idcounsellors`, `courses_idcourses`),
  INDEX `fk_students_has_courses_courses1_idx` (`courses_idcourses` ASC) VISIBLE,
  INDEX `fk_students_has_courses_students1_idx` (`students_idstudents` ASC, `students_counsellors_idcounsellors` ASC) VISIBLE,
  CONSTRAINT `fk_students_has_courses_students1`
    FOREIGN KEY (`students_idstudents` , `students_counsellors_idcounsellors`)
    REFERENCES `mydb`.`students` (`idstudents` , `counsellors_idcounsellors`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_students_has_courses_courses1`
    FOREIGN KEY (`courses_idcourses`)
    REFERENCES `mydb`.`courses` (`idcourses`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`students_has_batch`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`students_has_batch` (
  `students_idstudents` INT NOT NULL,
  `students_counsellors_idcounsellors` INT NOT NULL,
  `batch_idbatch` INT NOT NULL,
  PRIMARY KEY (`students_idstudents`, `students_counsellors_idcounsellors`, `batch_idbatch`),
  INDEX `fk_students_has_batch_batch1_idx` (`batch_idbatch` ASC) VISIBLE,
  INDEX `fk_students_has_batch_students1_idx` (`students_idstudents` ASC, `students_counsellors_idcounsellors` ASC) VISIBLE,
  CONSTRAINT `fk_students_has_batch_students1`
    FOREIGN KEY (`students_idstudents` , `students_counsellors_idcounsellors`)
    REFERENCES `mydb`.`students` (`idstudents` , `counsellors_idcounsellors`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_students_has_batch_batch1`
    FOREIGN KEY (`batch_idbatch`)
    REFERENCES `mydb`.`batch` (`idbatch`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`modules_has_courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`modules_has_courses` (
  `modules_idcourses` INT NOT NULL,
  `courses_idcourses` INT NOT NULL,
  PRIMARY KEY (`modules_idcourses`, `courses_idcourses`),
  INDEX `fk_modules_has_courses_courses1_idx` (`courses_idcourses` ASC) VISIBLE,
  INDEX `fk_modules_has_courses_modules1_idx` (`modules_idcourses` ASC) VISIBLE,
  CONSTRAINT `fk_modules_has_courses_modules1`
    FOREIGN KEY (`modules_idcourses`)
    REFERENCES `mydb`.`modules` (`idcourses`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_modules_has_courses_courses1`
    FOREIGN KEY (`courses_idcourses`)
    REFERENCES `mydb`.`courses` (`idcourses`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
