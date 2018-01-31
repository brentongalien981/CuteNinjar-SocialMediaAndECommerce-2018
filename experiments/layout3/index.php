<?php require_once("master.php"); ?>


<nav id="the-navbar" class="navbar navbar-expand-xl sticky-top navbar-dark bg-dark">
    <a class="navbar-brand" href="#">
        <img id="home-profile-img" src="https://farm5.staticflickr.com/4557/24004359337_33f64e5a90_q.jpg" class="rounded">
    </a>



    <form id="the-search-bar" class="form-row">
        <div class="input-group">
            <input id="the-search-box" type="text" class="form-control" placeholder="Search for..." aria-label="Search for...">
            <span class="input-group-btn">
             <button class="btn btn-secondary" type="button">
                 <i class="fa fa-search"></i>
             </button>
            </span>
        </div>
    </form>


    <button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarsExample05"
            aria-controls="navbarsExample05" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>


    <div class="navbar-collapse collapse" id="navbarsExample05" style="">
<!--        <ul class="nav navbar-nav ml-auto w-100 justify-content-end">-->
        <ul class="nav navbar-nav ml-auto justify-content-end">


            <li class="nav-item">
                <a class="nav-link" href="#"><i class="fa fa-ellipsis-h"></i> Subs</a>
            </li>

            <li class="nav-item active">
                <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Link</a>
            </li>
            <li class="nav-item">
                <a class="nav-link disabled" href="#">Disabled</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="http://example.com" id="dropdown05" data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">Business</a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdown05">
                    <a class="dropdown-item" href="#">Action</a>
                    <a class="dropdown-item" href="#">Another action</a>
                    <a class="dropdown-item" href="#">Something else here</a>
                </div>
            </li>


            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="http://example.com" id="admin-dropdown-toggle"
                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Admin</a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="admin-dropdown-toggle">
                    <a class="dropdown-item" href="#">User Managament</a>
                    <a class="dropdown-item" href="#">Ad Managament</a>
                </div>
            </li>


        </ul>

    </div>
</nav>

<?php require_once("sub-menu.php"); ?>

<?php require_once("cn-main-section.php"); ?>

<div id="my-container1" class="container my-container"></div>

<div id="my-container2" class="container-fluid my-container"></div>

<?php require_once("flash-message-section.php"); ?>

<?php require_once("cn-sticky-bottom.php"); ?>



<script>
    $("body").append($("#the-navbar"));
    $("body").append($("#sub-menu"));
    $("body").append($("#cn-main-section"));
    $("body").append($("#my-container1"));
    $("body").append($("#my-container2"));
    $("body").append($("#flash-message-section"));
    $("body").append($("#cn-sticky-bottom"));
</script>

<style>
    #the-navbar {
        font-weight: 100;
        font-size: 85%;
    }

    #the-search-box {
        min-width: 400px;
        font-size: 14px;
        font-weight: 100;
    }

    .dropdown-menu {
        font-size: 85%;
    }

    #the-search-bar {
        margin: auto;
    }


    .my-container {
        width: 100%;
        height: 700px;
    }

    #my-container1 {
        background-color: lightcyan;
    }

    #my-container2 {
        background-color: #73787f;
    }


    #home-profile-img {
        width: 33px;
    }

</style>

<?php require_once("footer.php"); ?>