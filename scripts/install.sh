#!/bin/bash

#bundle install --path=vendor/bundle

if ! diff Cartfile.resolved Carthage/Cartfile.resolved &>/dev/null; then
  carthage bootstrap --platform ios
  cp Cartfile.resolved Carthage
fi
