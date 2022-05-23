program example
use callpy_mod
implicit none

real(8) :: wing_position(1)
real(8) :: wing_aspect_ratio(1)
real(8) :: wing_taper_ratio(1)
real(8) :: wing_sweep(1)
real(8) :: horizontal_tail_aspect_ratio(1)
real(8) :: max_thrust(1)
real(8) :: span(1)
real(8) :: static_margin(1)
real(8) :: block_fuel(1)
real(8) :: OWE(1)
real(8) :: climb_duration(1)

wing_position = 17.0
wing_aspect_ratio = 11.0
wing_taper_ratio = 0.3
wing_sweep = 25.0
horizontal_tail_aspect_ratio = 5.0
max_thrust = 120000.0

! Set input values
call set_state("wing_position", wing_position)
call set_state("wing_aspect_ratio", wing_aspect_ratio)
call set_state("wing_taper_ratio", wing_taper_ratio)
call set_state("wing_sweep", wing_sweep)
call set_state("horizontal_tail_aspect_ratio", horizontal_tail_aspect_ratio)
call set_state("max_thrust", max_thrust)

! Run FAST-OAD
call call_function("fastoad_launcher", "run_fastoad")

! Get output values
call get_state("span", span)
call get_state("static_margin", static_margin)
call get_state("block_fuel", block_fuel)
call get_state("OWE", OWE)
call get_state("climb_duration", climb_duration)

! Print all inputs/outputs using Python print() statement (not needed, just provided as example)
! call call_function("builtins", "print")

! These lines do a second run of FAST-OAD that will use previous results as starting point.
call set_state("wing_aspect_ratio", wing_aspect_ratio + 1.0)
call call_function("fastoad_launcher", "run_fastoad")

end program example
