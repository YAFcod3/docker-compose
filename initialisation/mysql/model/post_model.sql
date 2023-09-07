CREATE TABLE IF NOT EXISTS travel_post (
    id                  	CHAR(36)                PRIMARY KEY,
	creation_date       	TIMESTAMP               NOT NULL,
	identity_id         	CHAR(36)				NOT NULL, 
	depart_country      	VARCHAR(30)            	NOT NULL,
	depart_state        	VARCHAR(50)            	NOT NULL,
	depart_county       	VARCHAR(50)            	NOT NULL,
	depart_city          	VARCHAR(50),
	depart_date       		TIMESTAMP              	NOT NULL,
	arrival_country      	VARCHAR(50)            	NOT NULL,
	arrival_state          	VARCHAR(50)            	NOT NULL,
	arrival_county          VARCHAR(50)            	NOT NULL,
	arrival_city          	VARCHAR(50),
	arrival_date       		TIMESTAMP               NOT NULL,
	limit_date       		TIMESTAMP               NOT NULL,
	full_kg 				DECIMAL(4,1)            NOT NULL,
	available_kg 			DECIMAL(4,1)            NOT NULL,
	kg_price 				DECIMAL(4,2)            NOT NULL,
	include_docs       		TINYINT(1)              NOT NULL DEFAULT 0,
	include_money        	TINYINT(1)              NOT NULL DEFAULT 0,
	include_phone        	TINYINT(1)              NOT NULL DEFAULT 0,
	include_others          VARCHAR(255),	
	CONSTRAINT fk_travel_post_identity_id FOREIGN KEY (identity_id) REFERENCES identity (id)
);

CREATE UNIQUE INDEX post_id_uindex ON travel_post (id);




