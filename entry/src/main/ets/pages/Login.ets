import { login, register } from '../common/http/login'
import { router } from '@kit.ArkUI'

export  interface registerReq{
  name:string
  password:string
}

@Entry
@Component
struct Register {

  @State name:string='Tom'

  @State pass:string='123456'

  build() {
    Navigation(){

      Column({space:20}){

        TextInput({placeholder:'手机号码/邮箱',text:$$this.name})

        TextInput({placeholder:'密码',text:$$this.pass})

        Button('登录')
          .backgroundColor(Color.Black)
          .fontColor(Color.White)
          .borderRadius(20).width('100%')
          .onClick(async ()=>{

            const res=await login(this.name,this.pass)

            if(res){
              router.pushUrl({
                url:'pages/Index'
              })
            }

          })

        Row(){

          Text('忘记密码')
            .fontColor(Color.Gray)

          Text('注册')
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