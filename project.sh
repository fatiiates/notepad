#!/bin/bash
DATABASE_NAME='data.txt'

fun_insert_data() {
  data=$(whiptail --inputbox "Lütfen kaydedilecek veriyi giriniz" 10 60 3>&1 1>&2 2>&3)
  exitStatus=$?
  if [ $exitStatus = 0 ]; then
    if [ -z "$data" ]; then
      whiptail --msgbox "Üzgünüm, kaydedilecek bir veri bulunamadı." 10 50
    else
      row_count="$(echo $data | xargs)"
      if [ -z "$row_count" ]; then
        whiptail --msgbox "Üzgünüm, boş veri kaydedilemez. Err-code: insert-1" 10 50
        return 0
      fi
      exitStatus=$?

      if [ $exitStatus -ne 0 ]; then
        whiptail --msgbox "Üzgünüm, bilinmeyen bir hata oluştu. Err-code: insert-2" 10 50
        return 0
      fi
      echo $data >>$DATABASE_NAME
      whiptail --msgbox "Veri kaydı başarılı." 10 50
    fi
  fi

  return 0
}

fun_search_data() {
  data=$(whiptail --inputbox "Lütfen aranacak kaydı giriniz" 10 60 3>&1 1>&2 2>&3)
  exitStatus=$?
  if [ $exitStatus = 0 ]; then
    if [ -z "$data" ]; then
      whiptail --msgbox "Üzgünüm, arama yapılacak bir veri bulunamadı." 10 50
    else
      if [ -s $DATABASE_NAME ]; then
        getData=$(timeout 10s cat $DATABASE_NAME | timeout 10s grep -n $data)
        exitStatus=$?
        echo $exitStatus
        if [ $exitStatus -ne 0 ]; then
          whiptail --msgbox "Kayıtlı bir veri bulunamadı." 10 50
          return 0
        fi
        whiptail --msgbox "İçerisinde '$data' geçen tüm kayıtlar:\n----------\nSatır Numarası:Veri\n----------\n${getData[@]}" 20 100
      else
        whiptail --msgbox "Üzgünüm, dosya içerisinde bir kayıt bulunmuyor." 10 60
      fi
    fi
  fi

  return 0
}

fun_search_all_data() {
  if [ -e $DATABASE_NAME ]; then
    if [ -s $DATABASE_NAME ]; then
      whiptail --textbox $DATABASE_NAME 20 100 --scrolltext
    else
      whiptail --msgbox "Üzgünüm, dosya içerisinde bir kayıt bulunmuyor." 10 60
    fi
  else
    whiptail --msgbox "Üzgünüm, bir kayıt dosyası bulunamadı." 10 50
  fi

  return 0
}

fun_delete_data() {
  data=$(whiptail --inputbox "Lütfen silmek istediğiniz veriyi giriniz" 10 60 3>&1 1>&2 2>&3)
  exitStatus=$?

  if [ $exitStatus = 0 ]; then
    if [ -z "$data" ]; then
      whiptail --msgbox "Üzgünüm, silmek için bir anahtar kelime verilmedi." 10 50
    else

      get_line_count_of_data=$(timeout 10s grep -c $data $DATABASE_NAME)
      exitStatus=$?

      if [ $exitStatus -ne 0 ]; then
        whiptail --msgbox "Üzgünüm, arama esnasında bir hata meydana geldi. Err-code: del-1" 10 50
        return 0
      fi

      if [ $get_line_count_of_data -eq 0 ]; then
        whiptail --msgbox "Üzgünüm, anahtar kelimeyi içeren bir dizge bulunmuyor." 10 50
        return 0
      fi

      if [ $get_line_count_of_data -gt 1 ]; then

        if (whiptail --title "Kayıtları Sil" --yesno "Anahtar kelime ile ilgili birden fazla kelime bulundu. Hepsi silinsin mi ?" 10 60); then
          get_data="$(timeout 10s grep -v $data $DATABASE_NAME)"
          exitStatus=$?

          if [ $exitStatus -ne 0 ]; then
            whiptail --msgbox "Üzgünüm, arama esnasında bir hata meydana geldi. Err-code: del-2" 10 50
            return 0
          fi

          echo "${get_data[@]}" >$DATABASE_NAME
          return 0
        fi

        get_data="$(timeout 10s grep -n $data $DATABASE_NAME)"
        exitStatus=$?

        if [ $exitStatus -ne 0 ]; then
          whiptail --msgbox "Üzgünüm, arama esnasında bir hata meydana geldi. Err-code: del-3" 10 50
          return 0
        fi
        radio_args=(
          --title "Kayıt Silme"
          --radiolist "Silmek istediğiniz kaydı seçiniz."
          30 80 $get_line_count_of_data
        )

        for row in $get_data; do
          row_count="$(timeout 10s cut -d ':' -f1 <<<"$row")"
          exitStatus=$?

          if [ $exitStatus -ne 0 ]; then
            whiptail --msgbox "Üzgünüm, verileri ayrıştırmada bir hata oluştu. Err-code: del-4" 10 50
            return 0
          fi
          row_data="$(timeout 10s cut -d ':' -f2 <<<"$row")"
          exitStatus=$?

          if [ $exitStatus -ne 0 ]; then
            whiptail --msgbox "Üzgünüm, arama esnasında bir hata meydana geldi. Err-code: del-5" 10 50
            return 0
          fi
          radio_args+=("$row_count" "$row_data")
          radio_args+=("off")
        done
        whiptail_out=$(whiptail "${radio_args[@]}" 3>&1 1>&2 2>&3)

        if [ -z "$whiptail_out" ]; then
          echo "İşlem iptal edildi."
        else
          get_data=($(timeout 10s cat $DATABASE_NAME))
          exitStatus=$?

          if [ $exitStatus -ne 0 ]; then
            whiptail --msgbox "Üzgünüm, veriler düzgün bir şekilde getirilemedi. Err-code: del-6" 10 50
            return 0
          fi
          unset 'get_data[--whiptail_out]'
          echo -n "" >$DATABASE_NAME
          for row in "${get_data[@]}"; do
            echo $row >>$DATABASE_NAME
          done
        fi
      else
        get_data="$(timeout 10s grep -v $data $DATABASE_NAME)"
        exitStatus=$?

        if [ $exitStatus -ne 0 ]; then
          whiptail --msgbox "Üzgünüm, arama esnasında bir hata meydana geldi. Err-code: del-7" 10 50
          return 0
        fi
        echo "${get_data[@]}" >$DATABASE_NAME
      fi
    fi
  fi

  return 0
}

fun_exit() {
  if (whiptail --title "Çıkış" --yesno "Çıkmak istediğinize emin misiniz ?" 10 38); then
    exit 0
  fi
}

while :; do
  clear
  echo "-------------------------------------"
  echo " Menü "
  echo "-------------------------------------"
  echo "[1] Bilgi Girişi"
  echo "[2] Kayıt Arama"
  echo "[3] Tüm Kayıtları Göster"
  echo "[4] Kayıt Sil"
  echo "[5] Çıkış"
  echo "======================="
  echo -n "Lütfen menüden seçim yapınız [1-5]: "
  read choice

  case $choice in
  1) fun_insert_data ;;
  2) fun_search_data ;;
  3) fun_search_all_data ;;
  4) fun_delete_data ;;
  5) fun_exit ;;
  *)
    echo "Dikkat!!! Lütfen 1,2,3,4,5 numaralarından birini tercih ediniz."
    echo "Yeni tercih için herhangi bir tuşa basmanız bekleniyor..."
    read
    ;;
  esac
done
