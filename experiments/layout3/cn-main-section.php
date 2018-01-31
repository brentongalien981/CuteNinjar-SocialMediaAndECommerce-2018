<div id="cn-main-section" class="container-fluid">


    <div class="row cn-row">


        <div id="cn-left-col" class="col-xl-3 cn-col">
            left col
        </div>


        <div id="cn-center-col" class="col-xl cn-col">
            center col
        </div>


        <div id="cn-right-col" class="col-xl-3 cn-col">
            right col
        </div>


    </div>


</div>



<style>
    #cn-main-section {
        height: 700px;
    }

    .cn-row {
        height: 100%;
    }

    .cn-col {
        height: 100%;
        display: block;
    }


    #cn-left-col {
        background-color: yellow;
    }

    #cn-center-col {
        background-color: red;
    }

    #cn-right-col {
        background-color: black;
    }
</style>


<script>

    /* general_functions.js */
    function tryShowActiveCnCol() {

        var screenWidth = $(this).width();

        if (screenWidth < 1200) {
            var activeToggleBtn = $(".col-toggle-btn.btn-success")[0];
            var toggleBtnId = $(activeToggleBtn).attr("id");
            activateCnCol(toggleBtnId);
        }
        else {
            $(".cn-col").css("display", "block");
        }


    }


    /* event_listeners.js */
    $(window).resize(function () {
        tryShowActiveCnCol();
    });
</script>