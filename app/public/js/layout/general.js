function get_csrf_input() {
    var input_csrf_token = document.createElement("input");
    input_csrf_token.id = "input_csrf_token";
    input_csrf_token.setAttribute("type", "hidden");
    input_csrf_token.setAttribute("value", get_csrf_token());
    
    return input_csrf_token;
}



