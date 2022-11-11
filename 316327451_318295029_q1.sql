select CountryCode  from Cities
where City > 'WOW'
group by CountryCode
having Count(CountryCode) > 3