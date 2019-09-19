function AnimateRotate(angle) {
    // caching the object for performance reasons
    var $elem = $("div");

    // we use a pseudo object for the animation
    // (starts from `0` to `angle`), you can name it as you want
    $({ deg: 0 }).animate({ deg: angle }, {
        duration: 2000,
        step: function (now) {
            // in the step-callback (that is fired each step of the animation),
            // you can use the `now` paramter which contains the current
            // animation-position (`0` up to `angle`)
            $elem.css({
                transform: 'rotate(' + now + 'deg)'
            });
        }
    });
}

function ChangePw() {

    // Closes info display
    $("#infoDisplay").hide("blind", function () {

        // Opens password div
        $("#changeBInfo").hide();
        $("#changePw").show();
        $("#editDiv").show("blind");
        
    });
}

function ChangeBasicInfo() {

    // Closes info display
    $("#infoDisplay").hide("blind", function () {

        // Opens password div
        $("#changePw").hide();
        $("#changeBInfo").show();
        $("#editDiv").show("blind");
    });
}

function BackToMain(obj) {

    if (obj.id == "changePw") {

        // Closes password div
        $("#editDiv").hide("blind", function () {

            // Opens password div
            $("#changePw").hide("blind");
            $("#infoDisplay").show("blind");

        });
    }
    else {
        // Closes password div
        $("#editDiv").hide("blind", function () {

            // Opens password div
            $("#changeBInfo").hide("blind");
            $("#infoDisplay").show("blind");

        });
    }
}