//ESTE ES UN EJEMPLO DE COMUNICACION MEDIANTE OSC ENTRE PROCESSING Y RESOLUME. 
//EN RESOLUME IR A PREFERENCES, OSC, ACTIVAR OSC, VER EN QUE PUERTO ESTA RECIBIENDO DATOS Y PONERLO EN EL SEGUNDO PARAMETRO DEL NETADRESS.
//TAMBIEN EN RESOLUME PRESIONAR CTRL+SHIFT+O PARA VER COMO SON LOS ADDRS A LOS QUE HAY QUE ENVIAR MENSAJES, YA ESTAN PUESTOS, ES LO QUE ESTA
//ENTRE COMILLAS COMO PARAMETRO DE LOS OSCMESSAGE
//EN RESOLUME PONGAN LOS VIDEOS EN MODO RESTART ASI CADA VEZ QUE ACCEDEN A UNO ESTE VUELVE A INICIARSE DESDE EL PRINCIPIO.


import netP5.*;
import oscP5.*;

OscP5 oscP5;
NetAddress locacionDeResolume;
OscMessage seleccionarVideoAResolume;

int numeroDeVideo=1;

void setup(){
  oscP5 = new OscP5(this,12000);
locacionDeResolume=new NetAddress("127.0.0.1",3333); // IP LOCAL, PUERTO QUE RECIBE DATOS RESOLUME
}

void draw(){
seleccionarVideoAResolume= new OscMessage("/composition/layers/3/clips/"+numeroDeVideo+"/connect");

}

void keyPressed(){

if(key=='1'){numeroDeVideo=1;}
if(key=='2'){numeroDeVideo=2;}
if(key=='3'){numeroDeVideo=3;}
if(key=='4'){numeroDeVideo=4;}
if(key=='5'){numeroDeVideo=5;}
oscP5.send(seleccionarVideoAResolume,locacionDeResolume);



}
