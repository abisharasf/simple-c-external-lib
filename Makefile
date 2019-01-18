IPREFIX ?=.
ODIR ?= build

lsrc = $(wildcard $(IPREFIX)/src/lib2/*.c)
lobj = $(lsrc:$(IPREFIX)/src/lib2/%.c=$(ODIR)/%.o)

.PHONY: default
default: $(ODIR)/libexttest.a

$(ODIR):
	mkdir -p $(ODIR)

$(ODIR)/%.o: $(IPREFIX)/src/lib2/%.c | $(ODIR)
	$(CC) -c -o $@ $^

$(ODIR)/libexttest.a: $(lobj)
	ar rcs $@ $^

.PRECIOUS: $(ODIR)/%.o

.PHONY: dum
dum:
	echo $(lobj)

.PHONY: clean
clean:
	rm -rf build

