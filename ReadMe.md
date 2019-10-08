# Pipeline for Brittle Star Project 1
	-  Morphological Data collected by Tania Pineda-Enrique
	-  Genomic data and time calibrated ultrametic tree made by O'Hara etal
	
	
## PART I: Ancestral state reconstructions (using R) (-already done using Mesquite-) 
	1.- Construct a new time calibrated phylogeny in Beast 
		- following the topology of the molecular tree (constrain - monophyletic groups) (Prior)
		- including the assumption of the position of the fossil data (Prior)
	- Data used: nexus file with the morphological matrix
		- The name of species should be the same for all the files to be consistent 
		
	2.- Ancestral state reconstruction for Discrete traits 
		- In R using packages "ape" and "ace" "phytools"
		- One trait separately to test the ecological diversification: life history -type of larvae, 
		ecology - type of habitat, distribution - template vs tropcial, batymethric range - shallow, deep, both. 
		
	-  # Maximum likelihood - ML #
		- ARD = all rate different / ER = equal rate (choose between this two models) 
		- Q matrix (to obtain the information at the root) with the ER or ARD 
		- The object ML is a list that contains the overall likelihood score ($loglik), 
		the evolutionary rate ($rates), the standard error ($se), a matrix indicating 
		the probabilities of change among all possibl states ($index.matrix), and matrix comprised 
		of the marginal likelihood of each character state at each noe ($lik.anc). 
			
	- # Stochastic mapping - SIMMAP  #
	- First, we need to assess the Q matrix including rates for shift between states. So, we have to know which model 
	fit our data: Equal rate (ER) or all-rates-different (ARD) models.
	- If I'm comparing diferent models I need to use AIC scores.
	
	-The command pchisq(value,df) gives the percentage of the cumulative distribution function for chisquare that lies to
	the left of the given value for a desired degree of freedom (df). 
	The following command gives the percentage of the chisquare distribution that lies to the 
	right of the observed likelihood difference for the ER and ARD models.
	
	## if p>0.05, we do not accept the more heavily parameterized ARD model, and instead choose the single-parameter ER 	model. If p<0.05, we do accept ARD model. 
	
	- We can now produce the stochastic mapping of the "trait" uing the make.simmap() from the phytools package. 
	We simulate stochastic character maps using the equal rate (ER) model, a priori on the root state (pi="estimated", 	which estimated by numerically solving pi*Q = 0), a samples of Q matrices from the posterior probability distribution of 	Q using MCMC (Markov chain Monte Carlo).    
	- We can laso compute the state frequencies from the stochastic maps for each internal nodes. Posterior probabilities 		are illustrated by pies 



	
	- Done using RevBayes (by Natya)-ongoing 



	

> ## PART II:  Divergence times estimation (cannot be done until we get the alignments)
> ### Aim 1: Determining relationships among living species, so branch lengths can be transformed using either a) strict or b) relaxed clock model.
	 
>	 - Data needed: Molecular sequence data (so we only get relative ages-since no geolofical info is provided)
>         - Ask Tania's Collaborators for their molecular seq alignments they used for the tree( that was built in BEAST?
> ### Aim 2: Using fossil records to calibrate absolute times a) node dating b) fossilized birth death process
> ### Aim 3: Total evidence dating (requires fossil information -ask Tania if she has it)


> # Pipeline for Brittle Star Project 2 (Species Complex)
> ## Data collected: Morphological character data and COI, ITS, 16S, 28S)
>       - Made gene trees using RAxML
>       - Made species tree(concatenated alignments/supermatrix) using RAxML
>       - Need to do Species Delimitation : ABGD and GMYC 
> What needs to be done with help of Natya 
# References:
1. [Antitropical distributions and species delimitation in a group of ophiocomid brittle stars(Echinodermata: Ophiuroidea: Ophiocomidae)](https://www.sciencedirect.com/science/article/pii/S1055790314001857)

2. [Species delimitation in the presence of strong incomplete lineage sorting and hybridization: Lessons from Ophioderma (Ophiuroidea: Echinodermata)](https://www.sciencedirect.com/science/article/pii/S1055790318302811?via%3Dihub)

3. [Cryptic diversity, low connectivity and suspected human-mediated dispersal among 17 widespread Indo-Pacific hydroid species of the south-western Indian Ocean](https://onlinelibrary.wiley.com/doi/pdf/10.1111/jbi.13388)

4. [Molecular species delimitation methods and population genetics data reveal extensive lineage diversity and cryptic species in Aglaopheniidae (Hydrozoa)](https://www.sciencedirect.com/science/article/pii/S1055790316302068#f0030)

