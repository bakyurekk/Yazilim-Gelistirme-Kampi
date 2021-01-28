
--Her bir üründen toplamda ne kadar para kazandığımızı bulunuz.

--İpucu : Group by kullanılacak

--İpucu : Products, Orders, Order Details tabloları join edilecek.

--İpucu : Sum kullanılacak.

--Sonuç aşağıdaki formatta olmalıdır.

--Ürün Adı, Kazanılan Toplam Miktar



--Not : Kazanılan tutar toplamı Order Details tablosunda unitPrice ve quantity alanlarının çarpımından beslenecek.


select Products.ProductName UrunAdi, 
sum([Order Details].UnitPrice * [Order Details].Quantity) AS KazanılanToplamMiktar,
COUNT([Order Details].OrderID) AS ToplamSiparis
from Products 
left join [Order Details] on Products.ProductID = [Order Details].ProductID
left join Orders on Orders.OrderID  = [Order Details].OrderID
group by Products.ProductName
order by sum([Order Details].UnitPrice * [Order Details].Quantity) desc

