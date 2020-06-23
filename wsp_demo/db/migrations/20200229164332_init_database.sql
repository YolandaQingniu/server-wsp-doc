-- +micrate Up
-- SQL in section 'Up' is executed when this migration is applied
CREATE TABLE `device_binds` (
  `device_bind_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `mac` varchar(255) DEFAULT NULL,
  `internal_model` varchar(255) DEFAULT NULL,
  `scale_name` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `parameter` int(11) DEFAULT NULL,
  PRIMARY KEY (`device_bind_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE `measurements` (
  `measurement_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `timestamp` bigint(20) DEFAULT NULL,
  `scale_name` varchar(255) DEFAULT NULL,
  `internal_model` varchar(255) DEFAULT NULL,
  `mac` varchar(255) DEFAULT NULL,
  `height` double DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `birthday` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `resistance` int(11) DEFAULT NULL,
  `sec_resistance` int(11) DEFAULT NULL,
  `score` double DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `bodyfat` double DEFAULT NULL,
  `subfat` double DEFAULT NULL,
  `visfat` int(11) DEFAULT NULL,
  `water` double DEFAULT NULL,
  `bmr` int(11) DEFAULT NULL,
  `bodyage` int(11) DEFAULT NULL,
  `muscle` double DEFAULT NULL,
  `bone` double DEFAULT NULL,
  `bmi` double DEFAULT NULL,
  `sinew` double DEFAULT NULL,
  `protein` double DEFAULT NULL,
  `body_shape` int(11) DEFAULT NULL,
  `fat_free_weight` double DEFAULT NULL,
  `heart_rate` int(11) DEFAULT NULL,
  `cardiac_index` double DEFAULT NULL,
  `parameter` int(11) DEFAULT NULL,
  `algorithm_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`measurement_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

CREATE TABLE `scale_users` (
  `scale_user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `primary_user_id` bigint(20) DEFAULT NULL,
  `mac` varchar(255) DEFAULT NULL,
  `user_index` int(11) DEFAULT NULL,
  `user_key` int(11) DEFAULT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scale_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`scale_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE `scales` (
  `scale_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mac` varchar(255) DEFAULT NULL,
  `scale_name` varchar(255) DEFAULT NULL,
  `internal_model` varchar(255) DEFAULT NULL,
  `last_sync_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `secret_key` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`scale_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE `unknown_measurements` (
  `unknown_measurement_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `weight` double DEFAULT NULL,
  `mac` varchar(255) DEFAULT NULL,
  `scale_name` varchar(255) DEFAULT NULL,
  `internal_model` varchar(255) DEFAULT NULL,
  `timestamp` bigint(20) DEFAULT NULL,
  `heart_rate` int(11) DEFAULT NULL,
  `resistance` int(11) DEFAULT NULL,
  `sec_resistance` int(11) DEFAULT NULL,
  `unknown_user` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`unknown_measurement_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

CREATE TABLE `users` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `height` double DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `birthday` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- +micrate Down
-- SQL section 'Down' is executed when this migration is rolled back
DROP TABLE `device_binds`;
DROP TABLE `unknown_measurements`;
DROP TABLE `scales`;
DROP TABLE `scale_users`;
DROP TABLE `measurements`;
DROP TABLE `users`;
