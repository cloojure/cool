#!/usr/bin/env bash

set -e

echo "Downloading and expanding tar"
curl -O https://download.clojure.org/install/clojure-tools-1.9.0.273.tar.gz
tar xzf clojure-tools-1.9.0.273.tar.gz

echo "Installing libs into /usr/local/lib/clojure"
mkdir -p /usr/local/lib/clojure
cp -f clojure-tools/deps.edn clojure-tools/example-deps.edn /usr/local/lib/clojure
mkdir -p /usr/local/lib/clojure/libexec
cp -f clojure-tools/clojure-tools-1.9.0.273.jar /usr/local/lib/clojure/libexec

echo "Installing clojure and clj into /usr/local/bin"
sed -i -e 's@PREFIX@/usr/local/lib/clojure@g' clojure-tools/clojure
cp -f clojure-tools/clojure clojure-tools/clj /usr/local/bin

echo "Removing download"
rm -rf clojure-tools
rm -rf clojure-tools-1.9.0.273.tar.gz

echo "Use clj -h for help."
