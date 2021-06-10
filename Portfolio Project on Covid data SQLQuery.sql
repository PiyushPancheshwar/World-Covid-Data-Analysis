
--Selecting all data from the dataset
SELECT *
FROM [Portfolio Project].dbo.['covid-data$']
where continent is not null
ORDER By 3,4


--Selection of all the relevant data for furhter analysis 
Select location, date, population, total_cases, new_cases, total_deaths, reproduction_rate
From [Portfolio Project].dbo.['covid-data$']
where continent is not null and new_cases is not null and total_deaths is not null
order by 2,3 


--Showing the death count due to coronavirus in different continents across the world
Select continent, max(cast(total_deaths as int)) as Death_count_of_continent
from [Portfolio Project].dbo.['covid-data$']
where continent is not null
group by continent
order by Death_count_of_continent desc


-- Showing the maximum number of death count due to covid in different countries across the world
Select location, Max(cast(total_deaths as int)) as Total_Death_count
from [Portfolio Project].dbo.['covid-data$']
where continent is not null
group by location
order by Total_Death_count desc


-- Total cases vs population of countries
-- Showing the coronavirus infection percentage of different countries across the world
Select location, population, Max(total_cases) as Maximum_number_of_cases, Max(total_cases/population)*100 as Infection_percentage
From [Portfolio Project].dbo.['covid-data$']
Group by population, location
order by Infection_percentage desc


--Reproduction Rate (R0) - Reproduction rate is the rate of any disease which spread among population who are susceptable to it.

--Showing the reproduction rate of coronavirus across different continents of the world
Select continent, max(cast(reproduction_rate as float)) as Max_reproduction_rate
from [Portfolio Project].dbo.['covid-data$']
where continent is not null
group by continent
order by  Max_reproduction_rate desc 


--Showing the reproduction rate of coronavirus in different countries of the world
Select location, max(cast(reproduction_rate as float)) as Max_reproduction_rate
from [Portfolio Project].dbo.['covid-data$']
group by location
order by  Max_reproduction_rate desc 


-- Global Numbers
-- Total number of new cases, new deaths and Death percentage due to coronavirus disease
Select Sum(new_cases) as Total_new_cases, Sum(cast(new_deaths as int)) as Total_new_deaths, Sum(cast(new_deaths as int))/ Sum(new_cases) * 100 as Death_percentage
from [Portfolio Project].dbo.['covid-data$']
where continent is not null
order by 1, 2

-- Total cases vs Population
-- Showing the likelihood of contracting from Coronavirus in India
Select location, Date, total_cases, population, (total_cases/population)*100 as Infection_percentage
From [Portfolio Project].dbo.['covid-data$']
Where location like '%India%' 
Order by 1,2


-- Total Deaths vs Total Cases
-- Showing the chances of death if one got infected by coronavirus in India
Select Location, Date, total_cases, total_deaths, (total_deaths/total_cases)*100 as Death_percentage
From [Portfolio Project].dbo.['covid-data$']
Where location like '%India%' 
order by 1, 2 






