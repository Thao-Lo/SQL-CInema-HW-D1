# 1 Show film name ONLY which has screening
SELECT film.name
FROM film
JOIN screening 
	ON film.id = screening.film_id 
GROUP BY film.name;
 
 # 2 Show Room name with all sear row and seat column of 'Room 2'
SELECT 
room.name, 
seat.row, seat.number
FROM room 
JOIN seat 
	ON room.id = seat.room_id 
WHERE room.name = 'Room 2';

# 3 Show all Screening information including film name, room name, time of fil 'Tom & Jerry' 
SELECT 
screening.id, screening.film_id, screening.room_id,
room.name,
film.name
FROM screening
JOIN film
	ON screening.film_id = film.id 
JOIN room 
	ON screening.room_id = room.id
WHERE film.name = 'Tom&Jerry';


# 4 Show what seat that customer "Dung Nguyen ' booked
SELECT 
customer.first_name, customer.last_name, seat.number, seat.row
FROM customer
JOIN booking 
	ON booking.customer_id = customer.id
JOIN reserved_seat
	ON reserved_seat.booking_id = booking.id
JOIN seat
	ON seat.id = reserved_seat.seat_id
WHERE customer.first_name = 'Dung' AND customer.last_name = 'Nguyen';

# 5 How many film that showed in 24/5/2022
SELECT 
COUNT(DISTINCT(film_id)) AS NumberOfFilms
FROM screening
WHERE DATE(start_time) = '2022-05-24';

# 6 What is the maximum length and minimum length of all film
SELECT
MAX(length_min) AS MaxLength,
MIN(length_min) AS MinLength
FROM film; 

# 7 How many seat in Room 7
SELECT COUNT(seat.id) AS SeatsInRoom7
FROM seat
JOIN room 
	ON seat.room_id = room.id
WHERE room.name = 'Room 7';

# 8 Total seat are booked of film "Tome&Jerry"
SELECT COUNT(reserved_seat.seat_id) AS SeatBookedTomJerry
FROM reserved_seat
JOIN booking	
	ON reserved_seat.booking_id = booking.id
JOIN screening
	ON screening.id = booking.screening_id
JOIN film
	ON film.id = screening.film_id
WHERE film.name = 'Tom&Jerry'

    











