class Disparo {
  float x, y;
  float vx, vy;
  boolean vivo;

  PImage sprite;

  Disparo(float x, float y, PImage sprite) {
    this.x = x;
    this.y = y;

    this.vx = 0;
    this.vy = -10;
    this.vivo = true;

    this.sprite = sprite;
  }

  void mueve() {
    this.x += this.vx;  
    this.y += this.vy;

    if (y<0) {
      this.vivo = false;
    }


    
  }

  void dibuja() {
    fill(255);
    image(this.sprite, x, y);
  }
}
