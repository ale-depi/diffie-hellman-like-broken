darkcyan_begin = "\033[36;01m"
darkcyan_end = "\033[00m"
redbold_begin = "\033[91;01m"
redbold_end = "\033[00m"

# title
print(f"{darkcyan_begin}╔═════════════════════════════════════════════════════════════════════╗{darkcyan_end}")
print(f"{darkcyan_begin}║ A troyan Diffie-Hellman-like protocol based on proof of gullibility ║{darkcyan_end}")
print(f"{darkcyan_begin}║ (automated version)                                                 ║{darkcyan_end}")
print(f"{darkcyan_begin}╚═════════════════════════════════════════════════════════════════════╝{darkcyan_end}")



# private modular integers
x1, x2, x3, x4 = var("x1 x2 x3 x4")   # Encryptor
y1, y2, y3, y4 = var("y1 y2 y3 y4")   # Decryptor



# protocol correctness
print()
print(f"{darkcyan_begin}┌──────────────┐{darkcyan_end}")
print(f"{darkcyan_begin}│ The protocol │{darkcyan_end}")
print(f"{darkcyan_begin}└──────────────┘{darkcyan_end}")

# 1
print("Encryptor compute the following.")
e1 = 2 * (x1 + x2)
print(f"e1 = {redbold_begin}{expand(e1)}{redbold_end}\n")

# 2
print("Encryptor discloses e1.")
p1 = e1
print(f"p1 = e1 = {redbold_begin}{expand(e1)}{redbold_end}\n")

# 3
print("Decryptor compute the followings.")
d1 = 2 * (y1 + y2)
print(f"d1 = 2 * (y1 + y2) = {redbold_begin}{expand(d1)}\033[0m{darkcyan_end}")
d2 = y1 + 2 * y2
print(f"d2 = y1 + 2 * y2 = {redbold_begin}{expand(d2)}\033[0m{darkcyan_end}")
d3 = p1 * y1
print(f"d3 = p1 * y1 = {redbold_begin}{expand(d3)}\033[0m{darkcyan_end}")
d4 = p1 * d2
print(f"d4 = p1 * d2 = {redbold_begin}{expand(d4)}\033[0m{darkcyan_end}")
d6 = d3 - y3
print(f"d6 = d3 - y3 = {redbold_begin}{expand(d6)}\033[0m{darkcyan_end}")
d8 = y3 * (2 * d4 - d3) - d3 * d6 + y4
print(f"d8 = y3 * (2 * d4 - d3) - d3 * d6 + y4 = {redbold_begin}{expand(d8)}{redbold_end}\n")

# 4
print("Decryptor discloses d1 and d8. Encryptor can compute the followings.")
p2 = d1
print(f"p2 = d1 = {redbold_begin}{expand(p2)}\033[0m{darkcyan_end}")
p3 = p1 * p2
print(f"p3 = p1 * p2 = {redbold_begin}{expand(p3)}\033[0m{darkcyan_end}")
p4 = d8
print(f"p4 = d8 = {redbold_begin}{expand(p4)}{redbold_end}\n")

# 5
print("Encryptor computes the followings.")
e2 = x1 + 2 * x2
print(f"e2 = x1 + 2 * x2 = {redbold_begin}{expand(e2)}\033[0m{darkcyan_end}")
e3 = p2 * x1
print(f"e3 = p2 * x1 = {redbold_begin}{expand(e3)}\033[0m{darkcyan_end}")
e4 = p2 * e2
print(f"e4 = p2 * e2 = {redbold_begin}{expand(e4)}\033[0m{darkcyan_end}")
e6 = e3 - x3
print(f"e6 = e3 - x3 = {redbold_begin}{expand(e6)}\033[0m{darkcyan_end}")
e8 = x3 * (2 * e4 - e3) - e3 * e6 + x4
print(f"e8 = x3 * (2 * e4 - e3) - e3 * e6 + x4 = {redbold_begin}{expand(e8)}{redbold_end}\n")

# 6
print("Encryptor discloses the following.")
p5 = e8
print(f"p5 = e8 = {redbold_begin}{expand(p5)}{redbold_end}\n")

# 7
print("Decryptor computes the shared secret, i.e. d12.")
d7 = (2 * p3 + d3 + y3) * d4 + d3 ** 2
print(f"d7 = (2 * p3 + d3 + y3) * d4 + d3 ** 2 = {redbold_begin}{expand(d7)}\033[0m{darkcyan_end}")
d9 = d4 * (d3 + y3)
print(f"d9 = d4 * (d3 + y3) = {redbold_begin}{expand(d9)}\033[0m{darkcyan_end}")
d10 = d7 + d9
print(f"d10 = d7 + d9 = {redbold_begin}{expand(d10)}\033[0m{darkcyan_end}")
d11 = d10 + y4
print(f"d11 = d10 + y4 = {redbold_begin}{expand(d11)}\033[0m{darkcyan_end}")
d12 = d11 + p5
print(f"d12 = d11 + p5 = {redbold_begin}{expand(d12)}{redbold_end}\n")

