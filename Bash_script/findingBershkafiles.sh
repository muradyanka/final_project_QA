#!/bin/bash
echo "Привет. Я программа, которая по словосочетнию находит необходимый файл. Укажи путь, по которому ты хочешь начать поиск."
read path_to_folder
echo "Ты указал путь $path_to_folder. Теперь укажи слово/словосочетание, по которому хочешь найти файл."
read word_file
echo "Теперь укажите путь, по которому будет создана новая папка"
read new_folder_path
echo "Введите название новой папки"
read new_folder_name
full_new_path="$new_folder_path/$new_folder_name"
mkdir $full_new_path
echo "Папка создана $full_new_path"
grep -ril --exclude="searching.txt" "$word_file"  "$path_to_folder" > searching.txt
if [ -s searching.txt ]; then
  cp "$(cat searching.txt)" "$full_new_path"
  echo "Файл найден и скопирован"
else 
  echo "Файл не найден"
  rm -f searching.txt
fi
