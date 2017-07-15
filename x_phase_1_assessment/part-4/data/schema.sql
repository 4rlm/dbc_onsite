PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;

CREATE TABLE publishers (
  id INTEGER PRIMARY KEY,
  name VARCHAR NOT NULL UNIQUE,
  created_at DATETIME NOT NULL,
  updated_at DATETIME NOT NULL
);

INSERT INTO "publishers" VALUES(1,'Pragmatic Programmers', DATETIME('now'), DATETIME('now'));
INSERT INTO "publishers" VALUES(2,'Addison-Wesley', DATETIME('now'), DATETIME('now'));
INSERT INTO "publishers" VALUES(3,'Big Nerd Ranch', DATETIME('now'), DATETIME('now'));
INSERT INTO "publishers" VALUES(4,'O''Reilly', DATETIME('now'), DATETIME('now'));
INSERT INTO "publishers" VALUES(5,'Wiley', DATETIME('now'), DATETIME('now'));
INSERT INTO "publishers" VALUES(6,'Manning Publications', DATETIME('now'), DATETIME('now'));
INSERT INTO "publishers" VALUES(7,'MIT Press', DATETIME('now'), DATETIME('now'));


CREATE TABLE authors (
  id INTEGER PRIMARY KEY,
  name VARCHAR NOT NULL UNIQUE,
  created_at DATETIME NOT NULL,
  updated_at DATETIME NOT NULL
);

INSERT INTO "authors" VALUES(1,'Noel Rappin', DATETIME('now'), DATETIME('now'));
INSERT INTO "authors" VALUES(2,'Paolo Perrotta', DATETIME('now'), DATETIME('now'));
INSERT INTO "authors" VALUES(3,'Dave Thomas', DATETIME('now'), DATETIME('now'));
INSERT INTO "authors" VALUES(4,'Sandi Metz', DATETIME('now'), DATETIME('now'));
INSERT INTO "authors" VALUES(5,'Obie Fernandez', DATETIME('now'), DATETIME('now'));
INSERT INTO "authors" VALUES(6,'Aaron Hillegass', DATETIME('now'), DATETIME('now'));
INSERT INTO "authors" VALUES(7,'Douglas Crockford', DATETIME('now'), DATETIME('now'));
INSERT INTO "authors" VALUES(8,'David Flanagan', DATETIME('now'), DATETIME('now'));
INSERT INTO "authors" VALUES(9,'Michael Fogus', DATETIME('now'), DATETIME('now'));
INSERT INTO "authors" VALUES(10,'Jonathan Penn', DATETIME('now'), DATETIME('now'));
INSERT INTO "authors" VALUES(11,'Russ Olsen', DATETIME('now'), DATETIME('now'));
INSERT INTO "authors" VALUES(12,'Jon Duckett', DATETIME('now'), DATETIME('now'));
INSERT INTO "authors" VALUES(13,'David Black', DATETIME('now'), DATETIME('now'));
INSERT INTO "authors" VALUES(14,'Rod Stephens', DATETIME('now'), DATETIME('now'));
INSERT INTO "authors" VALUES(15,'Thomas Corman', DATETIME('now'), DATETIME('now'));
INSERT INTO "authors" VALUES(16,'Barrett Clark', DATETIME('now'), DATETIME('now'));


CREATE TABLE books (
  id INTEGER PRIMARY KEY,
  title VARCHAR NOT NULL,
  author_id INTEGER NOT NULL,
  publisher_id INTEGER NOT NULL,
  created_at DATETIME NOT NULL,
  updated_at DATETIME NOT NULL,
  FOREIGN KEY(author_id) REFERENCES author(id),
  FOREIGN KEY(publisher_id) REFERENCES publisher(id)
);

INSERT INTO "books" VALUES(1,'Rails 4 Test Prescriptions',1,1, DATETIME('now'), DATETIME('now'));
INSERT INTO "books" VALUES(2,'Metaprogramming Ruby 2',2,1, DATETIME('now'), DATETIME('now'));
INSERT INTO "books" VALUES(3,'Programming Ruby 1.9 & 2.0',3,1, DATETIME('now'), DATETIME('now'));
INSERT INTO "books" VALUES(4,'Pragmatic Programmer',3,2, DATETIME('now'), DATETIME('now'));
INSERT INTO "books" VALUES(5,'Practical Object Oriented Design in Ruby',4,2, DATETIME('now'), DATETIME('now'));
INSERT INTO "books" VALUES(6,'The Rails 4 Way',5,2, DATETIME('now'), DATETIME('now'));
INSERT INTO "books" VALUES(7,'Objective-C Programming',6,3, DATETIME('now'), DATETIME('now'));
INSERT INTO "books" VALUES(8,'iOS Programming',6,3, DATETIME('now'), DATETIME('now'));
INSERT INTO "books" VALUES(9,'JavaScript: The Good Parts',7,4, DATETIME('now'), DATETIME('now'));
INSERT INTO "books" VALUES(10,'JavaScript: The Definitive Guide',8,4, DATETIME('now'), DATETIME('now'));
INSERT INTO "books" VALUES(11,'Functional JavaScript',9,4, DATETIME('now'), DATETIME('now'));
INSERT INTO "books" VALUES(12,'Build iOS Games with SpriteKit',10,1, DATETIME('now'), DATETIME('now'));
INSERT INTO "books" VALUES(13,'Test iOS Apps with UI Automation',10,1, DATETIME('now'), DATETIME('now'));
INSERT INTO "books" VALUES(14,'Design Patterns in Ruby',11,2, DATETIME('now'), DATETIME('now'));
INSERT INTO "books" VALUES(15,'Eloquent Ruby',11,2, DATETIME('now'), DATETIME('now'));
INSERT INTO "books" VALUES(16,'Web Design with HTML & CSS',12,5, DATETIME('now'), DATETIME('now'));
INSERT INTO "books" VALUES(17,'JavaScript and jQuery',12,5, DATETIME('now'), DATETIME('now'));
INSERT INTO "books" VALUES(18,'Well-Grounded Rubyist',13,6, DATETIME('now'), DATETIME('now'));
INSERT INTO "books" VALUES(19,'Essential Algorithms',14,5, DATETIME('now'), DATETIME('now'));
INSERT INTO "books" VALUES(20,'Introduction to Algorithms',15,7, DATETIME('now'), DATETIME('now'));
INSERT INTO "books" VALUES(21,'Data Visualization Toolkit',16,2, DATETIME('now'), DATETIME('now'));
COMMIT;
