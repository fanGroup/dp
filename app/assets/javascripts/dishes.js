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

  $('#edit-dish').click( function(){
    console.log("holaaaa");
    var dish_id = $('#dish-id').val();
    $.ajax({
      type: "GET",
      url: "/dishes/" + dish_id + "/edit",
      dataType: "html"
    })
    .done(function(data, textStatus, xhr){
      console.log("Estoy en el done");
      $('#edit-dish-modal').html(data);
      $('#edit-dish-modal').modal('show');
    })
  });

  $('#new-category').click( function(){
    $.ajax({
      type: "GET",
      url: "/categories/new",
      dataType: "html"
    })
    .done(function(data, textStatus, xhr){
      $('#new-category-modal').html(data);
      $('#new-category-modal').modal('show');
    })
  });

  $(document).on('ajax:before', '#new_category', function(){
    if ($("#category_name").val() == '') {
      return false;
    }
  });

  $(document).on('ajax:success','#new_category', function(evt, data, status, xhr){
    $('#new-category-modal').modal('hide');
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