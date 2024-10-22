-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 22, 2024 at 05:55 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `floodguardv0`
--

-- --------------------------------------------------------

--
-- Table structure for table `deadbodies`
--

CREATE TABLE `deadbodies` (
  `body_id` int(11) NOT NULL,
  `image_url` text NOT NULL,
  `found_location` text NOT NULL,
  `found_time` datetime NOT NULL,
  `submitted_hospital_id` int(11) NOT NULL,
  `submission_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `identified` enum('Yes','No') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `deadbodies`
--

INSERT INTO `deadbodies` (`body_id`, `image_url`, `found_location`, `found_time`, `submitted_hospital_id`, `submission_time`, `identified`) VALUES
(6, 'https://api.multiavatar.com/Binx%20Bond.png', 'Dhanmondi, Dhaka', '2024-10-01 08:00:00', 1, '2024-10-08 02:49:10', 'No'),
(7, 'https://api.multiavatar.com/Binx%20Bond.png', 'Motijheel, Dhaka', '2024-09-30 14:30:00', 2, '2024-10-08 02:49:10', 'Yes'),
(8, 'https://api.multiavatar.com/Binx%20Bond.png', 'Chittagong Port Area, Chittagong', '2024-09-29 12:45:00', 2, '2024-10-08 02:49:10', 'No'),
(9, 'https://api.multiavatar.com/Binx%20Bond.png', 'Kazirbazar, Sylhet', '2024-09-28 16:10:00', 3, '2024-10-08 02:49:10', 'Yes'),
(10, 'https://api.multiavatar.com/Binx%20Bond.png', 'Sonadanga, Khulna', '2024-09-27 09:20:00', 5, '2024-10-08 02:49:10', 'No'),
(11, 'http://example.com/image.jpg', 'Area A, Upazila B, District C', '2024-09-25 12:00:00', 1, '2024-10-08 11:36:23', 'No');

-- --------------------------------------------------------

--
-- Table structure for table `donations`
--

CREATE TABLE `donations` (
  `donation_id` int(11) NOT NULL,
  `donor_name` varchar(100) NOT NULL,
  `donation_type` enum('Food','Money','Clothing') NOT NULL,
  `quantity` int(11) NOT NULL,
  `date_received` datetime DEFAULT current_timestamp(),
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `donations`
--

INSERT INTO `donations` (`donation_id`, `donor_name`, `donation_type`, `quantity`, `date_received`, `notes`) VALUES
(3, 'Shamima Nasrin', 'Clothing', 200, '2023-07-17 00:00:00', 'Winter clothing for displaced families'),
(4, 'Rifat Jahan', 'Food', 150, '2023-07-18 00:00:00', 'Non-perishable food items'),
(5, 'Anisur Rahman', 'Money', 100000, '2023-07-19 00:00:00', 'Donation to support shelter operations'),
(6, 'Parveen Akter', 'Clothing', 300, '2023-07-20 00:00:00', 'Clothes for children and women'),
(7, 'Asif Iqbal', 'Food', 80, '2023-07-21 00:00:00', 'Canned food donations'),
(8, 'Sabina Banu', 'Money', 25000, '2023-07-22 00:00:00', 'Emergency fund for medical supplies'),
(9, 'Hafizur Rahman', 'Clothing', 500, '2023-07-23 00:00:00', 'Used clothes for adults and children'),
(10, 'Mita Sultana', 'Food', 75, '2023-07-24 00:00:00', 'Instant noodles and snacks'),
(11, 'John Doe', 'Food', 10, '2024-10-07 02:48:57', 'Non-perishable items only'),
(12, 'John Doe', 'Food', 10, '2024-10-07 03:29:17', 'Non-perishable items only'),
(13, 'Jane Doe', 'Money', 12000, '2024-10-07 03:38:33', 'Donating to help shelter operations'),
(15, 'John Doe', 'Food', 10, '2024-10-08 01:40:43', 'Non-perishable items only'),
(16, 'Kuddush Ali', 'Food', 87, '2024-10-08 17:12:15', 'Non-perishable items only');

-- --------------------------------------------------------

--
-- Table structure for table `emergencyalerts`
--

CREATE TABLE `emergencyalerts` (
  `alert_id` int(11) NOT NULL,
  `victim_id` int(11) NOT NULL,
  `alert_time` datetime DEFAULT current_timestamp(),
  `location_latitude` decimal(10,8) NOT NULL,
  `location_longitude` decimal(11,8) NOT NULL,
  `message` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `emergencyalerts`
--

INSERT INTO `emergencyalerts` (`alert_id`, `victim_id`, `alert_time`, `location_latitude`, `location_longitude`, `message`) VALUES
(1, 1, '2022-06-05 12:00:00', 23.81030000, 90.41250000, 'Flood alert in Dhanmondi area. Immediate help required.'),
(2, 2, '2022-06-06 09:00:00', 23.81030000, 90.41250000, 'Severe flooding reported in Shahbag.'),
(3, 3, '2020-07-20 15:30:00', 23.81030000, 90.41250000, 'Help needed for Akram in Gulshan.'),
(4, 4, '2021-08-02 11:00:00', 23.81030000, 90.41250000, 'Nadia needs assistance in Mirpur.'),
(5, 5, '2020-07-16 10:00:00', 23.81030000, 90.41250000, 'Farhan in Uttara requests urgent help.'),
(6, 6, '2021-08-05 12:30:00', 22.35690000, 91.78320000, 'Sabina in Chittagong is in danger.'),
(7, 7, '2019-09-03 14:00:00', 24.37420000, 88.60700000, 'Shahidul needs assistance in Rajshahi.'),
(8, 8, '2021-08-06 10:00:00', 22.70100000, 90.35350000, 'Anika in Barisal requires help.'),
(9, 9, '2019-10-05 17:00:00', 24.89440000, 91.88320000, 'Sakib in Sylhet reports flooding.'),
(10, 10, '2022-06-07 08:30:00', 22.84560000, 89.54030000, 'Tania needs urgent help in Khulna.');

-- --------------------------------------------------------

--
-- Table structure for table `floods`
--

CREATE TABLE `floods` (
  `flood_id` int(11) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `severity` enum('Low','Medium','High','Severe') NOT NULL,
  `affected_area` varchar(255) NOT NULL,
  `water_level` decimal(10,2) NOT NULL,
  `danger_level` enum('Low','Medium','High') NOT NULL,
  `reported_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `floods`
--

INSERT INTO `floods` (`flood_id`, `start_date`, `end_date`, `severity`, `affected_area`, `water_level`, `danger_level`, `reported_at`, `notes`) VALUES
(1, '2023-01-01 00:00:00', '2023-01-05 23:59:59', 'Low', 'Dhanmondi, Dhaka', 5.00, 'High', '2024-10-05 04:30:43', NULL),
(3, '2023-01-03 00:00:00', '2023-01-07 23:59:59', 'Low', 'Chittagong', 3.00, 'Low', '2024-10-05 04:30:43', NULL),
(4, '2023-01-04 00:00:00', '2023-01-08 23:59:59', 'High', 'Rajshahi', 5.50, 'High', '2024-10-05 04:30:43', NULL),
(5, '2023-01-05 00:00:00', '2023-01-09 23:59:59', 'Medium', 'Barisal', 4.50, 'Medium', '2024-10-05 04:30:43', NULL),
(6, '2023-01-06 00:00:00', '2023-01-10 23:59:59', 'Severe', 'Sylhet', 6.00, 'High', '2024-10-05 04:30:43', NULL),
(7, '2024-10-08 10:00:00', '2024-10-09 12:00:00', 'High', 'Dhaka', 6.50, 'High', '2024-10-08 03:23:00', 'Severe flooding reported in Dhaka.'),
(8, '2024-10-08 10:00:00', '2024-10-09 12:00:00', 'High', 'Dhaka', 6.50, 'High', '2024-10-08 06:42:13', 'Severe flooding reported in Dhaka.');

-- --------------------------------------------------------

--
-- Table structure for table `hospital`
--

CREATE TABLE `hospital` (
  `hospital_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `location` text NOT NULL,
  `bed` int(11) NOT NULL,
  `bed_available` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hospital`
--

INSERT INTO `hospital` (`hospital_id`, `name`, `location`, `bed`, `bed_available`) VALUES
(1, 'Dhaka Medical College Hospital', 'Dhanmondi, Dhaka', 1000, 150),
(2, 'Chittagong Medical College Hospital', 'Chawkbazar, Chittagong', 800, 120),
(3, 'Sylhet MAG Osmani Medical College', 'Kazirbazar, Sylhet', 500, 200),
(4, 'Rajshahi Medical College Hospital', 'Laxmipur, Rajshahi', 400, 100),
(5, 'Khulna Medical College Hospital', 'Sonadanga, Khulna', 300, 80);

-- --------------------------------------------------------

--
-- Table structure for table `hydrolevelmap`
--

CREATE TABLE `hydrolevelmap` (
  `map_id` int(11) NOT NULL,
  `region` varchar(100) NOT NULL,
  `latitude` decimal(10,8) NOT NULL,
  `longitude` decimal(11,8) NOT NULL,
  `water_level` decimal(10,2) NOT NULL,
  `recorded_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hydrolevelmap`
--

INSERT INTO `hydrolevelmap` (`map_id`, `region`, `latitude`, `longitude`, `water_level`, `recorded_at`) VALUES
(1, 'Dhanmondi', 23.81030000, 90.41250000, 4.50, '2024-10-05 10:30:43'),
(2, 'Gulshan', 23.81030000, 90.41250000, 3.80, '2024-10-05 10:30:43'),
(3, 'Shahbag', 23.81030000, 90.41250000, 4.00, '2024-10-05 10:30:43'),
(4, 'Rajshahi', 24.37420000, 88.60700000, 5.20, '2024-10-05 10:30:43'),
(5, 'Chittagong', 22.35690000, 91.78320000, 6.00, '2024-10-05 10:30:43'),
(6, 'Barisal', 22.70100000, 90.35350000, 4.30, '2024-10-05 10:30:43'),
(7, 'Sylhet', 24.89440000, 91.88320000, 5.00, '2024-10-05 10:30:43'),
(8, 'Khulna', 22.84560000, 89.54030000, 4.80, '2024-10-05 10:30:43');

-- --------------------------------------------------------

--
-- Table structure for table `mobiletowers`
--

CREATE TABLE `mobiletowers` (
  `tower_id` int(11) NOT NULL,
  `location` varchar(100) NOT NULL,
  `operator` varchar(100) NOT NULL,
  `active_status` enum('Active','Inactive') NOT NULL,
  `latitude` decimal(10,8) NOT NULL,
  `longitude` decimal(11,8) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mobiletowers`
--

INSERT INTO `mobiletowers` (`tower_id`, `location`, `operator`, `active_status`, `latitude`, `longitude`, `created_at`) VALUES
(1, 'Dhanmondi', 'Grameenphone', 'Active', 23.81030000, 90.41250000, '2024-10-05 04:30:43'),
(2, 'Shahbag', 'Robi', 'Active', 23.81030000, 90.41250000, '2024-10-05 04:30:43'),
(3, 'Gulshan', 'Banglalink', 'Active', 23.81030000, 90.41250000, '2024-10-05 04:30:43'),
(4, 'Mirpur', 'Teletalk', 'Active', 23.81030000, 90.41250000, '2024-10-05 04:30:43'),
(5, 'Uttara', 'Airtel', 'Active', 23.81030000, 90.41250000, '2024-10-05 04:30:43'),
(6, 'Chittagong', 'Grameenphone', 'Active', 22.35690000, 91.78320000, '2024-10-05 04:30:43'),
(7, 'Rajshahi', 'Robi', 'Active', 24.37420000, 88.60700000, '2024-10-05 04:30:43'),
(8, 'Barisal', 'Banglalink', 'Active', 22.70100000, 90.35350000, '2024-10-05 04:30:43'),
(9, 'Sylhet', 'Teletalk', 'Active', 24.89440000, 91.88320000, '2024-10-05 04:30:43'),
(10, 'Khulna', 'Airtel', 'Active', 22.84560000, 89.54030000, '2024-10-05 04:30:43');

-- --------------------------------------------------------

--
-- Table structure for table `rescueassignments`
--

CREATE TABLE `rescueassignments` (
  `assignment_id` int(11) NOT NULL,
  `rescuer_id` int(11) NOT NULL,
  `victim_id` int(11) NOT NULL,
  `rescue_time` datetime NOT NULL,
  `status` enum('Pending','In Progress','Completed') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rescueassignments`
--

INSERT INTO `rescueassignments` (`assignment_id`, `rescuer_id`, `victim_id`, `rescue_time`, `status`) VALUES
(2, 2, 2, '2022-06-06 10:00:00', 'In Progress'),
(3, 3, 3, '2020-07-20 16:30:00', 'Pending'),
(4, 4, 4, '2021-08-02 12:15:00', 'Completed'),
(5, 5, 5, '2020-07-16 11:45:00', 'In Progress'),
(6, 6, 6, '2021-08-05 14:00:00', 'Completed'),
(7, 7, 7, '2019-09-03 15:30:00', 'Pending'),
(8, 8, 8, '2021-08-06 10:00:00', 'Completed'),
(9, 9, 9, '2019-10-05 18:00:00', 'Pending'),
(10, 10, 10, '2022-06-07 09:30:00', 'In Progress'),
(11, 1, 1, '2024-10-07 12:00:00', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `rescuer`
--

CREATE TABLE `rescuer` (
  `rescuer_id` int(11) NOT NULL,
  `NID` varchar(20) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `address_area` varchar(100) DEFAULT NULL,
  `address_upazila` varchar(100) DEFAULT NULL,
  `address_district` varchar(100) DEFAULT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `organization` varchar(100) DEFAULT NULL,
  `gender` enum('Male','Female') DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `availability_status` enum('Available','Unavailable') DEFAULT NULL,
  `skills` text DEFAULT NULL,
  `resources_available` text DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `current_assignments` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`current_assignments`)),
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rescuer`
--

INSERT INTO `rescuer` (`rescuer_id`, `NID`, `name`, `address_area`, `address_upazila`, `address_district`, `latitude`, `longitude`, `mobile`, `email`, `organization`, `gender`, `age`, `availability_status`, `skills`, `resources_available`, `capacity`, `current_assignments`, `notes`) VALUES
(1, '0987654321098', 'Rashedul Hasan', 'Dhanmondi', 'Dhaka Sadar', 'Dhaka', 23.81030000, 90.41250000, '01723456701', 'rashedul@example.com', 'Red Crescent', 'Male', 29, 'Available', 'First Aid', 'Boat', 10, NULL, NULL),
(2, '1098765432109', 'Shila Begum', 'Shahbag', 'Dhaka Sadar', 'Dhaka', 23.81030000, 90.41250000, '01723456702', 'shila@example.com', 'Green Bangladesh', 'Female', 32, 'Available', 'Emergency Response', 'Medicines', 8, NULL, NULL),
(3, '2109876543210', 'Kamran Ahmed', 'Gulshan', 'Dhaka Sadar', 'Dhaka', 23.81030000, 90.41250000, '01723456703', 'kamran@example.com', 'Humanity First', 'Male', 36, 'Available', 'Rescue Operations', 'Boat', 12, NULL, NULL),
(4, '3210987654321', 'Nafisa Nabila', 'Mirpur', 'Dhaka Sadar', 'Dhaka', 23.81030000, 90.41250000, '01723456704', 'nafisa@example.com', 'Save the Children', 'Female', 28, 'Available', 'Child Care', 'Food Supplies', 6, NULL, NULL),
(5, '4321098765432', 'Imran Khan', 'Uttara', 'Dhaka Sadar', 'Dhaka', 23.81030000, 90.41250000, '01723456705', 'imran@example.com', 'Local Heroes', 'Male', 40, 'Available', 'Swimming', 'Boat', 10, NULL, NULL),
(6, '5432109876543', 'Dilara Begum', 'Chittagong', 'Chittagong Sadar', 'Chittagong', 22.35690000, 91.78320000, '01812345679', 'dilara@example.com', 'Chittagong Relief', 'Female', 35, 'Available', 'First Aid', 'Medicines', 15, NULL, NULL),
(7, '6543210987654', 'Tariq Rahman', 'Rajshahi', 'Rajshahi Sadar', 'Rajshahi', 24.37420000, 88.60700000, '01823456778', 'tariq@example.com', 'Rajshahi Helpers', 'Male', 30, 'Available', 'Rescue Operations', 'Boat', 12, NULL, NULL),
(8, '7654321098765', 'Fatema Nasrin', 'Barisal', 'Barisal Sadar', 'Barisal', 22.70100000, 90.35350000, '01934567879', 'fatema@example.com', 'Barisal Community', 'Female', 27, 'Available', 'Logistics', 'Food Supplies', 8, NULL, NULL),
(9, '8765432109876', 'Sabbir Rahman', 'Sylhet', 'Sylhet Sadar', 'Sylhet', 24.89440000, 91.88320000, '01945678901', 'sabbir@example.com', 'Sylhet Volunteers', 'Male', 33, 'Available', 'Swimming', 'Boat', 9, NULL, NULL),
(10, '9876543210987', 'Nazma Akter', 'Khulna', 'Khulna Sadar', 'Khulna', 22.84560000, 89.54030000, '01956789023', 'nazma@example.com', 'Khulna Aid', 'Female', 31, 'Available', 'Medical Assistance', 'Medicines', 14, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shelters`
--

CREATE TABLE `shelters` (
  `shelter_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address_area` varchar(100) NOT NULL,
  `address_upazila` varchar(100) NOT NULL,
  `address_district` varchar(100) NOT NULL,
  `latitude` decimal(10,8) NOT NULL,
  `longitude` decimal(11,8) NOT NULL,
  `total_population` int(11) DEFAULT NULL,
  `number_of_children` int(11) DEFAULT NULL,
  `number_of_women` int(11) DEFAULT NULL,
  `number_of_mothers` int(11) DEFAULT NULL,
  `required_food` text DEFAULT NULL,
  `required_medicine` text DEFAULT NULL,
  `medical_support` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shelters`
--

INSERT INTO `shelters` (`shelter_id`, `name`, `address_area`, `address_upazila`, `address_district`, `latitude`, `longitude`, `total_population`, `number_of_children`, `number_of_women`, `number_of_mothers`, `required_food`, `required_medicine`, `medical_support`) VALUES
(1, 'Shahid Minar Shelter', 'Shahbagh', 'Dhaka South', 'Dhaka', 23.73800000, 90.39840000, 300, 90, 100, 40, '500', '300', 'Yes'),
(2, 'Kamlapur Shelter', 'Kamlapur', 'Motijheel', 'Dhaka', 23.73180000, 90.42670000, 250, 70, 80, 30, '400', '250', 'No'),
(3, 'Jatrabari Shelter', 'Jatrabari', 'Dhaka South', 'Dhaka', 23.70770000, 90.43160000, 280, 85, 95, 35, '450', '280', 'Yes'),
(4, 'Khilgaon Shelter', 'Khilgaon', 'Dhaka South', 'Dhaka', 23.75270000, 90.42890000, 200, 55, 65, 22, '300', '180', 'No'),
(5, 'Banani Shelter', 'Banani', 'Dhaka North', 'Dhaka', 23.79360000, 90.40490000, 240, 75, 85, 32, '360', '220', 'Yes'),
(6, 'Mirpur Shelter', 'Mirpur', 'Dhaka North', 'Dhaka', 23.82230000, 90.36540000, 350, 120, 130, 50, '600', '400', 'Yes'),
(7, 'Mohammadpur Shelter', 'Mohammadpur', 'Dhaka North', 'Dhaka', 23.76250000, 90.36260000, 230, 68, 77, 29, '320', '200', 'No'),
(8, 'Cox’s Bazar Central Shelter', 'Central', 'Cox’s Bazar Sadar', 'Cox’s Bazar', 21.42720000, 91.97120000, 320, 100, 110, 45, '500', '350', 'Yes'),
(9, 'Teknaf Shelter', 'Teknaf', 'Teknaf', 'Cox’s Bazar', 20.86360000, 92.30080000, 180, 50, 60, 25, '200', '120', 'No'),
(10, 'Comilla Shelter', 'Kandirpar', 'Comilla Sadar', 'Comilla', 23.46370000, 91.17810000, 270, 85, 95, 35, '450', '270', 'Yes'),
(11, 'Feni Shelter', 'Feni Town', 'Feni', 'Feni', 23.01590000, 91.40160000, 220, 60, 70, 28, '330', '200', 'No'),
(12, 'Agrabad Shelter', 'Agrabad', 'Chittagong', 'Chittagong', 22.33570000, 91.83270000, 400, 140, 150, 60, '700', '450', 'Yes'),
(13, 'Halishahar Shelter', 'Halishahar', 'Chittagong', 'Chittagong', 22.32610000, 91.77480000, 230, 75, 85, 32, '350', '220', 'No'),
(14, 'Rajshahi Central Shelter', 'Kazla', 'Rajshahi City', 'Rajshahi', 24.37420000, 88.60420000, 200, 60, 65, 22, '300', '180', 'Yes'),
(15, 'Sylhet Central Shelter', 'Zindabazar', 'Sylhet City', 'Sylhet', 24.89780000, 91.87140000, 250, 70, 80, 30, '380', '230', 'No'),
(16, 'Narayanganj Shelter', 'Chashara', 'Narayanganj Sadar', 'Narayanganj', 23.62380000, 90.49970000, 270, 85, 90, 34, '450', '280', 'Yes'),
(17, 'Jessore Shelter', 'New Town', 'Jessore', 'Jessore', 23.16940000, 89.21310000, 220, 65, 70, 28, '330', '200', 'No'),
(18, 'Khulna City Shelter', 'Khulna', 'Khulna Sadar', 'Khulna', 22.84560000, 89.54030000, 300, 90, 100, 40, '500', '300', 'Yes'),
(19, 'Barisal Shelter', 'Band Road', 'Barisal', 'Barisal', 22.70000000, 90.36670000, 190, 55, 65, 24, '280', '160', 'No'),
(20, 'Patuakhali Shelter', 'Kuakata', 'Patuakhali', 'Patuakhali', 21.81640000, 90.11890000, 150, 45, 50, 18, '230', '140', 'Yes'),
(21, 'Bogura Shelter', 'Bogura Town', 'Bogura', 'Bogura', 24.84660000, 89.37140000, 180, 55, 60, 20, '280', '170', 'No'),
(22, 'Rangpur Shelter', 'Station Road', 'Rangpur', 'Rangpur', 25.74680000, 89.25080000, 260, 80, 90, 36, '400', '250', 'Yes'),
(23, 'Jamalpur Shelter', 'Station Area', 'Jamalpur', 'Jamalpur', 24.92600000, 89.93770000, 210, 65, 75, 29, '320', '190', 'No'),
(24, 'Savar Shelter', 'Savar', 'Savar', 'Dhaka', 23.85830000, 90.26760000, 340, 110, 120, 46, '550', '350', 'Yes'),
(25, 'Gazipur Shelter', 'Tongi', 'Gazipur Sadar', 'Gazipur', 23.89670000, 90.40230000, 260, 80, 90, 35, '400', '250', 'Yes'),
(26, 'Tangail Shelter', 'Tangail Town', 'Tangail', 'Tangail', 24.25690000, 89.91670000, 240, 70, 80, 32, '350', '220', 'No'),
(27, 'Dinajpur Shelter', 'Dinajpur Town', 'Dinajpur', 'Dinajpur', 25.62760000, 88.63770000, 200, 60, 70, 28, '300', '180', 'Yes'),
(28, 'Mymensingh Shelter', 'Ganginarpar', 'Mymensingh', 'Mymensingh', 24.75680000, 90.40650000, 310, 95, 110, 45, '500', '320', 'Yes'),
(29, 'Noakhali Shelter', 'Maijdee Court', 'Noakhali', 'Noakhali', 22.81870000, 91.09970000, 230, 65, 75, 30, '350', '210', 'No'),
(30, 'Barisal River Shelter', 'Port Road', 'Barisal', 'Barisal', 22.70200000, 90.35250000, 210, 60, 70, 28, '320', '200', 'Yes'),
(31, 'Pabna Shelter', 'Pabna Town', 'Pabna', 'Pabna', 23.99850000, 89.23330000, 180, 50, 60, 20, '280', '170', 'No'),
(32, 'Kushtia Shelter', 'Kushtia Town', 'Kushtia', 'Kushtia', 23.90200000, 89.12200000, 220, 70, 80, 30, '340', '200', 'Yes'),
(33, 'Bogra Flood Shelter', 'Bogra City', 'Bogra', 'Bogra', 24.85430000, 89.37670000, 270, 80, 90, 35, '450', '260', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `victim`
--

CREATE TABLE `victim` (
  `victim_id` int(11) NOT NULL,
  `NID` varchar(20) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `address_area` varchar(100) DEFAULT NULL,
  `address_upazila` varchar(100) DEFAULT NULL,
  `address_district` varchar(100) DEFAULT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `gender` enum('Male','Female') DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `number_of_family_members` int(11) DEFAULT NULL,
  `health_status` varchar(100) DEFAULT NULL,
  `danger_level` enum('Low','Medium','High') DEFAULT NULL,
  `rescue_status` enum('Pending','In Progress','Completed') DEFAULT NULL,
  `rescue_time` datetime DEFAULT NULL,
  `resources_needed` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `victim`
--

INSERT INTO `victim` (`victim_id`, `NID`, `name`, `address_area`, `address_upazila`, `address_district`, `latitude`, `longitude`, `mobile`, `email`, `gender`, `age`, `number_of_family_members`, `health_status`, `danger_level`, `rescue_status`, `rescue_time`, `resources_needed`) VALUES
(1, '1234567890123', 'Rahim Khan', 'Dhanmondi', 'Dhaka Sadar', 'Dhaka', 23.81030000, 90.41250000, '01712345678', 'rahim@example.com', 'Male', 34, 4, 'Injured', 'High', 'Pending', NULL, NULL),
(2, '2345678901234', 'Fatima Ahmed', 'Shahbag', 'Dhaka Sadar', 'Dhaka', 23.81030000, 90.41250000, '01723456789', 'fatima@example.com', 'Female', 28, 3, 'Safe', 'Medium', 'In Progress', NULL, NULL),
(3, '3456789012345', 'Akram Hossain', 'Gulshan', 'Dhaka Sadar', 'Dhaka', 23.81030000, 90.41250000, '01734567890', 'akram@example.com', 'Male', 40, 5, 'Injured', 'High', 'Completed', NULL, NULL),
(4, '4567890123456', 'Nadia Islam', 'Mirpur', 'Dhaka Sadar', 'Dhaka', 23.81030000, 90.41250000, '01745678901', 'nadia@example.com', 'Female', 22, 2, 'Safe', 'Low', 'Pending', NULL, NULL),
(5, '5678901234567', 'Farhan Ahmed', 'Uttara', 'Dhaka Sadar', 'Dhaka', 23.81030000, 90.41250000, '01756789012', 'farhan@example.com', 'Male', 30, 3, 'Safe', 'Low', 'In Progress', NULL, NULL),
(6, '6789012345678', 'Sabina Banu', 'Chittagong', 'Chittagong Sadar', 'Chittagong', 22.35690000, 91.78320000, '01812345678', 'sabina@example.com', 'Female', 29, 4, 'Injured', 'Medium', 'Pending', NULL, NULL),
(7, '7890123456789', 'Shahidul Islam', 'Rajshahi', 'Rajshahi Sadar', 'Rajshahi', 24.37420000, 88.60700000, '01823456789', 'shahidul@example.com', 'Male', 37, 5, 'Safe', 'Low', 'Completed', NULL, NULL),
(8, '8901234567890', 'Anika Rahman', 'Barisal', 'Barisal Sadar', 'Barisal', 22.70100000, 90.35350000, '01934567890', 'anika@example.com', 'Female', 25, 2, 'Injured', 'Medium', 'In Progress', NULL, NULL),
(9, '9012345678901', 'Sakib Al Hasan', 'Sylhet', 'Sylhet Sadar', 'Sylhet', 24.89440000, 91.88320000, '01945678901', 'sakib@example.com', 'Male', 34, 6, 'Safe', 'Low', 'Pending', NULL, NULL),
(10, '0123456789012', 'Tania Sultana', 'Khulna', 'Khulna Sadar', 'Khulna', 22.84560000, 89.54030000, '01956789012', 'tania@example.com', 'Female', 31, 4, 'Injured', 'High', 'Completed', NULL, NULL),
(53, '1999203345678', 'Hasan Ali', 'Mirpur', 'Dhaka North', 'Dhaka', 23.81033100, 90.41252100, '01711112222', 'hasan.ali@example.com', 'Male', 35, 4, 'Injured', 'High', 'In Progress', '2024-10-10 14:30:00', 'Water, Medicine'),
(54, '2000112233445', 'Rashida Begum', 'Kotwali', 'Chittagong', 'Chittagong', 22.35685200, 91.78318200, '01711112222', 'rashida.begum@example.com', 'Female', 45, 6, 'Healthy', 'Medium', 'Pending', NULL, 'Food, Shelter'),
(55, '1998192736457', 'Abdul Karim', 'Sylhet Sadar', 'Sylhet Sadar', 'Sylhet', 24.89493000, 91.86870600, '01722223333', 'abdul.karim@example.com', 'Male', 60, 3, 'Critical', 'High', 'In Progress', '2024-10-10 15:00:00', 'Medical Assistance, Food'),
(56, '2001234567890', 'Nazma Khatun', 'Gopalganj Sadar', 'Gopalganj Sadar', 'Gopalganj', 23.00563700, 89.82554800, '01722223333', 'nazma.khatun@example.com', 'Female', 30, 5, 'Injured', 'Low', 'Completed', '2024-10-10 16:00:00', 'None'),
(57, '1987123456789', 'Fahim Rahman', 'Rangpur Sadar', 'Rangpur Sadar', 'Rangpur', 25.74389300, 89.27522700, '01733334444', 'fahim.rahman@example.com', 'Male', 25, 2, 'Healthy', 'Low', 'Pending', NULL, 'Food, Clean Water'),
(58, '2002345678901', 'Mariam Akter', 'Uttara', 'Dhaka North', 'Dhaka', 23.87417800, 90.39838700, '01744445555', 'mariam.akter@example.com', 'Female', 40, 7, 'Injured', 'Medium', 'In Progress', '2024-10-11 10:30:00', 'Shelter, Medicine'),
(59, '1994567890123', 'Jamal Uddin', 'Motijheel', 'Dhaka South', 'Dhaka', 23.72922300, 90.41777700, '01755556666', 'jamal.uddin@example.com', 'Male', 50, 3, 'Critical', 'High', 'In Progress', '2024-10-11 11:00:00', 'Medical Assistance, Food, Water'),
(60, '2003456789012', 'Shakib Khan', 'Barisal Sadar', 'Barisal Sadar', 'Barisal', 22.70100200, 90.35345100, '01766667777', 'shakib.khan@example.com', 'Male', 33, 5, 'Healthy', 'Medium', 'Pending', NULL, 'Food, Shelter, Water'),
(61, '1995678901234', 'Farhana Islam', 'Khulna Sadar', 'Khulna Sadar', 'Khulna', 22.84564100, 89.54032800, '01777778888', 'farhana.islam@example.com', 'Female', 27, 4, 'Injured', 'Medium', 'Completed', '2024-10-11 12:30:00', 'None'),
(62, '1989987654321', 'Shirin Akter', 'Rajshahi Sadar', 'Rajshahi Sadar', 'Rajshahi', 24.37452300, 88.60416600, '01788889999', 'shirin.akter@example.com', 'Female', 55, 3, 'Critical', 'High', 'In Progress', '2024-10-11 13:00:00', 'Medical Assistance, Shelter, Food'),
(63, '1999001122334', 'Rizwan Ahmed', 'Bashundhara', 'Dhaka East', 'Dhaka', 23.86731200, 90.39861100, '01799990000', 'rizwan.ahmed@example.com', 'Male', 28, 2, 'Healthy', 'Low', 'Pending', NULL, 'Food, Water'),
(64, '2000123456789', 'Fatema Nasreen', 'Narayanganj Sadar', 'Narayanganj Sadar', 'Narayanganj', 23.62918700, 90.49711800, '01788880001', 'fatema.nasreen@example.com', 'Female', 32, 5, 'Injured', 'Medium', 'In Progress', '2024-10-12 14:30:00', 'Shelter, Medicine'),
(65, '1998123456780', 'Saifullah Khan', 'Narsingdi Sadar', 'Narsingdi Sadar', 'Narsingdi', 23.90769300, 90.72465200, '01777770002', 'saifullah.khan@example.com', 'Male', 45, 4, 'Critical', 'High', 'In Progress', '2024-10-12 15:00:00', 'Medical Assistance, Food'),
(66, '1987214567891', 'Kamal Hossain', 'Bogra Sadar', 'Bogra Sadar', 'Bogra', 24.84907300, 89.37311100, '01766660003', 'kamal.hossain@example.com', 'Male', 38, 3, 'Healthy', 'Medium', 'Completed', '2024-10-12 16:00:00', 'None'),
(67, '2000456789012', 'Shabnam Ruma', 'Kishoreganj Sadar', 'Kishoreganj Sadar', 'Kishoreganj', 24.44200700, 90.68871900, '01755550004', 'shabnam.ruma@example.com', 'Female', 29, 6, 'Injured', 'Medium', 'In Progress', '2024-10-12 17:00:00', 'Food, Shelter'),
(68, '1996789012345', 'Sohail Ahmed', 'Sylhet Sadar', 'Sylhet Sadar', 'Sylhet', 24.89493000, 91.86870600, '01744440005', 'sohail.ahmed@example.com', 'Male', 22, 1, 'Healthy', 'Low', 'Pending', NULL, 'Water'),
(69, '2001567890123', 'Lamia Sultana', 'Pabna Sadar', 'Pabna Sadar', 'Pabna', 23.65356800, 89.63336800, '01733330006', 'lamia.sultana@example.com', 'Female', 36, 5, 'Critical', 'High', 'In Progress', '2024-10-12 18:30:00', 'Medical Assistance'),
(70, '1997890123456', 'Hafizur Rahman', 'Brahmanbaria Sadar', 'Brahmanbaria Sadar', 'Brahmanbaria', 23.95340000, 91.05705900, '01722220007', 'hafizur.rahman@example.com', 'Male', 40, 4, 'Injured', 'High', 'In Progress', '2024-10-12 19:00:00', 'Food, Shelter'),
(71, '1987654321098', 'Nilufa Khatun', 'Patuakhali Sadar', 'Patuakhali Sadar', 'Patuakhali', 22.34891100, 90.33608000, '01711110008', 'nilufa.khatun@example.com', 'Female', 50, 3, 'Healthy', 'Medium', 'Completed', '2024-10-12 20:00:00', 'None'),
(72, '2000987654321', 'Ahsanul Haque', 'Comilla Sadar', 'Comilla Sadar', 'Comilla', 23.45990500, 91.17636100, '01700000009', 'ahsanul.haque@example.com', 'Male', 33, 2, 'Critical', 'High', 'In Progress', '2024-10-12 21:30:00', 'Medical Assistance, Food');

-- --------------------------------------------------------

--
-- Table structure for table `waterlevels`
--

CREATE TABLE `waterlevels` (
  `water_level_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `water_level` decimal(10,2) NOT NULL,
  `danger_level` enum('Low','Medium','High') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `waterlevels`
--

INSERT INTO `waterlevels` (`water_level_id`, `date`, `water_level`, `danger_level`, `created_at`) VALUES
(1, '2023-01-01', 3.20, 'Medium', '2024-10-05 04:30:43'),
(2, '2023-01-02', 4.10, 'High', '2024-10-05 04:30:43'),
(3, '2023-01-03', 2.50, 'Low', '2024-10-05 04:30:43'),
(4, '2023-01-04', 5.00, 'High', '2024-10-05 04:30:43'),
(5, '2023-01-05', 1.80, 'Low', '2024-10-05 04:30:43'),
(6, '2023-01-06', 4.70, 'High', '2024-10-05 04:30:43'),
(7, '2023-01-07', 3.50, 'Medium', '2024-10-05 04:30:43'),
(8, '2023-01-08', 2.20, 'Low', '2024-10-05 04:30:43'),
(9, '2023-01-09', 5.50, 'High', '2024-10-05 04:30:43'),
(10, '2023-01-10', 1.20, 'Low', '2024-10-05 04:30:43');

-- --------------------------------------------------------

--
-- Table structure for table `weatherforecast`
--

CREATE TABLE `weatherforecast` (
  `forecast_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `temperature` decimal(5,2) DEFAULT NULL,
  `humidity` decimal(5,2) DEFAULT NULL,
  `precipitation` decimal(5,2) DEFAULT NULL,
  `wind_speed` decimal(5,2) DEFAULT NULL,
  `conditions` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `weatherforecast`
--

INSERT INTO `weatherforecast` (`forecast_id`, `date`, `temperature`, `humidity`, `precipitation`, `wind_speed`, `conditions`, `created_at`) VALUES
(1, '2023-01-01', 25.00, 60.50, 10.00, 15.00, 'Cloudy', '2024-10-05 04:30:43'),
(2, '2023-01-02', 27.00, 70.00, 12.00, 10.00, 'Rainy', '2024-10-05 04:30:43'),
(3, '2023-01-03', 24.50, 65.00, 5.00, 20.00, 'Sunny', '2024-10-05 04:30:43'),
(4, '2023-01-04', 22.00, 75.00, 8.00, 15.00, 'Rainy', '2024-10-05 04:30:43'),
(5, '2023-01-05', 26.00, 55.00, 7.00, 10.00, 'Cloudy', '2024-10-05 04:30:43'),
(6, '2023-01-06', 28.00, 80.00, 15.00, 12.00, 'Rainy', '2024-10-05 04:30:43'),
(7, '2023-01-07', 25.00, 60.50, 10.00, 15.00, 'Sunny', '2024-10-05 04:30:43'),
(8, '2023-01-08', 23.00, 70.00, 5.00, 18.00, 'Partly Cloudy', '2024-10-05 04:30:43'),
(9, '2023-01-09', 29.00, 85.00, 20.00, 8.00, 'Rainy', '2024-10-05 04:30:43'),
(10, '2023-01-10', 30.00, 90.00, 25.00, 5.00, 'Thunderstorm', '2024-10-05 04:30:43');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `deadbodies`
--
ALTER TABLE `deadbodies`
  ADD PRIMARY KEY (`body_id`),
  ADD KEY `submitted_hospital_id` (`submitted_hospital_id`);

--
-- Indexes for table `donations`
--
ALTER TABLE `donations`
  ADD PRIMARY KEY (`donation_id`);

--
-- Indexes for table `emergencyalerts`
--
ALTER TABLE `emergencyalerts`
  ADD PRIMARY KEY (`alert_id`),
  ADD KEY `victim_id` (`victim_id`);

--
-- Indexes for table `floods`
--
ALTER TABLE `floods`
  ADD PRIMARY KEY (`flood_id`);

--
-- Indexes for table `hospital`
--
ALTER TABLE `hospital`
  ADD PRIMARY KEY (`hospital_id`);

--
-- Indexes for table `hydrolevelmap`
--
ALTER TABLE `hydrolevelmap`
  ADD PRIMARY KEY (`map_id`);

--
-- Indexes for table `mobiletowers`
--
ALTER TABLE `mobiletowers`
  ADD PRIMARY KEY (`tower_id`);

--
-- Indexes for table `rescueassignments`
--
ALTER TABLE `rescueassignments`
  ADD PRIMARY KEY (`assignment_id`),
  ADD KEY `rescuer_id` (`rescuer_id`),
  ADD KEY `victim_id` (`victim_id`);

--
-- Indexes for table `rescuer`
--
ALTER TABLE `rescuer`
  ADD PRIMARY KEY (`rescuer_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `NID` (`NID`),
  ADD UNIQUE KEY `mobile` (`mobile`);

--
-- Indexes for table `shelters`
--
ALTER TABLE `shelters`
  ADD PRIMARY KEY (`shelter_id`);

--
-- Indexes for table `victim`
--
ALTER TABLE `victim`
  ADD PRIMARY KEY (`victim_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `NID` (`NID`),
  ADD KEY `mobile` (`mobile`);

--
-- Indexes for table `waterlevels`
--
ALTER TABLE `waterlevels`
  ADD PRIMARY KEY (`water_level_id`);

--
-- Indexes for table `weatherforecast`
--
ALTER TABLE `weatherforecast`
  ADD PRIMARY KEY (`forecast_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `deadbodies`
--
ALTER TABLE `deadbodies`
  MODIFY `body_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `donations`
--
ALTER TABLE `donations`
  MODIFY `donation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `emergencyalerts`
--
ALTER TABLE `emergencyalerts`
  MODIFY `alert_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `floods`
--
ALTER TABLE `floods`
  MODIFY `flood_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `hospital`
--
ALTER TABLE `hospital`
  MODIFY `hospital_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `hydrolevelmap`
--
ALTER TABLE `hydrolevelmap`
  MODIFY `map_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `mobiletowers`
--
ALTER TABLE `mobiletowers`
  MODIFY `tower_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `rescueassignments`
--
ALTER TABLE `rescueassignments`
  MODIFY `assignment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `rescuer`
--
ALTER TABLE `rescuer`
  MODIFY `rescuer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `shelters`
--
ALTER TABLE `shelters`
  MODIFY `shelter_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `victim`
--
ALTER TABLE `victim`
  MODIFY `victim_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `waterlevels`
--
ALTER TABLE `waterlevels`
  MODIFY `water_level_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `weatherforecast`
--
ALTER TABLE `weatherforecast`
  MODIFY `forecast_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `deadbodies`
--
ALTER TABLE `deadbodies`
  ADD CONSTRAINT `deadBodies_ibfk_1` FOREIGN KEY (`submitted_hospital_id`) REFERENCES `hospital` (`hospital_id`) ON DELETE CASCADE;

--
-- Constraints for table `emergencyalerts`
--
ALTER TABLE `emergencyalerts`
  ADD CONSTRAINT `emergencyalerts_ibfk_1` FOREIGN KEY (`victim_id`) REFERENCES `victim` (`victim_id`);

--
-- Constraints for table `rescueassignments`
--
ALTER TABLE `rescueassignments`
  ADD CONSTRAINT `rescueassignments_ibfk_1` FOREIGN KEY (`rescuer_id`) REFERENCES `rescuer` (`rescuer_id`),
  ADD CONSTRAINT `rescueassignments_ibfk_2` FOREIGN KEY (`victim_id`) REFERENCES `victim` (`victim_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
