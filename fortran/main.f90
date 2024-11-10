program hello
  implicit none
  integer :: num_args
  character(len=100) :: a1, a2

  call get_command_argument(1, a1)
  call get_command_argument(2, a2)
  
  print '(A)', trim(a1) // " " // trim(a2)
end program hello
