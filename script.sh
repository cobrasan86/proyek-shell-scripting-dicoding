# !/bin/bash
# Rizky Hananta
 
counter=1 #variabel counter di isi dengan angka satu
now=$(date) #memasukkan waktu ke dalam variabel now
 
while true
do
    clear #pembersihan layar dengan clear
    #mencetak counter
    echo "=============================================="
    echo "Pengecekan ke-$counter,$now"
    echo -e "==============================================\n"
    #setiap perputaran maka value  counter bertambah satu
    counter=$((counter+=1))
    #mencetak deskripsi dengan echo
    echo "1.Menampilkan ukuran memory pada sistem dalam satuan megabytes."
    #mencetak ukuran memory dengan free di bantu option -m(agar tercetak dalam satuan megabytes) dan di bantu command awk untuk hanya Menampilkan baris kedua dan kolom kedua
    free -m | awk 'FNR == 2 {print ">> Total Memory/RAM : "$2 "MB\n"}'
    #pause selama 3 detik
    sleep 3
 
 
    #mencetak deskripsi dengan echo
    echo "2.Menampilkan penggunaan ruang disk pada filesystem dalam satuan gigabytes."
    #menampilkan ruang disk dengan df dan dibantu option -BG untuk menampilkan blok dalam gigabytes,di tambah echo -e "\n" untuk menambah baris baru
    df -BG;echo -e "\n"
    #pause selama 3 detik
    sleep 3
 
 
    #mencetak deskripsi dengan echo
    echo "3.Menampilkan penggunaan ruang disk pada filesystem hanya untuk kolom Filesystem dan Use%"
    #menampilkan ruang disk,menghilangkan tmpfs dengan grep dan memotongnya menggunakan awk menampilkan hanya kolom 1 dan 5
    df -BG | grep -v "tmpfs" | awk '{print $1,$5"\n"}'
    #pause selama 3 detik
    sleep 3
 
 
    #mencetak deskripsi dengan echo
    echo "4.Menampilkan penggunaan ruang disk pada filesystem hanya untuk kolom Filesystem dan Use menggunakan option --output pada df"
    #menampilkan output hanya Filesystem dan use tetapi dengan bantuan option --output dari option command df
    df -hBG --output=source,used | grep -v "tmpfs";echo -e "\n"
    #pause selama 1 menit,1m=1minute
    sleep 1m
done
