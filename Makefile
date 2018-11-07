EMAIL    := hungchun.li@yahoo.com
USER     := "icdop"
CONFIG   := "../runconfig.sh"

config: $(CONFIG)
	cp src/Makefile ../

$(CONFIG):
	echo "" > $(CONFIG)
	echo "#!/bin/sh" >> $(CONFIG)
	echo "git config --global user.email $(EMAIL)" >> $(CONFIG)
	echo "git config --global user.name  $(USER)" >> $(CONFIG)
	chmod +x $(CONFIG)

clean:
	rm -f $(CONFIG)

