SELECT * FROM
PortfolioProject..CovidDeaths
where continent is not null
order by 3,4;

SELECT * FROM
PortfolioProject..CovidVaccination

SELECT Location, date, total_cases, new_cases,total_deaths,population
FROM
PortfolioProject..CovidDeaths
where continent is not null
order by 1,2;


SELECT Location, date, total_cases,total_deaths, (total_deaths/total_cases)*100 as DeathPercent
FROM
PortfolioProject..CovidDeaths
where location like '%states%'
and  continent is not null
order by 1,2;


SELECT Location, date,population, total_cases, (total_cases/population)*100 as PercentPopulationInfected
FROM
PortfolioProject..CovidDeaths
where location like '%states%'
order by 1,2;

SELECT Location, date,population, total_cases, (total_cases/population)*100 as PercentPopulationInfected
FROM
PortfolioProject..CovidDeaths
where location like '%france%'
order by 1,2;

SELECT Location,population, MAX(total_cases) as highestInfection, MAX((total_cases/population))*100 as PercentPopulationInfected
FROM
PortfolioProject..CovidDeaths
Group by location , population
order by PercentPopulationInfected DESC;


SELECT Location,population, MAX(total_deaths) as HighestDeaths, MAX((total_deaths/population))*100 as PercentPopulationDead
FROM
PortfolioProject..CovidDeaths
where continent is not null
Group by location , population
order by PercentPopulationDead DESC;

SELECT Location, MAX(cast(total_deaths as int)) as TotalDeathCount
FROM PortfolioProject..CovidDeaths
where continent is not null
Group by Location
order by TotalDeathCount desc;

SELECT continent, MAX(cast(total_deaths as int)) as TotalDeathCount
FROM PortfolioProject..CovidDeaths
where continent is not null
Group by continent
order by TotalDeathCount desc;

SELECT location, MAX(cast(total_deaths as int)) as TotalDeathCount
FROM PortfolioProject..CovidDeaths
where continent is  null
Group by location
order by TotalDeathCount desc;


SELECT Location, SUM(cast(total_deaths as int)) as TotalDeathCount
FROM PortfolioProject..CovidDeaths
WHERE continent is null
GROUP BY Location
ORDER BY TotalDeathCount DESC;

SELECT date, SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/NULLIF(SUM(new_cases), 0)*100
as DeathPercentage
FROM
PortfolioProject..CovidDeaths
where continent is not null
GROUP BY date
order by 1,2;

SELECT SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/NULLIF(SUM(new_cases), 0)*100
as DeathPercentage
FROM
PortfolioProject..CovidDeaths
where continent is not null
order by 1,2;


With PopvsVac (Continent, Location, Date, Population, New_Vaccinations, RollingPeopleVaccinated)
as
(
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
SUM(cast(vac.new_vaccinations as int)) OVER ( Partition by dea.location Order by dea.location, dea.Date) 
as RollingPeopleVaccinated
From PortfolioProject..CovidDeaths dea
Join PortfolioProject..CovidVaccination vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
--order by 2,3
)
Select*, (RollingPeopleVaccinated/Population)*100 as PercentVaccinated
from PopvsVac


DROP TABLE if exists #PercentPopulationVaccinated
CREATE TABLE #PercentPopulationVaccinated
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric,
New_vaccinations numeric,
RollingPeopleVaccinated numeric
)

INSERT INTO #PercentPopulationVaccinated
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
SUM(cast(vac.new_vaccinations as int)) OVER ( Partition by dea.location Order by dea.location, dea.Date) 
as RollingPeopleVaccinated
From PortfolioProject..CovidDeaths dea
Join PortfolioProject..CovidVaccination vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
--order by 2,3


Select*, (RollingPeopleVaccinated/Population)*100 as PercentVaccinated
from #PercentPopulationVaccinated


CREATE VIEW PercentPopulationVaccinated as
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
SUM(cast(vac.new_vaccinations as int)) OVER ( Partition by dea.location Order by dea.location, dea.Date) 
as RollingPeopleVaccinated
From PortfolioProject..CovidDeaths dea
Join PortfolioProject..CovidVaccination vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
--order by 2,3