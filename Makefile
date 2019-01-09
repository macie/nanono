
TESTS_DIR="./test"
ASSERT="${TESTS_DIR}/assert.sh"
STUB="${TESTS_DIR}/stub.sh"

clean:
	echo "Remove all"

dev-dependencies:
	echo "Install dependencies"
	curl -sS -L 'https://raw.githubusercontent.com/lehmannro/assert.sh/master/assert.sh' > ${ASSERT}
	curl -sS -L 'https://raw.githubusercontent.com/jimeh/stub.sh/master/stub.sh' > ${STUB}

test:
	echo "Run tests"

.PHONY:	clean dev-dependencies test
