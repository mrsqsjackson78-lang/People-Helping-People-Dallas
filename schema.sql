
CREATE TABLE users (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  email TEXT UNIQUE NOT NULL,
  password_hash TEXT NOT NULL,
  role TEXT CHECK(role IN ('HELPER','REQUESTER','ADMIN')) NOT NULL,
  flagged INTEGER DEFAULT 0
);

CREATE TABLE requests (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  requester_id INTEGER,
  title TEXT,
  description TEXT,
  status TEXT DEFAULT 'OPEN'
);

CREATE TABLE offers (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  request_id INTEGER,
  helper_id INTEGER,
  message TEXT,
  status TEXT DEFAULT 'PENDING'
);

CREATE TABLE messages (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  sender_id INTEGER,
  receiver_id INTEGER,
  encrypted_body TEXT
);
