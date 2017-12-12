%Program sederhana untuk menghitung perkiraan rata-rata nilai praktikum
%Dengan 3 poin penilaian : nilai praktikum, keaktifan dan responsi

%Nilai praktikum
nil_1 = 76;
nil_2 = 80;
nil_3 = 79;
nil_4 = 83;
nil_5 = 81;
nil_6 = 90;
nil_7 = 80;
nil_8 = 85;

%Nilai keaktifan
aktif1 = 80;
aktif2 = 90;
aktif3 = 95;
aktif4 = 87;

%Nilai responsi
responsi = 90;

hasil_prak = (nil_1+nil_2+nil_3+nil_4+nil_5+nil_6+nil_7+nil_8)/8*0.30;
hasil_prak

hasil_keaktifan = (aktif1+aktif2+aktif3+aktif4)/4*0.35;
hasil_keaktifan

hasil_responsi = responsi*0.35;
hasil_responsi

hasil_gabungan = hasil_prak+hasil_keaktifan+hasil_responsi;
hasil_gabungan

