#!/bin/bash

if [ $SHELL != /bin/bash ]; then
    bash $0
    exit $?
fi

. ./config.sh

function BuildBinary {
    binary=$1
    echo -e "building binary $binary"

    ca65 --cpu 6502 --verbose src/$binary/MAIN.s -o build/$binary.o --include-dir include
    ld65 -v -o build/$binary.bin build/$binary.o -C conf/xenon_disc.ld
}

function Build {
    for binary_path in src/*; do
        binary_name=$(basename $binary_path)

        if [ ! -e $binary_path/MAIN.s ]; then
            echo -e "ERROR: $binary_name must have a MAIN.s file!"
            exit 1
        fi

        if [ ! -e build/$binary_name.bin ] || (echo $@ | grep -q force) then
            BuildBinary $binary_name
        else
            for file in $binary_path/*; do
                if [ $file -nt build/$binary_name.bin ]; then
                    BuildBinary $binary_name
                    break
                fi
            done
        fi
    done

    echo "building disk"
    $BUILDXEN -o build/game.xen conf/buildxen.cfg
}

function Clean {
    rm build/*.{o,bin,xen}
}

if   [ -z $1 ];       then Build;
elif [ $1 == clean ]; then Clean;
elif [ $1 == force ]; then Build force;
fi
