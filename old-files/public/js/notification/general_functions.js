/* general_function */
function toggleNotificationBtnState() {
    if ($("#notification-widget-btn").attr("toggle-state") == "on") { $("#notification-widget-btn").attr("toggle-state", "off"); }
    else { $("#notification-widget-btn").attr("toggle-state", "on"); }
}

function getDimensionIncrement(maxDimensionValue, reAnimationTimeInterval) {
    var animationTime = 200;

    var dimensionIncrement = maxDimensionValue * reAnimationTimeInterval / animationTime;

    return dimensionIncrement;
}

function cnShowAnimateNotificationWidgetContainer() {

    var maxWidgetWidth = 400;
    var maxWidgetHeight = 500;
    var reAnimationTimeInterval = 5; // ms

    /*

        GOAL:
            I want to animate the width of the x-widget-container from
            width x (initial size of it which is the size of its toggle-btn)
            to maxWidgetWidth.
            And I also want that whole animation process to take place in
            approximately 3s.


        QUESTION:
            How much widthIncrement should I add everytime the animatino
            process loops?


        WIDTH:

            400px               ?px => 5px
            -------     =     -------
            3000ms              50ms


        ANSWER:

            widthIncrement = (maxWidgetWidth) * (reAnimationTimeInterval) / animationTime

     */

    var widthIncrement = getDimensionIncrement(maxWidgetWidth, reAnimationTimeInterval);
    var heightIncrement = getDimensionIncrement(maxWidgetHeight, reAnimationTimeInterval);


    //
    cnHandler = setInterval(function () {

        // Get the current width.
        var currentWidth = $("#notification-widget-container").width();
        var currentHeight = $("#notification-widget-container").height();

        // Check if the widget width has reached the limit.
        if (currentWidth >= maxWidgetWidth) {

            clearInterval(cnHandler);
            cnHandler = null;

            // On the final increase of the widget's width, set it exactly
            // to the limit width, because it might have decimal points
            // dangling after it.
            $("#notification-widget-container").width(maxWidgetWidth);
            $("#notification-widget-container").height(maxWidgetHeight);

            //
            var toggleState = "on";
            setNotificationWidgetSubContentProperties (toggleState);

            // enable this btn.
            $("#notification-widget-btn").removeAttr("disabled");

            return;

        }

        // Increase the widget width.
        $("#notification-widget-container").width(parseFloat(currentWidth) + widthIncrement);
        $("#notification-widget-container").height(parseFloat(currentHeight) + heightIncrement);


    }, reAnimationTimeInterval);
}

function minimizeAnimateNotificationWidgetContainer() {

    //
    var minWidgetWidth = $("#notification-widget-btn").outerWidth();
    var minWidgetHeight = $("#notification-widget-btn").outerHeight();
    var maxWidgetWidth = $("#notification-widget-container").width();
    var maxWidgetHeight = $("#notification-widget-container").height();
    var reAnimationTimeInterval = 5; // ms

    //
    var widthDecrement = getDimensionIncrement(maxWidgetWidth, reAnimationTimeInterval);
    var heightDecrement = getDimensionIncrement(maxWidgetHeight, reAnimationTimeInterval);



    //
    cnHandler = setInterval(function () {

        // Get the current width.
        var currentWidth = $("#notification-widget-container").width();
        var currentHeight = $("#notification-widget-container").height();

        // Check if the widget width has reached the limit.
        if (currentWidth < minWidgetWidth) {

            clearInterval(cnHandler);
            cnHandler = null;

            // On the final increase of the widget's width, set it exactly
            // to the limit width, because it might have decimal points
            // dangling after it.
            $("#notification-widget-container").width(minWidgetWidth);
            $("#notification-widget-container").height(minWidgetHeight);

            //
            var toggleState = "off";
            setNotificationWidgetSubContentProperties (toggleState);


            // enable this btn.
            $("#notification-widget-btn").removeAttr("disabled");

            return;

        }

        // Decrease the widget width.
        $("#notification-widget-container").width(parseFloat(currentWidth) - widthDecrement);
        $("#notification-widget-container").height(parseFloat(currentHeight) - heightDecrement);



    }, reAnimationTimeInterval);
}

function setNotificationWidgetSubContentProperties (toggleState) {
    if (toggleState == "on") {
        $("#notification-widget-nav").css("display", "block");
        $("#notification-widget-main-content").css("display", "block");
    }
    else {
        $("#notification-widget-nav").css("display", "none");
        $("#notification-widget-main-content").css("display", "none");
    }
}

function setNotificationWidget() {

    //
    var notificationWidget = $("#notification-widget-container");


    //
    toggleNotificationBtnState();
    var toggleState = $("#notification-widget-btn").attr("toggle-state");


    //
    if (toggleState == "on") {
        cnShowAnimateNotificationWidgetContainer();
    }
    else {
        minimizeAnimateNotificationWidgetContainer();
    }
}