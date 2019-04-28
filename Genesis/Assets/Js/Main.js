var ModuleContainer, MenuSideBar;

///                     ///
///         LOAD        ///
///                     ///
$(window).on('load', function () {

    ModuleContainer = $('#ModuleContainer');
    MenuSideBar = $('#MenuSideBar');

})



//  SIDE BAR
function OpenSideBar() {
    //$('#ModuleContainer').addClass("Disabled")
    //$('#MenuSideBar').css("width", "250px");    
    //$('#ModuleContainer').css("filter", "blur(5px)");

    ModuleContainer.addClass("Disabled");
    ModuleContainer.disableSelection();
    MenuSideBar.css("width", "250px");
    ModuleContainer.css("filter", "blur(5px)");
    
}
function CloseSideBar() {
    //$('#MenuSideBar').css("width", "0");
    //$('#ModuleContainer').removeClass("Disabled")
    //$('#ModuleContainer').css("filter", "none");

    MenuSideBar.css("width", "0");
    ModuleContainer.removeClass("Disabled")
    ModuleContainer.enableSelection();
    ModuleContainer.css("filter", "none");
}
