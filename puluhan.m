%ini adalah fungsi konversi puluhan
function teks = puluhan(angka)

sisa = mod(angka, 10);
bagi = floor(angka / 10);
hasil = [];

if bagi == 1
    
hasil = puluhan(bagi);
    hasil = [hasil ' puluh'];
    
    if sisa >= 10 && sisa <= 99 %jika sisa masuk bagian puluhan
        hasil = [hasil puluhan(sisa)];
    end
    teks = hasil;