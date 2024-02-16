program example
use callpy_mod
implicit none

real(8) :: wing_position(1)
real(8) :: wing_aspect_ratio(1)
real(8) :: wing_taper_ratio(1)
real(8) :: wing_sweep(1)
real(8) :: horizontal_tail_aspect_ratio(1)
real(8) :: max_thrust(1)
real(8) :: wing_area(1)
real(8) :: span(1)
real(8) :: static_margin(1)
real(8) :: block_fuel(1)
real(8) :: OWE(1)
real(8) :: climb_duration(1)
real(8) :: approach_speed(1)
real(8) :: additional_fuel(1)
integer :: i

wing_position = 17.0
wing_aspect_ratio = 11.0
wing_taper_ratio = 0.3
wing_sweep = 25.0
horizontal_tail_aspect_ratio = 5.0
max_thrust = 120000.0
wing_area = 120.0

! Set input values
call set_state("wing_position", wing_position)
call set_state("wing_aspect_ratio", wing_aspect_ratio)
call set_state("wing_taper_ratio", wing_taper_ratio)
call set_state("wing_sweep", wing_sweep)
call set_state("horizontal_tail_aspect_ratio", horizontal_tail_aspect_ratio)
call set_state("max_thrust", max_thrust)
call set_state("wing_area", wing_area)

do i=1,1 ! Change that to simulate several calls
    ! Run FAST-OAD
    call call_function("fastoad_launcher", "run_fastoad")
end do

! Get output values
call get_state("span", span)
call get_state("static_margin", static_margin)
call get_state("block_fuel", block_fuel)
call get_state("OWE", OWE)
call get_state("climb_duration", climb_duration)
call get_state("approach_speed", approach_speed)
call get_state("additional_fuel", additional_fuel)

! ! Print all inputs/outputs using Python print() statement (not needed, just provided as example)
! call call_function("builtins", "print")


end program example
