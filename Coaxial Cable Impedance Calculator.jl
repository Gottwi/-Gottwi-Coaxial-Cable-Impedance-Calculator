### A Pluto.jl notebook ###
# v0.12.11

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : missing
        el
    end
end

# ╔═╡ d3eeb080-36e8-11eb-310e-695198ff1664
using Images, FileIO

# ╔═╡ 1b67b8c0-387a-11eb-295f-878eca45e4f6
img_path = "C:\\Users\\Norbi\\.julia\\environments\\v1.5\\coax.jpg"

# ╔═╡ 726d42d0-387e-11eb-15fd-7ba5973271ce
begin
	μ₀ = 12.566370614359e-7
	println()
end

# ╔═╡ 0880c172-387f-11eb-00a2-2362ffb4c6b3
begin
	c = 299792458
	println()
end

# ╔═╡ 1ae32d30-387f-11eb-1c20-9d732d30e327
begin
	ϵ₀ = 8.854187812813e-12
	println()
end

# ╔═╡ 924be680-387c-11eb-3bd4-17cfa93635c1
load(img_path)

# ╔═╡ e85d3dd0-3886-11eb-122d-114ff9f94a50
"Outer Diameter (D), Inner Diameter (d) Values in milli meters (mm)"

# ╔═╡ f58bfb60-35fa-11eb-2fd6-517766948b8f
d = (@bind d html"<input type=number >")

# ╔═╡ 4c638d0e-35fe-11eb-3f9d-4b638ed3033d
D = (@bind D html"<input type=number >")

# ╔═╡ 4d20c28e-35fe-11eb-2ff0-35f2b24ffd2a
ϵᵣ = (@bind ϵᵣ html"<input type=number >")

# ╔═╡ e47c0dfe-35ff-11eb-3a72-31f07f20035f
begin
	C = (2*π*ϵ₀*ϵᵣ/log(D/d)*1000000000000)
	string("C = ",C," pF/m")
end

# ╔═╡ ffa295f0-35ff-11eb-286e-e533fac4d409
begin
	L = (μ₀/2*π*log(D/d)*100000000)
	string("L = ",L," μH/m")
end

# ╔═╡ 264ecb10-3600-11eb-138a-514ad55c91af
begin
	Z = (L*10/C)^(1/2)*10
	string("Z = ",Z," Ω")
end

# ╔═╡ Cell order:
# ╟─d3eeb080-36e8-11eb-310e-695198ff1664
# ╟─1b67b8c0-387a-11eb-295f-878eca45e4f6
# ╟─726d42d0-387e-11eb-15fd-7ba5973271ce
# ╟─0880c172-387f-11eb-00a2-2362ffb4c6b3
# ╟─1ae32d30-387f-11eb-1c20-9d732d30e327
# ╟─924be680-387c-11eb-3bd4-17cfa93635c1
# ╠═e85d3dd0-3886-11eb-122d-114ff9f94a50
# ╟─f58bfb60-35fa-11eb-2fd6-517766948b8f
# ╟─4c638d0e-35fe-11eb-3f9d-4b638ed3033d
# ╟─4d20c28e-35fe-11eb-2ff0-35f2b24ffd2a
# ╟─e47c0dfe-35ff-11eb-3a72-31f07f20035f
# ╟─ffa295f0-35ff-11eb-286e-e533fac4d409
# ╟─264ecb10-3600-11eb-138a-514ad55c91af
