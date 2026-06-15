CREATE TABLE IF NOT EXISTS users(
    user_id SERIAL PRIMARY KEY,
    full_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE,
    role VARCHAR(50),
    phone_number INT
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
    match_id INT REFERENCES matched(match_id),
    seat_number VARCHAR(50),
    payment_status VARCHAR(50),
    total_cost DECIMAL
);

INSERT INTO users(user_id, full_name, email, role, phone_number) VALUES
(1, 'Tanvir Rahman', 'tanvir@gmail.com', 'Football Fan', +8801711111111),
(2, 'Asif Haque', 'asif@gmail.com', 'Football Fan', +88017222222222), 
(3, 'Sajjad Rahman', 'sajjad@gmail.com', 'Ticket Manager', +8801333333333),
(4, 'Jannat Ara', 'jannat@gmail.com', 'Football Fan', NULL);


INSERT INTO matches(match_id, fixture, tournament_category, base_ticket_price, match_status) VALUES
(101, 'Real Madrid vs Barcelona', 'Champions League', 150, 'Available'),
(102, 'Man City vs Liverpool', 'Premier League', 120, 'Selling Fast'),
(103, 'Bayern Munich vs PSG', 'Champions League', 130, 'Available'), 
(104, 'AC Milan vs Inter Milan', 'Serie A', 90, 'Sold Out'),
(105, 'Juventus vs Rome', 'Serie A', 80, 'Available');

INSERT INTO bookings(booking_id, user_id, match_id, seat_number, payment_status, total_cost) VALUES
(501, 1, 101, 'A-12', 'Confirmed', 150),
(502, 1, 102, 'B-04', 'Confirmed', 120),
(502, 2, 101, 'A-13', 'Confirmed', 150),
(504, 2, 101, 'NUll', 'NULL', 150), 
(505, 3, 120, 'C-20', 'Pending', 120);
