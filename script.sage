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
