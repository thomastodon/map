#!/usr/bin/env sh

curl -o Firebase.zip -L https://dl.google.com/firebase/sdk/ios/3_11_0/Firebase-3.11.0.zip
unzip -o Firebase.zip
mkdir -p ./map/firebase/
cp -rf ./Firebase/Auth/*.framework ./map/firebase
cp -rf ./Firebase/Analytics/*.framework ./map/firebase
cp -rf ./Firebase/Firebase.h ./map/firebase
cp -rf ./Firebase/module.modulemap ./map/firebase
rm -rf Firebase/ Firebase.zip

