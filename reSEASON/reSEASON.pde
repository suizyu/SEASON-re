//添え字関連修正

//季節効果用
  //春
  int sakura=0;
  //冬
  int snow=0;
  //夏
  int sunl=0;

//季節管理
int season=0;

//添え字
int i=0;
int r=0;

//インスタンス数
  int num=9*4;
  //座標記憶
  int[] txlog=new int[num];
//オブジェクト宣言
Tree tr[]=new Tree[num];


//道、背景x座標
int br=0;

//アニメーション用移動速度
int speed=1;

//変数宣言
PImage Back=null;
PImage[] trpt=new PImage[4];;
PImage road=null;
PImage gir=null;





//初期設定
void setup(){
//画面サイズ、フレームレート、線なし
  size(500,500);
  frameRate(60);
  noStroke();
  
//画像読み込み
  //背景
  Back=loadImage("BG.png");
  //木；春～冬
  trpt[0]=loadImage("CC.png");
  trpt[1]=loadImage("NT.png");
  trpt[2]=loadImage("NTF.png");
  trpt[3]=loadImage("NTW.png");
  //レンガ道
  road=loadImage("renga.png");
  //少女
  gir=loadImage("gir.png");

//フォント読み込み,色指定
  PFont myFont=createFont("Meiryo",16);
  textFont(myFont);
  fill(0,0,0);
  
//インスタンス作成
int pos=0;
  //春：1,夏：2，秋：3,冬:4
  for(i=r;i<num;i++){
    tr[i]=new Tree(pos+5,0,i/9);
    pos=250*i;
  }
}

//描写
//背景→奥木→季節効果→手前木→（手前季節効果）→レンガ→少女
void draw(){
  
  
  //背景
  image(Back,0,0);
  //インスタンステスト
  for(i=season*9;i<(season+1)*9;i++){
    tr[i].display();
    tr[i].move();
  }
  
  //テスト
  text("テスト",250,50);
  
  
  //レンガ
  image(road,br,0);
  //少女
  image(gir,20,250);
  //背景、レンガ移動
  if(keyCode==RIGHT){
    br-=speed*3;
  }else{
    br-=speed;
  }
  
  //季節切り替え、木座標
  if(br<-1000){
    reset();
    season++; 
     if(season>=4){
      season=0;
    }   
  }
  

  
  
}

//倍速化(→入力)
void keyPressed(){

}
void keyReleased(){
}

//座標リセット
void reset(){
  br=0;
  for(i=0;i<36;i++){
    tr[i].x=txlog[(i+1)%10];
   }
}

