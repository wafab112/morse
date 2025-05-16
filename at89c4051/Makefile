SRC_FILES := matrix.c
BUILD_DIR := ./build
INC_DIR := .

OBJS := $(SRC_FILES:%.c=${BUILD_DIR}/%.rel)

CFLAGS := -I${INC_DIR} --std-c11

MAIN_FILE := main.c

all: compile
	packihx ${BUILD_DIR}/app.ihx > ${BUILD_DIR}/app.hex	

compile: ${OBJS}
	sdcc ${MAIN_FILE} ${OBJS} -o ${BUILD_DIR}/app.ihx ${CFLAGS}

${OBJS}: ${SRC_FILES} build
	sdcc -c $< -o ${BUILD_DIR}/

build:
	mkdir build

clean:
	rm -rf build
