#include <cassert>
#include <cstdlib>
#include <cstdio>
#include <cstring>
#include <new>
#include <thread>
#include <vector>
thread_local volatile unsigned char result_sink;
__attribute__((noinline)) void exercise() {
 for(int i=0;i<100;i++) {
  auto p=static_cast<unsigned char*>(::operator new(13000));p[0]=17;p[12999]=23;result_sink=p[0];::operator delete(p);
  auto q=static_cast<unsigned char*>(malloc(13000));assert(q);memset(q,31,13000);assert(q[12999]==31);free(q);
 }
}
int main() {
 auto tiny=static_cast<unsigned char*>(calloc(32,1));assert(tiny && tiny[31]==0);tiny=static_cast<unsigned char*>(realloc(tiny,64));assert(tiny);free(tiny);
 std::vector<std::thread> workers;for(int i=0;i<4;i++)workers.emplace_back(exercise);
 for(auto &t:workers)t.join();
 puts("READY");fflush(stdout);getchar();return 0;
}
