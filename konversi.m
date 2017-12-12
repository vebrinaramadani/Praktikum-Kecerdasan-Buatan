int n;
    printf('Input nilai angka');scanf('%d');
    if (n>=0 && n<=20){
        printf('konversi angka ke huruf dari %d adalah E\n\n',n);
    }
    else if (n>=21 && n<=40) {
        printf('konversi angka ke huruf dari %d adalah D\n\n',n);
    }
    else if (n>=41 && n<=60) {
        printf('konversi angka ke huruf dari %d adalah C\n\n',n);
    }
    else if (n>=61 && n<=80) {
        printf('konversi angka ke huruf dari %d adalah B\n\n',n);
    }
    else if (n>80 && n<=100) {
        printf('konversi angka ke huruf dari %d adalah A\n\n',n);
    }
    else if (n>100) {
        printf('NILAI ANGKA HANYA ADA DI INTERVAL 0-100 !!! \n\n');
    }