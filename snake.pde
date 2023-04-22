ArrayList<Integer> x=new ArrayList<Integer>();
ArrayList<Integer> y=new ArrayList<Integer>();
int hgt=24,wdt=24; //game 
int block=20;
int dir=2;
int xdir[]={0,0,1,-1};
int ydir[]={1,-1,0,0};
int foodx=15;
int foody=15;

int speed=10;
boolean gamestatus=false;
void setup()
{
  size(500,500);//window 
  x.add(4); //initial position
  y.add(15);
}
int i;
void draw()
{
  background(0);//color of background 0 to 255
  fill(255);// set color 
  for(i=0;i<x.size();i++)
    rect(x.get(i)*block,y.get(i)*block,block,block);// create snake
    

    if(!gamestatus)
    {
     fill(255);
     rect(foodx*block,foody*block,block,block);//create food for snake
     textAlign(LEFT);
     textSize(25);
     fill(255);
     text("Score:"+x.size(),0,20);
     
    if(frameCount%10==0)
    {
    
    x.add(0,x.get(0)+xdir[dir]);
    y.add(0,y.get(0)+ydir[dir]);
    if(x.get(0)<0||y.get(0)<0||x.get(0)>wdt||y.get(0)>hgt)
    {
      gamestatus=true;
    }
    if(x.get(0)==x.get(i)&&y.get(0)==y.get(i))
    {
      gamestatus=true; 
    }
     
    
    if(x.get(0)==foodx && y.get(0)==foody) 
    { 
    if(x.size()%2==0&&speed>=2)
    {
       speed=speed-1;
    }
    foodx=(int)random(0,wdt);
    foody=(int)random(0,hgt);
    }
    else
    {
    x.remove(x.size()-1);
    y.remove(y.size()-1);
    }
    }
    }  
    else{
       fill(222,9,12);
       textAlign(CENTER);
       textSize(30);
       text("Game Over \n Score :"+x.size()+"\nPress Enter",500/2,500/2);
       if(keyCode==ENTER)
       {
         x.clear();
         y.clear();
         x.add(4);
         y.add(15);
         dir=2;
         speed=10;
         gamestatus=false;
       }
     }
                  
 }

  void keyPressed()
  {
    int newdir=keyCode;
    if (keyCode==DOWN)
        newdir=0;
    else if (keyCode==UP)
        newdir=1;
    else if (keyCode==LEFT)
        newdir=3;
    else  if (keyCode==RIGHT)
        newdir=2;
    else 
        newdir=-1;
    if (newdir!=-1)
        dir=newdir;
  }
  
  
