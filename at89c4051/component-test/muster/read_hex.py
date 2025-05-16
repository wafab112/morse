#! /usr/bin/python3 
import argparse

def read(filename):
    f = open(filename, "r")

    content = f.read()

    lines = content.split("\n")

    write_data = {}

    for index, line in enumerate(lines):
        """
        :[BYTE_COUNT:1][ADDR:2][REC:1][BYTES:n][CHECK:1]
        """
        if line == "":
            continue

        byte_count = int(line[1:3], 16)

        addr = int(line[3:7], 16)

        record_type = int(line[7:9], 16)

        if record_type == 0:
            data = []
            for i in range(byte_count):
                byte = int(line[9+i*2 : 9+2+i*2], 16)
                data.append(byte)

            write_data[addr] = data
        elif record_type == 1:
            break

    max_index = max(write_data.keys())
    l = [0] * (max_index + len(write_data[max_index]))

    for (index, value) in write_data.items():
        length = len(value)
        for i in range(length):
            l[index + i] = value[i]

    return l

if __name__ == "__main__":
    parser = argparse.ArgumentParser(
            prog="read_hex.py",
            description="Reads a given hex file and returns information about it.")

    parser.add_argument("filename")
    parser.add_argument("-c", "--count", action = "store_true")

    args = parser.parse_args()

    l = read(args.filename)

    if args.count:
        print(len(l))
    else:
        print(l)
