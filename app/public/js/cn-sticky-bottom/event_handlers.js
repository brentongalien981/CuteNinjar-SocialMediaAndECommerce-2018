function resetColToggleBtns() {
    $(".col-toggle-btn").removeClass("btn-success");

    $(".col-toggle-btn").addClass("btn-primary");
}

function activateColToggleBtn(toggleBtnId) {
    $("#" + toggleBtnId).removeClass("btn-primary");

    $("#" + toggleBtnId).addClass("btn-success");
}

function activateCnCol(toggleBtnId) {

    $(".cn-col").css("display", "none");


    var activeCnColId = null;

    switch (toggleBtnId) {
        case 'left-col-toggle-btn':
            activeCnColId = "cn-left-col";
            break;
        case 'center-col-toggle-btn':
            activeCnColId = "cn-center-col";
            break;
        case 'right-col-toggle-btn':
            activeCnColId = "cn-right-col";
            break;
    }


    showCnCol(activeCnColId);
}

function showCnCol(activeCnColId) {
    console.log("activeCnColId: " + activeCnColId);
    $("#" + activeCnColId).css("display", "block");
}