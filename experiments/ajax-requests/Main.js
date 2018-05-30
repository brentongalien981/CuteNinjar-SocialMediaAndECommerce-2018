import AjaxRequest from './AjaxRequest.js';
import AjaxRequestConstants from './AjaxRequestConstants.js';
import Video from './Video.js';
import Tag from './Tag.js';



var tag1 = new Tag();
tag1.tag = "Magbalik";

var tag2 = new Tag();
tag2.tag = "callalily";

var tag3 = new Tag();
tag3.tag = "sony";

var tag4 = new Tag();
tag4.tag = "OPM";

var tag5 = new Tag();
tag5.tag = "pasan";




var video1 = new Video();
video1.title = "Magbalik by Callalily";
video1.tags = [tag1, tag2, tag3, tag4];


var video2 = new Video();
video2.title = "Pasan by Callalily";
video2.tags = [tag2, tag3, tag4, tag5];

var videos = [video1, video2];



let ajaxRequest = new AjaxRequest();
ajaxRequest.requestMethod = AjaxRequestConstants.REQUEST_METHOD_POST;
ajaxRequest.requestForClass = "Video";
ajaxRequest.crudType = AjaxRequestConstants.CRUD_TYPE_CREATE;
ajaxRequest.requestUrl = "http://localhost/myPersonalProjects/CuteNinjar/experiments/ajax-requests/Request.php";
ajaxRequest.requestObj = {
    "actualObjs": videos
};
ajaxRequest.doPreSend();
ajaxRequest.doSend();
ajaxRequest.doPostSend();

//
// console.log("#######################################");
// console.log("JSON.stringify(ajaxRequest) <===> " + JSON.stringify(ajaxRequest));



// console.log("#######################################");
// console.log("calling method: ajaxRequest.callAFieldPrivately()...");






function mcnLogObject(obj) {

    /**/
    console.log("###########################");
    console.log("IN METHOD mcnLogObject()");

    /**/
    for (var key in obj) {
        if (obj.hasOwnProperty(key)) {
            var val = obj[key];

            // Display in the console.
            console.log(key + " => " + val);
        }
    }

    console.log("###########################");
}


function toJSON(proto) {
    let jsoned = {};
    let toConvert = proto || this;
    Object.getOwnPropertyNames(toConvert).forEach((prop) => {
        const val = toConvert[prop];
    // don't include those
    if (prop === 'toJSON' || prop === 'constructor') {
        return;
    }
    if (typeof val === 'function') {
        jsoned[prop] = val.bind(jsoned);
        return;
    }
    jsoned[prop] = val;
})
    ;

    const inherited = Object.getPrototypeOf(toConvert);
    if (inherited !== null) {
        Object.keys(this.toJSON(inherited)).forEach(key => {
            if(
        !!jsoned[key] || key === 'constructor' || key === 'toJSON'
    )
        return;
        if (typeof inherited[key] === 'function') {
            jsoned[key] = inherited[key].bind(jsoned);
            return;
        }
        jsoned[key] = inherited[key];
    })
        ;
    }
    return jsoned;
}