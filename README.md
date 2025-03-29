# Tugas Praktikum 1: Dasar State dengan Model-View
## 1. Selesaikan langkah-langkah praktikum tersebut, lalu dokumentasikan berupa GIF hasil akhir praktikum beserta penjelasannya di file README.md! Jika Anda menemukan ada yang error atau tidak berjalan dengan baik, silahkan diperbaiki.

## 2. Jelaskan maksud dari langkah 4 pada praktikum tersebut! Mengapa dilakukan demikian?
```markdown
Langkah 4: Membuat file data_layer.dart

Penjelasan :
File `data_layer.dart` dibuat sebagai _barrel file_ yang mengelompokkan beberapa model
(`plan.dart` dan `task.dart`) agar lebih mudah diimpor

export 'plan.dart';
export 'task.dart';

Tujuan :
1. Menyederhanakan Impor: Mengimpor satu file (`data_layer.dart`) daripada mengimpor setiap file model secara terpisah.
2. Struktur Proyek Lebih Rapi: Mengelompokkan file terkait dalam satu _entry point_.
3. Mengurangi Duplikasi: Mencegah kesalahan impor yang berulang.
4. Skalabilitas: Memudahkan penambahan model baru di masa depan.
```

## 3. Mengapa perlu variabel plan di langkah 6 pada praktikum tersebut? Mengapa dibuat konstanta ? 
```markdown
## Langkah 6: Membuat plan_screen.dart

### Mengapa perlu variabel `plan`?
Variabel `plan` digunakan untuk menyimpan objek dari kelas `Plan` yang berisi daftar tugas.
Ini memungkinkan pengelolaan tugas seperti menambah, menghapus, atau mengedit melalui antarmuka pengguna.

### Mengapa dibuat konstanta (`const`)?
1. Optimasi Kinerja: Dibuat pada waktu kompilasi, lebih efisien.
2. Mencegah Perubahan Tidak Sengaja: Data `Plan` tetap (_immutable_).
3. Konsistensi Data: Menghindari bug akibat modifikasi yang tidak diinginkan.
```

## 4. Lakukan capture hasil dari Langkah 9 berupa GIF, kemudian jelaskan apa yang telah Anda buat!

## 5. Apa kegunaan method pada Langkah 11 dan 13 dalam lifecyle state ?
```markdown
## Langkah 11 & 13: Scroll Listener & Dispose Method

### Kegunaan Method pada Lifecycle State

#### Langkah 11: `initState()`
- **Tujuan: Menginisialisasi `scrollController` dan menambahkan _listener_ untuk mendeteksi aktivitas scroll.
- **Fungsi: Menyembunyikan keyboard saat pengguna menggulir layar dengan menghapus fokus dari input aktif (`FocusNode()`).
- **Lifecycle: Dipanggil sekali saat widget pertama kali dibuat.

#### Langkah 13: `dispose()`
- **Tujuan: Membersihkan `scrollController` saat widget tidak lagi digunakan.
- **Fungsi: Mencegah kebocoran memori (_memory leak_) dengan memanggil `dispose()` pada `scrollController`.
- **Lifecycle: Dipanggil sekali saat widget dihapus dari pohon widget (_widget tree_).
```

# Tugas Praktikum 2: InheritedWidget
## 1. Selesaikan langkah-langkah praktikum tersebut, lalu dokumentasikan berupa GIF hasil akhir praktikum beserta penjelasannya di file README.md! Jika Anda menemukan ada yang error atau tidak berjalan dengan baik, silakan diperbaiki sesuai dengan tujuan aplikasi tersebut dibuat.

## 2. Jelaskan mana yang dimaksud InheritedWidget pada langkah 1 tersebut! Mengapa yang digunakan InheritedNotifier?

### Jawaban:

