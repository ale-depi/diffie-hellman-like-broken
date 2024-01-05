# title
print("\033[36m╔═════════════════════════════════════════════════════════════════════╗\033[0m")
print("\033[36m║ A troyan Diffie-Hellman-like protocol based on proof of gullibility ║\033[0m")
print("\033[36m║ (automated version)                                                 ║\033[0m")
print("\033[36m╚═════════════════════════════════════════════════════════════════════╝\033[0m")



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
print("\033[36m┌──────────────┐\033[0m")
print("\033[36m│ The protocol │\033[0m")
print("\033[36m└──────────────┘\033[0m")

# 1
print("Encryptor compute the following.")
e1 = 2 * (x1 + x2)
print(f"e1 = \033[91m\033[1m{expand(e1)}\033[0m\033[0m\n")

# 2
print("Encryptor discloses e1.")
p1 = e1
print(f"p1 = e1 = \033[91m\033[1m{expand(e1)}\033[0m\033[0m\n")

# 3
print("Decryptor compute the followings.")
d1 = 2 * (y1 + y2)
print(f"d1 = 2 * (y1 + y2) = \033[91m\033[1m{expand(d1)}\033[0m\033[0m")
d2 = y1 + 2 * y2
print(f"d2 = y1 + 2 * y2 = \033[91m\033[1m{expand(d2)}\033[0m\033[0m")
d3 = p1 * y1
print(f"d3 = p1 * y1 = \033[91m\033[1m{expand(d3)}\033[0m\033[0m")
d4 = p1 * d2
print(f"d4 = p1 * d2 = \033[91m\033[1m{expand(d4)}\033[0m\033[0m")
d6 = d3 - y3
print(f"d6 = d3 - y3 = \033[91m\033[1m{expand(d6)}\033[0m\033[0m")
d8 = y3 * (2 * d4 - d3) - d3 * d6 + y4
print(f"d8 = y3 * (2 * d4 - d3) - d3 * d6 + y4 = \033[91m\033[1m{expand(d8)}\033[0m\033[0m\n")

# 4
print("Decryptor discloses d1 and d8. Encryptor can compute the followings.")
p2 = d1
print(f"p2 = d1 = \033[91m\033[1m{expand(p2)}\033[0m\033[0m")
p3 = p1 * p2
print(f"p3 = p1 * p2 = \033[91m\033[1m{expand(p3)}\033[0m\033[0m")
p4 = d8
print(f"p4 = d8 = \033[91m\033[1m{expand(p4)}\033[0m\033[0m\n")

# 5
print("Encryptor computes the followings.")
e2 = x1 + 2 * x2
print(f"e2 = x1 + 2 * x2 = \033[91m\033[1m{expand(e2)}\033[0m\033[0m")
e3 = p2 * x1
print(f"e3 = p2 * x1 = \033[91m\033[1m{expand(e3)}\033[0m\033[0m")
e4 = p2 * e2
print(f"e4 = p2 * e2 = \033[91m\033[1m{expand(e4)}\033[0m\033[0m")
e6 = e3 - x3
print(f"e6 = e3 - x3 = \033[91m\033[1m{expand(e6)}\033[0m\033[0m")
e8 = x3 * (2 * e4 - e3) - e3 * e6 + x4
print(f"e8 = x3 * (2 * e4 - e3) - e3 * e6 + x4 = \033[91m\033[1m{expand(e8)}\033[0m\033[0m\n")

# 6
print("Encryptor discloses the following.")
p5 = e8
print(f"p5 = e8 = \033[91m\033[1m{expand(p5)}\033[0m\033[0m\n")

