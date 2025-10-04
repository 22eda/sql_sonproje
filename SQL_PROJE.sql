-- ============================================
-- E-T�CARET VER� TABANI PROJES� (SQL SERVER)
-- ============================================

-- Mevcut veritaban�n� kullan
USE alisveris_platformu;
GO

-- ============================================
-- A. VER� TABANI TASARIMI
-- ============================================

-- �nce varsa tablolar� sil (temiz ba�lang�� i�in)
IF OBJECT_ID('Siparis_Detay', 'U') IS NOT NULL DROP TABLE Siparis_Detay;
IF OBJECT_ID('Siparis', 'U') IS NOT NULL DROP TABLE Siparis;
IF OBJECT_ID('Urun', 'U') IS NOT NULL DROP TABLE Urun;
IF OBJECT_ID('Musteri', 'U') IS NOT NULL DROP TABLE Musteri;
IF OBJECT_ID('Satici', 'U') IS NOT NULL DROP TABLE Satici;
IF OBJECT_ID('Kategori', 'U') IS NOT NULL DROP TABLE Kategori;
GO

-- 1. Kategori Tablosu
CREATE TABLE Kategori (
    id INT PRIMARY KEY IDENTITY(1,1),
    ad NVARCHAR(100) NOT NULL
);

-- 2. Sat�c� Tablosu
CREATE TABLE Satici (
    id INT PRIMARY KEY IDENTITY(1,1),
    ad NVARCHAR(150) NOT NULL,
    adres NVARCHAR(MAX)
);

-- 3. M��teri Tablosu
CREATE TABLE Musteri (
    id INT PRIMARY KEY IDENTITY(1,1),
    ad NVARCHAR(100) NOT NULL,
    soyad NVARCHAR(100) NOT NULL,
    email NVARCHAR(150) UNIQUE NOT NULL,
    sehir NVARCHAR(100),
    kayit_tarihi DATE NOT NULL
);

-- 4. �r�n Tablosu
CREATE TABLE Urun (
    id INT PRIMARY KEY IDENTITY(1,1),
    ad NVARCHAR(200) NOT NULL,
    fiyat DECIMAL(10,2) NOT NULL,
    stok INT NOT NULL DEFAULT 0,
    kategori_id INT,
    satici_id INT,
    FOREIGN KEY (kategori_id) REFERENCES Kategori(id),
    FOREIGN KEY (satici_id) REFERENCES Satici(id)
);

-- 5. Sipari� Tablosu
CREATE TABLE Siparis (
    id INT PRIMARY KEY IDENTITY(1,1),
    musteri_id INT NOT NULL,
    tarih DATE NOT NULL,
    toplam_tutar DECIMAL(10,2) NOT NULL,
    odeme_turu NVARCHAR(50),
    FOREIGN KEY (musteri_id) REFERENCES Musteri(id)
);

-- 6. Sipari� Detay Tablosu
CREATE TABLE Siparis_Detay (
    id INT PRIMARY KEY IDENTITY(1,1),
    siparis_id INT NOT NULL,
    urun_id INT NOT NULL,
    adet INT NOT NULL,
    fiyat DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (siparis_id) REFERENCES Siparis(id),
    FOREIGN KEY (urun_id) REFERENCES Urun(id)
);
GO

-- ============================================
-- B. VER� EKLEME
-- ============================================

-- Kategoriler
INSERT INTO Kategori (ad) VALUES 
(N'Elektronik'),
(N'Giyim'),
(N'Ev & Ya�am'),
(N'Spor & Outdoor'),
(N'Kitap'),
(N'Kozmetik'),
(N'Oyuncak');

-- Sat�c�lar
INSERT INTO Satici (ad, adres) VALUES 
(N'TechStore', N'�stanbul, T�rkiye'),
(N'ModaMa�azas�', N'Ankara, T�rkiye'),
(N'EvD�nyas�', N'�zmir, T�rkiye'),
(N'SporD�nyas�', N'Bursa, T�rkiye'),
(N'KitapSaray�', N'Antalya, T�rkiye');

