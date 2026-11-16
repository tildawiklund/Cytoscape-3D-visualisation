#' This function adds "axes" to the csVisuNet by adding nodes that only contain
#' information about their position in a 3D network.


addAxes <- function(net, len = 350, zlen = 350, x0 = 0, y0 = 0) {
  # Create one origin node and one endpoint for each axis.
  ax <- c("AXIS_origin", "AXIS_X", "AXIS_Y", "AXIS_Z")

  # Add the axis nodes + connect each endpoint to origo with an undirected edge
  addCyNodes(ax, network = net)
  addCyEdges(list(c("AXIS_origin", "AXIS_X"),
                  c("AXIS_origin", "AXIS_Y"),
                  c("AXIS_origin", "AXIS_Z")),
             directed = FALSE, network = net)

  # Store coordinates in the same columns used by the network's style
  # mappings. The X and Y axes extend by len; the Z axis extends by zlen.
  loadTableData(data.frame(name = ax,
                           X_AXIS_norm_meanAcc  = c(x0, x0 + len, x0, x0),
                           Y_AXIS_norm_meanSupp = c(y0, y0, y0 + len, y0),
                           Z_AXIS_norm_meanDecCov = c(0, 0, 0, zlen)),
                data.key.column = "name", table.key.column = "name",
                network = net)

  # Label the axes and make the helper nodes small and gray
  setNodeLabelBypass(ax, c("origin", "X - Accuracy", "Y - Support", "Z - Decision Coverage"), network = net)
  setNodeFontSizeBypass(ax, 12, network = net)   # label size for the axis nodes
  setNodeColorBypass(ax, "#888888", network = net)
  setNodeSizeBypass(ax, 1, network = net)


}