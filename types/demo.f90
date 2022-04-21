module demo
    use custom_types
    use data_reader
    implicit none


contains

    subroutine main()

        print *, struct0%multiplier()
    end subroutine main

end module demo
