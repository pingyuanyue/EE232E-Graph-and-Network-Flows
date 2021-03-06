library(igraph)
library(netrw)
#2a
n<-1000
g <- barabasi.game(n, power = -3,  directed = FALSE)

#2b
ave <- rep(NA,100)
sdv <- rep(NA,100)
for (t in (1:100)) {
    r<-netrw(g,walker.num = 1000, start.node = 1:vcount(g),
    T = t, output.walk.path = TRUE, output.walkers = 0:999)
    shortest_path <- rep(NA, 1000)
    for(w in (1:1000)) {
        temp <- get.shortest.paths(g, from = r$walk.path[1,w], to = r$walk.path[t,w])
        shortest_path[w] <- length(temp$vpath[[1]])-1
    }
    ave[t] <- mean(shortest_path)
    sdv[t] <- sd(shortest_path)
}

plot(1:100, ave, type = "o", xlab = "step", ylab = "average distance")
plot(1:100, sdv, type = "o", xlab = "step", ylab = "standard deviation")

#2d
#100nodes
n<-100
g <- barabasi.game(n, power = -3,  directed = FALSE)
ave <- rep(NA,100)
sdv <- rep(NA,100)
for (t in (1:100)) {
    r<-netrw(g,walker.num = 100, start.node = 1:vcount(g),
    T = t, output.walk.path = TRUE, output.walkers = 0:99)
    shortest_path <- rep(NA, 100)
    for(w in (1:100)) {
        temp <- get.shortest.paths(g, from = r$walk.path[1,w], to = r$walk.path[t,w])
        shortest_path[w] <- length(temp$vpath[[1]])-1
    }
    ave[t] <- mean(shortest_path)
    sdv[t] <- sd(shortest_path)
}

plot(1:100, ave, type = "o", xlab = "step", ylab = "average distance")
plot(1:100, sdv, type = "o", xlab = "step", ylab = "standard deviation")

#10000nodes
n<-10000
g <- barabasi.game(n, power = -3,  directed = FALSE)
ave <- rep(NA,100)
sdv <- rep(NA,100)
for (t in (1:100)) {
    r<-netrw(g,walker.num = 10000, start.node = 1:vcount(g),
    T = t, output.walk.path = TRUE, output.walkers = 0:9999)
    shortest_path <- rep(NA, 10000)
    for(w in (1:10000)) {
        temp <- get.shortest.paths(g, from = r$walk.path[1,w], to = r$walk.path[t,w])
        shortest_path[w] <- length(temp$vpath[[1]])-1
    }
    ave[t] <- mean(shortest_path)
    sdv[t] <- sd(shortest_path)
}

plot(1:100, ave, type = "o", xlab = "step", ylab = "average distance")
plot(1:100, sdv, type = "o", xlab = "step", ylab = "standard deviation")

#2e
end_degree <- rep(NA, 1000)
for(w in (1:1000)) {
    end_degree[w] <- degree(g, r$walk.path[100,w])
}
hist(end_degree, breaks = seq(-0.5, by = 1, length.out = max(end_degree)+2), xlab = "degree", ylab = "frequency")


