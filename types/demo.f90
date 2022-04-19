module demo
    use shapes
    implicit none
    private
    public main


contains

    subroutine main(get_value)
        external get_value
        type(rectangle) :: rect1
        real :: get_value

        rect1%length = get_value("data:length")
        rect1%width = get_value("data:width")

        print *, rect1%area()
    end subroutine main



end module demo
