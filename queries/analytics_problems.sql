USE PulseMetricsDB;

-- ====================================================================
-- INSIGHT 1: MARKETING & PATIENT ACQUISITION ANALYSIS (Joins & Ranking)
-- Goal: Rank our patient acquisition channels to find our best performing
-- marketing avenues (like your experience in social media marketing!).
-- ====================================================================

SELECT 
    acquisition_channel,
    COUNT(patient_id) AS total_patients,
    ROW_NUMBER() OVER (ORDER BY COUNT(patient_id) DESC) AS channel_rank [cite: 36]
FROM patients
GROUP BY acquisition_channel;


-- ====================================================================
-- INSIGHT 2: PHARMACY INVENTORY & VALUE CRUNCH (Window Functions & Math)
-- Goal: Calculate the total value locked in each medicine, cumulative 
-- stock values, and flag critical out-of-stock items.
-- ====================================================================

SELECT 
    medicine_name,
    stock_quantity,
    price_per_unit[cite: 46],
    -- Compute cell arithmetic realism for item total value
    (stock_quantity * price_per_unit) AS inventory_value,
    -- Running accumulator total across the whole pharmacy cupboard
    SUM(stock_quantity * price_per_unit) OVER(ORDER BY medicine_name) AS running_total_value[cite: 32],
    -- Boolean shorthand mapping logic to flag empty shelves
    CASE 
        WHEN stock_quantity = 0 THEN 'OUT OF STOCK - REORDER' [cite: 47]
        ELSE 'AVAILABLE'
    END AS stock_status
FROM pharmacy_inventory;