-- M��teriler
INSERT INTO Musteri (ad, soyad, email, sehir, kayit_tarihi) VALUES 
(N'Ahmet', N'Y�lmaz', 'ahmet.yilmaz@email.com', N'�stanbul', '2024-01-15'),
(N'Ay�e', N'Kaya', 'ayse.kaya@email.com', N'Ankara', '2024-02-20'),
(N'Mehmet', N'Demir', 'mehmet.demir@email.com', N'�zmir', '2024-03-10'),
(N'Fatma', N'�ahin', 'fatma.sahin@email.com', N'�stanbul', '2024-04-05'),
(N'Ali', N'�zt�rk', 'ali.ozturk@email.com', N'Bursa', '2024-05-12'),
(N'Zeynep', N'Arslan', 'zeynep.arslan@email.com', N'Antalya', '2024-06-18'),
(N'Mustafa', N'�elik', 'mustafa.celik@email.com', N'�stanbul', '2024-07-22'),
(N'Elif', N'Kurt', 'elif.kurt@email.com', N'Ankara', '2024-08-30'),
(N'Hasan', N'Ayd�n', 'hasan.aydin@email.com', N'�zmir', '2024-09-14'),
(N'Merve', N'Polat', 'merve.polat@email.com', N'�stanbul', '2024-10-01');

-- �r�nler
INSERT INTO Urun (ad, fiyat, stok, kategori_id, satici_id) VALUES 
(N'iPhone 15', 45000.00, 50, 1, 1),
(N'Samsung Galaxy S24', 40000.00, 30, 1, 1),
(N'Laptop Dell XPS', 35000.00, 20, 1, 1),
(N'Bluetooth Kulakl�k', 1500.00, 100, 1, 1),
(N'Erkek Kot Pantolon', 450.00, 200, 2, 2),
(N'Kad�n Elbise', 650.00, 150, 2, 2),
(N'Ti��rt', 120.00, 300, 2, 2),
(N'Kahve Makinesi', 2500.00, 40, 3, 3),
(N'Elektrikli S�p�rge', 3200.00, 35, 3, 3),
(N'Yatak �rt�s�', 800.00, 60, 3, 3),
(N'Ko�u Ayakkab�s�', 1200.00, 80, 4, 4),
(N'Yoga Mat�', 250.00, 120, 4, 4),
(N'Damb�l Seti', 450.00, 50, 4, 4),
(N'Harry Potter Seti', 850.00, 40, 5, 5),
(N'Su� ve Ceza', 150.00, 100, 5, 5),
(N'Nemlendirici Krem', 320.00, 200, 6, 2),
(N'Lego Set', 1500.00, 30, 7, 3);

-- Sipari�ler
INSERT INTO Siparis (musteri_id, tarih, toplam_tutar, odeme_turu) VALUES 
(1, '2024-08-15', 46500.00, N'Kredi Kart�'),
(1, '2024-09-20', 1200.00, N'Kredi Kart�'),
(2, '2024-08-18', 3200.00, N'Havale'),
(3, '2024-09-01', 850.00, N'Kredi Kart�'),
(4, '2024-09-10', 1100.00, N'Kap�da �deme'),
(5, '2024-09-15', 40000.00, N'Kredi Kart�'),
(6, '2024-09-18', 2750.00, N'Kredi Kart�'),
(7, '2024-09-22', 650.00, N'Havale'),
(1, '2024-09-25', 2500.00, N'Kredi Kart�'),
(8, '2024-09-28', 570.00, N'Kredi Kart�'),
(9, '2024-10-01', 35000.00, N'Kredi Kart�'),
(10, '2024-10-02', 1700.00, N'Kap�da �deme');

-- Sipari� Detaylar�
INSERT INTO Siparis_Detay (siparis_id, urun_id, adet, fiyat) VALUES 
(1, 1, 1, 45000.00),
(1, 4, 1, 1500.00),
(2, 11, 1, 1200.00),
(3, 9, 1, 3200.00),
(4, 14, 1, 850.00),
(5, 5, 1, 450.00),
(5, 6, 1, 650.00),
(6, 2, 1, 40000.00),
(7, 8, 1, 2500.00),
(7, 12, 1, 250.00),
(8, 6, 1, 650.00),
(9, 8, 1, 2500.00),
(10, 7, 2, 240.00),
(10, 16, 1, 320.00),
(11, 3, 1, 35000.00),
(12, 17, 1, 1500.00),
(12, 15, 1, 150.00);
GO

-- ============================================
-- C. VER� G�NCELLEME �RNEKLER�
-- ============================================

