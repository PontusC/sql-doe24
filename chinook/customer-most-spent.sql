-- Returns the customer from Customers that has spent the most money
select FirstName, LastName
    from Customer 
    join Invoice using (CustomerId) 
    group by CustomerId 
    order by sum(Total) desc
    limit 1;