
require(ggplot2)
require(palmerpenguins)
require(dplyr)
require(patchwork)
penguins

penguins
# EDA
penguins %>% 
  filter(!is.na(sex)) %>% 
  group_by(species, sex) %>% 
  summarise(mean = mean(bill_length_mm,na.rm=T))

penguins

# Type --------------------------------------------
## barplot ----------------------------------------

### geom_bar() ------------------------------------

p1 <- penguins %>% filter(!is.na(sex)) %>% 
  ggplot(aes(x=species, fill=sex))+
  geom_bar(position='stack');p1 # default
  # geom_bar(position='dodge')

# y변수를 추가한 경우 geom_bar(stat='identity')

### geom_col() ------------------------------
require(scales)

p1 <- penguins %>% 
    filter(!is.na(sex)) %>% 
    ggplot(aes(x=species,
               y = mean(bill_length_mm, na.rm =T),
               fill = sex)) +
  geom_col(position='stack')

p1 


## boxplot --------------


## violin plot ---------------------


## lineplot ---------------------

geom_abline()
geom_hline()
geom_vline()
geom_freqpoly()

ggplot(diamonds, aes(price, color=  cut))+
  geom_freqpoly()

## scatterplot ------------------

diamonds
ggplot(diamonds, aes(price, carat, color=cut)) + 
  geom_point()

## histogram ----------------------------------------------------

ggplot(diamonds, aes(price, fill = cut)) +
  geom_histogram(position='dodge',
                 bins = 100)

# Range ---------------------------------------------------------

p1 + xlim()
p1 + ylim()

p1 + scale_y_continuous(limits = c(0,3000))

p1 + scale_x_discrete(labels=c('a','b','c'),
                      name = 'AAA',
                      position = 'bottom')

p1 + scale_y_continuous(guide = guide_axis(title='YYY',
                                           angle = 10,
                                           position = 'right'))

# Customization -----------------------------------------
##  scale_{}_{} ------------------------------

p1 + guides(fill=guide_legend(reverse=T, title='SEX'))
p1 + scale_fill_brewer(palette = 'Set1')
p1 + scale_fill_discrete()
p1 + scale_fill_continuous()
p1 + scale_fill_gradient()
p1 + scale_fill_discrete()
p1 + scale_fill_manual(values=rev(species))

## guides ------------------------------------



# Title ----------------------

p1 + labs(title='Title', x='X', y= 'Y')
p1 + ggtitle('Hi')
p1 + xlab('Xlab') + ylab('Ylab')


# factor rev --------------------------------------------------------------

# original
p1 <- penguins %>% filter(!is.na(island)) %>% 
  ggplot(aes(x=species, fill=island))+
  geom_bar(position='stack');p1

# reverse color
p2 <- penguins %>% filter(!is.na(island)) %>% 
  ggplot(aes(x=species, fill=fct_rev(island))) + 
  geom_bar(position='stack');p2

# reverse legend order
p3 <- penguins %>% filter(!is.na(island)) %>% 
  ggplot(aes(x=species, fill=island)) + 
  geom_bar(position='stack') +  
  guides(fill=guide_legend(reverse=T))

# reverse bar order
p4 <- penguins %>% filter(!is.na(island)) %>% 
  arrange(desc(island)) %>% 
  ggplot(aes(x=species, fill= island ))+
  geom_bar(position=position_stack(reverse = T)) 
  # scale_fill_discrete(labels=c('Dream','Torgersen','Biscoe'))

p1/p2/p3/p4

# Text --------------------------------------------------------------------


p1 + geom_text(label=)

# Annotation -------------------------------------


# facet-----------------------------------------
# grid: grid 생성
# wrap: group 을 겹치기만 함

p1 + facet_grid(.~sex) # x,y 를 받음 x*y 그래프
p1 + facet_wrap(.~sex)

p1 + facet_grid(sex~.) # x,y 를 받음 x*y 그래프 # x*y의 그리드 생성
p1 + facet_wrap(~sex)

p1 + facet_grid(sex ~ island) 
p1 + facet_wrap(sex ~ island)



# theme 설정-----------------------------------------------

## overall theme ---------
p1 + theme_bw()
p1 + theme_classic()
p1 + theme_dark()
p1 + theme_gray()
p1 + theme_void()
p1+ theme_minimal()

require(ggthemes)


# 기타 ----------------------------------------------------------------------

# coord_flip() 

##  theme 추가 설정 ------------
p1 + theme(axis.line.x = element_line(color='red'),
           axis.line.y = element_line(size=2),
           axis.text.x = element_text(angle=180),
           axis.text.y = element_text(family='serif'),
           axis.title.x = element_text(size=10),
           axis.title.y = element_text(family='serif',size=10, color='blue'),
           legend.position = 'bottom')


