#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
// this library called pthread is used for creating the threads
#include <pthread.h>

/*
SPOUŠTĚNÍ souboru (v UBUNTU-18.04 WSL)

$ gcc main2.c -o main2 --> budeme používat rozšířenou kompilace $ gcc -g -pthread main2.c -o main2
$ ./main2
*/

void* routine(){
    printf("Test from thread\n");
    sleep(2);
    printf("Ending thread\n");
}

// this simple function is making two threads salmultaniously and we can se this in terminal

int main(int argc, char* argv[]){
    printf("It lives\n");
    // thread_one stores the information about thread and its data typy is p_thread
    pthread_t thread_one, thread_two;
    // creating the thread
    pthread_create(&thread_one, NULL, &routine, NULL);
    pthread_create(&thread_two, NULL, &routine, NULL);
    // waiting untill exectuion is finished
    pthread_join(thread_one, NULL);
    pthread_join(thread_two, NULL);
    return 0;
}
