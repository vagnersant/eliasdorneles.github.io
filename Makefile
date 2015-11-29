SHELL := /bin/bash
SITE_DIR := site
THEME_DIR := ./mytheme
OUTPUT_DIR := ./output

COMPILE := pelican ${SITE_DIR} -t ${THEME_DIR} -o ${OUTPUT_DIR} -s settings.py

.PHONY: clean compile

help:
	@echo To edit, run make server in one tab and make watch in another
	@echo
	@echo Available commands:
	@echo
	@echo publish - publish site in GitHub
	@echo server - start a server on output dir
	@echo watch - watch for changes and update static files
	@echo compile - generate site in output dir

compile:
	${COMPILE}

clean:
	rm -rf ${OUTPUT_DIR} cache

server: compile
	(cd ${OUTPUT_DIR} && python -m webbrowser http://localhost:8000 && python -m SimpleHTTPServer &)
	${COMPILE} --autoreload
