import { incomeName, moneyItem, moneyType, outcomeName } from '../common/data'
import SelectMoneyView from '../views/count/IncomeView'

@Entry
@Component
struct count {

  @Provide selectCount:number=0
  @State tabNum:number=0
  @StorageLink("arr") arr:moneyItem[]=[]
  @StorageLink("flag") flag:boolean=false
  @State moneyCount:ResourceStr=''
  @Builder
  tarBarBuilder(name:string,index:number){
    Text(name)
      .fontColor(this.tabNum===index?Color.Black:Color.Gray)

  }

  build() {



    Navigation(){

      Tabs(){

        TabContent(){
          this.mainView(incomeName)

        }.tabBar(this.tarBarBuilder('支出',0))

        TabContent(){
          this.mainView(outcomeName)
        }.tabBar(this.tarBarBuilder('收入',1))

      }.onTabBarClick((index)=>{
        this.tabNum=index
      })

    }.titleMode(NavigationTitleMode.Mini)

  }

  @Builder
  mainView(arr:string[]) {
    Column({space:15}) {
      TextInput({placeholder:'请输入',text:$$this.moneyCount})
        .type(InputType.Number)
        .onSubmit(()=>{
          let item:moneyItem={
            num:parseInt(this.moneyCount.toString()),
            type:this.tabNum===0?moneyType.outcome:moneyType.income,
            name:arr[this.selectCount]
          }
          console.log(`item:${JSON.stringify(item)}`)
          this.arr.push(item)
          this.flag=true
        })
      SelectMoneyView({ arr: arr })
    }.height('100%')
    .justifyContent(FlexAlign.Start)
  }
}