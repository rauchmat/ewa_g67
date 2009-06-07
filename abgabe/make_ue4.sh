#!/bin/sh

echo
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo "!!! Don't forget to update the WAR file !!!"
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo

GRP="67"
MNR1="0625039"
MNR2="0626140"
BSP="4"
FILENAME="UE${BSP}-AG_${GRP}_gruppe-${MNR1}-${MNR2}"

echo "Making directories ..."
mkdir ./UE${BSP} &> /dev/null
mkdir ./UE${BSP}/Bsp1 &> /dev/null
mkdir ./UE${BSP}/Bsp2 &> /dev/null
mkdir ./UE${BSP}/Bsp1/src &> /dev/null
mkdir ./UE${BSP}/Bsp1/WebContent &> /dev/null
mkdir ./UE${BSP}/Bsp2/src &> /dev/null
mkdir ./UE${BSP}/Bsp2/WebContent &> /dev/null

echo "Cleaning directories ..."
rm -Rf ./UE${BSP}/Bsp1/src/*
rm -Rf ./UE${BSP}/Bsp1/WebContent/*
rm -Rf ./UE${BSP}/Bsp2/src/*
rm -Rf ./UE${BSP}/Bsp2/WebContent/*

echo "Copying files ..."
cp -Rf ../UE${BSP}/Bsp1/src/* ./UE${BSP}/Bsp1/src/ > /dev/null
cp -Rf ../UE${BSP}/Bsp1/WebContent/* ./UE${BSP}/Bsp1/WebContent/ > /dev/null
cp -Rf ../UE${BSP}/Bsp2/src/* ./UE${BSP}/Bsp2/src/ > /dev/null
cp -Rf ../UE${BSP}/Bsp2/WebContent/* ./UE${BSP}/Bsp2/WebContent/ > /dev/null

echo "Removing libraries in source directory ..."
rm -Rf ./UE${BSP}/Bsp1/WebContent/WEB-INF/lib
rm -Rf ./UE${BSP}/Bsp2/WebContent/WEB-INF/lib

echo "Creating ZIP ..."
zip -r -9 "${FILENAME}.zip" UE${BSP}/* -x "*.DS_Store" > /dev/null

echo
echo "Finished creating ${FILENAME}.zip"
echo