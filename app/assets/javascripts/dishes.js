$(document).ready(function() {

  //Button Modal
  $('#new-dish').click( function(){
    $.ajax({
      type: "GET",
      url: "/dishes/new",
      dataType: "html"
    })
    .done(function(data, textStatus, xhr){
      $('#new-dish-modal').html(data);
      $('#new-dish-modal').modal('show');
    })
  });

  //Datatable of index
  $('#dishes-table').dataTable({
    oLanguage: {
      sUrl: "/datatables/spanish.txt"
    },
    sPaginationType: "full_numbers",
    bJQueryUI: true,
    bProcessing: true,
    bServerSide: true,
    sAjaxSource: $('#dishes-table').data('source')
  }); 

}); //End Document