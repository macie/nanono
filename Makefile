
TESTS_DIR := ./test
BIN_DIR := ${TESTS_DIR}/.bin
ASSERT := ${BIN_DIR}/assert.sh
STUB := ${BIN_DIR}/stub.sh

clean:
	@echo "Remove all"

prepare:
	if ! [ -d "${BIN_DIR}" ]; then mkdir -p "${BIN_DIR}"; fi
	curl -sS -L 'https://raw.githubusercontent.com/lehmannro/assert.sh/master/assert.sh' > "${ASSERT}"
	curl -sS -L 'https://raw.githubusercontent.com/jimeh/stub.sh/master/stub.sh' > "${STUB}"

test: prepare
	@echo "Run tests"

.PHONY:	clean prepare test
