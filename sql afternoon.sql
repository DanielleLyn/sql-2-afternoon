joins
1. 
select * 
from invoice 
join invoiceline ON invoiceline.invoiceid = invoice.invoiceid
where invoiceline.unitprice > 0.99;

2. 
select InvoiceDate, FirstName, Lastname, Total
from invoice 
join Customer on customer.CustomerId = invoice.CustomerId

3.
 select customer.FirstName, customer.LastName
 from Customer 
 join employee on employee.employeeid = customer.supportrepid
 
4.
select album.title, artist.name
 from album
 join artist on artist.artistid = album.artistid

 5.
  select playlisttrack.trackid
 from playlisttrack
 join playlist on playlist.playlistid = playlisttrack.playlistid
 where playlist.name = 'Music';

 6.
  select track.name 
 from track
 join playlisttrack on playlisttrack.trackid = track.trackid
 where playlistid = 5
 
 7.
 select track.name, playlist.name 
 from track
 join playlisttrack on playlisttrack.trackid=track.trackid
 join playlist on playlist.playlistid = playlisttrack.playlistid

8. 
 select track.name, album.title
 from track
 join album on album.albumid = track.albumid
 join genre on genre.genreid = track.genreid
 where genre.name = 'Alternative';

nested
1.
select * 
from invoice
where invoiceid in (select invoiceid from invoiceline where unitprice >.99);

2.
select *
from playlisttrack
where playlistid in (select playlistid from playlist where name = 'Music');

3.
 select name
 from track
 where trackid in (select trackid from playlisttrack where playlistid=5);

4.
select * 
 from track
 where genreid in (select genreid from Genre where name = 'Comedy');

5.
select * 
 from track 
 where albumid in (select albumid from album where title = 'Fireball');

6. 
select *
 from track
 where albumid in 
 (select albumid from album where artistid in 
(select artistid from artist where name = 'Queen'))


updating rows 

1.
update Customer
set Fax = null 
where Fax is not null;

2. 
update Customer
set Company = "self"
where Company is null; 

3. 
update Customer
set lastName = "Thompson"
where firstName = "Julia" and lastName = "Barnett";

4.
update Customer
set supportrepid = 4
where email = "luisrojas@yahoo.cl";

5.
update Track
set Composer = "the darkness around us" 
where Genreid = ( select Genreid from Genre where Name = "Metal")
and Composer is null;


Group By

1.
select Count(*), genre.name
from track
join genre on track.genreid = genre.genreid
group by genre.name;

2.
select Count(*), genre.name
from track
join genre on genre.genreid = track.genreid
where genre.name = 'Pop' or genre.name = 'Rock'
group by genre.name;

3.
select artist.name, count(*)
from artist 
join album on artist.artistid = album.artistid
group by album.artistid; 


use distinct 

1.
select distinct composer 
from track;

2.
select distinct billingpostalcode 
from invoice;

3.
select distinct company
from customer;


delete rows

1.
delete 
from practice_delete 
where type="bronze";

2.
delete 
from practice_delete
where type = "silver";

3.
delete 
from practice_delete
where value =150;


ecommerce 

used dummy data from class

1.
select products.name
from products
join line_items on line_items.product_id = products.id
where order_id = 1;


2.
select * from orders;

3.
select sum(price) 
from products
join line_items on line_items.product_id = products.id
where line_items.order_id  = 2;

4. 
alter table orders
add column user_id integer 
references users(id);

5.
Update the Orders table to link a user to each order.

update orders
set user_id = 2
where id = 1;

update orders
set user_id = 3
where id = 2;

update orders 
set user_id = 2
where id = 3;

6.
select * 
from orders
where user_id = 3;

7.
select count(*), orders.id 
from orders
join users on users.id = orders.user_id
group by orders.id
