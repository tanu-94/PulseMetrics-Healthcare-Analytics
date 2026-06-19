-- Create the database context workspace
CREATE DATABASE IF NOT EXISTS PulseMetricsDB;
USE PulseMetricsDB;

-- 1. Patients Table (Demographics and Acquisition)
CREATE TABLE patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_name VARCHAR(100) NOT NULL,
    country VARCHAR(50) DEFAULT 'India',
    acquisition_channel VARCHAR(50) NOT NULL
);

-- 2. Pharmacy Inventory Table (Operations and Financial Data)
CREATE TABLE pharmacy_inventory (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    medicine_name VARCHAR(100) NOT NULL,
    stock_quantity INT NOT NULL,
    price_per_unit DECIMAL(10, 2) NOT NULL,
    CONSTRAINT check_stock CHECK (stock_quantity >= 0)
);
