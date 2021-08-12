- [EN description](#en)  
- [TR açıklama](#tr)

# EN

## Abstract

A script to create a small database with bash on a text file named data.txt. It is designed to work with the whiptail package on Bash.

# Dependencies

&emsp;This script was developed with the 'whiptail' package. For Debian-based systems, you can install it with the following command:

    sudo apt-get install whiptail

# How to work ?

&emsp; The script consists of 5 main sections;

    -------------------------------------
    Menu 
    -------------------------------------
    [1] Information Entry
    [2] Record Search
    [3] Show All Records
    [4] Delete Record(s)
    [5] Exit
    =======================

### Information Entry

&emsp;In this section you can add new line(s)/record(s) to data.txt file.
The record adding screen looks like this:
![image](https://user-images.githubusercontent.com/51250249/104234998-5afea500-5465-11eb-88e5-b76fcfb3bec9.png)

After entering the record you want to add in the box, you can add a record by pressing ```Tamam```.
You can use the ```iptal``` button to exit without adding a record.

### Record Search

&emsp;In this section, you can find the texts you want to search in the data.txt file.
Not only can you search for text, you can also list with RegEx expressions.

Example: Let's find lines starting with 'x'

![image](https://user-images.githubusercontent.com/51250249/104235515-22ab9680-5466-11eb-9d88-8881ce55c8a1.png)


In fact, there are lines that contain more than one 'x' expression.

![image](https://user-images.githubusercontent.com/51250249/104235615-47a00980-5466-11eb-89b5-febc1929dc89.png)


### Show All Records

&emsp; In this section, you can see all records in data.txt.

![image](https://user-images.githubusercontent.com/51250249/104235782-85049700-5466-11eb-8a50-60936c005070.png)


### Delete Record(s)

&emsp; In this section, you can delete the desired record/records from data.txt.  

You can still refer to RegEx expressions to detect records.

Example: Let's delete the lines starting with 'x'

If there is more than one line starting with 'x', you will see the following screen.

![image](https://user-images.githubusercontent.com/51250249/104235978-d876e500-5466-11eb-8b45-36b19f6acc6a.png)

If you select the ```Evet``` button, all requested records will be deleted. If you choose ```Hayır```, you will see a screen like the one below.

![image](https://user-images.githubusercontent.com/51250249/104236235-402d3000-5467-11eb-9b65-ef4492e9c08e.png)

You can delete only one record from this list.

### Exit

&emsp;With this section, you can exit safely. You will be greeted with a screen exactly like the one below.

![image](https://user-images.githubusercontent.com/51250249/104236384-87b3bc00-5467-11eb-9c55-f47bc4130569.png)

If you entered by mistake, you can return with the ```Hayır``` button. If you click the ```Evet``` button, you will be logged out.

# How to use ?

&emsp;The script is designed to run on bash. You can run it with the following command while in the same directory as the repository:

    bash project.sh

Also, if you give executable permission to the project script:

    chmod +x project.sh

You can also have the opportunity to run it as follows

    ./project.sh

# TR

# Özet

data.txt isimli bir metin dosyası üzerinde bash ile küçük bir veritabanı oluşturmaya yarayan bir betik. Bash üzerinde whiptail paketi ile çalışacak şekilde tasarlanmıştır.

# Gereksinimler

&emsp;Bu betik 'whiptail' paketiyle geliştirilmiştir. Debian tabanlı sistemler için:

    sudo apt-get install whiptail

komutuyla kurulumu gerçekleştirebilirsiniz.

# Nasıl Çalışır ?

&emsp; Betiğimiz 5 ana bölmeden oluşuyor;

    -------------------------------------
    Menü 
    -------------------------------------
    [1] Bilgi Girişi
    [2] Kayıt Arama
    [3] Tüm Kayıtları Göster
    [4] Kayıt(ları) Sil
    [5] Çıkış
    =======================

### Bilgi Girişi

&emsp;Bu bölümde data.txt dosyasına yeni satır(lar)/kayıt(lar) ekleyebilirsiniz.  
Kayıt ekleme ekranı:
![image](https://user-images.githubusercontent.com/51250249/104234998-5afea500-5465-11eb-88e5-b76fcfb3bec9.png)

eklemek istediğiniz kaydı kutucuğa girdikten sonra tamama basarak kayıt ekleyebilirsiniz.  
Kayıt eklemeden çıkmak için 'iptal' butonunu kullanabilirsiniz.

### Kayıt Arama

&emsp;Bu bölümde data.txt dosyasında aramak istediğiniz metinleri bulabilirsiniz.  
Yalnızca metin araması yapmakla kalmayabilir klasik RegEx ifadeleri ile de listeleme yapabilirsiniz.

Örnek: x ile başlayan satırlarımızı bulalım

![image](https://user-images.githubusercontent.com/51250249/104235515-22ab9680-5466-11eb-9d88-8881ce55c8a1.png)


Aslında birden fazla x ifadesi geçen satır vardır.

![image](https://user-images.githubusercontent.com/51250249/104235615-47a00980-5466-11eb-89b5-febc1929dc89.png)


### Tüm Kayıtları Göster

&emsp; Bu bölümde data.txt içerisindeki tüm kayıtları görebilirsiniz.

![image](https://user-images.githubusercontent.com/51250249/104235782-85049700-5466-11eb-8a50-60936c005070.png)


### Kayıt Sil

&emsp; Bu bölümde data.txt içerisinden istediğiniz kayıt/kayıtları silebilirsiniz. Kayıtları tespit etmek için yine RegEx ifadelerine başvurabilirsiniz.

Örnek: x ile başlayan satırları silelim

Eğer x ile başlayan birden fazla satır var ise aşağıdaki ekranla karşılaşacaksınız.

![image](https://user-images.githubusercontent.com/51250249/104235978-d876e500-5466-11eb-8b45-36b19f6acc6a.png)

Evet butonunu seçerseniz istenen tüm kayıtlar silinecektir. Hayırı seçerseniz aşağıdaki gibi bir ekranla karşılaşacaksınız.

![image](https://user-images.githubusercontent.com/51250249/104236235-402d3000-5467-11eb-9b65-ef4492e9c08e.png)

Bu listeden yalnızca bir kayıt seçerek silme işleminizi gerçekleştirebilirsiniz.

### Çıkış

&emsp;Bu bölüm ile güvenli bir şekilde çıkış yapabilirsiniz. Tam olarak aşağıdaki gibi bir ekran ile karşılacaksınız.

![image](https://user-images.githubusercontent.com/51250249/104236384-87b3bc00-5467-11eb-9c55-f47bc4130569.png)

Eğer yanlışlıkla girdiyseniz hayır buton ile geri dönebilirsiniz. Evet butonuna tıklarsanız çıkışınız gerçekleştirilecektir.


# Nasıl Çalıştırılır ?

&emsp;Betiğimiz bash üzerinde çalışacak şekilde tasarlanmıştır. Depoyla aynı dizinde iken:

    bash project.sh

komutu ile çalıştırabilirsiniz.  

Ayrıca project betiğine çalıştırabilme yetkisi(executable) verirseniz:

    chmod +x project.sh

aşağıdaki şekilde de çalıştırma imkanına sahip olabilirsiniz.

    ./project.sh

