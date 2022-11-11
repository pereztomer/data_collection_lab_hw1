select Make , COUNT(DISTINCT DeviceID) as number_of_devices
from Devices
where city in (select City
               from Cities
               where CountryCode = 'USA')
and Make IS NOT NULL
group by Make
having COUNT(DISTINCT DeviceID) > 100
   and count(distinct Model) > 20
order by number_of_devices DESC