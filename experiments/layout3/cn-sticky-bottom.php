<div id="toggle-view-section" class="cn-sticky-bottom fixed-bottom">
    <div class="cn-sticky-bottom-content d-inline-block">

        <button id="left-col-toggle-btn" type="button" class="btn btn-primary col-toggle-btn">
            <i class="fa fa-align-left"></i>
        </button>

        <button id="center-col-toggle-btn" type="button" class="btn btn-success col-toggle-btn">
            <i class="fa fa-align-center"></i>
        </button>

        <button id="right-col-toggle-btn" type="button" class="btn btn-primary col-toggle-btn">
            <i class="fa fa-align-right"></i>
        </button>

    </div>
</div>


<div id="widget-section" class="cn-sticky-bottom fixed-bottom text-right">

    <div class="cn-sticky-bottom-content d-inline-block">
        <button type="button" class="btn btn-primary">
            <i class="fa fa-comments-o"></i>
            <span class="badge badge-danger">4</span>
        </button>

        <button type="button" class="btn btn-primary">
            <i class="fa fa-bell"></i>
            <span class="badge badge-danger">2</span>
        </button>

    </div>

</div>


<style>

    .cn-sticky-bottom {
        margin: 10px;
        padding: 0;
        /*max-width: 300px;*/
    }

    .cn-sticky-bottom button {
        box-shadow: 0 0 15px rgb(120, 120, 120);
    }

    #toggle-view-section {
        display: none;

    }

    #widget-section {
        /*margin-left: 300px;*/
        /*background-color: lightblue;*/
        /*width: 200px;*/
    }

    .btn:hover {
        cursor: pointer;
    }

    /*Hide the #toggle-view-section on sm breakpoint*/
    @media screen and (max-width: 1199px) {
        #toggle-view-section {
            min-width: 150px;
            display: block;

        }
    }
</style>


<script>
    /* general_functions.js */
    function setWidgetSection() {
        $("#widget-section").css("margin-left", $(this).width() - $("#widget-section").width() - 10);
    }

    function setWidthOfCnStickyBottomSections() {

        var cnStickyBottomSections = $(".cn-sticky-bottom");

        for (i = 0; i < cnStickyBottomSections.length; i++) {

            var currentSection = cnStickyBottomSections[i];

            var contentOfCurrentSection = $(currentSection).children()[0];
            $(currentSection).width($(contentOfCurrentSection).width() + 14);
        }
    }

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





    $(document).ready(function () {


        /* tasks.js */
        setWidthOfCnStickyBottomSections();
        setWidgetSection();


        /* event_listeners.js */
        $(window).resize(function () {
            setWidthOfCnStickyBottomSections();
            setWidgetSection();
        });

        $(".col-toggle-btn").click(function () {

            resetColToggleBtns();

            var toggleBtnId = $(this).attr("id");

            activateColToggleBtn(toggleBtnId);

            activateCnCol(toggleBtnId);

//            setWidthOfCnStickyBottomSections();
        });


    });


</script>