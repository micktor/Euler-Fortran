function dydt(t,y) result(r)
    real, intent(in) :: t,y ! input
    real(kind=8) :: r ! output
    r = (2.0*t)/(y*(1.0+t**2.0))
end function dydt

subroutine eulers_method(t_0, y_0, t_f, N, file_name)
    real(kind=8) :: step,t,y, val, result
    integer, intent(in) :: t_0, y_0, t_f, N
    CHARACTER (LEN=*), intent(in) :: file_name
    integer :: iterate
    open(20, file=file_name, status='new')
    write(20,*) "  T", "                         Numerical Solution"
    step = t_f / REAL(N)
    iterate = 1

    y = REAL(y_0)
    t = 0.0
    DO WHILE (iterate <= N+1)
        iterate = iterate+1
        val = dydt(t,y)
        result = y + (step*(val))
        write(20,*) (t), (result)
        t = t + step
        y = result
    END DO

    close(20)
end subroutine eulers_method
