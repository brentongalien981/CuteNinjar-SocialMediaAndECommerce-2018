$(".col-toggle-btn").click(function () {

    resetColToggleBtns();

    var toggleBtnId = $(this).attr("id");

    activateColToggleBtn(toggleBtnId);

    activateCnCol(toggleBtnId);

});
