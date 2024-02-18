#!/bin/bash

target=/home/leviathan6/leviathan6
$target 0000

dir=$(mktemp -d)

echo $dir

cd $dir
touch output.log

for i in {9999..0000}
do
    # echo $i >> output.log
    res=$($target $i)
    echo $i 
    echo $res
    if [[ $res != *"Wrong"* ]]; then
        echo $i >> output.log
        echo $res >> output.log
        break
    fi
done

for i in {9999..1000}
do
    echo $i
done

