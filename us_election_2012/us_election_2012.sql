select * from US_election_2012

-- 1.	How many states had a Voter Population % below 55%? Which states?

select State, round(sum(Confirmed_Voters)/sum(Citizen_Population)*100, 2) as Voters_population
from US_election_2012 
group by state
having sum(Confirmed_Voters)/sum(Citizen_Population)*100 < 55
order by voters_population desc


  /*2.	How many confirmed voters in CA were over 65 years old in 2012? 
	

select state, sum(confirmed_voters)California_Confirmed_voters 
from US_election_2012
where state = 'California'
and age = '65+'
group by state



	/*3.Show both Citizen Population and Confirmed Voters by Age, as % of Column Total. 
		What percentage of the citizen population do 45 to 64 year olds represent? 
		What percentage of the confirmed voter population? */

		-- Calculate subtotal and grandtotal with SQL

select top 1 Age, 
	--sum(Confirmed_Voters)Confirmed_Voters,
	--sum(sum(Confirmed_Voters)) over(order by (select null))grand_total_confirmed_Voters,
	round(sum(Confirmed_Voters)/sum(sum(Confirmed_Voters)) over(order by (select null))*100, 2)Percentage_confirmed_voters_population,
	--sum(Citizen_Population)Citizen_Population,
	--sum(sum(Citizen_Population)) over(order by (select null))grand_total_Citizen_Population,
	round(sum(Citizen_Population)/sum(sum(Citizen_Population)) over(order by (select null))*100, 2)Percentage_Citizen_Population
from US_election_2012
group by Age
order by Percentage_Citizen_Population desc




	/*4.Which state had the highest voter turnout rate? 
	What state among 18-24 year old voters had the highest voter turnout rate?
	where voter turn out = confirmed voters / registered voters */

select top 1 state, round(sum(Confirmed_Voters)/sum(registered_voters)*100, 2) as voter_turnout
from US_election_2012
group by state
order by voter_turnout desc

-- Answer: Colorado (94.69%)

select top 1 state, round(sum(Confirmed_Voters)/sum(registered_voters)*100, 2) as voter_turnout
from US_election_2012
where age = '18 to 24'
group by state
order by voter_turnout desc

-- Wisconsin (93.18%)


	/*5 .As a politician seeking to improve voter turnout rates among young adults (18-24), which particular states would you target first?*/

select top 4 state, round(sum(Confirmed_Voters)/sum(registered_voters)*100, 2) as voter_turnout
from US_election_2012
where age = '18 to 24'
group by state
order by voter_turnout 

-- In West Virginia, Arkansas, Texas, South Dakota turnout among 18 - 24 was less than 60%. This needs some improvement