```markdown
## InheritedWidget & InheritedNotifier

### Apa itu InheritedWidget?
`InheritedWidget` adalah widget khusus yang memungkinkan widget turunan mengakses data dari widget induk tanpa perlu mengoper data
secara eksplisit melalui konstruktor. Biasanya digunakan untuk membuat State Management yang efisien.

### Mengapa menggunakan `InheritedNotifier`?
`InheritedNotifier` digunakan karena kita ingin menyediakan akses ke objek `Plan` yang dapat berubah (dinamis)
dan perlu memberi tahu widget turunan ketika terjadi perubahan. 

#### Keuntungan menggunakan `InheritedNotifier`:
1. Reaktif: Menggunakan `ValueNotifier<Plan>` memungkinkan pembaruan otomatis pada UI ketika objek `Plan` berubah.
2. Efisiensi: Hanya widget yang membutuhkan perubahan yang akan dibangun ulang.
3. Kemudahan Akses: Data `Plan` dapat diakses dari mana saja dalam widget tree menggunakan `PlanProvider.of(context)`.

> `InheritedNotifier` cocok digunakan karena aplikasi membutuhkan notifikasi perubahan secara otomatis, bukan hanya akses data statis.
```
## 3. Jelaskan maksud dari method di langkah 3 pada praktikum tersebut! Mengapa dilakukan demikian?
## Langkah 3: Menambah Method pada `plan.dart`

### Penjelasan Method
1. **`completedCount`**
   - Menghitung jumlah tugas yang sudah selesai (_complete_).
   - Menggunakan metode `.where()` untuk memfilter tugas yang sudah selesai, lalu mengambil panjang daftar hasilnya (`.length`).

2. **`completenessMessage`**
   - Menghasilkan pesan ringkasan dari total tugas yang selesai dan jumlah seluruh tugas.
   - Contoh output: `"3 out of 5 tasks"`.

### Mengapa Dilakukan?
- **Mempermudah Akses Data:** Memberikan cara mudah untuk mendapatkan statistik tugas yang selesai tanpa mengulang proses filtering di tempat lain.
- **Efisiensi:** Mengurangi duplikasi kode dengan menyediakan akses langsung ke data yang sering digunakan.
- **Menyederhanakan UI:** Mempermudah pembuatan tampilan yang menampilkan progres tugas.

> Dengan menambahkan method ini, aplikasi dapat menampilkan status progres dengan lebih efisien dan rapi.


## 4. Lakukan capture hasil dari Langkah 9 berupa GIF, kemudian jelaskan apa yang telah Anda buat!

# Tugas Praktikum 3: State di Multiple Screens
## 1. Selesaikan langkah-langkah praktikum tersebut, lalu dokumentasikan berupa GIF hasil akhir praktikum beserta penjelasannya di file README.md! Jika Anda menemukan ada yang error atau tidak berjalan dengan baik, silahkan diperbaiki sesuai dengan tujuan aplikasi tersebut dibuat.
## 2. Berdasarkan Praktikum 3 yang telah Anda lakukan, jelaskan maksud dari gambar diagram berikut ini!
![Screenshot aplikasi kamera](asset/tugas.png)

## Penjelasan Diagram Navigasi Praktikum 3

### Diagram Navigasi
Diagram menunjukkan **alur navigasi antar halaman dalam aplikasi Flutter** menggunakan `Navigator.push()`.

### Penjelasan
1. **Kiri (Halaman PlanCreatorScreen)**
   - Struktur Widget:
     - `MaterialApp` sebagai root aplikasi.
     - `PlanProvider` untuk mengelola state aplikasi.
     - `PlanCreatorScreen` menampilkan UI dengan:
       - `Column` yang memiliki `TextField` dan `Expanded`.
       - `ListView` berada di dalam `Expanded` untuk menampilkan daftar item yang dapat digulir.

2. **Navigasi (Navigator Push)**
   - Penggunaan `Navigator.push()` untuk **berpindah dari halaman `PlanCreatorScreen` ke halaman `PlanScreen`**.

3. **Kanan (Halaman PlanScreen)**
   - Struktur Widget:
     - `MaterialApp` sebagai root aplikasi.
     - `PlanScreen` sebagai halaman tujuan.
     - `Scaffold` menyediakan struktur dasar dengan `AppBar` dan `Body`.
     - `Column` terdiri dari:
       - `Expanded` berisi `ListView` untuk menampilkan daftar tugas.
       - `SafeArea` dan `Text` untuk menampilkan informasi tambahan atau status.

### Kesimpulan
Navigasi dilakukan dari `PlanCreatorScreen` ke `PlanScreen` menggunakan `Navigator.push()`. Kedua layar memiliki struktur yang berbeda namun menggunakan **state management yang sama melalui `PlanProvider`**.

## 3. Lakukan capture hasil dari Langkah 14 berupa GIF, kemudian jelaskan apa yang telah Anda buat!
![Screenshot aplikasi kamera](asset/masterplan.gif)






