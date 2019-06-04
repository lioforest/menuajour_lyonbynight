/**
 * Contact form
 */

"use strict";

var contact = (function() {

    // Variables
    var form = $('#form_sendemail');
    var formAlert = $('#form_message');
    var formEmail = $('#email');
    var formName = $('#name');
    var formMessage = $('#message');

    // Methods
    function formSubmit($this) {

        $.ajax({
            url: 'assets/plugins/contact/contact.php',
            type: 'POST',
            data: $this.serialize(),
            dataType: 'json',
            beforeSend: function (XMLHttpRequest) {

                // Clear error messages
                form.find('.has-error').removeClass('has-error');
                form.find('.help-block').html('').hide();
                formAlert.removeClass('alert-success').html('');

            },
            success: function( json, textStatus ) {

                if( json.error ) {

                    // Proceed error messages
                    if( json.error.email ) {
                        formEmail.parent().addClass('has-error');
                        formEmail.next('.help-block').html( json.error.email ).slideDown();
                    }
                    if( json.error.name ) {
                        formName.parent().addClass('has-error');
                        formName.next('.help-block').html( json.error.name ).slideDown();
                    }
                    if( json.error.message ) {
                        formMessage.parent().addClass('has-error');
                        formMessage.next('.help-block').html( json.error.message ).slideDown();
                    }
                }

                // Proceed success message
                if( json.success ) {
                    formAlert.addClass('alert-success').html( json.success ).slideDown();
                  
                    setTimeout(function() {
                        formAlert.slideUp('fast', function() {
                            $(this).removeClass('alert-success').html('');
                        });
                    }, 4000);

                  form[0].reset();
                }
            }
        });

    }

    // Events
    form.on('submit', function() {
        var $this = $(this);

        formSubmit($this);

        return false;
    });

})();