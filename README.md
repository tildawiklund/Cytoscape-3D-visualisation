# csVisuNet

<img src="images/VIsuNet_logo2.png" width=200; align="middle">

*** 
This is a work from komorowskilab/csVisuNet. The code supports 3D-visualisation. For instructions, see tildawiklund/3D-visualisation for more information.

How to run the 3D visualisation in Cytoscape:
The following code is available in [run_visunet.R](run_visunet.R). 

```R
library(R.ROSETTA)
library(devtools)
library(RCy3)


# Get functions for 3D implementation
devtools::install_github("tildawiklund/Cytoscape-3D-visualisation")

# If you have the folder locally on your computer:
#devtools::load_all("path to/Cytoscape-3D-visualisation")

# Run Rosetta
ros <- rosetta(autcon)

# Have cytoscape app open on computer
cytoscapePing() # to see if Cytoscape is open

# Make sure to have Cy3D downloaded
commandsRun("cy3d set renderer rendererID=org.baderlab.cy3d")

# VisuNet on Cytoscape in 3D format
vis <- visunetcyto3D(ros$main, title="Networks")
```

*** 

*** 
VisuNet is an interactive tool for network visualization of complex rule-based classifiers. VisuNet can be applied to any classification problem and is commonly used with complex health-related decision tasks. The rule networks produced can clearly identify driving genes (metabolites, methylation sites, etc) and their expression levels. 

VisuNet is implemented in R and uses the  [Shiny Gadgets](https://shiny.rstudio.com/articles/gadgets.html) attributes. The tool includes construction, filtration, visualization and customization of networks from rule-based models.
While csVIsuNet is the migrated version of VisuNet into Cytoscape. (https://cytoscape.org)



***
Installation
```R
devtools::install_github("tildawiklund/Cytoscape-3D-visualisation")
```

***
See the [documentation](https://komorowskilab.github.io/VisuNet/).
* The documentation reflects the previous version and not the current one!

