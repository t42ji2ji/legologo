#!/usr/bin/env sh
# 當發生錯誤時終止腳本運行
set -e
# 打包
npm run build

git add .
git commit -m 'update'
git push -u origin master
# 移動至到打包後的dist目錄 
cd dist
git checkout gh-pages
git add -f dist
git commit -m 'gp-pages update'
git subtree push --prefix dist origin gh-pages 
cd -
git checkout master