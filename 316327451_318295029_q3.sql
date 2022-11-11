CREATE VIEW Legit_cities
AS
SELECT Cities.City, Cities.CountryCode
FROM (
SELECT City_With_More_Than_10_Devices.City
FROM (SELECT City
	  FROM Devices
	  GROUP BY City
	  HAVING COUNT(DISTINCT DeviceID) > 10) AS City_With_More_Than_10_Devices,
     Cities AS C,
     Devices AS D,
	 Bids AS B,
	 Imps AS I
WHERE City_With_More_Than_10_Devices.City = D.City AND
      D.DeviceID = B.DeviceID AND
      I.ImpID = B.ImpID
GROUP BY City_With_More_Than_10_Devices.City
HAVING AVG(I.BidFloor) > (select AVG(BidFloor) from Imps)) AS Legit_City, Cities
WHERE Cities.City = Legit_City.City



SELECT TMP.CountryCode, MAX(Imps.BidFloor) AS Max_Bid_Floor
FROM (SELECT Legit_cities.CountryCode
      FROM Legit_cities
      GROUP BY Legit_cities.CountryCode
      HAVING COUNT(DISTINCT Legit_cities.City) > 1) AS TMP,
    Cities, Devices, Bids, Imps
WHERE TMP.CountryCode = Cities.CountryCode AND
      Cities.City = Devices.City AND
      Devices.DeviceID = Bids.DeviceID AND
      Bids.ImpID = Imps.ImpID
GROUP BY TMP.CountryCode
ORDER BY TMP.CountryCode


drop view Legit_cities




