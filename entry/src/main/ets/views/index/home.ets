import timeDialog from '../../common/TimeSelectDialog'
import NoBill from '../NoBill'
import { router } from '@kit.ArkUI'
import { getRGB, moneyItem, moneyStore, moneyType } from '../../common/data'

@Component
export default struct home{

  @State @Watch("change") year:string=''
  @State @Watch("change") mouth:string=''
  @State money:number=0
  @StorageLink("arr") arr:moneyItem[]=[]
  @StorageLink("store") store:moneyStore[]=[]
  @StorageLink("flag") @Watch("changeStore") flag:boolean=false
  @Provide @Watch("getStore") findStore:boolean=true
  @State outcome:number=0
  @State income:number=0
  @State deleteFlag:boolean=false

  controller:CustomDialogController=new CustomDialogController({
    builder:timeDialog({year:this.year,mouth:this.mouth})
  })

  aboutToAppear(): void {
    let d=new Date()
    this.year=d.getFullYear().toString()
    this.mouth=(d.getMonth()+1).toString()
    this.getStore()
    // this.change()
    console.log(`store:${JSON.stringify(this.store)}`)
  }

  private changeStore(){
    let obj:moneyStore = {year:this.year,mouth:this.mouth,moneyItem:this.arr}
    console.log(`add store:${JSON.stringify(obj)}`)
    if(this.store.length===0){
      this.store.push(obj)
      this.store=[...this.store]
      console.log(`add store length 0:${JSON.stringify(this.store)}`)
      this.change()
      return
    }
    this.store.forEach(item=>{
      if(obj.year!=item.year||obj.mouth!=item.mouth){
        this.store.push(obj)
        this.store=[...this.store]
        console.log(`add store obj:${JSON.stringify(this.store)}`)
      }else {
        item.moneyItem=this.arr
        this.store=[...this.store]
        console.log(`add store obj:${JSON.stringify(this.store)}`)
      }
    })
    this.change()
    return
  }

  @State timeId:number=0

  private getStore() {
    clearInterval(this.timeId)
    this.timeId=setInterval(()=>{
      if(this.findStore===true){
        if(this.store.length===0) {
          this.arr = [...[]]
          this.change()
          return
        }
        let f=false
        this.store.forEach(item => {
          if ((item.mouth===this.mouth&&item.year===this.year)) {
            this.arr = [...item.moneyItem]
            f=true
          }
        })
        if(f===false){
          console.log('false')
          this.arr=[...[]]
          this.change()
          return
        }
        this.change()
        this.findStore=false
        console.log(`store:${JSON.stringify(this.store===undefined?'none':this.store)}`)
        console.log('get store')
      }
    },1000)

  }

  change(){
    this.money=0
    this.outcome=0
    this.income=0
    this.arr.forEach((item)=>{
      if(item.type===moneyType.outcome){
        this.outcome-=item.num
      }else {
        this.income+=item.num
      }
    })
    this.arr=[...this.arr]
    this.money=this.income+this.outcome
    console.log(`arr:${JSON.stringify(this.arr)}`)
    this.flag=false
  }

  build() {

    Scroll(){

      Column({space:7}){

        Column(){
          Text(`${this.year}年${this.mouth}月支出`)
            .fontSize(12)
            .fontColor(Color.Gray)
            .width('100%')
            .textAlign(TextAlign.Start)
            .onClick(()=>{
              this.controller.open()
            })
          Row() {
            Text(`￥`)
            Text(`${this.money.toFixed(2)}`)
              .fontWeight(FontWeight.Bolder)
              .fontSize(25)
          }.justifyContent(FlexAlign.Start).width('100%')

          Row(){

            Row({space:13}){
              Text('本月收入').fontColor(Color.Gray).fontSize(13)
              Text(`${this.income.toFixed(2)}`)
                .fontWeight(FontWeight.Bolder)
                .fontSize(12)
            }.width('50%').justifyContent(FlexAlign.Start)

            Row({space:13}){
              Text('本月支出').fontColor(Color.Gray).fontSize(13)
              Text(`${this.outcome.toFixed(2)}`)
                .fontWeight(FontWeight.Bolder)
                .fontSize(12)
            }.width('50%').justifyContent(FlexAlign.Start)

          }
        }.padding(20).borderRadius(20)
        .width('92%')
        .backgroundColor(Color.White)
        .margin({top:10})
        .height(130)

        if(this.money!=0||this.outcome!=0||this.income!=0){
          Scroll(){
            Column({space:15}){
              ForEach(this.arr,(item:moneyItem)=>{
                this.moneyItem(item.name,item.type===moneyType.income?item.num:-item.num)

              })
            }.height('100%')
            .justifyContent(FlexAlign.Start)
          }.layoutWeight(1)


        }else{
          NoBill()
            .layoutWeight(1)

        }

        Text('+')
          .borderRadius(60)
          .width(60)
          .height(60)
          .textAlign(TextAlign.Center)
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.White)
          .backgroundColor(Color.Black)
          .position({x:'80%',y:'90%'})
          .onClick(()=>{
            router.pushUrl({
              url:'pages/moneyComputerPage'
            })
          })
      }.height('100%')
      .width('100%')
      .justifyContent(FlexAlign.Start)


    }.height('100%')
    .width('100%')
    .backgroundColor('rgba(0,0,0,0.1)')


  }

  @Builder
  moneyItem(name:string,num:number) {
    Row() {
      Text(name).fontColor(Color.White)
      Text(num.toString()).fontColor(Color.White)
    }.justifyContent(FlexAlign.SpaceBetween).width('90%')
    .backgroundColor(getRGB())
    .padding(10)
    .onAppear(()=>{
      console.log(`name:${name}`)
    })

  }
}