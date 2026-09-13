/* Private opt-in TX snapshots. Never wait for a reader or retry a full queue. */
#include <sys/socket.h>
#include <sys/un.h>
#ifndef LAB_MIXER_TX_PATH
#define LAB_MIXER_TX_PATH "/tmp/mixer-tx.sock"
#endif
static void lab_mixer_tx_datagram(const void *packet){
 static atomic_flag lock=ATOMIC_FLAG_INIT;
 static int output=-1;
 if(atomic_flag_test_and_set(&lock))return;
 int saved=errno;
 if(output<0)output=socket(AF_UNIX,SOCK_DGRAM|SOCK_NONBLOCK|SOCK_CLOEXEC,0);
 if(output>=0){
  struct sockaddr_un address={.sun_family=AF_UNIX};
  strcpy(address.sun_path,LAB_MIXER_TX_PATH);
  (void)sendto(output,packet,128,MSG_DONTWAIT|MSG_NOSIGNAL,(struct sockaddr*)&address,sizeof(address));
 }
 errno=saved;atomic_flag_clear(&lock);
}
