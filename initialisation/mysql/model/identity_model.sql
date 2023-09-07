CREATE TABLE IF NOT EXISTS identity (
    id                  CHAR(36)                PRIMARY KEY,
    first_name          VARCHAR(30)             NOT NULL,
    last_name           VARCHAR(30)             NOT NULL,
    email               VARCHAR(40)             NOT NULL,
    password_hash       VARCHAR(500),
    token               VARCHAR(500),
    macaroon_id         VARCHAR(255),
    macaroon_secret     VARCHAR(255),
    phone_number        VARCHAR(15),
    nickname            VARCHAR(30)             NOT NULL,
    active              TINYINT(1)              NOT NULL DEFAULT 0,
	id_verified         TINYINT(1)              NOT NULL DEFAULT 0,
    creation_date       TIMESTAMP               NOT NULL,
    activation_date     TIMESTAMP , 
    verification_date   TIMESTAMP , 
    language            CHAR(2)                 NOT NULL DEFAULT 'ES',
    profilePic          VARCHAR(255)            DEFAULT NULL,
    bannerPic           VARCHAR(255)            DEFAULT NULL,
    sender_type         VARCHAR(10)             NOT NULL DEFAULT 'PAYING',
    traveller_type      VARCHAR(10)             NOT NULL DEFAULT 'PAYING'
);

CREATE UNIQUE INDEX user_id_uindex ON identity (id);
CREATE UNIQUE INDEX user_email_uindex ON identity (email);
CREATE UNIQUE INDEX user_macaroon_id_uindex ON identity (macaroon_id);