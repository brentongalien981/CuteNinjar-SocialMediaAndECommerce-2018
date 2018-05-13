class CnGeneral {


    /**
     * @throws CnNullReferenceError
     * @param selector
     * @returns {*|jQuery}
     */
    static cloneTemplateNode(selector) {
        var node = $(selector).clone(true);

        if ($(node).attr("id") == null) {

            throw new CnNullReferenceError();
        }
        else {
            $(node).removeClass("cn-template");
            $(node).removeAttr("id");
            return node;
        }
    }
}