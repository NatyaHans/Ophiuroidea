#install.packages("diagram")
library(diagram)

# change the values for your transiton matrix here
stateNA<-c(0,0.44,0.46,0.1)
state0<-c(1.86,0,5.7,1.46)
state1<-c(1.58,0.54,0,0.16)
state2<-c(0.1,0.58,1.32,0)
trans.mat<-rbind(stateNA,state0,state1,state2)
colnames(trans.mat)<-c("stateNA","state0","state1","state2")
trans.mat

# change the colors here
statecolors<-c("coral1","dodgerblue4","aquamarine4","gray") 

# change other parameters here
plotmat(trans.mat,lwd = 2,pos=c(1,2,1),box.col=statecolors,box.lwd = 3,box.type = "multi", main = "Transition Matrix",shadow.size = 0,box.size = 0.1,arr.pos = 0.5)


