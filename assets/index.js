$(function () {
  $('.collapse__expand').click(function (e) {
    e.preventDefault();
    var container = $(this).closest('.collapse').find('.collapse__content');

    var symbols = ['>', 'v'];
    $(this).text($(this).text().replace(symbols[+container.hasClass('show')], symbols[+!container.hasClass('show')]));

    container.toggleClass('show');
  });
});
