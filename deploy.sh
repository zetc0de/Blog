#!/bin/bash

echo -e "\033[0;32mBackup updates to GitHub...\033[0m"
git add -A
msg="rebuilding site `date`" 
if [ $# -eq 1 ]
    then msg="$1"
fi
git commit -m "$msg"
git push origin master

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

ln -sf ~/img ~/Blog/static
# Genterate file statis
hugo # if using a theme, replace by `hugo -t <yourtheme>`

# pindah ke direktoru publik
cd public


# tambahkan perubahan ke Git
git add -A

# Buat sebuah commit baru
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push atau puload ke Github
git push origin master

# Balik ke direktori sebelumnya
cd ..
