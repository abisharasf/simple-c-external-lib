IPREFIX ?=.
ODIR ?= build

lsrc = $(wildcard $(IPREFIX)/src/lib/*.c)
lobj = $(lsrc:$(IPREFIX)/src/lib/%.c=$(ODIR)/%.o)

.PHONY: default
default: $(ODIR)/libtestext.a

$(ODIR):
	mkdir -p $(ODIR)

$(ODIR)/%.o: $(IPREFIX)/src/lib/%.c | $(ODIR)
	$(CC) -c -o $@ $^

$(ODIR)/libtestext.a: $(lobj)
	ar rcs $@ $^

.PRECIOUS: $(ODIR)/%.o

.PHONY: dum
dum:
	echo $(lobj)

.PHONY: clean
clean:
	rm -rf build

