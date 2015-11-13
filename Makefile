#
# iOS date-time picker top-level makefile
#

LIB_DIR='CTDateTimePicker'
BIND_DIR='CTDateTimePickerBindings'

all: bindings

lib:
	$(MAKE) -C $(LIB_DIR)

bindings: lib
	$(MAKE) -C $(BIND_DIR)

clean:
	$(MAKE) -C $(LIB_DIR) $@
	$(MAKE) -C $(BIND_DIR) $@

.PHONY: all clean

.SILENT: clean
