module custom_types
    implicit none
    private
    public structure

    type :: structure
        real :: array_data(2)
        real :: scalar_data
    contains
        procedure :: area
    end type

contains

    real function multiplier(self) result(res)
        class(structure), intent(in) :: self
        real, allocatable :: res

        allocate(res, size(self%array_data))
        do i = 1, size(self%array_data)
            res(i) = self%array_data(i) * self%scalar_data
        end do

    end function

end module custom_types