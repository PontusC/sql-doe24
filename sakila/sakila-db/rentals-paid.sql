-- Returns all outstanding payments, empty if everything paid
select rental.rental_id, payment_id
    from rental
    left join payment on payment.rental_id = rental.rental_id
    -- Returns a set containing ALL rows in rental (left join) and if no matching rental_id found
    -- in payment that column gets marked as null
    where payment.rental_id is null;