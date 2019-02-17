//  SIDE BAR
function OpenSideBar() {
    //$('#MenuSideBar').css("display", "inline-block")
    $('#MenuSideBar').css("width", "250px")
    $('#ModuleContainer').css("filter", "blur(5px)")
}
function CloseSideBar() {
    $('#MenuSideBar').css("width", "0")
    //$('#MenuSideBar').css("display", "none")
    $('#ModuleContainer').css("filter", "none")
}