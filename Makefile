pres.html: pres.mkd Makefile bits/*
	pandoc pres.mkd --standalone --katex --from=markdown --include-in-header=bits/head.html --include-after-body=bits/foot.html --to=revealjs --variable=revealjs-url:reveal.js --output=pres.html --highlight-style=tango
