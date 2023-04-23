window.addEventListener('load', function(){

  const payjp = Payjp(process.env.PAYJP_PUBLIC_KEY)
  const elements = payjp.elements();
  const elementNumber = elements.create('cardNumber');
  const elementExpiry = elements.create('cardExpiry');
  const elementCvc = elements.create('cardCvc');

  elementNumber.mount('#card-number');
  elementExpiry.mount('#card-exp');
  elementCvc.mount('#card-cvc');

  const submit_btn = document.getElementById('button');
  submit_btn.addEventListener('click', function(e) {

    e.preventDefault();
    payjp.createToken(elementNumber).then(function(response) {
      if (response.error) {
      } else {
        const token = response.id;
        const renderDom = document.getElementById('charge-form') ;
        const tokenObj = `<input value=${token} name='token' type='hidden'>`;
        renderDom.insertAdjacentHTML('beforeend',tokenObj);
      }
      elementNumber.clear();
      elementExpiry.clear();
      elementCvc.clear();

      document.getElementById('charge-form').submit();
    });
  });
});
