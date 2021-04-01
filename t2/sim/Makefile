all: ngspice.log
	$(eval NGSFIGS=$(shell grep _FIG $< | sed 's/_FIG//g' | sed ':a;N;$!ba;s/\n/ /g'))
	$(eval NGSFIGPS=$(addsuffix .ps, $(NGSFIGS)))
	$(foreach i, $(NGSFIGPS), ps2pdf $i;)
	$(eval NGSTABS=$(shell grep _TAB $< | sed 's/_TAB//g' | sed ':a;N;$!ba;s/\n/ /g'))
	$(foreach i, $(NGSTABS), sed -n '/^$i_TAB/,/^$i_END/{p;/^$i_END/q}' $< | grep -v $i_TAB | grep -v $i_END | grep -v '#' | sed 's/\=/\&/g' | sed 's/$$/\\\\ \\hline/g' > $i_tab.tex;)

ngspice.log: ../sim/p1.net ../sim/p2.net ../sim/p3.net ../sim/p4.net ../sim/p5.net ../sim/data1.txt ../sim/data2.txt ../sim/data3.txt ../sim/data4.txt ../sim/data5.txt
	ngspice -b ../sim/p1.net -o p1.log
	ngspice -b ../sim/p2.net -o p2.log
	ngspice -b ../sim/p3.net -o p3.log
	ngspice -b ../sim/p4.net -o p4.log
	ngspice -b ../sim/p5.net -o p5.log

clean:
	@rm -f *.log *.tex *.pdf *.ps *~

.PHONY: all clean