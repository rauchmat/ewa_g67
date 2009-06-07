#!/bin/sh

echo
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo "!!! Don't forget to update the WAR file !!!"
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo

GRP="67"
MNR1="0625039"
MNR2="0626140"
BSP="3"
FILENAME="UE${BSP}-AG_${GRP}_gruppe-${MNR1}-${MNR2}"

echo "Making directories ..."
mkdir ./UE${BSP} &> /dev/null
mkdir ./UE${BSP}/src &> /dev/null
mkdir ./UE${BSP}/WebContent &> /dev/null

echo "Cleaning directories ..."
rm -Rf ./UE${BSP}/src/*
rm -Rf ./UE${BSP}/WebContent/*

echo "Copying files ..."
cp -Rf ../UE${BSP}/src/* ./UE${BSP}/src/ > /dev/null
cp -Rf ../UE${BSP}/WebContent/* ./UE${BSP}/WebContent/ > /dev/null

echo "Creating ZIP ..."
zip -r -9 "${FILENAME}.zip" UE${BSP}/* -x "*.DS_Store" > /dev/null

echo
echo "Finished creating ${FILENAME}.zip"
echo