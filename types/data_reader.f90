module data_reader
    use custom_types
    use data
    implicit none

contains

    subroutine get_structure(get_value)
        implicit none
        external get_value
        real, allocatable :: get_value(:)

        character(:), allocatable :: str

        str = "data:array"
        struct0%array_data = get_value(str)
        str = "data:scalar"
        struct0%sclara_data = get_value(str)

    end subroutine get_structure

end module data_reader