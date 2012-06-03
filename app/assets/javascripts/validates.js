/**
 * Created with JetBrains RubyMine.
 * User: freeman13
 * Date: 5/21/12
 * Time: 1:41 AM
 * To change this template use File | Settings | File Templates.
 */


$(document).ready(function () {

    var canBeSubmited = false;
    var emptyErrorName = "Пустое поле названия";
    var emptyErrorUrl = "Пустое поле URL";
    var urlError = "Некоректный адрес";
    var nameMaxLengthError = "Слишком длинное название";
    var nameMinLengthError = "Слишком короткое название";
    var urlRegExp = /^((http|https|ftp):\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/g;
    var wish_name = $("input#wish_name");
    var wish_url = $("input#wish_url");
    var submit =  $('input#submit');


    function name_validates(name)
    {
        if (name.val().length == 0)
        {
            return emptyErrorName;
        }
        else
        {
            if ( ( name.val().length > 0) && (name.val().length < 2) )
            {
                return nameMinLengthError;
            }
            else
            {
                if (name.val().length > 50)
                {
                    return  nameMaxLengthError;
                }
                else
                {
                    return "";
                }
            }
        }

    }

    function url_validates (url)
    {
        if (url.val().length == 0)
        {
            return emptyErrorUrl;
        }
        else
        {
            if (url.val().match(urlRegExp) == null)
            {
                return urlError;
            }
            else
            {
                return "";
            }
        }
    }
    
    $("input#submit").click(function()
    {

       var errorName = name_validates(wish_name);
       var errorUrl = url_validates(wish_url);

       if (errorName != "")
       {
           alert(errorName);
           return false;
       }
       if (errorUrl != "")
       {
           alert(errorUrl);
           return false;
       }
       else
       {
           setTimeout("submit.disabled = true", 0);
           return true;
       }




    })





})
