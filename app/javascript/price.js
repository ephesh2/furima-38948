window.addEventListener('load',function(){

  const price = document.getElementById('item-price');
  const addTaxPrice = document.getElementById('add-tax-price');
  const profit = document.getElementById('profit');
  
  price.addEventListener('input', function(){
    addTaxPrice.innerHTML = Math.floor(price.value * 0.1);
    profit.innerHTML = Math.floor(price.value * 0.9);
  })

})