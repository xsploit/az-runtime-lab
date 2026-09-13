#include <cassert>
#include <cstdio>
#include <cstdlib>
#include <new>
#include <cstdint>
int main(){
 const size_t m=1024*1024;
 auto a=(unsigned char*)malloc(16*m);assert(a);a[0]=19;a[16*m-1]=23;
 auto b=(unsigned char*)calloc(8,2*m);assert(b&&b[0]==0&&b[16*m-1]==0);
 a=(unsigned char*)realloc(a,32*m);assert(a&&a[0]==19&&a[16*m-1]==23);
 auto c=new unsigned char[10*m]; c[0]=11;
 auto d=::operator new(12*m);assert(d);
 auto e=new(std::nothrow) unsigned char[14*m];assert(e);
 auto f=::operator new(18*m,std::nothrow);assert(f);
 volatile size_t impossible=SIZE_MAX/4;
 bool threw=false;
 try { void *unexpected=::operator new(impossible); ::operator delete(unexpected); }
 catch(const std::bad_alloc&) { threw=true; }
 assert(threw);
 auto failed=::operator new(impossible,std::nothrow);assert(failed==nullptr);
 puts("READY");fflush(stdout);getchar();
 free(a);free(b);delete[] c;::operator delete(d);delete[] e;::operator delete(f);
}
