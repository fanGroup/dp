$(document).ready(function() {

  $('#new-sale').click( function(){
    $.ajax({
      type: "GET",
      url: "/sales/new",
      dataType: "html"
    })
    .done(function(data, textStatus, xhr){
      $('#new-sale-modal').html(data);
      $('#new-sale-modal').modal('show');
    })
  });

  //Token to dish
  $('#product_category_tokens').tokenInput('/categories.json', {
    crossDomain: false,
    prePopulate: $('#product_category_tokens').data('pre'),
    theme: "facebook",
    tokenLimit: "1",
    noResultsText: "<%= I18n.t('.token_input.noResultsText') %>",
    hintText: "<%= I18n.t('.token_input.hintText_surname')%>",
    searchingText: "<%= I18n.t('.token_input.searchingText')%>",
    resultsFormatter: function(item){
      var referrer = (item.referrer == null ? "" : "("+item.referrer.name+")");
      return "<li><p style='color: black' >" + item.name+ referrer+ " </p> </li>" },
    tokenFormatter: function(item) {
      var referrer = (item.referrer == null ? "" : "("+item.referrer.name+")");
      return "<li><p>" + item.name+ referrer+ " </p> </li>" }
  });

  //Datatable of index
  $('#sales-table').dataTable({
    oLanguage: {
      sUrl: "/datatables/spanish.txt"
    },
    sPaginationType: "full_numbers",
    bJQueryUI: true,
    bProcessing: true,
    bServerSide: true,
    sAjaxSource: $('#sales-table').data('source')
  });

});  