# Pipeline for Brittle Star Project 1
	-  Morphological Data collected by Tania
	-  Genomic data and time calibrated ultrametic tree made by O'Hara etal
	
	
## PART I: Divergence times estimation 
 Aim 1: Determining relationships among living species, so branch lengths can be transformed using either a) strict or b) relaxed clock model.
 Aim 2: Using fossil records to calibrate absolute times a) node dating b) fossilized birth death process

	1.- Construct a new time calibrated phylogeny in Beast 
		- following the topology of the molecular tree (constrain - monophyletic groups) (Prior)
		- including the assumption of the position of the fossil data (Prior)
	- Data used: nexus file with the morphological matrix
		- The name of species should be the same for all the files to be consistent 
		
## PART II: Ancestral state reconstructions (using R) (-already done using Mesquite-) 
		
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
		- I need to do it again for each trait 
	- First, we need to assess the Q matrix including rates for shift between states. So, we have to know which model 
	fit our data: Equal rate (ER) or all-rates-different (ARD) models.
	- If I'm comparing diferent models I need to use AIC scores.
	
	-The command pchisq(value,df) gives the percentage of the cumulative distribution function for chisquare that lies to
	the left of the given value for a desired degree of freedom (df). 
	The following command gives the percentage of the chisquare distribution that lies to the 
	right of the observed likelihood difference for the ER and ARD models.
	
	## if p>0.05, we do not accept the more heavily parameterized ARD model, and instead choose the single-parameter 
	ER model. If p<0.05, we do accept ARD model. 
	
	- We can now produce the stochastic mapping of the "trait" uing the make.simmap() from the phytools package. 
	We simulate stochastic character maps using the equal rate (ER) model, a priori on the root state 
	(pi="estimated", which estimated by numerically solving pi*Q = 0), a samples of Q matrices from the posterior 		probability distribution of Q using MCMC (Markov chain Monte Carlo).    
	- We can laso compute the state frequencies from the stochastic maps for each internal nodes. Posterior probabilities 		are illustrated by pies 

> ## What needs to be done with help of Natya ##
	3.- Lineage of diversification (transitions of two states in the diversification) 
		- Extinction and Speciation 
		- to know the transition between one trait and another: Do we know what is the rate of trait transition?
	
	4.- Rate of evolution (morphological data) 
		- Using a Brownian motion 
		- One rate for all the species 
		- One rate for the tropical 
		- One rate for the temperate 
		- One rate for the deep, shallow, larvae et.c. 
		-AIC value: what have an impact on the morphology of the species 
		
	6.- Continous traits 
	 We’ll start by loading in a phylogenetic tree and data into R. Using the function OUwie() from the R package OUwie,
	 we will compare the fit of different models: one rate (sigma squared) Brownian motion (BM) model (BM1); a two-rates 
	 BM model (BMS); a Ornstein-Ulhenbeck (OU) model with a single optimum for all species (OU1); a OU model different 
	 state means (theta) and a single alpha and sigma squared acting all regimes (OUM); a OU model that assumes different
	 optima (theta) as well as sigma squared (OUMV); a OU model that assumes different optima (theta) as well as alpha
	 (OUMA); a OU model that assumes different optima (theta) as well as sigma squared and alpha (OUMVA). 
	 We’ll be using published data for damselfishes.
	- Packages in R: OUwie, phytools and geiger
	- OUI- univarate data / mvMorph- multivariate data - In this case I need to use mvmorph 

	
> ## What needs to be done with help of Natya ##	
	5.- Morphospace --- I don't know how to do this!!
		- PcoA in R 
		- Traits: body size (range), number of papillae, scales, laps, choose all the characters that are informative (5 to 10 ch) 
	
	

# Pipeline for Chapter 2 (Species Complex- Cryptic species)
> ## Data collected: Morphological character data and COI, ITS, 16S, 28S
	- Total of sequences: xxx / xx outgroup 
	- Species tree (concatenated alignments/supermatrix) - Beast (Tania) 
	- Outpout: species tree (ultrametric tree) performed in Beast 
	
	- Partition finder best schemes: 
Nexus formatted character sets
begin sets;
	charset Subset1 = 1-496;
	charset Subset2 = 497-1423;
	charset Subset3 = 1424-2097\3;
	charset Subset4 = 1425-2097\3;
	charset Subset5 = 1426-2097\3;
	charset Subset6 = 2098-2581\3 2099-2581\3 2100-2581\3;
	charpartition PartitionFinder = Group1:Subset1, Group2:Subset2, Group3:Subset3, Group4:Subset4, Group5:Subset5, Group6:Subset6;
end;
	- IQtree (concatenated aligngments)- Tania 
#nexus
begin sets;
	charset Subset1 = 1-496;
	charset Subset2 = 497-1423;
	charset Subset3 = 1424-2097\3;
	charset Subset4 = 1425-2097\3;
	charset Subset5 = 1426-2097\3;
	charset Subset6 = 2098-2581\3 2099-2581\3 2100-2581\3;
	charpartition PartitionFinder = TVM+G:Subset1, HKY+I:Subset2, GTR+I+G:Subset3, TRN+I+G:Subset4, F81+I:Subset5, TVM+I+G:Subset6;
end;

MRBayes 
	begin mrbayes;

	charset Subset1 = 1-496;
	charset Subset2 = 497-1423;
	charset Subset3 = 1424-2097\3;
	charset Subset4 = 1425-2097\3;
	charset Subset5 = 1426-2097\3;
	charset Subset6 = 2098-2581\3 2099-2581\3 2100-2581\3;

	partition PartitionFinder = 6:Subset1, Subset2, Subset3, Subset4, Subset5, Subset6;
	set partition=PartitionFinder;

	lset applyto=(1) nst=6 rates=gamma;
	lset applyto=(2) nst=2 rates=propinv;
	lset applyto=(3) nst=6 rates=invgamma;
	lset applyto=(4) nst=6 rates=invgamma;
	lset applyto=(5) nst=1 rates=propinv;
	lset applyto=(6) nst=6 rates=invgamma;

	prset applyto=(all) ratepr=variable;
	unlink statefreq=(all) revmat=(all) shape=(all) pinvar=(all) tratio=(all);

end;

	
> ## What needs to be done with help of Natya ##
	- Once I have the ultrametic tree from (Beast or MRBayes or RaxML)
    	- Species Delimitation : ABGD, GMYC, Stacey (*Beast)
	
	- PCA for the morphological characters (8 ch. including the lateral arm plate data, size: disc diameter vs arm lenght) 

	



# References:
1. [Antitropical distributions and species delimitation in a group of ophiocomid brittle stars(Echinodermata: Ophiuroidea: Ophiocomidae)](https://www.sciencedirect.com/science/article/pii/S1055790314001857)

2. [Species delimitation in the presence of strong incomplete lineage sorting and hybridization: Lessons from Ophioderma (Ophiuroidea: Echinodermata)](https://www.sciencedirect.com/science/article/pii/S1055790318302811?via%3Dihub)

3. [Cryptic diversity, low connectivity and suspected human-mediated dispersal among 17 widespread Indo-Pacific hydroid species of the south-western Indian Ocean](https://onlinelibrary.wiley.com/doi/pdf/10.1111/jbi.13388)

4. [Molecular species delimitation methods and population genetics data reveal extensive lineage diversity and cryptic species in Aglaopheniidae (Hydrozoa)](https://www.sciencedirect.com/science/article/pii/S1055790316302068#f0030)

