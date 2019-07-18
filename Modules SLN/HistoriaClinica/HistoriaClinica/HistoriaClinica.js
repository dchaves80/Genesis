function OpenSideMenu(object) {

    div = $(object).siblings("div");

    if (div.is(":visible")) {
        div.hide("blind");
    }
    else {
        div.show("blind");
    }
}