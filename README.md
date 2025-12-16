# Automated Red Blood Cell (RBC) Counting / Otomatik Kan Hücresi Sayımı

<p align="center">
  <a href="#-automated-red-blood-cell-rbc-counting">English</a> | 
  <a href="#-otomatik-kırmızı-kan-hücresi-rbc-sayımı">Türkçe</a>
</p>

---

<div id="english"></div>

## ENG Automated Red Blood Cell (RBC) Counting

This MATLAB project is designed to automatically detect and count Red Blood Cells (RBCs) from microscopic blood smear images. It utilizes various image processing techniques to enhance image quality, segment cells, and perform counting using the Circular Hough Transform.

###  Features
* **Image Preprocessing:** Improves image quality using contrast stretching, Gaussian filtering, and Gamma correction.
* **Noise Reduction:** Removes noise and artifacts using Median filters and morphological operations.
* **Step-by-Step Visualization:** Visualizes every stage of the pipeline (Histograms, Thresholding, Edge Detection) for analysis.
* **Automated Counting:** Detects circular cells using `imfindcircles` and provides a total count.

###  Technologies & Requirements
* **Language:** MATLAB
* **Toolbox:** Image Processing Toolbox
* **Input:** Grayscale or RGB microscopic images (e.g., `bloodsmear.jpg`)

###  Algorithm Pipeline
The code executes the following steps:
1.  **Input Validation:** Checks for necessary toolboxes and image files.
2.  **Grayscale Conversion:** Converts RGB images to grayscale.
3.  **Enhancement:**
    * **Contrast Stretching:** Using `imadjust`.
    * **Filtering:** Gaussian filter (`imgaussfilt`) and Median filter (`medfilt2`).
    * **Gamma Correction:** Adjusts luminance.
4.  **Segmentation:** Applies a manual threshold (Value: 95) to create a binary mask.
5.  **Morphological Cleaning:** Removes small objects (noise) using `bwareaopen`.
6.  **Detection:** Uses **Hough Transform** (`imfindcircles`) to detect cells with radii between 20-50 pixels.

###  How to Run
1.  Clone this repository or download the files.
2.  Open MATLAB and navigate to the project folder.
3.  Run the `BlobsDemo.m` script.
4.  The script will display the processed images and the final count of RBCs in the command window and figure title.

---

<div id="türkçe"></div>

## 🇹🇷 Otomatik Kırmızı Kan Hücresi (RBC) Sayımı

Bu proje, mikroskobik kan yayma (blood smear) görüntülerinden Kırmızı Kan Hücrelerini (RBC) otomatik olarak tespit etmek ve saymak için geliştirilmiş bir MATLAB uygulamasıdır. Görüntü kalitesini artırmak, hücreleri ayrıştırmak ve sayım yapmak için çeşitli görüntü işleme teknikleri kullanır.

###  Özellikler
* **Görüntü Ön İşleme:** Kontrast germe, Gauss filtreleme ve Gama düzeltmesi kullanarak görüntü kalitesini iyileştirir.
* **Gürültü Azaltma:** Medyan filtreler ve morfolojik işlemler kullanarak gürültüyü ve istenmeyen nesneleri temizler.
* **Adım Adım Görselleştirme:** İşlemin her aşamasını (Histogramlar, Eşikleme, vb.) analiz için grafik üzerinde gösterir.
* **Otomatik Sayım:** `imfindcircles` (Hough Dönüşümü) kullanarak dairesel hücreleri algılar ve toplam sayıyı verir.

###  Teknolojiler ve Gereksinimler
* **Dil:** MATLAB
* **Araç Kutusu:** Image Processing Toolbox (Görüntü İşleme Araç Kutusu)
* **Giriş:** Gri tonlamalı veya RGB mikroskobik görüntüler (örn. `bloodsmear.jpg`)

###  Algoritma Akışı
Kod sırasıyla aşağıdaki adımları uygular:
1.  **Giriş Kontrolü:** Gerekli araç kutularını ve görüntü dosyalarını kontrol eder.
2.  **Gri Seviye Dönüşümü:** Renkli görüntüleri gri tonlamaya çevirir.
3.  **İyileştirme:**
    * **Kontrast Germe:** `imadjust` fonksiyonu ile.
    * **Filtreleme:** Gauss (`imgaussfilt`) ve Medyan (`medfilt2`) filtreleri.
    * **Gama Düzeltmesi:** Görüntü parlaklığını optimize eder.
4.  **Bölütleme (Segmentation):** Manuel bir eşik değeri (95) ile görüntüyü ikili (binary) hale getirir.
5.  **Morfolojik Temizleme:** `bwareaopen` kullanarak küçük gürültü parçacıklarını siler.
6.  **Tespit:** Yarıçapı 20-50 piksel arasında olan hücreleri tespit etmek için **Hough Dönüşümü** kullanır.

###  Kurulum ve Kullanım
1.  Bu projeyi indirin.
2.  MATLAB'i açın ve proje klasörüne gidin.
3.  `BlobsDemo.m` dosyasını çalıştırın.
4.  Program, işlenmiş görüntüleri ve tespit edilen toplam hücre sayısını grafik başlığında gösterecektir.

---
**Developer / Geliştirici:** Simge K.

