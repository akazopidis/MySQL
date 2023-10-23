CREATE TABLE `employees` (
  `emp_no` int NOT NULL AUTO_INCREMENT,
  `birth_date` date NOT NULL,
  `first_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` enum('M','F') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'M',
  `hire_date` date NOT NULL,
  PRIMARY KEY (`emp_no`),
  UNIQUE KEY `emp_no` (`emp_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;