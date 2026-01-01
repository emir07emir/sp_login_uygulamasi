# 🔐 Flutter Login Uygulaması (SharedPreferences)

Bu proje, **Flutter** kullanılarak geliştirilmiş basit bir **login (giriş) uygulamasıdır**.  
Uygulamada kullanıcı oturum bilgileri **SharedPreferences** ile cihaz üzerinde saklanmaktadır.

⚠️ **Bu proje tamamen eğitim amaçlıdır.**  
Gerçek projelerde kullanıcı adı ve şifre **bu şekilde saklanmamalıdır**.

---

## 🎯 Projenin Amacı

- SharedPreferences kullanımını öğrenmek
- Oturum kontrolü (login – logout) mantığını kavramak
- Uygulama açılışında otomatik giriş kontrolü yapmak
- Sayfalar arası yönlendirme (Navigator) pratiği kazanmak

---

## 🚀 Özellikler

- Kullanıcı adı ve şifre ile giriş
- Oturum açıkken uygulama yeniden açıldığında otomatik giriş
- Çıkış yapma (SharedPreferences temizleme)
- Snackbar ile hata mesajı gösterimi
- FutureBuilder ile oturum kontrolü

---

## 🛠️ Kullanılan Teknolojiler

- Flutter
- Dart
- SharedPreferences
- Google Fonts (Montserrat)

---

## 📂 Proje Yapısı

lib/
│
├── main.dart
└── Anasayfa.dart

yaml
Kodu kopyala

- **main.dart**  
  - Login ekranı  
  - Oturum kontrolü  
  - SharedPreferences kayıt işlemleri  

- **Anasayfa.dart**  
  - Kayıtlı kullanıcı bilgilerini gösterme  
  - Çıkış işlemi  

---

## ⚙️ Çalışma Mantığı

- Kullanıcı giriş yaptığında bilgiler SharedPreferences içine kaydedilir
- Uygulama açılışında `FutureBuilder` ile oturum kontrolü yapılır
- Eğer bilgiler doğruysa direkt ana sayfaya yönlendirilir
- Çıkış yapıldığında kayıtlı veriler silinir

---

## ▶️ Projeyi Çalıştırma

1. Depoyu klonlayın
```bash
git clone https://github.com/kullanici-adi/repo-adi.git

Paketleri yükleyin
flutter pub get

Uygulamayı çalıştırın
flutter run

```


👨‍💻 Geliştirici
İbrahim Emir Erdoğan
Flutter & Mobile Developer
