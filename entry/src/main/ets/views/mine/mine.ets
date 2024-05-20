import { promptAction, router } from '@kit.ArkUI'
import { userStoreWithToken } from '../../common/store'

@Component
export default struct mine{
  @State avatar:string='app.media.startIcon'
  @StorageLink("isLogin") login:boolean=false
  @StorageLink("user") user:userStoreWithToken={} as userStoreWithToken
  aboutToAppear(): void {

  }
  aboutToDisappear(): void {
  }
  build() {
    Column({space:20}){

      Row({space:20}){

        Image($r(this.avatar))
          .width(60)
          .borderRadius(30)
        if(this.user.name===undefined)
        Text('登录/注册')
          .fontColor(Color.Black)
          .onClick(()=>{
            router.pushUrl({
              url:'pages/register'
            })
          })
        else{
          Text(`${this.user.name}`)
        }
      }.width('100%')
      .justifyContent(FlexAlign.Start)

      Button('退出登录').width('90%').backgroundColor(Color.Gray).fontColor(Color.White)
        .onClick(()=>{
          this.user={} as userStoreWithToken
        })
    }.height('100%')
    .justifyContent(FlexAlign.Start)
    .padding(20)
  }
}