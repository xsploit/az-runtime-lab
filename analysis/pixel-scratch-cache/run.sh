set -eu
AZ_SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
AZ_LAB_ROOT=${AZ_LAB_ROOT:-$(CDPATH= cd -- "$AZ_SCRIPT_DIR/../.." && pwd)}
export AZ_LAB_ROOT
cd "$AZ_LAB_ROOT/analysis/pixel-scratch-cache"
sha256sum "$AZ_LAB_ROOT/shims/ximage-packed24.h" ximage-packed24.h > baseline-hashes.txt
cmp "$AZ_LAB_ROOT/shims/ximage-packed24.h" ximage-packed24.h
uname -a > environment.txt
gcc --version >> environment.txt
cat /sys/class/thermal/thermal_zone0/temp > temperature-before.txt
gcc -O3 -Wall -Wextra -Werror test.c -lX11 -o test
./test > test-result.txt
gcc -O3 -Wall -Wextra -Werror edge.c -lX11 -o edge
./edge > edge-result.txt
gcc -O1 -g -fsanitize=address,undefined test.c -lX11 -o test-san
ASAN_OPTIONS=detect_leaks=0 ./test-san > sanitizer-result.txt 2>&1
gcc -O3 -Wall -Wextra -Werror -fPIC -shared -nostdlib -mno-outline-atomics -fno-stack-protector ximage-scratch.c -o ximage-fast24-candidate.so
gcc -O1 -g -fsanitize=address,undefined test-cache.c -pthread -o test-cache
ASAN_OPTIONS=detect_leaks=0 ./test-cache > cache-test.txt 2>&1
readelf -V ximage-fast24-candidate.so > abi.txt
gcc -O3 -Wall -Wextra -Werror bench.c -lX11 -o bench
./bench > benchmark.csv
cat /sys/class/thermal/thermal_zone0/temp > temperature-after.txt
cat test-result.txt edge-result.txt sanitizer-result.txt abi.txt
