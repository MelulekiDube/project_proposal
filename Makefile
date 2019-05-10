COMPILER = pdflatex
BUILDDIR = build
INCLUDEDIR = sections
OUTPUT = proposal.pdf
SRC = proposal.tex
INCLUDE_SRC = $(wildcard $(INCLUDEDIR)/*.tex)
TEX_OPT = -halt-on-error -output-directory $(BUILDDIR)

.PHONY: compile clean

compile: $(OUTPUT)

clean:
	rm -rf $(OUTPUT) $(BUILDDIR) *.gz *.out *.bbl *.log *.aux *.bblg

$(OUTPUT): $(SRC) $(INCLUDE_SRC) $(DIAGRAM_OBJS) | $(BUILDDIR)
	$(COMPILER) $(TEX_OPT) $<
	$(COMPILER) $(TEX_OPT) $(SRC)
	cp $(BUILDDIR)/$(OUTPUT) $(OUTPUT)
	
$(BUILDDIR):
	mkdir $(BUILDDIR)
