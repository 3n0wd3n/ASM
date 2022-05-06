#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
// this library called pthread is used for creating the threads
#include <pthread.h>

/*

SPOUŠTĚNÍ souboru (v UBUNTU-18.04 WSL)

$ gcc paruniq.c -o paruniq --> budeme používat rozšířenou kompilace $ gcc -g -pthread paruniq.c -o paruniq
$ ./paruniq

KROKY pro splění úlohy

1. Do paměti počítače je načten celý obsah souboru.
    - ze standartního vstupu načíst řádky (echo -e "foo\nbar\nbaz\nfoo\nbar" | ./paruniq 2)
2. Soubor je v paměti rozdělen na přibližně stejně velké části.
3. V každé části jsou samostatným vláknem identifikovány unikátní řádky.
4. Poté, co skončí všechna vlákna svou činnost, jsou z jednotlivých dílčích částí vybrány unikátní řádky a ty vypsaný na standardní výstup

*/

void *routine()
{
    printf("Test from thread\n");
    sleep(2);
    printf("Ending thread\n");
}

// this simple function is making two threads salmultaniously and we can se this in terminal

int main(int argc, char *argv[])
{

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
