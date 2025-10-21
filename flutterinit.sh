#!/bin/sh

set -e

echo Cleaning project...
flutter clean 2>&1 >/dev/null
flutter pub get

echo Updating Pod...
pod repo update

if ! ( "${PWD##*/}" == 'ios')
    then cd ios
fi

echo Removing pod files...
rm -rf Podfile.lock Pods/ 2>&1 >/dev/null

cd ..

echo Removing cached flutter dependency files...
rm -rf .packages .flutter-plugins 2>&1 >/dev/null

echo Getting all flutter packages...
flutter packages get

cd ios

echo Running pod install...
pod install

cd ..

echo Generate files...
flutter pub run build_runner build --delete-conflicting-outputs

echo analyze code...
flutter analyze --no-fatal-warnings

echo test
flutter test

echo DONE!

echo run project and follow the instructions to select your emulator
flutter run --profile
