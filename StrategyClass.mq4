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
