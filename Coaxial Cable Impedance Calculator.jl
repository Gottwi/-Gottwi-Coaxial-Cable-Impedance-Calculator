### A Pluto.jl notebook ###
# v0.12.18

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

# ╔═╡ ae4150e0-576d-11eb-078e-6faf6168efc5
using Images, FileIO, PlutoUI

# ╔═╡ 86d473c0-5781-11eb-3e20-b53b5978bb3e
import Pkg;

# ╔═╡ 8efa0600-5781-11eb-0d39-79fc34bdeb5f
Pkg.add("Images")

# ╔═╡ 981283c0-5781-11eb-0714-5bed06897785
Pkg.add("FileIO")

# ╔═╡ 9e249f50-5781-11eb-37b8-ef302bc8a883
Pkg.add("PlutoUI")

# ╔═╡ f59c3900-576d-11eb-07a2-9f76e97658f7
img_path = "https://raw.githubusercontent.com/Gottwi/-Gottwi-Coaxial-Cable-Impedance-Calculator/main/coax.jpg"

# ╔═╡ fee845ae-5774-11eb-1cea-43478b253779
img_path1 = "https://raw.githubusercontent.com/Gottwi/-Gottwi-Coaxial-Cable-Impedance-Calculator/main/value%20table.jpg"

# ╔═╡ 088f20c0-5775-11eb-3b95-d3ea1af0957d
img_path2 = "https://raw.githubusercontent.com/Gottwi/-Gottwi-Coaxial-Cable-Impedance-Calculator/main/formula.jpg"

# ╔═╡ 189662a0-576e-11eb-333b-53ca94e5e205
begin
	μ₀ = 12.566370614359e-7
	println()
end

# ╔═╡ 1d75ca90-576e-11eb-02ec-c389ea08a9df
begin
	c = 299792458
	println()
end

# ╔═╡ 23af1d32-576e-11eb-2ded-a768ebec09b5
begin
	ϵ₀ = 8.854187812813e-12
	println()
end

# ╔═╡ 27299df0-576e-11eb-1d6f-01622aec1d82
Resource(img_path)

# ╔═╡ bc8532b0-5778-11eb-35c5-f16c09c7814a
md"""
Outer Diameter (**D**), Inner Diameter (**d**) Values in milli meters (**mm**)
"""

# ╔═╡ 4e888ad0-577a-11eb-3e61-b5db1f89a3af
md"""
**Example:**
**RG58**
  
**d** = 0.81 mm; **D** = 2.95 mm; **ϵᵣ** = 2.3;

**C**  ≈ 99 pF/m; **L**  ≈ 259 µH/m; **Z**  ≈ 51 Ω;
"""

# ╔═╡ 30e587a0-576e-11eb-0b92-990fead62ca1
d = (@bind d html"<input type=number >")


# ╔═╡ 357c26c2-576e-11eb-1dad-47c3d1f04837
D = (@bind D html"<input type=number >")


# ╔═╡ 38d4c7a0-576e-11eb-1cf0-0dedb82c2504
ϵᵣ = (@bind ϵᵣ html"<input type=number >")


# ╔═╡ 395912d0-576e-11eb-1fd0-7132d4006563
begin
	C = (2*π*ϵ₀*ϵᵣ/log(D/d)*1000000000000)
	string("C = ",C," pF/m")
end

# ╔═╡ 4258b160-576e-11eb-123d-e34fccb0e9eb
begin
	L = (μ₀/2*π*log(D/d)*100000000)
	string("L = ",L," μH/m")
end

# ╔═╡ 43dce060-576e-11eb-3dd5-cffcbe8f62f3
begin
	Z = (L*10/C)^(1/2)*10
	string("Z = ",Z," Ω")
end

# ╔═╡ 4352efe0-576e-11eb-2a13-812571ffa0e3
Resource(img_path2)

# ╔═╡ b2cbfd90-5777-11eb-30c5-335a07fed153
md"""

*d - The outside diameter of the inner or center conductor*

*D - Inside diameter of the shield*

*εr - Relative Permeability of the dielectric between the inner and outer conductors*

*Z - Characteristic impedance in Ω*

*C - Capacitance in pF/Meter*

*L - Inductance in µH / metre*

"""

# ╔═╡ e29376f0-5774-11eb-149f-1fc274c1ce8a
Resource(img_path1)

# ╔═╡ Cell order:
# ╟─86d473c0-5781-11eb-3e20-b53b5978bb3e
# ╟─8efa0600-5781-11eb-0d39-79fc34bdeb5f
# ╟─981283c0-5781-11eb-0714-5bed06897785
# ╟─9e249f50-5781-11eb-37b8-ef302bc8a883
# ╟─ae4150e0-576d-11eb-078e-6faf6168efc5
# ╟─f59c3900-576d-11eb-07a2-9f76e97658f7
# ╟─fee845ae-5774-11eb-1cea-43478b253779
# ╟─088f20c0-5775-11eb-3b95-d3ea1af0957d
# ╟─189662a0-576e-11eb-333b-53ca94e5e205
# ╟─1d75ca90-576e-11eb-02ec-c389ea08a9df
# ╟─23af1d32-576e-11eb-2ded-a768ebec09b5
# ╟─27299df0-576e-11eb-1d6f-01622aec1d82
# ╟─bc8532b0-5778-11eb-35c5-f16c09c7814a
# ╟─4e888ad0-577a-11eb-3e61-b5db1f89a3af
# ╟─30e587a0-576e-11eb-0b92-990fead62ca1
# ╟─357c26c2-576e-11eb-1dad-47c3d1f04837
# ╟─38d4c7a0-576e-11eb-1cf0-0dedb82c2504
# ╟─395912d0-576e-11eb-1fd0-7132d4006563
# ╟─4258b160-576e-11eb-123d-e34fccb0e9eb
# ╟─43dce060-576e-11eb-3dd5-cffcbe8f62f3
# ╟─4352efe0-576e-11eb-2a13-812571ffa0e3
# ╟─b2cbfd90-5777-11eb-30c5-335a07fed153
# ╟─e29376f0-5774-11eb-149f-1fc274c1ce8a