-- Stok g�ncelleme (sipari� sonras�)
UPDATE Urun SET stok = stok - 1 WHERE id = 1;
UPDATE Urun SET stok = stok - 2 WHERE id = 7;

-- Fiyat g�ncelleme (Elektronik �r�nlere %10 zam)
UPDATE Urun SET fiyat = fiyat * 1.1 WHERE kategori_id = 1;

-- M��teri bilgisi g�ncelleme
UPDATE Musteri SET sehir = N'�stanbul' WHERE id = 5;
GO

-- ============================================
-- D. VER� SORGULAMA VE RAPORLAMA
-- ============================================

-- 1. EN �OK S�PAR�� VEREN 5 M��TER�
SELECT TOP 5
    m.id,
    m.ad + ' ' + m.soyad AS musteri_adi,
    COUNT(s.id) AS siparis_sayisi,
    SUM(s.toplam_tutar) AS toplam_harcama
FROM Musteri m
LEFT JOIN Siparis s ON m.id = s.musteri_id
GROUP BY m.id, m.ad, m.soyad
ORDER BY siparis_sayisi DESC, toplam_harcama DESC;

-- 2. EN �OK SATILAN �R�NLER
SELECT TOP 10
    u.id,
    u.ad AS urun_adi,
    SUM(sd.adet) AS toplam_satis,
    SUM(sd.adet * sd.fiyat) AS toplam_gelir
FROM Urun u
JOIN Siparis_Detay sd ON u.id = sd.urun_id
GROUP BY u.id, u.ad
ORDER BY toplam_satis DESC;

-- 3. EN Y�KSEK C�ROSU OLAN SATICILAR
SELECT 
    sat.id,
    sat.ad AS satici_adi,
    COUNT(DISTINCT sd.siparis_id) AS siparis_sayisi,
    SUM(sd.adet * sd.fiyat) AS toplam_ciro
FROM Satici sat
JOIN Urun u ON sat.id = u.satici_id
JOIN Siparis_Detay sd ON u.id = sd.urun_id
GROUP BY sat.id, sat.ad
ORDER BY toplam_ciro DESC;

-- 4. �EH�RLERE G�RE M��TER� SAYISI
SELECT 
    sehir,
    COUNT(*) AS musteri_sayisi
FROM Musteri
GROUP BY sehir
ORDER BY musteri_sayisi DESC;

-- 5. KATEGOR� BAZLI TOPLAM SATI�LAR
SELECT 
    k.ad AS kategori_adi,
    COUNT(sd.id) AS satis_adedi,
    SUM(sd.adet * sd.fiyat) AS toplam_gelir,
    AVG(sd.fiyat) AS ortalama_fiyat
FROM Kategori k
LEFT JOIN Urun u ON k.id = u.kategori_id
LEFT JOIN Siparis_Detay sd ON u.id = sd.urun_id
GROUP BY k.id, k.ad
ORDER BY toplam_gelir DESC;

-- 6. AYLARA G�RE S�PAR�� SAYISI
SELECT 
    YEAR(tarih) AS yil,
    MONTH(tarih) AS ay,
    COUNT(*) AS siparis_sayisi,
    SUM(toplam_tutar) AS toplam_ciro
FROM Siparis
GROUP BY YEAR(tarih), MONTH(tarih)
ORDER BY yil, ay;

-- 7. S�PAR��LERDE M��TER� + �R�N + SATICI B�LG�S�
SELECT 
    s.id AS siparis_no,
    m.ad + ' ' + m.soyad AS musteri,
    m.sehir,
    u.ad AS urun,
    sat.ad AS satici,
    sd.adet,
    sd.fiyat,
    (sd.adet * sd.fiyat) AS toplam,
    s.tarih,
    s.odeme_turu
FROM Siparis s
JOIN Musteri m ON s.musteri_id = m.id
JOIN Siparis_Detay sd ON s.id = sd.siparis_id
JOIN Urun u ON sd.urun_id = u.id
JOIN Satici sat ON u.satici_id = sat.id
ORDER BY s.tarih DESC;

-- 8. H�� SATILMAMI� �R�NLER
SELECT 
    u.id,
    u.ad AS urun_adi,
    u.fiyat,
    u.stok,
    k.ad AS kategori
FROM Urun u
LEFT JOIN Siparis_Detay sd ON u.id = sd.urun_id
JOIN Kategori k ON u.kategori_id = k.id
WHERE sd.id IS NULL;

