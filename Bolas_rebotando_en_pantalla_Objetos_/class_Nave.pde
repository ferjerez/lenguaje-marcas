class Nave{
  
  //Propiedades
  
  int x,y;
  boolean vivo;
  PImage spriteNave2;
  
  
  //Constructor
  
  Nave(){
    
    this.x = mouseX;
    this.y = mouseY;
 
   this.vivo = true;
   this.spriteNave2 = spriteNave;
  }
  void dibuja(){
   image(spriteNave2,this.x,y); 
    x= mouseX;
    y= mouseY;
  }

  
}
