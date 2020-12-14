#How many senhawords are valid according to their policies?
base<-read.table('base.txt')
library(tidyverse)
base<-base%>%
  separate(V1,c('min','max'),'-')%>%
  rename(letra=V2,senha=V3)%>%
  mutate(letra = str_replace(letra,':',''))
#Parte 1
base%>%   
  mutate(ocor=str_count(senha,letra))%>%   
  rowwise%>%mutate(acor2=between(ocor, min,max))%>%  
  count(acor2)
#1 582
#Parte 2
base%>%
  mutate(step01=str_sub(senha,min,min))%>%
  mutate(step02=str_sub(senha,max,max))%>%
  filter(letra==step01 | letra==step02)%>%
  filter(step01 != step02)%>%
  count()
