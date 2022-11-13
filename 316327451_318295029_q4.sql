select d.Make, avg(i.BidFloor) as AvgBidFloor
from Devices d join Bids b on d.DeviceID = b.DeviceID
join Imps i on b.ImpID = i.ImpID
group by d.Make
order by AvgBidFloor desc
