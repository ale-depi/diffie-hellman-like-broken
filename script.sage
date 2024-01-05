# title
print("╔═════════════════════════════════════════════════════════════════════╗")
print("║ A troyan Diffie-Hellman-like protocol based on proof of gullibility ║")
print("║ (automated version)                                                 ║")
print("╚═════════════════════════════════════════════════════════════════════╝")



# private modular integers
x1, x2, x3, x4 = var("x1 x2 x3 x4")   # Encryptor
y1, y2, y3, y4 = var("y1 y2 y3 y4")   # Decryptor

# derivatives
d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12 = var("d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12")
e1, e2, e3, e4, e5, e6, e7, e8, e9, e10, e11, e12 = var("e1 e2 e3 e4 e5 e6 e7 e8 e9 e10 e11 e12")

# disclosed values (i.e. public)
p1, p2, p3, p4, p5 = var("p1 p2 p3 p4 p5")

# mixes the private values used by both parties
q1, q2 = var("q1 q2")



# protocol correctness
print()
print("┌──────────────┐")
print("│ The protocol │")
print("└──────────────┘")

# 1
print("Encryptor compute the following.")
e1 = 2 * (x1 + x2)
print(f"e1 = {expand(e1)}\n")

# 2
print("Encryptor discloses e1.")
p1 = e1
print(f"p1 = e1 = {expand(e1)}\n")

# 3
print("Decryptor compute the followings.")
d1 = 2 * (y1 + y2)
print(f"d1 = 2 * (y1 + y2) = {expand(d1)}")
d2 = y1 + 2 * y2
print(f"d2 = y1 + 2 * y2 = {expand(d2)}")
d3 = p1 * y1
print(f"d3 = p1 * y1 = {expand(d3)}")
d4 = p1 * d2
print(f"d4 = p1 * d2 = {expand(d4)}")
d6 = d3 - y3
print(f"d6 = d3 - y3 = {expand(d6)}")
d8 = y3 * (2 * d4 - d3) - d3 * d6 + y4
print(f"d8 = y3 * (2 * d4 - d3) - d3 * d6 + y4 = {expand(d8)}\n")

# 4
print("Decryptor discloses d1 and d8. Encryptor can compute the followings.")
p2 = d1
print(f"p2 = d1 = {expand(p2)}")
p3 = p1 * p2
print(f"p3 = p1 * p2 = {expand(p3)}")
p4 = d8
print(f"p4 = d8 = {expand(p4)}\n")

# 5
print("Encryptor computes the followings.")
e2 = x1 + 2 * x2
print(f"e2 = x1 + 2 * x2 = {expand(e2)}")
e3 = p2 * x1
print(f"e3 = p2 * x1 = {expand(e3)}")
e4 = p2 * e2
print(f"e4 = p2 * e2 = {expand(e4)}")
e6 = e3 - x3
print(f"e6 = e3 - x3 = {expand(e6)}")
e8 = x3 * (2 * e4 - e3) - e3 * e6 + x4
print(f"e8 = x3 * (2 * e4 - e3) - e3 * e6 + x4 = {expand(e8)}\n")

# 6
print("Encryptor discloses the following.")
p5 = e8
print(f"p5 = e8 = {expand(p5)}\n")

# 7
print("Decryptor computes the shared secret, i.e. d12.")
d7 = (2 * p3 + d3 + y3) * d4 + d3 ** 2
print(f"d7 = (2 * p3 + d3 + y3) * d4 + d3 ** 2 = {expand(d7)}")
d9 = d4 * (d3 + y3)
print(f"d9 = d4 * (d3 + y3) = {expand(d9)}")
d10 = d7 + d9
print(f"d10 = d7 + d9 = {expand(d10)}")
d11 = d10 + y4
print(f"d11 = d10 + y4 = {expand(d11)}")
d12 = d11 + p5
print(f"d12 = d11 + p5 = {expand(d12)}\n")

# 8
print("Encryptor computes the shared secret, i.e. e12.")
e7 = (2 * p3 + e3 + x3) * e4 + e3 ** 2
print(f"e7 = (2 * p3 + e3 + x3) * e4 + e3 ** 2 = {expand(e7)}")
e9 = e4 * (e3 + x3)
print(f"e9 = e4 * (e3 + x3) = {expand(e9)}")
e10 = e7 + e9
print(f"e10 = e7 + e9 = {expand(e10)}")
e11 = e10 + x4
print(f"e11 = e10 + x4 = {expand(e11)}")
e12 = e11 + p4
print(f"e12 = e11 + p4 = {expand(e12)}\n")



# protocol correctness
print()
print("┌─────────────┐")
print("│ Correctness │")
print("└─────────────┘")

correctness = bool(e12 == d12)
print(f"The protocol is correct since <e12 == d12> is {correctness}.")



# key computation of the original paper
print()
print("┌──────────┐")
print("│ The flaw │")
print("└──────────┘")

print("The original paper claims that the key (i.e. the shared secret) is")
print("\nK = p4 + p5 + 2 * p3 ** 2 - p3 * (e6 + d6)\n")
K = p4 + p5 + 2 * p3 ** 2 - p3 * (e6 + d6)
print("i.e.")
print(f"\nK = {expand(K)}\n")

print("but as we can see")
is_K_equal_to_e12 = bool(K == e12)
print(f"\n<K == e12> is {is_K_equal_to_e12}.\n")

print("equivalently")
is_K_equal_to_d12 = bool(K == d12)
print(f"\n<K == d12> is {is_K_equal_to_d12}.\n")



# actual key computation
print()
print("┌────────────┐")
print("│ Actual key │")
print("└────────────┘")

print("We can compute the difference between K and (for instance) e12")
difference_K_and_e12 = K - e12
print(f"\nK - e12 = {expand(difference_K_and_e12)}\n")

expr = -p3 * (e6 + d6)
is_difference_equal_to_expr = bool(difference_K_and_e12 == expr)
print(f"and see that <K - e12 == -p3 * (e6 + d6)> is {is_difference_equal_to_expr}.")

is_e12_made_by_only_public_values = bool(e12 == 2*p3**2 + p4 + p5)
print(f"This implies that <e12 == 2*p3**2 + p4 + p5> is {is_e12_made_by_only_public_values}")
print("proving that the shared secret can be computed using only public values.")
print("Therefore, the protocol cannot be used.\n")
