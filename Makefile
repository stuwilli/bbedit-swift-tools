TEXT_FILTER_EXECUTABLES := url-enc url-dec base64-enc base64-dec tidy url-explode
TEXT_FILTER_INSTALL_DIR := ~/Library/Mobile\ Documents/iCloud\~com\~barebones\~bbedit/Documents/Application\ Support/Text\ Filters

.PHONY: clean build install

all: build

debug:
	swift build

update:
	swift package update

build:
	swift build -c release --arch arm64 --arch x86_64

install: build
	mkdir -p $(TEXT_FILTER_INSTALL_DIR)
	$(foreach exec,$(TEXT_FILTER_EXECUTABLES), \
		cp -f .build/apple/Products/Release/$(exec) $(TEXT_FILTER_INSTALL_DIR) && \
		chmod +x $(TEXT_FILTER_INSTALL_DIR)/$(exec); \
	)

clean:
	rm -rf .build