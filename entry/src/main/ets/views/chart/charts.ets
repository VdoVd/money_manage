import { McLineChart, Options } from '@mcui/mccharts'
import { InterfaceObj } from '@mcui/mccharts/src/main/ets/utils/chartInterface'
import { when } from '@ohos/hypium'
import { moneyItem, moneyStore, moneyType} from '../../common/data'

@Component
export default struct ChartComp {

  @State selectNum:number=0
  @StorageLink("arr") arr:moneyItem[]=[]
  @StorageLink("store") store:moneyStore[]=[]
  mouths:string[]=this.getXArr()

  getXArr(){
    let arr:string[]=[]
    for(let i=1;i<13;i++){
      arr.push(`${i}`)
    }
    return arr
  }

  getValueArr(){
    let arr:string[]=[]
    for(let i=1;i<13;i++){
      arr.push(`${0}`)
    }
    return arr
  }

  getValue(){
    let arr:string[]=this.getValueArr()
    let res:number=0
    this.store.forEach((item)=>{
      res=0
      item.moneyItem.forEach(item=>{
        if(this.selectNum===0){
          res+=item.type===moneyType.outcome?item.num:0
        }else {
          res+=item.type===moneyType.income?item.num:0
        }
      })
      let index = this.mouths.indexOf(item.mouth)
      // while (index!=12){
      //   let r=this.mouths[index]===this.mouths[index+1]
      //   if(r)index++
      // }
      arr[index]=res.toString()
    })
    console.log(`arr:${JSON.stringify(arr)}`)
    return arr
  }
  xArr:string[]=this.getXArr()

  geneRate(){

    let series:InterfaceObj= [
      {
        name: this.selectNum===0?'支出':'收入',
        data: this.getValue(),
        label:{
          fontSize:50
        }
      }
    ]

    let obj:InterfaceObj={
      xAxis: {
        data: this.getXArr(),
        axisLabel:{
          fontSize:50
        },
        axisLine:{
          lineStyle:{
            width:0.5
          }
        }
      },
      yAxis: {
        name: '记账',
        axisLabel:{
          fontSize:50
        }
      },
      series:series,
      tooltip:{
        textStyle:{
          fontSize:20
        }
      }

    }

    let defOption: Options = new Options(obj)

    return defOption

  }

  @Builder
  public tarBarBuilder(name:string,index:number){

      Text(name)
        .width('100%')
        .textAlign(TextAlign.Center)
        .fontColor(this.selectNum===index?Color.Black:Color.Gray)

  }

  build() {
    Column(){
      Tabs(){

        TabContent(){

          this.content()

        }.tabBar(this.tarBarBuilder('支出',0))


        TabContent(){

          this.content()

        }.tabBar(this.tarBarBuilder('收入',1))


      }.onTabBarClick((index)=>{
        this.selectNum=index
        console.log(`index:${this.selectNum}`)
      })


    }

  }
  @State navSelect:number=0
  @Builder
  content() {
    Column(){

      Row() {
        Text('年')
          .onClick(()=>{
            this.navSelect=0
        })
          .width('30%')
          .textAlign(TextAlign.Center)
          .fontColor(this.navSelect===0?Color.Black:Color.Gray)
        Text('月')
          .onClick(()=>{
            this.navSelect=1
          })
          .width('30%')
          .textAlign(TextAlign.Center)
          .fontColor(this.navSelect===1?Color.Black:Color.Gray)
      }

      Row() {

        McLineChart({
          options:this.geneRate()
        })

      }
      .height('50%')
      .width('90%')
      .justifyContent(FlexAlign.Start)

    }.height('100%')
  }
}