DROP TABLE IF EXISTS ref_type_value;
DROP TABLE IF EXISTS ref_type;

CREATE TABLE ref_type
(
    ref_type_id BIGSERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(128) NOT NULL UNIQUE,
    created TIMESTAMP NOT NULL DEFAULT NOW(),
    created_by CHAR(6) NOT NULL, --SSA six-digit pin
    last_modified TIMESTAMP NOT NULL DEFAULT NOW(),
    last_modified_by CHAR(6) NOT NULL, --SSA six-digit pin
    FOREIGN KEY (created_by) REFERENCES account(account_pin), --joins to account table
    FOREIGN KEY (last_modified_by) REFERENCES account(account_pin) --joins to account table
);

CREATE TABLE ref_type_value
(
    ref_type_value_id BIGSERIAL NOT NULL PRIMARY KEY,
    ref_type_id BIGINT NOT NULL,
    text VARCHAR(128) NOT NULL,
    ordinal INT,
    act_start_date TIMESTAMP NOT NULL DEFAULT NOW(),
    act_end_date TIMESTAMP CHECK (act_end_date IS NULL OR act_end_date >= act_start_date),
    created TIMESTAMP NOT NULL DEFAULT NOW(),
    created_by CHAR(6) NOT NULL, --SSA six-digit pin
    last_modified TIMESTAMP NOT NULL DEFAULT NOW(),
    last_modified_by CHAR(6) NOT NULL, --SSA six-digit pin,
    FOREIGN KEY (ref_type_id) REFERENCES ref_type (ref_type_id),
    FOREIGN KEY (created_by) REFERENCES account(account_pin), --joins to account table
    FOREIGN KEY (last_modified_by) REFERENCES account(account_pin) --joins to account table
);

CREATE UNIQUE INDEX ref_type_value_idx
ON ref_type_value (ref_type_id, text);