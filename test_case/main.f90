program example
use callpy_mod
implicit none

real(8) :: wing_position(1)
real(8) :: wing_aspect_ratio(1)
real(8) :: wing_taper_ratio(1)
real(8) :: wing_sweep(1)
real(8) :: horizontal_tail_aspect_ratio(1)
real(8) :: max_thrust(1)

wing_position = 17.0
wing_aspect_ratio = 11.0
wing_taper_ratio = 0.3
wing_sweep = 25.0
horizontal_tail_aspect_ratio = 5.0
max_thrust = 120000.0

call set_state("wing_position", wing_position)
call set_state("wing_aspect_ratio", wing_aspect_ratio)
call set_state("wing_taper_ratio", wing_taper_ratio)
call set_state("wing_sweep", wing_sweep)
call set_state("horizontal_tail_aspect_ratio", horizontal_tail_aspect_ratio)
call set_state("max_thrust", max_thrust)
call call_function("fastoad_launcher", "run_fastoad")

call call_function("builtins", "print")

end program example
