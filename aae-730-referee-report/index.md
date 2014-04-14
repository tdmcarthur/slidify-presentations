---
title       : "The adoption of network goods: evidence from the spread of mobile phones in Rwanda"
subtitle    : Daniel Bjorkegren, Harvard University
author      : Presented by Travis McArthur
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [mathjax]            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
---

## Network goods

- Basic problem of network goods: The total benefit of adoption does not accrue to the adopter. There are some positive externalities.

- Hence there is a case for governments or service providers to speed adoption through subsidies or coverage mandates

- Hard to know the best policy without knowing private and public benefits of technology.

---

## Contributions of this paper

1.  Models the utility of using a cell phone, conditional on already having adopted it, by exploiting the marginal pricing mechanism.

2.	Models the decision to adopt a phone.

3.	Measures impact of a handset subsidy program and a rural coverage mandate by simulating network adoption based on parameters estimated in (1) and (2).

---

## Data and study context

- Rwanda. 2009 population: 10.5 million
-	Data covers 2005 to 2009, when mobile phone ownership increased from 0.3 million to 1.5 million
-	5.3 billion total call records, including approximate geographic location
-	Data comes from a single phone carrier, but had 88% market share
-	Text messages (SMS) accounted for only 16% of transactions and were not analyzed.
- Call charged per-second rate
-	Ancillary data from nationally representative household surveys

---

## Changes over the period of study (2005-2009):

- Price of cheapest handset fell from \\$70 to \\$20
-	Non-marginal pricing (i.e. monthly maintenance fees, fixed connection fees) almost completely eliminated 
-	Share of geographic area covered by cell towers rose from 60% to 95%


---


## Setup for modeling utility of using a phone

- In the $t$-th month, $i$ individual can contact $j$ person who is a subscriber
- Each month, $i$ receives a shock to the desire to communicate with $j$ of $\epsilon_{ijt}$
- $\epsilon_{ijt}$ is assumed to have a lognormal distribution with an additional mass point at negative infinity.
- The mass point is used to represent the cases where $i$ would not call $j$ regardless of cost.
- $i$'s problem is to maximize utility by choosing non-negative $d$, the total duration of calls for that month to the $j$ person, i.e. solve

$$u_{ijt}=\underset{d\geq0}{\max}\: v_{ij}\left(d,\epsilon_{ijt}\right)-c_{ijt}d$$

- $v_{ij}\left(d,\epsilon_{ijt}\right)$ is the benefit of making the call.
- $c_{ijt}$ is the per-second cost of the call and is modeled by considering the marginal pricing mechanism and the "hassle cost" of dealing with poor reception in some areas.

--- 



## Estimation of utility from owning a phone

- Maximum likelihood approach

- Mean of $\epsilon_{ijt}$, the “call shock”, is specific to each link within the network.

- Standard deviation of $\epsilon_{ijt}$ and the “censoring” level (negative infinity mass point) is specific to the individual.

- In total, there are 127.6 million parameters that are specific to a link or individual, resulting in a median of 41 observations per parameter.

- The parameters for cost of call and the utility function are common across all observations.

---

## Adoption decision

- The decision to adopt a phone at any given time is governed by the expected value of the future discounted $u_{ijt}$ minus the cost of a handset at the time of adoption.

- Naturally, this is a function of the expected number of people within $i$'s social network that have become subscribers.

- Therefore, we have a game with many players where there may be many equilibria.

---



## Estimation of adoption decision

- From the value of these parameters, we can obtain the expected utility value of adopting the phone at any time period for each individual.

- We also know what month each individual person adopted.

- Putting these two facts together with the price changes of handsets in each month, we can recover the sensitivity to price, $\beta^{handset}$
 
 

---



## Adoption conditions are formed by a "window"

- Set window length to $K=2$ months

- Condition for "don't adopt too soon":

$$\underset{k=0}{\overset{K}{\sum}}\delta^{K-k}u_{i\tau_{i}-k}\leq\beta^{handset}\left(p_{\tau_{i}-K}-\delta^{K}\cdot p_{\tau_{i}}\right)$$

- Condition for "don't adopt too late":

$$\underset{k=0}{\overset{K-1}{\sum}}\delta^{k}u_{i\tau_{i}+k}\geq\beta^{handset}\left(p_{\tau_{i}}-\delta^{K}\cdot p_{\tau_{i}+K}\right)$$

