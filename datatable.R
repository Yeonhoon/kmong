require(data.table)


data.table::between()
df <- fread('C:/Users/user/lab/ml/df.csv')


# new functions -----------------------------------------------
# 1. between
df[between(age,50,100)]
df[age %between% c(50,70)]

# 2. fcase: case_when 과 유사
df[,new:=fcase(is.na(hypo_count),0,
               default =1L)]


# fcoalesce: fill missing values. NA가 아닌 최초값 반환
data.table::fcoalesce()
fcoalesce(df$hypo_count, df$brady_count)



# 
df[,new:=fcoalesce(hypo_count,brady_count)]
df[,.(hypo_count, brady_count, new)]

# cube: subgroup 별 aggregate
cubed <- data.table::cube(df, .(vis_mean = mean(vis,na.rm=T)),by=c('dex_usage', 'afib_within_7days'))

dcast(cubed, dex_usage ~ afib_within_7days,
      value.var='vis_mean')

# chin -------------------------------------------------------
# %chin% : character %in%. charctdr
# %chin% 이 %in% 보다 문자열 검색 시 빠름.
df[,new:=fifelse(icuunit %chin% c('SICU','MICU'),1, 0)]
df[,new2 := fifelse(icuunit %in% c('SICU','MICU'),1,0)]

# f~집합함수
# data.table
# nafill ---------------------------------
# locf: Last Observation Carried Forward : 앞의 값 가져다 쓰기
# nocb: Next Observation Carried Backward : 뒤의 값 가져다 쓰기

df[,`:=`(
  new = nafill(hypo_count, type = 'locf'),
  new2 = nafill(hypo_count, type='nocb'),
  new3 = nafill(hypo_count, fill= median(hypo_count,na.rm=T)))]
df[,.(hypo_count, new, new2, new3)]
df$icuunit
df[icuunit %chin% c('SICU','MICU')][,.N, by=icuunit]
df[,.(new,new2)]
