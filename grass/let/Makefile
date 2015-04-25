# $Id: Makefile.dist,v 1.3 2008/09/14 09:54:09 ksk Exp $

OCAMLC = ${shell which ocamlc.opt ocamlc | head -1}

OCAMLOPT = ${shell which ocamlopt.opt ocamlopt | head -1}
OCAMLDEP = ${shell which ocamldep.opt ocamldep | head -1}
OCAMLLEX = ${shell which ocamllex}
OCAMLYACC = ${shell which ocamlyacc}

SRCS_LEX = lexLet.mll lexGrass.mll
SRCS_YACC = yaccLet.mly yaccGrass.mly
SRCS_PARSER = $(SRCS_YACC:.mly=.ml) $(SRCS_LEX:.mll=.ml)

SRCS_BYHAND = print.ml extSetMap.ml common.ml parse.ml \
		grass.ml let.ml eval.ml compile.ml decompile.ml
SRCS = $(SRCS_BYHAND) $(SRCS_PARSER) 
SRCS_DEPEND = $(SRCS) $(SRCS_YACC:.mly=.mli)
OBJS = $(SRCS:.ml=.cmo) 
OPTS = $(SRCS:.ml=.cmx) 

all: glid.bin 

opt: glid.opt

glid.opt: glid.cmxa main.ml
	$(OCAMLOPT) -o $@ $^

glid.bin: glid.cma main.ml
	$(OCAMLC) -o $@ $^

glid.cma: $(OBJS)
	$(OCAMLC) -o $@ -a $^

glid.cmxa: $(OPTS)
	$(OCAMLOPT) -o $@ -a $^

depend: $(SRCS_DEPEND)
	$(OCAMLDEP) $^ > depend

-include depend

.SUFFIXES: .ml .mli .mly .mll .cmi .cmo .cmx

.ml.cmo: ; $(OCAMLC) -c $<
.ml.cmx: ; $(OCAMLOPT) -c $<
.mli.cmi: ; $(OCAMLC) -c $<
.mly.mli: ; $(OCAMLYACC) $<
.mly.ml: ; $(OCAMLYACC) -v $<
.mll.ml: ; $(OCAMLLEX) $<

clean:
	rm -rf *~ *.cm* *.output *.opt *.bin *.o *.a $(SRCS_PARSER) depend
