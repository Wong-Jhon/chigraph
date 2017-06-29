#!/bin/bash

set -xe

if [ "$TRAVIS_OS_NAME" == "linux" ]; then
	
	apt-get update && apt-get install $PACKAGES \
		llvm-${LLVM_VERSION}-dev libclang-${LLVM_VERSION}-dev \
		libclang-common-${LLVM_VERSION}-dev ninja-build \
		libedit-dev build-essential
	
	if [ "$LLVM_VERSION" == "3.9" ] || [ "$LLVM_VERSION" == "4.0" ]; then
		apt-get install liblldb-${LLVM_VERSION}-dev
	else
		apt-get install lldb-${LLVM_VERSION}-dev
	fi
else

	brew install cmake ninja || echo
	brew install llvm --with-clang
		
fi
	


