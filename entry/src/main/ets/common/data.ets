export interface timeClass{
  mouth:string[]
  year:string[]
}

export const data = () =>{

  let data:timeClass={} as timeClass
  console.log('before start...')
  data.mouth=Array.from({length:12})
  data.year=Array.from({length:100})
  data.mouth=[...data.mouth.map((item,index)=>(index+1).toString())]
  data.year=[...(data.year.map((item,index)=>(index+2000).toString()))]
  console.log(`${JSON.stringify(data)}`)
  return data
}