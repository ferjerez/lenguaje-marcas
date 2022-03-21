ArrayList <Bola> pelotas; //Pelota es una variable de tipo bola /Declaración / Lo que quiero

Nave minave;
PImage sprite; //Imagen Meteorito
ArrayList<Explosion> booms;
ArrayList<Disparo> balas;
PImage spriteBala1;
PImage spriteBala2;

PImage spriteNave;
PImage spriteExplosion;

int milisegundos = millis();  //Reloj
int segundos =0;
int minutos =0;
int RecordMin = 0;
int RecordSeg = 0;
int RecordMils = 0;

void setup() {    //Se repite una vez
  size(800, 800);

  sprite= loadImage("Imagenes/MeteoritoF.png");

  pelotas = new ArrayList <Bola>();

  for (int i = 0; i<100; i++) {  //Añade a la lista las 100 bolas
    pelotas.add(new Bola());
  }

  imageMode(CENTER);

  spriteBala1 = loadImage("data/bullet1.png");
  spriteBala2 = loadImage("data/bullet2.png");
  spriteNave = loadImage("data/ship1.png");
  spriteExplosion = loadImage("data/explosion_animation.png");

  balas = new ArrayList<Disparo>();
  booms = new ArrayList<Explosion>();

  noCursor();
  minave= new Nave();
}


void draw() {     //Se repite constantemente(60FPS)

  background(0); 
  minave.dibuja();
  for (int i = 0; i<pelotas.size(); i++) {
    //mueve
    pelotas.get(i).mueve();

    //rebota
    pelotas.get(i).rebota();

    //dibuja
    pelotas.get(i).dibuja();
  }

  for (int i = 0; i<booms.size(); i++) {

    booms.get(i).dibuja();
  }


  // borrar lo que sale fuera
  for (int i=booms.size()-1; i>=0; i--) {
    if (booms.get(i).vivo==false) {
      booms.remove(i);
    }
  }
  for (int j= 0; j<pelotas.size(); j++) {
    if (dist(minave.x, minave.y, pelotas.get(j).x, pelotas.get(j).y)<20) {
      minave.vivo = false;
    }
  }


  for (int i = 0; i<balas.size(); i++) {      //colision balas con las pelotas
    for (int j= 0; j<pelotas.size(); j++) {
      if (dist(balas.get(i).x, balas.get(i).y, pelotas.get(j).x, pelotas.get(j).y)<20) {    

        booms.add(new Explosion(balas.get(i).x, balas.get(i).y));
        balas.remove(i);  //se borra
        pelotas.remove(j); //se borra
        pelotas.add(new Bola()); //Se añade la bola
      }
    }
  }

  for (int i = 0; i<balas.size(); i++) {

    balas.get(i).mueve();
    balas.get(i).dibuja();

    if (balas.get(i).y < 150) {
      booms.add(new Explosion(balas.get(i).x, balas.get(i).y));
      balas.get(i).vivo=false;  // borro la bala
    }
  }


  // borrar lo que sale fuera
  for (int i=balas.size()-1; i>=0; i--) {
    if (balas.get(i).vivo==false) {
      balas.remove(i);
    }
  }
  if (minave.vivo == false) {
    PantallaMuerte();
  } else if (minave.vivo == true) {
    Reloj();
    DibujaReloj();
  }


  text(""+round(frameRate), 0, height);
  Record();
}


void mousePressed() {


  balas.add(  new Disparo(mouseX, mouseY-20, spriteBala2) );
  balas.add(  new Disparo(mouseX-10, mouseY-10, spriteBala1) );
  balas.add(  new Disparo(mouseX+10, mouseY-10, spriteBala1) );
}

void keyPressed() {
  if (minave.vivo ==false) {
  }
  if (key == ' ') {
    minave.vivo = true;
  }
}

void PantallaMuerte() {
  background(255);
  fill(235, 64, 52);
  textAlign(CENTER, CENTER);
  textSize(25);
  text("GAME OVER",400,200);
  
  fill(52, 128, 235);
  text("1º Puesto: "+RecordMin+":"+RecordSeg+":"+RecordMils,400,300);
  
  fill(0);
  text("Pulsa Espacio para volver a empezar",400,400);
}
