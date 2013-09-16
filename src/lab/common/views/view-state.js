/*global define */

/**
 * Custom handling of enabled/disabled state for Lab's HTML elements.
 */
define(function () {

  return {
    disableView: function($element) {
      $element.addClass("lab-disabled");
      $element.append('<div class="lab-disabled-overlay"/>');
    },

    enableView: function($element) {
      $element.removeClass("lab-disabled");
      $element.find(".lab-disabled-overlay").remove();
    }
  };
});
