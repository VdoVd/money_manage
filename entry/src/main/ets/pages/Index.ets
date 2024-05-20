import { moneyItem, moneyStore } from '../common/data'
import home from '../views/index/home'
import mine from '../views/mine/mine'
import ChartComp from '../views/chart/charts'

@Entry
@Component
struct Index {

  onPageShow(): void {
    PersistentStorage.persistProp<moneyItem[]>("arr",[])
    PersistentStorage.persistProp<moneyStore[]>("store",[])
    AppStorage.setOrCreate<number>("year",2024)
    AppStorage.setOrCreate<number>("mouth",5)
    AppStorage.setOrCreate<boolean>("flag",false)
    let context=getContext()
    let path=context.tempDir
  }

  @State num:number=0

  @Builder
  tarBarBuilder(name:string,index:number){
    Text(name)
      .fontColor(this.num===index?Color.Black:Color.Gray)
  }

  build() {

    Tabs(){

      TabContent(){
        home()
      }.tabBar(this.tarBarBuilder('账单',0))

      TabContent(){
        ChartComp()
      }.tabBar(this.tarBarBuilder('图表',1))

      TabContent(){
        mine()
      }.tabBar(this.tarBarBuilder('我的',2))

    }.barPosition(BarPosition.End)
    .onTabBarClick((index)=>{
      this.num=index
    })

  }
}