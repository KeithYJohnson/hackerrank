// class Greeter {
//   constructor (name) {
//     this.name = name || 'John Doe';
//   }
//   hello () {
//     return `Hello, my name is ${ this.name }`;
//   }
// }
//
// const george = new Greeter('George');
// const msg    = george.hello();
// console.log(msg);
//


// function Greeter (name) {
//   this.name = name || "john doe";
// }
// Greeter.prototype.hello = function(){
//   return "Hello, my name is" + this.name;
// }
//
// var greeter = new Greeter('George')
// console.log(greeter.hello())

 const proto = {
   hello() {
     return `Hello, my name is ${ this.name }`
   }
 }

 const greeter = (name) => {Object.assign(Object.create(proto), {
   name
 })};
