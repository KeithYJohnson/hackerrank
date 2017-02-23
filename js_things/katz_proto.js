a = [1,2,3,4]

for(thing in a){
  console.log(thing);
}

const person = {
  firstName: 'John or Jane',
  lastName:  'Doe'
}

const man = Object.assign(Object.create(person), {
  firstName: 'John'
})

const woman = Object.assign(Object.create(person), {
  firstName: 'Jane'
})

let f_person = Object.assign(Object.create(woman), {
  lastName: 'Judy'
})

console.log(f_person);

console.log(Object.assign(Object.create(man), {
  lastName: 'Jay'
}))

const me = Object.assign(Object.create(man),{
  firstName: 'Keith',
  lastName: 'Johnson'
})

console.log(me)
