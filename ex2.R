#Итоговое задание по дисциплине "Pyton и R для анализа данных" Инчаков В. гр. 272214


#Вопрос 1
#Работа со столбцами: - переименование, - изменение порядка, - создание, - удаление.

nationality <- c("Kazakh","Uzbek","RUS") # Создаем столбец про национальность
nationality

faculty <- c("IT","economy","jurisprudence") # Создаем столбец про факультет
faculty

course <- c(1,3,4) # Cоздаем столбец про курс
course

name <- c("Slava","Mumin","Leonid") # Cоздаем столбец про имена
name

StudTSU <- data.frame(Nationality = nationality,Name = name,Faculty = faculty,Course = course) # Cоздаем саму таблицу с ранее созданными столбцами
StudTSU

names(StudTSU)[names(StudTSU)=="Faculty"] <- "Educational direction" # Переименовываем столбец факультет в учебное направление
StudTSU

StudTSU <- StudTSU[,c("Nationality","Name","Course","Educational direction")] # Меняем порядок столбцов
StudTSU

age <- c(23,26,23) # Создаем новый столбец с возрастом
age

StudTSU$Age <- age # Добавляем его
StudTSU

StudTSU <- subset(StudTSU, select = - c(Age)) # Удаляем его
StudTSU

#Вопрос 2
#Проекция: извлечение подмножества столбцов.

StudTSU["Name"] # Выводим столбец с именами

StudTSU[2,"Name"] # Выводим вторую строку из столбца с именами

#Вопрос 4
#Соединение данных: - union, - join.

name1 <- c("Mumin","Slava","Leonid") # Cоздаем новые столбцы для новой таблицы для их слияния
name1

socialbehavior <- c(6,7,"Маяк") # Общежитие
socialbehavior

floor <- c(5,8,2) # Этаж
floor

room <- c(528,833,228) # Комната
room

StudTSUSocBehavior <- data.frame( Name = name1, SocialBehavior = socialbehavior, Floor = floor, Room = room) # Создаем новую таблицу
StudTSUSocBehavior

#install.packages("dplyr")
library(dplyr)

StudTSU %>% right_join(StudTSUSocBehavior,by=c("Name")) # Производим процесс слияния, добавляем вторую таблицу слева и корректируем по имени (если имя сходится, то и все значения из второй таблицы будут подстраиваться)

nationality2 <- c("Uzbek","RUS","Kazakh")
nationality2

faculty2 <- c("IT","economy","jurisprudence")
faculty2

course2 <- c(2,4,5)
course2

name2 <- c("Dmitriy","Gleb","Nurik")
name2

StudTSU2 <- data.frame(Nationality = nationality2, Name = name2, Faculty = faculty2, Course = course2)
StudTSU2

StudTSU <- data.frame(Nationality = nationality, Name = name, Faculty = faculty, Course = course)
StudTSU

bind_rows(StudTSU,StudTSU2) 

#Вопрос 5
#Статистика и агрегация данных: - простые сводные показатели, - группировка и расчет сводных показателей.

StudTSUFull <- bind_rows(StudTSU,StudTSU2) # Создаем новую таблицу (большую)
StudTSUFull

min(StudTSUFull[4]) # Минимальное значение из столбца курс

max(StudTSUFull[4]) # Максимальное значние из столбца курс

agg <- aggregate(StudTSUFull$Course, by=list(StudTSUFull$Nationality), FUN=max) # Показывает максимальный курс по национальностям
colnames(agg) <- c('Национальность', 'Максимальный курс')
agg

#Вопрос 3
#Фильтрация строк: - простое условие, - составное условие.

StudTSU <- data.frame(Nationality = nationality,Name = name,Faculty = faculty,Course = course) # Создаем саму таблицу с ранее созданными столбцами
StudTSU

StudTSU$Course = ifelse(StudTSU$Course >2, "Старший курс","Младший курс") # Простое условие 
StudTSU

StudTSUFull$Faculty[StudTSUFull$Nationality == "Kazakh" | StudTSUFull$Nationality == "Uzbek"] # Составное условие