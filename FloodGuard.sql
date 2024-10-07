-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 07, 2024 at 01:28 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `FloodGuard`
--

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
(13, 'Jane Doe', 'Money', 12000, '2024-10-07 03:38:33', 'Donating to help shelter operations');

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
(1, '2023-01-01 00:00:00', '2023-01-05 23:59:59', 'High', 'Dhanmondi, Dhaka', 5.00, 'High', '2024-10-05 04:30:43', NULL),
(2, '2023-01-02 00:00:00', '2023-01-06 23:59:59', 'Medium', 'Gulshan, Dhaka', 4.00, 'Medium', '2024-10-05 04:30:43', NULL),
(3, '2023-01-03 00:00:00', '2023-01-07 23:59:59', 'Low', 'Chittagong', 3.00, 'Low', '2024-10-05 04:30:43', NULL),
(4, '2023-01-04 00:00:00', '2023-01-08 23:59:59', 'High', 'Rajshahi', 5.50, 'High', '2024-10-05 04:30:43', NULL),
(5, '2023-01-05 00:00:00', '2023-01-09 23:59:59', 'Medium', 'Barisal', 4.50, 'Medium', '2024-10-05 04:30:43', NULL),
(6, '2023-01-06 00:00:00', '2023-01-10 23:59:59', 'Severe', 'Sylhet', 6.00, 'High', '2024-10-05 04:30:43', NULL);

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
(1, 1, 1, '2022-06-05 14:00:00', 'Completed'),
(2, 2, 2, '2022-06-06 10:00:00', 'In Progress'),
(3, 3, 3, '2020-07-20 16:30:00', 'Pending'),
(4, 4, 4, '2021-08-02 12:15:00', 'Completed'),
(5, 5, 5, '2020-07-16 11:45:00', 'In Progress'),
(6, 6, 6, '2021-08-05 14:00:00', 'Completed'),
(7, 7, 7, '2019-09-03 15:30:00', 'Pending'),
(8, 8, 8, '2021-08-06 10:00:00', 'Completed'),
(9, 9, 9, '2019-10-05 18:00:00', 'Pending'),
(10, 10, 10, '2022-06-07 09:30:00', 'In Progress');

-- --------------------------------------------------------

--
-- Table structure for table `rescuer`
--

