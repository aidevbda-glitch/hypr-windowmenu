.PHONY: all build install clean

PKGNAME = hypr-windowmenu
PKGVER = 1.0.0

all: build

build:
	cp src/hypr-windowmenu .
	makepkg -f
	cp hypr-windowmenu src/

install: build
	sudo pacman -U $(PKGNAME)-$(PKGVER)-1-any.pkg.tar.zst

clean:
	rm -f $(PKGNAME)-*.pkg.tar.zst
	rm -rf pkg src/__pycache__
	cp src/hypr-windowmenu . || true
