#include "stdio.h"
#include "io.h"
#include "system.h"
int main(){
	int y;
	for(int i = 100; i > 0; i--) {
		IOWR(MIRORNUMBER_0_BASE, 0, i);
		y = IORD(MIRORNUMBER_0_BASE, 1);
		if(y){
			printf("%d", i);
		}
	}
return 0;
}
