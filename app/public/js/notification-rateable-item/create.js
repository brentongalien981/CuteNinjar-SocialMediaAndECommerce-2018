function create_rateable_item_notification(rateable_item_id, rate_value) {
    var crud_type = "create";
    var request_type = "POST";

    var key_value_pairs = {
        create : "yes",
        rateable_item_id: rateable_item_id,
        // notified_user_id : For this instance, this will always be the session->currently_viewed_user_id
        notification_msg_id : 4, // eg. 4 means => CJ rated your post "llskjdfslkdfj" "bomb"
        rate_value: rate_value
    };

    var obj = new NotificationRateableItem(crud_type, request_type, key_value_pairs);
    obj.create()
}