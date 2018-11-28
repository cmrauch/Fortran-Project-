program mergeSortDriver
IMPLICIT NONE

  INTEGER :: x, elems = 100
  INTEGER :: list(100)
  
  !initialize list
  DO x = 1, elems
    list(x) = elems - x
  END DO

  CALL mergeSort(list, 0, elems)
  CALL printList(list, elems)
END PROGRAM mergeSortDriver

SUBROUTINE merge_(list, a, mid, b)
IMPLICIT NONE
  
  ! dummys
  INTEGER, INTENT(IN) :: a, mid, b
  INTEGER :: list(10)
  
  ! locals
  INTEGER :: ai, bi, ti, x
  INTEGER :: temp_list(b)

  ai = a
  bi = mid
  ti = a

  DO WHILE ((ai .lt. mid) .or. (bi .lt. b))
    IF (ai .eq. mid) THEN
      temp_list(ti+1) = list(bi+1)
      bi = bi + 1
    ELSE IF (bi .eq. b) THEN
      temp_list(ti+1) = list(ai+1)
      ai = ai + 1
    ELSE IF (list(ai+1) .lt. list(bi+1)) THEN
      temp_list(ti+1) = list(ai+1)
      ai = ai + 1
    ELSE
      temp_list(ti+1) = list(bi+1)
      bi = bi + 1
    END IF
      ti = ti + 1
  END DO
  
  DO x = a, b - 1
    list(x + 1) = temp_list(x + 1)
  END DO
END

RECURSIVE SUBROUTINE mergeSort(list, a, b)
IMPLICIT NONE

  !dummys
  INTEGER, INTENT(IN) :: a, b
  INTEGER, INTENT(IN) :: list(b)
  
  !locals
  INTEGER :: diff 
  diff = b - a
  
  ! base case
  IF (diff .lt. 2) THEN
    RETURN
  
  ELSE
    diff = diff / 2
    CALL mergeSort(list, a, a + diff)
    CALL mergeSort(list, a + diff, b)
    CALL merge_(list, a, a + diff, b)
  END IF
END

subroutine printList(list, elems)
IMPLICIT NONE

  ! dummys
  INTEGER, INTENT(IN) :: elems
  INTEGER, INTENT(IN) :: list(elems)
  
  !local
  INTEGER :: x
  
  DO x = 1, elems
    PRINT 100, list(x)
  END DO

  100 format (i0)
end