CREATE TABLE `rescuer` (
  `rescuer_id` int(11) NOT NULL,
  `NID` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address_area` varchar(100) NOT NULL,
  `address_upazila` varchar(100) NOT NULL,
  `address_district` varchar(100) NOT NULL,
  `latitude` decimal(10,8) NOT NULL,
  `longitude` decimal(11,8) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `organization` varchar(100) DEFAULT NULL,
  `gender` enum('Male','Female') NOT NULL,
  `age` int(11) NOT NULL,
  `availability_status` enum('Available','Unavailable') NOT NULL,
  `skills` text DEFAULT NULL,
  `resources_available` text DEFAULT NULL,
  `capacity` int(11) NOT NULL,
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
(2, 'Chittagong Relief Camp', 'Chittagong', 'Chittagong Sadar', 'Chittagong', 22.35690000, 91.78320000, 200, 80, 60, 30, 'Canned Food, Water', 'Antibiotics, Painkillers', 'Medical Team'),
(3, 'Rajshahi Shelter Home', 'Rajshahi', 'Rajshahi Sadar', 'Rajshahi', 24.37420000, 88.60700000, 100, 30, 40, 15, 'Dried Fish, Rice', 'Vitamins, Antiseptics', 'Volunteer Doctors'),
(4, 'Barisal Relief Center', 'Barisal', 'Barisal Sadar', 'Barisal', 22.70100000, 90.35350000, 120, 40, 50, 10, 'Fruits, Juices', 'Medicines, Band-aids', 'Nursing Staff'),
(5, 'Sylhet Community Shelter', 'Sylhet', 'Sylhet Sadar', 'Sylhet', 24.89440000, 91.88320000, 130, 45, 55, 20, 'Snacks, Cooked Meals', 'Cough Syrup, Bandages', 'Doctors'),
(6, 'Khulna Flood Relief Camp', 'Khulna', 'Khulna Sadar', 'Khulna', 22.84560000, 89.54030000, 140, 50, 50, 25, 'Instant Noodles, Snacks', 'Cold Medicine, Antibiotics', 'Medical Volunteers'),
(7, 'Shelter A', 'Area A', 'Upazila B', 'District C', 23.81033100, 90.41252100, 200, 50, 80, 30, 'Rice, Water, Lentils', 'Paracetamol, Antiseptics', 'First Aid, Ambulance'),
(8, 'Shelter A', 'Area A', 'Upazila B', 'District C', 23.81033100, 90.41252100, 200, 50, 80, 30, 'Rice, Water, Lentils', 'Paracetamol, Antiseptics', 'First Aid, Ambulance'),
(9, 'Shelter A', 'Area A', 'Upazila B', 'District C', 23.81033100, 90.41252100, 200, 50, 80, 30, 'Rice, Water, Lentils', 'Paracetamol, Antiseptics', 'First Aid, Ambulance'),
(10, 'Shelter z', 'Area A', 'Upazila B', 'District C', 23.81033100, 90.41252100, 200, 50, 80, 30, 'Rice, Water, Lentils', 'Paracetamol, Antiseptics', 'First Aid, Ambulance'),
(11, 'Shelter z', 'Area A', 'Upazila B', 'District C', 23.81033100, 90.41252100, 2000, 600, 900, 30, 'Rice, Water, Lentils', 'Paracetamol, Antiseptics', 'First Aid, Ambulance');

-- --------------------------------------------------------

--
-- Table structure for table `victim`
--

CREATE TABLE `victim` (
  `victim_id` int(11) NOT NULL,
  `NID` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address_area` varchar(100) NOT NULL,
  `address_upazila` varchar(100) NOT NULL,
  `address_district` varchar(100) NOT NULL,
  `latitude` decimal(10,8) NOT NULL,
  `longitude` decimal(11,8) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `gender` enum('Male','Female') NOT NULL,
  `age` int(11) NOT NULL,
  `number_of_family_members` int(11) NOT NULL,
  `health_status` varchar(100) NOT NULL,
  `danger_level` enum('Low','Medium','High') NOT NULL,
  `rescue_status` enum('Pending','In Progress','Completed') NOT NULL,
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
(21, '121212122453243113', 'John Doe', 'Area 51', 'Upazila ABC', 'District XYZ', 23.12345678, 90.12345678, '01712345998', 'johndoe@example.com', 'Male', 35, 4, 'Good', 'High', 'In Progress', NULL, NULL);

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
  ADD UNIQUE KEY `NID` (`NID`),
  ADD UNIQUE KEY `mobile` (`mobile`),
  ADD UNIQUE KEY `email` (`email`);

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
  ADD UNIQUE KEY `NID` (`NID`),
  ADD UNIQUE KEY `mobile` (`mobile`),
  ADD UNIQUE KEY `email` (`email`);

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
-- AUTO_INCREMENT for table `donations`
--
ALTER TABLE `donations`
  MODIFY `donation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `emergencyalerts`
--
ALTER TABLE `emergencyalerts`
  MODIFY `alert_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `floods`
--
ALTER TABLE `floods`
  MODIFY `flood_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
  MODIFY `assignment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `rescuer`
--
ALTER TABLE `rescuer`
  MODIFY `rescuer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `shelters`
--
ALTER TABLE `shelters`
  MODIFY `shelter_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `victim`
--
ALTER TABLE `victim`
  MODIFY `victim_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

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
-- Constraints for table `emergencyalerts`
--
ALTER TABLE `emergencyalerts`
  ADD CONSTRAINT `emergencyalerts_ibfk_1` FOREIGN KEY (`victim_id`) REFERENCES `victim` (`victim_id`) ON DELETE CASCADE;

--
-- Constraints for table `rescueassignments`
--
ALTER TABLE `rescueassignments`
  ADD CONSTRAINT `rescueassignments_ibfk_1` FOREIGN KEY (`rescuer_id`) REFERENCES `rescuer` (`rescuer_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rescueassignments_ibfk_2` FOREIGN KEY (`victim_id`) REFERENCES `victim` (`victim_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
