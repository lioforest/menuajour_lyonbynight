/**
 * Custom JS
 */

'use strict';


/*** Preloader ***/

var preloader = (function() {

    // Variables
    var $window = $(window);
    var loader = $("#loader-wrapper");

    // Methods
    $window.on({
        'load': function() {

            loader.fadeOut();

        }
    });

    // Events

})();


/*** Button to top page ***/

var toTopButton = (function() {

    // Variables
    var topButton = $('#back-to-top');
    var scrollTop = $(window).scrollTop();
    var isActive = false;
    if (scrollTop > 100) {
        isActive = true;
    }

    // Methods  

    // Events
    $(window).scroll(function() {
        scrollTop = $(window).scrollTop();

        if (scrollTop > 100 && !isActive) {
            isActive = true;
            topButton.fadeIn();
        } else if (scrollTop <= 100 && isActive) {
            isActive = false;
            topButton.fadeOut();
        }

    });

})();


/*** Alerts ***/

var alert = (function() {
    // Config
    // ======

    var alertLifetime = 6000;

    // Methods
    // =======

    var generate = function(type, message) {
        var newAlert = $(
            '<div class="alert alert-' +
                type +
                ' fade in" id="page-alert">' +
                message +
                "</div>"
        );

        // Append new alert
        $("body").append(newAlert);

        // Remove new alert
        setTimeout(function() {
            newAlert.alert("close");
        }, alertLifetime);
    };

    // Events
    // ======

    $(document).on("groggery.alert.show", function(e, type, message) {
        generate(type, message);
    });
})();


/*** Newsletter ***/

var newsletter = (function() {

    // Variables
    var $form = $("#mc-embedded-subscribe-form");

    // Proceed form
    function register() {
        $.ajax({
            type: $form.attr("method"),
            url: $form.attr("action"),
            data: $form.serialize(),
            cache: false,
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            error: function(err) {
                console.log(err);
                $(document).trigger("groggery.alert.show", [
                    "danger",
                    "Could not connect to the registration server. Please try again later."
                ]);
            },
            success: function(data) {
                // Remove message id
                var successMessage = data.msg.substr(0);

                if (data.result != "success") {
                    $(document).trigger("groggery.alert.show", ["danger", successMessage]);
                } else {
                    // Show a confirmation
                    $(document).trigger("groggery.alert.show", ["success", data.msg]);

                    // Reset a form
                    $form[0].reset();
                }
            }
        });
    }

    // Events
    $form.on("submit", function(e) {
        register();

        e.preventDefault();
    });

})();


/*** Reservation ***/

var reservation = (function() {

    // Variables
    var form =   $('#reservation__form');
    var formName =   $('#reservation__name');
    var formPhone =  $('#reservation__phone');
    var formEmail =  $('#reservation__email');
    var formPeople =  $('#reservation__people');
    var formDate =   $('#reservation__date');
    var formTime =   $('#reservation__time');
    var formSubmit =  form.find('[type="submit"]');
    var formActionUrl = 'reservation.php';

    // Methods
    function getCurrentDate() {
        var today = new Date();
        var dd = today.getDate();
        var mm = today.getMonth() + 1;
        var yyyy = today.getFullYear();

        if ( dd < 10 ) {
            dd = '0' + dd;
        }
        if ( mm < 10 ) {
            mm = '0' + mm;
        }

        return yyyy + '-' + mm + '-' + dd;
    }
    function setCurrentDate() {
        var today = getCurrentDate();
        formDate.val(today);
    }
    function submitForm($this) {

        $.ajax({
            url: formActionUrl,
            type: 'POST',
            data: $this.serialize(),
            dataType: 'json',
            beforeSend: function (XMLHttpRequest) {

            // Disable submit button
            formSubmit.prop('disabled', true);

            // Clear error messages
            form.find('.form-group').removeClass('has-error');
            form.find('.help-block').html('');

            },
            success: function( json, textStatus ) {

                // Enable submit button
                formSubmit.prop('disabled', false);

                function showError(elem, message) {
                    elem.closest('form-group').addClass('has-error');
                    elem.next('.help-block').html(message);
                }

                if( json.error ) {

                    // Proceed error messages
                    if ( json.error.name ) {
                        showError(formName, json.error.name);
                    }
                    if ( json.error.phone ) {
                        showError(formPhone, json.error.phone);
                    }
                    if ( json.error.email ) {
                        showError(formEmail, json.error.email);
                    }
                    if ( json.error.people ) {
                        showError(formPeople, json.error.people);
                    }
                    if ( json.error.date ) {
                        showError(formDate, json.error.date);
                    }
                    if ( json.error.time ) {
                        showError(formTime, json.error.time);
                    }
                }

                // Proceed success message
                if( json.success ) {

                    // Show alert message
                    $(document).trigger('groggery.alert.show', ['success', json.success]);

                    // Reset form fields
                    form[0].reset();
                }
            }
        });

    }

    // Set current date
    setCurrentDate();

    // Process form
    form.on('submit', function() {
        submitForm( $(this) );
        return false;
    });

})();


