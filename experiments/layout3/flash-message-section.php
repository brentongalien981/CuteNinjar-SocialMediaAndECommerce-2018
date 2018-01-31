<div id="flash-message-section" class="fixed-bottom">

    <div class="cn-alert alert alert-info alert-dismissable">
        <button class="close" data-dismiss="alert" aria-label="close">&times;</button>
        <strong>Danger!</strong> Indicates a dangerous or potentially negative action.
    </div>

</div>



<style>
    #flash-message-section {
        width: 600px;
        background-color: lightblue;
        margin: 0;
        padding: 0;
        margin-bottom: 70px;
        border-radius: 5px;
        box-shadow: 0 0 15px rgb(120, 120, 120);
    }

    .cn-alert {
        margin: 0;
        font-size: 80%;
        font-weight: 100;
    }
</style>


<script>
    /* general_functions.js */
    function setFlashMessageSection() {
        $("#flash-message-section").css("margin-left", $(this).width() - $("#flash-message-section").width() - 10);
    }

    /* tasks.js */
    setFlashMessageSection();


    /* event_listeners.js */
    $(window).resize(function(){
        setFlashMessageSection();
    });


</script>