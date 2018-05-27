/*
Navicat MySQL Data Transfer

Source Server         : hisSystem
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : his_system

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2018-05-27 16:38:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `patient_id` int(11) NOT NULL,
  `resid_addr` varchar(255) DEFAULT NULL,
  `curr_addr` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  KEY `addr_patient_id` (`patient_id`),
  CONSTRAINT `addr_patient_id` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of address
-- ----------------------------

-- ----------------------------
-- Table structure for case
-- ----------------------------
DROP TABLE IF EXISTS `case`;
CREATE TABLE `case` (
  `case_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `case_description` varchar(255) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  PRIMARY KEY (`case_id`),
  KEY `case_patient_id` (`patient_id`),
  KEY `case_user_id` (`doctor_id`),
  CONSTRAINT `case_patient_id` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `case_user_id` FOREIGN KEY (`doctor_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of case
-- ----------------------------

-- ----------------------------
-- Table structure for contactors
-- ----------------------------
DROP TABLE IF EXISTS `contactors`;
CREATE TABLE `contactors` (
  `patient_id` int(11) NOT NULL,
  `contactors_name` varchar(20) DEFAULT NULL,
  `contactors_relation` varchar(20) DEFAULT NULL,
  `contactors_addr` varchar(100) DEFAULT NULL,
  `contactors_phone` varchar(20) DEFAULT NULL,
  `contactors_unit` varchar(30) DEFAULT NULL,
  KEY `contact_patient_id` (`patient_id`),
  CONSTRAINT `contact_patient_id` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of contactors
-- ----------------------------

-- ----------------------------
-- Table structure for drug
-- ----------------------------
DROP TABLE IF EXISTS `drug`;
CREATE TABLE `drug` (
  `drug_id` int(11) NOT NULL,
  `drug_name` varchar(255) NOT NULL,
  `drug_spec` varchar(60) NOT NULL,
  `drug_price` varchar(20) NOT NULL,
  `drug_region` varchar(255) NOT NULL,
  `drug_storage` varchar(20) NOT NULL,
  `drug_store` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`drug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of drug
-- ----------------------------

-- ----------------------------
-- Table structure for drug_store
-- ----------------------------
DROP TABLE IF EXISTS `drug_store`;
CREATE TABLE `drug_store` (
  `drug_store_id` int(11) NOT NULL,
  `drug_store_content` varchar(100) NOT NULL,
  PRIMARY KEY (`drug_store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of drug_store
-- ----------------------------

-- ----------------------------
-- Table structure for fee
-- ----------------------------
DROP TABLE IF EXISTS `fee`;
CREATE TABLE `fee` (
  `patient_id` int(11) NOT NULL,
  `patient_name` varchar(60) NOT NULL,
  `fee_resource` varchar(255) NOT NULL,
  `fee_count` varchar(20) NOT NULL,
  KEY `fee_patient_id` (`patient_id`),
  CONSTRAINT `fee_patient_id` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fee
-- ----------------------------

-- ----------------------------
-- Table structure for frequence
-- ----------------------------
DROP TABLE IF EXISTS `frequence`;
CREATE TABLE `frequence` (
  `frequence_id` int(11) NOT NULL,
  `frequence_content` varchar(60) NOT NULL,
  PRIMARY KEY (`frequence_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of frequence
-- ----------------------------

-- ----------------------------
-- Table structure for medical_order
-- ----------------------------
DROP TABLE IF EXISTS `medical_order`;
CREATE TABLE `medical_order` (
  `medical_order_id` int(11) NOT NULL,
  `start_date` varchar(20) NOT NULL,
  `start_time` varchar(20) NOT NULL,
  `content` varchar(255) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `stop_date` varchar(20) NOT NULL,
  `stop_time` varchar(20) NOT NULL,
  `stoper_id` int(11) NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`medical_order_id`),
  KEY `medical_patient_id` (`patient_id`),
  KEY `medical_user_id` (`doctor_id`),
  KEY `medical_user_stop_id` (`stoper_id`),
  CONSTRAINT `medical_patient_id` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `medical_user_id` FOREIGN KEY (`doctor_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `medical_user_stop_id` FOREIGN KEY (`stoper_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of medical_order
-- ----------------------------

-- ----------------------------
-- Table structure for method
-- ----------------------------
DROP TABLE IF EXISTS `method`;
CREATE TABLE `method` (
  `method_id` int(11) NOT NULL,
  `method_content` varchar(60) NOT NULL,
  PRIMARY KEY (`method_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of method
-- ----------------------------

-- ----------------------------
-- Table structure for nursing
-- ----------------------------
DROP TABLE IF EXISTS `nursing`;
CREATE TABLE `nursing` (
  `nursing_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `nursing_date` varchar(20) NOT NULL,
  `nursing_time` varchar(20) NOT NULL,
  `nursing_level` varchar(10) NOT NULL,
  `content` varchar(255) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `nursing_status` varchar(20) NOT NULL,
  PRIMARY KEY (`nursing_id`),
  KEY `nur_patient_id` (`patient_id`),
  KEY `nur_user_id` (`doctor_id`),
  CONSTRAINT `nur_patient_id` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `nur_user_id` FOREIGN KEY (`doctor_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nursing
-- ----------------------------

-- ----------------------------
-- Table structure for patient
-- ----------------------------
DROP TABLE IF EXISTS `patient`;
CREATE TABLE `patient` (
  `patient_id` int(11) NOT NULL,
  `patient_name` varchar(100) NOT NULL,
  `marry_stat` varchar(20) NOT NULL,
  `national` varchar(20) NOT NULL,
  `nationality` varchar(20) NOT NULL,
  `age` varchar(11) NOT NULL,
  `sex` varchar(20) NOT NULL,
  `id_card` varchar(100) NOT NULL,
  `fee_type` varchar(20) NOT NULL,
  `level` varchar(10) NOT NULL,
  PRIMARY KEY (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of patient
-- ----------------------------

-- ----------------------------
-- Table structure for patient_unit
-- ----------------------------
DROP TABLE IF EXISTS `patient_unit`;
CREATE TABLE `patient_unit` (
  `patient_id` int(11) NOT NULL,
  `unit_position` varchar(30) DEFAULT NULL,
  `unit_name` varchar(30) DEFAULT NULL,
  `unit_addr` varchar(100) DEFAULT NULL,
  `unit_phone` varchar(20) DEFAULT NULL,
  `unit_mail` varchar(30) DEFAULT NULL,
  KEY `unit_patient_id` (`patient_id`),
  CONSTRAINT `unit_patient_id` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of patient_unit
-- ----------------------------

-- ----------------------------
-- Table structure for prescription
-- ----------------------------
DROP TABLE IF EXISTS `prescription`;
CREATE TABLE `prescription` (
  `prescription_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `drug_name` varchar(255) NOT NULL,
  `drug_spec` varchar(20) NOT NULL,
  `use_amount` varchar(20) NOT NULL,
  `unit` varchar(20) NOT NULL,
  `method` varchar(60) NOT NULL,
  `frequence` varchar(60) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  PRIMARY KEY (`prescription_id`),
  KEY `pre_patient_id` (`patient_id`),
  KEY `oer_user_id` (`doctor_id`),
  CONSTRAINT `oer_user_id` FOREIGN KEY (`doctor_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `pre_patient_id` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of prescription
-- ----------------------------

-- ----------------------------
-- Table structure for specs
-- ----------------------------
DROP TABLE IF EXISTS `specs`;
CREATE TABLE `specs` (
  `spec_id` int(11) NOT NULL,
  `spec_description` varchar(100) NOT NULL,
  PRIMARY KEY (`spec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of specs
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `user_pwd` varchar(255) NOT NULL,
  `user_age` varchar(10) NOT NULL,
  `user_sex` varchar(10) NOT NULL,
  `user_dial` varchar(60) NOT NULL,
  `user_mail` varchar(255) NOT NULL,
  `user_address` varchar(255) NOT NULL,
  `user_reg_date` varchar(100) NOT NULL,
  `user_identify` varchar(60) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('2018001', 'admin', '123456', '28', '男', '13333333333', '123456@qq.com', '中國四川省成都市', '2018-05-25', 'administrator');
