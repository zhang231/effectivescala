#MMDOPTS = --process-html

all: effectivescala.html

%.html: %.mo
	cat $< | bash proc.sh | bash toc.sh | bash fmt.sh | markdown > $@

%.ps: %.pic
	9 pic $< | 9 troff | 9 tr2post | 9 psfonts > $@

%.eps: %.ps
	rm -f $@
	ps2eps -f $< $@

%.png: %.eps
	convert -density 150 $< $@

%.proof: %.pic
	9 pic $< | 9 troff | 9 proof

clean:
	rm effectivescala.html 

.PHONY: all clean
