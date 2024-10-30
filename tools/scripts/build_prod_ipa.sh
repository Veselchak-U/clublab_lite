flutter build ipa --dart-define-from-file=tools/configs/prod_config.json

BUILD_VER=`grep ^"version: " pubspec.yaml | cut -b 10-`
mkdir -p build_artifacts
mv build/ios/ipa/clublab-lite.ipa build_artifacts/clublab-lite-$BUILD_VER-prod.ipa
