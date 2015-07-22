# Makefile

SHELL := sh -e

SCRIPTS =	"debian/postinst configure" \
		"debian/postrm remove" \

all: test build

test:

	@echo -n "\n===== Comprobando posibles errores de sintaxis en los scripts de mantenedor =====\n"

	@for SCRIPT in $(SCRIPTS); \
	do \
		echo -n "$${SCRIPT}\n"; \
		bash -n $${SCRIPT}; \
	done

	@echo -n "¡TODO BIEN!\n=================================================================================\n\n"

build:

	@echo ¡Nada para compilar!

install:

	mkdir -p $(DESTDIR)/usr/share/icons/default/
	cp -r canaima-iconos canaima-cursores $(DESTDIR)/usr/share/icons/

uninstall:

	rm -rf $(DESTDIR)/usr/share/icons/canaima-cursores/
	rm -rf $(DESTDIR)/usr/share/icons/default/
	rm -rf $(DESTDIR)/usr/share/icons/canaima-iconos/

clean:

distclean:

reinstall: uninstall install