-- 9. H�� S�PAR�� VERMEM�� M��TER�LER
SELECT 
    m.id,
    m.ad + ' ' + m.soyad AS musteri_adi,
    m.email,
    m.sehir,
    m.kayit_tarihi
FROM Musteri m
LEFT JOIN Siparis s ON m.id = s.musteri_id
WHERE s.id IS NULL;

-- 10. EN �OK KAZAN� SA�LAYAN �LK 3 KATEGOR�
SELECT TOP 3
    k.ad AS kategori,
    SUM(sd.adet * sd.fiyat) AS toplam_kazanc,
    COUNT(DISTINCT sd.siparis_id) AS siparis_sayisi,
    SUM(sd.adet) AS toplam_adet
FROM Kategori k
JOIN Urun u ON k.id = u.kategori_id
JOIN Siparis_Detay sd ON u.id = sd.urun_id
GROUP BY k.id, k.ad
ORDER BY toplam_kazanc DESC;

-- 11. ORTALAMA S�PAR�� TUTARINI GE�EN S�PAR��LER
SELECT 
    s.id,
    m.ad + ' ' + m.soyad AS musteri,
    s.toplam_tutar,
    s.tarih,
    (SELECT AVG(toplam_tutar) FROM Siparis) AS ortalama_tutar
FROM Siparis s
JOIN Musteri m ON s.musteri_id = m.id
WHERE s.toplam_tutar > (SELECT AVG(toplam_tutar) FROM Siparis)
ORDER BY s.toplam_tutar DESC;

-- 12. EN AZ B�R KEZ ELEKTRON�K �R�N SATIN ALAN M��TER�LER
SELECT DISTINCT
    m.id,
    m.ad + ' ' + m.soyad AS musteri_adi,
    m.email,
    m.sehir
FROM Musteri m
JOIN Siparis s ON m.id = s.musteri_id
JOIN Siparis_Detay sd ON s.id = sd.siparis_id
JOIN Urun u ON sd.urun_id = u.id
JOIN Kategori k ON u.kategori_id = k.id
WHERE k.ad = N'Elektronik';

-- 13. SATICI PERFORMANS RAPORU
SELECT 
    sat.ad AS satici,
    COUNT(DISTINCT u.id) AS urun_sayisi,
    COUNT(DISTINCT sd.siparis_id) AS toplam_siparis,
    SUM(sd.adet) AS toplam_satis_adedi,
    SUM(sd.adet * sd.fiyat) AS toplam_ciro,
    AVG(sd.fiyat) AS ortalama_urun_fiyati
FROM Satici sat
LEFT JOIN Urun u ON sat.id = u.satici_id
LEFT JOIN Siparis_Detay sd ON u.id = sd.urun_id
GROUP BY sat.id, sat.ad
ORDER BY toplam_ciro DESC;

-- 14. �DEME T�RLER�NE G�RE DA�ILIM
SELECT 
    odeme_turu,
    COUNT(*) AS siparis_sayisi,
    SUM(toplam_tutar) AS toplam_tutar,
    AVG(toplam_tutar) AS ortalama_tutar
FROM Siparis
GROUP BY odeme_turu
ORDER BY toplam_tutar DESC;

-- 15. STOK DURUMU RAPORU
SELECT 
    u.ad AS urun,
    u.stok,
    k.ad AS kategori,
    sat.ad AS satici,
    CASE 
        WHEN u.stok = 0 THEN N'T�kendi'
        WHEN u.stok < 20 THEN N'D���k Stok'
        WHEN u.stok < 50 THEN N'Normal Stok'
        ELSE N'Y�ksek Stok'
    END AS stok_durumu
FROM Urun u
JOIN Kategori k ON u.kategori_id = k.id
JOIN Satici sat ON u.satici_id = sat.id
ORDER BY u.stok ASC;
GO

-- ============================================
-- EKSTRA: S�LME �RNEKLER�
-- ============================================

-- Sipari� silme (�nce detaylar, sonra sipari�)
-- DELETE FROM Siparis_Detay WHERE siparis_id = 12;
-- DELETE FROM Siparis WHERE id = 12;

-- Tablo i�eri�ini tamamen silme
-- TRUNCATE TABLE Siparis_Detay;
GO