USE PulseMetricsDB;

-- Disable safe updates to allow broad mutations if needed later
SET SQL_SAFE_UPDATES = 0;

-- 1. Insert Mock Patient Records
INSERT INTO patients (patient_name, country, acquisition_channel) VALUES
('Aarav Sharma', 'India', 'Social Media - Instagram'),
('Aditi Rao', 'India', 'Website Referral'),
('Rahul Nair', 'India', 'Direct Walk-in'),
('Priya Patel', 'India', 'Social Media - Facebook'),
('Vikram Singh', 'India', 'Website Referral');

-- 2. Insert Mock Pharmacy Records
INSERT INTO pharmacy_inventory (medicine_name, stock_quantity, price_per_unit) VALUES
('Paracetamol 650mg', 500, 15.50),
('Amoxicillin 500mg', 120, 85.00),
('Metformin 500mg', 300, 22.00),
('Atorvastatin 10mg', 0, 45.00), -- Out of stock example
('Pantoprazole 40mg', 250, 35.75);
