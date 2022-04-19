module data_reader
    use shapes
    use data
    implicit none

contains

    subroutine get_rectangle(get_value)
        implicit none
        external get_value
        real :: get_value

        character(:), allocatable :: str

        str = "data:length"
        rect1%length = get_value(str)
        str = "data:width"
        rect1%width = get_value(str)

    end subroutine get_rectangle

end module data_reader