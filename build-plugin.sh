#!bin/bash

# 서브모듈 업데이트
echo "git submodule update..."
git submodule update

# iOS 빌드
echo "build ios plugin..."
cd ios-native-popup
sh xcodebuild-script.sh

# iOS 플러그인 복사
echo "copy ios plugin to unity plugin path"
cd ..
frameworkName="NativePopup.framework"
iOS_build_path="ios-native-popup/NativePopup/"$frameworkName
unity_iOS_path="com.yeosu0107.nativepopup/Plugins/iOS/"

cp -r $iOS_build_path $unity_iOS_path

echo "delete ios plugin in ios directory"
rm -rf $iOS_build_path