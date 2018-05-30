import AjaxRequestConstants from './AjaxRequestConstants.js';


/* PRIVATE VARS */
let xhr = new XMLHttpRequest();

/* PRIVATE FUNCTIONS */
function privateFunc() {
    console.log("in method: privateFunc().");
}

class AjaxRequest {

    constructor() {

        this.requestType = AjaxRequestConstants.REQUEST_TYPE_AJAX;
        this.requestMethod = AjaxRequestConstants.REQUEST_METHOD_GET;
        this.crudType = AjaxRequestConstants.CRUD_TYPE_READ;
        this.requestObj = null;
        this.requestForClass = null;
        this.requestUrl = null;

    }

    doPreSend() {

        if (this.requestMethod === AjaxRequestConstants.REQUEST_METHOD_GET) {

            this.requestUrl += "?request_data=" + JSON.stringify(this);

            xhr.open(this.requestMethod, this.requestUrl, true);
            xhr.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
        }
        else {
            xhr.open(this.requestMethod, this.requestUrl, true);
            xhr.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
            xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        }


    }

    doSend() {

        if (this.requestMethod === AjaxRequestConstants.REQUEST_METHOD_GET) {
            xhr.send();
        }
        else {

            let requestData = "request_data=" + JSON.stringify(this);
            xhr.send(requestData);
        }
    }

    doPostSend() {

        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4 && xhr.status == 200) {

                //
                var response = xhr.responseText.trim();

                //
                console.log("########################");
                console.log("response: " + response);
                console.log("########################");
            }
        };
    }





    /**
     * @deprecated
     * @returns {string}
     */
    cnToString() {

        var returnValue = "";

        returnValue = "{";
        returnValue += "'requestType':'" + this.requestType + "'";
        returnValue += ",\"requestMethod\":\"" + this.requestMethod + "\"";
        returnValue += "}";

        return returnValue;
    }
}


export { AjaxRequest as default}
// export * from './AjaxRequest.js';