

# read, write file --------------------------------------------------------------------
read.csv()
write.csv()

getwd()
setwd()




# data frame에서 자주 사용되는 함수
View()
str()
dim()
names()
rownames()
colnames(iris)
names(iris)
summary()
toupper(names(iris))
tolower()

# row, column 다루기 -----------------------------------------
## 1. row --------------------------------------------
iris[1,]

## 2. column -----------------------------------------

iris[[1]]
iris[,1]
iris[1]


iris$Sepal.Length
iris$Species

relevel()
head()


# dplyr or data.table

tidyr::as_tibble(iris)
require(dplyr)
require(tidyr)

setequal(a,b)
# 
?setequal
require(data.table)


# select ------------------------------------------------------------------

myData <- tibble(
  col_1 = runif(10, min=0, max=10),
  col_2 = runif(10, min=0, max=10),
  col_3 = runif(10, 0, 30),
  col_4 = runif(10, -1, 1)
)

myData %>% select(num_range('col_',range = 1:4))
## starts_with ------
## ends_with --------
## num_range -------- : column 의 열 숫자 매칭
# 
dplyr::contains()

iris %>% select(num_range())


# filter ------------------------------------------------------------------

iris %>% filter(Species=='setosa')


# mutate ----------------------------------------------------------

iris %>% as_tibble() %>% 
  group_by(Species) %>% 
  mutate(sum = across(1:4, sum))

# group_by ----------------------------------------------------------------

iris %>% group_by(Species)

# sumamrise (summarize) ------------------------------------------------


# summarise
iris %>% as_tibble() %>% 
  # filter(Species=='setosa') %>% 
  group_by(Species) %>% 
  summarise(mean = across(1:4, mean),
            Count = n())


# summarise_at

iris %>% as_tibble() %>% 
  summarise_at(.vars = c('Sepal.Length'), .funs=mean)
  summarise_at(vars(Sepal.Length),  .funs = mean)

# summarise_all

iris %>% 
  group_by(Species) %>% 
  # select(Sepal.Length) %>% 
  summarise_all(., .funs = c(mean,min,max))

summarize  

# across ---------------------------------------------------------------

iris %>% group_by(Species) %>% 
  summarise(across(everything(),mean))


diamonds %>% group_by(cut, clarity) %>% 
  summarise(across(where(is.numeric), mean))



# summarise(across(1:4, mean))

# if_all, if_any --------------------------------------
# if_all : 열을 선택한 뒤, 선택된 열 모두에서 조건이 부합하는 경우 필터
# if_any : 열을 선택한 뒤, 선택된 열 중 조건이 하나라도 부합하는 경우 필터 적용


require(palmerpenguins)


penguins %>% filter(if_any(contains('bill'), function(x) between(x,40,45))) 
penguins %>% filter(if_all(contains('bill'), function(x) between(x,40,45)))


# join --------------------------------------------------

inner_join()
left_join()
full_join()
right_join()

# bind ------------------------------------------------

# pivoting ----------------------------------------------

# 전제: 공통된 key or id가 있어야 함.
## long to wide ------------
pivot_wider() # 넓게 펼치기


## wide to long -----------
pivot_longer() # 길게 만들기


# count -------------------------------------------------------------------------
# tally 와 유사
iris %>% count(Species)
iris %>% group_by(Species) %>% tally()


# arrange -----------------------------------------------------------------


iris %>% group_by(Species) %>% 
  summarise(across(where(is.numeric),mean)) %>% 
  arrange(-Sepal.Length) # - or desc


# between ------------------------------------------------------------

iris %>% dplyr::filter(Sepal.Length %>% dplyr::between(3.5, 5.0)) 


# ifelse: if_else, case when -----------------------------------------------------

## if_else -----------------------------------------------------------------

iris %>% count(Species)


# rename ------------------------------------------------------------------
# New = Old 순
iris %<>% rename('SL'='Sepal.Length')


## case when ----------------

iris %>% as_tibble() %>% 
  mutate(sum = case_when(
    Species=='setosa' ~ sum(Sepal.Length),
    Species=='versicolor' ~ sum(Sepal.Width),
    TRUE ~ 0
  )) %>% View()
