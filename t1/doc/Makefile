# ---------------------------------------------------------
# type the "make" command to create report.pdf 
# ---------------------------------------------------------

#doc name
FILE=report

#list of LibreOffice Draw files
LODFIGS = $(patsubst %.odp,%.pdf,$(wildcard *.odp))

all: $(FILE).pdf
	evince $< &

$(FILE).pdf: $(wildcard *.tex) $(LODFIGS)
	pdflatex -interaction=nonstopmode $(FILE).tex
	pdflatex -interaction=nonstopmode $(FILE).tex
	pdflatex -interaction=nonstopmode $(FILE).tex
	pdflatex -interaction=nonstopmode $(FILE).tex
	pdflatex -interaction=nonstopmode $(FILE).tex
	pdflatex -interaction=nonstopmode $(FILE).tex
	pdflatex -interaction=nonstopmode $(FILE).tex
	pdflatex -interaction=nonstopmode $(FILE).tex
	pdflatex -interaction=nonstopmode $(FILE).tex


#convert libreoffice draw figures to pdf
%.pdf: %.odp
	soffice --headless --convert-to pdf $<

clean:
	@rm -rf *.aux *.bbl *.blg *.glg *.glo *.gls *.ilg *.ist *.lof
	@rm -rf *.log *.lot *.nlo *.nls *.out *.toc *~ *.*% ./*.pdf ./*.eps

.PHONY: all clean


