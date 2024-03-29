/*  Properties
_________________________________________________________________ */

PGraphics canvas;
int canvas_width = 3508;
int canvas_height = 4961;

float ratioWidth = 1;
float ratioHeight = 1;
float ratio = 1;

/*  Setup
_________________________________________________________________ */

void setup()
{ 
  size(400,400);
  background(30);
  
  canvas = createGraphics(canvas_width, canvas_height, P2D);
  
  calculateResizeRatio();
  
  canvas.beginDraw();
    canvas.background(0);
    canvas.fill(255);
    canvas.smooth();
    canvas.stroke(0);
    canvas.strokeWeight(3);
      canvas.triangle (canvas.width/2.5, canvas.height/2.5, canvas.width/2, canvas.height/1.2, canvas.width*2/3, canvas.height/2.5);

     canvas.ellipse (canvas.width/2, canvas.height/3, 400*3, 400*3);
     
//    canvas.ellipse(canvas.width / 2, canvas.height / 2, 2000, 2000);
  canvas.endDraw();
  
  float resizedWidth = (float) canvas.width * ratio;
  float resizedHeight = (float) canvas.height * ratio;
  
  image(canvas, (width / 2) - (resizedWidth / 2), (height / 2) - (resizedHeight / 2), resizedWidth, resizedHeight);
  
	canvas.save("grab.png");
}

/*  Calculate resizing
_________________________________________________________________ */

void calculateResizeRatio()
{
  ratioWidth = (float) width / (float) canvas.width;
  ratioHeight = (float) height / (float) canvas.height;
  
  if(ratioWidth < ratioHeight)  ratio = ratioWidth;
  else                          ratio = ratioHeight;
}
