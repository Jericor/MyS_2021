#include <stdio.h>
#include <getopt.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
    int opt;
    int arrival_rate;
    int departure_rate;
    int simulation_time;
 
    while((opt = getopt(argc, argv, "a:d:t:")) != -1) { 
        switch(opt) { 
            case 'a': ;
                arrival_rate = atoi(optarg);
                break; 
            case 'd': ;
                departure_rate = atoi(optarg);
                break; 
            case 't': ;
                simulation_time = atoi(optarg);
                break; 
        } 
    }
    printf("a %d\n", arrival_rate);
    printf("d %d\n", departure_rate);
    printf("t %d\n", simulation_time);
    
}