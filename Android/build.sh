#!/bin/bash

pluginName=AndroidNativePlugin

echo "start build "$pluginName"..."

# move folder
cd $pluginName

# build
echo "build "$pluginName
./gradlew "assembleRelease"

echo "build finished"
echo "copy android plugin to untiy..."

aarName=$pluginName"-release.aar"
buildPath=".//"$pluginName"/build/outputs/aar/"$aarName
unityPath="../../Unity/Assets/NativePopupPlugin/Plugins/Android/"$aarName

# copy plugin to unity
cp $buildPath $unityPath

echo "Done!"