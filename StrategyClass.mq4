class Strategy{
   
   protected:
      int period;//Periods Used For Strategies Indicators
      int shift;//Shift used for Strategies Indicators
      int timeFrame ; // The Time Frame Used 
      string name; // name of the strategy
      string symbol;
      int type; //is it for trending market or calmed market
      int magicNumber;
      int refreshRate; // seconds used 
      datetime NowDate;
      int trend;
      int signal;
      
   public:static int length ;//< Number of strategies used 
   public:
      //getters
      int         getTimeFrame(){return this.timeFrame;};
      string      getName(){return this.name;};
      string      getSymbol(){return this.symbol;};
      int         getType(){return this.type;};
      
      int         getRefreshRate(){return this.refreshRate;};
      int         getSignal(){return this.signal;};
      int         getTrend(){return this.trend;};
      datetime    getNowDate(){return this.NowDate;};
      int         getShift(){return this.shift;};
      int         getPeriod(){return this.period;};
      //setters   
      void        setTimeFrame(int timeFrame){ this.timeFrame = timeFrame;};
      void        setName(string name){ this.name = name;};
      void        setCurrency(string currency){ this.symbol = symbol;};
      void        setType(int type){ this.type = type;};
      void        setRefreshRate(int refreshRate){this.refreshRate  = refreshRate;};
      void        setShift(int shift){ this.shift = shift;};
      void        setPeriod(int period){ this.period = period;};
      //functions For Signals
      virtual bool         buySignal(){return 0;};
      virtual bool         sellSignal(){return 0;};
      void        Signal(){
                     if(buySignal()){this.signal = BUY;}else
                     if(sellSignal()){this.signal = SELL;};
                     this.signalInitializer();
                  };
      void        signalInitializer(){
         if(this.refreshRate){
         if( (( this.NowDate + this.refreshRate )<=TimeCurrent())){
             
             this.signal = 0; 
             this.NowDate = TimeCurrent();
      }
         }
      };    
    //MagicNumberGenerator Function 
   
    
      public:
         Strategy(void){
            this.NowDate = TimeCurrent();
            timeFrame = 0;
            symbol = Symbol();
            name = "No Name";
            
      };
      
         Strategy(int timeFrame,string symbole,int MagicNumber){
           this.NowDate = TimeCurrent();
            this.timeFrame = timeFrame;
            this.symbol = symbole;
            
         };
}; 

class BOLLINGERBANDS: public Strategy{

protected:
   //BollingerBands Parametres :
  int bandsShift;
  double deviation;
public:
   //BollingerBands Getters :
   int getBandsShiftt(){return this.bandsShift;};
   double getDeviation(){return this.deviation;};
   //BollingerBands Setters :
   void setBandsShift(int bandsShift){this.bandsShift = bandsShift;};
   void setDeviation(double deviation){this.deviation = deviation;};
   //BollingerBands Buy/Sell Signals:
   bool  buySignal(){
      return(Open[0]>= iBands(this.symbol,this.timeFrame,this.period,this.deviation,this.bandsShift,PRICE_OPEN,MODE_UPPER,this.shift))
 
   ;}
   bool  sellSignal(){   
     return(Close[0] <= iBands(this.symbol,this.timeFrame,this.period,this.deviation,this.bandsShift,PRICE_OPEN,MODE_LOWER,this.shift)  )
   ;}
  
   //BollingerBands Objects Constructors :
   BOLLINGERBANDS(int period, int bandsShift,double deviation,int timeFrame,string symbole,int MagicNumber):Strategy(timeFrame,symbole,MagicNumber){
      this.name = "BollingerBands";
      this.period = period ;
      this.bandsShift = bandsShift;
      this.deviation = deviation ;
   }
   BOLLINGERBANDS(int period, int bandsShift,double deviation):Strategy(){
      
      this.name = "BollingerBands";
      this.period = period ;
      this.bandsShift = bandsShift;
      this.deviation = deviation ;
   }
   BOLLINGERBANDS():Strategy(){
      this.name = "BollingerBands";
      this.period = 14 ;
      this.bandsShift = 0;
      this.deviation = 2 ;
      this.shift = 0;
   }
};
/**
*BOLLINGERBANDS *f = new BOLLINGERBANDS();
*BOLLINGERBANDS *f2 = new BOLLINGERBANDS();
* you might assign f and f2 with the options you want by using The (Setters) of the Strategy class 
*
*/
