select avg(price) as avg_price_,brandName from Sale group by brandName
select * from Sale where price>6900000
select * from vehicleRecord where region='Germany' and engineCapacity>5.5
select distinct vehicleRecord.carName from vehicleRecord,Exporter where Exporter.carMilage<5000 and vehicleRecord.vin=Exporter.vin
select * from vehicleRecord where yearr>2017
select MIN(price) as min_price from Sale
select Max(price) as max_price from Sale
select Sum(price) as Total_sale from Sale
select count(*) as new_car_count from vehicleRecord where yearr>2017
select brandName,carName from vehicleRecord where region='Germany' and pessengerCapacity between 4 and 5


select carType from vehicleRecord

