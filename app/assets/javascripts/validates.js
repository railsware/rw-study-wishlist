/**
 * Created with JetBrains RubyMine.
 * User: freeman13
 * Date: 5/21/12
 * Time: 1:41 AM
 * To change this template use File | Settings | File Templates.
 */


$(document).ready(function () {

    var emptyErrorUrl = "Пустое поле URL";
    var formatErrorUrl = "Некоректный адрес";
    var MaxLengthErrorName = "Слишком длинное название";
    var MinLengthErrorName = "Слишком короткое название";
    var emptyErrorImage = "Прикрепите картинку";
    var urlRegExp = /^((http|https|ftp):\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/g;
    var submit =  $('input#submit');
    var wishName = $("input#wish_name");
    var wishUrl = $("input#wish_url");
    var wishImage = $("input#wish_image");


    function isNameValid(nameVal)
    {
        if ( (nameVal.length < 2) || (nameVal.length > 50) )
        {
          return false;
        }
        else
        {
          return true;
        }

    }


    function isUrlValid(urlVal)
    {
        if ( (urlVal.length == 0) || (urlVal.match(urlRegExp) == null) )
        {
            return false;
        }
        else
        {
            return true;
        }

    }

    function isImageValid(imageVal)
    {
       if (imageVal == "")
       {
           return false
       }
       else
       {
           return true
       }

    }

    function getInvalidImageError(imageVal)
    {
        return emptyErrorImage
    }


    function getInvalidNameError(nameVal)
    {
        if (nameVal.length < 2)
        {
          return MinLengthErrorName;
        }
        else //50 or more characters
        {
          return MaxLengthErrorName;
        }

    }


    function getInvalidUrlError(urlVal)
    {
        if (urlVal.length == 0)
        {
            return emptyErrorUrl;
        }
        else
        {
            return formatErrorUrl;
        }

    }

    
    $("input#submit").click(function()
    {
        var wishNameVal = wishName.val();
        var wishUrlVal = wishUrl.val().toLowerCase();
        var wishImageVal = wishImage.val();

       if (isNameValid(wishNameVal) == false)
       {
           alert(getInvalidNameError(wishNameVal));
           return false;
       }

       if (isUrlValid(wishUrlVal) == false)
       {
           alert(getInvalidUrlError(wishUrlVal));
           return false;
       }

       if (isImageValid(wishImageVal) == false)
       {
           alert(getInvalidImageError(wishImageVal));
           return false
       }
       else
       {
           setTimeout("submit.disabled = true", 0);
           return true;
       }

    })

})
