POPTS=--katex --from=markdown --include-in-header=bits/head.html --include-after-body=bits/foot.html --to=revealjs --variable=revealjs-url:reveal.js --highlight-style=tango

pres.html: pres.mkd Makefile bits/*
	pandoc pres.mkd --standalone $(POPTS) --output=pres.html

PWD=$(shell pwd)

pres.pdf: pres.html
	wkhtmltopdf --javascript-delay 1400 --no-background -O Landscape file://${PWD}/pres.html?print-pdf pres.pdf

pres-bundled.html: pres.mkd Makefile bits/*
	pandoc pres.mkd --self-contained $(POPTS) --output=pres-bundled.html

.PHONY: clean
clean:
	rm pres.html pres.pdf pres-bundled.html

.PHONY: all
all: pres.html pres.pdf pres-bundled.html
