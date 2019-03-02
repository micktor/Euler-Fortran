program main
implicit none

call eulers_method(0,-2,10,8,'output_8.txt')
call eulers_method(0,-2,10,16,'output_16.txt')
call eulers_method(0,-2,10,32,'output_32.txt')
call eulers_method(0,-2,10,64,'output_64.txt')

end program main
