import { register } from '../common/http/login'
import { router } from '@kit.ArkUI'

export  interface registerReq{
  name:string
  password:string
}

@Entry
@Component
struct Register {

  @State name:string='tom'

  @State pass:string='123456'

  async onPageShow(): Promise<void> {

  }

  build() {
    Navigation(){

      Column({space:20}){

        TextInput({placeholder:'手机号码/邮箱',text:$$this.name})

        TextInput({placeholder:'密码',text:$$this.pass})

        Button('注册')
          .backgroundColor(Color.Black)
          .fontColor(Color.White)
          .borderRadius(20).width('100%')
          .onClick(async ()=>{
            const res=await register(this.name,this.pass)
            if(res) {
              console.log('register ok')
              router.pushUrl({
                url:'pages/Login'
              })
            }

          })

        Row(){

          Text('忘记密码')
            .fontColor(Color.Gray)

          Text('账号登录')
            .fontColor(Color.Gray)

        }.width('100%')
        .justifyContent(FlexAlign.SpaceBetween)

      }.height('100%')
      .justifyContent(FlexAlign.Start)
      .width('90%')

    }.title("登录")
    .titleMode(NavigationTitleMode.Mini)

  }
}