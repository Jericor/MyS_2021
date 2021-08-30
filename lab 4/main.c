#include <stdio.h>
#include <stdlib.h>
#include <getopt.h>

// Estructura nodo en forma de lista enlazada
struct node {
    int id;
    int time;
    struct node * next;
    struct node * previous;
};
typedef struct node node;

// Función para crear un nuevo nodo
// Entrada: Nada
// Salida: Puntero al nod creado
node* newNode(){
    node* new = (node*)malloc(sizeof(node));
    new->id = 1;
    new->time = 0;
    new->next = NULL;
    new->previous = NULL;
    return new;
}

// Función para agregar un nuevo nodo a la lista enlazada
// Entrada: Nodo al cual se le agregará otro 
// Salida: El nodo original
node* addNode(node* actual){
    node* nextNode = (node*)malloc(sizeof(node));
    nextNode->id = (actual->id) + 1;
    nextNode->time = 0;
    nextNode->next = NULL;
    nextNode->previous = actual;
    actual->next = nextNode;
    return actual;
}

// Función que obtiene el largo de la lista enlazada
// Entrada: Nodo inicial de la lista
// Salida: Largo de la lista
int getLen(node* actual){
    int len = 0;
    while (actual != NULL){
        actual = actual->next;
        len += 1;
    }
    return len;
}

// Función que entrega el último nood de la lista enlazada
// Entrada: Nodo inicial de la lista
// Salida: Ultimo nodo de la lista
node* getLast(node* actual){
    while (actual->next != NULL){
        actual = actual->next;
    }
    return actual;
}

// Función que denota la ocurrencia del evento arrival o departure
// Entrada: Nodo de estado inicial
//          Timer del evento arrival
//          Timer del evento departure
//          Timer de la simulación
//          Flag que denota el tipo de evento
// Salida: El nuevo nodo actual despues del evento
node* event(node* state, int* arrival, int* departure, int* clock, int flag){
    if (flag){
        //REALIZA ARRIVAL
        *clock -= *arrival;
        *departure -=  *arrival;
        state->time += *arrival;
        if (state->next == NULL) {
            state = addNode(state);
        }
        state = state->next;
    }
    else{
        // REALIZA DEPARTURE
        *clock -= *departure;
        *arrival -= *departure;
        state->time += *departure;
        state = state->previous;
    }
    return state;
}

// Función que alcula la utilización del servidor en cuanto a los jobs
// Entrada: Nodo inicial de la cola
//          Tiempo de simulación
// Salida: Utilización del servidor
float utilization(node* actual, int simulation_time){
    float u = ( (float)1 - ( (float)actual->time / (float)simulation_time));
    return u;
}

// Función que calcula el largo promedio de la cola
// Entrada: Nodo inicial de la cola
//          Tiempo de simulación
// Salida: Largo promedio de la cola
float avrgLen(node* actual, int simulation_time){
    float sum = 0;
    while (actual != NULL){
        sum += (actual->id - 1) * actual->time;
        actual = actual->next;
    }
    float avrg = ((float)1 / (float)simulation_time) * sum;
    return avrg;
}

// Función que calcula el tiempo promedio de residencia de los jobs
// Entrada: Cantidad de departures realizados
//          Tiempo total de residencia de todos los jobs
// Salida: Tiempo de residencia promedio.
float avrgTime(int departures, int total_residence){
    float t = ((float)1/(float)departures) * (float)total_residence;
    return t;
}

// Bloque principal
int main(int argc, char *argv[]) {
    int opt;
    int arrival_rate;
    int departure_rate;
    int simulation_time;
 
    // Se toman los argumentos necesarios
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

    // Se crea el nodo inicial 
    node* state_zero = newNode();
    node* actual_state = state_zero;
    // Se inicializan los tiempos iniciales
    int arrival_timer = arrival_rate;
    int departure_timer = 0;
    int simulation_clock = simulation_time;
    // Se inicializan los valores iniciales
    int arrivals = 0;
    int departures = 0;
    int total_residence = 0;
    int arrival_flag = 0;
    // Mientras el reloj no haya terminado
    while (simulation_clock >= 0){
        // Si el estado actual es uno la cola esta vacía (No pueden haber departures)
        if (actual_state->id == 1) {
            // Si el tiempo de la simulación es menor al tiempo del siguiente arrival
            if (simulation_clock < arrival_timer) {
                // SE TERMINA LA SIMULACIÓN
                // Se actualizan los datos
                total_residence += (actual_state->id - 1) * simulation_clock; 
                actual_state->time += simulation_clock;
                simulation_clock -= simulation_clock;
                simulation_clock -= 1;                
            }
            // Si queda tiempo de simulación ocurre un arrival
            else{
                // Se actualizan los datos
                total_residence += (actual_state->id - 1) * arrival_timer;
                actual_state = event(actual_state, &arrival_timer, &departure_timer, &simulation_clock, 1);
                arrival_timer = arrival_rate;
                if (actual_state->id == 2) departure_timer = departure_rate;
                arrivals += 1;
            }
        }
        // Si la cola no está vacía
        else{
            // Si el tiempo de simulación es menor al tiempo del siguiente arrival y al tiempo del siguiente departure
            if (simulation_clock < arrival_timer && simulation_clock < departure_timer){
                // TERMINA LA SIMULACIÓN
                // Se actualizan los datos
                total_residence += (actual_state->id - 1) * simulation_clock;
                actual_state->time += simulation_clock;
                simulation_clock -= simulation_clock;
                simulation_clock -= 1;
            }
            // Si queda tiempo en la simulación
            else{
                // Si el tiempo del siguiente arrival es menor al del siguiente departure se cambia el flag
                if (arrival_timer < departure_timer) arrival_flag = 1;
                // Ocurre el evento
                actual_state = event(actual_state, &arrival_timer, &departure_timer, &simulation_clock, arrival_flag);                
                // Se actualizan los datos
                if (arrival_flag) {
                    total_residence += (actual_state->id - 2) * arrival_timer;                
                    arrival_timer = arrival_rate;
                    arrivals += 1;
                }
                else {
                    total_residence += (actual_state->id) * departure_timer;
                    if (actual_state->id == 1) departure_timer = 0;
                    else departure_timer = departure_rate;
                    departures += 1;
                }
            }
        }
        arrival_flag = 0;
    }

    // Se muestra la información pedida por pantalla
    printf("Numero de clientes que llegaron: %d\n", arrivals);
    printf("Numero de clientes que salieron: %d\n", departures);
    printf("Tiempo total de cola vacia: %d\n", state_zero->time);
    printf("Largo maximo de la cola: %d\n", getLen(state_zero) - 1);
    printf("Tiempo total de cola largo maximo: %d\n", getLast(state_zero)->time);
    printf("Utilizacion: %f\n", utilization(state_zero, simulation_time));
    printf("Largo promedio de la cola: %f\n", avrgLen(state_zero, simulation_time));
    printf("Tiempo promedio de residencia: %f\n", avrgTime(departures, total_residence));
    printf("\n");
}