const proto = {
  greet(){
    console.log('super!');
  },

  sayHi(){
    console.log("HEY");
  }
}

const hello = {
  sayHi(){
    console('HELLO')
  }
}

let thing = Object.create(proto)
let oTT = Object.assign(hi, {
  name: 'keith'
})

console.log(thing)
thing.sayHi()
