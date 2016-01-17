//https://viacep.com.br/exemplo/jquery/

$( document).on( "change", ".cep", function(){

  //Nova variável "cep" somente com dígitos.
  var cep = $(this).val().replace(/\D/g, '');
  var fields = $(this).next();

  //Verifica se campo cep possui valor informado.
  if (cep != "") {

    //Expressão regular para validar o CEP.
    var validacep = /^[0-9]{8}$/;

    //Valida o formato do CEP.
    if(validacep.test(cep)) {

      //Consulta o webservice viacep.com.br/
      $.getJSON("//viacep.com.br/ws/"+ cep +"/json/?callback=?", function(dados) {

        if (!("erro" in dados)) {
          //Atualiza os campos com os valores da consulta.
          fields.children().eq(2).val(dados.localidade);
          fields.next().children().eq(2).val(dados.uf);
          fields.next().next().children().eq(2).val(dados.bairro);
          fields.next().next().next().children().eq(2).val(dados.logradouro);
        } //end if.
        else {
          //CEP pesquisado não foi encontrado.
          alert("CEP não encontrado.");
        }
      });
    } //end if.
    else {
        //cep é inválido.
        alert("Formato de CEP inválido.");
    }
  } //end if.

});
