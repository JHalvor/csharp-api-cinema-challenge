DROP TABLE IF EXISTS Movie CASCADE;
DROP TABLE IF EXISTS Customer CASCADE;
DROP TABLE IF EXISTS Screening CASCADE;
DROP TABLE IF EXISTS Ticket CASCADE;

CREATE TABLE IF NOT EXISTS Customer(
    id SERIAL PRIMARY KEY,
    createdAt TIMESTAMP NOT NULL,
    updatedAt TIMESTAMP NOT NULL,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS Movie(
    id SERIAL PRIMARY KEY,
    createdAt TIMESTAMP NOT NULL,
    updatedAt TIMESTAMP NOT NULL,
    title VARCHAR(255) NOT NULL,
    rating VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
    runtimeMins INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS Screening(
    id SERIAL PRIMARY KEY,
    createdAt TIMESTAMP NOT NULL,
    updatedAt TIMESTAMP NOT NULL,
    screenNumber INTEGER NOT NULL,
    capacity INTEGER NOT NULL,
    startsAt TIMESTAMP NOT NULL,
    movieFk INTEGER NOT NULL,
    FOREIGN KEY (movieFk) REFERENCES Movie(id)
);

CREATE TABLE IF NOT EXISTS Ticket(
    id SERIAL PRIMARY KEY,
    createdAt TIMESTAMP NOT NULL,
    updatedAt TIMESTAMP NOT NULL,
    numSeats INTEGER NOT NULL,
    customerFk INTEGER NOT NULL,
    FOREIGN KEY (customerFk) REFERENCES Customer(id),
    screeningFk INTEGER NOT NULL,
    FOREIGN KEY (screeningFk) REFERENCES Screening(id)
);