#!/bin/bash

qemu-system-i386 -drive format=raw,file=mboot.bin -net none
