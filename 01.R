#Parte 1- Find the two entries that sum to 2020 and then multiply those two numbers together
base<-as.integer(readLines('Base.txt'))
prod(base[(2020-base) %in% base])
#[1] 1016131

#Parte 2- What is the product of the three entries that sum to 2020
#Solução 1
library(tidyverse)
expand.grid(x = base, y = base, z = base)%>%
  mutate(sum = x + y + z, product = x * y * z)%>%
  filter(sum == 2020)
#[1] 276432018
#Solução 2
base%>%
  combn(3)%>%
  .[,colSums(.) == 2020]%>%
prod()
#[1] 276432018

  


  
  
  
  
  
  
