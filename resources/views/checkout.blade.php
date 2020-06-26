@extends('layouts.front')


@section('content')

    <div class="container">
       <div class="com-md-6">
           <div class="row">
               <div class="col-md-12">
                   <h2>Dados Para Pagamento</h2>
                   <hr>
               </div>
           </div>
        <form action="" method="post">
            <div class="row">
                <div class="col-md-12 form-group">                    
                        <label for="">Nome no Cartão</label>
                        <input type="text" name="card_name" id="" class="form-control">                      
                 </div>
           </div>
           <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                        <label for="">Número do Cartão <span class="brand"></span></label>
                        <input type="text" name="card_number" id="" class="form-control">
                        <input type="hidden" name="card_brand" id="">
                    </div>
                </div>
           </div>

            <div class="row">
                <div class="col-md-2 form-group">
                    <label for="">Mês de Experiração</label>
                    <input type="text" name="card_month" id="" class="form-control">
                </div>

                <div class="col-md-4 form-group">
                    <label for="">Ano de Experiração</label>
                    <input type="text" name="card_year" id="" class="form-control">
                </div>
            </div>

            <div class="row">
                <div class="col-md-4 form-group">
                    <label for="">Código de Segurança</label>
                    <input type="text" name="card_cvv" id="" class="form-control">
                </div>

                <div class="col-md-12 installments form-group"></div>
            </div>

            <button class="btn btn-success btn-lg processCheckout">Efetuar Pagamento</button>

        </form>
       </div>
    </div>



@endsection

@section('scripts')
    <script src="https://stc.sandbox.pagseguro.uol.com.br/pagseguro/api/v2/checkout/pagseguro.directpayment.js"></script>
    <script src="{{asset('assets/js/jquery.ajax.js')}}"></script>
    <script>
        const sessionId = '{{session()->get('pagseguro_session_code')}}';

        PagSeguroDirectPayment.setSessionId(sessionId);
    </script>    

    <script>
        //Pegar bandeira do cartão
        let amountTransaction = '{{$cartItems}}';
        let cardNumber = document.querySelector('input[name=card_number]');
        let spanBrand = document.querySelector('span.brand');

        cardNumber.addEventListener('keyup', function(){

            if(cardNumber.value.length >= 6){
                PagSeguroDirectPayment.getBrand({
                    cardBin: cardNumber.value.substr(0, 6), //6 primeirtos digitos do cartão
                    success: function(res){
                        let imgFlag = `<img src="https://stc.pagseguro.uol.com.br/public/img/payment-methods-flags/68x30/${res.brand.name}.png">`;
                        spanBrand.innerHTML =imgFlag;
                        document.querySelector('input[name=card_brand]').value = res.brand.name;

                        getInstallments(amountTransaction, res.brand.name);
                    },
                    error: function(err){
                        console.log(err);
                    },
                    complete: function(res) {
                        console.log('Complete: ', res);
                    }
                });
            }
        });

        let submitButton = document.querySelector('button.processCheckout');

        submitButton.addEventListener('click', function(){

            event.preventDefault();

            PagSeguroDirectPayment.createCardToken({
                cardNumber:         document.querySelector('input[name=card_number]').value,
                brand:              document.querySelector('input[name=card_brand]').value ,
                cvv:                document.querySelector('input[name=card_cvv]').value ,
                expirationMonth:    document.querySelector('input[name=card_month]').value ,
                expirationYear:     document.querySelector('input[name=card_year]').value ,
                success: function(res){
                   
                    processPayment(res.card.token);
                }
            });
        });

        function processPayment(token)
        {
            let data = {
                card_token: token,
                hash: PagSeguroDirectPayment.getSenderHash(),
                installment: document.querySelector('.select_installments').value,
                card_name: document.querySelector('input[name=card_name]').value,
                _token: '{{csrf_token()}}'
            };

            $.ajax({
                type: 'POST',
                url: '{{route("checkout.proccess")}}',
                data: data,
                dataType: 'json',
                success: function(res){
                    alert(res.data.message)
                }
            });
        }


    

        function getInstallments(amount, brand){
            PagSeguroDirectPayment.getInstallments({
                amount: amount,
                brand: brand,
                maxInstallmentNoInterest: 0,
                success: function(res){
                    let selectInstallments = drawSelectInstallments(res.installments[brand]);
                   document.querySelector('div.installments').innerHTML = selectInstallments;
                },
                error: function(err){
                    console.log(err)
                },
                complete: function(res){

                },
            })
        }

        function drawSelectInstallments(installments) {
		let select = '<label>Opções de Parcelamento:</label>';

		select += '<select class="form-control select_installments">';

		for(let l of installments) {
		    select += `<option value="${l.quantity}|${l.installmentAmount}">${l.quantity}x de ${l.installmentAmount} - Total fica ${l.totalAmount}</option>`;
		}


		select += '</select>';

		return select;
	}
    </script>
@endsection