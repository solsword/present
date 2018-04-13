pres.html: pres.mkd Makefile bits/*
	pandoc pres.mkd --standalone --katex --from=markdown --include-in-header=bits/head.html --include-after-body=bits/foot.html --to=revealjs --variable=revealjs-url:reveal.js --output=pres.html --highlight-style=tango

PWD=$(shell pwd)

pres.pdf: pres.html
	wkhtmltopdf --javascript-delay 1400 --no-background -O Landscape file://${PWD}/pres.html?print-pdf pres.pdf

pres-bundled.html: pres.html
	inliner -m pres.html > pres-bundled.html
