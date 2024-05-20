import { getRGB } from '../util'

@Component
export default struct navHeader{
  @Link isShow:boolean
  @Prop title:string
  build() {
    Row(){

      Text(this.title).fontColor(Color.White)

      Image(!this.isShow?$r('app.media.right'):$r('app.media.down3')).width(20).fillColor(Color.White)


    }
    .backgroundColor(getRGB())
    .width('100%')
    .justifyContent(FlexAlign.SpaceBetween)
    .padding(10)
    .onClick(()=>{
      this.isShow=!this.isShow
    })
  }
}