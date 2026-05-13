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

      - run: flutter build apk --release

      - name: Upload Artifact
        uses: actions/upload-artifact@v4
        with:
          name: app-release
          path: build/app/outputs/flutter-apk/app-release.apk