# 7
print("Decryptor computes the shared secret, i.e. d12.")
d7 = (2 * p3 + d3 + y3) * d4 + d3 ** 2
print(f"d7 = (2 * p3 + d3 + y3) * d4 + d3 ** 2 = \033[91m\033[1m{expand(d7)}\033[0m\033[0m")
d9 = d4 * (d3 + y3)
print(f"d9 = d4 * (d3 + y3) = \033[91m\033[1m{expand(d9)}\033[0m\033[0m")
d10 = d7 + d9
print(f"d10 = d7 + d9 = \033[91m\033[1m{expand(d10)}\033[0m\033[0m")
d11 = d10 + y4
print(f"d11 = d10 + y4 = \033[91m\033[1m{expand(d11)}\033[0m\033[0m")
d12 = d11 + p5
print(f"d12 = d11 + p5 = \033[91m\033[1m{expand(d12)}\033[0m\033[0m\n")

# 8
print("Encryptor computes the shared secret, i.e. e12.")
e7 = (2 * p3 + e3 + x3) * e4 + e3 ** 2
print(f"e7 = (2 * p3 + e3 + x3) * e4 + e3 ** 2 = \033[91m\033[1m{expand(e7)}\033[0m\033[0m")
e9 = e4 * (e3 + x3)
print(f"e9 = e4 * (e3 + x3) = \033[91m\033[1m{expand(e9)}\033[0m\033[0m")
e10 = e7 + e9
print(f"e10 = e7 + e9 = \033[91m\033[1m{expand(e10)}\033[0m\033[0m")
e11 = e10 + x4
print(f"e11 = e10 + x4 = \033[91m\033[1m{expand(e11)}\033[0m\033[0m")
e12 = e11 + p4
print(f"e12 = e11 + p4 = \033[91m\033[1m{expand(e12)}\033[0m\033[0m")



# protocol correctness
print()
print("\033[36m┌─────────────┐\033[0m")
print("\033[36m│ Correctness │\033[0m")
print("\033[36m└─────────────┘\033[0m")

correctness = bool(e12 == d12)
print(f"The protocol is correct since <e12 == d12> is \033[91m\033[1m{correctness}\033[0m\033[0m.")



# key computation of the original paper
print()
print("\033[36m┌──────────┐\033[0m")
print("\033[36m│ The flaw │\033[0m")
print("\033[36m└──────────┘\033[0m")

print("The original paper claims that the key (i.e. the shared secret) is")
print("\nK = p4 + p5 + 2 * p3 ** 2 - p3 * (e6 + d6)\n")
K = p4 + p5 + 2 * p3 ** 2 - p3 * (e6 + d6)
print("i.e.")
print(f"\nK = \033[91m\033[1m{expand(K)}\033[0m\033[0m\n")

print("but as we can see")
is_K_equal_to_e12 = bool(K == e12)
print(f"\n<K == e12> is \033[91m\033[1m{is_K_equal_to_e12}\033[0m\033[0m.\n")

print("equivalently")
is_K_equal_to_d12 = bool(K == d12)
print(f"\n<K == d12> is \033[91m\033[1m{is_K_equal_to_d12}\033[0m\033[0m.")



# actual key computation
print()
print("\033[36m┌────────────┐\033[0m")
print("\033[36m│ Actual key │\033[0m")
print("\033[36m└────────────┘\033[0m")

print("We can compute the difference between K and (for instance) e12")
difference_K_and_e12 = K - e12
print(f"\nK - e12 = \033[91m\033[1m{expand(difference_K_and_e12)}\033[0m\033[0m\n")

expr = -p3 * (e6 + d6)
is_difference_equal_to_expr = bool(difference_K_and_e12 == expr)
print(f"and see that <K - e12 == -p3 * (e6 + d6)> is \033[91m\033[1m{is_difference_equal_to_expr}\033[0m\033[0m.")

is_e12_made_by_only_public_values = bool(e12 == 2*p3**2 + p4 + p5)
print(f"This implies that <e12 == 2*p3**2 + p4 + p5> is \033[91m\033[1m{is_e12_made_by_only_public_values}\033[0m\033[0m")
print("proving that the shared secret can be computed using only public values.")
print("Therefore, the protocol cannot be used.\n")
