# -*- coding: utf-8 -*-
"""Matrix_Multiplication.ipynb

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/1m-W9BeJtGNopQytFh4iLiX9E2rXBb97N
"""

import numpy as np
import time


rows = 10
columns = 10

start_time = time.time()
A = np.array([[i+j for i in range(rows)] for j in range(columns)])
B = np.array([[i+j for i in range(rows)] for j in range(columns)])
C = np.array([[0 for i in range(rows)] for j in range(columns)])

for i in range(rows):
  for j in range(columns):
    for k in range(columns):
      C[i][j] += A[i][k] * B[k][j]
      
print("Matrix A:\n",A)
print("Matrix B:\n",B)
print("Matrix C:\n",C)
print("Python:     " + " %s seconds" % ((time.time() - start_time)))
