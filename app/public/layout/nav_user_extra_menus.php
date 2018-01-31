<div class="dropdown">
    <a id="actual-user-options"
       class="nav-link dropdown-toggle"
       href="#"
       data-toggle="dropdown"
       aria-haspopup="true"
       aria-expanded="false">
    </a>

    <div class="dropdown-menu"
         aria-labelledby="">

        <?php if ($session->is_logged_in()) { ?>

            <a class="dropdown-item"
               href="<?= LOCAL . 'app/request/request.php?menu=Login&action=delete'; ?>">
                Log-out
            </a>

        <?php } else { ?>

            <a class="dropdown-item"
               href="<?= PUBLIC_LOCAL . "log-in/index.php"; ?>">
                Log-in
            </a>

            <a class="dropdown-item"
               href="#">
<!--                --><?//= LOCAL . "/public/__view/view_signup.php"; ?>
                TODO: Sign-up
            </a>

        <?php } ?>
    </div>
</div>