
# Flood Guard

## 🌊 Project Overview

Bangladesh is a country highly vulnerable to floods, facing mild to severe floods every year that lead to significant loss of life and financial damage. The **Flood Guard** project aims to develop a website that can forecast floods in advance, helping to mitigate these losses.

The website will assist flood victims in finding safe shelters and enable rescuers to provide them with essential support, such as food and medical supplies. It will feature a navigation system, allowing both victims and rescuers to easily find the quickest route to the nearest flood shelter.

We will use location-based forecasting to strive for the highest accuracy, ensuring the maximum number of lives are saved. Additionally, the site will integrate a mapping system to display the status of mobile towers near the user’s location. A prediction system will also help rescuers estimate the necessary amount of food and medicine.

## 📊 Database Schema

The project's database schema is designed to store and manage the necessary data for effective flood management and support. 

![Flood Guard Schema](https://github.com/MisbahKhan0009/Flood-Guard-Server/blob/main/Flood%20Guard%20Schema.png?raw=true)

### Database Tables

The following tables are included in the database schema:

- **Emergency Alerts**: Stores alerts regarding victims and emergency situations.
- **Mobile Towers**: Contains information about mobile tower locations and statuses.
- **Donations**: Tracks donations received, including donor details and types of donations.
- **Water Levels**: Monitors water levels and danger levels in various regions.
- **Dead Bodies**: Records details of found deceased individuals.
- **Victims**: Contains information about flood victims, including personal details and health status.
- **Rescue Assignments**: Tracks assignments of rescuers to specific victims.
- **Rescuers**: Stores information about rescuers, their skills, and availability.
- **Weather Forecast**: Records weather conditions and forecasts relevant to flood prediction.
- **Hospitals**: Contains details about hospitals, including bed availability.
- **Floods**: Monitors flood occurrences, their severity, and affected areas.
- **Shelters**: Tracks shelter locations and their capacity to accommodate victims.
- **Hydro Level Map**: Records hydro level data for different regions.

## 🛠️ Technologies Used

- **Backend**: Express.js
- **Database**: MySQL
- **Authentication**: Firebase
- **File Management**: Cloudinary

## 📚 API Documentation

For API usage and examples, please refer to the [API documentation](https://machine-minds.postman.co/workspace/Machine-Minds-Workspace~68143e5b-1506-40b7-aafc-28800ed0b3da/collection/34865508-448d07b8-ed46-49b1-b76b-6c0b43e72e94?action=share&creator=34865508).

## ⚙️ Prerequisites

Make sure you have the following installed on your development machine:

- Node.js (version 16 or above)
- npm (package manager)

## 📜 Available Scripts

- `npm start` - Starts the development server.

## 👤 Contributors

Team **Machine Minds**

- [Misbah Khan](https://github.com/MisbahKhan0009)
- [Sabbir Hossain](https://github.com/Sabbir-Hossain22)
- Aritra Islam Saswato

