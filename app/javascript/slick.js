//スライダの同期
$(document).ready(function () {
    $('.slider-for').slick({
      slidesToShow: 1,
      slidesToScroll: 1,
      speed: 500,
      arrows: true,
      fade: true,
      asNavFor: '.slider-nav'
    });
    $('.slider-nav').slick({
      slidesToShow: 3,
      slidesToScroll: 1,
      speed: 500,
      asNavFor: '.slider-for',
        arrows:false,
      dots: false,
      centerMode: true,
      focusOnSelect: true,
      slide: 'p'
    });
});

//センターモード
$(document).ready(function () {
    $('.center-mode').slick({
      centerMode: true,
      infinite: true,
      centerPadding: '40px',
      slidesToShow: 3,
      speed: 800,
      dots: true,
      autoplay: true,
      autoplaySpeed: 3000,
      arrows: false,
      responsive: [{
        breakpoint: 768,
        settings: {
          centerPadding: '40px',
          slidesToShow: 1,
        }
      }]
    });
  });