INSERT INTO bookmarks (url)
VALUES('http://www.Netflix.com');

INSERT INTO bookmarks (url)
VALUES('http://www.BBC.com');

INSERT INTO bookmarks (url)
VALUES('http://www.MAKERSACADEMY.com');

INSERT INTO bookmarks (url)
VALUES('http://twitter.com');

INSERT INTO bookmarks (url)
VALUES('http://askjeevs.com');

INSERT INTO bookmarks (url)
VALUES('http://www.google.com');

DELETE FROM bookmarks WHERE id = 2;

UPDATE bookmarks SET url = 'http://www.makersacademy.com' WHERE id = 3;
