<div id="contact-information-container">

    <div id="profile-basic-info-section">

        <div><img id="profile-photo" alt="profile-photo"></div>

        <h5 id="profile-full-name">profile-full-name</h5>

        <h6 id="profile-user-name">profile-user-name</h6>

    </div>
    <hr>



    <div id="profile-contact-info-section">

        <h6 id="profile-phone-number">profile-phone-number</h6>

        <h6 id="profile-email">profile-email</h6>

        <div>
            <span id="profile-street1" class="profile-address">profile-address</span>
        </div>

        <div>
            <span id="profile-street2" class="profile-address"></span>
        </div>

        <div>
            <span id="profile-city" class="profile-address">profile-address</span>
            <span id="profile-state" class="profile-address">profile-address</span>
            <span id="profile-country" class="profile-address">TODO: Country</span>
        </div>

        <div>
            <span id="profile-zip" class="profile-address">profile-address</span>
        </div>


    </div>
    <hr>

    <div id="profile-social-media-info-section"></div>

</div>


<?php require_once(PUBLIC_PATH . "contact-information/social-media-entry-template.php"); ?>




<style>
    #contact-information-container hr {
        margin: 10px;
    }

    #profile-full-name,
    #profile-user-name {
        /*pading: 10px;*/
        margin-left: 10px;
        max-width: 80%;
    }

    #profile-full-name {
        margin-top: 20px;
        font-size: 18px;
        font-weight: 500;
    }

    #profile-user-name {
        font-size: 17px;
        font-weight: 400;

    }


    #profile-contact-info-section,
    #profile-social-media-info-section {
        margin: 60px 10px;
        font-size: 12px;
        font-weight: 100;
    }

</style>
