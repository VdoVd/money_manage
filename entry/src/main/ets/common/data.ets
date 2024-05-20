export interface timeClass{
  mouth:string[]
  year:string[]
}

export interface incomeContent{

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

export const incomeName:string[]=[

  "餐饮","交通","购物","服饰","娱乐","红包","水电","烟酒","水果","日用品","美容","住房","通讯","蔬菜","学习","旅游","运动","孩子","宠物","居家","书籍"

]

export const outcomeName:string[]=[

  "工资","兼职","理财","礼金","报销","奖金","其他收入","设置"

]

export enum moneyType{
  income='收入',
  outcome='支出'
}

export interface moneyItem{
  num:number,
  type:moneyType
  name:string
}

export interface moneyStore{
  year:string
  mouth:string
  moneyItem:moneyItem[]
}

export const getNum = () =>{
  return `${Math.floor(Math.random()*255)}`
}

export const getRGB=()=>{
  return 'rgb('+getNum()+','+getNum()+','+getNum()+')'
}

export interface userRes{
  id:number
  name:string
  age:number
  email:string
  password:string
}