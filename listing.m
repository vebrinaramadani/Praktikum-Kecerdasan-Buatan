menu;
disp('================');
disp('Menu');
disp('================');
disp('1. Input Data');
disp('2. Cetak Data');
disp('3. Cetak Rata-Rata');
disp('4. Cetak Dalam Bentuk Grafik');
disp('5. Reset Data');
disp('6. Keluar');
n = input('Pilihan : ');
switch (n)
    case (1), bulan = input ('bulan banyak bulan: ');
        bulan;
        for i = 1:bulan
            bulann = input(['Pengeluaran Bulan Ke ', i]);
            input;
            totbul = 0+bulann;
            rata2 = totbul/bulan;
        end
        menu;
    case(2), disp(['Pengeluaran = ', num2str(bulann)]);
        disp(['Total Pengeluaran = ', num2str(totbul)]);
    case(3), rata2;
    case(4), 
        disp('================');
        disp('Menu');
        disp('================');
        disp('1. Grafik Garis');
        disp('2. Grafik Batang');
        disp('3. Grafik Pie');
        grafik = input('Pilih Grafik = ');
        switch (grafik)
            case(1), plot(bulann);
            case(2), bar(bulann);
            case(3), pie(bulann);
            otherwise
                disp ('Pilihan Tidak Ditemukan');
                exit;
        end
    case(5), 
        bulann = [];
    case(6),
        exit;
    otherwise
        disp('Maaf, Pilihan Tidak Di Temukan');
        exit;
end