- The goal is to correctly guess each person's window of adoption by adjusting $\beta^{handset}$

- Estimation through moment inequality approach

---

## Moment inequality approach

- Set up inequalities as $m_{i}(\theta)\leq0$

- Objective is to choose parameter(s) $\theta$ so as to minimize

$$Q_{n}\left(\theta\right)\equiv\left\Vert \mathbb{E}_{n}\left[m_{i}\left(\theta\right)\right]^{'}W_{n}^{1/2}\left(\theta\right)\right\Vert _{+}^{2}$$

where

$$\mathbb{E}_{n}\left[m_{i}\left(\theta\right)\right]\equiv\dfrac{1}{n}\underset{t=1}{\overset{n}{\sum}}m_{t}\left(\theta\right)$$

$W_{n}\left(\theta\right)$ is some diagonal weight matrix, possibly just an identity matrix,

and the norm $\left\Vert \cdot\right\Vert _{+}$ is defined as:

$$\left\Vert \mathbf{x}\right\Vert _{+}\equiv\sqrt{\left(\max\left\{ x_{1},0\right\} \right)^{2}+\cdots+\left(\max\left\{ x_{n},0\right\} \right)^{2}}$$
 

---




## Determine equilibrium adoption path

- Iterated best response algorithm:

1. Propose a candidate adoption path

2. Holding fixed others' adoption dates, each individual chooses the best date to adopt

3. Substitute the new set of adoption dates in step (1) and iterate.

4. Stop when the algorithm converges, i.e. no one wants to deviate from the proposed path

- Bounds of individuals' benefits of having a phone is given by manipulation of the adoption window inequalities


---


## Baseline simulation fit
<img src="baseline-simulation.png" alt="" width="650" height="500"> 

---


## Analysis of 2008 handset subsidy program

- OLS estimates suggest 2-3% increase in proportion of households owning a phone for every 1% of households that received a subsidized handset. 

- Simulation results suggest the subsidy program reduced the mean adoption time among all adopters by 0.89-0.06 months.

- Subsidy improved welfare by \\$5.6-0.7 million. (Total cost to the state: \\$0.6 million)

- If the service provider had paid for the subsidy itself, its profits would have increased by \\$2.1 million (high case) or decreased by \\$0.4 million

---


## Analysis of rural expansion requirements

- Cut out 10 towers with low revenue for the provider.

- Reduction of mean adoption time by among all adopters of 0.03-0.02 months and reduction of consumer surplus of \\$0.34-0.32 million

- Most of the benefits of the 10 towers accrued to people outside of their coverage area

- Overall, this was a "wise" mandate since the service provider did not earn enough from these towers to justify the cost, and yet the people in the 10-tower coverage area do not gain enough utility to justify pooling resources and pay for the construction themselves.

---


## Miscellaneous findings

- A typical demand model would predict that one communication link was substitutable for another, while an information sharing would predict that an additional link would generate more information to share with other links, increasing use. The parameter estimates suggest complementarity among links.

- The parameters suggest it is more costly to try to call someone in a poorly covered area than to try to call from a poorly covered area.

- From ancillary data, 92% of subscribers said that the main purpose of their 10 most recent calls was social




---


## Critiques

- There is no learning in the model

<img src="baseline-simulation.png" alt="" width="650" height="500"> 

---


## Critiques

- No clear criteria for success or failure of the simulation

<img src="baseline-simulation.png" alt="" width="650" height="500"> 

---

## Critiques

- Handset price index exogenously given?

- Each agent is a price taker, but the network can influence which models importers choose to import. Handset index price fell from \\$150 to \\$50 over study period.

- The average monthly consumption in households with mobile phones fell from \\$470 in 2005 to \\$250 in 2010. 

---

## Future research agenda

- The techniques developed in the paper could help design policies for adoption of web access through mobile phones.

- Paper proposes a method to predict adoption of network goods for those who have not yet adopted. (Note that the main simulation discussed in the paper only simulated adoption for those who are observed to eventually adopt.)

---


## Future research agenda

- Advisability of having a limited number of licenses for service providers

- The paper analyzed consumer utility, but what is the effect upon information problems in business?

---


## FIN




