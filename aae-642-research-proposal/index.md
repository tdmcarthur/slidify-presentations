---
title       : Agricultural cooperative as commitment device
subtitle    : 
author      : Travis McArthur
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [mathjax]            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
---




## Research Question

- Do present-biased individuals who are aware of their bias join agricultural cooperatives to force themselves to act in a less present-biased fashion?

---


## Background: Time inconsistency

- What you plan to do in the future is inconsistent with what you actually do when that future period  rolls around.

- Usually manifests as present-bias, which is consuming "too much" in earlier periods.

- Often modeled as quasi-hyperbolic time discounting:

$t=0\quad$    $\beta\cdot\delta\cdot u_{1}+\beta\cdot\delta^{2}\cdot u_{2}$

$t=1\quad$    $u_{1}+\beta\cdot\delta\cdot u_{2}$

$t=2\quad$    $u_{2}$
 

---


## Time inconsistency


$u\left(x\right)=\sqrt{x}$, $x_{1}+x_{2}=w$

- In period 0 maximize: $\beta\cdot\delta\cdot\sqrt{x_{1}}+\beta\cdot\delta^{2}\cdot\sqrt{x_{2}}$

$x_{1,0}=\cfrac{w}{\delta^{2}+1}$

- In period 1 maximize: $\sqrt{x_{1}}+\beta\cdot\delta\cdot\sqrt{x_{2}}$

$x_{1,1}=\cfrac{w}{\left(\beta\cdot\delta\right)^{2}+1}$

$x_{1,0} < x_{1,1}$ $\implies$  present bias

---


## Time-consistents, naifs, and sophisticates

- Time-consistent indvividuals have "standard" discounting:   $\sum_{t=0}^{T}\delta^{t}u\left(\cdot\right)$ 

- Naifs believe themselves to be time-consistent but are actually present-biased

- Sophisticates are present-biased and are aware of this

(O'Donoghue & Rabin 1999)

---


## Commitment devices

- Naifs and sophisticates can benefit from tying the hands of period 1 "self" (or altering incentives) to benefit period 2 "self"

- Only sophisticates will seek out such a mechanism

---


## Evidence for sophisticates via revealed preference for commitment devices

- Dupas & Robinson (2013): Substantial support for existence of sophisticates because many people chose not to hold their lockbox key when given the opportunity.

- Laibson et al. (2011): Large proportion of people in U.S. chose a savings account with penalties for withdrawal before maturity date.

- Ashraf,  Karlan, Yin (2006): Evidence for sophisticates among women.

- Duflo, Kremer, & Robinson (2011): Little support for existence of sophisticates since small uptake of option to deliver fertilizer at planting time.

---

## Financing input purchases

- In the absence of credit markets, farmers must hold onto money from harvest time to purchase inputs at planting time.

- Between harvest and planting, present-biased individuals may consume funds even though they planned to purchase inputs at planting.

---


## Necessary setting

- Need an area where agricultural cooperatives for a certain crop engage in both marketing and input supply as a joint package

- Having cooperatives that also separately market goods or supply inputs could help remove confounding factors.

- Weak credit markets.

---


## Experimental setup

- First, survey farmers on membership in cooperatives that link marketing and input supply

- Then, offer two savings accounts at harvest time: 

- (1) Interest rate at some $r$ and money can be removed at any time

- (2) Interest rate at some $r-\epsilon$ and money cannot be removed until maturity

- This is similar to Laibson et al. (2011). All funds automatically disbursed at planting time. The money to be placed into these accounts comes from the experimenter, not the subjects' own funds. Account (2) is strictly dominated for time-consistents and naifs.

---

## Estimation: probit

$$P(y=1|\mathbf{x})=\Phi\left(\alpha+\beta_{1}x_{1}+\overset{m}{\underset{j=1}{\sum}}\theta_{k}x_{j+1}\right)$$

- $y$ is membership in a cooperative

- $x_{1}$ is proportion of funds placed in account (2)

- Other variables are demographic controls

- $\beta_{1}>0$ implies sophisticates seek out co-ops as commitment devices
 

---


## Weaknesses

- Two models must be correct for hypothesis to be correct

- Cooperatives are least costly commitment device?

- People join cooperatives for all sorts of reasons - confounding factors?

- I don't do anything with naifs, although I may be able to identify them.

---


## END














