function calc (){
  const get_price = document.getElementById('item-price');
  const addtax = document.getElementById('add-tax-price');
  const profit = document.getElementById('profit');
  get_price.addEventListener('keyup',function(){
    const inputValue = get_price.value;
    addtax.innerHTML=`${ Math.floor(inputValue*0.1)}`;
    profit.innerHTML=`${Math.floor(inputValue*0.9)}`;
  })
};

window.addEventListener('load', calc);