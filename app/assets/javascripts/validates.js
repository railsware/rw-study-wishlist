/**
 * Created with JetBrains RubyMine.
 * User: freeman13
 * Date: 5/21/12
 * Time: 1:41 AM
 * To change this template use File | Settings | File Templates.
 */
$(document).ready(function () {

    var emptyError = "Поле не может быть пустым";
    var urlError = "Некоректный url";
    var ratingError = "Некоректный рейтинг";
    var nameMaxLengthError = "Слишком длинное имя";
    var nameMinLengthError = "Слишком короткое имя";
    var errorName = "";
    var errorUrl = "";
    var errorRating = "";

    $("input#wish_name").blur(function()
    {
       if ($(this).value.length == 0)
       {
           errorName = emptyError;
       }
       else
       {
           if ( ($(this).value.length > 0) && ($(this).value.length < 2))
           {
               errorName = nameMinLengthError;
           }
           else
           {
               if ($(this).value.length > 50)
               {
                   errorName = nameMaxLengthError;
               }
           }
       }

       $("span#error_name").text(errorName);


    });

});
