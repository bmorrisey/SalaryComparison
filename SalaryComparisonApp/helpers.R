raiseCompare <- function(nYears,baseSalary,stayRaise,promotionYears,promotionRaise,jumpYears,jumpRaise,inflation=0) {
  #  nYears is number of years to analyze
  #	raises and inflation are numbers representing percent
  
  jumpRaise=jumpRaise/100
  stayRaise=stayRaise/100
  promotionRaise=promotionRaise/100
  inflation=inflation/100
  
  year=1:nYears
  
  stay=baseSalary
  oneMove=baseSalary
  twoMoves=baseSalary
  threeMoves=baseSalary
  fourMoves=baseSalary
  
  for (i in 2:nYears) {
    
    raise=c(1,1,1,1,1)*stayRaise
    
    if (i==jumpYears) {
      raise[2:5]=jumpRaise
    }
    
    if (i==2*jumpYears) {
      raise[3:5]=jumpRaise
    }
    
    if (i==3*jumpYears) {
      raise[4:5]=jumpRaise
    }
    
    if (i==4*jumpYears) {
      raise[5]=jumpRaise
    }
    
    
    tenure=c(i,i-jumpYears,i-2*jumpYears,i-3*jumpYears,i-4*jumpYears)
    
    #raise[which((tenure%%promotionYears==0)&&(tenure>0))] <- promotionRaise
    raise[tenure%%promotionYears==0 & tenure>0] = promotionRaise
    #print(raise)
    
    stay[i]=stay[i-1]*(1+raise[1]-inflation)
    oneMove[i]=oneMove[i-1]*(1+raise[2]-inflation)
    twoMoves[i]=twoMoves[i-1]*(1+raise[3]-inflation)
    threeMoves[i]=threeMoves[i-1]*(1+raise[4]-inflation)
    fourMoves[i]=fourMoves[i-1]*(1+raise[5]-inflation)
    
  }
  
  raiseCompare <- data.frame(year,stay,oneMove,twoMoves,threeMoves,fourMoves)
  
}