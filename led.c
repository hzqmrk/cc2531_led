#include <cc2530.h>

void main() {
   P0SEL &= ~0x01;
   P1SEL &= ~0x02;

   P0DIR |= ~0x01;
   P1DIR |= ~0x02;

   P0 &= ~0x01;
   P1 |= 0x02;
}
