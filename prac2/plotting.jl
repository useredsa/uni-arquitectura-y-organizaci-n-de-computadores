using DataFrames
using CSV
using Cairo
using Fontconfig
using Gadfly

df = CSV.read("heat.all.tsv")
p = plot(
    df,
    xgroup = :DataSet,
    x = :Threads,
    y = Col.value(Symbol("Inner(Bad)"), :Inner, :Outer, :Collapse),
    color = Col.index(Symbol("Inner(Bad)"), :Inner, :Outer, :Collapse),
    Geom.subplot_grid(Geom.point, Geom.line),
    Guide.ylabel("Time(s)"),
)

img = PNG("times-plot.png", 20cm, 8cm)
draw(img, p)

