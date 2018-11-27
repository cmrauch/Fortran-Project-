! Animated Pendulum
PROGRAM animated_pendulum
IMPLICIT NONE
DOUBLE PRECISION, PARAMETER :: pi = 4.0D0*atan(1.0D0), l = 1.0D-1, dt = 1.0D-2, g = 20.8D0
INTEGER :: io
DOUBLE PRECISION :: s_ang, c_ang, p_ang, n_ang
 
WRITE(*,*) 'Enter starting angle (in degrees):'
DO
  READ(*,*,iostat=io) s_ang
  IF(io.ne.0 .or. s_ang.lt.-90.0D0 .or. s_ang.gt.90.0D0) THEN
    WRITE(*,*) 'Please enter an angle between 90 and -90 degrees:'
  ELSE
    EXIT
  END IF
END DO
CALL SYSTEM('clear')
 
c_ang = s_ang*pi/180.0D0
p_ang = c_ang
 
CALL display(c_ang)
DO
  CALL next_time_step(c_ang,p_ang,g,l,dt,n_ang)
  IF(abs(c_ang-p_ang).ge.0.05D0) THEN
    CALL SYSTEM('clear')
    CALL sleep(1)
    CALL display(c_ang)
  END IF
END DO
END PROGRAM
 
SUBROUTINE next_time_step(c_ang,p_ang,g,l,dt,n_ang)
DOUBLE PRECISION :: c_ang, p_ang, g, l, dt, n_ang
n_ang = (-g*sin(c_ang)/l)*2.0D0*dt**2 + 2.0D0*c_ang - p_ang
p_ang = c_ang
c_ang = n_ang
END SUBROUTINE
 
SUBROUTINE display(c_ang)
DOUBLE PRECISION :: c_ang
CHARACTER (LEN=*), PARAMETER :: cfmt = '(A1)'
DOUBLE PRECISION :: rx, ry
INTEGER :: x, y, i, j
rx = 45.0D0*sin(c_ang)
ry = 22.5D0*cos(c_ang)
x = int(rx)+51
y = int(ry)+2
DO i = 1,32
  DO j = 1,100
    IF(i.eq.y .and. j.eq.x) THEN
      WRITE(*,cfmt,ADVANCE='no') 'O'
    ELSE IF(i.eq.y .and. (j.eq.(x-1).or.j.eq.(x+1))) THEN
      WRITE(*,cfmt,ADVANCE='no') 'G'
    ELSE IF(j.eq.x .and. (i.eq.(y-1).or.i.eq.(y+1))) THEN
      WRITE(*,cfmt,ADVANCE='no') 'G'
    ELSE IF(i.eq.y .and. (j.eq.(x-2).or.j.eq.(x+2))) THEN
      WRITE(*,cfmt,ADVANCE='no') '#'
    ELSE IF(j.eq.x .and. (i.eq.(y-2).or.i.eq.(y+2))) THEN
      WRITE(*,cfmt,ADVANCE='no') 'G'
    ELSE IF((i.eq.(y+1).and.j.eq.(x+1)) .or. (i.eq.(y-1).and.j.eq.(x-1))) THEN
      WRITE(*,cfmt,ADVANCE='no') '#'
    ELSE IF((i.eq.(y+1).and.j.eq.(x-1)) .or. (i.eq.(y-1).and.j.eq.(x+1))) THEN
      WRITE(*,cfmt,ADVANCE='no') '#'
    ELSE IF(j.eq.50) THEN
      WRITE(*,cfmt,ADVANCE='no') '|'
    ELSE IF(i.eq.2) THEN
      WRITE(*,cfmt,ADVANCE='no') '-'
    ELSE
      WRITE(*,cfmt,ADVANCE='no') ' '
    END IF
  END DO
  WRITE(*,*)
END DO
END SUBROUTINE

! returns data of type 'double' 
DOUBLE PRECISION FUNCTION friction() !<-- need params
IMPLICIT NONE

!declare params

!declare local variables

!algorithm

!friction = ...
friction = 0 !<-- return value

END FUNCTION friction

! returns data of type 'double' 
DOUBLE PRECISION FUNCTION windSpeed() !<-- need params
IMPLICIT NONE

!declare params

!declare local variables

!algorithm

!windSpeed = ...
windSpeed = 0 !<-- return value

END FUNCTION windSpeed

! displays the Kinetic and Potential Energy of the System
! bottom right hand corner
SUBROUTINE displayEnergy()
IMPLICIT NONE

!declare params

!declare local variables

!algorithm


END SUBROUTINE displayEnergy

