---
title       : "The adoption of network goods: evidence from the spread of mobile phones in Rwanda"
subtitle    : Daniel Bjorkegren, Harvard University
author      : Travis McArthur
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [mathjax]            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
---

## intro intro

- point 1

- point 2

---




## Setup

- In the $t$-th month, $i$ individual can contact $j$ person who is a subscriber
- Each month, $i$ receives a shock to the desire to communicate with $j$ of $\epsilon_{ijt}$
- $\epsilon_{ijt}$ is assumed to have a lognormal distribution with an additional mass point at negative infinity.
- The mass point is used to represent the cases where $i$ would not call $j$ regardless of cost.
- $i$'s problem is to maximize utility by choosing non-negative $d$, the total duration of calls for that month to the $j$ person, i.e. maximize

$$u_{ijt}=\underset{d\geq0}{\max}\: v_{ij}\left(d,\epsilon_{ijt}\right)-c_{ijt}d$$

- $v_{ij}\left(d,\epsilon_{ijt}\right)$ is the benefit of making the call.
- $c_{ijt}$ is the per-second cost of the call and is modeled by [TODO}.

--- 


## Adoption decision

- The decision to adopt a phone at any given time is governed by the expected value of the future discounted $u_{ijt}$ minus the cost of a handset at the time of adoption.

- Naturally, this is a function of the expected number of people within $i$'s social network that have become subscribers.

- Therefore, we have a game with many players where there may be many equilibria.

---



## TODO: IV slide(s)

- point 1

- point 2

---



## Estimation details

- Maximum likelihood approach

- Mean of $\epsilon_{ijt}$, the “call shock”, is specific to each link within the network.

- Standard deviation of $\epsilon_{ijt}$ and the “censoring” level (negative infinity mass point) is specific to the individual.

- In total, there are 127.6 million parameters that are specific to a link or individual, resulting in a median of 41 observations per parameter.

- The parameters for cost of call and the utility function are common across all observations.

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

$W_{n}$ is some diagonal weight matrix, possibly just an identity matrix,

and the norm $\left\Vert \cdot\right\Vert _{+}$ is defined as:

$$\left\Vert \mathbf{x}\right\Vert _{+}\equiv\sqrt{\left(\max\left\{ x_{1},0\right\} \right)^{2}+\cdots+\left(\max\left\{ x_{n},0\right\} \right)^{2}}$$
 

---



## Predict adoption pattern under counterfactuals

- point 1

- point 2

---




## Iterated best response algorithm

1. Propose a candidate adoption path

2. Holding fixed others' adoption dates, each individual chooses the best date to adopt

3. Substitute the new set of adoption dates in step (1) and iterate.

4. Stop when the algorithm converges, i.e. no one wants to deviate from the proposed path



---




## junk

- One homogenous consumption good (food) 
- Production function:
- $$C=F(X,H)=\underset{X_{1},X_{2},H_{1},H_{2}\geq0}{\max}\left\{ X_{1}^{\alpha}H_{1}^{1-\alpha}+X_{1}^{1-\alpha}H_{1}^{\alpha}\mid X_{1}+X_{2}\leq X,H_{1}+H_{2}\leq H\right\}$$
- X is a composite intermediate good. H is labor. $\alpha \in (0,0.5)$

> - $P=$ Price of X 
- $w=$ Price of H
- $$P>w \implies F(X,H)=X_{1}^{\alpha}H_{1}^{1-\alpha}$$ 
> - $$P < w\implies F(X,H)=X_{1}^{1-\alpha}H_{1}^{\alpha}$$

<!-- Make sure to say that it is numeraire --> 


--- .class #id 







## Low use of intermediate inputs

<!-- html table generated in R 3.0.2 by xtable 1.7-1 package -->
<!-- Fri Apr 11 18:12:20 2014 -->
<TABLE border=1>
<TR> <TH>  </TH> <TH> In the last year, purchased </TH> <TH> Percentage of farmers </TH>  </TR>
  <TR> <TD align="right"> 1 </TD> <TD> Chemical fertilizer </TD> <TD> 26 </TD> </TR>
  <TR> <TD align="right"> 2 </TD> <TD> Organic fertilizer (manure) </TD> <TD> 20 </TD> </TR>
  <TR> <TD align="right"> 3 </TD> <TD> Seeds </TD> <TD> 47 </TD> </TR>
  <TR> <TD align="right"> 4 </TD> <TD> Pesticides </TD> <TD> 26 </TD> </TR>
  <TR> <TD align="right"> 5 </TD> <TD> Rented ag. machinery </TD> <TD> 15 </TD> </TR>
  <TR> <TD align="right"> 6 </TD> <TD> Rented draft animal </TD> <TD> 13 </TD> </TR>
  <TR> <TD align="right"> 7 </TD> <TD> Technical assistance </TD> <TD> 1 </TD> </TR>
   </TABLE>



## Title

- point 1

- point 2

---




## Title

- point 1

- point 2

---



## Title

- point 1

- point 2

---



## Title

- point 1

- point 2

---



## Title

- point 1

- point 2

---


