module data_reader
    implicit none
    private
    public read_value

contains

    subroutine read_value(get_python_size, get_python_value)
        implicit none
        real, allocatable :: value(:)
        external get_python_size
        external get_python_value
        integer :: get_python_size

        character(:), allocatable :: variable_name

        variable_name = "data:length"
        print *, variable_name

        value = get_value(variable_name, get_python_size, get_python_value)
        print *, "passed"
        print *, value

    end subroutine

    function get_value(variable_name, get_python_size, get_python_value) result(value)
        real, allocatable :: value (:)
        character(:), allocatable :: variable_name
        external get_python_size
        external get_python_value
        integer :: get_python_size

        integer :: n

        n = get_python_size(variable_name)
        allocate(value(n))
        call get_python_value(variable_name, value, n)

    end function get_value

end module data_reader