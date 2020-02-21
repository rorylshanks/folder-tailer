#!/bin/bash
pkg app.js --targets=node12 -o build/folder-tailer-linux-amd64
pkg app.js --targets=node12-macos-x64 -o build/folder-tailer-macos-amd64
pkg app.js --targets=node12-win-x64 -o build/folder-tailer-win-amd64