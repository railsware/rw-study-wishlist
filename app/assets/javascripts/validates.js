/**
 * Created with JetBrains RubyMine.
 * User: freeman13
 * Date: 5/21/12
 * Time: 1:41 AM
 * To change this template use File | Settings | File Templates.
 */
$(document).ready(function () {

    function disableSubmit() {
      canBeSubmited = false;
      //$("input#submit").attr('disabled', true);
    }



    var canBeSubmited = false;
    var emptyError = "Пустое поле!";
    var urlError = "Некоректный адрес";
    var ratingError = "Некоректный рейтинг";
    var nameMaxLengthError = "Слишком длинное имя";
    var nameMinLengthError = "Слишком короткое имя";
    var errorName = "?";
    var errorUrl = "?";
    var errorRating = "?";
    var urlRegExp = /^((http|https|ftp):\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/g;

    if ($("input#submit").attr('isEdit') == "true" )
    {
       errorName = "";
       errorUrl = "";
       errorRating = "";
    }
    else
    {
      disableSubmit()
    }
    
    $("input#submit").click(function(){
      // if (!canBeSubmited) {
      //   // here you should highlite errors
      //   alert('Error')
      //   return false;
      // }
    })

    $("input#wish_name").blur(function()
    {

        errorName = "";
       if ($(this).val().length == 0)
       {
           errorName = emptyError;
       }
       else
       {
           if ( ($(this).val().length > 0) && ($(this).val().length < 2))
           {
               errorName = nameMinLengthError;
           }
           else
           {
               if ($(this).val().length > 50)
               {
                   errorName = nameMaxLengthError;
               }
           }
       }

       $("span#error_name").text(errorName);


    });

    $("input#wish_rating").blur(function()
    {
        errorRating = "";

        if ($(this).val().length == 0)
        {
            errorRating = emptyError;
        }
        else
        {
           if ($(this).val().length > 1)
           {
               errorRating = ratingError;
           }
           else
           {
               if ( ($(this).val().charCodeAt(0) < 49) || ($(this).val().charCodeAt(0) > 53) )
               {
                   errorRating = ratingError;
               }
           }
        }

        $("span#error_rating").text(errorRating);


    });

    $("input#wish_url").blur(function()
    {
        errorUrl = "";


        if ($(this).val().length == 0)
        {
            errorUrl = emptyError;
        }
        else
        {
            if ($(this).val().match(urlRegExp) == null)
            {
               errorUrl = urlError;
            }
        }


        $("span#error_url").text(errorUrl);


    });

    $("input#wish_name, input#wish_url, input#wish_rating").blur(function()
    {
       if ( (errorName == "") && (errorRating == "") && (errorUrl == ""))
       {
         disableSubmit();
       }
       else
       {
         disableSubmit();
       }


    });





});
