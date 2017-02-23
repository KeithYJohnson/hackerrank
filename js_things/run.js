class Thing {

  doMath(x) {
    return x + 3
  }

  static staticMath(x) {
    return x + 100
  }
}

function otherMath(x) {
  return x + 10
}

let thing = new Thing
console.log('thing: ' + thing)
console.log([1, 4, 6, 10].map(thing.doMath))
console.log([1, 4, 6, 10].map(otherMath))
console.log([1, 4, 6, 10].map(Thing.staticMath))


class OtherThing {
  constructor(name) {
    this.name = name
  }

  sayName() {
    console.log(`My name is ${this.name}`)
  }
}

otherThing = new OtherThing('Keith')
otherThing.sayName()

Thing.prototype.doMoreMath = (input) => {
  console.log(`doing more math with input: ${input}`);
}

let newThing = new Thing
newThing.doMoreMath(10)