/*** Home parallax ***/

var parallax = (function() {

    // Variables
    var elem = $(".section_welcome");
    var elemHeight = elem.height();
    var parallaxRate = 2;

    // Methods
    $(window).scroll(function() {

        var scrollTop = $(window).scrollTop(),
            elementOffsetTop = scrollTop,
            parallaxOffset = elementOffsetTop / parallaxRate;
        
        if (elementOffsetTop <= elemHeight) {
            $(".welcome-parallax_bg").css({
                "-webkit-transform": "translateY(" + parallaxOffset + "px)",
                        "transform": "translateY(" + parallaxOffset + "px)"
            });
        }

    });

    // Events

})();


/*** Smooth scroll to anchor ***/

var smoothScroll = (function() {

    // Variables
    var link = $('a[href^="#section_"]');
    var duration = 1000;

    // Methods
    function scrollTo(link) {
        var target = $(link.attr('href'));
        var navbar = $('.navbar');
        var navbarHeight = navbar.outerHeight();

        if ( target.length ) {
            $('html, body').animate({
                scrollTop: target.offset().top - navbarHeight + 50
            }, duration);
        }
    }

    // Events
    link.on('click', function(e) {
        e.preventDefault();
        scrollTo( $(this) );
    });

})();

/*** Navbar ***/

var navbar = (function() {

    // Variables
    var scrollTop = $(window).scrollTop();
    var navbar = $('.navbar');
    var navbarLinks = $('[href*="#section_"]');
    var navbarDefault = $(".navbar-default");
    var navbarCollapse = $(".navbar-collapse");

    // Methods
    function makeInverse() {
        navbar.removeClass('navbar-default').addClass('navbar-inverse');
    }
    function makeDefault() {
        navbar.removeClass('navbar-inverse').addClass('navbar-default');
    }

    // Events

    // Toggle navbar on page load if needed
    if (scrollTop > 0) {
        makeInverse();
    }

    // Toggle navbar on scroll
    $(window).scroll(function() {
        scrollTop = $(window).scrollTop();

        if (scrollTop > 0 && $('.navbar-default').length) {
            makeInverse();
        } else if (scrollTop === 0) {
            makeDefault();
        }

    });

    // Toggle navbar on collapse
    navbarCollapse.on({
        'show.bs.collapse': function() {
            makeInverse();
        },
        'hidden.bs.collapse': function() {
            scrollTop = $(window).scrollTop();

            if (scrollTop === 0) { 
                makeDefault();
            }
        }
    });

    // Close collapsed navbar on click
    navbarLinks.on('click', function() {
        navbarCollapse.collapse('hide');
    });

})();


/*** Mobile hover ***/

var mobileHover = (function() {

    // Variables
    var item = $('.menu__item_hover, .events, .events__item');

    // Methods
    function trigger(elem) {
        elem.trigger('hover');
    }

    // Events
    item.on({
        'touchstart': function() {
            trigger( $(this) );
        },
        'touchend': function() {
            trigger( $(this) );
        }
    });

})();


/*** Gallery ***/

var gallery = (function() {

    // Variables
    var gallery = $('.gallery__grid');
    var galleryItemSelector = '.gallery__item';
    var grid;

    // Methods
    function initGallery() {
        grid = gallery.isotope({
            itemSelector: galleryItemSelector
        });
        grid.imagesLoaded().progress( function() {
            grid.isotope('layout');
        });
    };

    // Init menu
    initGallery();

})();


/*** Dishes Carousel ***/

var dishes = (function() {

    // Variables
    var container = $('.dishes_carousel');

    // Methods
    function init() {
        container.flickity({
            cellAlign: 'center',
            initialIndex: 1,
            imagesLoaded: true,
            wrapAround: true,
            selectedAttraction: 0.01,
            friction: 0.15
        });
    }

    // Events
    if ( container.length ) {
        init();
    }

})();


/*** Menu ***/

var menu = (function() {

    // Variables
    var $menu = $(".menu__grid, .menu__text-grid").isotope({
        itemSelector: ".menu__item",
        layoutMode: "masonry"
    });

    // Set ititial filtering
    $menu.imagesLoaded().progress( function() {
        $menu.isotope({ filter: ".menu_breakfast, .menu-text_breakfast" });
    });

    // Filter items on click
    $(".menu_nav").on('click', 'a', function(e) {
        var elem = $(this);

        // Filter items 
        var filterValue = elem.attr('data-filter');
        $menu.isotope({ filter: filterValue });

        // Change active button
        elem.parents("li").addClass("active").siblings("li").removeClass("active");

        e.preventDefault();
    });

})();


