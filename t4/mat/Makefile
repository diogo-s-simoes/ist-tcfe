octave.log: octme.m
	octave octme.m > oct.log
	$(eval NGSFIGS=$(shell grep _FIG oct.log | sed 's/_FIG//g' | sed ':a;N;$!ba;s/\n/ /g'))
	$(eval NGSFIGPS=$(addsuffix .ps, $(NGSFIGS)))
	$(foreach i, $(NGSFIGPS), eps2pdf $i;)
	$(eval NGSTABS=$(shell grep _TAB oct.log | sed 's/_TAB//g' | sed ':a;N;$!ba;s/\n/ /g'))
	$(foreach i, $(NGSTABS), sed -n '/^$i_TAB/,/^$i_END/{p;/^$i_END/q}' oct.log | grep -v $i_TAB | grep -v $i_END | grep -v '#' | sed 's/\=/\&/g' | sed 's/$$/\\\\ \\hline/g' > $i_tab.tex;)

clean:
	@rm -f *.log *.tex octave-workspace *.eps *~

.PHONY: clean
