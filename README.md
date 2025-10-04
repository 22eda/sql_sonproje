🛒 E-Ticaret Veritabanı Yönetim Sistemi
Bu proje, gerçek bir e-ticaret platformunu (Trendyol, Hepsiburada, Amazon benzeri) modelleyen kapsamlı bir SQL veritabanı projesidir.
📋 İçindekiler

Proje Hakkında
Özellikler
Veritabanı Yapısı
Kurulum
Kullanım
Örnek Sorgular
ER Diyagramı
Teknolojiler

🎯 Proje Hakkında
Bu proje, bir online alışveriş platformunun veritabanı tasarımını ve yönetimini içerir. Müşteri, ürün, sipariş, kategori, ödeme ve satıcı verilerinin yönetimini kapsar.
Projenin Amaçları

Gerçek dünya senaryosuna uygun veritabanı tasarımı
İlişkisel veritabanı modelleme becerilerini geliştirme
Kompleks SQL sorguları yazma pratiği
Veri analizi ve raporlama yeteneklerini artırma

✨ Özellikler

✅ 6 temel tablo ile normalize edilmiş veritabanı yapısı
✅ Foreign key ilişkileri ile veri bütünlüğü
✅ 100+ satır örnek veri
✅ 15+ farklı analiz ve raporlama sorgusu
✅ CRUD (Create, Read, Update, Delete) operasyonları
✅ Aggregate fonksiyonlar (SUM, AVG, COUNT)
✅ JOIN operasyonları (INNER, LEFT, RIGHT)
✅ Alt sorgular (Subqueries)
✅ GROUP BY ve HAVING kullanımı

🗄️ Veritabanı Yapısı
Tablolar
1. Musteri (Müşteri Bilgileri)
- id (PK)
- ad
- soyad
- email (UNIQUE)
- sehir
- kayit_tarihi
2. Kategori (Ürün Kategorileri)
- id (PK)
- ad
3. Satici (Satıcı Bilgileri)
- id (PK)
- ad
- adres
4. Urun (Ürün Bilgileri)
- id (PK)
- ad
- fiyat
- stok
- kategori_id (FK)
- satici_id (FK)
5. Siparis (Sipariş Bilgileri)
- id (PK)
- musteri_id (FK)
- tarih
- toplam_tutar
- odeme_turu
6. Siparis_Detay (Sipariş Detayları)
- id (PK)
- siparis_id (FK)
- urun_id (FK)
- adet
- fiyat
İlişkiler

Bir müşteri → Birden fazla sipariş verebilir (1:N)
Bir sipariş → Birden fazla ürün içerebilir (N:M)
Bir ürün → Bir kategoriye aittir (N:1)
Bir ürün → Bir satıcıya aittir (N:1)

🚀 Kurulum
Gereksinimler

SQL Server 2016 veya üzeri
SQL Server Management Studio (SSMS)

Adımlar

Projeyi İndirin

bashgit clone https://github.com/kullaniciadi/eticaret-veritabani.git
cd eticaret-veritabani

Veritabanını Oluşturun

sqlCREATE DATABASE alisveris_platformu;



📚 Öğrenilen Konular

✅ Veritabanı Normalizasyonu (1NF, 2NF, 3NF)
✅ Primary Key ve Foreign Key ilişkileri
✅ IDENTITY ve AUTO_INCREMENT kullanımı
✅ JOIN çeşitleri (INNER, LEFT, RIGHT, FULL OUTER)
✅ Aggregate fonksiyonlar (COUNT, SUM, AVG, MIN, MAX)
✅ GROUP BY ve HAVING kullanımı
✅ Alt sorgular (Subqueries)
✅ CASE WHEN ifadeleri
✅ Date/Time fonksiyonları
✅ String fonksiyonları
SQL Script'i Çalıştırın

