SELECT DISTINCT 'Yes' AS unused_offer_exists
FROM offer 
WHERE offer.offer_start BETWEEN '2020-01-01' AND '2020-12-31'
AND offer.offer_id NOT IN (
  SELECT reservation.offer_id
  FROM reservation 
)
UNION
SELECT DISTINCT 'No'
FROM offer
WHERE NOT EXISTS (
  SELECT 1
  FROM offer
  WHERE offer.offer_start BETWEEN '2020-01-01' AND '2020-12-31'
  AND offer.offer_id NOT IN (
    SELECT reservation.offer_id
    FROM reservation
  )
);