# 8
print("Encryptor computes the shared secret, i.e. e12.")
e7 = (2 * p3 + e3 + x3) * e4 + e3 ** 2
print(f"e7 = (2 * p3 + e3 + x3) * e4 + e3 ** 2 = {redbold_begin}{expand(e7)}\033[0m{darkcyan_end}")
e9 = e4 * (e3 + x3)
print(f"e9 = e4 * (e3 + x3) = {redbold_begin}{expand(e9)}\033[0m{darkcyan_end}")
e10 = e7 + e9
print(f"e10 = e7 + e9 = {redbold_begin}{expand(e10)}\033[0m{darkcyan_end}")
e11 = e10 + x4
print(f"e11 = e10 + x4 = {redbold_begin}{expand(e11)}\033[0m{darkcyan_end}")
e12 = e11 + p4
print(f"e12 = e11 + p4 = {redbold_begin}{expand(e12)}\033[0m{darkcyan_end}")



# alternative way to compute the shared secret
print()
print(f"{darkcyan_begin}┌──────────────────────────────────────────────┐{darkcyan_end}")
print(f"{darkcyan_begin}│ Alternative way to compute the shared secret │{darkcyan_end}")
print(f"{darkcyan_begin}└──────────────────────────────────────────────┘{darkcyan_end}")

q1 = 2 * (y1 + y2) * x2 + 2 * (x1 + x2) * y2
print(f"q1 = 2 * (y1 + y2) * x2 + 2 * (x1 + x2) * y2 = {redbold_begin}{expand(q1)}{redbold_end}")
q2 = q1 * (d3 + y3 + e3 + x3) + 3 * d3 * e3 + x3 * y3
print(f"q2 = q1 * (d3 + y3 + e3 + x3) + 3 * d3 * e3 + x3 * y3 = {redbold_begin}{expand(q2)}{redbold_end}")
shared_secret = e4 ** 2 + d4 ** 2 + 2 * q2 - 2 * e6 * d6 + x4 + y4
alternative_way = bool(shared_secret == e12)
print("The shared secret can be computed as <shared_secret = e4**2 + d4**2 + 2*q2 - 2*e6*d6 + x4 + y4>\n"
      f"in fact, if we check <shared_secret == e12>, it is {redbold_begin}{alternative_way}{redbold_end}.")



# protocol correctness
print()
print(f"{darkcyan_begin}┌─────────────┐{darkcyan_end}")
print(f"{darkcyan_begin}│ Correctness │{darkcyan_end}")
print(f"{darkcyan_begin}└─────────────┘{darkcyan_end}")

correctness = bool(e12 == d12)
print(f"The protocol is correct since <e12 == d12> is {redbold_begin}{correctness}{redbold_end}.")



# key computation of the original paper
print()
print(f"{darkcyan_begin}┌──────────┐{darkcyan_end}")
print(f"{darkcyan_begin}│ The flaw │{darkcyan_end}")
print(f"{darkcyan_begin}└──────────┘{darkcyan_end}")

print("The original paper claims that the key (i.e. the shared secret) is")
print("\nK = p4 + p5 + 2 * p3 ** 2 - p3 * (e6 + d6)\n")
K = p4 + p5 + 2 * p3 ** 2 - p3 * (e6 + d6)
print("i.e.")
print(f"\nK = {redbold_begin}{expand(K)}{redbold_end}\n")

print("but as we can see")
is_K_equal_to_e12 = bool(K == e12)
print(f"\n<K == e12> is {redbold_begin}{is_K_equal_to_e12}{redbold_end}.\n")

print("equivalently")
is_K_equal_to_d12 = bool(K == d12)
print(f"\n<K == d12> is {redbold_begin}{is_K_equal_to_d12}{redbold_end}.")



# actual key computation
print()
print(f"{darkcyan_begin}┌────────────┐{darkcyan_end}")
print(f"{darkcyan_begin}│ Actual key │{darkcyan_end}")
print(f"{darkcyan_begin}└────────────┘{darkcyan_end}")

print("We can compute the difference between K and (for instance) e12")
difference_K_and_e12 = K - e12
print(f"\nK - e12 = {redbold_begin}{expand(difference_K_and_e12)}{redbold_end}\n")

expr = -p3 * (e6 + d6)
is_difference_equal_to_expr = bool(difference_K_and_e12 == expr)
print(f"and see that <K - e12 == -p3 * (e6 + d6)> is {redbold_begin}{is_difference_equal_to_expr}{redbold_end}.")

is_e12_made_by_only_public_values = bool(e12 == 2*p3**2 + p4 + p5)
print(f"This implies that <e12 == 2*p3**2 + p4 + p5> is {redbold_begin}{is_e12_made_by_only_public_values}\033[0m{darkcyan_end}.")
print("proving that the shared secret can be computed using only public values.")
print("Therefore, the protocol cannot be used.\n")
