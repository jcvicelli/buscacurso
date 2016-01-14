$(document).ready(function(){
    console.log("buscacep.js");

      $( ".form-group" ).on( "change", ".cep", function(){
      //$(".btcep").click(  function(){
        console.log("buscacep.js init");
        var fields = $(this).next();
        //var cep = $(this).siblings().eq(2).val();
        var cep = $(".cep").val();
        var url = 'http://cep.republicavirtual.com.br/web_cep.php?formato=json&cep=';

        $.ajax({url: url+cep, success: function(data){
          if (data.resultado == "1") {
            console.log("result=1");
            fields.children().eq(2).val(data.cidade);
            fields.next().children().eq(2).val(data.uf);
            fields.next().next().children().eq(2).val(data.bairro);
            fields.next().next().next().children().eq(2).val(data.tipo_logradouro +" "+ data.logradouro);
          } else if (data.resultado == "2") {
            console.log("result=2");
            fields.children().eq(2).val(data.cidade);
            fields.next().children().eq(2).val(data.uf);
          } else {
            alert("CEP nao encontrado!");
          }
        }});
        return this;
      });


});
