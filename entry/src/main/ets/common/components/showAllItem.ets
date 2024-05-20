import commonRow from './commonRow'

@Component
export default struct showAllItem{

  @Consume dataModel:Object[]

  @Prop item:Object

  index:number=0

  @Consume
  AllKeys:string[]

  vals:string[]=Object.values(this.item)

  aboutToAppear(): void {
    console.log(`items:${JSON.stringify(this.vals)}`)
    this.AllKeys.forEach((item)=>{

    })
  }

  build() {

    Column(){

      ForEach(this.AllKeys,(item2:string,index:number)=>{

        commonRow({title:item2,val:this.vals[index]===''?'空':this.vals[index]})

      })

    }.width('100%').alignItems(HorizontalAlign.Center)

  }

}