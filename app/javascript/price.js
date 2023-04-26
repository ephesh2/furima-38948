window.addEventListener('load',function(){

  const price = document.getElementById('item-price');
  const addTaxPrice = document.getElementById('add-tax-price');
  const profit = document.getElementById('profit');
  
  price.addEventListener('input', function(){
    taxValue = Math.floor(price.value * 0.1);
    profitValue = price.value - taxValue;
    addTaxPrice.innerHTML = taxValue;
    profit.innerHTML = profitValue;
  })

})