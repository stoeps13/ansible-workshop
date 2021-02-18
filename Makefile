docs := $(wildcard *.adoc)
pdfs := $(docs:.adoc=.pdf)
htmls := $(docs:.adoc=.html)
optionspdf := -r asciidoctor-pdf -r asciidoctor-diagram -b pdf
optionshtml := -r asciidoctor-diagram
all: html pdf
pdf: $(pdfs)
html: $(htmls)
.PHONY: all pdf html

# Call asciidoctor to generate $@ from $^
%.pdf: %.adoc
	asciidoctor $^ $(optionspdf) -o build/pdf/$@

%.html: %.adoc
	asciidoctor-revealjs $^ $(optionshtml) -o build/html/$@
	rsync -avz --delete images/ build/html/images/
	rsync -avz --delete reveal.js/ build/html/reveal.js/
	cp custom.css* build/html/