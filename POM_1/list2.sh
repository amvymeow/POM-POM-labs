#!/bin/bash

function list {  
 echo -e "Название \t Расширение \t Изменено \t Размер  \t Путь \t Длительность"  >> "$div"/result1.xls
 for file in "$1"/*  #Цикл прохода по файлам
  do
  file_="${file##*/}" 
  if [ -d "$file" ] #проверка файл/папка
  then
   list "$file"
  else
   name="${file_%.[^.]*}" #
   extension="${file_##*.}"                                   #расширение
   last_change=$(date +%Y-%m-%d -r "$file" 2>/dev/null)       #Изменено
   size=$(wc -c 2>/dev/null <"$file" | awk '{print $1}' )     #Размер
   let "size = "$size"  /1024"                                #в Кб
   folder="${file%/*}"                                                 #путь
   duration=$(ffmpeg -i $file 2>&1 | grep Duration | awk '{print $2}') #Длительность
   echo -e "$name \t $extension \t $last_change \t $size "kB"  \t $folder \t $duration"  >> "$div"/result1.xls 
   fi
  done
}
                                
echo "Введите путь к папке"               
read div                                              
rm "$div/result1.xls"
if [ -d "$div" ]; then                                
  list "$div"                                         
else
  echo "Ошибка: Не является папкой"                            
fi
echo "Done."
