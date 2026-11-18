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


# To write a file and save into this folder
library(data.table)
fwrite(vis$all$nodes,'node_info_for_cytoscape.csv', sep = ";")

