boolean simular = false;
float theta = 0, thetap=0, thetapp = 0;
float g =9.81;
float l = 10;
float kv=4;
void setup()
{
  size(600,600, P2D);//Crea la ventana
}

void draw()
{
  background(0);//Limpia la ventana
  translate(width/2, height/2); //Ubica el origen en el centro de la pantalla
  if(simular)
  {
    thetapp = -(g/l) * sin(theta) - kv/l*thetap;
    thetap = IntegralStep(0.1, thetapp, thetap);
    theta = IntegralStep(0.1, thetap, theta);
  }
  else
    theta = GetAngle();
  RenderPendulo(theta);
}

void RenderPendulo(float angle)
{
  pushMatrix();
  rotate(angle);
  strokeWeight(4); //Ancho del poste
  stroke(0,255,0); //Color del poste
  line(0,0,0,200); //Imprime el poste
  fill(0,255,0); //Relleno de la masa
  circle(0,200,50); //Imprime la masa en la pantalla
  popMatrix();
}

float GetAngle()
{
  return atan2(mouseY - height/2, mouseX - width/2 ) - HALF_PI;
}

float IntegralStep(float dt, float f, float y)
{
  y = y + f*dt;
  return y;
}

void mouseClicked() {
  simular = !simular;
  thetap = 0;
}
