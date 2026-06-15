CREATE TABLE IF NOT EXISTS users(
    user_id SERIAL PRIMARY KEY,
    full_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE,
    role VARCHAR(50) NOT NULL,
    phone_number INT
)

CREATE TABLE IF NOT EXISTS matches(
    match_id SERIAL PRIMARY KEY,
    fixture VARCHAR(100),
    tournament_category VARCHAR(100),
    base_ticket_price INT,
    match_status VARCHAR(50)
)


CREATE TABLE IF NOT EXISTS bookings(
    booking_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    match_id INT REFERENCES matched(match_id),
    seat_number VARCHAR(50),
    payment_status VARCHAR(50),
    total_cost DECIMAL
)

INSERT INTO users(full_name, email, role, phone_number) VALUES
('Tanvir Rahman', 'tanvir@gmail.com', 'Football Fan', +8801711111111),
('Asif Haque', 'asif@gmail.com', 'Football Fan', +88017222222222), 
('Sajjad Rahman', 'sajjad@gmail.com', 'Ticket Manager', +8801333333333),
('Jannat Ara', 'jannat@gmail.com', 'Football Fan', NULL);