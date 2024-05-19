import { moneyItem, moneyStore } from '../common/data'
import charts from '../views/chart/charts'
import home from '../views/index/home'
import mine from '../views/mine/mine'


@Entry
@Component
struct Index {

  onPageShow(): void {
    AppStorage.setOrCreate<moneyItem[]>("arr",[])
    PersistentStorage.persistProp<moneyStore[]>("store",[])
    AppStorage.setOrCreate<boolean>("flag",false)
    AppStorage.setOrCreate<boolean>("changeArr",false)
    let context=getContext()
    let path=context.tempDir
    console.log('tmp'+path)
    console.log('files'+context.filesDir)
    console.log('cache'+context.cacheDir)
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
        charts()
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