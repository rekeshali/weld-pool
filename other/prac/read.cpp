#include <stdio.h>

char buff[40];
int M;
double k;

//void prinny(char i){
 //   if(i == "c"){
   //     printf("%s char \n", buff);
   // }else if(i == "i"){
    //    printf("%s int \n", M);
   // }else if(i == "d"){
    //    printf("%s double \n", k);
    //}
//}

int main(){
    int N, P;

    FILE * in;
    in = fopen("input", "r");

    fgets(buff, 255, (FILE * )in);
    printf("%s 12 \n", buff);

    fgets(buff, 255, in);
    printf("%s 32 \n", buff);

    fscanf(in, "%s", buff);
    printf("%s ", buff);

    fscanf(in, "%i", &M);
    printf("%i \n", M);

    fscanf(in, "%s\t%i", buff, &M);
    printf("%s, %i\n", buff, M);

   fscanf(in, "%s %i", buff, &M);
    printf("%s, %i\n", buff, M);

    fscanf(in, "  ");

    fgets(buff, 255, in);
    printf("%s", buff);

    fclose(in);
    return 0;
}
