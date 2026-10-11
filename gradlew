#!/usr/bin/env sh
# Lightweight Gradle bootstrapper for this project. Downloads Gradle 8.9 if missing.
set -eu
VERSION=8.9
BASE="${GRADLE_USER_HOME:-$HOME/.gradle}/world-profession-hub"
GRADLE_HOME="$BASE/gradle-$VERSION"
if [ ! -x "$GRADLE_HOME/bin/gradle" ]; then
  mkdir -p "$BASE"
  ZIP="$BASE/gradle-$VERSION-bin.zip"
  echo "Downloading Gradle $VERSION (first run only)..."
  if command -v curl >/dev/null 2>&1; then
    curl -fL "https://services.gradle.org/distributions/gradle-$VERSION-bin.zip" -o "$ZIP"
  elif command -v wget >/dev/null 2>&1; then
    wget "https://services.gradle.org/distributions/gradle-$VERSION-bin.zip" -O "$ZIP"
  else
    echo "ERROR: curl or wget is required to download Gradle." >&2; exit 1
  fi
  unzip -oq "$ZIP" -d "$BASE"
  rm -f "$ZIP"
fi
exec "$GRADLE_HOME/bin/gradle" "$@"
