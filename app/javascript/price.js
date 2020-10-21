function price(){

 const priceinput = document.getElementById("item-price");
 const addtax = document.getElementById("add-tax-price");
 const profit = document.getElementById("profit");

   priceinput.addEventListener('keyup', () => {
       const value = priceinput.value;
     if (value >= 300 && value <= 9999999){
       let fee = value * 0.1
       let gains = value - fee
       addtax.textContent = fee;
       profit.textContent = gains;
       } 
     else {
      let fee = '-';
      let gains = '-';
      addtax.textContent = fee;
      profit.textContent = gains;
   }
 });
}
 window.addEventListener('load', price);