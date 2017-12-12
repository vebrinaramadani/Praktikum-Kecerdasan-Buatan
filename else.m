menu;
nilai=input('Nilai ujian = ');
disp('---------------------');
disp('---------MENU--------');
disp('---------------------');
disp('1. Cetak Nama');
disp('2. Cetak Nilai');
disp('3. Cetak Keterangan');
x=input('Input pilihan = ');
switch x
    case (1), disp('Cetak Nama')
        disp(nama);
        menu
    case (2), disp('Cetak Nilai')
        disp(nilai);
        menu
    case (3), disp('Cetak Keterangan')
