CREATE TABLE IF NOT EXISTS users(
    user_id SERIAL PRIMARY KEY,
    full_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE,
    role VARCHAR(50),
    phone_number VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS matches(
    match_id SERIAL PRIMARY KEY,
    fixture VARCHAR(100),
    tournament_category VARCHAR(100),
    base_ticket_price INT,
    match_status VARCHAR(50)
);


CREATE TABLE IF NOT EXISTS bookings(
    booking_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    match_id INT REFERENCES matches(match_id),
    seat_number VARCHAR(50),
    payment_status VARCHAR(50),
    total_cost DECIMAL
);

INSERT INTO users(user_id, full_name, email, role, phone_number) VALUES
(1, 'Tanvir Rahman', 'tanvir@gmail.com', 'Football Fan', '+88017111111'),
(2, 'Asif Haque', 'asif@gmail.com', 'Football Fan', '+880172222222'), 
(3, 'Sajjad Rahman', 'sajjad@gmail.com', 'Ticket Manager', '+8801333333'),
(4, 'Jannat Ara', 'jannat@gmail.com', 'Football Fan', NULL);


INSERT INTO matches(match_id, fixture, tournament_category, base_ticket_price, match_status) VALUES
(101, 'Real Madrid vs Barcelona', 'Champions League', 150.00, 'Available'),
(102, 'Man City vs Liverpool', 'Premier League', 120.00, 'Selling Fast'),
(103, 'Bayern Munich vs PSG', 'Champions League', 130.00, 'Available'), 
(104, 'AC Milan vs Inter Milan', 'Serie A', 90.00, 'Sold Out'),
(105, 'Juventus vs Rome', 'Serie A', 80.00, 'Available');

INSERT INTO bookings(booking_id, user_id, match_id, seat_number, payment_status, total_cost) VALUES
(501, 1, 101, 'A-12', 'Confirmed', 150.00),
(502, 1, 102, 'B-04', 'Confirmed', 120.00),
(503, 2, 101, 'A-13', 'Confirmed', 150.00),
(504, 2, 101, 'NUll', 'NULL', 150.00), 
(505, 3, 102, 'C-20', 'Pending', 120.00);


//Query-1
SELECT match_id, fixture, base_ticket_price FROM matches
WHERE tournament_category = 'Champions League' AND match_status = 'Available';

//Query-2
SELECT user_id, full_name, email FROM users
WHERE full_name ILIKE 'Tanvir%' OR full_name ILIKE '%Haque%';

//Query-3
SELECT booking_id, user_id, match_id,
COALESCE (payment_status, 'Action Required') AS systematic_status
FROM bookings 
WHERE payment_status IS NULL;


//Query-4
SELECT booking_id, full_name, fixture, total_cost FROM bookings
INNER JOIN users ON bookings.user_id = users.user_id
INNER JOIN matches ON bookings.match_id = matches.match_id;