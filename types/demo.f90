module demo
    use shapes
    use data_reader
    implicit none


contains

    subroutine main()

        print *, rect1%area()
    end subroutine main

end module demo
