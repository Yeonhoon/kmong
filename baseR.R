
# Data structure ---------------------------------------------------

## 1. vector -------------------------------------------------------

## 2. matrix -------------------------------------------------------

matrix(1:25,nrow=5, byrow=T)


## 3. array --------------------------------------------------------
# matrix + matrix

## 4. list ---------------------------------------------------------
# 여러 종류의 벡터를 묶을 수 있음.
# 다른 종류의 데이터 포함 가능
# 길이가 같지 않아도 됨

## 5. data.frame ---------------------------------------------------
# 여러 종류의 벡터를 묶을 수 있음.
# 다른 종류의 데이터 포함 가능
# column의 길이가 같아야 함 


# Data type ----------------------------------------------------

# numeric, double, integer

# character

# factor

# logical



# operators ----------------------------------------------------

# +,-, *, /, ^, %%, %/%, %*% (행렬곱)

a <-  matrix(1:12, nrow=3)
b <- matrix(1:12,nrow=4)


# logical operators ------------------------------------------------

# T/F 반환
# ==, !=, <, >

# pipe operators  -------------------------------------------------

## 1. %>%  --------------------------------------
a <- runif(10, 1, 20)
sqrt(a)
a %>% sqrt()


## 2. %T>% --------------------------------------

setosa <- iris %>% filter(Species=='seotsa') %>% View()

setosa <- iris %>% filter(Species=='setosa') %T>% View()



## 3. %<>% --------------------------------------

a <- a %>% sqrt()
a %<>% sqrt()

a <- a %>% sqrt()
a %<>% sqrt()
data(iris)


# Basic functions ---------------------------------------------

str()
head()
tail()
rep()
seq()
dim()
cbind()
rbind()


sum()
sqrt()
exp()
min()
max()
median()
mean()
round() 
trunc() # truncate
t() # transpose

typeof(a) # 원시
class(a) # 객체지향
mode(a) # 어떻게 메모리에 저장되는지


# data frame 관련 function
View()
head()
nrow()
ncol()
dim()


# apply ------------------------------------------------------

lapply(l, rowSums)
sapply()
tapply()
mapply()

# 집합 개념 ---------------------------------------------------

intersect(a,b)
setdiff(a,b)
union(a,b)

# packages -----------------------------------------------------
# CRAN: Comprehensive R Archive Network
# github
install.packages()
remove.packages()
devtools::install_github()


library()
require()

packageStatus('tidyverse')

# packages r 시작 시 자동으로 불러오기



