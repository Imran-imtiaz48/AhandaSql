-- INSERT into Fakulteler (Faculties)
INSERT INTO Fakulteler (Isim, Dekan)
VALUES 
    ('Ziraat Fakültesi', 'Oktay Çalışkan'),
    ('Mühendislik Fakültesi', NULL),
    ('Güzel Sanatlar Fakültesi', 'Hasan Hüseyin Badak');

-- INSERT into Bolumler (Departments)
INSERT INTO Bolumler (Isim, Fakulte_ID)
VALUES
    ('Fizik Bölümü', 1),
    ('Kimya Bölümü', 1),
    ('Karşılaştırmalı Edebiyat', 1),
    ('Biyoloji Bölümü', 1),
    ('Elektrik Mühendisliği', 3);
