PROGRAM callHello
IMPLICIT NONE

REAL :: start_time, stop_time
INTEGER :: i, j
INTEGER :: rows =10
INTEGER :: columns =10 
INTEGER, DIMENSION(10,10) :: a, b, c

  ! === c++ alg ===
  CALL SYSTEM('./c_MM')
  
  ! === fortran alg ===
  PRINT *,"==========FORTRAN=========="
  CALL cpu_time(start_time)
  
    ! MM ALGORITHM
    
! initialize a
DO i = 1, rows
DO j = 1, columns
a(i, j) = i+j
END DO
END DO

PRINT *, 'A Matrix Initialized...'
 
!initialize b  
DO i = 1, rows
DO j = 1, columns
b(i, j) = i*j
END DO
END DO
   
Print*, 'B Matrix Initialized...'
   
! matrix multiplication
PRINT*, 'Matrix A and B are being multiplied...'
c = matmul(a, b)
!printing subroutine
CALL printMat(c,rows,columns)


!display time spent running algorithm   
CALL cpu_time(stop_time)
PRINT *, "Time spent running algorithm:", &
      stop_time - start_time, "seconds"
      
END PROGRAM callHello




SUBROUTINE printMat(mat, i, j)
IMPLICIT NONE

!Dummy vaiables
INTEGER, INTENT(IN) :: i,j
INTEGER, INTENT(IN) :: mat(i,j)

!local variable
INTEGER :: X

DO  x = 1, i
print '(20i6.2)',mat(x,1:j)
END DO
END SUBROUTINE
