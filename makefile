.PHONY: all,clean

all: clean
	task project:books bibliography |head -n -2 > README.txt
	sed -i 's/Pending$$/-/g' README.txt
	task project:books burndown.monthly > burndown
	git add .
	git commit -m "$$(date)" || true

clean:
	rm -f README.txt burndown


publish: all
	git push
