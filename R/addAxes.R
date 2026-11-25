#' This function adds "axes" to the csVisuNet by adding nodes that only contain
#' information about their position in a 3D network.
#' Needs RCy3
#' Len is suggested (because of design) to be at least 50 bigger than the largest possible normalised value

addAxes <- function(net, len = 350) {
  # Create one origin node and one endpoint for each axis
  ax <- c("AXIS_origin", "AXIS_X", "AXIS_Y", "AXIS_Z")

  # Add the axis nodes from ax above
  addCyNodes(ax, network = net)

  # Connect each node to the origo node with an undirected edge
  addCyEdges(list(c("AXIS_origin", "AXIS_X"),
                  c("AXIS_origin", "AXIS_Y"),
                  c("AXIS_origin", "AXIS_Z")),
             directed = FALSE, network = net)

  # Writes a data frame into the node table for cytoscape, 
  # sets each node’s coordinates in the columns:
  loadTableData(data.frame(name = ax,
                          X_AXIS_norm_meanAcc  = c(0, len, 0, 0),
                          Y_AXIS_norm_meanSupp = c(0, 0, len, 0),
                          Z_AXIS = c(0, 0, 0, len)),
                          data.key.column = "name", table.key.column = "name", network = net)

  # Label the axes and make the helper nodes small and gray
  setNodeLabelBypass(ax, c("origin", "X - Accuracy", "Y - Support", "Z"), network = net)
  setNodeFontSizeBypass(ax, 12, network = net)   # label size for the axis nodes
  setNodeColorBypass(ax, "#888888", network = net)
  setNodeSizeBypass(ax, 1, network = net)


}