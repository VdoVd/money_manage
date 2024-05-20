import { httpClass } from '../http/req'
import searchItemVIew from './searchItemView'

@Component
export default struct searchView{
  @Provide SearchKeys:string[]=[]
  @Consume searchFlag:boolean
  @Consume searchData:Object
  aboutToAppear(): void {
    this.sv=Object.values(this.searchData)
    this.SearchKeys=Object.values(this.searchData)
  }
  @Consume sv:string[]
  changeVal(val:string,index:number){
    this.sv[index]=val
    this.sv=[...this.sv]
  }


  startSearch:()=>void=()=>{

  }
  build() {
    Column({space:15}){
    ForEach(this.sv,(item:string, index:number)=>{
      searchItemVIew({index:index})
    })
    Button('搜索')
      .onClick(()=>{

        this.searchFlag=true
        this.startSearch()
        this.sv=[...this.sv]
        console.log(`obj:${Object.values(this.sv)}`)
      })
    }.padding(20)
  }
}