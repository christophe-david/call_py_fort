module demo
    use shapes
    implicit none
    private
    public main


contains

    subroutine main()
        type(rectangle) :: rect1

        rect1%length = 7.0
        rect1%width = 0.5

        print *, rect1%area()
    end subroutine main



end module demo
