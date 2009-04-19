#!/bin/sh

echo
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo "!!! Don't forget to update the WAR file !!!"
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo

GRP="67"
MNR1="0625039"
MNR2="0626140"
BSP="2"
FILENAME="UE${BSP}-AG_${GRP}_gruppe-${MNR1}-${MNR2}"

echo "Making directories ..."
mkdir ./UE2 &> /dev/null
mkdir ./UE2/src &> /dev/null
mkdir ./UE2/WebContent &> /dev/null

echo "Cleaning directories ..."
rm -Rf ./UE2/src/*
rm -Rf ./UE2/WebContent/*

echo "Copying files ..."
cp -Rf ../UE2/src/* ./UE2/src/ > /dev/null
cp -Rf ../UE2/WebContent/* ./UE2/WebContent/ > /dev/null

echo "Creating ZIP ..."
zip -r -9 "${FILENAME}.zip" UE2/* -x "*.DS_Store" > /dev/null

echo
echo "Finished creating ${FILENAME}.zip"
echo