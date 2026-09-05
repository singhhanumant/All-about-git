#include<stdio.h>
#include"my_headers.h"



#define PI 3.14

int main()
{
printf("-----Makefile_Test Branch-----\n");
printf("-----Ethernet Feature Enabled----\n");
printf("-----Display Feature Enabled----\n");
	int x = 20;
	int y = 10;

	printf("Enter First Val : ");
	scanf("%d",&x);

	printf("Enter Second Val : ");
	scanf("%d",&y);

	printf("%d+%d : %d\n",x,y,add(x,y));
	printf("%d-%d : %d\n",x,y,sub(x,y));
	return 0;
}

