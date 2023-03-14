#!/bin/sh -eu

Version="0.0.4"
CPU=$(cat /proc/cpuinfo | grep -i "^model name" | awk -F ": " '{print $2}' | head -1 | sed 's/ \+/ /g')
flags=$(cat /proc/cpuinfo | grep flags | head -n 1 | cut -d: -f2)
Arch=$(uname -m)
Vendor=$(cat /proc/cpuinfo | grep vendor | uniq | awk -F ": " '{print $2}')

supports_v1='awk "/lm/&&/cmov/&&/cx8/&&/fpu/&&/fxsr/&&/mmx/&&/syscall/&&/sse2/{found=1} END {exit !found}"'
supports_v2='awk "/cx16/&&/lahf/&&/popcnt/&&/sse4_1/&&/sse4_2/&&/ssse3/ {found=1} END {exit !found}"'
supports_v3='awk "/avx/&&/avx2/&&/bmi1/&&/bmi2/&&/f16c/&&/fma/&&/abm/&&/movbe/&&/xsave/ {found=1} END {exit !found}"'
supports_v4='awk "/avx512f/&&/avx512bw/&&/avx512cd/&&/avx512dq/&&/avx512vl/ {found=1} END {exit !found}"'

echo "$CPU"
echo "$Vendor $Arch"
echo "$flags" | eval $supports_v1 || exit 1 && echo "CPU supports x86-64-v1"
echo "$flags" | eval $supports_v2 || exit 2 && echo "CPU supports x86-64-v2"
echo "$flags" | eval $supports_v3 || exit 3 && echo "CPU supports x86-64-v3"
echo "$flags" | eval $supports_v4 || exit 4 && echo "CPU supports x86-64-v4"
