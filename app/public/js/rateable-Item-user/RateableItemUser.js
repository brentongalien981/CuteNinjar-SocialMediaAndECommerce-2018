function RateableItemUser (crud_type, request_type, key_value_pairs) {
    this.class_name = "RateableItemUser";
    this.crud_type = crud_type;
    this.request_type = request_type;
    this.key_value_pairs = key_value_pairs;



    this.create = function () {
        my_ajax(this);
    };


    this.read = function () {
        my_ajax(this);
    };

    this.update = function () {
        my_ajax(this);
    };

    this.delete = function () {
        my_ajax(this);
    };

    this.fetch = function () {
        my_ajax(this);
    };

    this.patch = function () {
        my_ajax(this);
    };

    this.show = function () {
        my_ajax(this);
    };
}
