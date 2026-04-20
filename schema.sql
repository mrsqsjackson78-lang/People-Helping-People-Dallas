
CREATE TABLE users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    email TEXT UNIQUE,
    password_hash TEXT,
    role TEXT,
    flagged INTEGER DEFAULT 0
);

CREATE TABLE help_requests (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER,
    description TEXT,
    status TEXT DEFAULT 'OPEN'
);

CREATE TABLE audits (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    action TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
