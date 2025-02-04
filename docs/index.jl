### A Pluto.jl notebook ###
# v0.17.2

using Markdown
using InteractiveUtils

# ╔═╡ 22c33fe6-4efd-11ec-351c-25a9d73ec50a
begin
	let
		using Pkg
		Pkg.activate(mktempdir())
		Pkg.Registry.update()
		Pkg.add("PlutoUI")
		Pkg.add("CairoMakie")
		Pkg.add("BenchmarkTools.jl")
		Pkg.add(url="https://github.com/Dale-Black/DistanceTransforms.jl")
	end
	
	using PlutoUI
	using CairoMakie
	using BenchmarkTools
	using DistanceTransforms
end

# ╔═╡ 0095c4d9-e9d0-4769-83ff-fd7f4346be8f
md"""
## Import packages
First, let's import the most up-to-date version of DistanceTransforms.jl, which can be found on the main/master branch of the [GitHub repository](https://github.com/Dale-Black/DistanceTransforms.jl). 

Because we are using the unregistered version (most recent) we will need to `Pkg.add` this explicitly, without using Pluto's built-in package manager. Be aware, this can take a long time, especially if this is the first time being downloaded. Future work on this package will focus on improving this.

To help with the formatting of this documentation we will also add [PlutoUI.jl](https://github.com/JuliaPluto/PlutoUI.jl).

Lastly, to visualize results and time the functions were going to add [Makie.jl](https://github.com/JuliaPlots/Makie.jl) and [BenchmarkTools.jl](https://github.com/JuliaCI/BenchmarkTools.jl).
"""

# ╔═╡ d70e8f0c-9052-47a4-bac7-af8362afda2c
md"""
## Quick start
Distance transforms are an important part of many computer vision-related tasks. Let's create some sample data and see how DistanceTransforms.jl can be used to apply efficient distance transform operations on arrays in Julia.
"""

# ╔═╡ 6c01894f-442a-497c-9519-dfc18b63be06
md"""
The quintessential distance transform operation in DistanceTransforms.jl is just a wrapper function combining the `feature_transform` and `distance_transform` functions from the excellent [ImageMorphology](https://github.com/JuliaImages/ImageMorphology.jl) package. 

To utilize this in DistanceTransforms.jl all one must do is call `euclidean(x)`
"""

# ╔═╡ 023529de-8f6b-4339-89a6-23d8b8fb881f
array1 = [
	1 0 0 1
	1 1 1 1
	0 0 1 1
]

# ╔═╡ cc17f05a-6e29-4a81-a45f-2dcfdedf2e88
euclidean(array1)

# ╔═╡ 0ad7423a-f2ff-417a-bfd1-e400a994e88c
md"""
As you can see, each element in the array is either a zero, which remains zero, or is one that then gets replaced by the Euclidean distance to the nearest zero. 

We can see this easily using Makie.jl.
"""

# ╔═╡ fde6da34-cd4d-4d97-aeb5-5a745cdffa13


# ╔═╡ Cell order:
# ╟─0095c4d9-e9d0-4769-83ff-fd7f4346be8f
# ╠═22c33fe6-4efd-11ec-351c-25a9d73ec50a
# ╟─d70e8f0c-9052-47a4-bac7-af8362afda2c
# ╟─6c01894f-442a-497c-9519-dfc18b63be06
# ╠═023529de-8f6b-4339-89a6-23d8b8fb881f
# ╠═cc17f05a-6e29-4a81-a45f-2dcfdedf2e88
# ╟─0ad7423a-f2ff-417a-bfd1-e400a994e88c
# ╠═fde6da34-cd4d-4d97-aeb5-5a745cdffa13
