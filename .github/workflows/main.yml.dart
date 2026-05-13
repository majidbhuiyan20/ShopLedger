name: Build APK Fast

on:
  workflow_dispatch:
  push:
    branches:
      - main
      - master

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: Setup Java
        uses: actions/setup-java@v4
        with:
          distribution: 'zulu'
          java-version: '17'

      - name: Setup Flutter
        uses: subosito/flutter-action@v2
        with:
          flutter-version: '3.19.0' # Note: 3.38.3 is not a valid version; using 3.19.0 or 'any' is recommended
          channel: 'stable'
          cache: true

      - run: flutter pub get

      - run: flutter build apk --release --split-per-abi

      - name: Upload Artifact
        uses: actions/upload-artifact@v4
        with:
          name: app-release
          path: build/app/outputs/flutter-apk/app-release.apk

      - name: Push to Releases
        uses: ncipollo/release-action@v1
        with:
          artifacts: "build/app/outputs/flutter-apk/*.apk,build/app/outputs/bundle/release/*.aab,build/app/outputs/apk/profile/*.apk,build/ios/iphoneos/app.ipa"
          tag: v1.0.${{ github.run_number }}-${{ github.event.inputs.branch_name || 'main' }}
          token: ${{ secrets.TOKEN }}