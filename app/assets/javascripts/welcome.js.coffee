# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#FAQ
$ ->
  $(".faq-list").goFaq
    enableSearch: true
    enableToc: true
    enableStyling: true
    numberHtml: "<div class=\"circle-icon faq-circle-icon\"><div>{{#}}</div></div>"


