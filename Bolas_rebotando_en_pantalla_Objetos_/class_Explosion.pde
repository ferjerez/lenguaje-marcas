class Explosion {
  float x, y;
  int frame;
  boolean vivo;



  Explosion(float x, float y) {
    this.x = x;
    this.y = y;
    this.frame = 0;
    this.vivo = true;
  }

  void dibuja() {
    /* EXPLOSION */

    PImage img = createImage(128, 128, ARGB);
    int xx =  this.frame/4  * 128     % 512;
    int yy =  this.frame/4/4 *128     % 512;
    img.copy(spriteExplosion, xx, yy, 128, 128, 0, 0, 128, 128) ;

    image(img, x, y);


    this.frame++;

    if (this.frame>=16*4) {
      this.vivo = false;
    }
  }
}
