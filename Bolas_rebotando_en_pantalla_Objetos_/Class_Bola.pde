class Bola {

  // 1-Propiedades/Atributos/Variables de clase

  float x, y;
  float vx, vy;
  int colores;
  float tamano;
  float angulo;
  float giro;
  // 2-Constructor/Inicialización Variables

  Bola() {
    x=400;
    y=0;
    vx=random(-5, 5);
    vy=random(-5, 5);
    colores=floor(random(100, 256)); 
    tamano=random(10, 100);
    angulo = random(TWO_PI);
    giro = random(-0.1, 0.1);
  }

  // 3-Métodos/Funciones

  void mueve() {              //Función para mover la bola
    x=x+vx;
    y=y+vy;
    angulo = angulo + giro;
  }

  void rebota() {            //Función para que la bola rebote
    if (x<0 || x>=width) {
      vx = -vx;
    }
    //  if ( y<0 || y> height) {
    // vy = -vy;
    //}
    if (y>height) {
      x=width/2;
      y=0;
      vy=random(0, 5);
    }
  }
  void dibuja() {               //Función que Dibuja la bola
    imageMode(CENTER);
    fill(colores);              //color blanco
    //ellipse(x,y,tamano,tamano);

    pushMatrix();

    translate(x, y);
    rotate(angulo);  
    image(sprite, 0, 0, tamano, tamano);

    popMatrix();
  }
}
