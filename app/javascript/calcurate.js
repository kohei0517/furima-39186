function calc (){
  const get_price = document.getElementById('item-price');
  const addtax = document.getElementById('add-tax-price');
  const profit = document.getElementById('profit');
  get_price.addEventListener('keyup',function(){
    const inputValue = get_price.value;
    tax = parseInt(inputValue*0.1)
    pro = parseInt(inputValue*0.9)
    addtax.innerHTML=`${tax}`;
    profit.innerHTML=`${pro}`;
  })
};

window.addEventListener('load', calc);